Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC89437621
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 13:41:18 +0200 (CEST)
Received: from localhost ([::1]:56054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdsvF-0003Xq-7G
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 07:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mdsr4-0001Nb-HI; Fri, 22 Oct 2021 07:36:58 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:35521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mdsr0-0007DH-2l; Fri, 22 Oct 2021 07:36:58 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M5wc7-1mbQwp3R7L-007QMA; Fri, 22 Oct 2021 13:36:37 +0200
Message-ID: <4cc0d115-d022-980c-e67e-3eda149e3fdc@vivier.eu>
Date: Fri, 22 Oct 2021 13:36:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: fr
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, qemu-devel@nongnu.org
References: <20211022111007.43478-1-yaroshchuk2000@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v3] isa-applesmc: provide OSK forwarding on Apple hosts
In-Reply-To: <20211022111007.43478-1-yaroshchuk2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bOfji7c2TcSuDS5E/hPwXuNKmP1u3zIYupkaWOU+iK9cS2JLYGR
 ejc5On09otENiSYtcPQ60ss90krgPY5ofKuhzzbcT4O4yrmS4UEdP5cAbC2dZlU8HjWxoO6
 AInL6aRgSFEanv+RNgW9YEqyaKH3EXkl1P62h8jHdBPL/twD4CVjOefUsFEMz9nbS4NtZ7o
 wgcJhPXxEaBlPWzkB4Ekg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4AS9itSk1ZI=:KY2uLoAIj5SRAV3XAzg2Zi
 LUJ/oNCld7GtMOvDHwnPCEbzRnpEO6FpCdBkRCbYOYzEjdErMjhS1ooxEwHp8kavwFpxDTQal
 HgWkaR1r6ECd60lnKDRoIU6i00wgdIClbP0QmKEC5Jy9skQNFUpac+D1m0GqZW0ovXn9ySsT0
 dcfHK8leWefBRbQo36YEtnhN6AFkCAG9eBIhEnnnOSihZLSxKczhlNe41VAHiQXpVc9WoaxGz
 U4u/51XKoPictKSvKLjk0a+zCT2NxURurqiKR+f9VzOb2Cdsw8Vy/7EbqcNaw0I2Z4bQvYsMA
 EXtB/mFzG1CPHedc20Ea/+0MOHpqY379J9pQp3W1GvCWN5IK1QftMqFMbgPRZrhFAhoVIAiSj
 V8x5EFsc4EqWGW9GiBp6Tox8G+lcbX0iiMSX6SoLbTEo2tCcVXMTFQrSAtJtOsPu+XK0/rGSQ
 H4tnKj8n7tkI0c/he2Lgjv34kcaMJXKrojejFdTjNip1qrcRztZKGJuX8XsIauQQiJ+OwxC65
 EWhzgdT8DjSSt2eeSwthAfyHaBcGgRuSuXB8yhure/3tKqbLcRj1AGz+nzOfzf/kpfm39rdPY
 lNvO3UZz6nrzCvr4gZ0Wnc0Ok5HbiZiI21RxSmYCOQXFqTMQIASl4I07lugLQmxDvbR6mmiJt
 lwP6C5+T+rOXoQYDKzbOYVR2dm1TVCeT9zXJW5KqLlIFu2Z0WPe/xPHNBNu1F6+xEK5I=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.742,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, suse@csgraf.de, r.bolshakov@yadro.com,
 agraf@suse.de, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 22/10/2021 à 13:10, Vladislav Yaroshchuk a écrit :
