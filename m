Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1006544CD5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:00:58 +0200 (CEST)
Received: from localhost ([::1]:48548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHmT-00050F-Sy
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFZn-0007RF-G9
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:39:43 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:39371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFZl-000403-Im
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:39:43 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-3135519f95fso66284327b3.6
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 03:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KfSjvOus7yPuuhgYIjMWDB0BOnYSz1TNc7N+2olP1iE=;
 b=zqDG6xLOKrkJbID1ZDviyWwaqgtZZrSoDRcQF2GSSyIvXcGh5TM4ct4vKOOv1GTI6t
 488S/ZajdJwVc7vxQDPkIoQLtxMq+ro+0VZSXfDliMnKM1WQ5xkYA8yd5l5BXq1t3rS2
 OEGNy6eftslTGD91z7/3PGKzx+LUWJHsbjm3HW8cqTrw1hC+684ZofNedDpU/xX0Y97o
 JNdKO3uftoRfHSQCY20qoIQBsunq1SHmR2szx4G18wKtyNHMf0Bt+3JncYuf5NHMYeCt
 CPVbIgJUF6p1Ar7aa2v7G/AgmdcrTj/w3AShNRaypmC6mcvkiZsCkVDJg/kOUk1e+Vg2
 8Aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KfSjvOus7yPuuhgYIjMWDB0BOnYSz1TNc7N+2olP1iE=;
 b=p3vL3axNn9dT01jZb9QJ6VPC3uRA9JIpRkAV2+GVYxTUZVFlgSyBbyW7e1T8e/yEaw
 ugwlwtWkbbslel2mJCLMHfsEmPl5Ro2yOSLN1EMlv1R0m9wyjYVZH2Ezikvd7GFHSK2k
 teQGsUtT20Q0l1GoVMRqdVJZoC08sZTlF5TEiBJ7fnBVSl25f3cMV4tjC3PUUiPhIiE+
 D6ts/kS4eY11eiJPIeCnq8FT2HYNepic3nuiz538hMXp0iFu2SWRt/Cb43iBDi8yMATn
 lQk3/DB9fasQQeWjf0d33COfrYbX7L6FykYofUnecEmwjcNt7+boDDQV/Q9z6iN9sv+h
 s71g==
X-Gm-Message-State: AOAM532QZ2sHFL0bHZ0ZJAgyGKEdL8I8UFQZmAfzrKL3sN6m9pjbANiD
 iarjDk4JY/+Ol+CuktdhNVy7w3WZ2VaSj8Rn6YrVhA==
X-Google-Smtp-Source: ABdhPJwBFqcmLUj2Rowm8tCLuWj5fQe1Nb5wPGhhVLPCvYv+X4ceS/NoVzOLW7OUMbumD6q2I+Bwyj64hGf3nh6qhXE=
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr41001870ywc.329.1654771180505; Thu, 09
 Jun 2022 03:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220608023816.759426-1-richard.henderson@linaro.org>
 <20220608023816.759426-4-richard.henderson@linaro.org>
In-Reply-To: <20220608023816.759426-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 11:39:30 +0100
Message-ID: <CAFEAcA-Vgjaw2H2aJ7TLTkhM4VB8R4jYQGZhNPNSffBYbtn8pA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] target/nios2: Use semihosting/syscalls.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Wed, 8 Jun 2022 at 03:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This separates guest file descriptors from host file descriptors,
> and utilizes shared infrastructure for integration with gdbstub.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

The commit message presents this as just a no-behaviour-change
refactoring but it looks like the patch includes changes to
the errno semantics ?

thanks
-- PMM

