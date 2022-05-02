Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 466145179D2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 00:12:38 +0200 (CEST)
Received: from localhost ([::1]:59730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nleHV-0001fv-A8
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 18:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle6c-0001uX-Nn
 for qemu-devel@nongnu.org; Mon, 02 May 2022 18:01:23 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle6a-00062t-EG
 for qemu-devel@nongnu.org; Mon, 02 May 2022 18:01:21 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so565209pjv.4
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 15:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4gKY+G1fRgqEayDtSif+IxP7Bgx7b5mo6ABS96/Mnaw=;
 b=OUde0J90Qw/C/tSm2yujFhZdLAiaDxhSMpUk0NO78RhrpsmQ7Uj5AHv6PnwRmARbiE
 37T1EAto0U+Pk9kVFMEgVmeg4WmE13PT200lr3eUP9fG37vXXIrFBZZb1VjFjpqICBlz
 TVsxuxmrXsEzBiUnYJQZankwQK+wxdLuANhdSlR/KxFyVc1IetfZA4uQNJWQ0chmupE3
 /PCkxGTwGbW113qtmtlTTbWykkD4bRwHhdpKWdhjbKNNl344wYOtayZH7N/T4Ah0VQFv
 TwK5AQQTh6ADhcdbF6fx3d6ZSmRtXL7hTKpPS5b/7HdvXhNVI+ELyhUk8Zp4vgbwbBtD
 BQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4gKY+G1fRgqEayDtSif+IxP7Bgx7b5mo6ABS96/Mnaw=;
 b=vYkl8rOLki9j/YRE2zoVTES4qagd5BT709IBUNcWHhgzVKqW5j2/1bzuBs+eGJ0Snu
 0fdq+e45uifcbQdHnHIYYpiCo/AmRUz1HMChcLTo+yrugqrCi2/q8ATrVT3ZJ0fVtr0X
 ZunZqoYMJNczzQ5d8T7xppYM3l/0zP1T1GlKAqoxi4XWigwo5q700KZDfG69okSkMs9T
 Q08UyP9QHkZFBhRkhqe9r3bmViDjySQ7CS6u3gLEc4Ee/4Ak5X/L9pug5oo6dsLAPKXM
 CtFfrJWapA0CmYSng1rehdcVrBDK6XnarELDuJWRuwCnuOYKLH/9x0LIDUN3rBmYlfpe
 gxIA==
X-Gm-Message-State: AOAM5300zbtyJcguikOr8Fc230FtmNfR0e1KuSMtioMY6SiqGPgNefxY
 az7XhFeXl8cPJDLKtlg+yaDh9D6kCyiNOQ==
X-Google-Smtp-Source: ABdhPJzCbUJh7m/y2xrkmS1SoChDLqtYLyF2OP1qioJ9pINJ2OufqmVcGALR6nBF9Ft2/tT4GFOUWQ==
X-Received: by 2002:a17:902:f24c:b0:15c:b564:e4cc with SMTP id
 j12-20020a170902f24c00b0015cb564e4ccmr13493944plc.137.1651528879020; 
 Mon, 02 May 2022 15:01:19 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a62fb16000000b0050dc7628167sm5140846pfm.65.2022.05.02.15.01.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 15:01:18 -0700 (PDT)
Message-ID: <984f8922-c296-91ae-1208-752bdba548ee@linaro.org>
Date: Mon, 2 May 2022 15:01:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 20/21] target/ppc: Add unused msr bits FIELDs
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
 <20220502143934.71908-21-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220502143934.71908-21-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/2/22 07:39, Víctor Colombo wrote:
> Add FIELDs macros for msr bits that had an unused msr_* before.
> 
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

