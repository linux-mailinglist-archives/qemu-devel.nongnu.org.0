Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F12C65148D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 22:01:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7NEc-0007TI-Bc; Mon, 19 Dec 2022 15:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7NEb-0007T6-7o
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 15:59:41 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7NEZ-0000Kx-Ja
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 15:59:40 -0500
Received: by mail-ej1-x630.google.com with SMTP id m18so24564418eji.5
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 12:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gW286TDhXmv+guciKPan9GTaMPsCQqh3lTHocKD9Cbo=;
 b=Xz5NCbXQ6o6Y4hWQ18EwSfbuwzxDioAWlrza+aofQORyygd5MYQEIkVJJ8KCZ2xUul
 mEqa5KJ0IldPcDkNRsZp41YpoaGCTgXXiQxXeEB1zL3YTGuobh0hXBeNegOo3S8egcWP
 33vwuUcQ2DYhbu36dkWJjGEf45+1l0JrEI860TTrNFtdpkeByx5PxMoO2ZKCuqGY/j1q
 Tmhfvcx7GkGJy03NIHYopGEmwFOz8766TTkKO0TZryNjvQ/kHU/UBu08K1cvKDIWJEaJ
 OYfH3G7UieKjaI6LiFh2ENUUY+gIGcxcd5NmLRuQN1P64x0XZ4iPecx3XHeLXEpaZXIB
 4/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gW286TDhXmv+guciKPan9GTaMPsCQqh3lTHocKD9Cbo=;
 b=DuWIgt6FGQP3kw55oMm5pP+6o3plGYBkW2i/aJKHtnWW0BJXm+Q3xbX+im3Xk7fzph
 eis+oitNpDucX6zGs702MwCjPRjNGx2z6FMJWc4PMWno9TGRV9P651nz5BWNPegPXLxQ
 kYHPpVF5Sm3EP7zsFsyp6YrM3S1CAfFPVXJuLE+QjaU0Uv2eu6uqfVRJRfs9mde64ivU
 gA7QwcEylXSB1SxyTSlTVMJDObV5TtmVeP1I1Nx4GrqpRttFkHoCfYCrbP6pu6YOsSyn
 4OAnFLQtZw3kpeNxCkFukyYiuLbno5bF86dKfHIF9gf+kcVmElf3Fs1qC2ER606qi7l+
 7rjw==
X-Gm-Message-State: ANoB5pnxAGjxB0I5AaewhB8nyMPhH2TdaFPk7XixWjURkBsAeJiWqrku
 X6LMvsqO1sb520GY1HLoEEnUWg==
X-Google-Smtp-Source: AA0mqf4u5jMsfM0Ay/ePjQmiPSrhqvhcZgBdP1rJibKgYfYFb8sbNV0FjSaga3kQ0lBknbQJjvmEQQ==
X-Received: by 2002:a17:906:351b:b0:7c0:a6a9:64e9 with SMTP id
 r27-20020a170906351b00b007c0a6a964e9mr48355281eja.36.1671483577261; 
 Mon, 19 Dec 2022 12:59:37 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 16-20020a170906301000b007c0985aa6b0sm4780702ejz.191.2022.12.19.12.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 12:59:36 -0800 (PST)
Message-ID: <77e5ca3b-89d2-4231-3c9f-fc8bda29e470@linaro.org>
Date: Mon, 19 Dec 2022 21:59:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] thread-posix: add support for setting threads name on
 OpenBSD
Content-Language: en-US
To: Brad Smith <brad@comstyle.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
References: <Y57NrCmPTVSXLWC4@humpty.home.comstyle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y57NrCmPTVSXLWC4@humpty.home.comstyle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/12/22 09:22, Brad Smith wrote:
> Make use of pthread_set_name_np() to be able to set the threads name
> on OpenBSD.
> 
> Signed-off-by: Brad Smith <brad@comstyle.com>
> ---
>   meson.build              | 12 ++++++++++++
>   util/qemu-thread-posix.c |  9 ++++++++-
>   2 files changed, 20 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


