Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A5B65F125
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:30:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDT7H-0007IO-1B; Thu, 05 Jan 2023 11:29:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDT7F-0007I4-2I
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:29:17 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDT79-0005Gu-R4
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:29:16 -0500
Received: by mail-pf1-x434.google.com with SMTP id x26so19456805pfq.10
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lwmsUNXRKaG8fplXI0yPdzu+TteTZcW3Nf1F3E+eKx0=;
 b=tZafAriXD/1LhKxZlIAmas6kPSv1KZACnXs2nKV2DivA1dKwZp+rhuBJN9hznndAS/
 a/WtnflteASwb69jWYBNvZCUJcshD5vrCcmuH/qz89VEIh27T7FZExHHB3bRirnNTu/+
 8BvoMHNg7GGiYYqmrB+4ykdZizWUzz28xLUoC3TkuOKE9dgf7gcfc5QpH4jG+wd9UgVS
 MtC88b1Mmce7TP8TWvHCryfcBFmYx4jAOmEjqOVy7c7dQE2GrWfpGlDpRR9wx2VBjHdU
 aP66M2e3Xd/9gswUw3jBNt+ZwiCuy9aNhkaROIvOm8MYnVgDMsUsh683mYvCpfLUXLnD
 hYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lwmsUNXRKaG8fplXI0yPdzu+TteTZcW3Nf1F3E+eKx0=;
 b=4BYGeZYg1t3WRQGy5PH4Fqb4q4W/8AgSZaE6Xxcif3mlFLyOesc9xnPM36ysHINwPy
 kKyhcGsWFSM3PUbjpxmi7s4PqJ7VBclQW0BJTuruF9zLW19v0dSaZh9MFDCOxITDQeAM
 jPAOViMfswyfm2Yf45ca4b0Ndm/L9zbRMFQSoDyC8jSpE1fxfadgZn98ll1y0hW1hhzL
 fjr2Ov9cLQPFEP7W6zDadztaYbLzrOCU2G+qNEOGsMBIi10F9at0Yu9jsol9SLxlydtq
 yCwdqKrEcIrIQybm5acYhvJYXPCUhr9gQte/BjWtSAamxJOJVIxBKzQwCE3Eld3CvAEk
 2gug==
X-Gm-Message-State: AFqh2krZxuReTwRBRRigYMLddO+JU+r2doetpW5ShqD6g9Lczg8Ny1CO
 zzgysYMjwHHPg4qBoEGc/V8HTjMLoc6rb+nKmVczdw==
X-Google-Smtp-Source: AMrXdXuq996tR93STIvsNlKREvjeZM2vN6hVdc5cK87eDGcQ2QVvyBqRbmqIzVc+5ug6+U1Y8Abq2PSJ0uodWfPhZj4=
X-Received: by 2002:a65:694b:0:b0:477:86c1:640f with SMTP id
 w11-20020a65694b000000b0047786c1640fmr3406014pgq.231.1672936150164; Thu, 05
 Jan 2023 08:29:10 -0800 (PST)
MIME-Version: 1.0
References: <20230105162348.16725-1-tsimpson@quicinc.com>
In-Reply-To: <20230105162348.16725-1-tsimpson@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 16:28:59 +0000
Message-ID: <CAFEAcA8+fQ6nYHPAOhGcwtiw9HEvQ7w-bM9K7obaBcVG5ALWUA@mail.gmail.com>
Subject: Re: [PATCH] linux-test.c: Remove unused but set variable
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, 
 richard.henderson@linaro.org, philmd@linaro.org, ale@rev.ng, anjo@rev.ng, 
 bcain@quicinc.com, quic_mathbern@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x434.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 5 Jan 2023 at 16:24, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> Some versions of clang will warn on this with -Wall
> Then, it will be an error with -Werror

I think this has already been fixed by commit 2bc6c79417b89c3306.

thanks
-- PMM

