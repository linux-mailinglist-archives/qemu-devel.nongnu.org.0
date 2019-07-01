Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB33B5C590
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 00:16:47 +0200 (CEST)
Received: from localhost ([::1]:45982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi4bF-0005iK-4B
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 18:16:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48866)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hi3MI-0007UF-R0
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 16:57:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hi3MF-00052P-KR
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 16:57:04 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50593)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hi3MF-0004x3-DQ
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 16:57:03 -0400
Received: by mail-wm1-f66.google.com with SMTP id n9so854846wmi.0
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 13:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dKB2Umh3Pp34bt2n2bl4TPAAqwbQYVzTk1oPuHSAwrc=;
 b=SqSkWPlJJ9usjKf/jAgwovc13sqoQih9YDpvt8K03qefQawLXky2P79K3X7T/Kve9Z
 WzfltkehUkL2cY1hIxPW9fDGWPTh3BtbkbX3pTksGXRZXQ9ANAHvkQNtX8yNmWkIyc62
 MDidskHmpgXtWT5QxwA8Fayo3isI/+tDVA3hpB61Bv+kxXeDNb6S77I9Xn4LxbOt5Ks5
 85TEsC8IxYROiMvGu+cEibPpjNIOlM4rUOfyt8QlFoI7HCLd50+yl+jNcEkz6/OHyh32
 TBtpLslLQzIGpOtMrtOyQfT2HDRDcbdVY/tAUZ/H8jb7iX3RukPob6AM2fFfZK8rxAoI
 83Tg==
X-Gm-Message-State: APjAAAUTjelCPpSYdb1LBsm3IR/uvpztQ9hgCJv8+xOjXosWl+k08SVP
 NFubEDahOU8RF64WQ5+ndVoPkQ==
X-Google-Smtp-Source: APXvYqxaCki1wpQ1Y15fVf3ui/iD14zg23UVmXEH0idZRlkHm7qlBHzosP0f/+r3iRD6sIGT/wJPvw==
X-Received: by 2002:a1c:b68a:: with SMTP id g132mr370179wmf.66.1562004792286; 
 Mon, 01 Jul 2019 11:13:12 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id v65sm402838wme.31.2019.07.01.11.13.11
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jul 2019 11:13:11 -0700 (PDT)
To: qemu-devel@nongnu.org
References: <156200378933.9862.9905804796969886990@c4a48874b076>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <81770e41-70a3-4e57-d7d7-501321843dd4@redhat.com>
Date: Mon, 1 Jul 2019 20:13:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <156200378933.9862.9905804796969886990@c4a48874b076>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-devel] [PATCH 0/6] hw/arm: Use ARM_CPU_TYPE_NAME() and
 object_initialize_child()
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
Cc: peter.maydell@linaro.org, andrew.smirnov@gmail.com, jasowang@redhat.com,
 alistair@alistair23.me, jcd@tribudubois.net, b.galvani@gmail.com,
 i.mitsyanko@gmail.com, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 antonynpavlov@gmail.com, edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/19 7:56 PM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20190701123108.12493-1-philmd@redhat.com/
> 
> Hi,
> 
> This series failed build test on s390x host. Please find the details below.
> 
>   CC      hw/dma/i8257.o
>   CC      hw/dma/xilinx_axidma.o
> /var/tmp/patchew-tester-tmp-6umc5eop/src/hw/dma/xilinx_axidma.c: In function ‘xilinx_axidma_init’:
> /var/tmp/patchew-tester-tmp-6umc5eop/src/hw/dma/xilinx_axidma.c:568:29: error: ‘TYPE_XILINX_AXI_ENET_DATA_STREAM’ undeclared (first use in this function); did you mean ‘TYPE_XILINX_AXI_DMA_DATA_STREAM’?
>   568 |                             TYPE_XILINX_AXI_ENET_DATA_STREAM, &error_abort,
>       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                             TYPE_XILINX_AXI_DMA_DATA_STREAM
> /var/tmp/patchew-tester-tmp-6umc5eop/src/hw/dma/xilinx_axidma.c:568:29: note: each undeclared identifier is reported only once for each function it appears in
> /var/tmp/patchew-tester-tmp-6umc5eop/src/hw/dma/xilinx_axidma.c:572:29: error: ‘TYPE_XILINX_AXI_ENET_CONTROL_STREAM’ undeclared (first use in this function); did you mean ‘TYPE_XILINX_AXI_DMA_CONTROL_STREAM’?
>   572 |                             TYPE_XILINX_AXI_ENET_CONTROL_STREAM, &error_abort,
>       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                             TYPE_XILINX_AXI_DMA_CONTROL_STREAM

It would be nice if GCC directly fix the patch instead of embarrassing
the author for obvious copy/paste mistakes...

