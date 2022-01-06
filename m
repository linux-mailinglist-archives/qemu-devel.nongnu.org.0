Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D54486834
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 18:14:20 +0100 (CET)
Received: from localhost ([::1]:44052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5WLD-0003hD-Ie
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 12:14:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5WJc-0002H2-G9
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 12:12:41 -0500
Received: from [2a00:1450:4864:20::42a] (port=35708
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5WJa-0004oq-N1
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 12:12:39 -0500
Received: by mail-wr1-x42a.google.com with SMTP id e9so4591628wra.2
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 09:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=StgXQvORcJ4Z6gzB5bdMTTg68pZ84lrFD+qKNVNlRXA=;
 b=sAtu4mbTZ01a643Nn/eseFbTLLfm1Tj972iSv2PyT0kbRF7cgfqElD8z43kBeOx+T7
 sDpk4YI3qphXfY2kgFRQbaVXe5pw9aKbzkM/tVIgUQ2RIfdvGF+khM9j+POTtSN9qpCm
 g3JJsS2j4+wpvTyFDTZvgiDN7Zv6YSOiW8uCRZ4jdkZj9KUENTevfcoWyy3lgxSPzi/j
 IfHYCvQ1ISdZNVIBv1T20fqjs7RtaEv1viTt2J7VRc8C1azkiiSlNdyaR6BQu0RCDj7u
 q+QbRJFS/yuU/YiIAetgBJ7TULpufDJpwpw7fVNJtgwp+tnFY/9IVeDGak1e2u01aA4W
 NMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=StgXQvORcJ4Z6gzB5bdMTTg68pZ84lrFD+qKNVNlRXA=;
 b=MTVU1SfBt39VWb9p9G1vml0qlZZRziv7jOYNSkbejRVyNOXtMOZqNStL/C7CoyvZuq
 gm4FaVpIqQvxhMy8w4k+kPUFiR+5CjOfdexmyOpCotIud1UcY6C5iHvI1ZQz0rnUGRKq
 4B6I2x9SBZQ3P79SaCsnAAryR2RDIjWzo2+f5U0HjpfPMChfBSQQvbUjE38Ju+nnQCvt
 edJ/bAEOJ2RaDtN9+ebNwNwfsZypW2fD9h4AUadQvRdOh/Cym61n/VY2/I3jHRv8dbKu
 Sgr0tvcz1UQ0ecf/BvjhJLSpcvzkILCfIvbTRMU1FdN/nXZuqYl9GHpZ0GH+2bd6ofOU
 TVAQ==
X-Gm-Message-State: AOAM531d+hcAD5Fddf59DT55fSP2AVKHtKuggvrYMkq90xQqtsLCZ0Lb
 nJPUFnrPiwr7++ht6QVTatTBXm/ecmgLlp2hlRxbZA==
X-Google-Smtp-Source: ABdhPJzXwFjjliNcN1hYI/EaIYeCqeLSjLu33MTapW4oSUuAxOg9EHQIKp3JJWtUlowYQGpZryE1O0yoDNLhLHnvKjc=
X-Received: by 2002:a5d:6986:: with SMTP id g6mr387583wru.172.1641489156288;
 Thu, 06 Jan 2022 09:12:36 -0800 (PST)
MIME-Version: 1.0
References: <20211231103928.1455657-1-idan.horowitz@gmail.com>
In-Reply-To: <20211231103928.1455657-1-idan.horowitz@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 17:12:25 +0000
Message-ID: <CAFEAcA-gw6aZ0F3S1qAf=XNgH1iT+zyEvqoPp3AFQgTU4CvX7g@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Add missing FEAT_TLBIOS instructions
To: Idan Horowitz <idan.horowitz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 31 Dec 2021 at 10:40, Idan Horowitz <idan.horowitz@gmail.com> wrote:
>
> Some of the instructions added by the FEAT_TLBIOS extension were forgotten
> when the extension was originally added to QEMU.
>
> Fixes: 7113d618505b ("target/arm: Add support for FEAT_TLBIOS")
> Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
> --

Richard, you reviewed the original FEAT_TLBIOS patch -- could you
have a look at this one, please?

thanks
-- PMM

