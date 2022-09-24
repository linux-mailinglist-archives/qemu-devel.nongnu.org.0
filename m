Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE485E8CF6
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 15:09:34 +0200 (CEST)
Received: from localhost ([::1]:57096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc4uT-0001QO-8M
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 09:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oc4Ni-0001Ki-0E
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 08:35:44 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oc4Ng-0002U2-2J
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 08:35:41 -0400
Received: by mail-wr1-x434.google.com with SMTP id r7so3748475wrm.2
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 05:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=sPs1EGRUIiZtl2HvfbbS0wp/adxb87D+ER2dmHNz2SI=;
 b=FokPHfiL948ksrnF9c5TSXvtii/BA4/G7uPTmBZr8FgcA3u7D+Mjwlp/bz+LAVzNEQ
 8etRUtqPfmEQO6/SDcyb/ipo7nqqme7NL0pl4V1YtOXs+Y630uUCFLs5QY8ZGM06TA13
 M/79VtTkV0zsjqGALhyCoaZz3BXbF6glmjxfswEMyUTShTcO2kDJq/cE0nxkD3QX8NAg
 KCliF8tZmrNyfrvWlOGMtohCFV4jd0sFdjvW4r2SpiRUwnDLHxxjzZgnZ2JTQmhhqT2y
 5be+06bd8B5SRkVKapgpDXt4egzQYUEvhPDl1pUeohKUAt37NFNvEXdw/CW2GIXGU2rf
 yEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=sPs1EGRUIiZtl2HvfbbS0wp/adxb87D+ER2dmHNz2SI=;
 b=evvAHHcr2gtp9uEi5gRcxSg4zvhDfLuJK5MpeV2LHvW30fHRvsUVP5v4CaVDUk6uZI
 A5WwA9JzH2CpcYD3IOjU1EUTSNLzbxI6IlDqdkbX1Sl3kFljQHNh8OZXdez/E8mpngt2
 AdN+o0zCAZMDotMLfKodE6unqnow3JMMDYoZwixvsQ+YMmnCHD2cBntoFz53gbCtc8gO
 tt4ZdkC1IUtCQeiAEUDvKzwBJ+etPKok+weM1iFTv33jeAP1dtRe8z1yzV/0dIXNxzdX
 UHWAAbTQMvwByPfDnsV4R1twq6AMuuXtffhNSRqpO85B/c3A9N6RvN8DvNc8Bvtf+l2B
 m1yQ==
X-Gm-Message-State: ACrzQf1PaNyjSA7ejIuuqr6yUxqHdnT1TF4HGkMQEoVTHiHuIx7I0qjK
 f1fQSo4AHHK03wuEBafQ7uI=
X-Google-Smtp-Source: AMsMyM5nnPgKJwmxcW+FoAh4TIY4hauvmgKlgXb6cylcvPIxLLjfV7t+SPk+Z87l5fhZ/zKapW+I1A==
X-Received: by 2002:a05:6000:1b0e:b0:22a:e807:caf0 with SMTP id
 f14-20020a0560001b0e00b0022ae807caf0mr7648387wrz.569.1664022938020; 
 Sat, 24 Sep 2022 05:35:38 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n42-20020a05600c3baa00b003a319b67f64sm17389975wms.0.2022.09.24.05.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 05:35:37 -0700 (PDT)
Message-ID: <989f2606-fa87-0a2e-c49e-00442c8c618c@amsat.org>
Date: Sat, 24 Sep 2022 14:35:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v6 5/5] accel: abort if we fail to load the accelerator
 plugin
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220923232104.28420-1-cfontana@suse.de>
 <20220923232104.28420-6-cfontana@suse.de>
In-Reply-To: <20220923232104.28420-6-cfontana@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.118,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 24/9/22 01:21, Claudio Fontana wrote:
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

I still think a coredump won't help at all to figure the problem here: a 
module is missing, we know its name. Anyhow I don't mind much, and this
can be cleaned later, so:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    }
>       g_free(ops_name);
> -
> +    ops = ACCEL_OPS_CLASS(oc);
>       /*
>        * all accelerators need to define ops, providing at least a mandatory
>        * non-NULL create_vcpu_thread operation.


