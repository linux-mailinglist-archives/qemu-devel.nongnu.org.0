Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91F8513264
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:23:50 +0200 (CEST)
Received: from localhost ([::1]:60328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2FR-0008Pj-VV
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1Zn-0001Xy-I3
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:40:50 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:36719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1Zm-0000wv-4F
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:40:47 -0400
Received: by mail-yb1-xb36.google.com with SMTP id f38so8274609ybi.3
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hERQzDBCd1Ng4+jsvLZqsGRLqV4cNx4t02wwVnfCuRI=;
 b=ul3JfaYBzdrUXT0bLGwndrEr5qOpu6LmQeTStFo+szB/u+0jeVgnlDS5MyhqaqPFWS
 OIWi7QH2ZKZdtJmQO5RIfgT6Xr8FslUFGTsjP3HaltqET5/s+oNn/ZGT6qWwX6bY9Kl6
 m6sv7/0Qe9kF52gGqRI3UWSK8zqKfJVqMBCIKEfms0VcA2K2aGFysvkCPT2qXHIWof9a
 CO4O8L89CQtroX4ft+YesbUqow98CPMSNW5TZC0rg2Sw6ybt0AGG6ICXK09698TwnJ+9
 SVijD2+Zo5ByWeOnp+pn9M0r6Cuj1gi0iXFS98msiI7u83zbnJvuCIbx67RSjK9rdXnf
 tGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hERQzDBCd1Ng4+jsvLZqsGRLqV4cNx4t02wwVnfCuRI=;
 b=A0Wd+IC0FFIW/vMC+IFkD1lUpaIiKPJFSixdm2l/qfr/PgMu68+uzjF4rLXQCsIjJy
 89QaFBcUnbZeXTgQybbMmqf+vxI2k+MYGUjC2qpx7hmJ8XfQ41sgSXz3Sp2YxOB7IYQf
 Aw3sAhiZFqt+Jf5MrmZJ1hJesJgtuQVaglBg7NA5LQKBJ6ZoKjtof6ohdw2VAY2QCSOg
 oTiQNmAsTxcMNRMFffQWDUXzFCTgR/VYEi9v27g41ZxKKkEFqgBGgnAItG7Jtl9XTLA8
 e78qWtlOxTH1/1fwf1np6s6LEYmfLCQspWXGbQSs8aNbH95BR/sAS8HmdiXk77IMjQOs
 k8ig==
X-Gm-Message-State: AOAM530DcmRRHdbXeItIm+Bt1FP0Ia6M2oLOcOD0z7I2RKvCrRQ6T4wz
 lgLTIoVuCXSChiJ483bUzv2mqYc8KsLrLH+MrT7r1w==
X-Google-Smtp-Source: ABdhPJyuW3zzAm/8oCJkXTKf9I29wispWQizxRBI1k8CKuoNOfHc2LeBTOVQcpho1G3CPkrFIVBknzfJ/TGHt3lecYo=
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr28236157yba.193.1651142443788; Thu, 28
 Apr 2022 03:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-37-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:40:32 +0100
Message-ID: <CAFEAcA8ND4skjTAJY3gPL9miOFdDi5DU96jtLEEVBUvjhjsuag@mail.gmail.com>
Subject: Re: [PATCH 36/47] target/arm: Use tcg_constant for trans_INDEX_*
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 17:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

