Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA87379D2A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 04:52:03 +0200 (CEST)
Received: from localhost ([::1]:58202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgIV7-0000OZ-VZ
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 22:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1lgITc-00089g-Cb
 for qemu-devel@nongnu.org; Mon, 10 May 2021 22:50:28 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:38417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1lgITa-0007h2-OC
 for qemu-devel@nongnu.org; Mon, 10 May 2021 22:50:28 -0400
Received: by mail-qt1-x836.google.com with SMTP id h21so9861092qtu.5
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 19:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eM8UqhK1b+Jr3mM+8g5e/qpOH8suvWtE2+2dlMuS/RM=;
 b=EzFzwvKmDCaVW+pW54hQ7WtSlwkk84DRItzIT6r5KCbBHFwBs6CPJaD+VFo/x6lZL7
 S1aOtmgLAo42QVboycyAt0dII7MTAo2j5CsqwsQcalkihBAliPOIyphJeUUDVTkF4C1+
 ZCH+HF4upXV2hGvbxu/14jcqLP2j/Od1rV1Qxg4RzLVkEyeiVANt7nsF/uxq2DKTqCct
 VdKTsTayWRDb4ErONTJphQV0Yl/wT9JRy0aTkXAA4LExHy/lK9BKeFjZ2cv92bfCDH2g
 aprbxrSR89Lb0p0MwXMV8NpLh4zUShlGjmEG5WIUnFrv79auzTae8sY3o7GHy2LW22+B
 IiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eM8UqhK1b+Jr3mM+8g5e/qpOH8suvWtE2+2dlMuS/RM=;
 b=uMLWg8DIZtg/tTfxTQXBg9tsKI3GxGhrBHBfpqRDvJHorfd2vu2WSZFLCJHoVlSRjF
 dJ8Cvj8Bp3aEKGscoxRKT5uYzNFSLv4sX6ABD+haDyle2XW7u8i9gseBaiRNiQQIvPfX
 Apn6Y3FkJpuGQ4daET0APkbGQGrsXAs6zmV76pc1/m5F0q21plg7m/rESIhO5sLkkKjJ
 PhXVhrx3vbnqxjtBqBwRgFmsZ47BWzOZd8Tmnyb22Oph34A/KGfZwNleXTZaLoQWhP4w
 uC3tOrDn495qp/e7qbACPRWyNdi6abtaC8ntYyEJII9CQOAUAkB86uzpl9/zOZt1tslw
 9oFw==
X-Gm-Message-State: AOAM532PpQaZtM0T477OVz0Pizn5Cca1uBKg9hKVTyIpU7bRPZtB0mo+
 qX92GdKUZRb3sk9Mz281aejLS1fZ9ViCk7citTs=
X-Google-Smtp-Source: ABdhPJxyhcyNli5e1rJfrnNdXzmhVhocFLWRfKWTIJISceVXFaL4vAbNHut9+60FQBKGtyhWCNeJCf69R+5Zj+JfyPg=
X-Received: by 2002:ac8:543:: with SMTP id c3mr25306833qth.241.1620701425419; 
 Mon, 10 May 2021 19:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210505045824.33880-1-liq3ea@163.com>
 <CAJ+F1CLym=c1hBXeC9-_bVR5RBKhS8fVwbianjnJAUBVz+_foQ@mail.gmail.com>
 <CAKXe6SLyzGUDG6Tex2QnCMk4CWbEWVZd66Q_=iBwDoqf5=R-Jw@mail.gmail.com>
 <CAJ+F1CKgZzKzCurGSyQ7s2ZOADgX7BbWgvDVV=ejgthdA3K+pQ@mail.gmail.com>
 <fc38a372-57ad-6c22-c4e8-cfe56ad35d05@redhat.com>
In-Reply-To: <fc38a372-57ad-6c22-c4e8-cfe56ad35d05@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Tue, 11 May 2021 10:49:49 +0800
Message-ID: <CAKXe6SJYi5PKHSJU7U6h08ihZsmSGY7-j2rQhVtsryD8ioxhyA@mail.gmail.com>
Subject: Re: [PATCH 0/7] vhost-user-gpu: fix several security issues
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Prasad J Pandit <pjp@fedoraproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=liq3ea@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Li Qiang <liq3ea@163.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2021=E5=B9=B45=E6=
=9C=8811=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=883:25=E5=86=99=E9=81=
=93=EF=BC=9A
>
> On 5/5/21 11:35 AM, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, May 5, 2021 at 1:28 PM Li Qiang <liq3ea@gmail.com
> > <mailto:liq3ea@gmail.com>> wrote:
> >
> >     Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com
> >     <mailto:marcandre.lureau@gmail.com>> =E4=BA=8E2021=E5=B9=B45=E6=9C=
=885=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=885:10=E5=86=99=E9=81=93=EF=
=BC=9A
> >     >
> >     > Hi
> >     >
> >     > On Wed, May 5, 2021 at 9:21 AM Li Qiang <liq3ea@163.com
> >     <mailto:liq3ea@163.com>> wrote:
> >     >>
> >     >> These security issue is low severity and is similar with the
> >     >> virtio-vga/virtio-gpu device. All of them can be triggered by
> >     >> the guest user.
> >     >>
> >     >> Li Qiang (7):
> >     >>   vhost-user-gpu: fix memory disclosure in virgl_cmd_get_capset_=
info
> >     >>   vhost-user-gpu: fix resource leak in 'vg_resource_create_2d'
> >     >>   vhost-user-gpu: fix memory leak in vg_resource_attach_backing
> >     >>   vhost-user-gpu: fix memory link while calling 'vg_resource_unr=
ef'
> >     >>   vhost-user-gpu: fix memory leak in 'virgl_cmd_resource_unref'
> >     >>   vhost-user-gpu: fix memory leak in 'virgl_resource_attach_back=
ing'
> >     >>   vhost-user-gpu: fix OOB write in 'virgl_cmd_get_capset'
> >     >>
> >     >>  contrib/vhost-user-gpu/vhost-user-gpu.c |  7 +++++++
> >     >>  contrib/vhost-user-gpu/virgl.c          | 17 ++++++++++++++++-
> >     >>  2 files changed, 23 insertions(+), 1 deletion(-)
> >     >>
> >     >> --
> >     >
> >     >
> >     > The whole series looks good to me, and applies fixes that were
> >     done earlier in virtio-gpu.
> >
> >     Do you mean you have merged this series?
> >     Should I tweak something such as "adding the original fix in
> >     virtio-gpu"/"better mapping iov cleanup"?
>
> Yes, and please also mention the corresponding CVE (CVE-2021-3544,
> CVE-2021-3545, CVE-2021-3546).
>

OK, I'm still waiting for the some of the patch's response from
Prasad. Kindly ping @Prasad


Thanks,
Li Qiang

> >
> >
> > No I didn't. I was waiting for the answers to Prasad questions, and
> > eventually v2.
> >
> > Then either Gerd or me can queue this imho.
> >
> > --
> > Marc-Andr=C3=A9 Lureau
>

