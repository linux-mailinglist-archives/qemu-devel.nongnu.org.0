Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D602F41B8E2
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 23:02:17 +0200 (CEST)
Received: from localhost ([::1]:44200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVKEy-0002bh-T8
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 17:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mVKDR-0001vL-3Y
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 17:00:42 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mVKDO-0007ze-CC
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 17:00:40 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u18so592704wrg.5
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 14:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v70sYneusvJQ/ptCvYzhmC++wroITMT+ie+B2tx+oN8=;
 b=umtl7m8uTnfZhsf5rzd1FjHB6xE76/B+qy1lvgPImz4CQ/x+TjuxC3hg29ybK/QyX4
 YTVES+7Hotg116IV5K/qM5kOFGmajN9tdIBgkM5K7Bmh0NS0FefHIMYcrSt1uaNSW3Oj
 v45bzDgqd4UFtJpYd1uTJD41RPjSFqAUQ6bRgaYYcXLgof86pvdMeEf5fwUqj5JBEIV+
 paKnjvQAJenmkjqooiRDXyeyDekYM+RbRWALrxeynlTz9QXupKlOHtb2MqsSPulGttmA
 3ZRB9Us59l/mvf9Rz8VZEz7iz9qi8O/JdOumJVpbe00UjpONJ6O0vkQPLk6QVhAyVDRp
 hJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v70sYneusvJQ/ptCvYzhmC++wroITMT+ie+B2tx+oN8=;
 b=bvL/w+bbkC7voC8jZRcaVc/fGvwIxW8xXqR8LO86hMvLPKpo+CWr+wFo23cExPQ1FC
 Yq32aU3YbQ0MoXhJy09XR3HszFCXTlNJa8xJfSQH5VTbaJOn+8U6CbSiRXGikcOnZsT5
 oP6/eKo8eZpMiu/FrVi+IYLdeI2Hgha4lz9rlshpv7OAfU1Cu7+QVGIllvBUoj32R+nM
 3w5a8NsSXYrUTv3zMjuduGnf2J1D11ZvvUghNseNxEfUiEcdniYnZxKSkCrnevHd+rpA
 vDANCHlsIFlHkKoRkK66Ym/6vdy30DRGGoOsCgEy2WXsHFMNRVTuqpOFaviu21J4Jp3L
 g0+Q==
X-Gm-Message-State: AOAM531eZYsByjWGEzOOFaICh4P7Tf49DqTu63hFmCJPd8yqm5AR53YA
 QARt57t71lzlQ8RvI2dm9QPw/JymkIQeB31ZhiLfdw==
X-Google-Smtp-Source: ABdhPJyRwTSjR/lhRCMDR01DSHCvFC0gb6Uj4v7rpXaqbEF9oAhtiPUuM21Nhe/DKOvDU33EJWzrlnVc2L4V0U71RIc=
X-Received: by 2002:adf:eec3:: with SMTP id a3mr2599456wrp.276.1632862835762; 
 Tue, 28 Sep 2021 14:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
 <20210911140016.834071-12-philipp.tomsich@vrull.eu>
 <CAKmqyKM7b9Xz0C7YN7QyARUJSAuDqxWk4VnwHfMB+5tTHGvy4w@mail.gmail.com>
 <CAAeLtUBk3ffamhKaqYsQkCW79Z6Jd+gMH_jAv_NXAVyDPdHOmw@mail.gmail.com>
 <1dcc5800-a3e6-d1b8-c2e5-0ccf2d724c30@linaro.org>
 <CAAeLtUCiOFKN=xoJSJyuNHF2Yvc0pYb0ef3L3kB6NtGPQQ5h2w@mail.gmail.com>
In-Reply-To: <CAAeLtUCiOFKN=xoJSJyuNHF2Yvc0pYb0ef3L3kB6NtGPQQ5h2w@mail.gmail.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Tue, 28 Sep 2021 23:00:25 +0200
Message-ID: <CAAeLtUBXnN-507Zm4YqoO1BCXO0cA=adWBzA=fuavfps4Bg1qw@mail.gmail.com>
Subject: Re: [PATCH v11 11/16] target/riscv: Add orc.b instruction for Zbb,
 removing gorc/gorci
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair23@gmail.com>, Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard & Alistair,

On Tue, 28 Sept 2021 at 20:45, Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
>
> On Tue, 28 Sept 2021 at 20:45, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 9/28/21 11:45 AM, Philipp Tomsich wrote:
> > > The dup_const macro is returning an unsigned long long, which probably
> > > should be fixed on the tcg.h-level instead of forcing a cast to target_long
> > > at the call site.
> >
> > No, dup_const is first and primarily for vector support, and therefore must return a
> > 64-bit constant.
> >
> > > Or should we introduce a dup_const_tl?
> >
> > Maybe.  I guess that could be a bit better than the cast.
>
> I'll provide a patch that wraps dup_const in a dup_const_tl.

A fix is in patchworks:
https://patchwork.kernel.org/project/qemu-devel/list/?series=554539

Thanks,
Philipp.

