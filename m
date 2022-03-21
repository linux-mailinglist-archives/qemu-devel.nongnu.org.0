Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32104E3293
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 23:11:28 +0100 (CET)
Received: from localhost ([::1]:59474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWQFL-0007bZ-KM
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 18:11:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQC8-0004FV-DZ
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:08:08 -0400
Received: from [2a00:1450:4864:20::433] (port=46694
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQC7-0004ft-21
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:08:08 -0400
Received: by mail-wr1-x433.google.com with SMTP id h4so4581859wrc.13
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 15:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=a/hYYN8BbL4ShY2j48e6b20B+dWEh/XMhNWc8oWxq/c=;
 b=DGWcJKn2+a9IBn4oNgHv6U0RX4cfUGv/TsSTofrgIYPAnmufz6ju0GffWScecX49l7
 fqkHRUTFzV5wCMwLmgF2smh8MyoLZ5wUUmrYumj1y+0j4GdJPje2bNQtAcx0vC+PC2OK
 RzDnR9yojxM8L2cZg7cwv1zkMrMP0871MPreh2Ixgfug7UpFxgBJzcPyHND5LmTUvS/y
 PQiwkgB5zWX72gWoPe/W4LQ4M5kYQ1BLye5goQ4jUm9EwGuBZPXMQyAyVTehaNJpjsJt
 dJn6jbt6qtfWcl8OcE7exE7bsFpNNlh+6hGBihZWVSDmpumsbfF4KpWJrEP7fH+Vf1Mb
 9vEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a/hYYN8BbL4ShY2j48e6b20B+dWEh/XMhNWc8oWxq/c=;
 b=b0z9hRR1zEmyW9/hvFYwuJP1utkVZUqn241AhKbY9CE8ucl++6DLkAnk8ufB/WEG5I
 vDPBRTf/K8h9q1g2e5VY0sQOOs2w5uxsrXVyIjwY2KO42NdU9QTUAw6j++w5BS4SPdOd
 1uzKocSCGqKKbH0ALw60zntlvmsNiyi4GXDV9FpyeyV7gnxjpcEf8lmedGUnq5A82jth
 JIUMnTlPFR6xxPCS3BT7Z7PpzhLN+RhlChTLczwgxirg0gdU3Z5j2uZDzIAh5b7Hpujy
 EpuqbnuNHkK9clg3tLJt+JAL9uT3QYFv/VcSPxZF5v9mR/yhwJQDIoiRCgfdGVscfem4
 U5DQ==
X-Gm-Message-State: AOAM531UVRqceU6N90t2Js59BlADkfXyXMKwSh7DayNRQ/D4r+uyTTVD
 tR8pNjN02BvXppaD5y7HDAQ=
X-Google-Smtp-Source: ABdhPJxDRJHDVqbHKb2qtzDJVr2cflYnztfp0SyBt44azn0SbJGa86OR0cOwbeEZLECsHmXeyUGfYQ==
X-Received: by 2002:a5d:47cb:0:b0:203:fa18:3657 with SMTP id
 o11-20020a5d47cb000000b00203fa183657mr13356747wrc.490.1647900485189; 
 Mon, 21 Mar 2022 15:08:05 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 o11-20020adf9d4b000000b001f0077ea337sm14382800wre.22.2022.03.21.15.08.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 15:08:04 -0700 (PDT)
Message-ID: <7f689b45-a16c-8a59-d3d7-6344f0982b38@gmail.com>
Date: Mon, 21 Mar 2022 23:08:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/5] softmmu/cpus: Free cpu->thread in
 generic_destroy_vcpu_thread()
Content-Language: en-US
To: Mark Kanda <mark.kanda@oracle.com>, qemu-devel@nongnu.org
References: <20220321141409.3112932-1-mark.kanda@oracle.com>
 <20220321141409.3112932-3-mark.kanda@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220321141409.3112932-3-mark.kanda@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
> Free cpu->thread in a new AccelOpsClass::destroy_vcpu_thread() handler
> generic_destroy_vcpu_thread().
> 
> vCPU hotunplug related leak reported by Valgrind:
> 
> ==102631== 8 bytes in 1 blocks are definitely lost in loss record 1,037 of 8,555
> ==102631==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
> ==102631==    by 0x69EE4CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
> ==102631==    by 0x92443A: kvm_start_vcpu_thread (kvm-accel-ops.c:68)
> ==102631==    by 0x4505C2: qemu_init_vcpu (cpus.c:643)
> ==102631==    by 0x76B4D1: x86_cpu_realizefn (cpu.c:6520)
> ==102631==    by 0x9344A7: device_set_realized (qdev.c:531)
> ==102631==    by 0x93E329: property_set_bool (object.c:2273)
> ==102631==    by 0x93C2F8: object_property_set (object.c:1408)
> ==102631==    by 0x940796: object_property_set_qobject (qom-qobject.c:28)
> ==102631==    by 0x93C663: object_property_set_bool (object.c:1477)
> ==102631==    by 0x933D3B: qdev_realize (qdev.c:333)
> ==102631==    by 0x455EC4: qdev_device_add_from_qdict (qdev-monitor.c:713)
> 
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> ---
>   accel/accel-common.c              | 6 ++++++
>   accel/hvf/hvf-accel-ops.c         | 1 +
>   accel/kvm/kvm-accel-ops.c         | 1 +
>   accel/qtest/qtest.c               | 1 +
>   accel/tcg/tcg-accel-ops.c         | 1 +
>   accel/xen/xen-all.c               | 1 +
>   include/sysemu/accel-ops.h        | 2 ++
>   target/i386/hax/hax-accel-ops.c   | 1 +
>   target/i386/nvmm/nvmm-accel-ops.c | 1 +
>   target/i386/whpx/whpx-accel-ops.c | 1 +
>   10 files changed, 16 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

