Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E7E66D69E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 08:05:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHg1N-0008HX-RJ; Tue, 17 Jan 2023 02:04:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHg1M-0008HO-0O
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 02:04:36 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHg1J-0007rx-Rd
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 02:04:35 -0500
Received: by mail-wr1-x42a.google.com with SMTP id r30so5137802wrr.10
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 23:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PsQ4FbPhrTnQDJFgsT6jiFQUr90OcnwOv4eFUpeBZG0=;
 b=IkJ8LlFhZC/I5rVBGE+Jcvq2hoYtLNp4PADla1amKVit4GIwM/NA1BUTeaf9pNm8vg
 0Ve6+vJx8TwzndPSK0KaCkkg/Zl9aUF+c9grljrOop+Ho/9q18KrZWAKoCCLQVKF5oq1
 A9smRpTtveN8V7HIc6ByRffzTxBh8TgFgVkrp4TtbIzZkk+v1t6IkxS2QRlXVuSvS3Lx
 lmM5njnsZthN590vN/tQR+pJHJIyov2ioDrVNB3GUieAK0P5QQu7HjNtXedxCMm7PflC
 keNZMxi0iEAAbm8wYw8MOc9oPhSbq8GEyPw7OsFHLOLnHoYddmHdMmnGuyGuG0si1EI7
 KsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PsQ4FbPhrTnQDJFgsT6jiFQUr90OcnwOv4eFUpeBZG0=;
 b=1mZMf3Tu3IBm8o/JMLlEEARY6DfQKg3DPXMfuW7EtyenvnmDn7f12YXpqw2t67jCMo
 MXXEl3DFZTIQyzzd16uu0EtzUT6rleMYSX5TknpbgzQpz8RhIiPDCI6EqX/Fe6BnSYDi
 tDmujRQCRHcwdE/zss/1/SBGXKu26OOUeucesBclmjS2sRIfImETc4DwVq3RN4kDjdch
 EeeGOh19eO9MFrwZln86C9tMrYTkRubvNSfVEdNNzwyJFBZe7hfPXuCpwpilBf2xOMs7
 emzF5uuSyhhbrb9d2SltJekUoCVludaF6dFYA+/vYuOWr7WrEZnkRugb0vPp46VPNxGu
 6dxg==
X-Gm-Message-State: AFqh2kpKi9D+FP0o6IUtpUkte2Lc2LAV08hg/U9PNmTy6TbLHkC0P0r9
 +kyrKZE7yzdFJYIEfoVyHizjvQ==
X-Google-Smtp-Source: AMrXdXtRMbgr4zeQfTswgWk0WaOJvZkOc7RuNgo1V3Q0IjdUvmkjziv33VdzAm7/Z0VNPABy8tQ4fA==
X-Received: by 2002:a5d:6b8b:0:b0:2be:1d46:e500 with SMTP id
 n11-20020a5d6b8b000000b002be1d46e500mr1384264wrx.28.1673939071549; 
 Mon, 16 Jan 2023 23:04:31 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v11-20020a5d678b000000b0029e1aa67fd2sm10242587wru.115.2023.01.16.23.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 23:04:31 -0800 (PST)
Message-ID: <cff14816-39eb-db1c-9bda-51cad7fcb7c1@linaro.org>
Date: Tue, 17 Jan 2023 08:04:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] usb-ccid: make ids and descriptor configurable
Content-Language: en-US
To: "Ripke, Klaus" <klaus.ripke@secunet.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "kraxel@redhat.com" <kraxel@redhat.com>,
 "marcandre.lureau@gmail.com" <marcandre.lureau@gmail.com>
References: <c07957e3813d9d2f84e981bb1b8d99862a2998b9.camel@secunet.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <c07957e3813d9d2f84e981bb1b8d99862a2998b9.camel@secunet.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

Hi Klaus,