> On Apple hosts we can read AppleSMC OSK key directly from host's
> SMC and forward this value to QEMU Guest.
> 
> Usage:
> `-device isa-applesmc,hostosk=on`
> 
> Apple licence allows use and run up to two additional copies
> or instances of macOS operating within virtual operating system
> environments on each Apple-branded computer that is already running
> the Apple Software, for purposes of:
> - software development
> - testing during software development
> - using macOS Server
> - personal, non-commercial use
> 
> Guest macOS requires AppleSMC with correct OSK. The most legal
> way to pass it to the Guest is to forward the key from host SMC
> without any value exposion.
> 
> Based on https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdrmmyth/
> 
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> ---
>   hw/misc/applesmc.c | 147 ++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 146 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
> index 1b9acaf1d3..bcc021f7b7 100644
> --- a/hw/misc/applesmc.c
> +++ b/hw/misc/applesmc.c
> @@ -38,6 +38,10 @@
>   #include "qemu/timer.h"
>   #include "qom/object.h"
>   
> +#if defined(__APPLE__)
> +#include <IOKit/IOKitLib.h>
> +#endif
> +
>   /* #define DEBUG_SMC */
>   
>   #define APPLESMC_DEFAULT_IOBASE        0x300
> @@ -108,6 +112,7 @@ struct AppleSMCState {
>       uint8_t data_len;
>       uint8_t data_pos;
>       uint8_t data[255];
> +    char *hostosk_flag;

Use a boolean (see below)

>       char *osk;
>       QLIST_HEAD(, AppleSMCData) data_def;
>   };
> @@ -312,9 +317,136 @@ static const MemoryRegionOps applesmc_err_io_ops = {
>       },
>   };
>   
> +#if defined(__APPLE__)
> +/*
> + * Based on
> + * https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdrmmyth/
> + */
> +enum {
> +    SMC_CLIENT_OPEN      = 0,
> +    SMC_CLIENT_CLOSE     = 1,
> +    SMC_HANDLE_EVENT     = 2,
> +    SMC_READ_KEY         = 5
> +};
> +
> +struct AppleSMCParam {
> +    uint32_t    key;
> +    uint8_t     pad0[22];
> +    IOByteCount data_size;
> +    uint8_t     pad1[10];
> +    uint8_t     command;
> +    uint32_t    pad2;
> +    uint8_t     bytes[32];
> +};
> +
> +static int applesmc_read_host_osk(char **host_osk)

I think you should return the error message using an "Error **errp".

