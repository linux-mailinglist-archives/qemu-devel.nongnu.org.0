Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CD22F1DFD
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 19:30:05 +0100 (CET)
Received: from localhost ([::1]:60478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz1x6-0005BA-Ek
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 13:30:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz1vJ-0004iM-Fl
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 13:28:13 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:46983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz1vH-0001ux-2G
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 13:28:13 -0500
Received: by mail-pl1-x62d.google.com with SMTP id v3so264168plz.13
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 10:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vC2xyEZGVdI3XYeMeHIdBlJ80siV7yGG12Le/HBlz5w=;
 b=gVpZj2o1O4KawhccTJpzfuwLwM6GjeLgsSc5j1p6XO0KdhVQLz51rKb/cMs2tRswcV
 n9ORg42juMvLBmqLCgg1eO+Jwesk3P5c0ewbwyLgV9zXP0CcSESgfzlCPdSaN1CQD0ON
 SJNCyAZ5i0LiqbuRPGTE0caGc8Rw99DoJ1KLXayGMziINDbTrrPlu6DjoyxISLzJXQa4
 EtHXNVObPIqy0CqxiImQZ13w/Rcjpk0lq4KQ1k+6ZXj5oTG6aLubZ6RpdGLrjp7p3sb6
 fGj4U5WdCbbhIKFib44wyjvYwgzcOPdF/v3e0ModIyqEZVmp8emk8HznECfNVlGkMwAt
 rhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vC2xyEZGVdI3XYeMeHIdBlJ80siV7yGG12Le/HBlz5w=;
 b=Poi6MvoMIP4PWIAExc5MtPkxq+iFbpdXQip4UiEQtBo/CeDJ42S6k2EkMpWr/P9ZAM
 89N0ylDE1wuOTTrvDNG06ESKyR8p3u36ILUq9tjTYem2++FAhyPbhaeNN7sa54EqUVsI
 y1edKe74DVqKefFZzaDk3X395tY9JuTCBZN39WZJqLLnxfe70q3gu5c1vgJxcWPyxwiI
 qrPFB+ipiNpEgnUOAH4Ah1Qd5Ina3U3zBbaYgBiHvh/mVugtdghH1FvHN5fPkVID5aqw
 WzCSlqkBo92XRpgovUVqeNEdA+VzEQXu2nZHY3+/S7VhqLYowTRtrMjQ//5KR23yjPnZ
 vYmg==
X-Gm-Message-State: AOAM533j8CgEPuYWl/dGXRvtAH854VRI72FLiOxu1dfBaYurcqugEUI4
 9C3iWaQ5RJT59wKM7Irq1BOOCQ==
X-Google-Smtp-Source: ABdhPJwXJXY51H+w0/VXTCAb5E/Odn6TSz3aV23TsvCG2dhzr1b1p1176akuyZpFlJSgeEb8vpvGGg==
X-Received: by 2002:a17:902:a711:b029:da:f065:1315 with SMTP id
 w17-20020a170902a711b02900daf0651315mr1039978plq.36.1610389689082; 
 Mon, 11 Jan 2021 10:28:09 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id x20sm319262pfc.3.2021.01.11.10.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 10:28:08 -0800 (PST)
Subject: Re: [PATCH v3] decodetree: Open files with encoding='utf-8'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210110000240.761122-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e37c7197-7614-2370-3722-c30df90f2dc2@linaro.org>
Date: Mon, 11 Jan 2021 08:28:04 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210110000240.761122-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/9/21 2:02 PM, Philippe Mathieu-Daudé wrote:
> When decodetree.py was added in commit 568ae7efae7, QEMU was
> using Python 2 which happily reads UTF-8 files in text mode.
> Python 3 requires either UTF-8 locale or an explicit encoding
> passed to open(). Now that Python 3 is required, explicit
> UTF-8 encoding for decodetree source files.
> 
> To avoid further problems with the user locale, also explicit
> UTF-8 encoding for the generated C files.
> 
> Explicit both input/output are plain text by using the 't' mode.
> 
> This fixes:
> 
>   $ /usr/bin/python3 scripts/decodetree.py test.decode
>   Traceback (most recent call last):
>     File "scripts/decodetree.py", line 1397, in <module>
>       main()
>     File "scripts/decodetree.py", line 1308, in main
>       parse_file(f, toppat)
>     File "scripts/decodetree.py", line 994, in parse_file
>       for line in f:
>     File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
>       return codecs.ascii_decode(input, self.errors)[0]
>   UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position 80:
>   ordinal not in range(128)
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Suggested-by: Yonggang Luo <luoyonggang@gmail.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v3: utf-8 stdout (Eduardo and Yonggang Luo)
> v2: utf-8 output too (Peter)
>     explicit default text mode.
> ---
>  scripts/decodetree.py | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 

Thanks.  Queued to tcg-next.


r~

