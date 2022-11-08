Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADCC6213DC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 14:54:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osP3T-0002aY-3A; Tue, 08 Nov 2022 08:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osP3R-0002aO-Ix
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:54:17 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osP3P-0007z0-RV
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:54:17 -0500
Received: by mail-pl1-x62e.google.com with SMTP id b21so14232450plc.9
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 05:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LligLA02rgybM0rqciJkrzq+sTunsvgYrYQnCuJa3mE=;
 b=sU91FQmW5PGaNz8OJUZSFNXylTnOTy1ZkA9lG/b899TlavvD45IOjWYKt5izD8tJaj
 DTNx0ljdsvstcX1gmrkzDiGhO1EhDVhRokJyZTDGdw363ny3DRKyiIuHwZCfexy5iba5
 VSOI2xKnUcrUVsiaTQtO2inZlRUqpXcJlUbMxqzECLpWMpSg18sOP+mEBEvJfo85sN4e
 IwrghCNz+I1ezTyZPMETwfkO731MEAZr8l51n39d3/uXGTTF013oQ3tsO/b5aNCTVJkw
 pWRbRlb4VuJAZBTLhhF78gaK/tUrTSXUT2yP2JGVc4DeAo2WapVSStxUnBxwxt4PxuZG
 U9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LligLA02rgybM0rqciJkrzq+sTunsvgYrYQnCuJa3mE=;
 b=tcU8tNyx5xPQ/jWbVWsa0/qhMhGxkUxwO1FheIpFfgdI+3I3Ip/qWn+RD958QG074l
 LxiPWDn9K3F9/zjFcEe8UZCGf0hE1k54u9TGop+Dm74VtWTeCR2BTKRmmpDFypGF/BhG
 sZ9UfygCuiOhZ33IqVcwW3FJXuH+mbllVW3IPT0zsA6/JS2vVpBCCyZjKSA3iTG6ZLgr
 opKMIblYwcuIIVGIO67XYN6Kv8Te5LiHvto1AXVVHUngv3y9evB+126hZtSH9/3bjJ6c
 VwWu3cgRIW4haZS6MJ0jj7amjS8zHIVY8MbqF6zCOc1dE4TP/0hNTH9oH9ZL75a7ZiS4
 RIcQ==
X-Gm-Message-State: ACrzQf24+Gnr/hqFg4pSlIQfLnQokjOfAJILLlLfKMCUqHPktSaSiJPm
 qNWtggv1O+iFu2npt6VcUmzX/PuoS8TwDCeA1ueOdw==
X-Google-Smtp-Source: AMsMyM7l3UV+tabcCQd4vZGwNiBl25EyCEGCA/HT+tN9Z9U56kl5a/JEvLtnvPheESuCzwHd93lbKxcsJvSI7JhbpHY=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr56093144plb.60.1667915654375; Tue, 08
 Nov 2022 05:54:14 -0800 (PST)
MIME-Version: 1.0
References: <20221108023542.17557-1-schspa@gmail.com>
 <87fsetg5xh.fsf@linaro.org>
 <CAMA88Tqt-7rCTC38OhZGmCZyO4rFz+HHBNtDjaVCbhna01yScQ@mail.gmail.com>
In-Reply-To: <CAMA88Tqt-7rCTC38OhZGmCZyO4rFz+HHBNtDjaVCbhna01yScQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Nov 2022 13:54:02 +0000
Message-ID: <CAFEAcA8J2Tx4gW5Y2q6qtkJ0BPpM4iWkt3nz0uezV+kiz6m_Ag@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
To: Schspa Shi <schspa@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 8 Nov 2022 at 12:52, Schspa Shi <schspa@gmail.com> wrote:
> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
> > There is a whole comment in boot.c talking about keeping initrd within
> > lowmem:
> >
> >     /*
> >      * We want to put the initrd far enough into RAM that when the
> >      * kernel is uncompressed it will not clobber the initrd. However
> >      * on boards without much RAM we must ensure that we still leave
> >      * enough room for a decent sized initrd, and on boards with large
> >      * amounts of RAM we must avoid the initrd being so far up in RAM
> >      * that it is outside lowmem and inaccessible to the kernel.
> >      * So for boards with less  than 256MB of RAM we put the initrd
> >      * halfway into RAM, and for boards with 256MB of RAM or more we pu=
t
> >      * the initrd at 128MB.
> >      * We also refuse to put the initrd somewhere that will definitely
> >      * overlay the kernel we just loaded, though for kernel formats whi=
ch
> >      * don't tell us their exact size (eg self-decompressing 32-bit ker=
nels)
> >      * we might still make a bad choice here.
> >      */
> >
>
> I think this lowmem does not mean below 4GB. and it is to make sure
> the initrd_start > memblock_start_of_DRAM for Linux address range check.

The wording of this comment pre-dates 64-bit CPU support: it
is talking about the requirement in the 32-bit booting doc
https://www.kernel.org/doc/Documentation/arm/Booting
that says
"If an initramfs is in use then, as with the dtb, it must be placed in
a region of memory where the kernel decompressor will not overwrite it
while also with the region which will be covered by the kernel's
low-memory mapping."

So it does mean "below 4GB", because you can't boot a 32-bit kernel
if you don't put the kernel, initrd, etc below 4GB.

thanks
-- PMM

