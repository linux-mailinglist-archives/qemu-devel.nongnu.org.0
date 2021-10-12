Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6C142A3D0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 14:06:09 +0200 (CEST)
Received: from localhost ([::1]:51674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGXo-0002Jr-7q
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 08:06:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1maFnf-0003Mq-6B
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:18:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1maFnc-0000kI-Dt
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:18:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634037502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OybF5uxbFaJnvO++rHHgW++MC56mSK4fOES4WfMg6j0=;
 b=YaMu2CzjMT6iMwYTmy1If72so5X/ndxa5WxIu0Ps7L5RkbG6yRs3ABo3BU03eofKZ8cifd
 lwRHmXoxf0GZjDFagWsXAuq6hmTu/R6BlaPiqJo1B8nkMV61SMXcI2IQx9tMSHKnIHFNop
 /oTAH1715dw71yQyByd5XICrgxDvEJk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-sM9e_kEtP1Oo9RTgxQZWxg-1; Tue, 12 Oct 2021 07:18:21 -0400
X-MC-Unique: sM9e_kEtP1Oo9RTgxQZWxg-1
Received: by mail-ed1-f70.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso18545211edj.20
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OybF5uxbFaJnvO++rHHgW++MC56mSK4fOES4WfMg6j0=;
 b=EW3XDAMXlILUdO7feWTIjF9K0jySe8Wf2w3TRSaQQbXhZjNNe9F+KsAV7l12HhIxp3
 s1lN1G63sHNhZJhJsXMbZorLJh6Y9covOL02BUokR2GkSMa7MVOfih/kT4v7IA9sgFgj
 nmgOdMdTtWq9SPnD6jWpdx1BoSq9Ntm+ngbx69Fvk1SurASkZHu3iUbSpyN6TvANFKyd
 S2Bee8/Vk8DKK11y1Pw9OEXj/J6itrASEFrXupSi129NMnwV0Jftq6AvtiPN4519cPyJ
 aXi1SDQdip894Ls710bliV0eX5k8Sdaxt51cpO3pMaxgxq0CkvBv+B2BxXzFL38zgm27
 dcKA==
X-Gm-Message-State: AOAM531bLbTmhhyzEpLRWOhSC+c+s+9eZm9R7Z9hR4eMoce+FSuYrz4K
 c3jqPBQIyjmq8+pAIRrhLVExvroVziKLdOZ92d/pF9IDOVaOWtKLu/AgUUYjMbdM1oFCNJdHoi/
 IWjje0lN/vGMh1mw=
X-Received: by 2002:a17:906:5051:: with SMTP id
 e17mr32491433ejk.481.1634037500355; 
 Tue, 12 Oct 2021 04:18:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsBVIudm2g4xFINv3ucT73QW4miAf4Hv5Drg+VqCbet8u2Tbevx1FwbTAjFCeC74uNiuYpWw==
X-Received: by 2002:a17:906:5051:: with SMTP id
 e17mr32491412ejk.481.1634037500158; 
 Tue, 12 Oct 2021 04:18:20 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id kw10sm4758338ejc.71.2021.10.12.04.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:18:19 -0700 (PDT)
Date: Tue, 12 Oct 2021 13:18:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH 1/2] numa: Set default distance map if needed
Message-ID: <20211012131818.4ac2cead@redhat.com>
In-Reply-To: <669adddb-5603-ed67-bc75-21bf4f68f186@redhat.com>
References: <20211006102209.6989-1-gshan@redhat.com>
 <20211006102209.6989-2-gshan@redhat.com>
 <20211012114016.6f4a0c10@redhat.com>
 <669adddb-5603-ed67-bc75-21bf4f68f186@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, ehabkost@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Oct 2021 21:31:55 +1100
Gavin Shan <gshan@redhat.com> wrote:

> Hi Igor,
> 
> On 10/12/21 8:40 PM, Igor Mammedov wrote:
> > On Wed,  6 Oct 2021 18:22:08 +0800
> > Gavin Shan <gshan@redhat.com> wrote:
> >   
> >> The following option is used to specify the distance map. It's
> >> possible the option isn't provided by user. In this case, the
> >> distance map isn't populated and exposed to platform. On the
> >> other hand, the empty NUMA node, where no memory resides, is
> >> allowed on ARM64 virt platform. For these empty NUMA nodes,
> >> their corresponding device-tree nodes aren't populated, but
> >> their NUMA IDs should be included in the "/distance-map"
> >> device-tree node, so that kernel can probe them properly if
> >> device-tree is used.
> >>
> >>    -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> >>
> >> So when user doesn't specify distance map, we need to generate
> >> the default distance map, where the local and remote distances
> >> are 10 and 20 separately. This adds an extra parameter to the
> >> exiting complete_init_numa_distance() to generate the default
> >> distance map for this case.
> >>
> >> Signed-off-by: Gavin Shan <gshan@redhat.com>  
> > 
> > 
> > how about error-ing out if distance map is required but
> > not provided by user explicitly and asking user to fix
> > command line?
> > 
> > Reasoning behind this that defaults are hard to maintain
> > and will require compat hacks and being raod blocks down
> > the road.
> > Approach I was taking with generic NUMA code, is deprecating
> > defaults and replacing them with sanity checks, which bail
> > out on incorrect configuration and ask user to correct command line.
> > Hence I dislike approach taken in this patch.
> > 
> > If you really wish to provide default, push it out of
> > generic code into ARM specific one
> > (then I won't oppose it that much (I think PPC does
> > some magic like this))
> > Also behavior seems to be ARM specific so generic
> > NUMA code isn't a place for it anyways
> >   
> 
> Thanks for your comments.
> 
> Yep, Lets move the logic into hw/arm/virt in v3 because I think simply
> error-ing out will block the existing configuration where the distance
> map isn't provided by user.

that can be solved by deprecating broken config (with temporary compat
code to keep the behavior for old machine types
and then all that be removed in 2 releases, leaving us with explicit
option only)

> After moving the logic to hw/arm/virt,
> this patch is consistent with PATCH[02/02] and the specific platform
> is affected only.
> 
> 
> >> ---
> >>   hw/core/numa.c | 13 +++++++++++--
> >>   1 file changed, 11 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/hw/core/numa.c b/hw/core/numa.c
> >> index 510d096a88..fdb3a4aeca 100644
> >> --- a/hw/core/numa.c
> >> +++ b/hw/core/numa.c
> >> @@ -594,7 +594,7 @@ static void validate_numa_distance(MachineState *ms)
> >>       }
> >>   }
> >>   
> >> -static void complete_init_numa_distance(MachineState *ms)
> >> +static void complete_init_numa_distance(MachineState *ms, bool is_default)
> >>   {
> >>       int src, dst;
> >>       NodeInfo *numa_info = ms->numa_state->nodes;
> >> @@ -609,6 +609,8 @@ static void complete_init_numa_distance(MachineState *ms)
> >>               if (numa_info[src].distance[dst] == 0) {
> >>                   if (src == dst) {
> >>                       numa_info[src].distance[dst] = NUMA_DISTANCE_MIN;
> >> +                } else if (is_default) {
> >> +                    numa_info[src].distance[dst] = NUMA_DISTANCE_DEFAULT;
> >>                   } else {
> >>                       numa_info[src].distance[dst] = numa_info[dst].distance[src];
> >>                   }
> >> @@ -716,13 +718,20 @@ void numa_complete_configuration(MachineState *ms)
> >>            * A->B != distance B->A, then that means the distance table is
> >>            * asymmetric. In this case, the distances for both directions
> >>            * of all node pairs are required.
> >> +         *
> >> +         * The default node pair distances, which are 10 and 20 for the
> >> +         * local and remote nodes separatly, are provided if user doesn't
> >> +         * specify any node pair distances.
> >>            */
> >>           if (ms->numa_state->have_numa_distance) {
> >>               /* Validate enough NUMA distance information was provided. */
> >>               validate_numa_distance(ms);
> >>   
> >>               /* Validation succeeded, now fill in any missing distances. */
> >> -            complete_init_numa_distance(ms);
> >> +            complete_init_numa_distance(ms, false);
> >> +        } else {
> >> +            complete_init_numa_distance(ms, true);
> >> +            ms->numa_state->have_numa_distance = true;
> >>           }
> >>       }
> >>   }  
> >   
> 
> Thanks,
> Gavin
> 


