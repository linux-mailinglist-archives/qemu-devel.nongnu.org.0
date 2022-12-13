Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C980B64B06F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 08:33:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4zkh-0000UV-QC; Tue, 13 Dec 2022 02:30:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4zkZ-0000Sl-BM
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 02:30:53 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4zkV-0004UC-9V
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 02:30:50 -0500
Received: by mail-wm1-x336.google.com with SMTP id m19so7560261wms.5
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 23:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D4KtxJrP8/Ha0aZs67Xp4z/g0zPtBzIPmT9rfWKarfw=;
 b=NFPc4tgmWpSnc4p9HQPI9+bSWptcHNGgTY5kagyPqu1rlTzAmXCNjuZ5JsM3A4b57V
 E5v4iKIYPZ15Iwl+eCj5KU13UPmji8SZJoIdCbi2aaB71ciawAK6aTdtmxoyimmN3+1Y
 pfRV8UYOd6apxjjBEmTJhQqCn9QPy8Bc0jD/34572MwF/5vnqM8ZN08ZvDG5hLxrkvM0
 h6e+K2tNeo2HQ09Dqf3aBntmf8J8BOIM5byuMSUubceSuET5nWnYjbFwLm9fXvzR5Zye
 lx+YZzcGYggrvzFRj+y3Ka9j4v1hc8k9rBDf5B9Sd3X3klmJp4RS10VfdarjeOy1OplT
 x2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D4KtxJrP8/Ha0aZs67Xp4z/g0zPtBzIPmT9rfWKarfw=;
 b=C7snR0ffFIXt7T56y+eq1A0wfUAp+Lbhisa0dEBW28D2Q+xQbtBWO54QgYwpt2Dwpl
 Jg3ZcIVVs8ULG9PygDwVEpq+1nEXpSNt/Ze5VFYGq56yjb5v4PfI9aKC3r5vo7YXQbZS
 t+G7rQFmTIoZ7zSOuF5ov0r7rZdNkumiJ8NIxO6/gyA8JhYQ3E8rlz89VPS55nvRyLQi
 oUN7Mu9ezA2dsT921C0d3g/sEwtBZTftOo5ZJZwBSEQ/21Uf1ku7cMJLkezv9Wq63GM2
 j2lGYKd+II7EMi36QfHGVGjeBirxjKc72jQGUdDmBqCl8tP5RoHxr1FGWQX8SrKmDcrg
 u26g==
X-Gm-Message-State: ANoB5plXwbwsfDqA9Y0o6Vjw7gJGRiTmdBziNK2Wg0c+/vVIXOmyfxPP
 G4K6EH6zhXW5NCP6FJMK8fyLow==
X-Google-Smtp-Source: AA0mqf6qH1VxQY3Ut3pN2blMiUeC3QJ3w5+s8KdLQKiSh6EbKhJNVhrGgEBdDSlbUHRT5VQYh5D1hQ==
X-Received: by 2002:a05:600c:3d8f:b0:3cf:d70d:d5a8 with SMTP id
 bi15-20020a05600c3d8f00b003cfd70dd5a8mr13923809wmb.6.1670916644428; 
 Mon, 12 Dec 2022 23:30:44 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c314700b003cfd4a50d5asm13319670wmo.34.2022.12.12.23.30.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 23:30:43 -0800 (PST)
Message-ID: <8ed5aab1-402f-9d9b-c70e-5d8082d35d1e@linaro.org>
Date: Tue, 13 Dec 2022 08:30:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH-for-8.0 06/10] hw/virtio: Cache access_is_big_endian
 value in VirtIODevice state
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Cc: Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20221212230517.28872-1-philmd@linaro.org>
 <20221212230517.28872-7-philmd@linaro.org>
 <94c26d02-94d5-ec42-99bf-3fac080e567e@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <94c26d02-94d5-ec42-99bf-3fac080e567e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 13/12/22 01:14, Richard Henderson wrote:
> On 12/12/22 17:05, Philippe Mathieu-Daudé wrote:
>> The device endianness doesn't change during runtime.
> 
> What are you talking about?  Of course it does.

The host CPU certainly does, but the virtio device doesn't... Does it?

This check only consider the device, not the CPU:

     bool virtio_access_is_big_endian(VirtIODevice *vdev)
     {
     #if defined(LEGACY_VIRTIO_IS_BIENDIAN)
         return virtio_is_big_endian(vdev);
     #elif TARGET_BIG_ENDIAN
         if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
             /*Devices conforming to VIRTIO 1.0 or later are always LE.*/
             return false;
         }
         return true;
     #else
         return false;
     #endif
     }

     static inline bool virtio_is_big_endian(VirtIODevice *vdev)
     {
         if (!virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
             assert(vdev->device_endian != VIRTIO_DEVICE_ENDIAN_UNKNOWN);
             return vdev->device_endian == VIRTIO_DEVICE_ENDIAN_BIG;
         }
         /* Devices conforming to VIRTIO 1.0 or later are always LE. */
         return false;
     }

and once the features are negotiated it doesn't seem to change.

> I mean, it doesn't often in practice, because the Linux kernel is 
> compiled for one endianness and doesn't keep toggling state, but the 
> hooks that you're replacing test for the *current* endianness state of 
> the cpu.  So this is a behaviour change.

I agree. Note however currently the CPU endianness is only checked once
upon virtio device reset (or from a migration stream):

     void virtio_reset(void *opaque)
     {
         VirtIODevice *vdev = opaque;
         VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
         int i;

         virtio_set_status(vdev, 0);
         if (current_cpu) {
             /* Guest initiated reset */
             vdev->device_endian = virtio_current_cpu_endian();
         } else {
             /* System reset */
             vdev->device_endian = virtio_default_endian();
         }

     bool cpu_virtio_is_big_endian(CPUState *cpu)
     {
         CPUClass *cc = CPU_GET_CLASS(cpu);

         if (cc->sysemu_ops->virtio_is_big_endian) {
             return cc->sysemu_ops->virtio_is_big_endian(cpu);
         }
         return target_words_bigendian();
     }

ARM being the single arch implementing a runtime endianness check:

     static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
     {
         ARMCPU *cpu = ARM_CPU(cs);
         CPUARMState *env = &cpu->env;

         cpu_synchronize_state(cs);
         return arm_cpu_data_is_big_endian(env);
     }

> Have you considered that the bootloader and the kernel may use different 
> endianness?

Certainly, but I'll revisit the code more thoughtfully.

Thanks,

Phil.

