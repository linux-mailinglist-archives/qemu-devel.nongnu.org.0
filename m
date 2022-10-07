Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B23A95F7B73
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:29:58 +0200 (CEST)
Received: from localhost ([::1]:54498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogqEX-0002yi-PV
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogpqU-0001XR-Cr
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:05:07 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:37771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogpq4-0004fL-2b
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:04:46 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 p3-20020a17090a284300b0020a85fa3ffcso7609824pjf.2
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 09:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4w7jbWIdR4Lv9ty1UC5S9ImiUJDYrtVEy+Qo6+C5EjE=;
 b=lX/+b2zg4rhkIw5Z/+xT9Ch5Ya71MUJTNKRGvXJHOZdc/BnINjQuuCu78up7ZDGCXy
 uWEW5IV2/c9NF+BRVbSjxoX8p5xcdljLQ3nZeStgYpsGwjGP7Wn+cujXJpiCjseJrmvF
 HR1nar8b/K5/MRU1lEtpjnc1oIJMBkCC5wopuF0qiAQzJv4NG2SocZe5rp1hZtJT/zza
 Clym2w8u2rhuslqm8nuoGh97BRyGD2DOwVhTwAs4bsr6atTFStk4JYVBmPLYGDwNFF4/
 55RZiTGN3cDkabkx5LP2RXRwNNlknc8pLoZM8FhrU+bwAAoZCPvwWP2Wbmm7lqiwbYLY
 ENFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4w7jbWIdR4Lv9ty1UC5S9ImiUJDYrtVEy+Qo6+C5EjE=;
 b=LkMp+iY5AKttcGiotZ05ytoyXJVd8KKFuXNzKXmCzeWylbVj9Nb/Nln/GTdAJH4pSE
 WoGe13Zz5vSNyM871mPE7ACPBfQaF5U7K9ZYYDKB2AKEz1CJCztfvhboqum+r5Npxxrw
 6lsN/xKixOVcNZNc+8SDMaSRKUcL4bHm5iPw4upJV0+DuW48EY+95KKL2BXx9Ip9Jllg
 Pu9KWs2DJQDpYtVzh0+T6wg57fFFNiHkUtIv9QOQSiDSYAQiglhsCE694U9+tTDt+Vcy
 iMvq5EztaQodh1atlo4MQh4atrp/nRUqxzBxHe7TU4pRQdi+j7vpHIcJK2W4YMxEpqd3
 yhZA==
X-Gm-Message-State: ACrzQf3Y+YcDQtcx8bJMc82d/zIoJezjB4Y5W3iizeWtKy9eWdE3Q/nn
 1kZ9Cx5oOvYjwoV+vf15xHXrJWOGfYOjBHBFhXgnfg==
X-Google-Smtp-Source: AMsMyM6qDNNcgDHRXiSNEEWeMC1fI2sKx8OVTwW8E28mh+LQds1H2Whyod0ac7LGYLg3VGHCbR5lwvDvKqSgh1C7Y4w=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr5433591plb.60.1665158676584; Fri, 07
 Oct 2022 09:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-42-richard.henderson@linaro.org>
 <CAFEAcA-LhvMYbTTcsC+eAcAeA61e9Kq=zf6fKr5j_4dusuRDiw@mail.gmail.com>
In-Reply-To: <CAFEAcA-LhvMYbTTcsC+eAcAeA61e9Kq=zf6fKr5j_4dusuRDiw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 17:04:24 +0100
Message-ID: <CAFEAcA8Y3u5JN2V1fXSwssQ+TfMruf9WVe3j7c7_sWyJXGZAeA@mail.gmail.com>
Subject: Re: [PATCH v3 41/42] target/arm: Implement FEAT_HAFDBS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
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

On Fri, 7 Oct 2022 at 14:47, Peter Maydell <peter.maydell@linaro.org> wrote:
> Do we really need to go all the way back to restart_atomic_update?

> Are we allowed to do the access and dirty bit updates with separate
> atomic accesses?

I've just discovered that the latest revision of the Arm ARM (rev I.a)
is clearer on this -- R_SGJBL and I_YZSVV clearly say that we need to
go back to restart_atomic_update for dirty bit updates, and it's a
reasonable assumption that this is true also for atomic updates.
And R_PRHKD says you're permitted to do everything in one rmw,
which clearly implies that you're permitted also not to. And if
you restart the descriptor handling it's architecturally not
distinguishable whether you did one rmw or two. So both of these
are fine the way you have them in your patch.

thanks
-- PMM

