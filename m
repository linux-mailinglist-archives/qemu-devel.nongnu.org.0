Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908454975E2
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jan 2022 23:02:46 +0100 (CET)
Received: from localhost ([::1]:46348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBkwf-0003j3-EA
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 17:02:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nBkvA-0001y4-8m; Sun, 23 Jan 2022 17:01:12 -0500
Received: from [2a00:1450:4864:20::332] (port=38561
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nBkv8-0004mu-NU; Sun, 23 Jan 2022 17:01:11 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so1853974wms.3; 
 Sun, 23 Jan 2022 14:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pTGQX95Dv8AoDcbQQ93OOXTT6OP+9Q7MmFjvZWVUJdo=;
 b=Yc9J0mWLtCvbP+9M2wsFmRmECI9gQ0hs3e1GGW4+XcSdh+A4Cs6pFuNYrW8USRfRFl
 5J/y2Vz6vO9cEAeyd2s4eyrMk+2h6ourhDHrn/wzcqoiSDPUq1ts9RJZV9Z3l0AMrl6R
 fXl0YUxTyDytOoAmKeb6mJw4JuMrvKlkTfoWjzrC/jr9pRxI0mQVUTK0jEeF1B4yoLHp
 DdaXBCrpnjzJ7vH89/5h2/Ogx7WdNltu4peuKk3ji6tyYt3dWQ76Lv8WBDOevX+5SY0j
 ulPgJGcXAOB+ny+7Z3GuZbEFTwE9m7yGSaQ4WRn6yjPZiFOs88uhv9axYM4HbGpVcQN7
 3B8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pTGQX95Dv8AoDcbQQ93OOXTT6OP+9Q7MmFjvZWVUJdo=;
 b=joZMPtrB86YnX+0C8mGRKPrOieqrGP4ByTq2AxRSilw7sU2cB5taM0lYQHRdLBUOYy
 Xue7qXKIO/47tRUs3EoN0c/g3HQzNCIV4hb+jMzdcQIEQrpop+z9tmOZfo74JVJjorSQ
 OsHzIsYCOO8ZxolSHAyyFFgj9dsLhn6x3aC2kywnHZx5xogHvPeBwSdmoP8q3RTLT0hc
 JBB/wXBPE79jfJ4OAbR4eFqLIqVZOVvnxsfD/j3mMeRbdyMXSzofcAN7VVI1KwLR9879
 bl8ZbDshaul7VsGeDjd29KOldo9MrRuVWKctOaBtX0+TGpYPIfyfQk6EFDoLjWGT7mz+
 RQuA==
X-Gm-Message-State: AOAM533XTzGYRjs/pIFJb7MrbehnsPl0rG2juuVPpK45jUyXld5v0k54
 uN+P7RIZinvUHmITAMygVVxBUQsdvo0=
X-Google-Smtp-Source: ABdhPJyL0qBRGYWkJi490QxLQFi1wDHy3EjHaSFNylC5L5IWIiJ8ez0s4kTo9vrRBg5lfNMYvUloyg==
X-Received: by 2002:a1c:38c1:: with SMTP id f184mr8976682wma.153.1642975269078; 
 Sun, 23 Jan 2022 14:01:09 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id t14sm2236211wmq.21.2022.01.23.14.01.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 14:01:08 -0800 (PST)
Message-ID: <701dc0cc-e633-e4ab-fcf0-e074c1a41423@amsat.org>
Date: Sun, 23 Jan 2022 23:01:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 02/14] hw/intc/arm_gicv3_its: Add tracepoints
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-3-peter.maydell@linaro.org>
In-Reply-To: <20220122182444.724087-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 22/1/22 19:24, Peter Maydell wrote:
> The ITS currently has no tracepoints; add a minimal set
> that allows basic monitoring of guest register accesses and
> reading of commands from the command queue.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 11 +++++++++++
>   hw/intc/trace-events    |  8 ++++++++
>   2 files changed, 19 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

