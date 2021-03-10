Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410E3334335
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:39:09 +0100 (CET)
Received: from localhost ([::1]:49018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1rY-0007ME-Af
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:39:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lK1Ny-00031p-Jx
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:08:34 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:43613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lK1Nw-0006dP-Uv
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:08:34 -0500
Received: by mail-ed1-x52e.google.com with SMTP id bd6so28797623edb.10
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tQKjpBbeAGvVs6+wLD13+b80I0XRG1ErL3vCY11jAQ8=;
 b=fdE5vTpiprs9YgRwlunxA9uEI9O0zmGuFBxCn/Y9h/HRt6y0fhl74xYB2ZmtpNEHNT
 VxAsHzhVii1AMqO8frlqoZbLGCcaipV4uY9aEp7JqIlq26FHy3mUq4JH/gvGBd3q4Yr0
 +WTS9QP00tSkjkXPQcvXXC1gp712WR93L2inQ9WO4BguThQpbse6wjrzs8dZxEwYOmsE
 NOxUaufrJdib3LkMMUAbBIdDrw7FYZ32PakrNuuXa/e0k+zvpCQvxDX26kEkt5t9J+AT
 LwJ+lRYYx2V1UCGdP2umMrH3g8NbqHwO1EFKxcKTHjvdK+ai5oWKbi+A/e3/bGrd9drX
 Hiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tQKjpBbeAGvVs6+wLD13+b80I0XRG1ErL3vCY11jAQ8=;
 b=EEVIGaaiADRJT9jl11qkHw4tq/lPseubpjsa7DK/iZ+VOTl9zywb51nFEztRn5dJYC
 4J6RiyFdIh30PbxV+tvp9G9Q97FLwkneIqS9c2fvBdoq1XF+vP1SXMVUTuYVFjZdWlYd
 rozUalNDObCkw+455RlAS1MREQKJO4FD4DxnQOJcXrOcfmBGujfKIxqxk/NcuDBxdmbF
 OHH9j44JrK9OR3UlIqLeiIVAfNoHKannqpdma745sRb7ZP9BOdK6UyDPxv8TVb7BAZHr
 5Eac/ODj2zwTlOD932P/8ukttDY+Qd08hR9zsJ/Ij8OS+FK//sN8zZiZdptENZ4UNyxJ
 LpAA==
X-Gm-Message-State: AOAM532wdG+QD1a81K165tJKCBtE4JC0SqAe1ppVEfIxbyB/HjoJSYz6
 YY4lFga3kTTfql6kPiB2RBHdC7N8zBJOankJLKg=
X-Google-Smtp-Source: ABdhPJymb2jto6uErJnYtWurPU9cGbyu9Ua1yZmFZ3/d2gFzamREE3Ee/fVojMDSuRSGbqjKgURDFzCJyhkmYPEsreU=
X-Received: by 2002:a50:fa42:: with SMTP id c2mr4195637edq.159.1615392511620; 
 Wed, 10 Mar 2021 08:08:31 -0800 (PST)
MIME-Version: 1.0
References: <20210303152948.59943-1-akihiko.odaki@gmail.com>
 <20210303152948.59943-2-akihiko.odaki@gmail.com>
 <20210310132920.6rv5f62ineowzscq@sirius.home.kraxel.org>
In-Reply-To: <20210310132920.6rv5f62ineowzscq@sirius.home.kraxel.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Thu, 11 Mar 2021 01:08:20 +0900
Message-ID: <CAMVc7JUjkXRyfd0-ak6ovOzfitNE6Qke2x3twXiLXMR7b3whcw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] virtio-gpu: Respect UI refresh rate for EDID
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ed1-x52e.google.com
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 qemu Developers <qemu-devel@nongnu.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B43=E6=9C=8810=E6=97=A5(=E6=B0=B4) 22:29 Gerd Hoffmann <kraxel@r=
edhat.com>:
>
>   Hi,
>
> > -static void xenfb_update_interval(void *opaque, uint64_t interval)
> > +static void xenfb_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info=
)
>
> > -    .update_interval =3D xenfb_update_interval,
> > +    .ui_info     =3D xenfb_ui_info,
>
> Hmm, I suspect xenfb really wants the actual refresh rate, even in case
> vnc/sdl change it dynamically.  Anthony?  Stefano?
>
> I guess we should just leave the update_interval callback as-is, for
> those who want know, and use ui_info->refresh_rate for the virtual edid
> refresh rate (which may not match the actual update interval in case of
> dynamic changes).  Adding a comment explaining the difference to
> console.h is a good idea too.

sdl shortens update_interval to respond to user inputs, but it has
nothing to do with frame buffer. Using ui_info->refresh_rate will
eliminate worthless frame updates even for xenfb in such cases.

xenfb has a behavior similar to virtio-gpu. Instead of generating
interrupts, they just tell the refresh rate to the guest and expect
the guest to provide a frame buffer by itself. I think the dynamic
display mode change is also problematic for xenfb if the guest driver
uses the information (although the Linux driver does not use it at
least.) It is possible to have both of the refresh rate member in
QemuUIInfo and update_interval, but I don't see a difference
justifying that.

Anyway, I'd also like to hear opinions from Xen developers.

>
> Otherwise looks good to me overall.  Splitting the ui/gtk update to a
> separate patch is probably a good idea.
>

I'll do so when submitting the next version.

Regards,
Akihiko Odaki

