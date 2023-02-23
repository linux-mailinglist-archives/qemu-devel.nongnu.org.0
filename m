Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1F86A0E42
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:55:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVEsV-0000EY-Hr; Thu, 23 Feb 2023 11:55:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEsB-0000DC-Hs
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:55:11 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEsA-0006fQ-2G
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:55:11 -0500
Received: by mail-pl1-x62b.google.com with SMTP id u14so9780948ple.7
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 08:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=whOjK8h13n4gJgWz9K0Se+3pOJ1nXPBF3L51qiyD8xI=;
 b=IBiGTDU/F2jarTNhP2dGYBSw3xFsXblsrOm3UbmB621TQ/lmHyIpTa4nkGGKDM9Abn
 2+QN73XEKNz4KWzwkPYP0P/J1aqn0lJrY9wRI4GiF9KjaN/2bkFNaFd4mjCVhQd5IiA+
 YwFN6amArUXJduubtdFSBx7hh4Jfs5zljHo2oKGE0tCOOZrBJxpTUJ/06eWs9zI/n+xy
 ef4F4SiFAYlIER6k6ePi+f2H1Jl7oEEDJVvhI0AlBJ0lfVN5MwVplzoWWOgD1D3iFdQZ
 0amm6IrsPb0wBhVFwbiWnXVOoG6VMa60i1v8sJLuCkdF24QB24maemOTFbOcEOa34Zty
 hPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=whOjK8h13n4gJgWz9K0Se+3pOJ1nXPBF3L51qiyD8xI=;
 b=BIaZRBTNXU+mnH/aDiyrqkpfsEImYZl5X0ahMbr+cyX/yBp10wBJqjAIl6Z5Rp3QYE
 L6Z3IMJd0/b/GqWZO4Jz5awY41jFlBE+DOrOpMY5A676gE9V688LbgLClZxaqflhURXZ
 gOgP9MXDooLFBg8w1MZjT+8gvgTyaimz1fpdDMVVucHf7ioY4E+kX7rm9E/z3f+PbcmS
 ZDLrkcH8tN2ABFkxLoWyH6BIFbgViLaLsUqtZvZ8uoXhFf/SGOlmt8x0NzFLOF58K5Fr
 ZZqT4o9PrjGeKSurVmK6SfkO4jWchX8GkFgBMfcqYv+MLlM7ugciXc/XJ4bD+3BZf9us
 Wfwg==
X-Gm-Message-State: AO0yUKWmiKExtcoIOZbofqd0LWfHg2llvgHfGAm8vAC1/XDb7EeWZBVk
 u4Q4rCSl7xOPSUnLK47tvUbQWHdzh9oaDRKUjNdRjA==
X-Google-Smtp-Source: AK7set+hfqxHk/6BI3XmNuW0razen1gO5POsjYyX/sXLspSlXZI8xAP6z3bauQw8potJpnV6qPI5qABcOCLaUe1ZPHw=
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1290279pjb.137.1677171308099; Thu, 23
 Feb 2023 08:55:08 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-15-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:54:57 +0000
Message-ID: <CAFEAcA9Mq4okDNYYe2WNV0cCZhRmLzFqZ6rKpn0Zhz-naL2J9Q@mail.gmail.com>
Subject: Re: [PATCH v1 14/19] target/arm: Check alignment in helper_mte_check
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 16 Feb 2023 at 03:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fixes a bug in that with SCTLR.A set, we should raise any
> alignment fault before raising any MTE check fault.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

