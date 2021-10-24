Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5428438C0B
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 23:18:14 +0200 (CEST)
Received: from localhost ([::1]:33086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meksg-0003cs-0N
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 17:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mekrB-0002OB-Hi
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 17:16:41 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:38498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mekr9-0003dT-Kq
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 17:16:41 -0400
Received: by mail-pg1-x536.google.com with SMTP id e65so8939824pgc.5
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 14:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XmC91ZkfXjQZHpeTc7dabrgrdA1lFN6s90H5sHxWj2s=;
 b=YsOCgnCxA/E4JMaCrj54H5sOQFRXy7f/00dzmGjhUoxu5Zqyxb2gvsUPL1c+5fs++z
 kMME9Ty6YXnZPRRc4xo2RRck3uV7vdjhOq8qYJks9lGBBq4VelrUYDfomoycr9ICUi7e
 z/kG/S0GjbKUcw9zNaZu4QuAyA/pPahl/dEWe2VyhL+NXEX99LHC9bqYlbAwd2b2fwTZ
 tKdbsm2vgeNqiTwltpu/d1RB81CrANFmQkP1qlfUAipPxoPspZgY+1GW3VGWEcB5/v1B
 /zGBayvOnJzo8nHGhDZM4PoWOwbbPGmnzMUyabiOFDTVevRglYjrQkk7fxebCYx+DBk3
 TZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XmC91ZkfXjQZHpeTc7dabrgrdA1lFN6s90H5sHxWj2s=;
 b=FY+jfQASE8Vx8VGHeRn6vxrHofxo0tEV4WxeQZhN0L8xKDKkSWsvvbgx92c5sjNYiB
 R6kaaHerJIkImm2TDIemWwaIHVeLTsYlobJQh/b4cQcOaJ1AwkxO4UggaNeVU0His/dA
 o+tMrmLSvC9vB6PYp5wbnDSIV53bAETF9NVwsFhWw/vbIsuelI1qHAtzlkApjRPjs7cu
 RmZTRegWqarQboogwkWY5XshtwKD20F7uPkj5jR/eOW1Ao5org/v7R2rv9wTGL3bsgpL
 xE63ctbNi0r0lmqNC6+yySRFWvDjNtaghZxKp8guPvis9BMp+/lnvFF3zsbLZ/+mbAGU
 cd2w==
X-Gm-Message-State: AOAM530ny3zSgwSW65btdj9Lp9ZTbcjzZ/9ySk5qoawR86ah+PWy8oA2
 7UNJLE7tXM1fWlfbfKfFe5hV5w==
X-Google-Smtp-Source: ABdhPJzqr8y3WYzE7VeSJu+a5Sq/PzncXJRIOKsiuJVE+qKz8TL3EY2CLGt54C3MipXPM67wb9j3DA==
X-Received: by 2002:a05:6a00:a8b:b0:44d:ef7c:94b9 with SMTP id
 b11-20020a056a000a8b00b0044def7c94b9mr14552829pfl.36.1635110197898; 
 Sun, 24 Oct 2021 14:16:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id h12sm7918639pfv.117.2021.10.24.14.16.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 14:16:37 -0700 (PDT)
Subject: Re: [PATCH 31/33] target/mips: Remove generic MSA opcode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-32-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4cfe8d61-8f85-6822-6901-7e8b8fdcc856@linaro.org>
Date: Sun, 24 Oct 2021 14:16:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-32-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.33,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:48 PM, Philippe Mathieu-Daudé wrote:
> All opcodes have been converted to decodetree. The generic
> MSA handler is now pointless, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/msa.decode      | 2 --
>   target/mips/tcg/msa_translate.c | 7 -------
>   2 files changed, 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

