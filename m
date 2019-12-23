Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5CA12924D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Dec 2019 08:39:38 +0100 (CET)
Received: from localhost ([::1]:54290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ijIJV-0007uL-KC
	for lists+qemu-devel@lfdr.de; Mon, 23 Dec 2019 02:39:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44942)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zxq_yx_007@163.com>) id 1ijIIE-0006yE-JQ
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 02:38:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zxq_yx_007@163.com>) id 1ijIIB-0002p3-5v
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 02:38:16 -0500
Received: from m12-18.163.com ([220.181.12.18]:40465)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zxq_yx_007@163.com>) id 1ijII9-0002AJ-NZ
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 02:38:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=XWZpj
 iTYmko2xHdBEd88MpugZUBQAuHCebWl98OLQ/w=; b=nPzzi0kkYt1aU+3/QyhHC
 yys5B2Avb9v1UCKrZuP3FR5UcPc1+Q2ejglgRdb15DJPh22fU6Dp7Mm98IVR6K3+
 l5W/6ZQVT+uY9F7aIl27XnpXl5VnHLsqtQb0XG5AqvdhZWsqG0hbTTf149lt79CT
 AKf3/Xc0SXts0k/LLy5AlU=
Received: from [10.11.32.153] (unknown [39.155.168.46])
 by smtp14 (Coremail) with SMTP id EsCowABXZo3abgBe7R7qNQ--.1776S2;
 Mon, 23 Dec 2019 15:38:02 +0800 (CST)
Subject: Re: [PATCH v5 07/37] serial: register vmsd with DeviceClass
To: qemu-devel@nongnu.org
References: <20191220134601.571905-1-marcandre.lureau@redhat.com>
 <20191220134601.571905-8-marcandre.lureau@redhat.com>
From: xiaoqiang zhao <zxq_yx_007@163.com>
Message-ID: <d68a1865-241c-2f82-5635-285862d723f7@163.com>
Date: Mon, 23 Dec 2019 15:38:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191220134601.571905-8-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: EsCowABXZo3abgBe7R7qNQ--.1776S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4Uuw4UXr4rWFy3uFW3Wrg_yoW8ZF1Upr
 98KFZ8KFy5tr9rWw43uw4YvFy8WF4DK3WUCr43Jw1aqr4Fkr1Syr4xGw1avFyUXFWktF15
 XF1UurykCFs5trJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j-F4_UUUUU=
X-Originating-IP: [39.155.168.46]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbB0haUxlUMTpd3LgACsN
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 220.181.12.18
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

在 2019/12/20 下午9:45, Marc-André Lureau 写道:
> Migration from old to new code works, however the other way fails for
> devices that use serial_init/serial_mm_init with "base", used as
> instance_id previously.
>
> (with qdev_set_legacy_instance_id, the alias_id is only used in
> savevm.c:find_se(), and thus can only be used to match against
> "legacy" instance id values. On new code, instance_id is generated
> incrementally from 0 with calculate_new_instance_id(), based on
> "qdev-path/vmsd-name")
>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/char/serial.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index 233a9e2076..e926845843 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -990,8 +990,7 @@ SerialState *serial_init(int base, qemu_irq irq, int baudbase,
>       s->baudbase = baudbase;
>       qemu_chr_fe_init(&s->chr, chr, &error_abort);
>       serial_realize_core(s, &error_fatal);
> -
> -    vmstate_register(NULL, base, &vmstate_serial, s);
> +    qdev_set_legacy_instance_id(dev, base, 2);
>       qdev_init_nofail(dev);
>   
>       memory_region_init_io(&s->io, NULL, &serial_io_ops, s, "serial", 8);
> @@ -1006,6 +1005,7 @@ static void serial_class_init(ObjectClass *klass, void *data)
>   
>       /* internal device for serialio/serialmm, not user-creatable */
>       dc->user_creatable = false;
> +    dc->vmsd = &vmstate_serial;
>   }
>   
>   static const TypeInfo serial_info = {
> @@ -1069,7 +1069,7 @@ SerialState *serial_mm_init(MemoryRegion *address_space,
>       qemu_chr_fe_init(&s->chr, chr, &error_abort);
>   
>       serial_realize_core(s, &error_fatal);
> -    vmstate_register(NULL, base, &vmstate_serial, s);
> +    qdev_set_legacy_instance_id(dev, base, 2);
>       qdev_init_nofail(dev);
>   
>       memory_region_init_io(&s->io, NULL, &serial_mm_ops[end], s,
Reviewed-by: xiaoqiang zhao <zxq_yx_007@163.com>


