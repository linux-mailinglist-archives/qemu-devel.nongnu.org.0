Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F3C519947
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 10:08:26 +0200 (CEST)
Received: from localhost ([::1]:54340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmA3d-0005nK-2h
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 04:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nm9wc-00041Z-4P
 for qemu-devel@nongnu.org; Wed, 04 May 2022 04:01:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nm9wZ-0004xf-1y
 for qemu-devel@nongnu.org; Wed, 04 May 2022 04:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651651266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4eieaiRsewQ/0DPa23nlLg6GWFjl0IclDG3xlFVhwI4=;
 b=gxtXAssY6qB3Sc4l6KUN3U8uueAaSSYK4zQ5rRcqs1DEGIvAgdqQsVqSYOwka/8R7+o65F
 bU+RkjetdzcVyaIQNGglSYl6I3zLHAR5je/RfZJuon2/RTdnzlNDQPyp7lPWzytgyLaef8
 iWnyyTyT3b9s9vq2ydLXwR2PRq/QH6k=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-7j3PV26vMhyoFGTRxjK7kg-1; Wed, 04 May 2022 04:01:04 -0400
X-MC-Unique: 7j3PV26vMhyoFGTRxjK7kg-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-2f7dbceab08so6233047b3.10
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 01:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4eieaiRsewQ/0DPa23nlLg6GWFjl0IclDG3xlFVhwI4=;
 b=GlifaqlxrZv/tzXHy5ERSTPamUt9PGb/faf2x6EKuDAHqZ5IQOsjNzGJsYCwF1U7pR
 UBzpznl9E4yaXJQg5Jb7MNchHZiCTyzvRj+DZq7KfqvQQzA7hcXelhSWRCDxMpDdUBOx
 ULlosQAgcFmRPJjyuhBdVaEdN/9zn9/RNrcYjMOqSsfPNCiRUXLr6T/r4sMCCdF30soo
 6GwcXEQEiGDnm/kyuw4/8QwNEU7bZzYOTaRA3MBrnyMmP6H7uO5G1kTeYFgvHFZ7uwRz
 TRO6lBI6X9HV7BnXm2H5j4dVYOQPdRhuKp0Tunj0uQ6gdiBPskcQ39TPJXYT0rGWHkl/
 LY0A==
X-Gm-Message-State: AOAM533iTVZfRXI9zho0YbT2vG98bjGE3F+BUzPsDzy8RGai88yo+pCb
 I/OUX5s3B3d4Dls+ovx83vC7PsZECtULbazmZsoO/TWEK4PwoKqlLucBPFTM254IyhVdNMkOoeP
 J2L9vz8Ulm1+a5vsRVHEY6Pp9X7BtNRg=
X-Received: by 2002:a25:1307:0:b0:649:9048:a411 with SMTP id
 7-20020a251307000000b006499048a411mr9582941ybt.7.1651651264126; 
 Wed, 04 May 2022 01:01:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3bgp6kwAHAgv2KI/HNiY82xUQM8U1Ay0wGkPmz+dAI19qop/LT0ryuSQbpVdNBggNkb4NVdXXdUptCPgekAg=
X-Received: by 2002:a25:1307:0:b0:649:9048:a411 with SMTP id
 7-20020a251307000000b006499048a411mr9582924ybt.7.1651651263891; Wed, 04 May
 2022 01:01:03 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 May 2022 01:01:03 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20220420160311.248079-1-abologna@redhat.com>
 <20220420160311.248079-3-abologna@redhat.com>
 <YmAxjNgNWT2FNh8r@redhat.com>
 <CABJz62PnnGYV=6qiFYL2Y0+dg61P+nv0VvRUnP1cJkU6THcMEg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABJz62PnnGYV=6qiFYL2Y0+dg61P+nv0VvRUnP1cJkU6THcMEg@mail.gmail.com>
Date: Wed, 4 May 2022 01:01:03 -0700
Message-ID: <CABJz62NTwytWbStj172jOxe_1_f9=K4iv82Zh78twgQ5jNoAfw@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs: build-platforms: Clarify stance on minor
 releases and backports
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 09:18:47AM -0700, Andrea Bolognani wrote:
> On Wed, Apr 20, 2022 at 05:15:08PM +0100, Daniel P. Berrang=C3=A9 wrote:
> > On Wed, Apr 20, 2022 at 06:03:11PM +0200, Andrea Bolognani wrote:
> > > These changes match those made in the following libvirt commits:
> > >
> > >   2ac78307af docs: Clarify our stance on backported packages
> > >   78cffd450a docs: Spell out our policy concerning minor releases
> > >
> > > Since QEMU's platform support policy is based on libvirt's, it
> > > makes sense to mirror these recent changes made to the latter.
> > >
> > > The policy is not altered significantly - we're simply spelling
> > > out some rules that were likely already being implicitly
> > > enforced.
> >
> > Indeed, I think that's basically defacto the case already.
> >
> > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
> Thanks! Are you going to bring these in through one of your trees, or
> do I need to bug someone else so that they will pick them up? :)

I see these haven't gone in yet. Anything I can/should do to make
that happen?

Note that 1/2 is no longer applicable, since 4a89bf188a31 has already
fixed the issue in the meantime.

--=20
Andrea Bolognani / Red Hat / Virtualization


