Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7C5638F2E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 18:34:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oycas-0000Rp-Tc; Fri, 25 Nov 2022 12:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oycar-0000Ix-9j
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 12:34:29 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oycao-00051w-Tv
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 12:34:28 -0500
Received: by mail-wr1-x430.google.com with SMTP id h11so504486wrw.13
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 09:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XBVpg8S2lYOHuzZ3+qJI7FUzRi1DDYNLZyg6zNq25rY=;
 b=eBC+GeQ2OeNzgwhXTyYI+Fx+veTEp5rYG26mlw0ks5Yi4aW50msVwiAWEN7iqM9QMh
 i0aveNCsLgo98koDXLY/2TrBch95ppZvh9KTWgCC94kka3gde5Xfg2w49mp46Pk3/Dg0
 /VCU/RaDkMeifkf8hmM7tTkeWtY038u1445AY/KREHH/am/SgGN+vXOs05e4Bf5InyxP
 DL+DvC7DJ4q+cH4I4blbdn1BzL9RKfRhy6Jkjbqgl9FVt5H0uU7djt0W+iYibDQ85xSF
 QG8oeMcz2wP+dOW6semtIZt3E+q1b55BmwmbLngWuXJ/BluRPIaMtM0Qsw0x5sZnUdgh
 8IfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XBVpg8S2lYOHuzZ3+qJI7FUzRi1DDYNLZyg6zNq25rY=;
 b=6DR/lZfdyisW7xSHjlN07O8rfAefeeNAl0Y4T7ZVuMHpOPU393f7NSzCLPcXvatqQk
 9Cly22EqsbOVn87iB/GWLVNciPNFYeYnZek+ystb7VfL9Mdpg3+oAKpZZ1RThQ5aieOK
 68xvOLZcy1ABOxg3nnD8gzRpKzNRWm6feUTlTWil9yyQdiCOdHEp1hmUB9vaKTkxWu9T
 OcEwZ2xD2zllde0vPQTbO9VbAtiHwmw1cAXvh8876VKh6IiqXMHx3hvz0CaKycOoI8Up
 L4jCU6nv+/83g5qwXIBloQpN8kvNgvTxjVWAhFxjDl11PzthIU6bH9nFb68cBRuZ4FZe
 DkTw==
X-Gm-Message-State: ANoB5pm6OBU30rN1pNNSB49pUB/4V3XiYNsfvzuMftLFsmCsB9fxJdSp
 HI2HFu2OdW0tQKGGIdzEp7vBdTCuvURKuw==
X-Google-Smtp-Source: AA0mqf7Ayt7sArTWQYmZWFbaARfUlU0fPVDHgP9uu6RfqqlOWQq8t1FYj2qJtWFE0UW3Sn7ND803Vg==
X-Received: by 2002:a5d:5960:0:b0:241:bd31:fecc with SMTP id
 e32-20020a5d5960000000b00241bd31feccmr22727038wri.635.1669397664248; 
 Fri, 25 Nov 2022 09:34:24 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a11-20020adfed0b000000b002365730eae8sm4307392wro.55.2022.11.25.09.34.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 09:34:23 -0800 (PST)
Message-ID: <9bf22fa4-a921-2045-4427-481ddfdc1b9b@linaro.org>
Date: Fri, 25 Nov 2022 18:34:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [RFC PATCH-for-7.2 0/4] hw/display/qxl: Avoid buffer overrun in
 qxl_phys2virt()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221125154030.42108-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221125154030.42108-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

> Philippe Mathieu-Daudé (4):
>    hw/display/qxl: Have qxl_log_command Return early if no log_cmd
>      handler
>    hw/display/qxl: Document qxl_phys2virt()
>    hw/display/qxl: Pass qxl_phys2virt size
>    hw/display/qxl: Avoid buffer overrun in qxl_phys2virt()
> 
>   hw/display/qxl-logger.c | 22 +++++++++++++++++++---
>   hw/display/qxl-render.c | 11 +++++++----
>   hw/display/qxl.c        | 25 +++++++++++++++++++------
>   hw/display/qxl.h        | 23 ++++++++++++++++++++++-
>   4 files changed, 67 insertions(+), 14 deletions(-)

I am having hard time with my MTA:

   4.3.0 Temporary System Problem.  Try again later (2). 
k1-20020a7bc401000000b003cfbe1da539sm5571640wmi.36 - gsmtp

Sorry if this series is mis-posted, I'll try to resend as a
whole later.

