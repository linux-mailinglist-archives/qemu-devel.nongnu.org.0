Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD35445207
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 12:12:03 +0100 (CET)
Received: from localhost ([::1]:37296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miaf4-0002aa-Bo
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 07:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1miad6-0001iP-Pa
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 07:10:01 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1miad4-00036l-Do
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 07:10:00 -0400
Received: by mail-wr1-x430.google.com with SMTP id d24so8038832wra.0
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 04:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xsH5962EetFd+5IZHb7sn6m1m3CRFz5GdHWU5O71Qtg=;
 b=oKwT3aUDA4hoynpAxK02Uk6Cs0hueLkZBge0PmZHGcaBwMBy3MAQ7Irph6hcNFrnUx
 dlnr2Kdv2TATdccuUioCXdAswI9nEF/qwqBTSrepF2t0no3RA3Xi8sxhOyOY9aQ1S8iF
 ONWQl1chtV0Z4Buvr5d1zvabrMMFKFbqg+Sd2kCmCUgTX98iQeUsTq7EuucbRhLFBwVB
 YPUfhE7U0YVgyg7kBPt8ZZHfGOpIqhROTnt+blCVu6FsotbQosuCHCe98iMQwg17sEoc
 GO6BFVRYSV1rcz8/HqNhX+Ea8+J62q2g9R56gcV+i74BIY8HwOuyrxkRn/dW9aEcrZ+T
 EOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xsH5962EetFd+5IZHb7sn6m1m3CRFz5GdHWU5O71Qtg=;
 b=XscE/3UjKx9+HdpkvB8rek1TTXi7EFARC2SAOcg/vpRGqzsEsqGDHVIvhLRYHxxYm1
 XbNxrhSOlC3FRrq/aJvveFRA+U0wQ5D2CJWjSRJrbwyqXTdj74zNKWaaXRmsZt42cBtE
 5Zk4S+HdEiMHQa0EM7dgO66C3szUBgeEUzWDLRd8/Z5848tWsWiGYxIWuoi/s0FoAnBS
 Sq6t7ka1mMkyLaFfOqYznaomxVR0Vql5jpwbFJr4GIhxlisZQXy2hsHI3OBn6GwjJO2Z
 RKw8ZeBYdtkvdBVqTfkuMbBl+5QvlhmoPgxdZ6fOPlw6bG2vEa5JmVQg0419B0GXG5R3
 D3SA==
X-Gm-Message-State: AOAM5302aZQ0nCmMW0bf3tnJHQbh5MrMTUMjCBQibb5GTDMRPC5m1S5B
 WRJLKez5BTjeCzQ47Q/JgJHuuiqIHz/OVm+EeEL5NA==
X-Google-Smtp-Source: ABdhPJzHOyRt7JyoMWg8nTVQsJTjHxqTMZs4uavUNFYusxSNGJxh9twtcHZm2lBYnO2n1XCEveplWZsuiMlbvgm95yc=
X-Received: by 2002:a5d:6da1:: with SMTP id u1mr12853073wrs.263.1636024196458; 
 Thu, 04 Nov 2021 04:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211026002344.405160-1-sjg@chromium.org>
 <20211026002344.405160-7-sjg@chromium.org>
 <CAFEAcA-UukuQXT3ebcboiVOSn0J+88w-kzoH8jE1JVxQnoeuvQ@mail.gmail.com>
 <CAPnjgZ2C8okdUMcgKjuLgV8JdPexYY0=9NtbSOHO81dN7=2RCg@mail.gmail.com>
 <CAHFG_=XWc+Fb=m=SHC6=y4KeF533yqCNk=Ae088oAZyjOULPaw@mail.gmail.com>
 <20211101180707.GJ24579@bill-the-cat>
 <CAPnjgZ0XeFHrXwBuTZ=eoKHCo7cMSuM_gUiTfv-Sqt8o6tPOXw@mail.gmail.com>
 <20211102172833.GS24579@bill-the-cat>
 <CAPnjgZ1zDeXMCtccy6=cQzjjAz92xJZunObm2OYKZ2eyP=Sdsw@mail.gmail.com>
 <CAHFG_=UTbUkZ3EUss4qoJwL6nJcL6tvZQATfPrH1WFQpRgqubQ@mail.gmail.com>
 <20211103144125.GZ24579@bill-the-cat>
In-Reply-To: <20211103144125.GZ24579@bill-the-cat>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Nov 2021 11:09:45 +0000
Message-ID: <CAFEAcA955NWTGhaEHYqjWppsDxH4BDEX4NiAew69mkwCVvjnLw@mail.gmail.com>
Subject: Re: [PATCH v5 06/26] arm: qemu: Add a devicetree file for qemu_arm64
To: Tom Rini <trini@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Anderson <seanga2@gmail.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Nov 2021 at 14:41, Tom Rini <trini@konsulko.com> wrote:
>
> On Wed, Nov 03, 2021 at 06:29:20AM +0100, Fran=C3=A7ois Ozog wrote:
> [snip]
> > > 3. Anything else?
> > >
> > > For qemu_arm_spl, it *does not boot* unless the U-Boot SPL properties
> > > are present. There is no easy way to fix this.
> >
> > one clean and easy way would be to upstream a Qemu change to merge a
> > supplied overlay to the generated one. This the same idea as applying t=
he
> > NT_FW_COnFIG overlay in the TFA world. In both cases previous loaders d=
o
> > their job properly for U-Boot : setting up the stage as needed.
>
> For the record, I believe Simon did propose this and the QEMU response
> was that no, you should dumpdtb, combine externally and pass that
> directly.

Well, our recommendation really was that the ideal thing would
be "you take the dtb that QEMU passes you at runtime, and at
runtime combine that with whatever extra information you want".
The dumpdtb option is primarily intended as a debug feature,
so you can have a look at the dtb QEMU created to see why your
OS isn't booting; although you can script stuff up that does
a dumpdtb-modify-pass-to-QEMU that is pretty clunky given the
need to invoke QEMU twice with matching arguments both times.

-- PMM

