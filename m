Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8785EA9D4
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 17:12:00 +0200 (CEST)
Received: from localhost ([::1]:38444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocpm2-0003Wx-3l
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 11:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocpiF-0007S5-Kv
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:08:09 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocpiC-0002Mq-4O
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:08:02 -0400
Received: by mail-ed1-x532.google.com with SMTP id y8so9433558edc.10
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 08:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=zeul5dHZDsmNx5pH0BAXKE2LMYBR5Stn64G6TJC2FLk=;
 b=CUV5OeVWHRrX5wO+PaTLLiU47Oq1OoVT1ULoFUBMl6AlZ2ijugpMeClHj7iABiWiW3
 2cyT0ulqaO09vEA2e/yAupy1+ubxbELDmD5sOh9bsLjnt1JdhFIb2iGZZY9RJp5f8zRX
 51eIl0Pf+3D4t6TJkAhJFgZZgJiFrpa9BYvSnXWPUSkoB9jjxHhcGC+vfd1lO5E5tG7/
 KhiFQqYshlTeW2dThgINnFj+nMekgRowcQaDemnra9z1GBbzTYHVHaWTV9gu/qKgu7sH
 0qhz0+8B6ipPAIL9rEhEw0y83kHxEKKnizc81MBfGugB01Xb6pNnHWubN+VjMX3TmGZ6
 SKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zeul5dHZDsmNx5pH0BAXKE2LMYBR5Stn64G6TJC2FLk=;
 b=Sv2fWwtVIb0BNioyNWe4OvUChAJNBeGOggb/01U5+RJHHvzdw2ETeOGOjNnAVngQsI
 0vE8+/tqe0Kgj6uA29otVHmEb4bcekkgPDt4zH0bmbjKfwrN6wcnX45X9btwEeh98TYh
 kFFWzWdECbP9VeEc6lyndkGfjmQhGlcyA5qy0bCF7Fair7R6ujvphfx0wyPFq+PYDFWv
 VGk59gClNxOxpd0dy3/flPQbIL5TAfi4o/xzDWv4a/KXrov9Q17FIIId1Reqzkp8X/qJ
 SqPWX4+tTfTFCDKpI6ztuO5WG9WLGvTGVOkzNxDkd5Gq/fziHW/PWFxp+I/Zoo1/KQEj
 g72g==
X-Gm-Message-State: ACrzQf1MYS05G0cq/VSHqDwREhC3ro4ic/rahN26F1FF3G28LJ9zKoqo
 YGEuOCUgGVb1JshlGwnrOai+/myx7ge86wz5L/GLFQ==
X-Google-Smtp-Source: AMsMyM4NUPY+edKXsvc/IktCmrMuVOxWZCt1hEBWG7fzT+SLbrnJyCgfC41Lysfi2hrC9jrqwinC8x6XwjGN2LzokjY=
X-Received: by 2002:a05:6402:1d86:b0:457:e84:f0e with SMTP id
 dk6-20020a0564021d8600b004570e840f0emr11127041edb.241.1664204877246; Mon, 26
 Sep 2022 08:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-3-alex.bennee@linaro.org>
 <CAFEAcA-gpE6XYbiacSAso1_66RXYEJD04z4+HW4fFpqeCvpdQw@mail.gmail.com>
 <87pmfi41lp.fsf@linaro.org>
In-Reply-To: <87pmfi41lp.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Sep 2022 16:07:45 +0100
Message-ID: <CAFEAcA9EQVExnhmYDNOtpptHYrnrSHEO5Baw4z96FNuadysP3w@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] target/arm: enable tracking of CPU index in
 MemTxAttrs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Sept 2022 at 16:06, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Mon, 26 Sept 2022 at 14:39, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
> > This only catches the case where the memory access is
> > done via something that does a virtual-to-physical translation.
> > It misses memory accesses done directly on physical addresses,
> > such as those in arm_ldl_ptw() and arm_ldq_ptw(), plus various
> > M-profile specific ones.
>
> I thought they were just used for the page table walk. Can you place
> your page tables aliases with a piece of HW?

They are just used for the page table walk, but they are
nonetheless still memory transactions initiated by the CPU,
so if we're saying those should be marked up in the
transaction-attributes struct then they should count.

thanks
-- PMM

