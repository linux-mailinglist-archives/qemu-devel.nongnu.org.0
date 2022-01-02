Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5359B482CF1
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Jan 2022 23:15:50 +0100 (CET)
Received: from localhost ([::1]:58586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n498n-0000wj-28
	for lists+qemu-devel@lfdr.de; Sun, 02 Jan 2022 17:15:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n492a-0004PP-Lt; Sun, 02 Jan 2022 17:09:25 -0500
Received: from [2607:f8b0:4864:20::102b] (port=53206
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n492Y-0006ya-Cp; Sun, 02 Jan 2022 17:09:24 -0500
Received: by mail-pj1-x102b.google.com with SMTP id co15so27485657pjb.2;
 Sun, 02 Jan 2022 14:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sSCQ4qeYio2I597L9EkmqqhfLUA+xZPKozCZ2QUETAc=;
 b=Uf5mmRtXI1O2q5nQ7x6vFuWW92H28KutLySbflXQDHe32OBX8xbxWzupbdZVqfkMic
 oCf6CBxFKRDTdEkTj+mmrdYrsHCA414Sh4My5JXGw3a/vmxc5NtOYx4dEA4RgeMIVL4N
 jTdi2e5NYasIr8ywwJiRDk9mqtWXkYGZ5N6jYgnHotJ990qZcwTExDDhonG1BEyElAL/
 tuZbtfp5f2VShlEQXyPdkNeuWGvVOdiV9AZsR8DT8Bt3TKWA4h7VlL45e2CRX0OOlwxa
 d6/qVtXXFutNno75lVi9CpbZVUYpPoq/MMooqVgYTAY5xzfh7PwFKndyPeFjVT+QOMjx
 RL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sSCQ4qeYio2I597L9EkmqqhfLUA+xZPKozCZ2QUETAc=;
 b=DCUx4IBI3w79/pAM1G9dA2Dqb54wi7+1kKCQX27pLVa9ukSEKG6I+x43PVm4xo0+GL
 349Z//7XXZGblTLbFwfnHvKVyZAEojrXuUAxHC0PJccXZZ/PGI9RJU9WpgTrKuO6ixPB
 ESHLwfXJFEElxwMVhLcR1gQZrKLZxH/aHAK56IPe2EOoLUo792XFldB3TTHV2D9WQqQp
 24DvOf1TKDLA5XWxOpMxvw36/0aGCUqrxZkV5aPWC4Voj8eAfu+hf8+BIhm5VIQgoT1q
 1Png2QVBZtR3HIHubL6GnMVkwh996kFiLmjWlLHj1Lcxz/slKMGPD39g7kxXeQZbYOKm
 Yc8g==
X-Gm-Message-State: AOAM530kCDYU+mXXqk9Yi++oUCe90oemPeZfU3AgoNtnSSry+FhEfblF
 KLqCiHljCrAso52ibRHd1EY=
X-Google-Smtp-Source: ABdhPJz2Y0u12J0KZyeSXZhNAbUFhafm3Q0EHFW9HjzqqVIZi4zb9oQd+dJUFytZJ1AGsZDzXNdKoQ==
X-Received: by 2002:a17:90b:1751:: with SMTP id
 jf17mr52627750pjb.172.1641161360756; 
 Sun, 02 Jan 2022 14:09:20 -0800 (PST)
Received: from [192.168.1.37] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id s8sm34770632pfe.196.2022.01.02.14.09.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Jan 2022 14:09:20 -0800 (PST)
Message-ID: <4eb532ef-9260-334d-fd54-c6589e563849@amsat.org>
Date: Sun, 2 Jan 2022 23:09:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 4/4] hw/arm: kudo add lm75s on bus 13
Content-Language: en-US
To: Patrick Venture <venture@google.com>, peter.maydell@linaro.org
References: <20220102215844.2888833-1-venture@google.com>
 <20220102215844.2888833-5-venture@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220102215844.2888833-5-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: wuhaotsh@google.com, titusr@google.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, crauer@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 22:58, Patrick Venture wrote:
> Add the four lm75s behind the mux on bus 13.
> 
> Tested by booting the firmware:
> lm75 42-0048: hwmon0: sensor 'lm75'
> lm75 43-0049: supply vs not found, using dummy regulator
> lm75 43-0049: hwmon1: sensor 'lm75'
> lm75 44-0048: supply vs not found, using dummy regulator
> lm75 44-0048: hwmon2: sensor 'lm75'
> lm75 45-0049: supply vs not found, using dummy regulator
> lm75 45-0049: hwmon3: sensor 'lm75'
> 
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/arm/npcm7xx_boards.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

