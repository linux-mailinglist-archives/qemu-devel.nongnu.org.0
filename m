Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADC84E3286
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 23:06:39 +0100 (CET)
Received: from localhost ([::1]:47618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWQAf-0007rf-Qb
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 18:06:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQ7i-00060u-T4
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:03:34 -0400
Received: from [2a00:1450:4864:20::42a] (port=33555
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQ7h-0003lS-Bf
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:03:34 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q8so11175628wrc.0
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 15:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=syh7/c2M3bR7jwxTzja/DPfYO7Qybum5V1fip3FFt60=;
 b=EexGE+sz+MNuFZWlxvGYxRIB4aG6+IoScVY1DMoXeS1Rq1JxcJBk1pqtRPzOIoAkUe
 +lH5mVgo/HP2fHgbYCjPN75D9U+QD/0GgwOSoamvwgM2Rx0WoMysdG3PmaK2F5gURfQD
 9d9OxDoqbD6i8JwMLJ/Wvp8txS8fBLQ6hQVcMzI5zLeRGa04OfADpA9aSzpVkjfxWDGJ
 dDt7/K8BpEngGL9lXMNx1O4tBA6ksWK5p1buT7sXdGBKuzefSj6OC6wujxuqI42C6hWq
 d+g3xWdNPTvMxypvN7zfNMlkJc+eah1RDRUauRBwEvDNXgs7ipNxntpw80wrgGx1Al5x
 C78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=syh7/c2M3bR7jwxTzja/DPfYO7Qybum5V1fip3FFt60=;
 b=QjXWvnXHwOuBQuAhPGTLVlh95DkafU4yMEbNaUjR/y6U4695ywukQo9aDL6g8STM9L
 QL9s5p5d/edE+26sZ2VOg1XUCt1BkNRqt50NAqQlfoc30vu2fR/YSEbwiYPQAj9dGqD1
 mvhxgNu8GpCYkL7ytcmVieW5tdFCABLg01M2eDqS8PUjKSPMkhfxoXNPXaVpOniNe8ZP
 GzZjefACUYX1VTZhnp4aBdl1JBE6noTaP3N2QENCkEYPOzcpJPYJyTPlH+XHFFK3p7YY
 lxv+qTKeVuiaFZhZ0+4XFFf55g9Cjl1E0A8db+HvCmtMqbBxFDK/4oyE2Vy8i4nB42Hr
 hxyg==
X-Gm-Message-State: AOAM532vPvn8PD2kaiQLron9vcONyiRXZ+Dx0vJqhkUHbMlumRGxIoJS
 9fbECK1iL2rcEtvXuJPjJ4co0EQZIsg=
X-Google-Smtp-Source: ABdhPJyO07FBMGPY54Fiot3uk1v/0JzBbrwcxeJPEe7XzVM7xrPiRzyj38yzxv6DIZmzWIOT5Ldl9A==
X-Received: by 2002:adf:fb8e:0:b0:203:bd5a:5741 with SMTP id
 a14-20020adffb8e000000b00203bd5a5741mr19634871wrr.65.1647900212008; 
 Mon, 21 Mar 2022 15:03:32 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 e10-20020a056000178a00b0020414f27a58sm3532972wrg.35.2022.03.21.15.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 15:03:31 -0700 (PDT)
Message-ID: <96a26850-2444-fd18-92ae-809b9fd17e10@gmail.com>
Date: Mon, 21 Mar 2022 23:03:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 4/5] cpu: Free cpu->cpu_ases in
 cpu_address_space_destroy()
Content-Language: en-US
To: Mark Kanda <mark.kanda@oracle.com>, qemu-devel@nongnu.org
References: <20220321141409.3112932-1-mark.kanda@oracle.com>
 <20220321141409.3112932-5-mark.kanda@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220321141409.3112932-5-mark.kanda@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/3/22 15:14, Mark Kanda wrote:
> Create cpu_address_space_destroy() to free a CPU's cpu_ases list.
> 
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
>   cpu.c                     | 1 +
>   include/exec/cpu-common.h | 7 +++++++
>   softmmu/physmem.c         | 5 +++++
>   3 files changed, 13 insertions(+)

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

