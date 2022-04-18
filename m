Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0268F505B5B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 17:39:23 +0200 (CEST)
Received: from localhost ([::1]:57166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngTTB-0006bi-NS
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 11:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngTRx-0005va-C2
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 11:38:01 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:34504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngTRv-0005ny-K6
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 11:38:00 -0400
Received: by mail-pg1-x529.google.com with SMTP id t4so19526408pgc.1
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 08:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Ksa86HoDvBHXwLS90E+a+V/rD8ZRYeu+LseUVEJFnUM=;
 b=tpwpJpWWUg6DnBABVZSfe7RbTHnFoq/hAA5SlOIshXkppQlQueWuTz6TsR6dStTtB7
 8QZlB98a8nHgCNpfiOGUGuvbzO4lvK50kaWxCv7ezsCfuCv3D60yjNSAGanpPT3M5BcQ
 aqroxOCewbs0mQoDqn79laT8Jygcdt/Rx6yP1SKMd+vx4zsFZv2rHzfEXyQjZ5wHMBWx
 nQWlSMlMsQ/RaKji7/XzJOA0hYttbhDI7VI97iwMHPPnDM8OHMxHKQuOfTWl1Jr5V1M9
 zDVRtyOOEqxU+ZNwBNyc1jvMHv1gQ9CHIyhRw896Hit0rbEm2o812Z7LFTsFmbFgdxS7
 TtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ksa86HoDvBHXwLS90E+a+V/rD8ZRYeu+LseUVEJFnUM=;
 b=2Dn6XXDBBYF3QVHfGhJ6FjFPYoI8tQdQ7cKCFKnyFeyugo8m1/nGfAUf2dGNcT6OJ+
 C5ukkosPsCEt1gczxgKkBATD5HpRPj/nK/fgM9h7XZcwtSZAmeebUeBkVwG4IVcP6G5o
 ykvW07etpdG9L7Y7Nhm7DU+GxBQXlQyhiUhjfVFJuSjrccrUuTFypjkMC/95qJ1scZJK
 EUPE3wJjN34lMbBqwZaiOZXBR9MtUvIZbOyAcTNb7DHmS2WCW/vJfRMcCZO+5lu5blP8
 Evbs/cwTZV1zukSQ2Kn9jkmN9UQlQfFLrHspyUYThFXNrFVXlaAtHSZzv2E+JokfHDxv
 lq5Q==
X-Gm-Message-State: AOAM532Pt/SR8Z5DZvdrgL0RKT73lUZ/WDQUAGjlUaA3FQ89qg4pn9n9
 KUtjaPdUaUQEP+0gMC5Y+PCdFg==
X-Google-Smtp-Source: ABdhPJyqLookoCdRQQKeE4I2koYXJNv3DmEzzLCKTWq5eeiat4iU6vwgT890qBvD6AxJt3Hcl+lwVA==
X-Received: by 2002:a05:6a00:1583:b0:50a:7eaf:f8d3 with SMTP id
 u3-20020a056a00158300b0050a7eaff8d3mr3580300pfk.78.1650296276763; 
 Mon, 18 Apr 2022 08:37:56 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a639412000000b003820bd9f2f2sm13420127pge.53.2022.04.18.08.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Apr 2022 08:37:56 -0700 (PDT)
Message-ID: <aa16cc6b-0ff9-5870-118b-ceb24b584fe4@linaro.org>
Date: Mon, 18 Apr 2022 08:37:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Question about direct block chaining
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <SN4PR0201MB8808BF460C02884C603641A4DEF39@SN4PR0201MB8808.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <SN4PR0201MB8808BF460C02884C603641A4DEF39@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/22 07:54, Taylor Simpson wrote:
> I implemented both approaches for inner loops and didn't see speedup in my benchmark.  So, I have a couple of questions
> 1) What are the pros and cons of the two approaches (lookup_and_goto_ptr and goto_tb + exit_tb)?

goto_tb can only be used within a single page (plus other restrictions, see 
translator_use_goto_tb).  In addition, as documented, the change in cpu state must be 
constant, beginning with a direct jump.

lookup_and_goto_ptr can handle any change in cpu state, including indirect jumps.


> 2) How can I verify that direct block chaining is working properly?
>        With -d exec, I see lines like the following with goto_tb + exit_tb but NOT lookup_and_goto_ptr
>        Linking TBs 0x7fda44172e00 [0050ac38] index 1 -> 0x7fda44173b40 [0050ac6c]

Well, that's one way.  I would have also suggested simply looking at -d op output, for the 
various branchy cases you're considering, to see that all of the exits are as expected.


r~

