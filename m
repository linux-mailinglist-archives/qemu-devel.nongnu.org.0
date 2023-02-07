Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C543268DBC6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:38:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPP6p-0005ZY-Eq; Tue, 07 Feb 2023 09:38:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPP6b-0005YG-BI
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:38:08 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPP6Z-0000dt-8b
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:37:57 -0500
Received: by mail-wm1-x333.google.com with SMTP id bg26so11205465wmb.0
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TVM6ABhovmFnRxd4oWMHroI8dPrXANZwKYQg31dd5I0=;
 b=nRarlME0gMaaNP5uooXsim1vajWLjr0X5zmasnfAJ9zYw0nGrLZ0hTAOk3j2rv26Lq
 Jqpyc45i9CerinUmr1RW5D9rehfWQOYIivJbS48l6qmJkziLD1QcIoSAQ6OcWA3OlMd+
 yNr6P3oi6wcSO+AWDQjnHPZLpzr34uU7TzDB6hk+too7poZTn18zglYOx7iSjIWJTC5Y
 Ve8CBzG6IFv90/gQKQa4ObJwgdrqe/vjRfbKYrZ4suL8oPVvkszxsetzbEyEjHZ++fIA
 QRHKa3y6wRbzbX1d9rAT0oUDpnqe1XUIU+mtinZpZ7vBCjShQ0K3XW6eV1gKp1AA1Feh
 893w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TVM6ABhovmFnRxd4oWMHroI8dPrXANZwKYQg31dd5I0=;
 b=T5MrVbdaCKTaie34w4ZOvCYTOY087XwOaAV/sbsy3BikFyXFNGuSYfuZ8hhAnRudUU
 rLgSVeP6YtwPFnAB20/HzJZycJW8dtrjPc5Qk+4OOB0kdy6ThTZy0o/HU1FIOZFVyKfY
 cr/XEDWwOgDQ5OYKuxj6KS+3Uh8s6w9hTa6dZdOMOOhmiKvqN5TAZDMbMBScAF85MgdW
 LLM/Lg7M9GH4e/YVEvwtqHJ+W9f1TZZ5Vl7B3gg+CPRT5ZRe/NsTuECXleIlYmczmcMK
 Ca9rm9B4uJpUo/WDAF4IQ9DaobK/pPb9Gx531JjDu2uHSj9MznNeYqhcJKwFfBxxUwMZ
 zikA==
X-Gm-Message-State: AO0yUKVvb4z2k1L8HPs8qj3qcPIYwX1De1d/QM9YoTrLqNTk649cMGE6
 T7x22M7xd/dEa+2am7H7i5kyGQ==
X-Google-Smtp-Source: AK7set/Foik9wUmpaJ3ZBfJ7PzhSU1+ml4Q1uk4tF+7UhBdJVRYmKbVN/G8JWCBekTOnCBwPS/olrw==
X-Received: by 2002:a05:600c:4919:b0:3df:f2a5:49fb with SMTP id
 f25-20020a05600c491900b003dff2a549fbmr3150236wmp.7.1675780673614; 
 Tue, 07 Feb 2023 06:37:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r12-20020a05600c35cc00b003d9fba3c7a4sm20699047wmq.16.2023.02.07.06.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 06:37:52 -0800 (PST)
Message-ID: <5cd50fae-08ee-0583-07eb-8af86cbf4404@linaro.org>
Date: Tue, 7 Feb 2023 15:37:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 10/10] qtest: enable vnc-display test on win32
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-11-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230207142535.1153722-11-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

On 7/2/23 15:25, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Now that qtest_qmp_add_client() works on win32, we can enable the VNC
> test.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Acked-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qtest/vnc-display-test.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


