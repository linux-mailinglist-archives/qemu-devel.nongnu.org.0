Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202C6487A1E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 17:07:49 +0100 (CET)
Received: from localhost ([::1]:47950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5rmO-0005Mc-70
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 11:07:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5rd4-0004f2-KV
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 10:58:10 -0500
Received: from [2a00:1450:4864:20::430] (port=38748
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5rd3-0007t9-4R
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 10:58:10 -0500
Received: by mail-wr1-x430.google.com with SMTP id a5so7922461wrh.5
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 07:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4syfPp3cklBn9VRROsmx43lvL9a1ymULfDifrwYZLhc=;
 b=aAwQKSVfVO6fMxyms4u7x+wP7OPPcqjPDVCBXORiGOzsqKsBGIiyEP32gK5s8ZvGPZ
 bY3ADtVSCcgaUjMwi1Vgdgvn3TzrvQhWJjJDs1QmXGI93GO88DzxHvzx7KbPMB73Xrb5
 uQq9yj+8YHwGpluDZhZWJ8Y6ot2Zoq1D2WFWdJwEWux8jrRKevacIW7J51iOBqjyY1Q7
 CcDYGvWccuXn4bZmjpWX6SoHhVVkyW0f+Sv/pleG9neYtAWs7vjc1BIHIm3K1xijpUYj
 +yGXxxeTqEbOjeIqGh12TxfnHJaSSN184Xu/opRwPnsdyFDdxq4d+7LA2P+l28kWCxbE
 BN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4syfPp3cklBn9VRROsmx43lvL9a1ymULfDifrwYZLhc=;
 b=1DqdAj71CXBilIHGgJycL1yzWotMGOlZPt+0jZPKCyGX4lb3Axth/KZgULVP9i5rHo
 I4ywHZuaR6V4fy2d6bXk+4tcTSuZlj+ShYeaxL5Dbaukibar2uNMw+GzAIma6k/VC/O+
 k+264lLhZrnflU/8zwyr+GzDpcCCHBY7n2x5Kj5D1rt5Ah/U9uMcVzvHL61jBlHTIKFY
 aqqlG0u6Z4Qgxw4FicAjmVMP21pWK4v0LIbhZQayhusxkZdGoA/zJhpjGNv1n2u3a0b+
 JNvaE5Q5jeS2pfdt8kblkGKAQOfNGR4Q+Ekxa+6kPDu26EPSn4XGGKQHJ9D2gY8KSl7m
 YYjA==
X-Gm-Message-State: AOAM532VKdnk7xuZk0lydttB4Rb4ACtoJDfeOHiJnAzgMiMwJBnKjI9Z
 6VlK323a/sKjGv6CgJ2TDX+lVmXQDGA/kSeMt6/+iA==
X-Google-Smtp-Source: ABdhPJyxCFJA16HcgQqzz+TW7vqbIV0hDccbMsrq0NgSIa1VJj0ZP7vgT3I/rOaErflt5i/HsMv5Ip2fPLaO2d7OeEs=
X-Received: by 2002:a5d:6986:: with SMTP id g6mr3947317wru.172.1641571087849; 
 Fri, 07 Jan 2022 07:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
 <20211214110354.21816-9-francisco.iglesias@xilinx.com>
In-Reply-To: <20211214110354.21816-9-francisco.iglesias@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jan 2022 15:57:56 +0000
Message-ID: <CAFEAcA-nier8F5MZBNX2g=G+UKd=Cq5mKke7OuE2HZfh8=BzAQ@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] hw/arm/xlnx-versal: Connect the OSPI flash
 memory controller model
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Dec 2021 at 11:04, Francisco Iglesias
<francisco.iglesias@xilinx.com> wrote:
>
> Connect the OSPI flash memory controller model (including the source and
> destination DMA).
>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

