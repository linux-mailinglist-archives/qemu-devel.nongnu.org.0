Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E76A42A499
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 14:36:57 +0200 (CEST)
Received: from localhost ([::1]:44892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maH1b-000592-1O
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 08:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1maGzQ-0003NJ-JU
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 08:34:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1maGzN-0004KQ-LV
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 08:34:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634042074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0x9F7z2v8KlDtG45Ku4R7jRSP+UEmcdB8OAS2vNWiMg=;
 b=I5W92ExCyN/A5H/6cwxS41FBlTcblYGT72eTmeX+7C3Z6pjpGCbQGfyRCq5ZG6abtU/p94
 AhUje9zQgSU1JSXLw8DM5Hy2eQ2HNfqwQ33Ado9aOLPFNwYZxbn283BU5A2IJzhV4pKoxy
 xU1KNIIFD6peidJ35HZwIsnRaD0597M=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-raa3gc3qPq6rgxmgHeiT4w-1; Tue, 12 Oct 2021 08:34:33 -0400
X-MC-Unique: raa3gc3qPq6rgxmgHeiT4w-1
Received: by mail-ed1-f71.google.com with SMTP id
 v2-20020a50f082000000b003db24e28d59so18768239edl.5
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 05:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0x9F7z2v8KlDtG45Ku4R7jRSP+UEmcdB8OAS2vNWiMg=;
 b=h7pVSSSsDCvd0jr4P3TFaZz1u0zvGmH/E8KhTIRWevaffU5sBDYP8zYTHmvknmyn2D
 Ytxh/ZsGChzNN4UWGviCIwVXxvLsGiojbICzOahDBTLX6aa7pmPyK3eCDO4/CN3jdr2N
 FJ3wfkP4aIhxNKGQY//ImD/MmNfei6+JAPKt4ICKJvbYpWVMXJQRTHNqBR3o0Vz9AK59
 cJx4SU07AlpA1pcnfEpWuhsMydd3BnTYUAfS6xQkBDAE6ehmXKgWTp0d5wChthDoPOsi
 PopYPhY+l0534eXjNB79PP0S+kS8hFTYE6X+HRQgljTGUR2N5rmt6OjjSzBNWshQaGHT
 GHEA==
X-Gm-Message-State: AOAM531RI4sF/BF/tSKLywwbdi5t43qe9hZ9FZTAgCXE8uVI8mj2SRet
 vurSOYH4pZ8dolHGDsz26zGUxGHrlimWu129T/gUh4dLvtOVSi2bQnZ9v8v3SgUhN6JXGbplS8e
 Grlbo36W/0kAuF44=
X-Received: by 2002:a05:6402:1914:: with SMTP id
 e20mr50615492edz.304.1634042071784; 
 Tue, 12 Oct 2021 05:34:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlVhs8p2W4UBzCkNM00bhhHpjf3k1T2N2pDP+04jxqbR3xBBPs8CaiYJ9GcVaRzg6YtOgLJQ==
X-Received: by 2002:a05:6402:1914:: with SMTP id
 e20mr50615461edz.304.1634042071530; 
 Tue, 12 Oct 2021 05:34:31 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id eg42sm5729127edb.61.2021.10.12.05.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 05:34:31 -0700 (PDT)
Date: Tue, 12 Oct 2021 14:34:30 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH 1/2] numa: Set default distance map if needed
Message-ID: <20211012143430.17b7ca99@redhat.com>
In-Reply-To: <20211012114802.u3og3lmei35qacpx@gator>
References: <20211006102209.6989-1-gshan@redhat.com>
 <20211006102209.6989-2-gshan@redhat.com>
 <20211012114016.6f4a0c10@redhat.com>
 <669adddb-5603-ed67-bc75-21bf4f68f186@redhat.com>
 <20211012114802.u3og3lmei35qacpx@gator>
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
Cc: peter.maydell@linaro.org, Gavin Shan <gshan@redhat.com>,
 ehabkost@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Oct 2021 13:48:02 +0200
Andrew Jones <drjones@redhat.com> wrote:

