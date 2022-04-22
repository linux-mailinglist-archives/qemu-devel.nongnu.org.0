Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FB950AD5F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 03:49:33 +0200 (CEST)
Received: from localhost ([::1]:34024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhiQO-0007eU-Of
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 21:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhiOx-0006KR-PM
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 21:48:03 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:36482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhiOv-0006Ro-GQ
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 21:48:03 -0400
Received: by mail-pf1-x433.google.com with SMTP id z16so6602298pfh.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 18:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=WxlHAGVMo8yoSh1HcNEiLi07VpewW05VBaYvv0/Zv18=;
 b=uWNTQ32QVoM+qjWj4znKUuFUMXmKIOU47+zkyz+XPNRD/feeriRUH/zuNGG5ff5vDX
 Ww9vcVctvWsliT0i0PV6FKolO/BAXDhoO8gEuKV10LPSb6TI3ETrzHh4H0+6J68bHBWs
 8uhP+Xeg2O7ojoOtBUndPbRbZSOE2EZQenq5vlj8VzeX9zIBv726zRqED0+C95xBjBkp
 pGCd2Boqo+CuEqU4+hhAiSsAKZL0c1Wjwq4yAdptMi2K3sXsdcmNoYr3/QSB3KxljHAg
 ZXJhNISJIyd/HpE4ThOXnnBWQQDRzJxtAD2vNpKPChVsRIaG7Otw2b8JT2KrKV18s8Vh
 GfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=WxlHAGVMo8yoSh1HcNEiLi07VpewW05VBaYvv0/Zv18=;
 b=Eo4OLtYzwVcHf4ekE5evu+6lbieuiFyQupRRldjbe45XWhK9FyU+OSVhlfViAw/lmm
 B2sautWsbq67HOAC7DUJau3AdwRgu7bvBMVIGdCnkbnQo+D60hViG/Hh7+dfMAhg98YX
 XupDfDawUKfUTxzXoYqY34GapULEFsjB209HIE+UIoviCnwT3gIhFWznlsZXmZDAKfi8
 Syd0v01+64jPysRFHoJo+LJUYNe5Nj1NTumojXwz6JnCRCkizeNbgsCKbjCTVMJBzSNl
 MEbC3q8hXlO3Do0YLdclCS35Dn5SIy5PQQEHgCMFa/q0lZTV3NYNavQPz6t2KRl/zH8a
 zinA==
X-Gm-Message-State: AOAM532wOtOyY2pHxKAvujoUscPWqo3FgO0kykaT2qhU7Y542z5hTvGU
 6mRhIW193/pvol7xQPrquPGVluZKhwbFDA==
X-Google-Smtp-Source: ABdhPJxcTeMP1WMkC7nW/0fskXJ2r667XEEOnsxvhH1YsF9Wwo+C8V6ArvI5qXA31yZ9PXbMHZQ+oA==
X-Received: by 2002:a63:4d4c:0:b0:39d:3808:804f with SMTP id
 n12-20020a634d4c000000b0039d3808804fmr1954421pgl.312.1650592079913; 
 Thu, 21 Apr 2022 18:47:59 -0700 (PDT)
Received: from [192.168.78.227] (50-78-183-178-static.hfc.comcastbusiness.net.
 [50.78.183.178]) by smtp.gmail.com with ESMTPSA id
 d139-20020a621d91000000b00505aa0d10desm400411pfd.0.2022.04.21.18.47.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 18:47:59 -0700 (PDT)
Message-ID: <8a2daad5-c23a-1fe4-3028-25aa53e2dbdc@linaro.org>
Date: Thu, 21 Apr 2022 18:47:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/7] target/rx patch queue
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220421173114.48357-1-richard.henderson@linaro.org>
In-Reply-To: <20220421173114.48357-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 4/21/22 10:31, Richard Henderson wrote:
> The following changes since commit 401d46789410e88e9e90d76a11f46e8e9f358d55:
> 
>    Merge tag 'pull-target-arm-20220421' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-04-21 08:04:43 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-rx-20220421
> 
> for you to fetch changes up to 724eaecec6d22cf3842f896684bdc5b79492f093:
> 
>    target/rx: update PC correctly in wait instruction (2022-04-21 10:09:12 -0700)
> 
> ----------------------------------------------------------------
> Fix usp/isp swapping upon clrpsw/setpsw.
> Fix psw.i/pc upon wait.
> Align dtb in ram.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



> 
> ----------------------------------------------------------------
> Richard Henderson (4):
>        target/rx: Put tb_flags into DisasContext
>        target/rx: Store PSW.U in tb->flags
>        target/rx: Move DISAS_UPDATE check for write to PSW
>        target/rx: Swap stack pointers on clrpsw/setpsw instruction
> 
> Tomoaki Kawada (2):
>        target/rx: set PSW.I when executing wait instruction
>        target/rx: update PC correctly in wait instruction
> 
> Yoshinori Sato (1):
>        hw/rx: rx-gdbsim DTB load address aligned of 16byte.
> 
>   target/rx/cpu.h       |  1 +
>   hw/rx/rx-gdbsim.c     |  2 +-
>   target/rx/op_helper.c |  1 +
>   target/rx/translate.c | 69 +++++++++++++++++++++++++++------------------------
>   4 files changed, 40 insertions(+), 33 deletions(-)


