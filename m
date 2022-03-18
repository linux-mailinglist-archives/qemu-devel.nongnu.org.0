Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AAC4DDEE4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 17:27:44 +0100 (CET)
Received: from localhost ([::1]:34762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVFS3-0002KM-86
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 12:27:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVFRH-0001cW-3r
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:26:55 -0400
Received: from [2607:f8b0:4864:20::1029] (port=43649
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVFRF-0008KA-9Q
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:26:54 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 n7-20020a17090aab8700b001c6aa871860so2635742pjq.2
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 09:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iMVZcofr6FsSdYpC/chyKgQ9q30z17BQEE0G/KC0lLs=;
 b=jLG7EZesHW1IJZFOhnj+qPSv8g4KsJzO/TX7hL78C2cGeS8BeXxvH6NBCtzI/kGEs2
 YRWzE8mQXWd41JWNVpTxq79JzP5uEK5mVV1Mq0AuniRT2UBgOU7ciND4aJZb85OoIuXa
 3aSbeEXI3hNE53r7guIaRGlhaJCFb/TFi/hr/eN2ar8aRnO+px9wmxXGWZmiUnK5IzTK
 xqRSs1IYkQ7RNeWk+eafOqAryw7cC/BTfCjNVRQPLu2WfQNUIKi2WSAisdCkb9QqAJ64
 7cc5HcTRCd27Xbj4WCs/PHVewC1dojBfvLmisK1yuVAnglWMhNzUnqcviWtN3jnaez3u
 lHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iMVZcofr6FsSdYpC/chyKgQ9q30z17BQEE0G/KC0lLs=;
 b=3HpT8rXdLQJ1G+FTDP+ZcuUeNYECVNO7QF39H8j1TwstXQQwYEk+9XUyhGWioloc88
 Ww1MjY4BuVlrDZhQTmXqRgf6svNSL50cqsVqE+YW2oBlfxt4Mgo5JYmwf2Mlke/p37k/
 /cHjI9pr2SpMoJD4vnDXWPDCizUmu5MvTBn63Issi5A8urrlVSfymjwm03y0HxO9SIqA
 CHlG/xF/EYYkj9l9IBPsph5NlkDiaacfr/Horqb5den/MOj2ZI1PknphNwD9Eoyrcdzx
 Wo/5vFGEDt5AwtC9+6A1seMgfizIlCSWKI0GaFSY9O7dJBUIy+CGr/AZZElgCwSiWQ28
 FLlw==
X-Gm-Message-State: AOAM532pfsQbd8WVfyLMVZ45AvKiZ8o0JafBZMfXUG1kyjDjuMznjBk3
 D5DYFRQWF2pPna2LnOPH/1U=
X-Google-Smtp-Source: ABdhPJxoUfzZd/lUk/Kfa8xYOGv3KW71pUe681SUQ3h5WWWdVhF2iv70jfiuderZ+ipVyLajMSg2TQ==
X-Received: by 2002:a17:902:dac1:b0:151:952a:8821 with SMTP id
 q1-20020a170902dac100b00151952a8821mr227987plx.11.1647620811936; 
 Fri, 18 Mar 2022 09:26:51 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 pi10-20020a17090b1e4a00b001bf9749b95bsm13117981pjb.50.2022.03.18.09.26.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 09:26:51 -0700 (PDT)
Message-ID: <780af3a1-018b-92b1-6fbf-b27cc711bef0@gmail.com>
Date: Fri, 18 Mar 2022 17:26:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 4/5] cpu: Free cpu->cpu_ases in cpu_exec_unrealizefn()
Content-Language: en-US
To: Mark Kanda <mark.kanda@oracle.com>, qemu-devel@nongnu.org
References: <20220318151555.381737-1-mark.kanda@oracle.com>
 <20220318151555.381737-5-mark.kanda@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220318151555.381737-5-mark.kanda@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/3/22 16:15, Mark Kanda wrote:
> vCPU hotunplug related leak reported by Valgrind:
> 
> ==132362== 216 bytes in 1 blocks are definitely lost in loss record 7,119 of 8,549
> ==132362==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
> ==132362==    by 0x69EE4CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
> ==132362==    by 0x7E34AF: cpu_address_space_init (physmem.c:751)
> ==132362==    by 0x45053E: qemu_init_vcpu (cpus.c:635)
> ==132362==    by 0x76B4A7: x86_cpu_realizefn (cpu.c:6520)
> ==132362==    by 0x9343ED: device_set_realized (qdev.c:531)
> ==132362==    by 0x93E26F: property_set_bool (object.c:2273)
> ==132362==    by 0x93C23E: object_property_set (object.c:1408)
> ==132362==    by 0x9406DC: object_property_set_qobject (qom-qobject.c:28)
> ==132362==    by 0x93C5A9: object_property_set_bool (object.c:1477)
> ==132362==    by 0x933C81: qdev_realize (qdev.c:333)
> ==132362==    by 0x455E9A: qdev_device_add_from_qdict (qdev-monitor.c:713)
> 
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> ---
>   cpu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/cpu.c b/cpu.c
> index be1f8b074c..6a3475022f 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -173,6 +173,7 @@ void cpu_exec_unrealizefn(CPUState *cpu)
>       if (tcg_enabled()) {
>           tcg_exec_unrealizefn(cpu);
>       }
> +    g_free(cpu->cpu_ases);

There is an API mismatch here. We miss cpu_address_space_destroy().

cpu_exec_unrealizefn() then calls cpu_address_space_destroy(),
and cpu_address_space_destroy() frees cpu_ases.

Otherwise other cpu_address_space_init() calls will keep leaking.

>       cpu_list_remove(cpu);
>   }


