Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC394D148B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 11:16:50 +0100 (CET)
Received: from localhost ([::1]:34390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRWtc-0000KU-Jf
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 05:16:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWs5-0007Cp-2v
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:15:13 -0500
Received: from [2607:f8b0:4864:20::b31] (port=38517
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWs2-0000kE-Sw
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:15:12 -0500
Received: by mail-yb1-xb31.google.com with SMTP id u3so36743108ybh.5
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 02:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Yss/VJFwm5khnJagMnoEiRz/27BPGpiki+5HRz3nrs=;
 b=hWkVnlMA8hsfrMYBG2Wk52pCt2OCEQIJlGAfd+qAirhBRphBrNfYdmH9w6dp0uEZjt
 v0uBz35/MYNJ7Onb/a9CS7O1k9zREOdWSOc1szfEcF6yvtN9Ho6FQxszLA3Y0CuufeP4
 Yo96hja94Z3IAnR05ZnufRkaU2dUsj+qbIriyyJv22gVS62OHmor13eNHoWSddYIUksQ
 tgY3Fi0j905fP+3sMSIfkTKleqqhIyJ+17Nuu0hh/GkS57xjksbpuxsz3dGG+nwaLPns
 ZX/vFCj0RiDasrl9ClN6OgoieTcqT8mv0iwyymvcqq8NIv+pzxVco0zmSjosorc8BsE1
 1QUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Yss/VJFwm5khnJagMnoEiRz/27BPGpiki+5HRz3nrs=;
 b=gEC4VIFTK77WJAAaUSe2gDbSVMa8iM1nDapcExe8B6XGKtB8a12a7eV7l20skxhxmy
 4iIyaV7f/MKfKYluquSYtUc1zrf+6PHqww7QMXmKK3yuskAHcCkwqvL+9BMTGuVtujyd
 Z4j/O7Fqbrvp21p+l//HKbGgEutQ7p3NXpgKzvn7OBSJPjilIDxackGXNAlqIJWZL1ed
 9BTaSnVj/9kS2+zaMJ4hzCjnVqFCb2QuDJEwg2bU0bE1cuntEOOaydcN5G1yWFBVgOjH
 Y6tdQO/s/UMrS8Kks2xBrbFVIc05Z2iI1ooENVAriQ3DIDgpirTT/Rv5mhbTWL9qPIeO
 Tthg==
X-Gm-Message-State: AOAM530gjvF99EHS9ESDt13m7hJQMuAR4QHicNlDDqsPgkNSCMICQ9X9
 1IdSieE8JDEW3hCUpGi/DPZvFmaCq85ELJeYPaNNUQ==
X-Google-Smtp-Source: ABdhPJx1d0e4EWeZN8FOYu5ZOisXxmgzCZh54+rQ+JCgqu7zEp3yUmjoSZfHhOMdtZPgVgur3WC4B3YteRA0gcp56x0=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr11679627ybq.479.1646734509427; Tue, 08
 Mar 2022 02:15:09 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-14-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 10:14:58 +0000
Message-ID: <CAFEAcA9sAjiDq0ZmYu3B-ZiZ_C5uOZZh1EJDCNqtPGxL5GTJ_w@mail.gmail.com>
Subject: Re: [PATCH v4 13/33] target/nios2: Use hw/registerfields.h for
 CR_TLBADDR fields
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 07:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

