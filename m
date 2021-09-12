Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E5B407D4B
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 14:39:09 +0200 (CEST)
Received: from localhost ([::1]:39818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPOlI-0001K1-Ux
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 08:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPOkS-0000di-8V
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:38:16 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:43696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPOkP-0002ZO-RZ
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:38:15 -0400
Received: by mail-pl1-x636.google.com with SMTP id v1so4066379plo.10
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 05:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gnuDD8UL3DCLL8SBAJ1vlmlU7gQI6wapsETDsXh0G1g=;
 b=sYtiZYhTtXJfWmm0wez5euRUjnrIQvME4UYsdMREQGg3q2LjjEgPX3aOB6AByqK4b/
 ssXPnoAnkwhk2skK0WGnIWjLE9hx1T34+iHsRToVl4LKx/ggD9/fJoJaFdviZ6YkV+fb
 EiNO55cLvpszjfP5chigPyJVs2zVVJ6jj3o9CpyAKWu4M9spjftFEBvvwi0wGx8FhRU+
 UtZIRRQDNB/M4AoriPdw7+wTem9KONrZBSKW5ETsA66MR4DRRID2m1ozmq7MY4om7L2v
 v5iqMwBg9/SUnYB4Hufl/GepGwi6Jj9u5f3ISC0i4diIQOELqpCV4DLyZ0bWqFMDqz7D
 ZUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gnuDD8UL3DCLL8SBAJ1vlmlU7gQI6wapsETDsXh0G1g=;
 b=elsVHDkxOclWaIGP4Bs3M5EoYwEN1FrKnnRJ9HkCFcCjDbl/BcyGX0xHTeJlAD/0D+
 UKpPjUrLgqDBzYqLMkTp+rRXdkHi3BAmarbz5RIf+E9hecasMV/L6bReWM4eLGCPrxyT
 b/MSOdSoKXNtKNGetaiXDbIfjEsMrWgxYTTlKX1yzszuUiB4BjVYzmQ/ejSxqwcYJY5M
 TGyHqsniJvZ41WFs454QR7LzbttXtyqUuLl/Ncd4UCZnv73pR9fetVn9yyLWyddDYvZx
 QEIwE2aZvEWhz1P325bxB5FEqJnHBRvSXjYKMqfruKa5cRBOeRtJOGPygyqJ5n9G0XKc
 N80w==
X-Gm-Message-State: AOAM532lWtLh3TbO+mP23CaIVifX3eRYnms19mZUb+CcgOh5lqm6SFFP
 5HtluOY44B98uY3WkV06CFhzGw==
X-Google-Smtp-Source: ABdhPJzEHlPVN5Whe4bkBK2O9V/UyzGRr0Ro1mnOLerUf4Bo2b3IBWxZGtXd1pS9gP4t9S3I4QjlgQ==
X-Received: by 2002:a17:90b:1210:: with SMTP id
 gl16mr7451772pjb.16.1631450292152; 
 Sun, 12 Sep 2021 05:38:12 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id u10sm3918928pfh.105.2021.09.12.05.38.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 05:38:11 -0700 (PDT)
Subject: Re: [PATCH v4 17/21] LoongArch Linux User Emulation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org, chenhuacai@gmail.com
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-18-git-send-email-gaosong@loongson.cn>
 <4e47e1a7-d946-f8ec-a9a1-aadc6eeb7941@linaro.org>
 <3e7fd708-fe13-8163-2926-d1baa75e3b10@loongson.cn>
 <d6349ca9-2483-2f83-f5cb-f9e1f740a404@linaro.org>
 <3146e487-9b35-d9b8-668e-06c9e6744cb2@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <410b09b6-dbf5-b8c4-a097-eb2b6ebc752e@linaro.org>
Date: Sun, 12 Sep 2021 05:38:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3146e487-9b35-d9b8-668e-06c9e6744cb2@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, philmd@redhat.com,
 atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com, groug@kaod.org,
 maobibo@loongson.cn, mrolnik@gmail.com, shorne@gmail.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 palmer@dabbelt.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 10:58 PM, Song Gao wrote:
> By the way, We have already prepared V5 patches. but I see that patches [1] and [2] have not push into master. How can I use these patches?
> 
> [1]: https://patchew.org/QEMU/20210618192951.125651-1-richard.henderson@linaro.org/
> [2]: https://patchew.org/QEMU/20210822035537.283193-1-richard.henderson@linaro.org/

Now that development is open for 6.2, and I'm back from holiday, I'll work on getting this 
upstream.

In the short term, you can add

Based-on: <message-id>

in the cover-letter, to indicate what the dependencies are.  It can also be helpful to 
provide a git tag for the complete patch set in the cover-letter.


r~

