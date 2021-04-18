Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF286363767
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 21:52:37 +0200 (CEST)
Received: from localhost ([::1]:34302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYDTA-0008K2-Q2
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 15:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYDRu-0007uT-Rd
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:51:18 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYDRr-0008Lr-GK
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:51:16 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m9so19048539wrx.3
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 12:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=28EduyGxVuXpxRHFpgSbt7E1QkKom/BPy+TD2Zrdy4o=;
 b=hi5ZVlOUtvp/jpclzDflMD/qGP9ez9sJYabHhS0e0tfsKuf9ZnkBMJ1Xed9tzOd1p+
 A0r4w1UEafkDDER761i8szilZRAmesA9FhzkOWd4I/oFI0bdNwhqtKQ7gfA8OtyMNHM/
 vfGzvsCd5QTNz6usInkiIZZ1Cy0TXh+Me0o2yZpJXUffzSpZbytreUNtxtx2vaITWL2W
 PIQ8z6NNGmAzjUuyNP0p2NG+nUnIOC+lCkSRE01nsoHYCYA2gO5N42RQVYlhYGOOM6nZ
 Mxmf75nAiZDEjHqSAS8XBfNjfi+N8wxZithqODPIxuebHDI/OElnGBHrVS2IStCh00dJ
 Ft3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=28EduyGxVuXpxRHFpgSbt7E1QkKom/BPy+TD2Zrdy4o=;
 b=c/wjA2lblC36fmqX8X1fMKkcwpe/S5bYBO4r4RvcIHZlzSs1bR3qDYDUMtiEJzyShd
 9Y/iLv9injegSqFAL/xRyMvJqLXO4BWVbj1RoTmotdq0emJ+BvwcbKsF3b3UXlKHo9uO
 rFKhBMwoAhArosNGZx50WUmeKsDK8RM/4JMNZ+E4900kSwnJlI8JRk0Ejv0U5gt2uEiV
 4q23E6eO/YHAX5Toc/66Wj1iYRV0F+loqeb/3qHRY6mHxTKAwb4WlH5CywJ1J/+5sU6C
 Obq2+wnBh4IQ1WRjWYLzvr6lcOZ73iVHTf7sH7+oE+uKF02JX3YMiaNPaXqN7FK40AWj
 VQww==
X-Gm-Message-State: AOAM533J1AzXUy2OOJcfsOkSx9HCsBOpJu0SOQkktS+ekjuzWQbfCEZ+
 OesopDboR3UJXniZZqgM4EI=
X-Google-Smtp-Source: ABdhPJylGWTNreQn3jSNA87FaTdQud67OCMNeLuv6eVeysr2+ml/+jGKMEb5TkKGSxpta6Ki8go/6g==
X-Received: by 2002:adf:eec8:: with SMTP id a8mr10927659wrp.382.1618775473972; 
 Sun, 18 Apr 2021 12:51:13 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f7sm16915346wrp.48.2021.04.18.12.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 12:51:13 -0700 (PDT)
Subject: Re: [PATCH v2] hw/mips/jazz: Remove confusing ifdef'ry
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210418165102.1139848-1-f4bug@amsat.org>
 <31d635b5-fbd8-7971-4ecc-518b42e8f3e5@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2289eaca-8602-4942-a0e1-9d2133d1d0ff@amsat.org>
Date: Sun, 18 Apr 2021 21:51:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <31d635b5-fbd8-7971-4ecc-518b42e8f3e5@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Claudio Fontana <cfontana@suse.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 8:48 PM, Richard Henderson wrote:
> On 4/18/21 9:51 AM, Philippe Mathieu-Daudé wrote:
>> The jazz machine is not used under user emulation and
>> does not support KVM. Simplify the ifdef'ry.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
>> Reviewed-by: Claudio Fontana<cfontana@suse.de>
>> Message-Id:<20210226132723.3969650-3-f4bug@amsat.org>
>> ---
>> v2: Rebased.
>>
>> Based-on:<20210418163134.1133100-1-f4bug@amsat.org>
>> ---
>>   hw/mips/jazz.c | 4 ----
>>   1 file changed, 4 deletions(-)
> 
> Were you going to apply this one before my cleanup to completely remove
> this hook manipulation?
> 
> https://patchew.org/QEMU/20210227232519.222663-1-richard.henderson@linaro.org/20210227232519.222663-2-richard.henderson@linaro.org/

Doh I completely forgot your patch =)

Let's forget about mine then!

Regards,

Phil.

