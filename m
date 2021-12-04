Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35949468697
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 18:37:17 +0100 (CET)
Received: from localhost ([::1]:35444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtYyJ-0005mh-VE
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 12:37:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtYx1-0004cs-Lr
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 12:35:55 -0500
Received: from [2a00:1450:4864:20::436] (port=36661
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtYwz-0006pS-E5
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 12:35:55 -0500
Received: by mail-wr1-x436.google.com with SMTP id u17so5524844wrt.3
 for <qemu-devel@nongnu.org>; Sat, 04 Dec 2021 09:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2n90g8jwjh87B6hD94TuoZZ21WH7nWIT/chkfCdxG38=;
 b=Y6J8L5EVELIIxOJaZ6g7a2uNDHIo3G2LklHN/Sr/EdjgpzWf5geEJ9GIF5Fwu1mecu
 c+bKMTaiZeeGyAgdgm/POWCVSIYFvDN1ribtKm9WmqJRAd0A9EMmruXQ5Qga6ZrUxdIx
 PV/XXbELB60q3jRG3IUFFTduiY2CRkZR1YZYwMlYoeDX56M3glOHSOYQT7WMMG0J8c9U
 hD/xn1bbD8MVWBv6F+1ros2VM5SdPW1eeutDv2mP9gMvZG4vlwG/+px+x1mmXMh9Eby5
 lPV97qIFDlgRZYj3c2CLRngBFjA8XZJPAnHR3Ghhdue9mP8XZFhpPyl5hlsh/pIgVRNp
 uNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2n90g8jwjh87B6hD94TuoZZ21WH7nWIT/chkfCdxG38=;
 b=hQFBc9VGuu9PjOH07FoKBJS2utEIGoycPeyX8zGVr/LwOY6SIhONzkROsaOrWje34F
 f+vJfjmAzkOOIAZlS3oykBHUigSRUJj+wVhSfWt3JR9e6DlP77BSwN2Y0/7AvwaALA5+
 lLFKeGFJl91DktRoziry+heb7URgOmydr/rxl+WWtIWKSO2b5emiM0jqLeWLZtVx3CQJ
 4USSrEjoUdyqZtzZFX48wImfIzlxMFKPhxvenY/P72Zq6mcx4yhypfYpy8llLOGHcgdt
 ztlOHTB82mGKWsZS4GpoZyoaFJmQZ9qmvP/vQ87qPMklfHiw33Mec2o9efVEpUG2rF5d
 0eIg==
X-Gm-Message-State: AOAM530r+zVyuFAkWVzJ7Y2e1QJYMMT6W/IlFGxkUzS941DDeCA+I/hv
 gaxhWx3VuVExcdK86JB3ByU=
X-Google-Smtp-Source: ABdhPJxlqhkoC6wu1uSmas3uFKaWgb7moX3/cgDbgA4ZeUFcZzG2BuEss8FUemGaDqFINqwZawYxjw==
X-Received: by 2002:adf:e747:: with SMTP id c7mr30588944wrn.38.1638639351748; 
 Sat, 04 Dec 2021 09:35:51 -0800 (PST)
Received: from [192.168.43.238] (168.red-176-83-218.dynamicip.rima-tde.net.
 [176.83.218.168])
 by smtp.gmail.com with ESMTPSA id o4sm9955100wmq.31.2021.12.04.09.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Dec 2021 09:35:51 -0800 (PST)
Message-ID: <f743337b-f822-6831-9097-1cc345aace82@amsat.org>
Date: Sat, 4 Dec 2021 18:35:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v13 22/26] linux-user: Add LoongArch cpu_loop support
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1638610165-15036-1-git-send-email-gaosong@loongson.cn>
 <1638610165-15036-23-git-send-email-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1638610165-15036-23-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-1.011,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, richard.henderson@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/21 10:29, Song Gao wrote:
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  configure                           |  5 ++
>  linux-user/loongarch64/cpu_loop.c   | 94 +++++++++++++++++++++++++++++++++++++
>  linux-user/loongarch64/target_cpu.h | 34 ++++++++++++++
>  3 files changed, 133 insertions(+)
>  create mode 100644 linux-user/loongarch64/cpu_loop.c
>  create mode 100644 linux-user/loongarch64/target_cpu.h
> 
> diff --git a/configure b/configure
> index 48c2177..9df99f6 100755
> --- a/configure
> +++ b/configure
> @@ -581,6 +581,8 @@ elif check_define __arm__ ; then
>    cpu="arm"
>  elif check_define __aarch64__ ; then
>    cpu="aarch64"
> +elif check_define __loongarch64__ ; then
> +  cpu="loongarch64"
>  else
>    cpu=$(uname -m)
>  fi
> @@ -612,6 +614,9 @@ case "$cpu" in
>    sparc|sun4[cdmuv])
>      cpu="sparc"
>    ;;
> +  loongarch)
> +    cpu="loongarch"

Shouldn't this be "loongarch64"?

> +  ;;
>    *)

