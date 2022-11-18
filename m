Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B37662EEE0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 09:05:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovwNa-0001Ps-7l; Fri, 18 Nov 2022 03:05:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovwNO-0001Ib-91
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 03:05:31 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovwNM-0003SL-KN
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 03:05:29 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v1so7983657wrt.11
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 00:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=REo5acWGzr/aLDvTJSguaqjRAyr8UycDx9QhyBcV+i8=;
 b=t3pMVc/S4QR0dCklqcR7o/SnGz3IVFnkBE3eiDpyKmQY2vZHrhSUzS7zKTUHADnZE9
 gkRYYSHD0SUsCE9f3kdyJPENrckEUc+gE7JOOlf7jo/CMzd2IjPUrRWTh47W4Z2HJiuJ
 LnX8a6hRQ3IydiyTu6R6ovNh8sLVe0q3AcOBixkGq1rUqTze5mSJK0RltJ+d6bgljza/
 XcEgmQCE42l0pBo8uUS3EK2vFekWE5do5+1d8jxXF6ie7d8/ngnbvQ48KFJ/CHCm/yUs
 DxkIz61tUzj/e/Ibad8kWp/zsf7Q2qPWt+svOc6f4PhKHflbbeqJpNRL5RjPfIbyj9QN
 m4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=REo5acWGzr/aLDvTJSguaqjRAyr8UycDx9QhyBcV+i8=;
 b=Givi1u5Lu6ssYiMayb2kXQlXA+4Jk0zOY8dFWS2zxH/tKmQXR0LKFlEHxZtDy2mYNG
 9HQS6Zcm/OyQ0tkJ42qZZieBloAmtyYL300I/2jHstEHPzdQi4e9QzQjUt98ieBukB/v
 jJCTe5I6mvWA3kA/YsHOTFJDR1BQ2xdxGNwz350EwZptyW3rBmyxB3ycM2G84ot4RAIR
 Ns4i1nRI6WXpEksDlDthGqyUvmt0ASrByaMv7gCj6vpAQrdNnAlFl1Zj62rriIkLSdSy
 tLvEzv4R/A8WyDYein8oqHfEL6EwQ9wllhXjzy+P6f33vfKVAOVtyX6Xyqu6N/U/rZ2B
 KAnQ==
X-Gm-Message-State: ANoB5pn7joMg4PsoJN/RWAOyC2/1cBLlUqz/zQ6x8KK44AfCINf5mq/c
 aiT0uF2b+jdqwH3XhZYrjdudBQ==
X-Google-Smtp-Source: AA0mqf6uYZrlYUzfTvPZcqTk/IFaIPvymkJBjJrFILMaKvf0UXMMl08axm6GiM7tRZSMVkDgYnPVFg==
X-Received: by 2002:a05:6000:10c3:b0:241:bee0:c56e with SMTP id
 b3-20020a05600010c300b00241bee0c56emr1747401wrx.534.1668758727380; 
 Fri, 18 Nov 2022 00:05:27 -0800 (PST)
Received: from [192.168.230.175] (34.red-88-29-175.dynamicip.rima-tde.net.
 [88.29.175.34]) by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c458700b003a3170a7af9sm3943684wmo.4.2022.11.18.00.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 00:05:27 -0800 (PST)
Message-ID: <1dc74a73-f63c-fee7-6fdd-7124248cdff6@linaro.org>
Date: Fri, 18 Nov 2022 09:05:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v3 10/13] tests/avocado: skip aarch64 cloud TCG tests in CI
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221117172532.538149-1-alex.bennee@linaro.org>
 <20221117172532.538149-11-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221117172532.538149-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 17/11/22 18:25, Alex Bennée wrote:
> We now have a much lighter weight test in machine_aarch64_virt which
> tests the full boot chain in less time. Rename the tests while we are
> at it to make it clear it is a Fedora cloud image.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/boot_linux.py | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)

Thanks for the update.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


