Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5942F1032
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 11:37:13 +0100 (CET)
Received: from localhost ([::1]:37082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyuZU-0001pp-MW
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 05:37:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kyuXe-00014f-Qj
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 05:35:19 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:33131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kyuXb-0005sf-RZ
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 05:35:17 -0500
Received: by mail-ed1-x531.google.com with SMTP id j16so18315306edr.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 02:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VoOsJETvYJ4VEH1qC/CQvIplIkXSS3q/3t16LUfuHAQ=;
 b=Ft1LWyzSUjdKMVDGNj152zjy4xzJuUOe/WMAwMizRtNP/loj+n8zLZpl3SKCaSETjO
 GKETNsgs5ZwEspVLrEF7jzt/OtzEasNyewPb4em6UyfTfCn80BSDw8kkhaA8w0vXB6Y5
 mTcJg3e3hE1sm1Py+pNZhrxCema3cpyTaKe1BdUIhstLmdsQWrk0fl1P6n8tH8fYmBmM
 8Z0G8G4tak7ha6WFUAKQX590XpkTVz6GUk4qXyurxxME8nDzxdnThIrIClyQYZLWNfGx
 RCxZLa9IPNVnu+ffOOzzOGS9m/lSOruhJ4PmrImGeAH68haoWxPragbJ6rxDkzdCFRlJ
 Dbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VoOsJETvYJ4VEH1qC/CQvIplIkXSS3q/3t16LUfuHAQ=;
 b=FktAfh5I0H0zfkMj5YG0Dn+ETMcY+JagNecr6nQuBOVyB5MbERztHwoXAlsqOp8I35
 8q35Z9aDR2ARuXRJ95QPABhcle2lECtR9RjxMBYdy7OQoHy33WTLhNMNFCwzajdvWWgs
 96aWvnPoI1VScADvcqLN+Nm5jL+qyFx7hVZaeKQTOGr/hc79H1UbKOYWeggPA6FbFc+Y
 F2DdDnjaEs67KM4bZMwl+nFN5mYJ71xpJU7wL8ruJGB8OvFvmfvyTijBOJUdDf2hYWCa
 P7725L1I/gN7ZOMh9WnhOzRdp8bj6cSElQLQFZ+UwxLscceRkrMpFMAoxGC1jvwax8Jt
 1F2A==
X-Gm-Message-State: AOAM533jMLqv7tz716t3i4l2ua/8+ABbuzPzQkCeY+atcUhwxzMaUHO/
 omJKgSecxocNBzN8CXzH3NbhY8AV/5SNtettyB2ZBg==
X-Google-Smtp-Source: ABdhPJzMvCUPQJRZPqjQryMUkAljKYoCfUj6NArT6kzdqUpdjDPKYfUqlMKEAnQgxux0yNR3NicU2sv1ZFnWUdfrKso=
X-Received: by 2002:a05:6402:366:: with SMTP id
 s6mr13307134edw.44.1610361313769; 
 Mon, 11 Jan 2021 02:35:13 -0800 (PST)
MIME-Version: 1.0
References: <20210103205021.2837760-1-f4bug@amsat.org>
 <20210103205021.2837760-24-f4bug@amsat.org>
 <CAFEAcA_YqAiiLRY08-gACmKOCf2mat3AaBGnyRK0Jc+aK-iuOw@mail.gmail.com>
 <b2dd6d33-d8e9-21a3-7b76-bdf44e117128@amsat.org>
 <3aece87-60ff-b195-8bd-c696bf461cb6@eik.bme.hu>
 <CAAhV-H71-wrTfDWN9zH2gU4gdJkCpMk5EDfAi1W1d4jXA3OkZg@mail.gmail.com>
 <3f383a52-6583-4c60-8f24-a24e6b95c068@www.fastmail.com>
 <29acb49a-4d1-ae6b-328d-6e3081e2ab2f@eik.bme.hu>
In-Reply-To: <29acb49a-4d1-ae6b-328d-6e3081e2ab2f@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jan 2021 10:35:01 +0000
Message-ID: <CAFEAcA8trw0PNeDaQq3dZa0q4qYoXF35ROLMHDw3qnJ=wX+vvw@mail.gmail.com>
Subject: Re: [PULL 23/35] hw/intc: Rework Loongson LIOINTC
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jan 2021 at 10:20, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Mon, 11 Jan 2021, Jiaxun Yang wrote:
> > On Mon, Jan 11, 2021, at 8:36 AM, Huacai Chen wrote:
> >> I think R_END should be 0x60, Jiaxun, what do you think?
> >
> > U r right.
> > The manual is misleading.
>
> The R_END constant is also used in loongson_liointc_init() for the length
> of the memory region so you might want to revise that. If this is a 32 bit
> register then you should decide what R_END means? Is it the end of the
> memory region in which case the reg starts at R_END - 4 or is it the
> address of the last reg in which case the memory region ends at R_END + 4.
> From the above I think it's the address of the last reg so you'll probably
> need to add 4 in loongson_liointc_init() when creating the memory region.

Mmm, or check
  (addr >= R_START && addr < (R_START + R_ISR_SIZE * NUM_CORES))

Side note: R_ISR_SIZE is 8, but the code makes both the
32-bit addresses you can read/write in that 8-byte range
behave the same way. Is that really what the hardware does ?
Or does it actually have 1 32-bit register per core, spaced
8 bytes apart ?

thanks
-- PMM

