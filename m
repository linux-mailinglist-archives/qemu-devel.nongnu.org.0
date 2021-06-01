Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC59D3972FA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 14:06:46 +0200 (CEST)
Received: from localhost ([::1]:48258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo3AT-00027P-Rp
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 08:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lo36v-000782-5I
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 08:03:05 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lo36r-0005rA-Tt
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 08:03:04 -0400
Received: by mail-pl1-x62f.google.com with SMTP id e7so4665099plj.7
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 05:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=r1AwAf21oqXE5Z+aIfGYelnZle1mTzVlyi8sG4k7+qk=;
 b=18kh65X+MiHnZ0w8AAGss/XQiWZTQCmnQ03ttoG3YV7vYd2GlwP3m3Sp9H64K6HWXL
 nCauE7L78OISHC3y1VDlpTNWVwKVTE0OEHC53nxwR6t0bdxdipvwg944SKPbzSYdy+f/
 rIshVbflmGl9jzb6VudGo2ZV0d9FGwT8pDHlNn4CX4JktIOiyo5uBrfS5alvOEJpadYx
 8fwf82EcxcQ8MHInzoqRbO+D3TlahYELSzBrekNYnAIKwhq//HzgieBdUtBhNPwbi9Xx
 JE2Gq5L8g9zxbIrz5biZXyXWoqrgPn2589cqrzD2ZODErvXLh8cs4U71Xc6vnyMCdo1v
 WZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r1AwAf21oqXE5Z+aIfGYelnZle1mTzVlyi8sG4k7+qk=;
 b=g0T9IxuORpE4q6Rfm4vjDXtiQKSpTRJM79HVYQSwSnVGPqLz6PSCiLmzH8MUzLaKAy
 L6lMX08tU1HXR0+TUHn6B2od8ebr0Eb1EFTJaKp6CmTogvCO3f37D6uoLET/YandGh9t
 XOSri1qzC5mUdmxmHpTgUwSFQlwFoBRnOqOGk/w80KIr6GFWTlFGOms3hMhdDjUsslmF
 45oVdAT5NrW7j1fPwnxytl0wWYm9YPYz+/H+xd2qv9ddxllTPy/XMBeIbAf+CqweXVv9
 rIYQZW3lTNCDH4yci4FkSIbO7LMS3VpCPlGQ172ZRkBT+lSGkpRSh6TFSCJTHfknN4mq
 d3Lw==
X-Gm-Message-State: AOAM531z44su+F20agFr3nGGOtgqwvjqS2hqoUu64Urh+UDNgUjRejw/
 PmUWYzcKhO3H2NzTzAGeVeqwqISjHMLwVPg8
X-Google-Smtp-Source: ABdhPJxI922fSx/TDVpvGA3NaF4pvk9u5QxpyxlSuVwbQXE4XQ/fFul01a5eConHwPeqowljuzYq6A==
X-Received: by 2002:a17:90a:bf91:: with SMTP id
 d17mr4652111pjs.17.1622548974012; 
 Tue, 01 Jun 2021 05:02:54 -0700 (PDT)
Received: from localhost
 (ppp121-45-202-22.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.202.22])
 by smtp.gmail.com with UTF8SMTPSA id g6sm4173735pfq.110.2021.06.01.05.02.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 05:02:53 -0700 (PDT)
Message-ID: <d86c8379-871f-53d4-03b3-55055fc0b56a@ozlabs.ru>
Date: Tue, 1 Jun 2021 22:02:48 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210520090557.435689-1-aik@ozlabs.ru>
 <c13d557a-5feb-33ad-33ec-22a28cddb8d@eik.bme.hu>
 <7e71f593-c2b9-5c7-4dd0-2a189bee771@eik.bme.hu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <7e71f593-c2b9-5c7-4dd0-2a189bee771@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=aik@ozlabs.ru; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.029,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, NICE_REPLY_A=-0.613,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 31/05/2021 23:07, BALATON Zoltan wrote:
