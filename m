Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D724666DEE
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 10:18:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFtiu-0004IB-UZ; Thu, 12 Jan 2023 04:18:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFtin-0004Gs-LI
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:18:06 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFtim-0004HY-13
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:18:05 -0500
Received: by mail-wm1-x329.google.com with SMTP id o15so12701825wmr.4
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 01:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7Gp23ru+pcCBqH9Iu4WiYRAyZ9j3Hh3CvTrJLQpTnxk=;
 b=GGeg98NJA4GSZRQIlJ65lD9bAbAuJUvbfshFq3qEJmigZuoIuRypOMBxGMfOx5YSyu
 cyoPF10TtDGA0zihPkB4JU7+uHchhgGmqFqwHZ1Tbvr/jZdu2AmTy/2lTnYe5lYgW7XH
 oPXSwpc8TBIqKuWfs5+k+HwEp4DA62NANo8UB3FQ3ascQNI/ZiW7sg3u99qpOPqjtiUL
 XrzJDgKrtv2VcKI7902QaWx2e2cIldd/JFHYPBExVPdnA7tjbdE3EYfGvgrXCFP8rPzj
 OXfcyD+/PPcz+mq4cOZ0rgnBss/qGcNzjmoKaVM39tbdOmepidQ0dbk9tmcTxWpAPF02
 1rsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7Gp23ru+pcCBqH9Iu4WiYRAyZ9j3Hh3CvTrJLQpTnxk=;
 b=8RgHfEjpbfOKhRSXtit8MygfelgnZzv8yyovD7bj/ATvkAbrIeO+ico2u5Q4cYrhrl
 L3ms9WusboyKKG/THQdSmeJxCuDjoRICo0bha+EqxkbY7Q2sAIrVZ3BUsqbQS50FeCZp
 rx7ZDh6u+9eRi7/1Yb681grdLd4e7b4pZsBw0XyrpWclL0dLkonn3jPmBMXQzIYkZTlu
 E6aVBu8RSNJp9JgMxLSrm2F0NyNlQQLdZNgngyfJcg7DJrT8cBISyXc6HRqlm3KsmZwu
 6j7DZLrbjgRUDWoR5AXC/2VRnAgTsYFrQqQt1bHrVQlsBeLqeAGmILWnz+gkPKSzCI0v
 xImA==
X-Gm-Message-State: AFqh2koBRYlh0w/vcvev3dgiPB1hEpLHCXBn0IRfaCWSgfcCFdlZ6ooz
 7vshc5GkDjbkqDAgxDSBomwXVA==
X-Google-Smtp-Source: AMrXdXv6uqB7pgyxJiplvbCY/D4dJpmuXiy3zA6OO9RKXu54nC5CqNgHE4p94HNfGOn9+w11T9gChA==
X-Received: by 2002:a05:600c:3c93:b0:3d9:ed30:79d with SMTP id
 bg19-20020a05600c3c9300b003d9ed30079dmr12187601wmb.18.1673515082505; 
 Thu, 12 Jan 2023 01:18:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i8-20020a1c5408000000b003da065105c9sm5384583wmb.40.2023.01.12.01.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 01:18:02 -0800 (PST)
Message-ID: <7799fdd7-755e-11c5-fe10-3f4afc00376b@linaro.org>
Date: Thu, 12 Jan 2023 10:18:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] tests/qtest: Poll on waitpid() for a while before sending
 SIGKILL
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, peter.maydell@linaro.org, berrange@redhat.com
References: <20230111223018.3965423-1-stefanb@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230111223018.3965423-1-stefanb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 11/1/23 23:30, Stefan Berger wrote:
> To prevent getting stuck on waitpid() in case the target process does
> not terminate on SIGTERM, poll on waitpid() for 10s and if the target
> process has not changed state until then send a SIGKILL to it.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>   tests/qtest/libqtest.c | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 2fbc3b88f3..362b1f724f 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -202,8 +202,24 @@ void qtest_wait_qemu(QTestState *s)
>   {
>   #ifndef _WIN32
>       pid_t pid;
> +    uint64_t end;
> +
> +    /* poll for 10s until sending SIGKILL */
> +    end = g_get_monotonic_time() + 10 * G_TIME_SPAN_SECOND;

Maybe we could use getenv() to allow tuning / using different value?

> +    do {
> +        pid = waitpid(s->qemu_pid, &s->wstatus, WNOHANG);
> +        if (pid != 0) {
> +            break;
> +        }
> +        g_usleep(100 * 1000);
> +    } while (g_get_monotonic_time() < end);
> +
> +    if (pid == 0) {
> +        kill(s->qemu_pid, SIGKILL);
> +        TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
> +    }
>   
> -    TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
>       assert(pid == s->qemu_pid);
>   #else
>       DWORD ret;


