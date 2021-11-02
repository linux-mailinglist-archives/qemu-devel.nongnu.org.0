Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73125442EB7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:01:39 +0100 (CET)
Received: from localhost ([::1]:42630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtPy-0007Bb-4e
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhsxZ-0000E0-Br
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:32:15 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhsxX-0000Gl-A9
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:32:12 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t30so8211322wra.10
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 05:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HNzOyPOrrNPv5zz5w9oNVoN46TAjiUvvfRiQwQcmFbA=;
 b=Mpu3LFFIAWS1A5hh+sbZknVOb00CC1lw0wtfg8vjRBeb4oCwZnnnEeSnm3gtJEg5ct
 wzNwO8ikWgB7WLfGTlCB1fxhuI+HU0jUfqLt8f+yjSsK1wYy84EY0cw/7dAQD4o4X92I
 KD7mOghoLVi7ugzWwOYI1FwaTx3/AwkrZuvOxqITE9W9sQoo7uRrv+auvlpBQdKnqzwG
 E5tTbTdt0YLEch5weBUVxINFQ7uuPEumVk/cejdUsaTwvNxYmi/+LmpA7DLbQHZWBbub
 RTrVHncwCgHc2u/qAKDqSDbeHtRSCfwpG1ysFAwh/I4e+vJi2pf7sA7SXrzx27eMpZ6V
 KbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HNzOyPOrrNPv5zz5w9oNVoN46TAjiUvvfRiQwQcmFbA=;
 b=OnzfGX/MYEw7wf7ktBOib+J5d59Bks92n6Rubr9kSEkm82RSQOyTTi7cj/exiiEeeA
 Y3aWHXOxoVGFYHi1EXNZrW24APEy89+aR0d+4Zp3z0w7GgB+lTjCMCSSsJqWYGhOLU0i
 +M51rcjBMSe/Zxj78hRvoQndiqwdP/xuffqSAd9L55S1CrN+ma5ipZZpc4OQ3BLTdmsf
 Y/qPO46QfizVpMdwm16mC/TXwx8kddgCX7SOdTB/+mOzJxaG37ppSiXb+m+fQgavU4SC
 5weNAVJcCeUjKJYvqWDTyxOQKyukbLPOp2AW6OCNb6y+BBpfVg2SUA8rwKRgjC8Et83j
 /SuA==
X-Gm-Message-State: AOAM5313CSR5ngU6ZKhq01AfUaTxk23rVTxmmeQnCPr6G4VdWBUOmsdH
 huVdGBB09lQkaCyEmkgfCtSOUjMYLCM=
X-Google-Smtp-Source: ABdhPJyTBaSFPawc5eJ9sqxh3VWxp5lTdLwrBjBRFrun1RtXYIyF3QkkUSunKgyNvs8miou3V6p9GA==
X-Received: by 2002:adf:d1e6:: with SMTP id g6mr47958337wrd.33.1635856329786; 
 Tue, 02 Nov 2021 05:32:09 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id c15sm16591944wrs.19.2021.11.02.05.32.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 05:32:09 -0700 (PDT)
Message-ID: <275e7046-5b1a-710b-7ba7-11af0ead82c1@amsat.org>
Date: Tue, 2 Nov 2021 13:32:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 03/32] tests/tcg/mips: Run MSA opcodes tests on
 user-mode emulation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211028210843.2120802-1-f4bug@amsat.org>
 <20211028210843.2120802-4-f4bug@amsat.org>
 <6efe2cd7-3aea-5162-bdf5-d34ecb6539ec@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <6efe2cd7-3aea-5162-bdf5-d34ecb6539ec@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.549,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 18:12, Richard Henderson wrote:
> On 10/28/21 2:08 PM, Philippe Mathieu-Daudé wrote:
>> The following commits added various user-mode tests
>> for various MSA instructions:
>>
>>   - 0fdd986a6c8 ("Add tests for MSA integer add instructions")
>>   - 1be82d89011 ("Add tests for MSA integer average instructions")
>>   - 1d336c87a3c ("Add tests for MSA bit set instructions")
>>   - 1e6bea794c8 ("Add tests for MSA integer max/min instructions")
>>   - 2a367db039f ("Add tests for MSA pack instructions")
>>   - 3d9569b8550 ("Add tests for MSA move instructions")
>>   - 4b302ce90db ("Add tests for MSA integer multiply instructions")
>>   - 520e210c0aa ("Add tests for MSA integer compare instructions")
>>   - 53e116fed6d ("Add tests for MSA integer subtract instructions")
>>   - 666952ea7c1 ("Add tests for MSA bit move instructions")
>>   - 72f463bc080 ("Add tests for MSA integer divide instructions")
>>   - 8598f5fac1c ("Add tests for MSA FP max/min instructions")
>>   - 99d423e576a ("Add tests for MSA shift instructions")
>>   - a8f91dd9fd0 ("Add tests for MSA integer dot product instructions")
>>   - b62592ab655 ("Add tests for MSA bit counting instructions")
>>   - ba632924450 ("Add tests for MSA logic instructions")
>>   - fc76f486677 ("Add tests for MSA interleave instructions")
>>
>> Cover them in the buildsys machinery so they are run automatically
>> when calling 'make check-tcg'.
>>
>> Start running them on the mips64el target.
>>
>> Cc: Alex Bennée<alex.bennee@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>> ---
> 
> Acked-by: Richard Henderson <richard.henderson@linaro.org>

Thanks, however I'll skip this patch for now since it depends
on a patch in Alex testing-next queue (and it would be nice to
have an Ack from Alex or Thomas).

