Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D8D5330B0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 20:50:38 +0200 (CEST)
Received: from localhost ([::1]:32782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntZc5-0005lM-4T
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 14:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ntZWO-0003Ra-St; Tue, 24 May 2022 14:44:44 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:41621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ntZWM-0002NP-T3; Tue, 24 May 2022 14:44:44 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 g13-20020a9d6b0d000000b0060b13026e0dso4737073otp.8; 
 Tue, 24 May 2022 11:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LTki0oiFfX5Y0u3+6vpg0CBg7zwW7yJCMVCkFwaia2c=;
 b=Qkg6e2RmH8Vh1eE4k+gHDc0yoV+UW1OXuKd1rXV0p7b50P8R03SpsqjKkIifwDJy8m
 UnYfssjKJ3YkU2fvTgaPBXBXhzI5QeuLmgOHcGRITfG+iSAWfWgqrnA6tSdW5YNgZWad
 l9qIYAcCeYtmy0WNWp+DumrADTmaKUy8MSE2cRFoO0jqNs2BIRFJWq5MaXyhUnCTzz6G
 kSpjJGf86S8Iww9uLGvw5uhiH+7BSvpgOVc4YtZD4LekuDKCPPzxaXrI+oT1FVKnlM65
 PBqzJNx9DvMWvXTtWdCV5NxZmb7bIyLD2srd/oPfGkWIOWTmYjTx27QAFFwsR/YHeAzo
 am0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LTki0oiFfX5Y0u3+6vpg0CBg7zwW7yJCMVCkFwaia2c=;
 b=6h/If0hb8ec2nVdNaD+NMaG7ktK++sI8lMOjAbBYLQ26lZN6mkQJN/yJRn0bHJXP/S
 6qxFs23y5212eriMui8/SiXyZnpvgkKz6hhedbniX3KSS1ASeYO7IKnDl6Fz5BiL/WoC
 Ih1GJQ75vL+z04BJIHa0v6FVj9rjkxCuXSpl7iM12bs/13GZiw2R/VYtz/+B5hNnKWB7
 py2U6z1i+nv1HMuTcTRLf55/ZV+cXAXvqcIYCh6k4Oz6YscOfNiPNePx6qfta0Uq8CMi
 ci5XPSn6tUd67RVgqmJ0vLzl3u3tXp5SK6qAFkI0BlEMBL9z58EVFQJH6YPMVj+sm2WV
 j6MQ==
X-Gm-Message-State: AOAM530+Up4/Ctwkz456QNRVEfh9l+djs7vq0o1edOxD3RZV5L32H3Tt
 a+itWYVoZHsIglK1AOFiMDs=
X-Google-Smtp-Source: ABdhPJy4yqDhBGXlVCFGcQZpWOexcd6xGTLry9tvG8qrgJb40WkYorGLXkgLuJyJmu4we6hsQtJcKg==
X-Received: by 2002:a05:6830:43a2:b0:606:5d3d:be31 with SMTP id
 s34-20020a05683043a200b006065d3dbe31mr11491622otv.111.1653417881177; 
 Tue, 24 May 2022 11:44:41 -0700 (PDT)
Received: from [192.168.10.102] (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 d130-20020a4a5288000000b0035eb4e5a6besm5702442oob.20.2022.05.24.11.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 11:44:40 -0700 (PDT)
Message-ID: <bfc23a3b-ddc7-51bb-0aef-e2b197c9259a@gmail.com>
Date: Tue, 24 May 2022 15:44:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 0/8] VSX MMA Implementation
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <clg@kaod.org>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20220524140537.27451-1-lucas.araujo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220524140537.27451-1-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 5/24/22 11:05, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
> 
> Based-on: https://gitlab.com/danielhb/qemu/-/tree/ppc-next
> 
> This patch series is a patch series of the Matrix-Multiply Assist (MMA)
> instructions implementation from the PowerISA 3.1
> 
> This patch series was created based on Victor's target/ppc: Fix FPSCR.FI
> bit patch series changes as that series changed do_check_float_status,
> which is called by the GER helper functions.
> 
> These and the VDIV/VMOD implementation are the last new PowerISA 3.1
> instructions left to be implemented.
> 
> The XVFGER instructions accumulate the exception status and at the end
> set the FPSCR and take a Program interrupt on a trap-enabled exception,
> previous versions were based on Victor's rework of FPU exceptions, but
> as that patch was rejected this version worked around the fact that
> OX/UX/XX and invalid instructions were handled in different functions
> by disabling all enable bits then re-enabling them and calling the mtfsf
> deferred exception helper.
> 
> v6 changes:
>      - Rebased on ppc-next
>      - Wrapped lines to stay <= 80 characters
> 
> v5 changes:
>      - Changed VSXGER16 accumulation to negate the multiplication and
>        accumulation in independent if's (if necessary) and sum their
>        values.
> 
> v4 changes:
>      - Changed VSXGER16 accumulation to always use float32_sum and negate
>        the elements according to the type of accumulation
> 
> v3 changes:
>      - GER helpers now use ppc_acc_t instead of ppc_vsr_t for passing acc
>      - Removed do_ger_XX3 and updated the decodetree to pass the masks in
>        32 bits instructions
>      - Removed unnecessary rounding mode function
>      - Moved float32_neg to fpu_helper.c and renamed it bfp32_negate to
>        make it clearer that it's a 32 bit version of the PowerISA
>        bfp_NEGATE
>      - Negated accumulation now a subtraction
>      - Changed exception handling by disabling all enable FPSCR enable
>        bits to set all FPSCR bits (except FEX) correctly, then re-enable
>        them and call do_fpscr_check_status to raise the exception
>        accordingly and set FEX if necessary
> 
> v2 changes:
>      - Changed VSXGER, VSXGER16 and XVIGER macros to functions
>      - Set rounding mode in floating-point instructions based on RN
>        before operations
>      - Separated accumulate and with saturation instructions in
>        different helpers
>      - Used FIELD, FIELD_EX32 and FIELD_DP32 for packing/unpacking masks
> 
> 
> Joel Stanley (1):
>    linux-user: Add PowerPC ISA 3.1 and MMA to hwcap
> 
> Lucas Mateus Castro (alqotel) (7):
>    target/ppc: Implement xxm[tf]acc and xxsetaccz
>    target/ppc: Implemented xvi*ger* instructions
>    target/ppc: Implemented pmxvi*ger* instructions
>    target/ppc: Implemented xvf*ger*
>    target/ppc: Implemented xvf16ger*
>    target/ppc: Implemented pmxvf*ger*
>    target/ppc: Implemented [pm]xvbf16ger2*
> 
>   linux-user/elfload.c                |   4 +
>   target/ppc/cpu.h                    |  13 ++
>   target/ppc/fpu_helper.c             | 329 +++++++++++++++++++++++++++-
>   target/ppc/helper.h                 |  33 +++
>   target/ppc/insn32.decode            |  52 +++++
>   target/ppc/insn64.decode            |  79 +++++++
>   target/ppc/int_helper.c             | 130 +++++++++++
>   target/ppc/internal.h               |  15 ++
>   target/ppc/translate/vsx-impl.c.inc | 130 +++++++++++
>   9 files changed, 783 insertions(+), 2 deletions(-)
> 

