Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58EB669C8B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:37:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGLoh-0007yi-JR; Fri, 13 Jan 2023 10:18:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGLoK-0007ck-Hi
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:17:41 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGLoI-0008Ce-L4
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:17:40 -0500
Received: by mail-pj1-x1030.google.com with SMTP id dw9so21311271pjb.5
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F41paSGwFj3i4+80GCQcLBnU3OhUeS3cSyCyGXO29cg=;
 b=bB2yul8kzQmttsLRjzsg4sKsmWJiEvXcSNehtXAVT4IhyJuKI+Q5w+LsxNJutSqpxX
 OdD/NLYtOZ4oSLmoayiAA6+A/Mm1SH7W1/0vEe6Vj8vIPAkYdT6DX5EPV5sEGrIxOF1n
 M6T8j7YFH0kqwXQgGQ0vn/QoMnmszjYij14cWEjtnBbIME3390SQyaAPQ8HXs/MCaKRV
 xnrKmJNU9AzJpBxqT/hGNrc0CE1xNUc5lA1N8f0tRJz524tiAazU4UAH7YgEaj6Fwd+V
 m5wyY6JjQAovXLlzb/axYRQ/st+D4Q9Egc6So1H5SJUXMCmSZXz6ZPZxxzehDfHPLh13
 6Fng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F41paSGwFj3i4+80GCQcLBnU3OhUeS3cSyCyGXO29cg=;
 b=HG+UZvKjNNVsR1q9oGJJqMPkdkoWQj8eKiCG3W9xQfJcbjYHRqY19i1kiHJMZvpXWF
 T+T8QhoFAnk+5BWUjxABK1lQlmthA2Ao78fFx5qj+1Qv3QDPxAv80oobNc8+MQJPIIz/
 begUEfYDSrjc7LxGpvVgVa6Kpc5l4dazeVpW1T9sZx7dXyWGKjbDCPyQRLh5mlaWGpjG
 FrNYgjaWcdZGqI/rpknwm2J+fghRMl6XvnFMoLUE2/Y/rKvm+SD5m7G8M51guSDpftT3
 gQvFtH+w1wy6ZZesVH0PL5KCNLZsdm4XT5Zem7n6ZYLU6xzf+Ycj3U92vQYDlNc4BRn4
 M1yQ==
X-Gm-Message-State: AFqh2kqjwyeBonmLnqZTPCFh5eVKZj2zasY5uGQBrNxSx555gg0js8R+
 h0qKri//PI112URXGmFHKpgK9btOc5q6PbjiuTy8tg==
X-Google-Smtp-Source: AMrXdXsjusIW6xLLdvQamFdBrrLfV88MlrnqMLbaol6MLjlQQZh1Kqxzd5Ul0azj5lOgNzTVqmkXl4F8/mzSVU5z7AI=
X-Received: by 2002:a17:902:b611:b0:189:a5b9:4838 with SMTP id
 b17-20020a170902b61100b00189a5b94838mr4750059pls.104.1673623054472; Fri, 13
 Jan 2023 07:17:34 -0800 (PST)
MIME-Version: 1.0
References: <20221224151821.464455-1-richard.henderson@linaro.org>
 <20221224151821.464455-5-richard.henderson@linaro.org>
In-Reply-To: <20221224151821.464455-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jan 2023 15:17:22 +0000
Message-ID: <CAFEAcA_viCsMxSjcpFtxL+hj-n5TTff0npg1RjOnLUpwGu47DA@mail.gmail.com>
Subject: Re: [PATCH 4/4] tests/tcg/multiarch: add vma-pthread.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, iii@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1030.google.com
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

On Sat, 24 Dec 2022 at 15:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Ilya Leoshkevich <iii@linux.ibm.com>
>
> Add a test that locklessly changes and exercises page protection bits
> from various threads. This helps catch race conditions in the VMA
> handling.
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Message-Id: <20221223120252.513319-1-iii@linux.ibm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

I've noticed that this newly added vma-pthread test seems to
be flaky. Here's an example from a clang-user job:
https://gitlab.com/qemu-project/qemu/-/jobs/3600385176

TEST vma-pthread-with-libbb.so on aarch64
fail indirect write 0x5500b1eff0 (Bad address)
timeout: the monitored command dumped core
Aborted
make[1]: *** [Makefile:173: run-plugin-vma-pthread-with-libbb.so] Error 134

and another from a few days earlier:
https://gitlab.com/qemu-project/qemu/-/jobs/3572970612

TEST vma-pthread-with-libsyscall.so on s390x
fail indirect read 0x4000999000 (Bad address)
timeout: the monitored command dumped core
Aborted
make[1]: *** [Makefile:173: run-plugin-vma-pthread-with-libsyscall.so] Error 134

thanks
-- PMM

