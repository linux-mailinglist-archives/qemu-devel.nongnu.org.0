Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0939F6A1D66
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 15:26:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZ0N-0006gL-QI; Fri, 24 Feb 2023 09:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZ0J-0006fl-1z
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 09:24:55 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZ0G-0001mz-RF
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 09:24:54 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so627847pjp.2
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 06:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/f8wW6dAWFShgeRftMsyJqwr8xWqjzm/rOvZxNyG8Z4=;
 b=xjmLAzPyXdMUIqY31eJ4q0hLc80II1TeThOX6IHGRdobRsB5rbX3QNnQ3sqJooFxyc
 U8p+ELWEIFDJq6h1gpK0iKEb/c1KPLL7GpTz3x6iNEgmrTC/0MOtYp6wN1oBTNBl0t/N
 Fa+3IlFhsCwh43fDU8M7FggTg3WSK6DC4Dwk+XoAEKVL8Pz/zvbevxftj1xGKqLAmfUQ
 cBViESyPvC7cUkvFO4PEHDAFoiEqXLGYzCiTeUyp+Q6EAgPsjeMKdMVuTCPsvo6AbimE
 SZZBejbhcNUCZtFLweNHFvMhgH4Bu6KMCtXPNSlQra2JJagPlkpAUXyavmeG3WtLhhCM
 LtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/f8wW6dAWFShgeRftMsyJqwr8xWqjzm/rOvZxNyG8Z4=;
 b=Sl38N4FW64cOjhzwHLyiccafxGmtPcdvldNn5/WQSjxv2whRtB88oOURpQQyhffU5i
 +wqDJXYlWNtNoZpDM7fBpqc4yFiingSj2f4H6YUw+XKSRJAlXzfT5aJjPPRK2sBBqgoM
 74fcTcmuXso+qJwsocoZiL7Py7U+i6aHiCTmE+ckHR8yva07CjbJfB5cMVHFBhVZyda7
 Loed7Jmk7xvTMuoGpPaLtPuSDsEGfaZLgSYzoevDOOg38nKBhSRuQ7GG4kqZAW1MVIYQ
 ueAvUWsQACnRBwZTd2HdoU5nhwMI696jM0nF+oTWQGKXZzaVq6Ns/FOi23QfDmEqLfvg
 dB2Q==
X-Gm-Message-State: AO0yUKW3BFdyxCOvbTXdZZXPfjAl3zsBzXCWt6TMkgpT18W3etCXZYEz
 XlnfB2tf2nzv8v/28ubyHc/3RSiTWHYAMIhrH10Ebg==
X-Google-Smtp-Source: AK7set88MjUXh0Iz2gvwmZEEg101XhlFnuaZKm9uxw5IlfzevnYWtBPPJqkT6EnVwf2upirDc4BW7dakxJZCid7DHhU=
X-Received: by 2002:a17:903:2684:b0:19a:9580:7130 with SMTP id
 jf4-20020a170903268400b0019a95807130mr2987498plb.13.1677248691365; Fri, 24
 Feb 2023 06:24:51 -0800 (PST)
MIME-Version: 1.0
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-8-richard.henderson@linaro.org>
In-Reply-To: <20230222023336.915045-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 14:24:40 +0000
Message-ID: <CAFEAcA-fFbPhUCXrWHiQLxujuRY=Nn7BnS5P-Hs042syG_OpWw@mail.gmail.com>
Subject: Re: [PATCH v3 07/25] target/arm: SCR_EL3.NS may be RES1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
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

On Wed, 22 Feb 2023 at 02:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With RME, SEL2 must also be present to support secure state.
> The NS bit is RES1 if SEL2 is not present.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

