Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171BF1B58CC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 12:08:17 +0200 (CEST)
Received: from localhost ([::1]:40288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRYmG-0005Po-0m
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 06:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56920)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRYkd-0004Cx-Gi
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 06:06:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRYkb-0008Vk-C5
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 06:06:35 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRYka-0008VO-Sy; Thu, 23 Apr 2020 06:06:33 -0400
Received: by mail-wr1-x441.google.com with SMTP id b11so6126451wrs.6;
 Thu, 23 Apr 2020 03:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e5RvPEwI+UM9ijZWcKSbX/0IbSZr0thQvP2hbsva6TA=;
 b=AuMdsl+VnfTe1jjNNi29XIm17OHg02WS/wqTVCHm1p+rwwZODtF7lplkjA5YoeIQpf
 ecam5lBJ56FDTaC7EMrltKLBqcYcDOMapc5oHK+shUOinowyYFLX3SB1nImmLgLc9n1F
 IGLAVpBCiKjPYfqwy2+PVucHmAjwyn8xwPYuQ7EgH8i9kCtsAhFwpHTKPU7gqc4N09S9
 tPMy2U0K0mJSmFKRSi8GwEMVFtS8vJAzY3xqC82BrB9i+S2+4VeoASPOTqiLx/h79R2E
 cMlunvNdVpWeTTuIDgHSE97jBGk4571XEMx9sVsvkRUSjTtL4h7h85AN3RmHYTXZAClK
 YaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=e5RvPEwI+UM9ijZWcKSbX/0IbSZr0thQvP2hbsva6TA=;
 b=QzLOrvUFSipajdyMrWzKD4kaVHgOit6Vs/UsensVJcJBbGYAfMg2EWr3ya5+VYGWYB
 S2NmeHjgIcLt3VY54iRnpcd2kgCwHs/5nnNHxswQX0RWkNXzwnwP1JuNH1M5CHdKOFwb
 576+ed6Xy6fgN3ns8aUjWU+OC1xRds7UwewHsf4qxoQ0hffFzxdZXhDthDQuQHUQHckU
 mlEXpizuaT7CNwgzeP89DQqzbt015LgK0J01oB2JRhdqnWGcMhxB6Ys0zeZfBC/jObX5
 R10EyN9Il2aLbCPkUGkdmKkuSy7wjpY6s0koLQDIDLaZtHkDJKTqzRV8j8KgtSaqDAfq
 FZtA==
X-Gm-Message-State: AGi0PuYxQWFNlhPPDm6EhCKGxYX0GtV1WNtUYPdNrkPGnDB/XnAljC7n
 R5fE4hdMU8+lPh6oiLfIoRZtna00
X-Google-Smtp-Source: APiQypLPmuzHqRdwFrp1m3HuXGaCgWSp1L7oPSDr1PIJa3R6Q65sf2zj0gUhAEQ0fgOhkDzlgdzL1g==
X-Received: by 2002:a5d:4b04:: with SMTP id v4mr4256862wrq.358.1587636390479; 
 Thu, 23 Apr 2020 03:06:30 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id l5sm2971405wrm.66.2020.04.23.03.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2020 03:06:29 -0700 (PDT)
Subject: Re: [PATCH QEMU v2 3/5] Add a GPIO backend using libgpiod
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20200423090118.11199-1-geert+renesas@glider.be>
 <20200423090118.11199-4-geert+renesas@glider.be>
 <5dbfd026-3807-b122-ce60-1339a5252fca@amsat.org>
 <CAMuHMdWf2RfGvSizXKonmAB84kPyAPwZ3mF1PayK_mdn=wwRkw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <4ae7812b-6df5-f024-871b-903966f73b8e@amsat.org>
