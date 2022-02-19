Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A344BC6A8
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 08:25:24 +0100 (CET)
Received: from localhost ([::1]:60094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLK7P-0006CI-Tk
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 02:25:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1nLJTp-0007Ea-20; Sat, 19 Feb 2022 01:44:29 -0500
Received: from [2a00:1450:4864:20::436] (port=36727
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1nLJTF-0007uf-JH; Sat, 19 Feb 2022 01:44:26 -0500
Received: by mail-wr1-x436.google.com with SMTP id o24so17996799wro.3;
 Fri, 18 Feb 2022 22:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jHeHzFBp5yf9CdErtL+PwRM+ks7Pqmd4djlEuBxgOtQ=;
 b=G+LmIaO8eYuFYlpK1VG66iYQhEKjJns/FoMUezWv86xnutduhEhNFsj6hLquXw5igj
 LGjU+jbcAo70+vivHFMVdRpmP7IdCpH/UJBjw7dmeyjtUrttGgStm1op3jh4Z2qRgU//
 adacFpiGTum1OMq/L3+04vQVVOdW81Wo2dIMcIE+o1fwRsSOq2Fe0jUlMChK1R9+xvPb
 pVLrKDhevkyb5oXqn99pPVUxe71EJPMjE+z3dFn7Gfdb3/r6mc94kpZD4OgxaguhhVqq
 Ol9M2s+KdPFd/k4RyC/Hqu/EqGzAgSMIPcJ7CCkaJDk9fvTyPOU/EaY+s5dEkCs+ShqK
 uzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jHeHzFBp5yf9CdErtL+PwRM+ks7Pqmd4djlEuBxgOtQ=;
 b=21nM50fwqu01LnMK0enaIMw6cfAOHwQiJwLrj2/hLAtHrKDL94HsCKnpRfboC1OZ7H
 Kh/ppBlZeyVFobY2lxoertikudDAYR4nJihLIdF6RHwy+k3TQUN3fUOP2CMcLQDQdKDM
 9zUXSR4i64n0nL2xGHqhS0iiOQULGc01TnHRxyZEYp+1t9sSw8apWgbaKmp2SypJZQHg
 53QUU3Wv9lBahX/euZNYokebufAutaBzS9lZjdBvsDmg3o0TQIwTzBM4Ev6babyY00Dh
 w+Y9qSSMXkmBMGhYs9h9ZzpJLV+ji5fxkqhvgP6WY+6ZVjesFGaQuicVcfPOTKEshyfV
 pfdA==
X-Gm-Message-State: AOAM532txoydflSdGkigHWXKfsreXovEsOgU3SoyFP+vBuoXpcYrmcZH
 klx8vEScooAu8RbL6QQfIIw=
X-Google-Smtp-Source: ABdhPJxHbzmBqImdQ5aGStChZh03cm83o7y0HPMl0EH6fGLDb4k3XyQ2IerBd67MXRRroUGmsrhJGQ==
X-Received: by 2002:a5d:668e:0:b0:1e3:312f:3848 with SMTP id
 l14-20020a5d668e000000b001e3312f3848mr8198586wru.288.1645253029487; 
 Fri, 18 Feb 2022 22:43:49 -0800 (PST)
Received: from ?IPV6:2a10:800a:bb8:1:6510:42ac:bb55:9590?
 ([2a10:800a:bb8:1:6510:42ac:bb55:9590])
 by smtp.gmail.com with ESMTPSA id
 j26-20020a05600c1c1a00b0037bf81c237dsm1398181wms.32.2022.02.18.22.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 22:43:48 -0800 (PST)
Message-ID: <0174d08d-3020-75bb-73c1-7dc47956add6@gmail.com>
Date: Sat, 19 Feb 2022 08:43:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 1/2] hw/ide: split bmdma read and write functions from
 piix.c
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20220218204155.236611-1-liavalb@gmail.com>
 <20220218204155.236611-2-liavalb@gmail.com>
 <ffba4b98-5b6-c39a-3cb-73cb2e1cbf15@eik.bme.hu>
From: Liav Albani <liavalb@gmail.com>
In-Reply-To: <ffba4b98-5b6-c39a-3cb-73cb2e1cbf15@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/19/22 02:12, BALATON Zoltan wrote:
> On Fri, 18 Feb 2022, Liav Albani wrote:
>> This is a preparation before implementing another PCI IDE controller
>> that relies on these functions, so these can be shared between both
>> implementations.
>>
>> Signed-off-by: Liav Albani <liavalb@gmail.com>
>> ---
>> hw/ide/bmdma.c         | 84 ++++++++++++++++++++++++++++++++++++++++++
>> hw/ide/meson.build     |  2 +-
>> hw/ide/piix.c          | 51 ++-----------------------
>> include/hw/ide/bmdma.h | 34 +++++++++++++++++
>> 4 files changed, 122 insertions(+), 49 deletions(-)
>> create mode 100644 hw/ide/bmdma.c
>> create mode 100644 include/hw/ide/bmdma.h
>>
>> diff --git a/hw/ide/bmdma.c b/hw/ide/bmdma.c
>> new file mode 100644
>> index 0000000000..d12ed730dd
>> --- /dev/null
>> +++ b/hw/ide/bmdma.c
>> @@ -0,0 +1,84 @@
>> +/*
>> + * QEMU IDE Emulation: Intel PCI Bus master IDE support for PIIX3/4 
>> and ICH6/7.
>> + *
>> + * Copyright (c) 2003 Fabrice Bellard
>> + * Copyright (c) 2006 Openedhand Ltd.
>> + *
>> + * Permission is hereby granted, free of charge, to any person 
>> obtaining a copy
>> + * of this software and associated documentation files (the 
>> "Software"), to deal
>> + * in the Software without restriction, including without limitation 
>> the rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, 
>> and/or sell
>> + * copies of the Software, and to permit persons to whom the 
>> Software is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be 
>> included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT 
>> SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES 
>> OR OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
>> ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
>> DEALINGS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/pci/pci.h"
>> +#include "migration/vmstate.h"
>> +#include "qapi/error.h"
>> +#include "qemu/module.h"
>> +#include "sysemu/block-backend.h"
>> +#include "sysemu/blockdev.h"
>> +#include "sysemu/dma.h"
>> +
>> +#include "hw/ide/bmdma.h"
>> +#include "hw/ide/pci.h"
>> +#include "trace.h"
>
> Are you sure you need all these includes? I haven't checked but I 
> think there may be some unneeded ones here. On the other hand I'm not 
> sure putting these in a new file is worth it. There are already some 
> bmdma_* functions in hw/ide/pci.c which are declared in 
> include/hw/ide/pci.h so you could just move these there too then no 
> new file, new header nor changes to meson.build is needed in this patch..
>
Good question, probably not. I'll try to build without them, adding only 
what seems necessary to complete the build. Also, I think adding those 
functions to hw/ide/pci.c is a very good idea as it will make the patch 
smaller and it also makes total sense to me - Bus Master capabilities 
only appear on PCI IDE controllers and not on the ISA IDE controller 
(AFAIK).

It will happen in v3 :)

>> +
>> +uint64_t intel_ide_bmdma_read(void *opaque, hwaddr addr, unsigned size)
>
> As I said before these aren't intel specific as the same functions 
> also appear in other ide controllers such as via.c so maybe a better 
> name would be bmdma_default_read and bmdma_default_write or somehting 
> similar so these can be also reused by other non-intel devices too.
>
Right, I see now that via.c uses the exact same functions... I'll change 
it in v3. The names bmdma_default_read and bmdma_default_write seem like 
a good choice to me.
> Regards,
> BALATON Zoltan
Thanks for the review!