> On Sun, 30 May 2021, BALATON Zoltan wrote:
>> On Thu, 20 May 2021, Alexey Kardashevskiy wrote:
>>> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
>>> new file mode 100644
>>> index 000000000000..a283b7d251a7
>>> --- /dev/null
>>> +++ b/hw/ppc/vof.c
>>> @@ -0,0 +1,1021 @@
>>> +/*
>>> + * QEMU PowerPC Virtual Open Firmware.
>>> + *
>>> + * This implements client interface from OpenFirmware IEEE1275 on 
>>> the QEMU
>>> + * side to leave only a very basic firmware in the VM.
>>> + *
>>> + * Copyright (c) 2021 IBM Corporation.
>>> + *
>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "qemu-common.h"
>>> +#include "qemu/timer.h"
>>> +#include "qemu/range.h"
>>> +#include "qemu/units.h"
>>> +#include "qapi/error.h"
>>> +#include <sys/ioctl.h>
>>> +#include "exec/ram_addr.h"
>>> +#include "exec/address-spaces.h"
>>> +#include "hw/ppc/vof.h"
>>> +#include "hw/ppc/fdt.h"
>>> +#include "sysemu/runstate.h"
>>> +#include "qom/qom-qobject.h"
>>> +#include "trace.h"
>>> +
>>> +#include <libfdt.h>
>>> +
>>> +/*
>>> + * OF 1275 "nextprop" description suggests is it 32 bytes max but
>>> + * LoPAPR defines "ibm,query-interrupt-source-number" which is 33 
>>> chars long.
>>> + */
>>> +#define OF_PROPNAME_LEN_MAX 64
>>> +
>>> +#define VOF_MAX_PATH        256
>>> +#define VOF_MAX_SETPROPLEN  2048
>>> +#define VOF_MAX_METHODLEN   256
>>> +#define VOF_MAX_FORTHCODE   256
>>> +#define VOF_VTY_BUF_SIZE    256
>>> +
>>> +typedef struct {
>>> +    uint64_t start;
>>> +    uint64_t size;
>>> +} OfClaimed;
>>> +
>>> +typedef struct {
>>> +    char *path; /* the path used to open the instance */
>>> +    uint32_t phandle;
>>> +} OfInstance;
>>> +
>>> +#define VOF_MEM_READ(pa, buf, size) \
>>> +    address_space_read_full(&address_space_memory, \
>>> +    (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))
>>> +#define VOF_MEM_WRITE(pa, buf, size) \
>>> +    address_space_write(&address_space_memory, \
>>> +    (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))
>>> +
>>> +static int readstr(hwaddr pa, char *buf, int size)
>>> +{
>>> +    if (VOF_MEM_READ(pa, buf, size) != MEMTX_OK) {
>>> +        return -1;
>>> +    }
>>> +    if (strnlen(buf, size) == size) {
>>> +        buf[size - 1] = '\0';
>>> +        trace_vof_error_str_truncated(buf, size);
>>> +        return -1;
>>> +    }
>>> +    return 0;
>>> +}
>>> +
>>> +static bool cmpservice(const char *s, unsigned nargs, unsigned nret,
>>> +                       const char *s1, unsigned nargscheck, unsigned 
>>> nretcheck)
>>> +{
>>> +    if (strcmp(s, s1)) {
>>> +        return false;
>>> +    }
>>> +    if ((nargscheck && (nargs != nargscheck)) ||
>>> +        (nretcheck && (nret != nretcheck))) {
>>> +        trace_vof_error_param(s, nargscheck, nretcheck, nargs, nret);
>>> +        return false;
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>> +
>>> +static void prop_format(char *tval, int tlen, const void *prop, int 
>>> len)
>>> +{
>>> +    int i;
>>> +    const unsigned char *c;
>>> +    char *t;
>>> +    const char bin[] = "...";
>>> +
>>> +    for (i = 0, c = prop; i < len; ++i, ++c) {
>>> +        if (*c == '\0' && i == len - 1) {
>>> +            strncpy(tval, prop, tlen - 1);
>>> +            return;
>>> +        }
>>> +        if (*c < 0x20 || *c >= 0x80) {
>>> +            break;
>>> +        }
>>> +    }
>>> +
>>> +    for (i = 0, c = prop, t = tval; i < len; ++i, ++c) {
>>> +        if (t >= tval + tlen - sizeof(bin) - 1 - 2 - 1) {
>>> +            strcpy(t, bin);
>>> +            return;
>>> +        }
>>> +        if (i && i % 4 == 0 && i != len - 1) {
>>> +            strcat(t, " ");
>>> +            ++t;
>>> +        }
>>> +        t += sprintf(t, "%02X", *c & 0xFF);
>>> +    }
>>> +}
>>> +
>>> +static int get_path(const void *fdt, int offset, char *buf, int len)
>>> +{
>>> +    int ret;
>>> +
>>> +    ret = fdt_get_path(fdt, offset, buf, len - 1);
>>> +    if (ret < 0) {
>>> +        return ret;
>>> +    }
>>> +
>>> +    buf[len - 1] = '\0';
>>> +
>>> +    return strlen(buf) + 1;
>>> +}
>>> +
>>> +static int phandle_to_path(const void *fdt, uint32_t ph, char *buf, 
>>> int len)
>>> +{
>>> +    int ret;
>>> +
>>> +    ret = fdt_node_offset_by_phandle(fdt, ph);
>>> +    if (ret < 0) {
>>> +        return ret;
>>> +    }
>>> +
>>> +    return get_path(fdt, ret, buf, len);
>>> +}
>>> +
>>> +static uint32_t vof_finddevice(const void *fdt, uint32_t nodeaddr)
>>> +{
>>> +    char fullnode[VOF_MAX_PATH];
>>> +    uint32_t ret = -1;
>>> +    int offset;
>>> +
>>> +    if (readstr(nodeaddr, fullnode, sizeof(fullnode))) {
>>> +        return (uint32_t) ret;
>>> +    }
>>> +
>>> +    offset = fdt_path_offset(fdt, fullnode);
>>> +    if (offset >= 0) {
>>> +        ret = fdt_get_phandle(fdt, offset);
>>> +    }
>>> +    trace_vof_finddevice(fullnode, ret);
>>> +    return (uint32_t) ret;
>>> +}
>>
>> The Linux init function that runs on pegasos2 here:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/powerpc/kernel/prom_init.c?h=v4.14.234#n2658 
>>
>>
>> calls finddevice once with isa@c and next with isa@C (small and 
>> capital C) both of which works with the board firmware but with vof 
>> the comparison is case sensitive and one of these fails so I can't 
>> make it work. I don't know if this is a problem in libfdt or the 
>> vof_finddevice above should do something else to get case insensitive 
>> comparison.
> 
> This fixes the issue with Linux but I'm not sure if there's any better 
> solution or would it break anything else.

The bit after "@" is an address and needs to be case insensitive and 
I'll fix this indeed. I'm not so sure about the part before "@", I 
cannot imagine what could break if I made search insensitive to case. Hm :-/

> 
> Regards,
> BALATON Zoltan
> 
>> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
> index a283b7d251..b47bbd509d 100644
> --- a/hw/ppc/vof.c
> +++ b/hw/ppc/vof.c
> @@ -144,12 +144,15 @@ static uint32_t vof_finddevice(const void *fdt, 
> uint32_t nodeaddr)
>      char fullnode[VOF_MAX_PATH];
>      uint32_t ret = -1;
>      int offset;
> +    gchar *p;
> 
>      if (readstr(nodeaddr, fullnode, sizeof(fullnode))) {
>          return (uint32_t) ret;
>      }
> 
> -    offset = fdt_path_offset(fdt, fullnode);
> +    p = g_ascii_strdown(fullnode, -1);
> +    offset = fdt_path_offset(fdt, p);
> +    g_free(p);
>      if (offset >= 0) {
>          ret = fdt_get_phandle(fdt, offset);
>      }

-- 
Alexey