> On Tue, Oct 12, 2021 at 09:31:55PM +1100, Gavin Shan wrote:
> > Hi Igor,
> > 
> > On 10/12/21 8:40 PM, Igor Mammedov wrote:  
> > > On Wed,  6 Oct 2021 18:22:08 +0800
> > > Gavin Shan <gshan@redhat.com> wrote:
> > >   
> > > > The following option is used to specify the distance map. It's
> > > > possible the option isn't provided by user. In this case, the
> > > > distance map isn't populated and exposed to platform. On the
> > > > other hand, the empty NUMA node, where no memory resides, is
> > > > allowed on ARM64 virt platform. For these empty NUMA nodes,
> > > > their corresponding device-tree nodes aren't populated, but
> > > > their NUMA IDs should be included in the "/distance-map"
> > > > device-tree node, so that kernel can probe them properly if
> > > > device-tree is used.
> > > > 
> > > >    -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> > > > 
> > > > So when user doesn't specify distance map, we need to generate
> > > > the default distance map, where the local and remote distances
> > > > are 10 and 20 separately. This adds an extra parameter to the
> > > > exiting complete_init_numa_distance() to generate the default
> > > > distance map for this case.
> > > > 
> > > > Signed-off-by: Gavin Shan <gshan@redhat.com>  
> > > 
> > > 
> > > how about error-ing out if distance map is required but
> > > not provided by user explicitly and asking user to fix
> > > command line?
> > > 
> > > Reasoning behind this that defaults are hard to maintain
> > > and will require compat hacks and being raod blocks down
> > > the road.
> > > Approach I was taking with generic NUMA code, is deprecating
> > > defaults and replacing them with sanity checks, which bail
> > > out on incorrect configuration and ask user to correct command line.
> > > Hence I dislike approach taken in this patch.
> > > 
> > > If you really wish to provide default, push it out of
> > > generic code into ARM specific one
> > > (then I won't oppose it that much (I think PPC does
> > > some magic like this))
> > > Also behavior seems to be ARM specific so generic
> > > NUMA code isn't a place for it anyways
> > >   
> > 
> > Thanks for your comments.
> > 
> > Yep, Lets move the logic into hw/arm/virt in v3 because I think simply
> > error-ing out will block the existing configuration where the distance
> > map isn't provided by user. After moving the logic to hw/arm/virt,
> > this patch is consistent with PATCH[02/02] and the specific platform
> > is affected only.  
> 
> Please don't move anything NUMA DT generic to hw/arm/virt. If the spec
> isn't arch-specific, then the modeling shouldn't be either.


> If you want to error-out for all configs missing the distance map, then
> you'll need compat code.

> If you only want to error-out for configs that
> have empty NUMA nodes and are missing a distance map, then you don't
> need compat code, because those configs never worked before anyway.

I think memory-less configs without distance map worked for x86 just fine.

After looking at this thread all over again it seems to me that using
distance map as a source of numa ids is a mistake.


> 
> Thanks,
> drew
> 
> > 
> >   
> > > > ---
> > > >   hw/core/numa.c | 13 +++++++++++--
> > > >   1 file changed, 11 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/hw/core/numa.c b/hw/core/numa.c
> > > > index 510d096a88..fdb3a4aeca 100644
> > > > --- a/hw/core/numa.c
> > > > +++ b/hw/core/numa.c
> > > > @@ -594,7 +594,7 @@ static void validate_numa_distance(MachineState *ms)
> > > >       }
> > > >   }
> > > > -static void complete_init_numa_distance(MachineState *ms)
> > > > +static void complete_init_numa_distance(MachineState *ms, bool is_default)
> > > >   {
> > > >       int src, dst;
> > > >       NodeInfo *numa_info = ms->numa_state->nodes;
> > > > @@ -609,6 +609,8 @@ static void complete_init_numa_distance(MachineState *ms)
> > > >               if (numa_info[src].distance[dst] == 0) {
> > > >                   if (src == dst) {
> > > >                       numa_info[src].distance[dst] = NUMA_DISTANCE_MIN;
> > > > +                } else if (is_default) {
> > > > +                    numa_info[src].distance[dst] = NUMA_DISTANCE_DEFAULT;
> > > >                   } else {
> > > >                       numa_info[src].distance[dst] = numa_info[dst].distance[src];
> > > >                   }
> > > > @@ -716,13 +718,20 @@ void numa_complete_configuration(MachineState *ms)
> > > >            * A->B != distance B->A, then that means the distance table is
> > > >            * asymmetric. In this case, the distances for both directions
> > > >            * of all node pairs are required.
> > > > +         *
> > > > +         * The default node pair distances, which are 10 and 20 for the
> > > > +         * local and remote nodes separatly, are provided if user doesn't
> > > > +         * specify any node pair distances.
> > > >            */
> > > >           if (ms->numa_state->have_numa_distance) {
> > > >               /* Validate enough NUMA distance information was provided. */
> > > >               validate_numa_distance(ms);
> > > >               /* Validation succeeded, now fill in any missing distances. */
> > > > -            complete_init_numa_distance(ms);
> > > > +            complete_init_numa_distance(ms, false);
> > > > +        } else {
> > > > +            complete_init_numa_distance(ms, true);
> > > > +            ms->numa_state->have_numa_distance = true;
> > > >           }
> > > >       }
> > > >   }  
> > >   
> > 
> > Thanks,
> > Gavin
> >   
> 


