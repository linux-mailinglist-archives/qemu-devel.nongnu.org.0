Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79623C1AB0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:46:42 +0200 (CEST)
Received: from localhost ([::1]:51536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1auu-0002LD-Ur
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1asc-0000M4-Py
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:44:18 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:43826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1asa-0000A1-RR
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:44:18 -0400
Received: by mail-pg1-x52a.google.com with SMTP id y4so5089225pgl.10
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 13:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gQ2Ql9Qqvr6lDr4ew8szqmKuoQuWkzHbCXkH0AedT5Y=;
 b=yepn3Popofgl/pwrpwtMTVdOz0XpWyT07ioZ4zsea9OEs6CiWNYKJyklfZR1Tk9FrC
 p23PUsnmJHkGjTV7WL26GUOM83ipV661bVeaVTos6Q5TPsofJUwcs0reAQGa8TPq70wX
 6lJa64ihz05gCHkpZQ9GQUYyuKafSljuDOjmx7C+puiNRftYsW638cjJUTuMpYIXroDX
 bD7KTt+pA9QFtLJWd2CzYguktDFnqBbavTbTEPBHlv7j7ycnvchBJxTmiglUduDKrqhV
 fK75iTLcGdS5w753+YwNFgXkn8dNK0WcJ42ytktSuvLebPQG5dnGYloYjhgueUqynxHj
 QLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gQ2Ql9Qqvr6lDr4ew8szqmKuoQuWkzHbCXkH0AedT5Y=;
 b=O93ydGncwUIkr4MToEEgyczG7sTVohDn3yL9NnohgBJ0MpVdzp3mCEN8r9yFBFrYYz
 fBxqxYWzx1ZvGQc2S3oU4ZGsPyqv3IwINDNX7wtVlfiXJ9/834vHUEPoVADtYbyBf4RA
 RPHgRPOmAzfMOZW6jm13osldMLgPX39ChmJVYnz8rnokThO6q8wSs3ygjyvDPH7YZpTT
 S/ipAxxgTRdzSMS2L/2bPEFPDeuv1oxj5+sRdXrR7vzFFizWqzf8L1RpT42tkZ4PQlm+
 P04dR9wVEORYDZLtZZ9dVRB4vErE8gQWRnFyNWZo46ixNreh0iWwTJsDGYmkdodFC6JZ
 t+8g==
X-Gm-Message-State: AOAM531qubGjxsvKrJLsvE1gIvmE8VPDuBGZ8HtFFz+RwAuL1vuimr7/
 77XM23vci7XH+skUf7CjahmO2A==
X-Google-Smtp-Source: ABdhPJxoNe9LNc0SevP+Dxk+hGukGQ5elHy1zn/YOJZx5eAZPzcpsImEUahjEW9Ro8Hiv+vwZuPLbA==
X-Received: by 2002:a65:63c1:: with SMTP id n1mr33941271pgv.398.1625777055535; 
 Thu, 08 Jul 2021 13:44:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 9sm3951189pfv.42.2021.07.08.13.44.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 13:44:15 -0700 (PDT)
Subject: Re: [PATCH v2 32/39] contrib/plugins: enable -Wall for building
 plugins
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210708190941.16980-1-alex.bennee@linaro.org>
 <20210708190941.16980-33-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <429ec04b-b9e3-67c2-0c69-ac0288873c35@linaro.org>
Date: Thu, 8 Jul 2021 13:44:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708190941.16980-33-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 pbonzini@redhat.com, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, Alexandre Iooss <erdnaxe@crans.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 12:09 PM, Alex Bennée wrote:
> Lets spot the obvious errors.
> 
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> 
> ---
> v2
>    - also $(filter -W%, $(QEMU_CFLAGS)) from the main build
> ---
>   contrib/plugins/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