Date: Thu, 23 Apr 2020 12:06:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWf2RfGvSizXKonmAB84kPyAPwZ3mF1PayK_mdn=wwRkw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::441
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alexander Graf <graf@amazon.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Bartosz Golaszewski <bartekgola@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/20 11:41 AM, Geert Uytterhoeven wrote:
> Hi Philippe,
> 
> Thanks for your comments!
> 
> On Thu, Apr 23, 2020 at 11:28 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> On 4/23/20 11:01 AM, Geert Uytterhoeven wrote:
>>> Add a GPIO controller backend, to connect virtual GPIOs on the guest to
>>> physical GPIOs on the host.  This allows the guest to control any
>>> external device connected to the physical GPIOs.
>>>
>>> Features and limitations:
>>>   - The backend uses libgpiod on Linux,
>>>   - For now only GPIO outputs are supported,
>>>   - The number of GPIO lines mapped is limited to the number of GPIO
>>>     lines available on the virtual GPIO controller.
>>>
>>> Future work:
>>>   - GPIO inputs,
>>>   - GPIO line configuration,
>>>   - Optimizations for controlling multiple GPIO lines at once,
>>>   - ...
>>>
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
>>> --- /dev/null
>>> +++ b/backends/gpiodev.c
>>> @@ -0,0 +1,94 @@
>>> +/*
>>> + * QEMU GPIO Backend
>>> + *
>>> + * Copyright (C) 2018-2020 Glider bv
>>> + *
>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>> + */
>>> +
>>> +#include <errno.h>
>>
>> <errno.h> probably not needed.
> 
> It is indeed included by one of the other header files.
> What is the QEMU policy w.r.t. that?

See CODING_STYLE.rst:

Include directives
------------------

Order include directives as follows:

.. code-block:: c

    #include "qemu/osdep.h"  /* Always first... */
    #include <...>           /* then system headers... */
    #include "..."           /* and finally QEMU headers. */

The "qemu/osdep.h" header contains preprocessor macros that affect the
behavior
of core system headers like <stdint.h>.  It must be the first include so
that
core system headers included by external libraries get the preprocessor
macros
that QEMU depends on.

> 
>>
>>> +#include <gpiod.h>
>>
>> Please move this one...
>>
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "qemu/config-file.h"
>>> +#include "qemu/cutils.h"
> 
> I forgot to remove the two above...
> 
>>> +#include "qemu/error-report.h"
>>> +#include "qemu/module.h"
>>> +#include "qemu/option.h"
> 
> ... and the two above.
> 
>>> +#include "qapi/error.h"
>>> +
>>> +#include "sysemu/gpiodev.h"
>>> +
>>> +#include "hw/irq.h"
>>> +#include "hw/qdev-core.h"
>>
>> ... here:
>>
>> #include <gpiod.h>
> 
> OK.
> 
>>> --- a/configure
>>> +++ b/configure
>>> @@ -509,6 +509,7 @@ libpmem=""
>>>  default_devices="yes"
>>>  plugins="no"
>>>  fuzzing="no"
>>> +gpio=""
>>
>> Maybe name this feature 'libgpiod'?
> 
> Makes sense.
> 
>>>
>>>  supported_cpu="no"
>>>  supported_os="no"
>>> @@ -1601,6 +1602,10 @@ for opt do
>>>    ;;
>>>    --gdb=*) gdb_bin="$optarg"
>>>    ;;
>>> +  --disable-gpio) gpio="no"
>>> +  ;;
>>> +  --enable-gpio) gpio="yes"
>>
>> Ditto: --enable-libgpiod, because else it seems rather confusing.
> 
> OK.
> 
>>> --- /dev/null
>>> +++ b/include/sysemu/gpiodev.h
>>> @@ -0,0 +1,12 @@
>>> +/*
>>> + * QEMU GPIO Backend
>>> + *
>>> + * Copyright (C) 2018-2020 Glider bv
>>> + *
>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>> + */
>>> +
>>> +#include "qemu/typedefs.h"
>>
>> "qemu/typedefs.h" not needed in includes.
> 
> While removing that works, it does mean the header file is no longer
> self-contained:
> 
> include/sysemu/gpiodev.h:10:23: error: unknown type name ‘DeviceState’

Odd, because your backends/gpiodev.c already has:

#include "hw/qdev-core.h"

> 
>>> +
>>> +void qemu_gpiodev_add(DeviceState *dev, const char *name, unsigned int maxgpio,
>>> +                      Error **errp);
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

