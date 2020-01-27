Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3326C14A5D2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 15:14:58 +0100 (CET)
Received: from localhost ([::1]:45966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iw5AH-0001cZ-8N
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 09:14:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60164)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1iw59Q-00016k-IJ
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 09:14:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1iw59P-0002ST-HG
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 09:14:04 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:43314)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1iw59P-0002Rs-94
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 09:14:03 -0500
Received: by mail-lf1-x143.google.com with SMTP id 9so6281992lfq.10
 for <qemu-devel@nongnu.org>; Mon, 27 Jan 2020 06:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1vyNV1NmHCu6nOX4MvDlPij5efEcNgskeOCi4lQVj2U=;
 b=OQHJ3+jxF8ut6l0CfSK1UTcou1119rdzEyCepZox5mfD4r8+khK4iGAp2/YeE+juW5
 DVR8aqRrllC8ShDlEIRA8DPX3R8Vqk5aGmeFaHdh68AaGVhoKQbHs+bFePTKwcluvdBT
 LPrGlyMcPb4H9LulIzB3CS1Zb3m2SaFagdw3R2C7IeCHf6NvbqC1fH2PiE6E0A1Hamjz
 Fy3IcKWGEhdy7OLqzQiToIJbdPEPRrES3pqFnGdQnGTrdyA4ji4Gs+B17EWnk/HLhUb0
 3U6HH5DxKEr9OmBaMUgCakWrkUuC7zEOA6C8nen4MJzB8tTf1kmSA9vrNNe2UvxHmgwE
 vgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1vyNV1NmHCu6nOX4MvDlPij5efEcNgskeOCi4lQVj2U=;
 b=lbrl+tcOabnvl1l1WJGNB/2dkghmnTj4xRS42uq3F5yuN/PTxN8nsIJkpX08D7wqh5
 CBJykNkyJbqa7yxrax36mNVOg3Ulz5blY4cQrGPe0p4UxlrWmtTG+axPs01BfWxhElGC
 S11xGR2GDM4q9g0ggflyUIBKsJGMmgplkMnBBT06CZLKBLg7wqNH5wXxnkTHtpfkN0zB
 JsJD9qTWBky4fVzidic+MVqYY97wzGRqGh+k1TwaJSR8rxdg/h7ONOM2MTAHS+JuhJ2z
 qv1AuEu2gZm6w+GN0pYevVqlXWf57sshOoyGMSAedaKorsdF1Rn3ZaRamz+MbKyRBdLG
 5ziQ==
X-Gm-Message-State: APjAAAX7GaP0BJNdugKkOiIWrgHcpZQpv95yFmssg06C1Ckt4WmQrIiQ
 jeSCq95fcrfNyZTbP4kHh5JVo858k8Rqeuu5fgnSlg==
X-Google-Smtp-Source: APXvYqwYEyliU4tGTuLm4DzTT0apXLpcHe8DFGpVIRZfR7RhHSTWKqNDPQJ9T0sTEUl92tXi48lP9Bs9QWMMoomQ/W4=
X-Received: by 2002:a19:6445:: with SMTP id b5mr8110185lfj.187.1580134441706; 
 Mon, 27 Jan 2020 06:14:01 -0800 (PST)
MIME-Version: 1.0
References: <20200124165335.422-1-robert.foley@linaro.org>
 <20200124165335.422-7-robert.foley@linaro.org>
 <87mua9f47r.fsf@linaro.org>
In-Reply-To: <87mua9f47r.fsf@linaro.org>
From: Robert Foley <robert.foley@linaro.org>
Date: Mon, 27 Jan 2020 09:13:50 -0500
Message-ID: <CAEyhzFuG5NDVmnNgvSdMioDJHLSFMQT54FbshGw8qkyX4GpHyw@mail.gmail.com>
Subject: Re: [PATCH 6/8] tests/vm: add --boot-console switch
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
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
Cc: fam@euphon.net, Peter Puhov <peter.puhov@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 27 Jan 2020 at 07:56, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> > @@ -523,6 +525,10 @@ def main(vmcls, config=3DNone):
> >          if args.snapshot:
> >              img +=3D ",snapshot=3Don"
> >          vm.boot(img)
> > +        wait_boot =3D getattr(vm, "wait_boot", None)
>
> Didn't we add a __getattr method, so we can do self._config['wait_boot']
>
> > +        if args.boot_console and callable(wait_boot):
> > +            vm.console_init()
> > +            wait_boot()
>
> isn't wait_boot always callable because it's part of the basevm?

My bad.  Missed changing this after moving the method into the base class.
Yes, we should change it to something simpler like:
if args.boot_console:
            vm.console_init()
            self.wait_boot()

Thanks & Regards,
-Rob
>
> >          vm.wait_ssh()
> >      except Exception as e:
> >          if isinstance(e, SystemExit) and e.code =3D=3D 0:
>
>
> --
> Alex Benn=C3=A9e

