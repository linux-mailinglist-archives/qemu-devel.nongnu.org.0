Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847A45BEE6F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 22:24:03 +0200 (CEST)
Received: from localhost ([::1]:60236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oajmk-0004vf-LC
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 16:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeyU-00045y-VZ
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:15:53 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:42989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeyT-0006Rx-IP
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:15:50 -0400
Received: by mail-ej1-x636.google.com with SMTP id sb3so6926410ejb.9
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 08:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=KkaEiZ02EouUlGaMhxNtZcD46s5sk3AH0Nj2KAp+eNs=;
 b=jqpZGJtmZcagf6mJvd3lSNasvS2kyNZRjPFptXqjgCYzx0Z6LCzxw6VYTEInaKfNcY
 MFq4or75HbVT4PWgcfTtce6BDiCFmGIvZ+5nDfHuIPIVedee+oiVHR5v2K67ooKajWII
 I/lX+RwS/CTXyJ/ycR0S930RdigteHlL4ArDvhAjcW/oeviXhAXvf2eDMpUU5dwVI3sz
 lOHl122G07R9Lpoj2nc4E1iWeooqadPNnbBAIvCTpdAxfL42o6VYZK2o16W7xFHgA32z
 cbn5MJTqkSgwdvyR9BPtuYWXYBmMSrX0bRmd3KJUJiniIfpM/KiA0Qw6YlV4HoQfQhxd
 9CYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=KkaEiZ02EouUlGaMhxNtZcD46s5sk3AH0Nj2KAp+eNs=;
 b=mVL8TZRKBD/zBC7fL06LFWv89Sy+RxnNZw9bK7Bt16KY4ozHH1cM0cAv5NiZfqi7Xf
 +eCX+uF6mCi9nsB02Zb1Fev0mu75ssGk3ImINIt+UmW6x0diZHgugxM3aEMPbYrV8/pm
 wT2IoRHRlxvAum3/Zvmeh9cxIPYoPZ76NPA1jMaFZg7ygwPxPk8bOQ91vUU8Bzn/n1iz
 mTphPfbA3MIsvNZ+wxnEz8w7PkJ2+H11sgM1ZjHidfe8ciF857LMGqFEyE1Dx5RZMLjH
 QCowiH8mvTwAJIHTMX5Aj9XDJu5InlJWoD8D4XoiTnxhcaNVswwMzfjF4yzGt9/U+451
 Afpw==
X-Gm-Message-State: ACrzQf0CcdxeDHPkiB0T3py7gbaO8/YLYTmB5UT7S8JhFQB1AYWh9LPS
 fbUNAY0qn+Stlrzg8q4bZ/T6BKraJl++drdbkwYXdQ==
X-Google-Smtp-Source: AMsMyM70R5QG+nctBXeLp/H9QHRQ+JmwGikJbU2Oe65sLIy2FRZVy1nvcCOhwuv4lcuRvOzaRNAwq8f00PqnsjkQ3KA=
X-Received: by 2002:a17:907:86a5:b0:780:156d:e842 with SMTP id
 qa37-20020a17090786a500b00780156de842mr17131369ejc.555.1663686946832; Tue, 20
 Sep 2022 08:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-19-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 16:15:34 +0100
Message-ID: <CAFEAcA8+rX2tspDcXHpQ5d7en3ykYfde2B5X=vaKxRwzrgxsnw@mail.gmail.com>
Subject: Re: [PATCH v2 18/66] target/arm: Add secure parameter to
 get_phys_addr_pmsav7
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Aug 2022 at 16:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the use of regime_is_secure from get_phys_addr_pmsav7,
> using the new parameter instead.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

