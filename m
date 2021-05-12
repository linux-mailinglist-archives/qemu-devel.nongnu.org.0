Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA3C37D40F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 22:01:56 +0200 (CEST)
Received: from localhost ([::1]:48884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgv3L-0001P0-37
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 16:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgv0S-0007Fb-L6
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:58:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgv0P-0004ho-2N
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:58:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620849531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rkMzNyHBMdovBwT5uIcFgiQS+4Hkr3a54nKyz4ZSSfw=;
 b=inEZGv4EaUt3WO0Hi3QEIuQilpbONx8Uh5laSc+eBaWS+aRaYSv4p4WGE10SLj7Iy0svcR
 sThoIB2GeHwVrixOjPzwl/+NQCQCQYxeqXdTaATTWOkGALObtEtxKl8mmrZH8afeP8OMPF
 Z3fLCoGYzoz7eusQ7AZKqh2UbHfb5qM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-x-Vtk5NoMNinVsPdK62H4A-1; Wed, 12 May 2021 15:58:50 -0400
X-MC-Unique: x-Vtk5NoMNinVsPdK62H4A-1
Received: by mail-wr1-f69.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so10484090wrm.13
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 12:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rkMzNyHBMdovBwT5uIcFgiQS+4Hkr3a54nKyz4ZSSfw=;
 b=ctYCfjkTfYXdieEf491tJIYuPcoFG0UqFPmGLXtdcJIV0iYwhNW0LNKuANT0nXS4aq
 FNqQzYj1UgihRrEIVGclzsZKK40nPlMRCXqVal5EO6UX4EBJWQdMzAwOsPM4KlKAmVbU
 62dMxbNb7N3KSOpdk+bwXXYoYhIP3uqWNXOgnqmVK8PC3dFHsCrQzLBaV+iXBADPegdo
 zAGxDIo6WzE0Zb0kYB7Dg18kLhSYgaR9rO2K6XTZZRmCsNguz7h62D5EIs+vgtfCHcTz
 VL+6F3DyTXk8p0MaU1CrK4sHZsitwZa24hz0ww/x0J9sHdbwRYqaF3IAVgO2rwF+y8li
 zNAg==
X-Gm-Message-State: AOAM531C0u+IimEDtFjbDud2DsVEO58ApNna3cKf4JewoWyVFmFxRXW1
 BKVkZw0GM/KTsmYTL41tbaPewpHZVf3Y6PlqB2yzwyye0P93XNr+qjeh7heYBsHyWNG0qctKi6E
 NdsKSBpffx1Zor2s=
X-Received: by 2002:a05:600c:19c8:: with SMTP id
 u8mr185379wmq.50.1620849529081; 
 Wed, 12 May 2021 12:58:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyN90s83A3TD9KaKwJDov6ehgRkK4v9NrM64HG8xXGvChJ+qwNzJBCUTLwVIom1JN4Kptp9ww==
X-Received: by 2002:a05:600c:19c8:: with SMTP id
 u8mr185362wmq.50.1620849528879; 
 Wed, 12 May 2021 12:58:48 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c62sm667157wme.5.2021.05.12.12.58.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 12:58:48 -0700 (PDT)
Subject: Re: [PATCH 2/3] pc-bios/s390-ccw/Makefile: Check more compiler flags
 for Clang
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20210512171550.476130-1-thuth@redhat.com>
 <20210512171550.476130-3-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4f82847f-83cc-dea0-e455-b45f69848be2@redhat.com>
Date: Wed, 12 May 2021 21:58:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512171550.476130-3-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Richard

On 5/12/21 7:15 PM, Thomas Huth wrote:
> Older versions of Clang do not like -fno-delete-null-pointer-checks
> or -msoft-float. So let's add a proper check for those.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  pc-bios/s390-ccw/Makefile | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
> index cee9d2c63b..97008d94c9 100644
> --- a/pc-bios/s390-ccw/Makefile
> +++ b/pc-bios/s390-ccw/Makefile
> @@ -31,10 +31,11 @@ OBJECTS = start.o main.o bootmap.o jump2ipl.o sclp.o menu.o \
>  
>  QEMU_CFLAGS := -Wall $(filter -W%, $(QEMU_CFLAGS))
>  QEMU_CFLAGS += $(call cc-option,-Werror $(QEMU_CFLAGS),-Wno-stringop-overflow)
> -QEMU_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks -fno-common -fPIE
> +QEMU_CFLAGS += -ffreestanding -fno-common -fPIE

OK

>  QEMU_CFLAGS += -fwrapv -fno-strict-aliasing -fno-asynchronous-unwind-tables
> -QEMU_CFLAGS += $(call cc-option, $(QEMU_CFLAGS), -fno-stack-protector)
> -QEMU_CFLAGS += -msoft-float
> +QEMU_CFLAGS += $(call cc-option,-Werror $(QEMU_CFLAGS),-fno-delete-null-pointer-checks)
> +QEMU_CFLAGS += $(call cc-option,-Werror $(QEMU_CFLAGS),-fno-stack-protector)

OK

> +QEMU_CFLAGS += $(call cc-option,-Werror $(QEMU_CFLAGS),-msoft-float)

For this one I don't understand clang... How to enforce no floating
point code generation?

>  QEMU_CFLAGS += $(call cc-option, $(QEMU_CFLAGS),-march=z900,-march=z10)
>  QEMU_CFLAGS += -std=gnu99
>  LDFLAGS += -Wl,-pie -nostdlib
> 


