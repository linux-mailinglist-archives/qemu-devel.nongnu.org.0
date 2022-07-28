Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B99C0583B88
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 11:52:14 +0200 (CEST)
Received: from localhost ([::1]:33378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH0Bh-0004D2-Qn
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 05:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH04K-0005Sz-7G
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 05:44:36 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:36628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH04I-0001ov-27
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 05:44:35 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id z5so579637yba.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 02:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QYP+aTsD2kbM9rzQoLvGHPMnNx1pQWsBpZm2h2nfj7I=;
 b=PgOYd80EYyDK3ZP26m/3KOh/Potjc6aYXbG3/66VsrAbhAwOswKBRxn5/T4edFiIN/
 /bDCiVJAR5err8CayHKac3G+wisog0Jq4tW2sjmLsFmjyym+ZeHNBRTjH5X+KJ/X1j3O
 gQOcMqewY39QuraoVqT7Ukf76j1NPI5uHheOgkrWTACKWfSDM/RBnGchMwFca/ii9+ia
 GsuFgkM1ZoJMiJ/qej9C0ny1aY6q5H6heypU6KPGFJLmSF8cOk4gfBOudl5DnhjyePmS
 acCvaSFTzar+OWr+cEeoD1pPjdBJsIKKj//XFG51jDztfp4ZnsiEoREphBp3I4HPPkeJ
 rt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QYP+aTsD2kbM9rzQoLvGHPMnNx1pQWsBpZm2h2nfj7I=;
 b=nzuEqdeiX6BbdJgxJdcJxVxliCm07oHX2xfJalRCPdyHGF92OejmuH+MI47KAzjpRR
 QyepbGj1sW8K1r1dSGPDVBkWQLw6oKnhmOddbXvauzxQ1IT32JgOioivt/d/obcZ72pv
 TYHULiyaRn2bdpqyuZ/2hvKb0RI4QfYhYK122kZFWOQ9zORU1/JTiJeMgahuFlC2APDS
 Rb3bei9FNKeSfcSSBGw6rXMt2ppnZl1x6O3+QixwOEYXmbzQRIdyTg7o6misoLHyaWcr
 2ZIBqRHhg6vaNW+FUq0QeYZa7p4R8t0R54jX0GPx5E3giQVhroKCcERSRml7pV5CV6G9
 wrzA==
X-Gm-Message-State: AJIora82MYHApfHqqsryYD/OLyTHkeoMfgGE7haJhcj2zcH/8IAkUIyS
 HOHjqzk16RGQKaAMm8hg1W/cHss02Ks5QXUAgxzKHg==
X-Google-Smtp-Source: AGRyM1uJdNFqrhDEZWripO2IsRFrMsbpYe8ue1dkd4bHgZMCRCaYoMzVdawsHg3FEeOduTmHa7tdUCbziot5f/4Av6Q=
X-Received: by 2002:a25:d4a:0:b0:671:6d11:d14e with SMTP id
 71-20020a250d4a000000b006716d11d14emr11148053ybn.479.1659001468062; Thu, 28
 Jul 2022 02:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220726182341.1888115-1-peter.maydell@linaro.org>
 <20220726182341.1888115-2-peter.maydell@linaro.org>
 <CAFEAcA8s9vgBFVuDVVednC4cv5Q4M7L+uTCc74tEmdht4ss+pA@mail.gmail.com>
 <067b069a-4930-f5a9-2ce7-d4eb225c0825@gmail.com>
In-Reply-To: <067b069a-4930-f5a9-2ce7-d4eb225c0825@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2022 10:43:47 +0100
Message-ID: <CAFEAcA8r-XQHyoJvbsPzv4eD0=Z9wcZQXarW3VaPGr1W_Y7q_w@mail.gmail.com>
Subject: Re: [RFC 1/2] hw/ppc/ppc440_uc: Initialize length passed to
 cpu_physical_memory_map()
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Jul 2022 at 15:11, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
>
>
> On 7/26/22 15:24, Peter Maydell wrote:
> > On Tue, 26 Jul 2022 at 19:23, Peter Maydell <peter.maydell@linaro.org> wrote:
> >>
> >> In dcr_write_dma(), there is code that uses cpu_physical_memory_map()
> >> to implement a DMA transfer.  That function takes a 'plen' argument,
> >> which points to a hwaddr which is used for both input and output: the
> >> caller must set it to the size of the range it wants to map, and on
> >> return it is updated to the actual length mapped. The dcr_write_dma()
> >> code fails to initialize rlen and wlen, so will end up mapping an
> >> unpredictable amount of memory.
> >>
> >> Initialize the length values correctly, and check that we managed to
> >> map the entire range before using the fast-path memmove().
> >>
> >> This was spotted by Coverity, which points out that we never
> >> initialized the variables before using them.
> >>
> >> Fixes: Coverity CID 1487137
> >
> > Also CID 1487150 (it reports the wlen and rlen issues separately).
>
> I amended in tree:
>
>
>      Fixes: Coverity CID 1487137, 1487150
>
>
> I also believe that this Coverity fix isn't dependent on patch 2, which
> apparently will take longer to get reviewed, so it's fine to take it
> now.

Correct, and thank you.

-- PMM

