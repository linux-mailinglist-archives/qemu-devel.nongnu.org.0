Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1D2310FEE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:32:39 +0100 (CET)
Received: from localhost ([::1]:41052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85uI-00074C-RA
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:32:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l85bT-0004cM-W4; Fri, 05 Feb 2021 13:13:12 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l85bN-0000ZJ-9J; Fri, 05 Feb 2021 13:13:11 -0500
Received: by mail-ej1-x62b.google.com with SMTP id sa23so13378469ejb.0;
 Fri, 05 Feb 2021 10:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0uAL/k14b/WZWPBqirQ/ABYbQDQ0+uaME3FgePiiukI=;
 b=gEMZb+KzrfBaxmZYiNfnc6jKSz/TWQaCPqEBPg2pCeArWA143sTMVG8OLyudMJ41iq
 f4msaRfTDA0CVro9BmLB/yQkCLWlrPZ5vycllFX78oy7RoL6FdWP8ldXFc4gHIC+5gjj
 XAgWm9xJxB44ivIkIn4KQoAvCDSv6UUoi9Drzvy/rnl5Ox2yw5J53vJQi59hQ/GkgxOn
 2alWnieiXyi2oYxgrHtgbKviEx9+mx6gpYISmL6Ywfqytb4kQCrA/MsqquqwhjTCHytj
 AuPzRXrwo2g9N5pz92DB8FS++3dBhN83q8iIBpeeB+jvVSRNHZywrYCofoHFhvS8phpN
 M5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0uAL/k14b/WZWPBqirQ/ABYbQDQ0+uaME3FgePiiukI=;
 b=W6ts5nzwFIaQzeJZKysBYFRChWmTMfkS6UEJthCjxzDcXh+6Nm3eCkgDS2IfDLZb6z
 ZNHVk5HFdPD5h1WwbypVzWftKxIH4Pr9FLvmWF2Qhz8kBPpfkKdIDjHwXa9kdPJbgmy+
 aNLMl5n7y2yxcqKWtO10FIa0TxaCQLHyuEaQ3RL3j5U/9MwaOpAhADQRzkoycg6I4yZi
 yvGfU/z552zP02CryI///yG0mDrDhX887+SASkCQSQvisZbbl5t//zl1Wz/1vH65s21C
 pL+2l20HLR/WeeJtPORjtKDm0IUr5X6ePbbICTCj15YrzguXwtYH3rBo5MPrkGLXdpqO
 Aesw==
X-Gm-Message-State: AOAM530yM5QvaH1xLulWMM8UBbVuI9KlwxsiL7P5BmQwHPDw1YZ58Sk6
 UMPd+MPtcCqFcInxlSi8DUov9OPvOYo=
X-Google-Smtp-Source: ABdhPJzdbvfFNitYumjuZ3IADyKJmwwHgXUzDHSgv1IdfVmwP6YfqRWpfAbHTZMMqVJyXOP6bKuSQA==
X-Received: by 2002:a17:906:e15:: with SMTP id
 l21mr5125242eji.376.1612548782790; 
 Fri, 05 Feb 2021 10:13:02 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y8sm4179265eje.37.2021.02.05.10.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 10:13:02 -0800 (PST)
Subject: Re: [PATCH 01/24] hw/arm/mps2-tz: Make SYSCLK frequency board-specific
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fcf487c0-8c2d-2e69-2d98-0ec41589bf96@amsat.org>
Date: Fri, 5 Feb 2021 19:13:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210205170019.25319-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.33,
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

On 2/5/21 5:59 PM, Peter Maydell wrote:
> The AN524 has a different SYSCLK frequency from the AN505 and AN521;
> make the SYSCLK frequency a field in the MPS2TZMachineClass rather
> than a compile-time constant so we can support the AN524.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index 90caa914934..82ce6262817 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -76,6 +76,7 @@ struct MPS2TZMachineClass {
>      MachineClass parent;
>      MPS2TZFPGAType fpga_type;
>      uint32_t scc_id;
> +    uint32_t sysclk_frq; /* Main SYSCLK frequency in Hz */

This is what I meant in my Stellaris read-only dc[] registers
comment here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg776770.html

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

