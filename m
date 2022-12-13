Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0021F64B987
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 17:23:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5821-0007Hz-2N; Tue, 13 Dec 2022 11:21:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p581z-0007HQ-8g
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:21:23 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p581x-0006Bb-IV
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:21:23 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 k88-20020a17090a4ce100b00219d0b857bcso4090192pjh.1
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 08:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gUJzdVuCSqgpXDZzQl1IW/XtnWjDNJ/FhnO4CajH7c4=;
 b=PxNVF9WaIlRjhCmohmXFXGxH4oH5z0ZGHSrJ6EVF4EZGaEGonrzvCa+yD5qdCG7vKe
 UwXZxPSFEnPiiQ33sHqRJClayoVWjNSag5tGfcHFmYkirzbpjKHX96yltKu11MCwKGf9
 8VAeyf39rH5PmqPiFVsJABt2USj9FtlUdtuJGhRrD9mWXEq1poPZH5xkkGBILK1+mbvB
 k5jYZd2J2criWG1wFZL/2iksBEZJDOXDJsAWaI4LBBkJW3EF9aQQJgHWqrkZeFREMztQ
 1DADO0WixVRVRFXMHRV/Z1ecVVVHoJFo7VUW6DXMsK5HZD0821MiOiuQVObRGmBYQcqY
 OS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gUJzdVuCSqgpXDZzQl1IW/XtnWjDNJ/FhnO4CajH7c4=;
 b=WZoJNEsTlxWIjE72tIzldkk3v4AWkyNkZAMSwBua2Q1U4FGOyY3WA65se9YS418cjl
 8BvepwX7O12l1n2Q11eqlqMr5C6i3r/urQpdMpen+EbR66XzScV/hoLYjQG8HmwTt7In
 kezuiH5GCferMGIC25CfPKm8an5q7DLIUwYPPqRXEB71kobGbleJpmWIjLgi45gcXurR
 di555WSeyLyk0k7lOkz/2GcenC+cMGAL6VqehE0tQd1NubY8tSQhlRAzK0kuYar1DfsO
 HbH9gmSp2tT9SdGteoovweLnA9ADb7ZBKu28EXMIMCOhKOYMLfzBMvlRIqlm/d/QgBsI
 7JbQ==
X-Gm-Message-State: ANoB5pkN+8JcmneDfRuwKQg0+5vZOIO+eqzjytVbLLrW2cm+wR8xaakY
 vi8Z5OKMDuageIp/sEY/uFvYQvVpg10IsD8L5s6Zgw==
X-Google-Smtp-Source: AA0mqf7c9lCl5V+TRz055X9bAdbeLcXe79ZFrecTimgw/c9yc781viiG0Z14kTi2aa8o/TRdAoSss4J+lxv28qTsHWs=
X-Received: by 2002:a17:902:70c5:b0:189:b0a3:cf4a with SMTP id
 l5-20020a17090270c500b00189b0a3cf4amr36106389plt.60.1670948480099; Tue, 13
 Dec 2022 08:21:20 -0800 (PST)
MIME-Version: 1.0
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-2-philmd@linaro.org>
 <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org>
 <d73fe725-565e-7fcb-e7d3-846189459545@linaro.org>
 <a1f4b5a6-0a8a-5a04-8ab6-f3f08b9d36aa@linaro.org>
In-Reply-To: <a1f4b5a6-0a8a-5a04-8ab6-f3f08b9d36aa@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Dec 2022 16:21:08 +0000
Message-ID: <CAFEAcA_F3Z+UPW-wHs8xedYX3TiV8CRQAom0DhefKLFH_Ejgog@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by const_le32()
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 13 Dec 2022 at 16:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/13/22 10:10, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 13/12/22 17:00, Richard Henderson wrote:
> >> On 12/13/22 06:52, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> Assuming the developers of commits 2c50e26efd ("powerpc: Add
> >>> a virtex5 ml507 refdesign board") and 4b387f9ee1 ("ppc: Add
> >>> aCube Sam460ex board") were testing on a little-endian setup,
> >>> they meant to use const_le32() instead of tswap32() here,
> >>> since tswap32() depends on the host endianness.
> >>
> >> tswap depends on target endianness.
> >
> > Yes, it depends on both host/target endianness. What I meant
> > is we shouldn't have system code depending on host endianness.
>
> It compares host vs target endianness, to determine if a swap is needed. =
 But the real
> dependency is target endianness.

It does seem odd, though. We have a value in host endianness
(the EPAPR_MAGIC constant, which is host-endian by virtue of
being a C constant). But we're storing it to env->gpr[], which
is to say the CPUPPCState general purpose register array. Isn't
that array *also* kept in host endianness order?

If so, then the right thing here is "don't swap at all",
i.e. just "env->gpr[6] =3D EPAPR_MAGIC;". But that would imply
that the current code is setting the wrong value for the GPR
on little-endian hosts, which seems a bit unlikely...

thanks
-- PMM

