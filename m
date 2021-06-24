Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BBD3B3616
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 20:48:38 +0200 (CEST)
Received: from localhost ([::1]:48194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwUOz-0001MY-9O
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 14:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwUMd-0007vI-Pp
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:46:11 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:44956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwUMb-0000GP-Ev
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:46:11 -0400
Received: by mail-ej1-x62f.google.com with SMTP id gt18so11012065ejc.11
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 11:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=8BT9ETe3hjtlpCnk79XUsUbpi72lzFRkuEVQIU/boXc=;
 b=gk7a6tJ/tLRzyZCfvZIMankHP1Ufzms6ep5XHKXZ/d9u+22sFIu1OXxbRi1HcC5xGv
 ElglOobcCFqhkB1tMSClOl703VQGJpnYOv4jK3Cbp29LMAZaH9NnXArdhzHLNJDRnQlc
 H2ATral5SBy9BRQRoEVmnynGsW86FOlryth/j3Zy5ztFzIGzJnw2PL9seBnsrqlNTCEc
 ymTV+vdYlMAhjWHjVkvMGMm68olecV4UGupSfWODTqwgV8OI/iti0iLFCWYkTP40J+dq
 XV6xarGujhGPymDjq3+zAllv5QcJgWJcUUBCNW8+twke5TmR4TfO90J4c4f4o4P5bETd
 PGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=8BT9ETe3hjtlpCnk79XUsUbpi72lzFRkuEVQIU/boXc=;
 b=XdWFR89QReH7mQ2EII557QKVc9QXSIqtUHUZ33rrTJtmBcZFntYQpxpm+w1CwtR4lw
 OXzF1StPoVSPCW9JUV/R+/u85CKvUTtXlBMytek+fON9od3PMRs5nCAPbUWLsuBHE376
 i1oEdLyGcjre1uBCEzUh1jeKVD4jSkeY64e0s+3+051LUwDvEztTRRV021WFu1v36cxo
 jGiKHQt2t+DYpcHI3PKjSzbSLmkeLNPLx6syIg42D0VXMkeHzU+kiIRO5Ttvuz76zU4V
 +D5fBuN/R+iiUmYZ00I0nQfn5UEOlQOvDkiAwnZ4yC3uul/XPt8Srv1XPu5S/6PmkvDI
 sB1w==
X-Gm-Message-State: AOAM5330Rrw85IGVdXm6l9yO8TGc0LZ5dNgP511SbVaR0tBJ/Ka7DlYv
 AA2i68Q/iRpHZacDKGvlNHhjZGBKLPKWZxzAiwPhmGZRqkoG9A==
X-Google-Smtp-Source: ABdhPJy7207QLC4yXFfMbEJXYFa565bMrKYy+5PnDrmCn5GJc8T2n+Wt05RSTVuQffzZHg/FjoAp543Gd6madoQTE5U=
X-Received: by 2002:a17:906:90c4:: with SMTP id
 v4mr6549270ejw.382.1624560366238; 
 Thu, 24 Jun 2021 11:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210624140009.24855-1-peter.maydell@linaro.org>
In-Reply-To: <20210624140009.24855-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Jun 2021 19:45:30 +0100
Message-ID: <CAFEAcA-uYr1e4WfVjjbeHsL7TdHj=s7VSW12Sm_HK_7HJTB8_w@mail.gmail.com>
Subject: Re: [PULL v2 00/57] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Jun 2021 at 15:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Squashed in a trivial fix for 32-bit hosts:
>
> --- a/target/arm/mve_helper.c
> +++ b/target/arm/mve_helper.c
> @@ -1120,7 +1120,7 @@ DO_LDAV(vmlsldavxsw, 4, int32_t, true, +=, -=)
>                      acc = EVENACC(acc, TO128(n[H##ESIZE(e + 1 * XCHG)] * \
>                                               m[H##ESIZE(e)]));          \
>                  }                                                       \
> -                acc = int128_add(acc, 1 << 7);                          \
> +                acc = int128_add(acc, int128_make64(1 << 7));           \
>              }                                                           \
>          }                                                               \
>          mve_advance_vpt(env);                                           \
>
> -- PMM
>
> The following changes since commit 53f306f316549d20c76886903181413d20842423:
>
>   Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request' into staging (2021-06-21 11:26:04 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210624
>
> for you to fetch changes up to 90a76c6316cfe6416fc33814a838fb3928f746ee:
>
>   docs/system: arm: Add nRF boards description (2021-06-24 14:58:48 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * Don't require 'virt' board to be compiled in for ACPI GHES code
>  * docs: Document which architecture extensions we emulate
>  * Fix bugs in M-profile FPCXT_NS accesses
>  * First slice of MVE patches
>  * Implement MTE3
>  * docs/system: arm: Add nRF boards description
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

