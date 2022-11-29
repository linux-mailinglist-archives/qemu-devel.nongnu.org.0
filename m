Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CCF63BB64
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 09:21:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozvrO-0002Xz-2O; Tue, 29 Nov 2022 03:20:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1ozvrC-0002Vv-Nd; Tue, 29 Nov 2022 03:20:54 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1ozvqu-0008Kj-0j; Tue, 29 Nov 2022 03:20:38 -0500
Received: by mail-io1-xd35.google.com with SMTP id p141so9491039iod.6;
 Tue, 29 Nov 2022 00:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=imvRvzRFXNSpuT6Yejm950coPKmHh3JD6y+kT+OXZbg=;
 b=KdvQdUCjl8mb9mnkOlyW5/VT2ooURpf53XrlpuqPwwb6I9BxD6HJafkhGwXhFUoMTm
 r9eQd+qt4L5vgkp/E2TA7r+U7DElnpBAes8w7sxZbVl1lRVHbB+B4PsPtiEkE8RpAtoz
 VzsPWZUV297t6YvKH1fS5K+rD9pnqLr5NSyTxO5C0+IgM4YInc3Yvxr8Z0AI4Hafa0RE
 7DNzRCc3VxB3KPIiSeI4osB/hJ5moZp/FgyvQGIpdd3VVEMrYzwVb93sVQtH+sNIU6fk
 GRwlyKkN/ufMt2EsCPe5ynX1o1OkqjSFF61JSO55U2uLsI57yrAXm1XHu8gXRcoTi5rS
 jntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=imvRvzRFXNSpuT6Yejm950coPKmHh3JD6y+kT+OXZbg=;
 b=5qEJlzN1S5OYL15zPsNuBCHdYJrbUYR1+2WWolB+be75VdKm00vIpfrpMaUdQm/OtZ
 Uls/+BXIh4fochZ2d1D06n/Z2wAsvBDZA9qmnCm+v08y2dd1QgNOznPhencH+cmaUbb7
 9dASaGhjYEf6XGgYrnlxdBIK+pk0mjrbg2fhOD2SRbnhF534S/QlvHXzvMCXZlqNgWq0
 GIc78S1eaiT2CDsOkfguZq/KSX11cIznVRl8644Fjsrz8SW3XKgO7Oh4ejU/kPUB4XFU
 W06yo2Vb65nnZZRL3CZWrRrSIBEBaXz8LDRggP9fVSA/x/JN/j7oH21gGG6yFDycN78r
 baPw==
X-Gm-Message-State: ANoB5pnLjyZyoG2Q9q60MyNnzQGlctMs1hgJ1QOzJr+zKnPfsqGv9LzV
 g6KAbbjQ1X5TfznwCbO8URTaaN+upSqYuA==
X-Google-Smtp-Source: AA0mqf6RD4o++MqSoKjpKVdKQDypgvv3Xxy+dWboBYq3qj2yPgEYCIZr4qFtz/UeOvo4F2nSke5zcA==
X-Received: by 2002:a05:6602:408b:b0:6bb:f9be:3691 with SMTP id
 bl11-20020a056602408b00b006bbf9be3691mr23942063iob.123.1669710011962; 
 Tue, 29 Nov 2022 00:20:11 -0800 (PST)
Received: from MBP (ec2-18-117-95-84.us-east-2.compute.amazonaws.com.
 [18.117.95.84]) by smtp.gmail.com with ESMTPSA id
 v23-20020a02b097000000b00389ca12ddd1sm996842jah.174.2022.11.29.00.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 00:20:11 -0800 (PST)
References: <20221108023542.17557-1-schspa@gmail.com>
 <CAFEAcA_EgkndLQs=1KtXHuvVPLGs9RzHWL3QWG4CWCjbNfipQw@mail.gmail.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Schspa Shi <schspa@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
Date: Tue, 29 Nov 2022 15:50:55 +0800
In-reply-to: <CAFEAcA_EgkndLQs=1KtXHuvVPLGs9RzHWL3QWG4CWCjbNfipQw@mail.gmail.com>
Message-ID: <m2bkoqmatm.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=schspa@gmail.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 8 Nov 2022 at 02:35, Schspa Shi <schspa@gmail.com> wrote:
>>
>> We use 32bit value for linux,initrd-[start/end], when we have
>> loader_start > 4GB, there will be a wrong initrd_start passed
>> to the kernel, and the kernel will report the following warning
>
>> To fix it, we can change it to u64 type.
>>
>> Signed-off-by: Schspa Shi <schspa@gmail.com>
>> ---
>>  hw/arm/boot.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 57efb61ee419..da719a4f8874 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -638,14 +638,14 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>      }
>>
>>      if (binfo->initrd_size) {
>> -        rc = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start",
>> +        rc = qemu_fdt_setprop_u64(fdt, "/chosen", "linux,initrd-start",
>>                                     binfo->initrd_start);
>>          if (rc < 0) {
>>              fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
>>              goto fail;
>>          }
>>
>> -        rc = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
>> +        rc = qemu_fdt_setprop_u64(fdt, "/chosen", "linux,initrd-end",
>>                                     binfo->initrd_start + binfo->initrd_size);
>>          if (rc < 0) {
>>              fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
>
> Hi; the device-tree folks got back to me a bit late on this one,
> but apparently the intention is that these fields should be
> of a size that matches the #address-cells (and they'll fix the
> schema docs to say that at some point). Some future kernel
> or dtb-schema-check might warn about this, and also since it is
> what u-boot does:
> https://github.com/u-boot/u-boot/blob/218e2c45af83f2cb7b1374b9023b4ced6eb0bb77/common/fdt_support.c#L248
> following that same approach is the safest thing in terms of not
> breaking existing code.
>
> I think that to do this in QEMU we just need to call
>
>    qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initrd-start",
>                                 acells, binfo->initrd_start);
>
> and similarly for initrd-end.
>
> Would you mind doing a respin and test of this patch that works
> that way?
>

I have made a new patch & test it this way, it works perfectly.

> thanks
> -- PMM


-- 
BRs
Schspa Shi

