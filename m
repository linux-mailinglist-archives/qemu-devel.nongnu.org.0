Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF7C41FC7D
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 16:23:22 +0200 (CEST)
Received: from localhost ([::1]:41518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWfv7-0006tU-3q
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 10:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfs8-0002Iv-Mj
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:20:16 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfs5-0006Uj-QS
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:20:15 -0400
Received: by mail-wr1-x429.google.com with SMTP id d26so20351110wrb.6
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 07:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/swOekF6tM4WBugjUvYA9uUp4k92EJMLd6+6/yuBUtk=;
 b=EYQ55yUwhu96YChcwGkB5WR5xBPrmPlX3KPa6kBa42nK4qeShEcvoj31Z+jioyKij3
 WBeoG4RZryRLjDhGp/91zcn+I2NDfj6wkFfJDUPiDDPVpII6JfNUEMc62DBzAdr7atPH
 qJEJsaiqh3gv9U/5jFLm1aXD6GU88nlakep9om0O7zwNmZwqRy/HmWL3uu6aQ7qrx+2v
 z1D8ycfTarKi6Irh2Rc35gEeKfqDqhcf+SDrlADgs75nT1E0ejfs+CIREtL1SYmv6FTF
 A+RwgguyOO24f9yLJ81zoGxG97wSvkY6DJzU/Ib7OTBxV48UntcgjeIDohWipeirgjgD
 crJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/swOekF6tM4WBugjUvYA9uUp4k92EJMLd6+6/yuBUtk=;
 b=U/8mXW3+rjYHzFjHH/IUJ3msDJHpsjqdc8ADtrwP1T+h2YSzUyelJR2A+iduLr4104
 ORNkju3cyio8cpu9j0QU5Pz1qMjNm10LS8qQ1Pwk89qxAfmpozT5IBLL9dK2u8FTYKf+
 Kon5srk23DK4foSPMfz7qxAeSgfpe8rek5ZJR8LwhhIMdbad5IYsqU3ZJT2V2IdwQNsp
 kPIyRgntTcQkD0FI4FkP7YRAZ4d4AUtA52OY3Y+HxiaF6zmt6pZNyJORwerqY/iObOoH
 wVTKSuoFpiNdfDgvAJv7GSeUxOrKO29no8Nz6WB7eS2s7f0dcB6nxLdRgtXw7byQcE6D
 +U0g==
X-Gm-Message-State: AOAM532hKj8fhry7ccQG9GX/s/otJDotmD6W8Jys5+VfXnJqo1QgjPL0
 3GvUFv0ZH1+AmnaXbhJvWfU=
X-Google-Smtp-Source: ABdhPJydoUSWdQxWwp3QQu7XRT3wTVlm9j3r+5fouywZ1X5AYOi1QLvELrLCYpPqsd7yHwg6QUfhcA==
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr3541477wrw.376.1633184409555; 
 Sat, 02 Oct 2021 07:20:09 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id t13sm8886311wro.76.2021.10.02.07.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 07:20:08 -0700 (PDT)
Message-ID: <dddec9ed-51ff-357e-95c6-383bfb01f723@amsat.org>
Date: Sat, 2 Oct 2021 16:20:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 22/41] target/arm: Use cpu_loop_exit_segv for mte tag
 lookup
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
 <20211001171151.1739472-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211001171151.1739472-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.413,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/21 19:11, Richard Henderson wrote:
> Use the new os interface for raising the exception,
> rather than calling arm_cpu_tlb_fill directly.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/mte_helper.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

