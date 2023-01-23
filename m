Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406E9677F70
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 16:18:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJyZr-0005KN-G4; Mon, 23 Jan 2023 10:17:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJyZk-0005JN-Py
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 10:17:36 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJyZj-0008PK-5F
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 10:17:36 -0500
Received: by mail-pf1-x42b.google.com with SMTP id a184so9003870pfa.9
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 07:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YH7Z/EDh5IQtzrl7QkgrQ4kqySm185HV8flLysOpi6o=;
 b=zSBxLtcl8w39nsZVhvDF0pzQz7pZXPStkCxYK9g4DbDs1TJ+tb6fz+QcBO4pz2iXjY
 lJzjoZQ336IMjmF1u0CJcyJTz9+nVEkoJquyZz4VDMG8ZJepuEqOOq8ZwzaAiZLXX5Ch
 h8FZrUsvYbOZb3+LFE8u5x6ZfSwHAD3jBVMJ+V97e1ZDiBlybek9/YTCzg6AhC5xpb1i
 hOsgLy2N5fwEmi4rdUvkmmfTQ7fYLWBVNUmgM4l16EgbA9PB1M2sIRJYJpHVsG9AGTPn
 bCJLCZBIjNY0JYHSRjHjUyxcwsJErhjnTiDNCiPfjUVqh/fdVnxJ6Jv53mFm4+UbOF08
 syWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YH7Z/EDh5IQtzrl7QkgrQ4kqySm185HV8flLysOpi6o=;
 b=YbIrsmUKvpS44l3he43HWPJ7DCgAhggVhPcarqGBK4NTYWPuB3I8z1YnSC4ViUWzX9
 4PTUYfPew0YzrfPadFf3F5TmBTfQMyZWTQqXs3r0QxDbRE4tfIYWhTPdEQ0WFhqq/9TF
 Y/O7lyD6L3m706BjVs2VRMILHLPiPhGmdiXE8nUo4XclAPH8MbHrC/0taUFrxXjkhrHw
 3tLQqRt7Xh3uVdRhOW15EVwibkx3CfUpwKSJYwYAy6xKq2d4D9CjFWYOwaXPGtPV0Zhp
 t/9gcCG/dHgzfwryWpf8sba5RwpCTv5X+sfetH9sybXx1XiCfjS7KlyylaUArEflCcUi
 24Rw==
X-Gm-Message-State: AFqh2kol+vRV87s4DPKXN7OGXitZ2HsrgqqSqI0w6banLSitC75jLO8w
 qpDOwHRLnJuY0iikUr355tmE+ty2lkqYWIHLLebIpGnm+geHAg==
X-Google-Smtp-Source: AMrXdXv8S3O66zaEXKE661AXNHQtQKvoW8PIvZq8f5TODC9zDuveBdabnqAEtJQ4WaFMoNquHOk55S0zxlEbbYT90tg=
X-Received: by 2002:a63:6dce:0:b0:4ce:2e45:1e4d with SMTP id
 i197-20020a636dce000000b004ce2e451e4dmr2125092pgc.211.1674487052941; Mon, 23
 Jan 2023 07:17:32 -0800 (PST)
MIME-Version: 1.0
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Jan 2023 15:17:21 +0000
Message-ID: <CAFEAcA97nQS8srfXNmAr1KXaOBC=nVYDvJi3F9G4SuM6YMNO=w@mail.gmail.com>
Subject: Re: [PULL 00/26] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 23 Jan 2023 at 13:35, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The following changes since commit 65cc5ccf06a74c98de73ec683d9a543baa302a12:
>
>   Merge tag 'pull-riscv-to-apply-20230120' of https://github.com/alistair23/qemu into staging (2023-01-20 16:17:56 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230123
>
> for you to fetch changes up to 3b07a936d3bfe97b07ddffcfbb532985a88033dd:
>
>   target/arm: Look up ARMCPRegInfo at runtime (2023-01-23 13:32:38 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * Widen cnthctl_el2 to uint64_t
>  * Unify checking for M Main Extension in MRS/MSR
>  * bitbang_i2c, versatile_i2c: code cleanups
>  * SME: refactor SME SM/ZA handling
>  * Fix physical address resolution for MTE
>  * Fix in_debug path in S1_ptw_translate
>  * Don't set EXC_RETURN.ES if Security Extension not present
>  * Implement DBGCLAIM registers
>  * Provide stubs for more external debug registers
>  * Look up ARMCPRegInfo at runtime, not translate time


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