> +{
> +    assert(host_osk != NULL);
> +
> +    io_service_t            hostsmc_service = IO_OBJECT_NULL;
> +    io_connect_t            hostsmc_connect = IO_OBJECT_NULL;
> +    size_t                  out_size = sizeof(struct AppleSMCParam);
> +    IOReturn                status = kIOReturnError;
> +    struct AppleSMCParam    in = {0};
> +    struct AppleSMCParam    out = {0};
> +
> +    /* OSK key size + '\0' */
> +    *host_osk = g_malloc0(65);
> +    (*host_osk)[64] = '\0';
> +
> +    hostsmc_service = IOServiceGetMatchingService(kIOMasterPortDefault,
> +                                          IOServiceMatching("AppleSMC"));
> +    if (hostsmc_service == IO_OBJECT_NULL) {
> +        warn_report("host AppleSMC device is unreachable");
> +        goto error_osk_buffer_free;
> +    }
> +
> +    status = IOServiceOpen(hostsmc_service,
> +                           mach_task_self(),
> +                           1,
> +                           &hostsmc_connect);
> +    if (status != kIOReturnSuccess || hostsmc_connect == IO_OBJECT_NULL) {
> +        warn_report("host AppleSMC device is unreachable");
> +        goto error_osk_buffer_free;
> +    }
> +
> +    status = IOConnectCallMethod(
> +        hostsmc_connect,
> +        SMC_CLIENT_OPEN,
> +        NULL, 0, NULL, 0, NULL, NULL, NULL, NULL
> +    );
> +    if (status != kIOReturnSuccess) {
> +        warn_report("host AppleSMC device is unreachable");
> +        goto error_ioservice_close;
> +    }
> +
> +    in.key = ('OSK0');
> +    in.data_size = sizeof(out.bytes);
> +    in.command = SMC_READ_KEY;
> +    status = IOConnectCallStructMethod(
> +        hostsmc_connect,
> +        SMC_HANDLE_EVENT,
> +        &in,
> +        sizeof(struct AppleSMCParam),
> +        &out,
> +        &out_size
> +    );
> +
> +    if (status != kIOReturnSuccess) {
> +        warn_report("unable to read OSK0 from host AppleSMC device");
> +        goto error_ioconnect_close;
> +    }
> +    strncpy(*host_osk, (const char *) out.bytes, 32);
> +
> +    in.key = ('OSK1');
> +    in.data_size = sizeof(out.bytes);
> +    in.command = SMC_READ_KEY;
> +    status = IOConnectCallStructMethod(
> +        hostsmc_connect,
> +        SMC_HANDLE_EVENT,
> +        &in,
> +        sizeof(struct AppleSMCParam),
> +        &out,
> +        &out_size
> +    );
> +    if (status != kIOReturnSuccess) {
> +        warn_report("unable to read OSK1 from host AppleSMC device");
> +        goto error_ioconnect_close;
> +    }
> +    strncpy((*host_osk) + 32, (const char *) out.bytes, 32);
> +
> +    IOConnectCallMethod(
> +        hostsmc_connect,
> +        SMC_CLIENT_CLOSE,
> +        NULL, 0, NULL, 0, NULL, NULL, NULL, NULL);
> +    IOServiceClose(hostsmc_connect);
> +    return 0;
> +
> +error_ioconnect_close:
> +    IOConnectCallMethod(
> +        hostsmc_connect,
> +        SMC_CLIENT_CLOSE,
> +        NULL, 0, NULL, 0, NULL, NULL, NULL, NULL);
> +error_ioservice_close:
> +    IOServiceClose(hostsmc_connect);
> +
> +error_osk_buffer_free:
> +    g_free(*host_osk);
> +    return -1;
> +}
> +#else
> +static int applesmc_read_host_osk(char **output_key)
> +{
> +    warn_report("isa-applesmc.hostosk ignored: "
> +                "unsupported on non-Apple hosts");

I think a failure would be better than a warning.
Moreover will it work if the user doenst provide the OSK?

> +    return -1;
> +}
> +#endif
> +
>   static void applesmc_isa_realize(DeviceState *dev, Error **errp)
>   {
> -    AppleSMCState *s = APPLE_SMC(dev);
> +    AppleSMCState   *s = APPLE_SMC(dev);
> +    char            *host_osk;
>   
>       memory_region_init_io(&s->io_data, OBJECT(s), &applesmc_data_io_ops, s,
>                             "applesmc-data", 1);
> @@ -331,6 +463,18 @@ static void applesmc_isa_realize(DeviceState *dev, Error **errp)
>       isa_register_ioport(&s->parent_obj, &s->io_err,
>                           s->iobase + APPLESMC_ERR_PORT);
>   
> +    /* Key retrieved from host SMC overwrites provided OSK string */
> +    if (s->hostosk_flag
> +        && !strcmp("on", s->hostosk_flag)

Use a bool property for hostosk (see below), that will allow "on", "yes", "true", ... and here 
you'll only have to test for the boolean value.

> +        && !applesmc_read_host_osk(&host_osk)) {
> +        if (s->osk) {
> +            warn_report("provided isa-applesmc.osk "
> +                        "is overwritten with host OSK");
> +            g_free(s->osk);
> +        }
> +        s->osk = host_osk;
> +    }
> +
>       if (!s->osk || (strlen(s->osk) != 64)) {
>           warn_report("Using AppleSMC with invalid key");
>           s->osk = default_osk;
> @@ -344,6 +488,7 @@ static Property applesmc_isa_properties[] = {
>       DEFINE_PROP_UINT32(APPLESMC_PROP_IO_BASE, AppleSMCState, iobase,
>                          APPLESMC_DEFAULT_IOBASE),
>       DEFINE_PROP_STRING("osk", AppleSMCState, osk),
> +    DEFINE_PROP_STRING("hostosk", AppleSMCState, hostosk_flag),

An DEFINE_PROP_BOOL() would be more appropriate for this.

>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> 

Thanks,
Laurent


