Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F67610BCA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 10:06:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooKMx-0001MW-Jb; Fri, 28 Oct 2022 04:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooKMr-0001Lk-1h
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 04:05:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooKMo-0002NP-EJ
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 04:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666944325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nwBA55yWam2VgQ60b6tJti/X5vSeR2M1wdkSKJ6qSko=;
 b=Ai+Vjmc+Wy6UHlOqZDwnM3/KhzHfSbylxT0llC2xT+23e6Ld/y8d8A4Pk+flrct1HZq9jZ
 0WP4jorE8SkvmPRRgTyPziJRppNbVwcfW6TW6MhNfoiigdL5bY4eZ3y6JiT9WluIhNMdd4
 0hVymYlTi67xVL6Z0KCDAEf0rKY62IU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-85-yZUQTil2MTGfNFEInCX6zQ-1; Fri, 28 Oct 2022 04:05:24 -0400
X-MC-Unique: yZUQTil2MTGfNFEInCX6zQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 d13-20020a05600c34cd00b003ce1f62ac5aso4037881wmq.4
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 01:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nwBA55yWam2VgQ60b6tJti/X5vSeR2M1wdkSKJ6qSko=;
 b=vM9oD3vNFROlptagnwztPRKAp04U2KfafmM7a2lnCVyw4JAEXqEHUorl9JOodXWpXq
 hZf7MAygYxMwP4oNP8oNh9lSj6RR/v3N+9JyHH2zXWajnZx+RYX2VhyQVqHnxWJDdhW4
 RwJdvig/DkeLU9OR0kLr/49+hKGllT2FXVSPRHlfkpDQ6mxf0yDumQ4Uh/ZC51nDC6HB
 AW+LgVcxHZtvzXa37F88eTh8nCHh+L5PhlteGl5/MxXzkpzmgH2anZh5Bj6ZZkQQjH1J
 xI07YkpG6UkQ/XnhBzUMQn3Gsq2loVx+JxdS+5mL0XHzrzW++Yjl/TI2faxMYAiqs18v
 yz7w==
X-Gm-Message-State: ACrzQf0PXyIctXCDmT+AEgf10p4ddd9QZkQh/DW5cuqT/2WO9PqJVgYX
 x8pm8PrjUjKIhUeJdJrO+4+/NLh1XJJs2rHkhMg0SIiDgiC19Yz50HIXMTDl9ldyOcibSuLtJZ3
 MEmGzzd5WqWpZ09o=
X-Received: by 2002:a7b:c7c1:0:b0:3c7:103:f964 with SMTP id
 z1-20020a7bc7c1000000b003c70103f964mr8550308wmk.121.1666944322907; 
 Fri, 28 Oct 2022 01:05:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5sQugRFh1a/yoGdpRf2GylaZ5BklwJUXDRaY5Wxwb7D3iAb3WkiRCLBM8YY4MzdRQKEqbc1A==
X-Received: by 2002:a7b:c047:0:b0:3b4:adc7:1ecb with SMTP id
 u7-20020a7bc047000000b003b4adc71ecbmr8455734wmc.144.1666944311693; 
 Fri, 28 Oct 2022 01:05:11 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-14.web.vodafone.de.
 [109.43.177.14]) by smtp.gmail.com with ESMTPSA id
 i18-20020a1c5412000000b003cf54b77bfesm3239626wmb.28.2022.10.28.01.05.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 01:05:11 -0700 (PDT)
Message-ID: <eb1b1498-b882-4ee0-2d5a-813e270554d7@redhat.com>
Date: Fri, 28 Oct 2022 10:05:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 06/11] tests/qtest: libqtest: Introduce
 qtest_wait_qemu()
Content-Language: en-US
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221028045736.679903-1-bin.meng@windriver.com>
 <20221028045736.679903-7-bin.meng@windriver.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221028045736.679903-7-bin.meng@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/10/2022 06.57, Bin Meng wrote:
