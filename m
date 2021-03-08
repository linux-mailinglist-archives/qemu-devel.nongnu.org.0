Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD86330FB6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:41:14 +0100 (CET)
Received: from localhost ([::1]:46808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJG8H-0006Hq-2m
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJG5E-0003Ns-LR
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:38:04 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:35957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJG5C-0003UD-Qk
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:38:04 -0500
Received: by mail-ed1-x52f.google.com with SMTP id l12so14819745edt.3
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YMbdkQRIwHSFMl1kranwxTxnOg5Pw2srl+G8nYZu/lM=;
 b=OHjztxS+my5CghkmDl6UdpZkJmSHW8ITBpQ4Uib+HZ6I6ZsV2rT/EiQ4fYC3Cilx3f
 s3UNMgqbVMWgp9DEQBumkM+spAQqaZ1OBObhKBLnTCj44U6Ja66nHrVeykNGpxEU5H1e
 ZyXUM1dWF5hTLNrwJefMBM6GSPQ+zzo0cCCTA7eUFHc55pC73iNdxhaLSlyEKkc9b9cv
 +EBFtRwLtOK2W/WOtrXBstykQYnkyetwFTxhlK9VNnrtVG9q/p6uAS76epi6Wcpwc2AP
 gPMMnWA7YslSbMVY4G8m+Qp79pal0lMHRDpYMeZnPcTDqyJvaCyyb563hJQ4BwHuykty
 qyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YMbdkQRIwHSFMl1kranwxTxnOg5Pw2srl+G8nYZu/lM=;
 b=W8ob7ez8RlC4kj+D8U9G35sdLhf8zQ8HCZkwxbFPbwstl0DbWcBWMeGhXRiPIP1S1B
 MNv0grltBm5SKOU8gIe1GnmAGecBcC3rXC+lTxlFBpAJv5rnB9DwUp76ojcT8j39bigv
 dza0OC3oHS7aftj0Zzk/r9z7hdtYAiamZPvve5Ss6B88VPZEnoSpTEhtafMASe01wtze
 ksf0pA5HhGjLQRnYQUoepgbRlaghZQUbx+W42OshHISxGejbR0hWl/RLv4v6lpG23H1j
 ufFgp7KKSZRuA534/4gRIbGmRUSTc60X6qndCN0BnnYY4CZkMXjCorFkg5KAGNP4TwX3
 jLIg==
X-Gm-Message-State: AOAM532vE16uXt/kGQjmXm6cGPzTfKPVcQ+gGNvVvQO48IRBYfuK+V1X
 PZqhDYD6BE7T3/nr3iV6e6p5U69MwZiOocK0XvJDjA==
X-Google-Smtp-Source: ABdhPJxT9P/QkjLxralU1b7SAWaGwm2VBzNQ5lYjoGFpbWp7BW7ZfLXiiEAa6cQO94/5XAt0pOIqbLDgryLpNB8H08o=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr21653050edu.100.1615210681371; 
 Mon, 08 Mar 2021 05:38:01 -0800 (PST)
MIME-Version: 1.0
References: <E1lIzWX-0003qN-Me@lizzy.crudebyte.com> <2891210.4AG6acVJ2Y@silver>
 <CAMVc7JXb=eK2FgEx0SV7N-DL65EaMPKHM9rZnHCfu5KTPin48g@mail.gmail.com>
 <134602378.QJW5UkElOJ@silver>
In-Reply-To: <134602378.QJW5UkElOJ@silver>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 13:37:44 +0000
Message-ID: <CAFEAcA-36A9RAB3eqi6-SHJSUxpzJsgVo75d3DZXcWhGYwLhrw@mail.gmail.com>
Subject: Re: [PATCH] ui/gtk: fix NULL pointer dereference
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Mar 2021 at 13:32, Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> On Montag, 8. M=C3=A4rz 2021 12:31:33 CET Akihiko Odaki wrote:
> > 2021=E5=B9=B43=E6=9C=888=E6=97=A5(=E6=9C=88) 19:39 Christian Schoenebec=
k <qemu_oss@crudebyte.com>:
> > > This was just about silencing the mentioned automated Coverity defect=
s
> > > report. If you have a better solution, then just ignore this patch.
> > >
> > > Best regards,
> > > Christian Schoenebeck
> >
> > I do not have an access to Coverity defects report. I'd appreciate the
> > details if you provide one. I suspect I made a mistake somewhere else
> > ui/gtk.c in c821a58ee7 ("ui/console: Pass placeholder surface to
> > display").
>
> Unfortunately Coverity's defects reports are not very verbose.

The online defect viewer is a bit better for showing why it thought
something was an issue. In this case we have at the top of the function:

    trace_gd_switch(vc->label,
                    surface ? surface_width(surface)  : 0,
                    surface ? surface_height(surface) : 0);

which tests whether surface is NULL, implying that sometimes it is.

Then later we have:
    if (vc->gfx.ds && surface &&

also checking surface for NULL-ness.

Finally we have:
    if (surface->format =3D=3D PIXMAN_x8r8g8b8) {

which dereferences surface without checking if it's NULL.

So there is definitely a bug here:
(1) either surface can never be NULL, and all the places where
the function is testing for NULL-ness are wrong and need to be removed
(2) or surface can be NULL, and we should check here too

Coverity can't tell us which of the two possibilities is right, of course.

thanks
-- PMM

