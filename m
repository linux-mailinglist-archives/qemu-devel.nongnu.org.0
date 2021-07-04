Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8FD3BAE4A
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 20:26:21 +0200 (CEST)
Received: from localhost ([::1]:46158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m06ou-00042o-Dl
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 14:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m06nz-0002n4-UZ
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:25:24 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m06ny-0006Z7-E8
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:25:23 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t15so15853983wry.11
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 11:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YQzqgfWY/bITiyIk0Y1gYpQZ8+BHPhmQzPp78H3HuJE=;
 b=J+L/+ZDJrkNJIz0XJzBXsxPI3QmffgC25u5dTefJBtbs9PuqOghi6b7t/HWJpc2hBP
 ddYh7I1s0BvgOiX4/EpAw83UJBl2jlFfdM7fr6eBmu0nnmm8eLnI4kqdehi1ki/VbVGw
 zR1mtOpbVhlz0D4iCvRFf5JMY5EQJWzgezeX35yzOAfkn+ax32Z/qkGBB3HoE+aiqcCn
 Gg7MAeeGHZ/4B3JB1jQb69w+EHwapCm0o9THXMpAMSSrSFigON0RoAewnnVVq2t6xErV
 paZuew84ZkIfZg9KhRmJ0qaqPuzrIg3TM1KS/AzVwk2ydbzd9gG8iO92h/bDqG8xRVG6
 th1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YQzqgfWY/bITiyIk0Y1gYpQZ8+BHPhmQzPp78H3HuJE=;
 b=J0Z9iWelcJUTOp7BeH41ZB5yaAFv0HNkcFCPGTiNKCuf4ROXgD8GY5IIbiOc1wmG0f
 lmP/jHzi4B06WTpiWtFFn2k3ns9hCpbB2JFfsBZ/V9jE15lsYo5OIQIwoxx4uvj/MM4x
 q0BnTMfC6LH+sYeU4kYFU0PvuAIkDnzZxp7p4kLzpbHIbsNe8frcD2SicnXNyyAzsGq3
 YYMejHvQ7vuRo3VMjDxbXrvoWFHmxId/dlmgS00Tiw3NEbJ5pz9dZxnedPSGySIRTKqJ
 tQC5h4/UDVkBP+iLiPOPgSZItU3GuZ1MbxqFdBRHQzh7LMJ607abaUtDTRaLceCx2FuJ
 oPlw==
X-Gm-Message-State: AOAM530aah60ykvz0PtEXcwIgwqGvVVhBJa3hTpydu8K4VY6MWKUSYCC
 UBKGLe3+z9pUQwawwDbWFSs=
X-Google-Smtp-Source: ABdhPJwmWU6KnwRwLjOFOWvz4Mf+tPlhjiigLI6e/k1Viyg387Raw3Dv+A3bhBwV0PXzBe7RbuKEiw==
X-Received: by 2002:a05:6000:1842:: with SMTP id
 c2mr11160844wri.426.1625423120857; 
 Sun, 04 Jul 2021 11:25:20 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x1sm10032901wmc.31.2021.07.04.11.25.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jul 2021 11:25:20 -0700 (PDT)
Subject: Re: [PATCH 4/4] target/mips: Complete UHI errno list and log
 unexpected errors
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210704170736.617895-1-f4bug@amsat.org>
 <20210704170736.617895-5-f4bug@amsat.org>
 <CAFEAcA_fCsO8WJDjsrdhADeT6H9A+jTDAnuWHJY=HKkPeW6-sQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <97b67205-6be9-bc88-92a7-af9386964397@amsat.org>
Date: Sun, 4 Jul 2021 20:25:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_fCsO8WJDjsrdhADeT6H9A+jTDAnuWHJY=HKkPeW6-sQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 Leon Alrae <leon.alrae@imgtec.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Richard Zak <richard.j.zak@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/21 7:23 PM, Peter Maydell wrote:
> On Sun, 4 Jul 2021 at 18:07, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> The spec only defines a set of host errno to translate to guest.
>> Complete the current errno set, and log unexpected errno (they
>> are currently replaced by EINVAL, which is dubious, but we don't
>> modify this).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
> 
> This commit adds the definition of the guest EINVAL:
> 
>> +    uhi_errno_insert(EINVAL,        22);
>> @@ -126,6 +162,8 @@ static int errno_mips(int host_errno)
>>                                       NULL, &uhi_errno)) {
>>          return GPOINTER_TO_INT(uhi_errno);
>>      }
>> +    qemu_log("semihosting: Illegal UHI errno: %d\n", host_errno);
>> +
>>      return EINVAL; /* Not reachable per the specification */
>>  }
> 
> ...but it leaves the default case returning the host EINVAL.

Good catch, thank you!

