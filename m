Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0305741C671
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 16:13:30 +0200 (CEST)
Received: from localhost ([::1]:38034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVaKt-0000Ev-VT
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 10:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVa64-00065m-EI
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:58:08 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVa62-0007QR-If
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:58:08 -0400
Received: by mail-wr1-x430.google.com with SMTP id d26so4440862wrb.6
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uO/MAQ/w+mQzY1oOXCjl4D7USi+r7UICOY0RedUlfSI=;
 b=mRIHdRTzb0jgaIcV3etWMIHYMXQa0rZLTb0It8x+PBCAC18w0ABgEHn9yx4zMuJoqp
 FZOFE+mOSHJt+sZs3zrg7uFaLCHxmXC0zN7g0R/ULikPS1f1E4VJ6QbehYaACRugSsdE
 ikMdIUL0bQRE8fLyMsQ3TCx4esYeRefPmT8SLtmFXkJoT7vOv0nWKtz+9ChitTxSWToP
 RKn44HcvSn0A9AlHnXmWTUqtkT3liXe22rEACVrr6cZnN4HcFgqCUEB84bcau/Wi8Blk
 Jsv6QN1NcePXAlbhFvl5l5BnR7JEZIf+6+3tZXEWdANpV1Ml6unSLnNvp5KGKn2+8nOn
 49Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uO/MAQ/w+mQzY1oOXCjl4D7USi+r7UICOY0RedUlfSI=;
 b=m7N0hgu+JAxdEm7umqMKYTu2VolUWSO3qrVHeU+2kRuFOY5pKEO0ALqY5ynIjkR3Wk
 L3hCSlQyrlRoWX2DLZcrn8kcT9wO2+U0pQ+7CEqXP8IjphwzEiQ487S5KU9sh0yPsNOq
 S99R9+MOzbJ3FBok/FT8tGl8k1WHbsR8r3iKgHLC0RxuXqpMyBny445Vh5/11zypZDhp
 O9Yd/DLxbPropY4IHrG0RO6H7G7GEPo37CCOhEgpj+5/hUBVm70cazpBPliwHyzFab8x
 iOQ905omz0C7piQtl4ElXt+QriuuyXhSBYN2sJ4m3hFpivpxXVL9b3rg5eL+bfVPhw6e
 Gc/w==
X-Gm-Message-State: AOAM532tXDl6IN4n2lGMTUiBbVOVO6lnfNKrtobyNPsvPxhVT05KUXWl
 1PVAOEdsfIoPn17eLs4Eyk4=
X-Google-Smtp-Source: ABdhPJwTa+qXg5AOMMUsvu3msdqqbZls/VDwlwAPpla0MLUjRdNq+BBDoXLLomPAEYYCFrtVXnf3lQ==
X-Received: by 2002:adf:f387:: with SMTP id m7mr6859473wro.53.1632923885156;
 Wed, 29 Sep 2021 06:58:05 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d8sm2542216wrv.80.2021.09.29.06.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 06:58:04 -0700 (PDT)
Message-ID: <9bc903a2-d547-b2d6-fecd-bea85e46ad85@amsat.org>
Date: Wed, 29 Sep 2021 15:58:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] plugin: add qemu_plugin_insn_symbol to
 qemu-plugins.symbols
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210929133535.2950068-1-philipp.tomsich@vrull.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210929133535.2950068-1-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.03,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.juenger@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/29/21 15:35, Philipp Tomsich wrote:
> Give the plugins access to the qemu_plugin_insn_symbol helper.
> Note that this symbols is today already used by cache.c, which can not
> be loaded without it.
> 
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> 
> ---
> 
>  plugins/qemu-plugins.symbols | 1 +
>  1 file changed, 1 insertion(+)

Thanks but there is already a patch for this:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg834521.html


