Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFFF68C32F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 17:26:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP4JK-0008GO-RL; Mon, 06 Feb 2023 11:25:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP4JA-0008Fq-RB
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 11:25:32 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP4J9-0008PX-Ei
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 11:25:32 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso11167098wms.5
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 08:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NcPTiRXzMJKgo7GQ2Pw2GvRH1TKbfDnYqxaZ8KaGfWw=;
 b=v2WvNEYH4chn93AM7kuB5OvFW5kTF65jXJSgiTeh6Ib3VamUJMQudeg7ZzNnPS8Lu5
 5j4jV1CJ2OvUWwspiqq14z+nxYrUGRnWu9vZu0J6tYIVekF554xWA8mmbMMHS3HrNbzI
 AFcZKpOxIWaCumuPkoLWPe3hzsGFNOD4kaXGzaKyLF4jpD35RMOwXNwsXTmW2IEpUXln
 +h9tdeJL9/Lg/e8l5ovMWukVNAByXDnMAnS8QmiD43/LYYopSCSsUqZaRPus4sAjOn9d
 +jEYAgzdJepmFfSkeyDmNvrayPIqLektwXWvdUgK1FH6QOWGPMqIra1opMeInJxIQpsG
 AqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NcPTiRXzMJKgo7GQ2Pw2GvRH1TKbfDnYqxaZ8KaGfWw=;
 b=XSAUyKl8IsOomFFSQ+T4xlCx0TrOuwmis4vBL6WGqTrr4PkvXyTztUMZskjIW8WXha
 Q/CnEFjZjoGcFGp1zQxufNw1pzekAmZu0L2MRxXvL5tSMdNf1Ix7lRlkAYvVc4oL1BmO
 DAtSLjKEDd4KtITIFhM+sm4I1qB6dYpCZ5ynH5ETBObmGsNdIanRxZD47S3xPjp/NGVf
 OvM7PH/LadbDEKcv83ztbbriJ9EtaxUaScS8B4UzTksbA9I3udFni59rE1xoxt6AIlfa
 zimVebS0jfLAuYIZQtYuYzhHj699T7nyjo+PWAyDOaVhIYyCKzZUiQMEc4U1Q0sNxTdm
 2Iig==
X-Gm-Message-State: AO0yUKU8uSMSF9/Loi0yj/tjJc2I5NTiHCjQJMCuFycCCBXVJ1u1K0SJ
 oV8c809D/0J36kWyelRUMKlhm6r3BDUB2bpf
X-Google-Smtp-Source: AK7set8bq1R7uZ1SG0OjZ5k4nW9ISOzI5F+VNFL5uNXNER1spepNcccFr4j6y7bWL83eJwczhYgiPA==
X-Received: by 2002:a05:600c:19d1:b0:3e0:15b:47b3 with SMTP id
 u17-20020a05600c19d100b003e0015b47b3mr251232wmq.32.1675700728811; 
 Mon, 06 Feb 2023 08:25:28 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x9-20020a05600c21c900b003dc434b39c7sm21534192wmj.0.2023.02.06.08.25.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 08:25:28 -0800 (PST)
Message-ID: <c5cfed8a-e07d-b74d-b236-757ee1fb007f@linaro.org>
Date: Mon, 6 Feb 2023 17:25:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: hw/misc/mos6522: What is VIA_TIMER_FREQ value?
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, "open list:PReP" <qemu-ppc@nongnu.org>
References: <35205d94-c19a-f41c-899c-89214296075c@linaro.org>
In-Reply-To: <35205d94-c19a-f41c-899c-89214296075c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 6/2/23 17:22, Philippe Mathieu-Daudé wrote:
> Hi Mark & Laurent,
> 
> In commit d811d61fbc6 Mark defined VIA_TIMER_FREQ as 4700000 / 6
> (783333.33) and in commit 6dca62a0000 Laurent defined it as 783360.

Also 4700000 / 6 in hw/misc/macio/cuda.c (commit 267002cd28).

> What is the correct value?
> 
> Could we define it once in include/hw/misc/mac_via.h or
> even include/hw/misc/mos6522.h?
> 
> Thanks,
> 
> Phil.


