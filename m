Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25B068DBA7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:34:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPP3K-0003pR-UN; Tue, 07 Feb 2023 09:34:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPP3I-0003oh-55
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:34:32 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPP3G-00088c-Kv
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:34:31 -0500
Received: by mail-pj1-x1031.google.com with SMTP id d2so11508957pjd.5
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fgyO/Nbv99Si2C5XaM4U2ruXGJqXvpH0ymdkNd7I7U8=;
 b=IEpe4PkvGPMNhxZfZcTN/dAl/O987zrMDthYY9oyI0/nuSvTrCzIQZmvCYohunAxL1
 eBPJWsywxMLCgHCi9Qub+00WwINzBxweFxafaFVVmqn7eOhmRyVrkIV3Le3A8VRwAoQ7
 x5Iakx0XGohEhY1x7y6kOIotn70hl3JfMmfRagfIyP1qHRGPWOL3hg0jDQw575nPW17C
 iFrEB4HFtJTS0mWLgUOUE5kA+6m81Yi9uTS45+RogW08Oj/+QjpXOAZc2Rx4oDZKnab4
 dpHESSMEasTufxfqz0TEFsl0jXZoq4eIzYdxkX14IxP3aOBciz42njrUqE2xkQZ3xWji
 7bLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fgyO/Nbv99Si2C5XaM4U2ruXGJqXvpH0ymdkNd7I7U8=;
 b=rMEhu9pzh7aTH+7GdeelXQMx/LYfnFmJ/1KWUpwRHOzuxMMmN+Tp+ZdSpA10RirNlN
 KuOdR4gcoziCPzt4BQEQUe2AJ6QmeR/yf/GhsydDVULx180+hKR288Lue8RJ5pB5qcjc
 0P1gpwtCcOg/x3LLPb0N7Jt69V+z9EcCj2MYEPHbnMuFV7kCH/x7/DJSaLC22puv4ESt
 nig99agF2f0zcH5ZAmkYUk4OheADZqSzqj6aJUUg0hcVBtzqAhbu6oerYEltxWB+PMiR
 da5watTmYppqGkp0yk9Pzqx18pdAOuzMCpgtTsyII7PBwynlVK/Ano0FgHbuQb7J3JkE
 XMcg==
X-Gm-Message-State: AO0yUKX75+yXA8ByEulU8HiN+Trh/ksSH1G3/TNYXjVT2UfvO/hEP+Cf
 bRS1EYHOINV/mgX9vF3CQM5Aklee36YJnA0fQVFi/w==
X-Google-Smtp-Source: AK7set9CHmxPmbCidSh6Szfdj8uCpF4Du9dvWP1TOuMOsMfn9hzR8G/ftOssrNzd98qf2uDdWiIJRUIMnZ6e0vAB1/o=
X-Received: by 2002:a17:90a:a38d:b0:230:81fc:db1b with SMTP id
 x13-20020a17090aa38d00b0023081fcdb1bmr2888914pjp.89.1675780469178; Tue, 07
 Feb 2023 06:34:29 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-5-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 14:34:18 +0000
Message-ID: <CAFEAcA_6dwB9ygO-kr9vaGTH=wNavZoQpunxWQ4Nt715Y49NGg@mail.gmail.com>
Subject: Re: [PATCH 04/22] target/arm: Update SCR and HCR for RME
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
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

On Tue, 24 Jan 2023 at 00:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Define the missing SCR and HCR bits, allow SCR_NSE and {SCR,HCR}_GPF
> to be set, and invalidate TLBs when NSE changes.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

