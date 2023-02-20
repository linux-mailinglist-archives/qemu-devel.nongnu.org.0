Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E1069D13A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 17:19:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU8sO-0002it-4j; Mon, 20 Feb 2023 11:18:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU8sL-0002i8-Gs
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 11:18:49 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU8sI-0001BL-Mb
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 11:18:49 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso2052316pjb.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 08:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ImTxngVS6KmYoQdJQ80fW021PSXRBcVh2PjUhWpEIGM=;
 b=sl+eTtlusNMCyQ+eO+0JCyBVIWsRDcIIiPcmiuPf2ZQYnMYbKX03oYYHKr34ac0wAU
 F4jE2KUZaECIZh5De+D3XkMv95x3fFM0Nnoy5RqY3+jNM/KcmHsb+eB8KuGrCnELmhvL
 JXP7hrEVtFrttky0ZkAkA9aALtwFYj4I/s3PVSq8dob1rijXYjdWOsTB+aBWADJ2/XZ6
 JXP+bh7FQzGQ9ZlpYoNH2Yh5p08Cryd9NNVJ0YvK4cbwrubLmQyY3zQJ05RGNSpTpntP
 OaAaUJ5tYWNl0E987rgK0TFfICuy2GL8PB+VTUjnkoOdTU1BrA2mrF/Dc9g8HiAkxyVc
 0OsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ImTxngVS6KmYoQdJQ80fW021PSXRBcVh2PjUhWpEIGM=;
 b=6iCDYT0YtZsaIy4RLFr1EE0n0RUetLCx/jhEvfoEeHYY3whWAAHUlT4No2S4sAHeEu
 K3S9BiDQI2DRGJneD+A+Y5ABjFMe9Cy9Jady8qA1I9gSWWZtdDKMH9AyoCNyWuidjwsQ
 IXSgS8YjZ1GLnjDiXaaxWBXKc/xsLFIDLLdmjQNO3SXOpURO7eVhODCsXeesu2GTeOba
 yTT/Hmnc8OHGtIsSiyoXjFwkuYUtnqern8ihMO53f2OGtsBIBz1/Ldc41x1XvemCOK1o
 tqcxcQrm9QPpP3FsrySx3qDXEIbxEpTpnhqmfFVW86tYWypVXboqOSN99Y4W8m3yPNFW
 Jq2g==
X-Gm-Message-State: AO0yUKW2bYDeUGPML3GqWkbM8Ltp+fjLyAR3kxT3hnC2OH94VEnYzIo/
 +B8W9iu800UobkPKKR6bt/rx9FebDl1b4SHIEC14TQ==
X-Google-Smtp-Source: AK7set9jWPoAoP0WQcxnxSQuWwMrum9MuzX40S42MtHp/5sFPU8lBShafftoN9mre2H4odSSLbd+WbF4iRJxLkjYRjw=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1000359pjb.92.1676909919317; Mon, 20
 Feb 2023 08:18:39 -0800 (PST)
MIME-Version: 1.0
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-8-richard.henderson@linaro.org>
In-Reply-To: <20230214163048.903964-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 16:18:28 +0000
Message-ID: <CAFEAcA_m=8fT1fKXhgMH_v6S7UoOeDwokjNO9QH6GdCO6fGT2w@mail.gmail.com>
Subject: Re: [PATCH 07/14] target/arm: Fix svep width in
 arm_gen_dynamic_svereg_xml
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
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

On Tue, 14 Feb 2023 at 16:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Define svep based on the size of the predicates,
> not the primary vector registers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

