Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA136A9DA3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:26:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY9Ad-0003zb-Fe; Fri, 03 Mar 2023 12:26:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9Aa-0003eF-0Z
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:26:12 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9AX-0006IQ-5b
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:26:11 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so6040089pjn.1
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864367;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S9uqBI1Zh26IHskMoPNGumsZsFAQbQinLDpFlF6Dp0I=;
 b=d38dpnrs8WqNkins1f1QJfqvfcaUlzagzrHZK99psbsHrU1usZWagONjDa/vCx+vrI
 Z3qpWJVYY3AQn38XwcoN/khEyY2B+8hJXcTGOccalhlpR5GbTcIr0qysdk34py5yEzHR
 yjkMw+bYmX4+sQOT5Hs7gRpbEyHN4UbSy+QlKPw0uWbSvPRIFOXWlEuxoxmPQkVIYXDR
 YZAk26vkAjOG1ETA2I+KtU0Dtag6UNe2IqmHJYMH2I82Vh3X0TYoqRRP8L/pBkL2g+Iv
 VtH9QRsLicTBXpbwLWGE6RlXDRTAV7/kzCKrx08WJJOhxLwoldxlldGWeuNuo1OOrWB2
 7UYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864367;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S9uqBI1Zh26IHskMoPNGumsZsFAQbQinLDpFlF6Dp0I=;
 b=M8ZFbinwuTFRNiwt1XIfOH2oH94I48iArAxGjlixHkgJtV8BDLQX5M5Y0kaY61WxRc
 aYJn5E9cOgkdPWTwxk3uKGXRF+aOeQXW78RjLEjGRS1jzcjB8gwcQ5LunjnLTQv8My9Q
 9BGM/XbKPIdjj/2WR9zMNY1mRO2vbBdPI32AyEqRj9ezAEV79j4+hg6WE0szyaMx6nXo
 SgTsRRHxwQuQjQFQ4Xh5alO3cVoutJeg6Ph/I50HObynnuwjbqeKGDGLkl/kaSt9Hrhj
 RBgivrsrpReXgUDq7SYYdJJU5EAoyFozO+jukX3s3+6LvcV76XaW3P5cjNHxMzHTw29Z
 BTgw==
X-Gm-Message-State: AO0yUKWws1ZMfMT9cF3XOW+/elhKwHua6UghrjFjYNoLOP7b1YxIDLKT
 y12rDCpWSDdArS+1fIaMO+ira7SvvRs9y9s0l213Uw==
X-Google-Smtp-Source: AK7set9TIjiluVUzQQTFuowHaN6khgCIOpsh96YtGZrkLXaHfRzJ2jmkYgtKgjKdIe5In6ubQKFqIlUJTx6II/Evbm4=
X-Received: by 2002:a17:903:2581:b0:19a:8bc7:d814 with SMTP id
 jb1-20020a170903258100b0019a8bc7d814mr959880plb.13.1677864367594; Fri, 03 Mar
 2023 09:26:07 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-3-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:25:56 +0000
Message-ID: <CAFEAcA-LviR-aaG7XvmMOUXY8xhcZY-u6vUaFjDMr=C-UBPJxw@mail.gmail.com>
Subject: Re: [PATCH v2 02/76] accel/tcg: Remove translator_loop_temp_check
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
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

On Mon, 27 Feb 2023 at 05:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Finish removing tcg temp free accounting interfaces.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

