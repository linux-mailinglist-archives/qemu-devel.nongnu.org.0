Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E982E8C4E
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 14:37:13 +0100 (CET)
Received: from localhost ([::1]:60938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kw3ZI-0003bB-Fb
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 08:37:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw3Y4-00032V-VS
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 08:35:58 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw3Y3-0004bY-GO
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 08:35:56 -0500
Received: by mail-wm1-x336.google.com with SMTP id r4so15351483wmh.5
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 05:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iKeeKCZUpMUdstXEMxwatE12VwC1sHPBuBOPCwge0Ys=;
 b=oRL/aYZoEE7PoHuXNMWeqPVfrPrG77srm4u/HhHyKLg18MN3YG+QOY6WHW4s2sgwA5
 x0BimxzJOCgFPwL+sTpOjAKai1h7XEcX6Ty7w6ilt0DPCcFid4UgCjJNiB4j6UOJxiGs
 hmH8mwEysH1I/5y5fIBcrp99YpDDMRJCCWK/UpiYfZvqdpgUCzYoCSvYPxJsq7cLOvT+
 Axg5DeFzCkVq2xpTbgImmbe49cpInJScF8s6yiW4yvo+1CnUR8Llp4rQttFzrWWCVVAh
 KBisA/Fi3XKdPUDvjbKKSwkDKK543keMmdWk9ONzsC2uW8Gp2EFoAGCu6XAy8FcWgRj8
 6PQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iKeeKCZUpMUdstXEMxwatE12VwC1sHPBuBOPCwge0Ys=;
 b=ckfg39rptsAhPhuhBrFIjP01omB7m7EuflE7Ma6OA7+Ohe1KK7c3kv19PrCP3csMo5
 XO663ehL3QQ0VmhYHiFcQeOpbEBVBZcQgWrq8eN5CUETjWFZ/SM8obdPeLd3qEDVb0Ty
 +NunEwVIPl2zp2loBaDvMZNlEeMTE1vulvjsEVPLV80IBjkk+B5Avk1OyArJZYPlC6/5
 ov04kieNvGau6TzUrmcv0lWurrR/l0haLSBrrvGkGfJWTSXPKxvJ2Z81nOq1YkcXAu9K
 NXmtuEa1L5G4aovfyv2ie85vJgo7rFcQ7LIWJAw2mQkrB3owS0EiJ68+Mqb+PnRn1KcP
 PRFQ==
X-Gm-Message-State: AOAM530gQlcaQx85yyOA0DO9B433lAzwN6TX6Ha11EKyqLRtKXWFFgec
 OT6NXhFMi6AmokH9hLMlBzY=
X-Google-Smtp-Source: ABdhPJy2JR+7LF6AoIpCbMYAfOjs81KtoFSr23nBO7N6scVUc/x2sxSbbfKfSbI1uvm9uEMFVrhZIA==
X-Received: by 2002:a05:600c:274d:: with SMTP id
 13mr23139514wmw.77.1609680953772; 
 Sun, 03 Jan 2021 05:35:53 -0800 (PST)
Received: from [192.168.1.34] (194.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id q143sm30058622wme.28.2021.01.03.05.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 05:35:53 -0800 (PST)
Subject: Re: [PATCH v3 8/8] tests/acceptance: Test boot_linux_console for
 fuloong2e
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
 <20201224031750.52146-9-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <65e0e6bb-234e-7687-b522-8aaf1d8f190a@amsat.org>
Date: Sun, 3 Jan 2021 14:35:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201224031750.52146-9-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.262,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/24/20 4:17 AM, Jiaxun Yang wrote:
> The kernel comes from debian archive so it's trusted.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
> ---
>  tests/acceptance/boot_linux_console.py | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

