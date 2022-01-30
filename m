Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7244A398C
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 21:53:25 +0100 (CET)
Received: from localhost ([::1]:35100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEHCN-0001UQ-Di
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 15:53:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEHBJ-0000p7-5X
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 15:52:17 -0500
Received: from [2607:f8b0:4864:20::102d] (port=35643
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEHBH-00046K-P2
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 15:52:16 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 z14-20020a17090ab10e00b001b6175d4040so10512117pjq.0
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 12:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MfMiTUoQ4hq8nVGiuqcH7w/ak0lQKXjBK5D/5zkSr4U=;
 b=m4q+q8tm8pZLmgG8Xg6EQa0uvjnqt7wizde14qzSpLhv/aBB039A4MYTNb6fJve+tU
 aKgelAcV8CCnZNPJAtUfqUfApGruReKtv+4wrrhJqYsfLC+Da+TSrfjLLcpbOCDcZtBH
 6KUHka4rQB8S/KQ36ukToySWIk+7aJv7mULM12JZMUrQjEmPp4DeO0g6LoIUK74sKvTk
 sb5gxVew6+/fUTNpzPFpFioqMXKoVq0cMtm4/pKMRqjbRX1loYz22RpVQyPwF25Lvu0U
 wBspcXahCzNYSKlu9/V5waXXm2marM5xVbmtAeqRFsyu0NqDO6vfoCVyx6M0A5NOSRpD
 0h8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MfMiTUoQ4hq8nVGiuqcH7w/ak0lQKXjBK5D/5zkSr4U=;
 b=A8AllQj6nOXM+w0pLsCgBYdiUbm4tllq+BB+UXjD7YErrXSF9G+kiMZQkhSWhFh3gc
 OCYAPa/bvQxdSbJtv8SovaAxyIrfzzljs+DoXcpxQrNBPPHqaVwcCsPXbzOUZZEeeoED
 MVtXV4A0UwKSLcGkZgXFts0fk7i3daTeU14swFvo14ViHvjzBTmUXtrvmMRciaFoyArj
 Tqbvjpp8oMq6KDibmQ+iPkQuV2kmLXn+WYZyMsmnnMk6QWGWTdJVjjYk6L9ywQp5O52Y
 ZUXxWz3qSTtATY88WMOLfEGs1X8McuDyLUb7xQVSZRR+Ts7k8LmNMXQEUGP1ZtNQruEM
 Lwiw==
X-Gm-Message-State: AOAM530wt5C6jYMRFUSsGDMH9ykB7DNwO3yeO0OkdqsCBjXf3Mhk+4A0
 23veuifQm3Atvn4yUaHGbUziZA==
X-Google-Smtp-Source: ABdhPJzf5UgrUpfFneLGEB/nY0I8iJEfgkOQxzroWQMKXf7x5UvR6/UZ74vXCOn3RD6mE/I5lxH2fg==
X-Received: by 2002:a17:902:70ca:: with SMTP id
 l10mr18083525plt.121.1643575933595; 
 Sun, 30 Jan 2022 12:52:13 -0800 (PST)
Received: from [192.168.2.37] (240.194.168.125.sta.wbroadband.net.au.
 [125.168.194.240])
 by smtp.gmail.com with ESMTPSA id l4sm16492725pfu.90.2022.01.30.12.52.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 12:52:13 -0800 (PST)
Message-ID: <e152457f-5fe5-4221-5498-e1a94e8a12e5@linaro.org>
Date: Mon, 31 Jan 2022 07:52:06 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/7] target/riscv: refactor (anonymous struct)
 RISCVCPU.cfg into 'struct RISCVCPUConfig'
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20220128145642.1305416-1-philipp.tomsich@vrull.eu>
 <20220128145642.1305416-2-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220128145642.1305416-2-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/22 01:56, Philipp Tomsich wrote:
> +    struct RISCVCPUConfig cfg;

Coding style says use a typedef for the struct.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

