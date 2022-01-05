Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C20484C99
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 03:56:54 +0100 (CET)
Received: from localhost ([::1]:54572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4wTt-0005i1-8H
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 21:56:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4wQj-0004mi-4z
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 21:53:37 -0500
Received: from [2607:f8b0:4864:20::1035] (port=53776
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4wQh-0005pi-Ao
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 21:53:36 -0500
Received: by mail-pj1-x1035.google.com with SMTP id m13so442017pji.3
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 18:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/mcDnzckIzQIz9pAgpCmqx6UCiZEi8TqofcoW8EL1hI=;
 b=JLhT2s4kLP/6Jpxn82CPTDa+J+2isCWA1l2zoYIH0bXidfo3X4n76K84tZM00tnfnE
 CTSQRAXRtVYWbMGvAwxX94r3GQeldbjUnumqz+aZ2sVbF5YW+BeUGFuRRTBr6Xm9pYKI
 usNv7/FVgntYxhp58Hc2xQ5xbGgU5KjgF5Ndnyj5wBAuxa7j97ptGK/pyXyKFyG4s2Wm
 yLH48j4XDWNkVcopiOxoKtmqsJdWO2kn0fiPNfxdTCZYezVTROFXXUY4YUzU4LS6iFgt
 r5dQMUilfiBKUg19bdtLSXu+Ag8Smu0weHo2D8Ep+WRDk3Gp8EwbEmutrxQVQ23Plx06
 Xx7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/mcDnzckIzQIz9pAgpCmqx6UCiZEi8TqofcoW8EL1hI=;
 b=3kzueJvafIvlQ0UMprtQuf74AHtL+qRkUcDwpRlZ1XTO6mT3Sqtbp643QjIarbi+DE
 s5jIy/TcziQjtnMgCRMtHB70V3UMJMcIHOBP6EYe+32WPMciyuw6Ru1pbpYOae2Sbmsa
 YFBNVAJhxcI+HDjW6YrdRgOiaVfLYeEwsSM2zg/bJiooyU2OEf5oi9YRNr8kHrasSi3o
 wdnhFnqRZNwXR9KVY0nIc1pOMFK8Tr4fiZXDaWz+qOqRcfsBKJp7HQRxDLtdvSCOQl3s
 seQZFuQwW4Pat08EgcDbp/Xi6eLIoeJPBuBsA/GOWaG7N4wzIVcpqkUwGbKJ0S+gTvoY
 tCNw==
X-Gm-Message-State: AOAM5321JsUYcnfWVbL3eWYci4338vRjVpFAPyeG8N4GSEL7RQjfzoD4
 hSacG7q+tRSMUneLYRFAjFIqbIvD6K/C3w==
X-Google-Smtp-Source: ABdhPJzaMz07PjSp0d45nKWYg88ZDbCdMLR86NYN9OwRbrz8bZqqGqKKz/UZ2lyhMYdzAe5unrd9WA==
X-Received: by 2002:a17:903:41c5:b0:148:a658:8d33 with SMTP id
 u5-20020a17090341c500b00148a6588d33mr51938791ple.153.1641351213640; 
 Tue, 04 Jan 2022 18:53:33 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id q2sm44558278pfu.66.2022.01.04.18.53.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 18:53:33 -0800 (PST)
Subject: Re: [PULL 0/4] tcg patch queue
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220105004054.587588-1-richard.henderson@linaro.org>
Message-ID: <0813aa61-8e8a-cc05-28a2-7afd3c6f89d4@linaro.org>
Date: Tue, 4 Jan 2022 18:53:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220105004054.587588-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

On 1/4/22 4:40 PM, Richard Henderson wrote:
> The following changes since commit 67e41fe0cfb62e6cdfa659f0155417d17e5274ea:
> 
>    Merge tag 'pull-ppc-20220104' of https://github.com/legoater/qemu into staging (2022-01-04 07:23:27 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220104
> 
> for you to fetch changes up to d7478d4229f0a2b2817a55487e6b17081099fae4:
> 
>    common-user: Fix tail calls to safe_syscall_set_errno_tail (2022-01-04 15:41:03 -0800)
> 
> ----------------------------------------------------------------
> Fix for safe_syscall_base.
> Fix for folding of vector add/sub.
> Fix build on loongarch64 with gcc 8.
> Remove decl for qemu_run_machine_init_done_notifiers.
> 
> ----------------------------------------------------------------
> Philippe Mathieu-Daudé (1):
>        linux-user: Fix trivial build error on loongarch64 hosts
> 
> Richard Henderson (2):
>        tcg/optimize: Fix folding of vector ops
>        common-user: Fix tail calls to safe_syscall_set_errno_tail
> 
> Xiaoyao Li (1):
>        sysemu: Cleanup qemu_run_machine_init_done_notifiers()
> 
>   include/sysemu/sysemu.h                    |  1 -
>   linux-user/host/loongarch64/host-signal.h  |  4 +--
>   tcg/optimize.c                             | 49 +++++++++++++++++++++++-------
>   common-user/host/i386/safe-syscall.inc.S   |  1 +
>   common-user/host/mips/safe-syscall.inc.S   |  1 +
>   common-user/host/x86_64/safe-syscall.inc.S |  1 +
>   6 files changed, 42 insertions(+), 15 deletions(-)

Applied.

r~


