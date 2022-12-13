Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF7864B13D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 09:34:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p50im-0006SX-53; Tue, 13 Dec 2022 03:33:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p50ii-0006S4-3y
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:33:00 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p50if-0004sF-16
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:32:59 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so7340312wmb.5
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 00:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bFAezJgzhLk/XmeE7VgQ9MaGwktz/r2q3b0iqxiOiYg=;
 b=uE/zjXOsHCKA1yfYd1lKnkxVxbEl50lepz34CgfBnlMHDDurIZHvD67jwagAprFV+c
 C36cbUaef+24qogu0ACFxfXxyZFWkTOHYh06pj/QWU4VFeEuzi/FbtC2rd9Tq73afk+n
 g10Ym6c7ImUaZ8Dz8Egdu6eXXkmVYhOKVYhIJJXwxWfOu7vuJMLq1H2CRHAZYR7EQo0Y
 UAWzhgT45ns0tSyXtoiHutxwFFDJvuUjfEx8N1yd/p6a8aT1OIZ/HM3EYmSR+BENZXSy
 pQj85mbrTfF5qHyzSXWF19sArUY3vmR4xTpzh6czKRNQXRQz9RcpyF25EXPjTbwPo/iD
 /b3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bFAezJgzhLk/XmeE7VgQ9MaGwktz/r2q3b0iqxiOiYg=;
 b=QXnCLek8g4jijwpdIkdHoDC3pMPQZucFTzDnDc7kRc6CuK/MAqYG7aBq/bUuQlzS6P
 XAYm/Jmc/6K/ptxrWKLE6EL/6sSmFgvEMp1epFlgAm73Qcl5SW1SVAgpjfFe4o8J2/7J
 hXYG1QeGi99kLxwqb+Q5eEkAjShd+obQm8CDrVTmnKkKIHuofBDOKFner4V4tF0SV9f/
 /rOlaw+inkS/QchAiIXom6CmWN0BgUSuGPe+qnfMzbBHWl/WVtVqXtN58FEo3ipghMf/
 3dQsgVEIRNJmfVdfloJnpHdjbBtMEOyfmRxnIXmFt1UCCKtPSNWDqZTp9+10Vj44maR7
 8wJg==
X-Gm-Message-State: ANoB5pnnloQ3nwelEHdxey46ckWxmG0gCibBE0LOiyG82xfCugt8A+mt
 Ax785EIkrUxwq5aPD+AlYSckNQ==
X-Google-Smtp-Source: AA0mqf51xFre89I6+ZW+TkBqa+shbQZhXmC5MknI4VeThU/DbR35fUn+BrHeQSts6bDrSb4FyU4/vQ==
X-Received: by 2002:a05:600c:3b15:b0:3d0:d177:cac1 with SMTP id
 m21-20020a05600c3b1500b003d0d177cac1mr14708566wms.36.1670920374137; 
 Tue, 13 Dec 2022 00:32:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c359000b003d1f2c3e571sm13210889wmq.33.2022.12.13.00.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 00:32:53 -0800 (PST)
Message-ID: <6e6afa52-0a46-91fa-ebd4-642dfd2499a9@linaro.org>
Date: Tue, 13 Dec 2022 09:32:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH-for-8.0 06/10] hw/virtio: Cache access_is_big_endian
 value in VirtIODevice state
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
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
 <8ed5aab1-402f-9d9b-c70e-5d8082d35d1e@linaro.org>
 <8bc3e65d-3f1f-22e5-d56e-2b8bb1a57319@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <8bc3e65d-3f1f-22e5-d56e-2b8bb1a57319@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 13/12/22 09:03, Thomas Huth wrote:
> On 13/12/2022 08.30, Philippe Mathieu-Daudé wrote:
>> On 13/12/22 01:14, Richard Henderson wrote:
>>> On 12/12/22 17:05, Philippe Mathieu-Daudé wrote:
>>>> The device endianness doesn't change during runtime.
>>>
>>> What are you talking about?  Of course it does.
>>
>> The host CPU certainly does, but the virtio device doesn't... Does it?
>>
>> This check only consider the device, not the CPU:
>>
>>      bool virtio_access_is_big_endian(VirtIODevice *vdev)
>>      {
>>      #if defined(LEGACY_VIRTIO_IS_BIENDIAN)
>>          return virtio_is_big_endian(vdev);
>>      #elif TARGET_BIG_ENDIAN
>>          if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
>>              /*Devices conforming to VIRTIO 1.0 or later are always LE.*/
>>              return false;
>>          }
>>          return true;
> 
> Well, this part here means that the endianness can indeed change on the 
> device side during runtime. Depending on whether VIRTIO_F_VERSION_1 is 
> negotiated or not, the device is little or big endian. Happens on s390x 
> for example - for legacy virtio, big endian is used, and for modern 
> virtio, little endian is used instead.

virtio_is_big_endian() depends on vdev->device_endian which is set in:

1) virtio_init()

     void virtio_init(VirtIODevice *vdev, uint16_t device_id,
                      size_t config_size)
     {
         ....
         vdev->device_endian = virtio_default_endian();

2) virtio_load()

     int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
     {
         int i, ret;
         int32_t config_len;
         uint32_t num;
         uint32_t features;
         BusState *qbus = qdev_get_parent_bus(DEVICE(vdev));
         VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
         VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);

         /*
          * We poison the endianness to ensure it does not get
          * used before subsections have been loaded.
          */
         vdev->device_endian = VIRTIO_DEVICE_ENDIAN_UNKNOWN;
         ....

         if (vdev->device_endian == VIRTIO_DEVICE_ENDIAN_UNKNOWN) {
             vdev->device_endian = virtio_default_endian();
         }

3) virtio_reset()

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

So the current patch is not complete and should be:

-- >8 --
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 09b1a0e3d9..b02b9058f9 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2124,6 +2124,7 @@ void virtio_reset(void *opaque)
          /* System reset */
          vdev->device_endian = virtio_default_endian();
      }
+    vdev->access_is_big_endian = virtio_access_is_big_endian(vdev);

      if (k->reset) {
          k->reset(vdev);
@@ -3018,6 +3019,7 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, 
int version_id)

      if (vdev->device_endian == VIRTIO_DEVICE_ENDIAN_UNKNOWN) {
          vdev->device_endian = virtio_default_endian();
+        vdev->access_is_big_endian = virtio_access_is_big_endian(vdev);
      }

      if (virtio_64bit_features_needed(vdev)) {
@@ -3193,6 +3195,7 @@ void virtio_init(VirtIODevice *vdev, uint16_t 
device_id, size_t config_size)
      vdev->vmstate = qdev_add_vm_change_state_handler(DEVICE(vdev),
              virtio_vmstate_change, vdev);
      vdev->device_endian = virtio_default_endian();
+    vdev->access_is_big_endian = virtio_access_is_big_endian(vdev);
      vdev->use_guest_notifier_mask = true;
  }
---

Still, the result of virtio_access_is_big_endian() doesn't depend on
the CPU endianness in my analysis... What am I missing?

Thanks,

Phil.

