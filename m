Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8976A092F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 13:59:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBA2-00006M-Ll; Thu, 23 Feb 2023 07:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVB9r-0007nB-7m
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:57:11 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVB9p-0000Zm-Hf
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:57:10 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 il18-20020a17090b165200b0023127b2d602so12139201pjb.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 04:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qsS8Yc8kW0bd71sSMCsJbWVclNaPIanNlIAb7UG93UA=;
 b=udwVlmvQhzpJxiabNVQh5PEIuP+xEZmL2FS+2KIO9DhDfVnomS9RArXaZVVeM/HS/P
 SHxOm+nmx/TxWXflZ9pRWyMpBhMvBoAObTPzllPUHrzrjz/ZLCA7azLCdYYc/kyoVqV7
 JiHf78fkfikKxsXB7VZx8rbTM5VMKO12HekMePauQB/owV2MPmpWZ9DX69Oi50Ag0eDj
 nit2YdzssLe40Z+2L75iU7zVUWw/dfps1qNKJ2cBcwMesbOgAqCJY2nh67EuRBS9zaRW
 uG3ExZpovISi/hBRxB3/tiaZE35MQ8V9BWxJ/MzZL9A6FyCGoes3g5ZUreJSF9CcxcgM
 3VMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qsS8Yc8kW0bd71sSMCsJbWVclNaPIanNlIAb7UG93UA=;
 b=c9OF5Kckfljf5s/7+O07JeBasVkd/WG1eBwer2nMrwSqaqqM+UsjqJpQhbifbFAklU
 5OIW4RShidCW4JfRmRKjFBlv+1XWC8k9QtULgZcZyGM4ajXn9nwQ0JiJm8mjbINRBxg+
 LdEN8KRl5iIasiyMMygM94iKrSX7z19ugdJrZwrjAtS+B6Db3CJ1yW1zsdbK7dVQqN8t
 t6dR0Lz8l1aoIGpXwVUeyB0SQNrBMFeWxWSN+vBPK4A9WVoxRGIKgLBRff+eyYkffdnk
 lFb4fJ3BFIibwfrodNA2A4qW4jNZ+OmHOUKZqZuMzpTAP7PRnCNxUwU1/EFYHgv/RlgO
 bIGA==
X-Gm-Message-State: AO0yUKUGw4AGJBPA5KS0+EpiKRfckiduFMi2Qy3lex3wGR6sJ5InpS4z
 V1z4sRHgTesF048Ee0h8nDUv5whWKq5MslpiVrEj4s8Ve1dUdA==
X-Google-Smtp-Source: AK7set8sUhWz/bluyNkmepC4/WqQli7ojQsUIab8biD/wtV7vqMa9QBjeayWJ9bQvphW4oUiUiP0tVSLQk/JHcDKrho=
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1071638pjb.137.1677157027752; Thu, 23
 Feb 2023 04:57:07 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 12:56:56 +0000
Message-ID: <CAFEAcA83u_ENxDj3GJKa-xv6eLJGJPr_9FRDKAqm3qACyhrTgg@mail.gmail.com>
Subject: out of CI pipeline minutes again
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
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

Hi; the project is out of gitlab CI pipeline minutes again.
In the absence of any other proposals, no more pull request
merges will happen til 1st March...

-- PMM

