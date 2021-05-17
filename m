Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAAA3823A1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 07:06:45 +0200 (CEST)
Received: from localhost ([::1]:34196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liVSm-0004rI-8k
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 01:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liVS0-0004CP-Hc
 for qemu-devel@nongnu.org; Mon, 17 May 2021 01:05:57 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:36518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liVRy-0005GM-2f
 for qemu-devel@nongnu.org; Mon, 17 May 2021 01:05:55 -0400
Received: by mail-oi1-f176.google.com with SMTP id f184so5424137oig.3
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 22:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xroKUjNSOchhK2GjKP9QIWu4bp7F1NfGIy/HuiynffM=;
 b=QSF8BTwVnpRX/GR7p6G58YjnpbxkoIvh8Ez6dTepYPFbpHUDTq/oK8hmxhY8pNENlX
 AVj6oOJpIm3XD+PM1df/wC/n6yjDxhrcycZOvQbLLWdCPQodZs9QzUVfsT3wD9MI3oO3
 wNeHm3TCYhSPr+FzNGcUDpMEtTkm9jMjYailDvsVHD76tWZPmr5bsWgWoMI5LEzFMY5g
 eashPBUTuAP+3ENE5O2OdaLq6tz1/zSTSOqYZlMt1Xkp4mwzVPjUuHuyNdkVg3SgfXUz
 iZ5Nuf+jFlr73EzQY1ScqZnFpPdGFwddwN02+nlqR1YFU4I4/D+V4gONnsiRa2urdeA3
 4npQ==
X-Gm-Message-State: AOAM533luC7xfSQ3VbaS+n3SHErn8kiK8z8rS7UE7s6DcmQ4ypWAkpVb
 k2RB4k9BKhutCsZjKLG0h1AkdKjjF9zoIa2hCWk=
X-Google-Smtp-Source: ABdhPJyDVMP+2I6ozLBj7Fx0iTDKQet0zkjaY2L008ruMpPOH1b/I94BD2c42LBypZ4svk2R+aJ4hHMOgaLqra6k0SI=
X-Received: by 2002:aca:30cf:: with SMTP id
 w198mr14519021oiw.175.1621227952353; 
 Sun, 16 May 2021 22:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190114074855.16891-1-jcmvbkbc@gmail.com>
 <20190114074855.16891-8-jcmvbkbc@gmail.com>
In-Reply-To: <20190114074855.16891-8-jcmvbkbc@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe@mathieu-daude.net>
Date: Mon, 17 May 2021 07:05:41 +0200
Message-ID: <CAAdtpL5NoHLoUZR6MQKMg92h=Cm-Fqyc+zJvXz-GWqbtobyu2A@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 7/7] target/xtensa: move non-HELPER functions
 to helper.c
To: Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.167.176;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f176.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Max,

On Mon, Jan 14, 2019 at 8:52 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> Move remaining non-HELPER functions from op_helper.c to helper.c.
> No functional changes.
>
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  target/xtensa/helper.c    | 61 ++++++++++++++++++++++++++++++++++++++++++++---
>  target/xtensa/op_helper.c | 56 -------------------------------------------
>  2 files changed, 58 insertions(+), 59 deletions(-)

> +void xtensa_cpu_do_unaligned_access(CPUState *cs,
> +                                    vaddr addr, MMUAccessType access_type,
> +                                    int mmu_idx, uintptr_t retaddr)
> +{
> +    XtensaCPU *cpu = XTENSA_CPU(cs);
> +    CPUXtensaState *env = &cpu->env;
> +
> +    if (xtensa_option_enabled(env->config, XTENSA_OPTION_UNALIGNED_EXCEPTION) &&
> +        !xtensa_option_enabled(env->config, XTENSA_OPTION_HW_ALIGNMENT)) {

I know this is a simple code movement, but I wonder, what should
happen when there is
an unaligned fault and the options are disabled? Is this an impossible
case (unreachable)?

> +        cpu_restore_state(CPU(cpu), retaddr, true);
> +        HELPER(exception_cause_vaddr)(env,
> +                                      env->pc, LOAD_STORE_ALIGNMENT_CAUSE,
> +                                      addr);
> +    }
> +}

