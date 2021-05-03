Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9753713F8
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:07:07 +0200 (CEST)
Received: from localhost ([::1]:46268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWPq-00076E-Nc
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldWO2-00061x-Is
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:05:14 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:36760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldWO0-00076m-JL
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:05:14 -0400
Received: by mail-ed1-x52e.google.com with SMTP id u13so3083614edd.3
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 04:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NxSbOxmyfbxDZlgK7Zp0R6gj4E6vWNlEumFPoPL55NU=;
 b=nbX1PfX6ZQbzlFQO2I7h78aQV2AfNJkCmlp+v9MG8QZPhSAQtWT9oIlEuX+0gmrTTn
 5tOr5Tyjfz9pI5620pUyc/2aDuecmCyoz13Ybg3Pg4TSH2LQOFMz5gKSIGINRyLLX3Vk
 iVoPQ32pYwhzPrTzy3cYpFQWJzyMRSKnU76J9tqNMSIJOoUuHkNEwzBPtbofasUSHxxP
 6XUF/APE+V9pqL4EbHpL1RKppoMoKHFZoJA+zWPk7WawQWTgxoZuVT1Fv3sz7HP3QAsQ
 VrK0pUWfo5Dd+in5+VHfPlTMA25zhdlZctvJZhX2Woni0on7SnlNm9ZRA1KImnl//RER
 9x4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NxSbOxmyfbxDZlgK7Zp0R6gj4E6vWNlEumFPoPL55NU=;
 b=tnAYsfBxNU1HPr+/a4ZtTIyXF7SIorA7tDXjCho/Kfwcv2wSUSV7K/ba5cJ+RxVvQB
 ndIUnHCdoP9zhWzThoD4ahIHhwC9oPXRRlg+Q9MmY2nQgcIcCa/5os3Vy9WD2hSRvUji
 9nJ3oacRCV/htpBWA2rcI91V37uultFSING7uCqXmxEMqp0yxfZ4vfaHVHLHnMYB55Ir
 JZGiaw1TYcwAF3mGKneWTJIuh1hF7CFa+aD7RrQRjFZ6W3yyPJ2L/EPcWr7L5C1bRxtZ
 +YxcpAFF/sVXrbEMCeKT/23zwFLqqcVB6ylwqtD6vtx3a1npvc7UcemwBLrHsX4EvaIb
 EKfg==
X-Gm-Message-State: AOAM533OnONkZscncfmHCbwcgwBfJJ2o+vRP2F5LsSrRSsNOozb3199S
 /SspYC/m8BEFBgKuoy+/2vN8UkyO+MJK0OHdg6dgUg==
X-Google-Smtp-Source: ABdhPJxUKKkytz1pc+5WZSpxvSMFyxMO6JSd4mJxSNNQoqz51feoXAsebVW4bzBYWFcVTKa5F5CiDMehoLWVUk1l8Mk=
X-Received: by 2002:a05:6402:3079:: with SMTP id
 bs25mr19654800edb.146.1620039906127; 
 Mon, 03 May 2021 04:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 May 2021 12:04:01 +0100
Message-ID: <CAFEAcA_7zKo_xKCwXcHDL+4A8-TQTHtb1B9edBERQcFD2L5daA@mail.gmail.com>
Subject: Re: [PULL v2 00/31] target/hexagon patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 2 May 2021 at 15:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 8f860d2633baf9c2b6261f703f86e394c6bc22ca:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-04-30' into staging (2021-04-30 16:02:00 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-hex-20210502
>
> for you to fetch changes up to e628c0156be74dd14a261bbd18674bacd1afcc7d:
>
>   Hexagon (target/hexagon) CABAC decode bin (2021-05-01 16:06:11 -0700)
>
> ----------------------------------------------------------------
> Minor cleanups.
> Finish the rest of the hexagon integer instructions.
>
> ----------------------------------------------------------------
> Taylor Simpson (31):
>       target/hexagon: translation changes
>       target/hexagon: remove unnecessary checks in find_iclass_slots
>       target/hexagon: Change DECODE_MAPPED_REG operand name to OPNUM
>       target/hexagon: fix typo in comment
>       target/hexagon: remove unnecessary semicolons
>       Hexagon (target/hexagon) TCG generation cleanup
>       Hexagon (target/hexagon) cleanup gen_log_predicated_reg_write_pair
>       Hexagon (target/hexagon) remove unnecessary inline directives
>       Hexagon (target/hexagon) use env_archcpu and env_cpu
>       Hexagon (target/hexagon) properly generate TB end for DISAS_NORETURN
>       Hexagon (target/hexagon) decide if pred has been written at TCG gen time
>       Hexagon (target/hexagon) change variables from int to bool when appropriate
>       Hexagon (target/hexagon) remove unused carry_from_add64 function
>       Hexagon (target/hexagon) change type of softfloat_roundingmodes
>       Hexagon (target/hexagon) use softfloat default NaN and tininess
>       Hexagon (target/hexagon) replace float32_mul_pow2 with float32_scalbn
>       Hexagon (target/hexagon) use softfloat for float-to-int conversions
>       Hexagon (target/hexagon) cleanup ternary operators in semantics
>       Hexagon (target/hexagon) cleanup reg_field_info definition
>       Hexagon (target/hexagon) move QEMU_GENERATE to only be on during macros.h
>       Hexagon (target/hexagon) compile all debug code
>       Hexagon (target/hexagon) add F2_sfrecipa instruction
>       Hexagon (target/hexagon) add F2_sfinvsqrta
>       Hexagon (target/hexagon) add A5_ACS (vacsh)
>       Hexagon (target/hexagon) add A6_vminub_RdP
>       Hexagon (target/hexagon) add A4_addp_c/A4_subp_c
>       Hexagon (target/hexagon) circular addressing
>       Hexagon (target/hexagon) bit reverse (brev) addressing
>       Hexagon (target/hexagon) load and unpack bytes instructions
>       Hexagon (target/hexagon) load into shifted register instructions
>       Hexagon (target/hexagon) CABAC decode bin


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

