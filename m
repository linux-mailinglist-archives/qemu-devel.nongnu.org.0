Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293903295D4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 05:08:56 +0100 (CET)
Received: from localhost ([::1]:52822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGwL8-0003TW-Lf
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 23:08:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGwJd-0002vA-FZ
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 23:07:21 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:33057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGwJa-0002g4-Hw
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 23:07:21 -0500
Received: by mail-pg1-x533.google.com with SMTP id g4so13035593pgj.0
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 20:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pD1DNpw6nUQYKTwFVp1TaLgL/JWvTyJgnVfJpRG5PPU=;
 b=NVCvWPRA8HIrJfdCoOcrDbXS72xPU4x1QmIkw6zWIdFdMMKFWFrz4eV+W26F6n29EE
 wgzBqDhDzvvbZAoTrcVUtWplKDjRIZrJvhayg//fbLPCIoHjNUPfMoDgVxG9t3vMsZnp
 s3e+8a7tQvZOrIlnIFlY4kU3E1iulV65HO4C8Ea3Ui5yivYvBssnkrMSid+Pmm/1RnKw
 EPSVsPfhz2bAIwKjmu0x+2LML3fS2Cycn2yjniB0JyHSGsJH5Y//0qidofP2/nlH/xhw
 Og6TA8naGvYyJFrtSKjDAynGsXlLiOJGorLg0H8AN7fJTbu3CF6fh3tJkLQzWq5IF5uo
 Ww/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pD1DNpw6nUQYKTwFVp1TaLgL/JWvTyJgnVfJpRG5PPU=;
 b=B7v31rNKFUClCVum/dipRBbW6JwDxMzWsqgOkOLrPz53gj3C8QtxbT9cGPITyOTVK2
 3VI2hRWeroKfB9PYPaODE6yfuyPku2qEK8pRPCZ7OI50vyURHywj7NbulJZyiveEDu/n
 Y/+lYkMlvP9mAco3ZuxmiSLOmOpaKVuqfoYmbhoTeUYFGGqvIa76SatImkHvaVNEXAHZ
 hoxZ7WRS6o9YR6sA5/G9P8SDdPmPue4jllLJBVghbLtbgt5PGaVwX3MqgY5eWzq4UTbu
 GJpe+QNNG3Asq4Y4QuKBSXEFmcbIHGUUeyV33upD92Ux+MAnbFiwPu1zZIi59PT0caZw
 +ixA==
X-Gm-Message-State: AOAM533g3c02t4xcWdr0Z+Pf0F1X5mjq7/9k5/g0TaATPbOs5GT58ffx
 GcfFjKVNnuFeUiz/SvRT7hQRdKIN4W5ong==
X-Google-Smtp-Source: ABdhPJxHxy/Vyh8pd+2FajQwS9YfLoEohrA6Zvl+7rVvKQ6dgoMeRLgMIRJUkG/ZmX87kG+ofPZiHQ==
X-Received: by 2002:a63:515a:: with SMTP id r26mr16704670pgl.257.1614658036899; 
 Mon, 01 Mar 2021 20:07:16 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id ga17sm1052923pjb.7.2021.03.01.20.07.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 20:07:16 -0800 (PST)
Subject: Re: [RFC v2 13/24] target/arm: add temporary stub for
 arm_rebuild_hflags
To: Claudio Fontana <cfontana@suse.de>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-14-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <685aff47-f469-73c9-15cb-d4e717b9f427@linaro.org>
Date: Mon, 1 Mar 2021 20:07:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210301164936.19446-14-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 8:49 AM, Claudio Fontana wrote:
> +#ifdef CONFIG_TCG
>       /* CP15 update requires rebuilding hflags */
>       arm_rebuild_hflags(&target_cpu->env);
> +#endif /* CONFIG_TCG */
...
> +/* XXX this is used all over in hw/arm, needs Philippe's work to remove */
> +void arm_rebuild_hflags(CPUARMState *env)
> +{
> +    g_assert_not_reached();
> +}
> 

If you have the stub, you can use tcg_enabled(), not an ifdef.

r~

