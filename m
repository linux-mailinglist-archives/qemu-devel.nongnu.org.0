Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4431431D5A8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 08:18:38 +0100 (CET)
Received: from localhost ([::1]:54412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCH6b-0000us-CQ
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 02:18:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lCH5T-0000Th-Fm
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 02:17:27 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:45536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lCH5R-0005tv-KP
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 02:17:27 -0500
Received: by mail-oi1-x232.google.com with SMTP id q186so10048203oig.12
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 23:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Y4DnNAHhN8iGRerQ0BWuSiVB5Pzcfpgj3p/KD9vV3s=;
 b=BpISVe5sfRQ/BD2KmDftPaEkpSMwJawmsdyQGpuLdVQhLW48QrYaHn4nryyN0nTee3
 wNk7U+oC3oaHqfmvP0HqqbKYsFQAYR3+bCgk81rwkQK7eBAXo6CNG/3BoIZSkpqnjGNT
 +bLeu6SVxmQ0u6L+M+U7QnDxt/CZ+iiCgd1pb1WVVumkx2CR2hyodygGPK9KNFG+fNOE
 rMimAs5oXDOPloDYrejJ76M2mnkNB2iczYqImwBDPDqgRL+anvoA6wBCt//4Ze6zrmaE
 //6mG8UnnrqLFGKVx6pyghVuv/nJ8Mg++lRFPAPiOC0ItRQ2xbpf3/uT08RUT2Z8ozxA
 3QnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Y4DnNAHhN8iGRerQ0BWuSiVB5Pzcfpgj3p/KD9vV3s=;
 b=JjMm6h7jjDVSZELceSHrSl0KAaAuRbfxHtXTNexVHSw38GSqapd6yq8J82BYRyHXEr
 J0LQRlS+40HMSxDg8Cfau8LGDrDSHfk4EE/kRs8UNI5vgbGIf27ceGDeNP7lUvt1Mbcc
 pKVYo+7cGkuoQ8GVtrr9tP81t/nDu32aQl4m0PYY89eTIdxdbdmghyVA40LL7336AHZ4
 VhPIGZTgSp1h2LlMF2qCS/vOSN+sQqPSH8+/zwMn2xx4poSKF76rmhKdW/Eiv+jtChbk
 mk3qvar7sGZvUFNqJBez8ZAHbTvu0JGu7a/bfKeg82Vl8lUvDOQ9qWKjzJXb/2WV4URW
 HnaQ==
X-Gm-Message-State: AOAM530NPBlNgYSx9revXxZyexIiGF7NKQ03nKDfg4EkazoLNWnfTm8D
 ngsCpYFsKZPfUPKzHBi+EffX5G3OH1aV7Vb9RI4=
X-Google-Smtp-Source: ABdhPJxMvqiwNZ9UuEkkAmly6V+hsD8GGwFnUkTftjgLQUMavQ0xRdnoMseU5MLMERga6v6zeznWF/A0o3mXEtiFr68=
X-Received: by 2002:aca:1e15:: with SMTP id m21mr4544661oic.62.1613546244286; 
 Tue, 16 Feb 2021 23:17:24 -0800 (PST)
MIME-Version: 1.0
References: <CABLmASF7YP3qfcuhAQsm8J28e8omZstBf7E5Eir=8MyqnvPLRQ@mail.gmail.com>
 <20210209151221.dxiiydxgxsqu3gmu@sirius.home.kraxel.org>
 <CABLmASEG3FiJ--7bQzZVJ1DtdFJSZ=a41yAf1QgEBf8BoGZk_w@mail.gmail.com>
 <CABLmASGwcpbDe3Gaj5TV5zFmFEaDaeL1-M1AmvfehzD9U=_3iw@mail.gmail.com>
 <20210216144831.cqefndfuvlju2yli@sirius.home.kraxel.org>
 <CABLmASF_r4E85yLQgEYSZWraBO4Uo70o28f6YZQ3-w0+wPW1XA@mail.gmail.com>
In-Reply-To: <CABLmASF_r4E85yLQgEYSZWraBO4Uo70o28f6YZQ3-w0+wPW1XA@mail.gmail.com>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Wed, 17 Feb 2021 08:17:12 +0100
Message-ID: <CABLmASFR5TaDSCKvzhgSnE8aGPVJx5xtWrSGv7RKE7MHMhG5eA@mail.gmail.com>
Subject: Re: USB pass through into Mac OS 9.x with qemu-system-ppc
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 16, 2021 at 4:42 PM Howard Spoelstra <hsp.cat7@gmail.com> wrote:
>
> On Tue, Feb 16, 2021 at 3:48 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> >   Hi,
> >
> > > Please find another pcap file attached. This one stems from an attempt
> > > to pass through a midi device when running qemu-system-ppc with Mac OS
> > > 9.2 in macOS host.
> >
> > Ah, yes, I remember now.  Problem is that the usb stick is plugged into
> > a high-speed port (usb2) on the host but passed as full-speed device
> > (usb1) to the guest.  That works in some cases, but is not guaranteed
> > to work.  usb_host_speed_compat() tries to catch some of the
> > incompatible cases.  The usb-storage incompatibility slips through
> > because the incompatibility is specific to the mass storage protocol.
> > Specifically the wMaxPacketSize is 64 for usb1 and 512 for usb2.
> >
> > Seems fedora deals better with the situation ...
> >
> > take care,
> >   Gerd
> >
>
> Hi Gerd,
>
> Thanks for looking into this. It looks to me that the usb storage
> device nicely reports endpoints 1 and 2 when asked, but that the host
> only ever communicates with endpoint 1.
> Is that the issue you refer to, or might that be libusb related?
>
> Can this also explain that other (non-mass-storage) devices cannot be
> passed through successfully ?
>
> Best,
> Howard

Hi Gerd,

Thanks for the explanation. I've been successful in passing through an
USB 2.0 stick into Mac OS 9.x when connected to a real USB 1.1 hub in
a old Apple keyboard. This at least gives some perspective to connect
other devices as well.

So we can consider this quest finished ;-)

Best,
Howard