> Introduce an API for qtest to wait for the QEMU process to terminate.
> 
> Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v6:
> - new patch: "tests/qtest: libqtest: Introduce qtest_wait_qemu()"
> 
>   tests/qtest/libqtest.h |  9 ++++++
>   tests/qtest/libqtest.c | 63 +++++++++++++++++++++++++-----------------
>   2 files changed, 47 insertions(+), 25 deletions(-)
> 
> diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
> index 65c040e504..91a5f7edd9 100644
> --- a/tests/qtest/libqtest.h
> +++ b/tests/qtest/libqtest.h
> @@ -75,6 +75,15 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args);
>    */
>   QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd);
>   
> +/**
> + * qtest_wait_qemu:
> + * @s: #QTestState instance to operate on.
> + *
> + * Wait for the QEMU process to terminate. It is safe to call this function
> + * multiple times.
> + */
> +void qtest_wait_qemu(QTestState *s);
> +
>   /**
>    * qtest_kill_qemu:
>    * @s: #QTestState instance to operate on.
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index d12a604d78..e1e2d39a6e 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -156,37 +156,14 @@ void qtest_set_expected_status(QTestState *s, int status)
>       s->expected_status = status;
>   }
>   
> -void qtest_kill_qemu(QTestState *s)
> +static void qtest_check_status(QTestState *s)
>   {
> -    pid_t pid = s->qemu_pid;
> -#ifndef _WIN32
> -    int wstatus;
> -#else
> -    DWORD ret;
> -#endif
> -
> -    /* Skip wait if qtest_probe_child already reaped.  */
> -    if (pid != -1) {
> -#ifndef _WIN32
> -        kill(pid, SIGTERM);
> -        TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
> -        assert(pid == s->qemu_pid);
> -#else
> -        TerminateProcess((HANDLE)pid, s->expected_status);
> -        ret = WaitForSingleObject((HANDLE)pid, INFINITE);
> -        assert(ret == WAIT_OBJECT_0);
> -        GetExitCodeProcess((HANDLE)pid, &s->exit_code);
> -        CloseHandle((HANDLE)pid);
> -#endif
> -        s->qemu_pid = -1;
> -    }
> -
>       /*
>        * Check whether qemu exited with expected exit status; anything else is
>        * fishy and should be logged with as much detail as possible.
>        */
>   #ifndef _WIN32
> -    wstatus = s->wstatus;
> +    int wstatus = s->wstatus;
>       if (WIFEXITED(wstatus) && WEXITSTATUS(wstatus) != s->expected_status) {
>           fprintf(stderr, "%s:%d: kill_qemu() tried to terminate QEMU "
>                   "process but encountered exit status %d (expected %d)\n",
> @@ -212,6 +189,42 @@ void qtest_kill_qemu(QTestState *s)
>   #endif
>   }
>   
> +void qtest_wait_qemu(QTestState *s)
> +{
> +#ifndef _WIN32
> +    pid_t pid;

Should we have a check for  s->qemu_pid != -1 here ?

> +    TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
> +    assert(pid == s->qemu_pid);
> +#else
> +    DWORD ret;
> +
> +    ret = WaitForSingleObject((HANDLE)s->qemu_pid, INFINITE);
> +    assert(ret == WAIT_OBJECT_0);
> +    GetExitCodeProcess((HANDLE)s->qemu_pid, &s->exit_code);
> +    CloseHandle((HANDLE)s->qemu_pid);
> +#endif
> +
> +    qtest_check_status(s);
> +}
> +
> +void qtest_kill_qemu(QTestState *s)
> +{
> +    /* Skip wait if qtest_probe_child() already reaped */
> +    if (s->qemu_pid != -1) {
> +#ifndef _WIN32
> +        kill(s->qemu_pid, SIGTERM);
> +#else
> +        TerminateProcess((HANDLE)s->qemu_pid, s->expected_status);
> +#endif
> +        qtest_wait_qemu(s);
> +        s->qemu_pid = -1;
> +        return;
> +    }
> +
> +    qtest_check_status(s);
> +}
> +
>   static void kill_qemu_hook_func(void *s)
>   {
>       qtest_kill_qemu(s);

  Thomas


