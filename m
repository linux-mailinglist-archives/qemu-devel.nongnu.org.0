Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A7B5BED31
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 20:55:10 +0200 (CEST)
Received: from localhost ([::1]:45354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaiOj-00020w-Lt
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 14:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeBe-0003pC-AL
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:25:23 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:45873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeBa-0005P7-07
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:25:20 -0400
Received: by mail-ed1-x536.google.com with SMTP id m3so4059075eda.12
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 07:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=M+8L8SzZpemaKFlZyuhLb5GP7MSQidC3VDDSN/Ye0k8=;
 b=bJC03HEeDtp/TJHSfSsCUBf8eDhbNCvJ8UMlO+pVYqWf3B9s13jEjv2doYAE8CvhJM
 0H5k5vjz5660rc6r9KOhAkwgNuZtQQawJNmMfcCjsCwR62zv2W0FpRGG5vq0+dSCAtIU
 2fXn0fVVLH/2xWw7A3ZBdzbZSaUHmCt0dhK275GXRODonhDOG4Q75bHfnI3K+wcSEGbV
 9sMrG2p1NC4zs2gj4Y05ZL6xEFaFVtst6FqWSUd+/viy3rSKBzeheWNdQzVAKeuieoy0
 2QeFN9rq7u1+RdUzSWTRqiQ/1XEiYCHW1j/pCOX7tYjcEAvYTYLtmLpXMdM094WqA+Yy
 GvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=M+8L8SzZpemaKFlZyuhLb5GP7MSQidC3VDDSN/Ye0k8=;
 b=8Lk1lvgw0BgLo66vtkgT4lCAwoy/2zG+5E20e1HWQvpBKlQZsJFJJAKNXo7PvjGnGX
 lH2rbaL7BYj9EjXVsf+Agq/ls0WIBk34TVzVcPi3mMbnObgPg0FmYWvh1uDflZutMAjv
 qd3Sw+UspS8AaaaXK2+zG9o7tPOnm1dkoILdSeKPVh5j4RypCapxL7KjGCXl9FCzuzX0
 bcnRXEx/bBH6JqQL41BMfPLNlFeaLUtNPQcZPrQHlJxjAzqQ5fhwrztkXBd9STjDSQCu
 0zEHCJNPV8XK0VBCWsEScbIwFvBJ59E7u1kVoR/abakB8sVspBhnatQqBn+rt/brKSe3
 bnww==
X-Gm-Message-State: ACrzQf2XXhQJW+yW5r+M5PkC/XzDnBXtYuoj9LaOfn/wNm+XfcC5ZNQK
 5Ax3eUh4eETqw8Q2mv0nOCAm5bC25dRvx5eBDml3TgttA0U=
X-Google-Smtp-Source: AMsMyM72+7jrejDpYBRlKJT4ifIxfByCvUaQ3MJb90gAUUOeqsefxx/L+gICczIOHMZ0uMW7ysL0Le8tlXE6sn4MXnc=
X-Received: by 2002:a05:6402:2787:b0:451:d655:9269 with SMTP id
 b7-20020a056402278700b00451d6559269mr20380442ede.375.1663683915582; Tue, 20
 Sep 2022 07:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-5-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:25:03 +0100
Message-ID: <CAFEAcA8ViwDaXk-eVYyBtJTT2gw7odLJnxSH3JtBK4Yd1OYmrg@mail.gmail.com>
Subject: Re: [PATCH v2 04/66] target/arm: Use GetPhysAddrResult in
 get_phys_addr_v6
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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

On Mon, 22 Aug 2022 at 16:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 30 ++++++++++++++----------------
>  1 file changed, 14 insertions(+), 16 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

