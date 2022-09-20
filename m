Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CADF5BEEC8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 22:52:35 +0200 (CEST)
Received: from localhost ([::1]:55006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakEM-0004CS-1w
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 16:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafVk-0007pU-Q4
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:50:13 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:34590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafVi-0003TE-PT
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:50:12 -0400
Received: by mail-ej1-x633.google.com with SMTP id y3so7270369ejc.1
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 08:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ssM9+aX31tyZon3JtI3Oed1n4xMIJ1QIEQdSqlyk1jM=;
 b=WYrqZNV2Ust7zkVmktWhbKDqebe6sLnUyQArpdUgPEo0OH1Y4VOj+zoWurDppZsF1F
 g9qbt6TkylgNrppdKJno6rtIRztviw7MFYcN3OOYiPyTn3nMZj/L41ylh3ktFXPswB64
 qiE+CFRe60U93Ml+e6Bj31DP0LNW/Jm+iOqF81kGBGHzQQHcr9WmUniaP/RTSGDoSEng
 /PLNnUS0/wzItVmALzd6WfsuHZR2Vy9KAeH118wolaR+utUyKTpWxfu6LrQAJDdYLFG4
 aM4y/eWYqa54ih5azXzYN/Aaj+TYte4iJzBoyT9h4JYg1fMPDWk1z1qAL2n/Vt2uPvai
 EKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ssM9+aX31tyZon3JtI3Oed1n4xMIJ1QIEQdSqlyk1jM=;
 b=jrCWaZP/XhoVdvAovMHsu83bscLkDaIkriJp/+60KQCPJb+828NjDGFnzKiDuG95MA
 AfFuLLlYYNLiTS0voJZGCV8OFTKZqjB3V41ihQrMoPMlmKVzbkF/9WIw0M2b/is0W6PY
 s7VXNopX218M/GBpk2MwFyZtu1v+cbFcLJ+qL6vmPEib5s3TyQBXAs4sV6V8TYqQbkYP
 Uzu6kNerm96LG0/IaAHDV5Y4OZNchBG/+uRT08xMdljY0rKIYah2qIe1mkKRwL+l2PAB
 ktu36UAtLuRgujUu4Az6WZ/7I7ff0DvlJ7HgCg7xDEnCj7ALmNlsEvqDKy3WXGLHGgyx
 MjjQ==
X-Gm-Message-State: ACrzQf3h+gkgK5ai/lRMhg9d8gtjAnGBJ4iOBsJbot5lviiTcfjaRC8I
 SlQ+0pUI1i0Qo8d03dCO8+lqMup2SUlnf76FWOif4A==
X-Google-Smtp-Source: AMsMyM4jFHc16roT1svP22YT7ZyBaNUL4WqvRs0gbVHFCh6/UoVTI4D55bjuHOvkkskdSnwYdXkZ+X1G1Y5AMXev/VA=
X-Received: by 2002:a17:907:7209:b0:778:e86e:568 with SMTP id
 dr9-20020a170907720900b00778e86e0568mr18014326ejc.659.1663689008570; Tue, 20
 Sep 2022 08:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-29-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 16:49:56 +0100
Message-ID: <CAFEAcA8AwN4tpEPLrLh=47VKN_J9wgADvihy0nfX6X-cMh4ymA@mail.gmail.com>
Subject: Re: [PATCH v2 28/66] target/arm: Drop secure check for HCR.TGE vs
 SCTLR_EL1.M
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Aug 2022 at 16:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The effect of TGE does not only apply to non-secure state,
> now that Secure EL2 exists.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

