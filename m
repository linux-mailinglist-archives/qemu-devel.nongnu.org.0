Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2729E6F82D8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:23:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuT3-0005c0-Tc; Fri, 05 May 2023 08:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuT1-0005Yg-Tf
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:23:19 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuSy-0000oc-Br
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:23:19 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-50bc040c7b8so2614155a12.2
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 05:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683289393; x=1685881393;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IDXqtmR+rJjiu+55yNvHJbdVtRbZgI4HnSJOWQkinNk=;
 b=D//FcMX+uZlSpyRyAA9d7KkUZYSabHunNtNmSQP/o8FbrA9MMU7vsy8b9PZNnzdReR
 4YjKOEBbpP2krKY2ArWKgciEnhq7sbL0LUb2wqt/7LlgOQ+D7tPUF3g07Rxd7o6A1wpz
 XJK5pq5aus+xV0bkVhaf+fYGcnf2vTMcQRuxxAdyiffr4BIULXuPKu9JmqFcW9ljgUzH
 bmEO9BHssyj9o3YZjeKOB150RpU3b6kTnUufFc1SiOObJVzfrep82DhcL3vYC8cV8PYu
 hO5bcKFqhouEIaGPV0mDPkINeaFGCL8nKafY3NnmYF2r98RIykeDjLvVCPWhMz6qkvl4
 Hfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683289394; x=1685881394;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IDXqtmR+rJjiu+55yNvHJbdVtRbZgI4HnSJOWQkinNk=;
 b=UZpba5Sg4Ha7Yw+l6IGq3ZYIOpQYIg6azqLvqK3RPztJEdZAOwzlFQDYkoei4OEjxU
 EDASRrGCMa2cBUH9ru8o6rAYpI/oIiNhKNm89QqRhBZfeDvD4+xziAV0eZ4LEHKQYB5c
 z145TbrcnoumWD6+Asry+Dwf5+/dxKqBPqBAOF7OJCwosCY0aSVt68kPks+NFDqZ9W8+
 wvRavc265S2blWvvm67cqX8ybWOyGTZztwCIZNBP62RgZf6chs3G5SpcT/staMdCQ3mq
 ICqclCMunx9QJZKC4RTZqK1Q6Ih9uQKb/7k8JreZhu8vwTlINyOvXTfS7IC7EVqt++yb
 w4YQ==
X-Gm-Message-State: AC+VfDxWMMW6NA2+jvxShFJfhhxbV/UV/tod2/DrTMbMxp3/1zb9zgA8
 gfhbMjApwuEP5WXLgEQwGI5TU9Spovass4U+M8S52g==
X-Google-Smtp-Source: ACHHUZ4QM5829CP1KjFMCMuPoE1z40BIt9dxNrUxYU/rE6gRzlr4oVW9MVv7dM4ps8nd9ls/b+awDoSiVOhajhY7mWo=
X-Received: by 2002:a50:fe8c:0:b0:506:ba8d:c317 with SMTP id
 d12-20020a50fe8c000000b00506ba8dc317mr1176747edt.40.1683289393705; Fri, 05
 May 2023 05:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-34-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:23:03 +0100
Message-ID: <CAFEAcA_yDGUbcHZskE_gMtPsMU3ohsNCo_=3ZakUubZMVqXM0A@mail.gmail.com>
Subject: Re: [PATCH v4 33/57] tcg/sparc64: Split out tcg_out_movi_s32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 at 08:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc64/tcg-target.c.inc | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

