Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F77527AD7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 01:14:49 +0200 (CEST)
Received: from localhost ([::1]:45790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqNRn-0001hb-RJ
	for lists+qemu-devel@lfdr.de; Sun, 15 May 2022 19:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqNQ0-0000y5-8Y
 for qemu-devel@nongnu.org; Sun, 15 May 2022 19:12:56 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:36600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqNPy-0004dU-5U
 for qemu-devel@nongnu.org; Sun, 15 May 2022 19:12:55 -0400
Received: by mail-pf1-x430.google.com with SMTP id 204so12546089pfx.3
 for <qemu-devel@nongnu.org>; Sun, 15 May 2022 16:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jX9X/K6NYOh0QtVaCIIs4beankwvdFAqtDOPSegI8eo=;
 b=MEVixSjoSsOmboD8IrkZlxXBUFb0XuJfBElzopgQA1s5/ZQbwFZl4G75xesbsm5dTz
 nWpq6ZGdR8ks3JnMm4LiEvriKaHZXYttdN1rymudTGLvRvm4FqhDBlxbyBcyih7+ye6y
 7UZgLffWkWALbySk0M3WI622PTKb2YTD5Sz/n2C6fwB9YZFrggICrRnvLixmoZ+cZIj8
 hl76BPa41j5GOP5CIPOBxNyPQ07PogxKXzuWsyWkIGZH9dWUuvXrldg06/xPM9Q42wZS
 DdFp7sRZei7rIdBHXk/v0k/GGN7oduiJzyjsd5ZuKsMeSyvaJ3+2oWG9EAt0guVngGSH
 3EoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jX9X/K6NYOh0QtVaCIIs4beankwvdFAqtDOPSegI8eo=;
 b=Lox/UizFydr7LuPtNafLGvaNK3aKLofL6iym69qCyi0X5k0LGPH6C9g2Ti0ETyUewr
 7cOoAbzTQSY3uAMVHowPMg+Zsb3r2FKJoYKf6wNz1Z9XMBHlCqJC+EuOaN7ZcUKm+iAl
 yUTr1UjK9iSa3l38GJkdnQ4rqueSSir4reS+jQv0pyEJsRtYqGqDurVEOmyfiGXAWjWV
 orDNgI4HN/JkL/jL5w0ObM2VOc2nCqHiyO6j4ZRhGJE9dZRhd7lmL2VLxDgHJ2B8nYuu
 TdX+Yhb3d1zy7btP0CVswHGI4hx3hxP80dZORcS7A7rjG/nPSUPgo26cw7hPv8CPxamR
 Q+OA==
X-Gm-Message-State: AOAM531tGWNyerySP5yfgXTiz5m3jNauRqtcjDIsWj7M9eYfp6DZgmnM
 aYPSEK+u5cEHd+dVNRnvMTgBSg==
X-Google-Smtp-Source: ABdhPJwvZs0tiOWtF92m4Tn2Pd39456DqEHCWRCCUCKhTmOD24tuOCTyJ9CIm9DCgctKy+k7Sl/n+w==
X-Received: by 2002:a62:e819:0:b0:510:693e:b20c with SMTP id
 c25-20020a62e819000000b00510693eb20cmr14895818pfi.60.1652656372345; 
 Sun, 15 May 2022 16:12:52 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a170902d58900b0015e8d4eb2b8sm5566472plh.258.2022.05.15.16.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 May 2022 16:12:51 -0700 (PDT)
Message-ID: <41d45d1e-8f2e-9201-fca4-f2f9c68af5b1@linaro.org>
Date: Sun, 15 May 2022 16:12:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/4] OpenRISC fixes for QEMU 2022-05-15
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20220515013948.2993495-1-shorne@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220515013948.2993495-1-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

On 5/14/22 18:39, Stafford Horne wrote:
> The following changes since commit 2e3408b3cc7de4e87a9adafc8c19bfce3abec947:
> 
>    Merge tag 'misc-pull-request' of gitlab.com:marcandre.lureau/qemu into staging (2022-05-03 09:13:17 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/stffrdhrn/qemu.git tags/or1k-pull-request-20220515
> 
> for you to fetch changes up to e8f0ab0cd674241cbab7231ce05ac1bfa0b4f5ed:
> 
>    target/openrisc: Do not reset delay slot flag on early tb exit (2022-05-15 10:33:01 +0900)
> 
> ----------------------------------------------------------------
> OpenRISC Fixes for 7.0
> 
>   - A few or1ksim fixes and enhancements
>   - A fix for OpenRISC tcg backend around delay slot handling

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.

The gpg key I have for you is expired.  Have you refreshed the expiration date and pushed 
the new copy somewhere?


r~


> 
> ----------------------------------------------------------------
> Jason A. Donenfeld (3):
>        hw/openrisc: page-align FDT address
>        hw/openrisc: support 4 serial ports in or1ksim
>        hw/openrisc: use right OMPIC size variable
> 
> Stafford Horne (1):
>        target/openrisc: Do not reset delay slot flag on early tb exit
> 
>   hw/openrisc/openrisc_sim.c | 28 +++++++++++++++++++---------
>   target/openrisc/cpu.c      | 11 +++++++++++
>   2 files changed, 30 insertions(+), 9 deletions(-)
> 
> Jason A. Donenfeld (3):
>    hw/openrisc: page-align FDT address
>    hw/openrisc: support 4 serial ports in or1ksim
>    hw/openrisc: use right OMPIC size variable
> 
> Stafford Horne (1):
>    target/openrisc: Do not reset delay slot flag on early tb exit
> 
>   hw/openrisc/openrisc_sim.c | 28 +++++++++++++++++++---------
>   target/openrisc/cpu.c      | 11 +++++++++++
>   2 files changed, 30 insertions(+), 9 deletions(-)
> 


