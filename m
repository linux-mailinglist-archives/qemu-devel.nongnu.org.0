Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218175E7E6A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 17:30:22 +0200 (CEST)
Received: from localhost ([::1]:45724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obkdB-0003dJ-8s
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 11:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obkbd-0002DT-KN
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 11:28:45 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:46801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obkbb-0000tU-5l
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 11:28:45 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 j6-20020a17090a694600b00200bba67dadso445973pjm.5
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 08:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=EwtUiAqwVJa0A4mO7XzbVDKWuG7JYefL3u2PsDzfFmw=;
 b=T+/RlxDatfn94Ffzf3XpusnEPz1OEzRwgNUXD8zwzVgIB8FunEUnuwYKqhWQfbXKO/
 b5j6HR5IUDKneVzyHHBZTH/66AJCnn269qwLV5zQyR48V2Dd1YWNiAJfEhuASDe9rlsM
 iRyp5BZGITGNyHXvw/9slfoi8+BjV5oeq9IxmaF4rSJ6U3cJlfi9ibxk6jFo42JempHq
 jvoIrd5/jjPvL+U5V9eNJ8RQpZ66sOL9Y9D/IoP837iFxghQo/VXbWlfS09pod270KP1
 otiPjpjbJ0OWhi7oTXgrckBhGfR9VOCCFCiWrub28UilG+bMvGybWqe4kx5Vz0VNJTnp
 Xcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=EwtUiAqwVJa0A4mO7XzbVDKWuG7JYefL3u2PsDzfFmw=;
 b=v3y6dkqewO6PivE//FXzLslx1n3KvZq6JOooNMARek3npXze2niu5EPyfM+MtFeWRK
 EflRtF08ntRbI/LaaMhddeB+VABCd6lyEgGJd4pQdk67IZG46dE47CIqb7TyUrNBtLna
 cN7RIww+XrqDStUP1J2ztypROVjASn00Fvxhr4wTTy+XZIyichk96tOYqDWWmgsjT2y9
 KwHhIJKmQOFlV9HpDPQsbslQaR/qxPnQ4e82BwyyfkCg/erCWdLbRR3IAC44u/WJmXmx
 AcE1I5ZkN+s0IPTwUHIdjBtPUxdbUaIg0bOJEE+i2hEFCkkJfLOowJMH8shEcsPm2CWO
 ysdw==
X-Gm-Message-State: ACrzQf2QaaoPpkJPBHM4ygrFziwhBVnP9HUpF38UZfpNZJOSHug117gE
 sHAbNvwGP76fwk/AxoX4xdw=
X-Google-Smtp-Source: AMsMyM5DCZoF8xIHAE/nsmXc84s2NTnJCQgCh0qP1Cz04HOHCND9HurLhtnYGwZ3Ay8G2yR8J4qh9w==
X-Received: by 2002:a17:903:41c8:b0:177:e7e1:4f4f with SMTP id
 u8-20020a17090341c800b00177e7e14f4fmr8837802ple.61.1663946919704; 
 Fri, 23 Sep 2022 08:28:39 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k197-20020a6284ce000000b005544229b992sm4554533pfd.22.2022.09.23.08.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 08:28:39 -0700 (PDT)
Message-ID: <8d1123e8-334b-136f-1315-35448c094e6b@amsat.org>
Date: Fri, 23 Sep 2022 17:28:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v5 4/4] accel: abort if we fail to load the accelerator
 plugin
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220923145131.21282-1-cfontana@suse.de>
 <20220923145131.21282-5-cfontana@suse.de>
In-Reply-To: <20220923145131.21282-5-cfontana@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 23/9/22 16:51, Claudio Fontana wrote:
> if QEMU is configured with modules enabled, it is possible that the
> load of an accelerator module will fail.
> Abort in this case, relying on module_object_class_by_name to report
> the specific load error if any.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/accel-softmmu.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
> index 67276e4f52..9fa4849f2c 100644
> --- a/accel/accel-softmmu.c
> +++ b/accel/accel-softmmu.c
> @@ -66,6 +66,7 @@ void accel_init_ops_interfaces(AccelClass *ac)
>   {
>       const char *ac_name;
>       char *ops_name;
> +    ObjectClass *oc;
>       AccelOpsClass *ops;
>   
>       ac_name = object_class_get_name(OBJECT_CLASS(ac));
> @@ -73,8 +74,13 @@ void accel_init_ops_interfaces(AccelClass *ac)
>   
>       ops_name = g_strdup_printf("%s" ACCEL_OPS_SUFFIX, ac_name);
>       ops = ACCEL_OPS_CLASS(module_object_class_by_name(ops_name));
> +    oc = module_object_class_by_name(ops_name);
> +    if (!oc) {
> +        error_report("fatal: could not load module for type '%s'", ops_name);
> +        abort();

I'm not sure aborting is helpful here: QEMU process state is alright,
we only miss a module...

Aren't we good with a simple 'exit(1);'?

> +    }
>       g_free(ops_name);
> -
> +    ops = ACCEL_OPS_CLASS(oc);
>       /*
>        * all accelerators need to define ops, providing at least a mandatory
>        * non-NULL create_vcpu_thread operation.

Preferably calling exit():

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

