Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86A05C08A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 17:45:36 +0200 (CEST)
Received: from localhost ([::1]:60240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhyUp-0005f4-ST
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 11:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42857)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hhyOC-00020A-F0
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 11:38:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hhyOB-0006PE-EG
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 11:38:44 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53204)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hhyOB-0006Nz-7I
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 11:38:43 -0400
Received: by mail-wm1-f65.google.com with SMTP id s3so1047217wms.2
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 08:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=629NRyPUhZNuewwFSbDPwgl565ExKqQtzj/ELWQY6AM=;
 b=JLvf62ALC822EPHikmAg6hvWguoS9P+tyPQQFOfHuDrd9Q1kGpy18t/W46u6EnLeXb
 5ZR+1mu1E7RHoVoHaueeExJkoW9JyBlaD8hLQukA6TVMUQFiMcQdJ6Avqa47uc6PKO74
 xBQFJSSSil8FDu/6llLjP5iHNVSG9OvoP2YxWWszSYZKrbfTZ0yYfxrUO6W8/NMhOWE0
 c7EtRRHQhyrVliFzWhN1Z5M7etgaKwwdq2Q9iWpdc8+ggqfmExAsWz+44DUPVmRlClKt
 9uZ9GYK0A+CQbzhqodG9SVT+g0TKcDGPor56Ke42kW6NIdHKL+X9T3aaLN0YU3J4Kvu9
 +GxQ==
X-Gm-Message-State: APjAAAWjKxkhLNbFC7ABO5Y7W+T7quJq9h8ZW8EGb6Bpy7nVgbCcnsKc
 OQHFDckgyQj8v8cGkHfm1K6Liw==
X-Google-Smtp-Source: APXvYqxA1IVwLGQghZhgm8oEIkJHfc7NFPxcNk2lOqh1ggwyybs4DBe3i/FcZ5cczg+xwfxrNvlwow==
X-Received: by 2002:a1c:eb16:: with SMTP id j22mr17086380wmh.140.1561995521740; 
 Mon, 01 Jul 2019 08:38:41 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id q1sm8226051wmq.25.2019.07.01.08.38.40
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jul 2019 08:38:41 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190701132516.26392-1-philmd@redhat.com>
 <20190701132516.26392-19-philmd@redhat.com>
 <CAFEAcA_XGuB5x+m5zmdBSE3bQP=jBdfWDzj_v0iBeqWmrETsng@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c1d7b9cf-5a31-3c58-0284-97b4249660d7@redhat.com>
Date: Mon, 1 Jul 2019 17:38:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_XGuB5x+m5zmdBSE3bQP=jBdfWDzj_v0iBeqWmrETsng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-devel] [PATCH v3 18/27] target/arm: Restrict semi-hosting
 to TCG
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
Cc: Yang Zhong <yang.zhong@intel.com>, Andrew Jones <drjones@redhat.com>,
 Samuel Ortiz <sameo@linux.intel.com>, Rob Bradford <robert.bradford@intel.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/19 5:25 PM, Peter Maydell wrote:
> On Mon, 1 Jul 2019 at 14:26, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Per Peter Maydell:
>>
>>   Semihosting hooks either SVC or HLT instructions, and inside KVM
>>   both of those go to EL1, ie to the guest, and can't be trapped to
>>   KVM.
>>
>> Let check_for_semihosting() return False when not running on TCG.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> v3: inline call to g_assert_not_reached if !TCG
>> ---
>>  target/arm/Makefile.objs | 2 +-
>>  target/arm/cpu.h         | 7 +++++++
>>  target/arm/helper.c      | 4 +++-
>>  3 files changed, 11 insertions(+), 2 deletions(-)
> 
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 49a0f05cd1..1b4da7aa45 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -20,7 +20,6 @@
>>  #include "qemu/qemu-print.h"
>>  #include "exec/exec-all.h"
>>  #include "exec/cpu_ldst.h"
>> -#include "arm_ldst.h"
>>  #include <zlib.h> /* For crc32 */
>>  #include "hw/semihosting/semihost.h"
>>  #include "sysemu/cpus.h"
>> @@ -29,6 +28,9 @@
>>  #include "qapi/qapi-commands-target.h"
>>  #include "qapi/error.h"
>>  #include "qemu/guest-random.h"
>> +#ifdef CONFIG_TCG
>> +#include "arm_ldst.h"
>> +#endif
> 
> Should this ifdeffing of the arm_ldst.h include have gone in
> another patch? It doesn't seem related to the change described
> in the commit message.

Surely patch 22 "Move M profile routines to m_helper.c"

