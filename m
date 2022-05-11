Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA94C522A7F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 05:41:59 +0200 (CEST)
Received: from localhost ([::1]:46544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nodEc-0003GT-Cd
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 23:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nodD8-0002ZM-JH
 for qemu-devel@nongnu.org; Tue, 10 May 2022 23:40:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nodD5-0004XH-ME
 for qemu-devel@nongnu.org; Tue, 10 May 2022 23:40:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652240421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qNhQZjKv0pnq/tcRq9QHZwwTFlB8piETxdaA1eSBNrQ=;
 b=EYEGwW7PvOVKzO2F1AeZmar0UWR3pFHL2Oyl6OhE7Jsr8RCsOQvqcDNAZ4j9tfu9I1KYOR
 BWZmuTbTK/SuttxuCtyorAr5mYUKI0ExCe13TwD4Wz0A3hpn/lNC8st02SJTjzQQVKcZ8J
 bE6S+KzzGd0IgHMGZHEsS0vs/iEAfK4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-M4n0WV6yO4-uUgH6Bpkr3w-1; Tue, 10 May 2022 23:40:20 -0400
X-MC-Unique: M4n0WV6yO4-uUgH6Bpkr3w-1
Received: by mail-ed1-f72.google.com with SMTP id
 c23-20020a50d657000000b00425d5162a0dso508130edj.16
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 20:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qNhQZjKv0pnq/tcRq9QHZwwTFlB8piETxdaA1eSBNrQ=;
 b=BTzTMtTBWcBp9AS/fcOeTKArU/qUhEnlG8fQ+faN+cQgrzynYksJH/Id9Zutf0I5+b
 0JsqKrKYy5KOPweoINN29AYVdQyV5AWCMFVR6addy/S24IZTSZqOCRvMT/YTA5iFjDli
 KNRvMphSbq8syfpcVb2+x5LNZ3KjiTWloz0a0Y62FDlVuiYYV7g0jru0llkYJZdJFKpC
 HjM350uvBJt+SS6JKJDdlGqKXjJ7+7yZLswv/mLFd3C1nQWhv36otASpkWQxIe+ZtHo+
 UFKBpomEn3q7bNLonXBR/MXCGibKtmDdOjljPdfYNmErQlnf++6Whwz+DRtEdDduAiO4
 5TrQ==
X-Gm-Message-State: AOAM533m2g7IEdRIMee/IHeXQSE+rN+URpY4qjnhv/v0yXSQQuCZz4O1
 qoTRdpSCJYCjmoq6XXZcvn+HHaZly9aqs5BVeZjxz71253HoGzsxm+0YNgVrMSN0567XvY9dO82
 sUkdRP8SzRd/VCtj29mBLc+CrfDVam6o=
X-Received: by 2002:a05:6402:5255:b0:427:de81:6af with SMTP id
 t21-20020a056402525500b00427de8106afmr26846335edd.269.1652240419072; 
 Tue, 10 May 2022 20:40:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwhVI5e2mGvEwiqpGKever6H/O0HHKugGC+LoMLjYfd3ObPR/dOObD13HbSgghQafImKmHkNtQx8ocndgOvJY=
X-Received: by 2002:a05:6402:5255:b0:427:de81:6af with SMTP id
 t21-20020a056402525500b00427de8106afmr26846326edd.269.1652240418882; Tue, 10
 May 2022 20:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220510083355.92738-1-dgilbert@redhat.com>
 <Yno3RvWhwSDZjI7o@work-vm>
 <Yno8NV5bQPUlqvcx@redhat.com> <YnpB4vg2ozbBzUCg@work-vm>
In-Reply-To: <YnpB4vg2ozbBzUCg@work-vm>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 11 May 2022 00:40:07 -0300
Message-ID: <CAJ6HWG5Mgaqt9dOVH-0-Y78x96HO5c-TevYeuN5xMvSQqj7W8Q@mail.gmail.com>
Subject: Re: [PULL 00/16] migration queue
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>, 
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
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

From a previous thread:

On Thu, Apr 28, 2022 at 1:20 PM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> Leo:
>   Unfortunately this is failing a couple of CI tests; the MSG_ZEROCOPY
> one I guess is the simpler one; I think Stefanha managed to find the
> liburing fix for the __kernel_timespec case, but that looks like a bit
> more fun!
>
> Dave

I thought Stefanha had fixed this bug, and we were just waiting for a
new alpine rootfs/image with that fixed.
Is that correct?

On Tue, May 10, 2022 at 7:43 AM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Daniel P. Berrang=C3=A9 (berrange@redhat.com) wrote:
> > On Tue, May 10, 2022 at 10:58:30AM +0100, Dr. David Alan Gilbert wrote:
[...]
> >
> > Yuk. That very much looks like a bug in liburing itself to me.
> >
> >
> > We've exposed the latent bug by including linux/errqueue.h
>
> Yes, I think there was a thread after the 1st pull where Leo identified
> the patch that fixed it; but it's not in that image.

I only fixed the MSG_ZEROCOPY missing define bug, as I got that
Stefanha had already fixed the issue in liburing/alpine.

questions:
- Has Stefanha really fixed that, and we are just waiting for a new
image, or have I got that wrong?
- How should I proceed with that?
- If we proceed with fixing this up in alpine, will that require this
patchset to be on pause until it's fixed there?
- If so, is there any suggestion on how to fix that in qemu code?
(this header is needed because of SO_EE_* defines)

Thank you all!

Best regards,
Leo

>
> Dave
>
> > With regards,
> > Daniel
> > --
> > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberr=
ange :|
> > |: https://libvirt.org         -o-            https://fstop138.berrange=
.com :|
> > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberr=
ange :|
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>


