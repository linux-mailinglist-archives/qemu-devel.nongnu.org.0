Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3111630DB55
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 14:35:03 +0100 (CET)
Received: from localhost ([::1]:35276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7IJC-0007Ef-4G
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 08:35:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l7IHY-0006CR-01
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:33:20 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:43600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l7IHV-0002KU-O5
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:33:19 -0500
Received: by mail-ed1-x52b.google.com with SMTP id i5so4661329edu.10
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 05:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qeSZ3eLv19mPOyVPfqSY18KtfpddDU7JSpQKb4QSPxI=;
 b=rIXg/xs+bCEpBwFWF/DIgZE3qpkmrJLbLN2o27ceGqe2zEMjAIvgcSLZB8P9qp7j+Z
 3RvUqxdH1sIB4JGsiKLqeDuO7ehBCUtyh0QJMXI/qno+0L+zxSWO4b3Q4EXDhOjhLjRL
 7pZ15KMJdhyh8rxpfbjMNnQUPskMDi6Eoqpa+7i2EWrZyuBJdigiY/I3q2pzw8SnMXTY
 W0/UiJNoTOtNtTLaEFTGy1ht9HzO7Er6GyxqOLQRzbn5FqwLukLM/KOenjb+fcyqN/uA
 ERVBRhLNIh2tYUfzdAficEKmEOclLAY5wXJ9wXvWQ/BPeZ0g78JPdTWYuakelutX78gs
 3SsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qeSZ3eLv19mPOyVPfqSY18KtfpddDU7JSpQKb4QSPxI=;
 b=icyfNouoS5UC6ZoAk1MHugdkPp/kWYCUWbduAT96yieRibl43MYWFvsuqGc60eDvOo
 0zq/oi5NvODnOflie1IYcuT5O7i1wLol+3IhZqMURrIaThPz9EtpHANaV+Zo5thpu1Bl
 rFIK6U/KiigNkzty6DNxVKMqwlIgOpFtU5g3V3+xIt6dBOAUgZjmxKNRy9zLodry/AU2
 VxR08yb5uv9fLnbV3rEjVYTa1CocJDOL6ZceGiH+9JIfbLShU+WXtYsokLdQvfXW/9+e
 Wcb25yMPhIZTXRkdUWb36C0d8zfH4zNKnNLwEJOAW6/svdFPFVmf/kspN7o+lycszeQu
 cssQ==
X-Gm-Message-State: AOAM533HXdl26RlER7DkytD7LFuHZYYR3xRavQ29opMaCmxI4a25d2dn
 e2uObAl1KHxzESCs2H18lTHh69ViINv30Tyus8I=
X-Google-Smtp-Source: ABdhPJzUFErFiCrO/tih+uxMST3DOf9HuxcPv0G8dPxr5od5llumXZqldyugmm2jTGrzK98/+DOSOcuL6nEbgukfvWI=
X-Received: by 2002:aa7:d399:: with SMTP id x25mr2922591edq.237.1612359195886; 
 Wed, 03 Feb 2021 05:33:15 -0800 (PST)
MIME-Version: 1.0
References: <20210202142625.609070-1-marcandre.lureau@redhat.com>
 <20210202142625.609070-21-marcandre.lureau@redhat.com>
 <20210203113840.5d5hwphdyicomel2@sirius.home.kraxel.org>
In-Reply-To: <20210203113840.5d5hwphdyicomel2@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 3 Feb 2021 17:33:03 +0400
Message-ID: <CAJ+F1C+TJ1f4-=83s4tj0b6-D8y2s0ADry=10GuSj372eFfDXw@mail.gmail.com>
Subject: Re: [PATCH 20/20] RFC: tests: add some virtio-gpu & vhost-user-gpu
 acceptance test
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52b.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Feb 3, 2021 at 3:44 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Tue, Feb 02, 2021 at 06:26:25PM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > This will check virtio/vhost-user-vga & virgl are correctly initialized
> > by the Linux kernel on an egl-headless display.
> >
> > There are many other things that could be checked, but that's a start. =
I
> > also don't know yet how to nicely skip on incompatible host &
> > configurations.
>
> You can annotate tests like this:
>
>        @avocado.skipUnless(os.path.exists(pick_default_vug_bin()), "no vh=
ost-user-gpu")
> > +    def test_vhost_user_vga_virgl(self):

Ah interesting, thanks!

>
> [ queued whole series + some other pending ui/vga bits, kicked CI, lets
>   see how it is going.  I suspect I'll have to drop this patch though. ]
>

Yes, Cleber was going to take a look, and perhaps send another avocado
series I could take some inspiration from.

thanks!



--=20
Marc-Andr=C3=A9 Lureau

