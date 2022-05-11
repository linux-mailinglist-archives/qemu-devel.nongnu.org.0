Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC40522F3A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 11:20:37 +0200 (CEST)
Received: from localhost ([::1]:37060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noiWJ-0000sK-R5
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 05:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1noi7v-0002wu-0a
 for qemu-devel@nongnu.org; Wed, 11 May 2022 04:55:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1noi7t-0003qy-6x
 for qemu-devel@nongnu.org; Wed, 11 May 2022 04:55:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652259320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RpK7zjP+SLRqZaehWc1W+UANgu9uL/NiM4j09Jm1fX0=;
 b=HGHs4gaHyH4zXs7MRyXX7EwUwjw4CBWM8TGx9z5Eb0tIOZgtiaRsoxwvF0Q44E925f8Gm+
 zJEjNt7KH2i0GahWiyBKkPpkuXhkSVJRZe7iKBm+XeDpBkUlUeRCfCydRRJZW5c5vE+A2/
 M8qMwz/AB8XUsEOldlkK4A3Gaky3DxI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-00wfOyGtPf6UpD9WB0Y3pg-1; Wed, 11 May 2022 04:55:19 -0400
X-MC-Unique: 00wfOyGtPf6UpD9WB0Y3pg-1
Received: by mail-wm1-f71.google.com with SMTP id
 h6-20020a7bc926000000b0039470bcb9easo504470wml.1
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 01:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=RpK7zjP+SLRqZaehWc1W+UANgu9uL/NiM4j09Jm1fX0=;
 b=Bzu9mC0iccvzNxZjOpxpry+GT16hFzwrd0YF7fnAypIU1hwrYy9ErS7pRTyI87jI3x
 gylVYRH++5cvx9SspTVlC/J42U8SdrIR+o3P+ApjtUIYdHgnh/TNzVcL3x76HC6mlAJe
 i+vpEAg23+Dy1bzzU9fJL+vr0xgs2mXpd7v+AUJdSYafzwGTlZ/kwlMGACnRjrgKxual
 +mhOHfMl2NuTyTAUw4K60BgfPzrMaZrZZld5eoBvmYEnHpn/Aa3+WZnn4Web79Ku3+lW
 Qh0UAvAdkTc8wZx8Z8teSb2Blcbi2GYKC1RjtaSACA++1CxUFFKWuky1qmN5vZfq78jj
 x17w==
X-Gm-Message-State: AOAM530mpXcPcE5bEm9AWWBE5uCoB/X3A0cgmv6+CWLep8XoVTiDkfkB
 gRVoepb/lvkO+8F+P7tDIiiTyzfZFZ84Ky2RkV1FiVsjAfl4Ygme2IZbBNHoTZrR/MKWh9ssUp5
 kPWidSOD+N0ilctw=
X-Received: by 2002:adf:fe47:0:b0:20a:c899:829f with SMTP id
 m7-20020adffe47000000b0020ac899829fmr22028916wrs.165.1652259318073; 
 Wed, 11 May 2022 01:55:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyffqt6iUHV2Kt+jcy5CF4rFLSK7pRFW8R8OgvcF2CzkJ2d4s6UTaz/tDe3v2JJNv7HCJNP6g==
X-Received: by 2002:adf:fe47:0:b0:20a:c899:829f with SMTP id
 m7-20020adffe47000000b0020ac899829fmr22028898wrs.165.1652259317806; 
 Wed, 11 May 2022 01:55:17 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 u10-20020a5d6aca000000b0020c5253d925sm1064664wrw.113.2022.05.11.01.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 01:55:16 -0700 (PDT)
Date: Wed, 11 May 2022 09:55:14 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PULL 00/16] migration queue
Message-ID: <Ynt58gRnsNJBXzfg@work-vm>
References: <20220510083355.92738-1-dgilbert@redhat.com>
 <Yno3RvWhwSDZjI7o@work-vm> <Yno8NV5bQPUlqvcx@redhat.com>
 <YnpB4vg2ozbBzUCg@work-vm>
 <CAJ6HWG5Mgaqt9dOVH-0-Y78x96HO5c-TevYeuN5xMvSQqj7W8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ6HWG5Mgaqt9dOVH-0-Y78x96HO5c-TevYeuN5xMvSQqj7W8Q@mail.gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Leonardo Bras Soares Passos (leobras@redhat.com) wrote:
> From a previous thread:
> 
> On Thu, Apr 28, 2022 at 1:20 PM Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > Leo:
> >   Unfortunately this is failing a couple of CI tests; the MSG_ZEROCOPY
> > one I guess is the simpler one; I think Stefanha managed to find the
> > liburing fix for the __kernel_timespec case, but that looks like a bit
> > more fun!
> >
> > Dave
> 
> I thought Stefanha had fixed this bug, and we were just waiting for a
> new alpine rootfs/image with that fixed.
> Is that correct?
> 
> On Tue, May 10, 2022 at 7:43 AM Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > On Tue, May 10, 2022 at 10:58:30AM +0100, Dr. David Alan Gilbert wrote:
> [...]
> > >
> > > Yuk. That very much looks like a bug in liburing itself to me.
> > >
> > >
> > > We've exposed the latent bug by including linux/errqueue.h
> >
> > Yes, I think there was a thread after the 1st pull where Leo identified
> > the patch that fixed it; but it's not in that image.
> 
> I only fixed the MSG_ZEROCOPY missing define bug, as I got that
> Stefanha had already fixed the issue in liburing/alpine.
> 
> questions:
> - Has Stefanha really fixed that, and we are just waiting for a new
> image, or have I got that wrong?
> - How should I proceed with that?
>
> - If we proceed with fixing this up in alpine, will that require this
> patchset to be on pause until it's fixed there?

It needs to pass in CI; so yes.

> - If so, is there any suggestion on how to fix that in qemu code?
> (this header is needed because of SO_EE_* defines)

I've not actually looked at the detail of the failure; but yes I think
we need a qemu workaround here.

If there's no simple fix, then adding a test to meson.build to
conditionally disable liburing might be best; like the test code for
libcap_ng I guess (search in meson.build for libcap_ng.found  at around
line 540.

Dave

> Thank you all!
> 
> Best regards,
> Leo
> 
> >
> > Dave
> >
> > > With regards,
> > > Daniel
> > > --
> > > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> > > |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> > > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> > >
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> >
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


