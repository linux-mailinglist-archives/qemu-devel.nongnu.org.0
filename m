Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7286B4E5B6D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 23:45:34 +0100 (CET)
Received: from localhost ([::1]:47348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX9jR-0003g3-GT
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 18:45:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX9he-0001ny-12
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 18:43:42 -0400
Received: from [2607:f8b0:4864:20::635] (port=39761
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX9hc-00029O-Ez
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 18:43:41 -0400
Received: by mail-pl1-x635.google.com with SMTP id g3so2957872plo.6
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 15:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=LsT0hUKegNoojtechGs52TAAeG5khct1Z8vtYDf02VA=;
 b=u//SzkIxLte+1OM6kWHLrerbTwO9rKui5uBOsBryPUNSecOHFtmqYH0L9OOzs5RN/K
 UlgfgRgMtFvJCtvZFmrj0BsZmCdn4LwQbCNAo1qWlKzCZuH3Y6NEzU5gVZZO0WZdlRIx
 BQz3gpcTe0y4fpdB5EkEzjaIfVEIn+7LL0K6Dr6fgNcJdHNVxQ67dS0cyFoQXaHzqYlJ
 kk2hRG3aUQsFxdw8K2JIl2xTSw5S3I6pk2iMyDP0fZAYLw+vb/XHji8FkWXr/XzIm2qx
 OxwzPfCc/TKhAe1jd5Ggtwj2fWSC/eHJQfrHV3T518OLqRJq4SgJI4gM3V/1UqSOyfwi
 2UKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LsT0hUKegNoojtechGs52TAAeG5khct1Z8vtYDf02VA=;
 b=yz80utTO3tu51DvJJS56WlFy8roWUGtRvVwyZpzz8ntjMI4ET9RvZKXbCr03rd37BI
 Yaza/udvoXmqRQeBng2dzZFPxKip8xm3glMNlcT9CX6CHv5SBXSZ7RBYNfMjkM0t+4At
 NRsdAGVDMpKspxUIZ4pqEp4sjB26NRs/p2U3k1KhctvMiMP2VOyy3k2ufxeIVb1tN2ae
 i/PsMWnz7mVF5S35MLnMjdasW+Zjo4ei3vyrqTEA28Perunshn1qT525sI1AA0cU770f
 QkJJtskeN4/B9C++xQ4KV/R2GGP9hUvMgnwiSjZqM+sNdhnC/915Eh00yNS7FA9cdRaJ
 l7Sg==
X-Gm-Message-State: AOAM533YNLBUj4ya580oFrd8pQXCce6Ix8l2yLxJBH7kOubb/t7AFu3o
 vtDjbTjEE8QAbb1YVEt2WcwgmA==
X-Google-Smtp-Source: ABdhPJxJ1cZwnReUs0W+n96F25uMBYvXAV069inSQBFMc1iP4qRwOIzyV4Ggvg+9C1A849eat96n4A==
X-Received: by 2002:a17:902:b097:b0:154:2bda:bd38 with SMTP id
 p23-20020a170902b09700b001542bdabd38mr2523773plr.155.1648075419091; 
 Wed, 23 Mar 2022 15:43:39 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 o27-20020a63731b000000b0038232af858esm648652pgc.65.2022.03.23.15.43.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 15:43:38 -0700 (PDT)
Message-ID: <392247bb-a33f-a4b6-1855-1a479ed381d7@linaro.org>
Date: Wed, 23 Mar 2022 15:43:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 13/13] softmmu/cpus: Free cpu->halt_cond in
 generic_destroy_vcpu_thread()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
 <20220323171751.78612-14-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323171751.78612-14-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/22 10:17, Philippe Mathieu-Daudé wrote:
> From: Mark Kanda<mark.kanda@oracle.com>
> 
> vCPU hotunplug related leak reported by Valgrind:
> 
>    ==102631== 56 bytes in 1 blocks are definitely lost in loss record 5,089 of 8,555
>    ==102631==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
>    ==102631==    by 0x69EE4CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
>    ==102631==    by 0x924452: kvm_start_vcpu_thread (kvm-accel-ops.c:69)
>    ==102631==    by 0x4505C2: qemu_init_vcpu (cpus.c:643)
>    ==102631==    by 0x76B4D1: x86_cpu_realizefn (cpu.c:6520)
>    ==102631==    by 0x9344A7: device_set_realized (qdev.c:531)
>    ==102631==    by 0x93E329: property_set_bool (object.c:2273)
>    ==102631==    by 0x93C2F8: object_property_set (object.c:1408)
>    ==102631==    by 0x940796: object_property_set_qobject (qom-qobject.c:28)
>    ==102631==    by 0x93C663: object_property_set_bool (object.c:1477)
>    ==102631==    by 0x933D3B: qdev_realize (qdev.c:333)
>    ==102631==    by 0x455EC4: qdev_device_add_from_qdict (qdev-monitor.c:713)
> 
> Signed-off-by: Mark Kanda<mark.kanda@oracle.com>
> Message-Id:<20220321141409.3112932-4-mark.kanda@oracle.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   softmmu/cpus.c | 1 +
>   1 file changed, 1 insertion(+)

Eh.  Merge with previous.


r~

