Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717E551304F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 11:49:48 +0200 (CEST)
Received: from localhost ([::1]:42508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk0mR-0004XH-E9
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 05:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0if-0001UB-4I
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:45:55 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:37000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0id-00083y-El
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:45:52 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2f16645872fso46535787b3.4
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 02:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XQd6GtMcW5Z+NxfF2QI49jMlMVszNx0Iscw1d3cN1Tw=;
 b=fj0351fvtIflN7wr3w+uUn0NYHIAcX0TPtJ6LryhaXHCcrJE7d0b8NmgQ/xOwMuyp1
 gW7/V8fmT2qPSPtD3PmL/vvpTAJYrHGmRrFLCxTOYO9f3ahp5HgnrxSBd+ac7CwdaEKY
 6+vdF4NXnOzcVynnIsI99M0NVCgZRkSOfBRRgNSo012r6En8TZu42rtJiQU+ZSTQlRwn
 B0OJbJv76Fw0ZnesJvn+NthIpbfY4O0xdHpWsU6DkYa1Rd1XRL6kQ/c36m8NiJ7VteYS
 tQL3yOuf3kJWM/qzBrQZAJP8Yc+WjrZ0LZHfpPT2HcgcQPE0l+wIyTfa9Ih/D8omByxW
 nUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XQd6GtMcW5Z+NxfF2QI49jMlMVszNx0Iscw1d3cN1Tw=;
 b=DJwP6mr9I7zN7O/0qOq31vuvRjWCy2za5g9cLvVBz3HqpEd+iBN6vfEj2ycR/zrmGx
 0irUSSC5M61iXNLhjnNKV0YinBoMvAIWWooFtSCeKYkkUtM+w2wdOuIzDfE2O8WOZL8A
 TXwy7xNQbdgEeliqDCwUlUUheloAB43TjZfqB820x/XNjtsubILz1OOzBSl6it9Sxa7l
 IMoYDW/SeqzPTA3CTzRZnQw6Nc4RBJe/y8QyhzVotowVZDZqbDK8ruX+PlDPqBZQYgeU
 nL2Xk070fehJutgKYLb/HxAIlzsTu00vv87tePoHz9sybR0pOT6EsJ/HCG7XAHaTRxIG
 O49Q==
X-Gm-Message-State: AOAM530Rr2ma83yyrxKQMa9RCX0DxMD3VFq9OI1kv2zfWwOxSZPdAE1+
 bcMRhprLuD5a3/wuDV341YOGXvKz+qCntlvr9jv8Mw==
X-Google-Smtp-Source: ABdhPJxJs2YzN4SHbiTHfmmmJWAzJR6QF6vtPZP75Rx3axf+8X7VH9csCnzIPpwCDkZ/OQOp6FFfWHgaLfNxZxiJIEs=
X-Received: by 2002:a81:6642:0:b0:2eb:c364:b8e1 with SMTP id
 a63-20020a816642000000b002ebc364b8e1mr31007869ywc.64.1651139149732; Thu, 28
 Apr 2022 02:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-11-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:45:38 +0100
Message-ID: <CAFEAcA_98i2evi6o94Q63ooqd_VN6CfkHbBw9XCfdDwXbahUsg@mail.gmail.com>
Subject: Re: [PATCH 10/47] target/arm: Use tcg_constant in disas_ldst_*
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 17:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