On 16/1/23 16:46, Ripke, Klaus wrote:
> Signed-off-by: Klaus Ripke <klaus.ripke@secunet.com>
> 
> hw/usb/dev-smartcard-reader.c:
> Set some static values from ccid_properties.
> 
> ---
>   hw/usb/dev-smartcard-reader.c | 35 ++++++++++++++++++++++++++++++-----
>   1 file changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-
> reader.c
> index 28164d89be..4002157773 100644
> --- a/hw/usb/dev-smartcard-reader.c
> +++ b/hw/usb/dev-smartcard-reader.c
> @@ -311,6 +311,11 @@ struct USBCCIDState {
>       uint8_t  powered;
>       uint8_t  notify_slot_change;
>       uint8_t  debug;
> +    /* the following are copied to static on initial realize */
> +    uint16_t vendor;
> +    uint16_t product;
> +    uint8_t  maxslot;
> +    uint8_t  feat2;
>   };
>   
>   /*
> @@ -323,7 +328,11 @@ struct USBCCIDState {
>    *   0dc3:1004 Athena Smartcard Solutions, Inc.
>    */
>   
> -static const uint8_t qemu_ccid_descriptor[] = {
> +enum {
> +    DESC_MAXSLOT = 4,
> +    DESC_FEAT2 = 42 /* dwFeatures byte 2 */
> +};
> +static uint8_t qemu_ccid_descriptor[] = {

If you create 2 devices with different properties, the
first gets its properties overwritten with the second's
ones.

>           /* Smart Card Device Class Descriptor */
>           0x36,       /* u8  bLength; */
>           0x21,       /* u8  bDescriptorType; Functional */
> @@ -472,7 +481,7 @@ static const USBDescDevice desc_device = {
>       },
>   };
>   
> -static const USBDesc desc_ccid = {
> +static USBDesc desc_ccid = {
>       .id = {
>           .idVendor          = CCID_VENDOR_ID,
>           .idProduct         = CCID_PRODUCT_ID,
> @@ -1295,9 +1304,10 @@ static void ccid_card_realize(DeviceState *qdev,
> Error **errp)
>       USBCCIDState *s = USB_CCID_DEV(dev);
>       Error *local_err = NULL;
>   
> -    if (card->slot != 0) {
> -        error_setg(errp, "usb-ccid supports one slot, can't add %d",
> -                   card->slot);
> +    DPRINTF(s, D_VERBOSE, "%s: slot %d\n", __func__, card->slot);
> +    if (card->slot > qemu_ccid_descriptor[DESC_MAXSLOT]) {
> +        error_setg(errp, "usb-ccid supports %d slot, can't add %d",
> +                   qemu_ccid_descriptor[DESC_MAXSLOT] + 1, card-
>> slot);
>           return;
>       }
>       if (s->card != NULL) {
> @@ -1317,6 +1327,14 @@ static void ccid_card_realize(DeviceState *qdev,
> Error **errp)
>   static void ccid_realize(USBDevice *dev, Error **errp)
>   {
>       USBCCIDState *s = USB_CCID_DEV(dev);
> +    static int initialized;
> +    if (!initialized) {
> +        desc_ccid.id.idVendor = s->vendor;
> +        desc_ccid.id.idProduct = s->product;
> +        qemu_ccid_descriptor[DESC_MAXSLOT] = s->maxslot;
> +        qemu_ccid_descriptor[DESC_FEAT2] = s->feat2;
> +        initialized = !0;
> +    }
>   
>       usb_desc_create_serial(dev);
>       usb_desc_init(dev);
> @@ -1339,6 +1357,8 @@ static void ccid_realize(USBDevice *dev, Error
> **errp)
>       ccid_reset_parameters(s);
>       ccid_reset(s);
>       s->debug = parse_debug_env("QEMU_CCID_DEBUG", D_VERBOSE, s-
>> debug);
> +    DPRINTF(s, D_VERBOSE, "ccid_realize %d %x %x %x %x\n",
> +        initialized, s->vendor, s->product, s->maxslot, s->feat2);
>   }
>   
>   static int ccid_post_load(void *opaque, int version_id)
> @@ -1434,9 +1454,14 @@ static const VMStateDescription ccid_vmstate = {
>   
>   static Property ccid_properties[] = {
>       DEFINE_PROP_UINT8("debug", USBCCIDState, debug, 0),
> +    DEFINE_PROP_UINT16("vendor", USBCCIDState, vendor,
> CCID_VENDOR_ID),
> +    DEFINE_PROP_UINT16("product", USBCCIDState, product,
> CCID_PRODUCT_ID),
> +    DEFINE_PROP_UINT8("maxslot", USBCCIDState, maxslot, 0),
> +    DEFINE_PROP_UINT8("feat2", USBCCIDState, feat2, 0),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> +
>   static void ccid_class_initfn(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);


