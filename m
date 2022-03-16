Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FBC4DA9E5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 06:34:26 +0100 (CET)
Received: from localhost ([::1]:42768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUMIi-0005Z1-T0
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 01:34:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nUMHr-0004uD-MB
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:33:31 -0400
Received: from [2607:f8b0:4864:20::429] (port=41580
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nUMHp-0002z5-Pb
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:33:31 -0400
Received: by mail-pf1-x429.google.com with SMTP id p8so2446996pfh.8
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 22:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vPE5hi5Fnb1TBTFYDCOg4YTynAMdSg5WYzz1E5fr4nI=;
 b=Hq2gDDYlhcjeS4tJVe7UFr+h06ExfdePh/OVeDxISZs5/nxhOTuLZtaWFIDvCpUNN0
 caeLTXIB7am03xFNVgNkMyuWHlh7YxffcX44JIpDkdiJK2LQyId1NMn2mJjPj6M0V/7X
 G12st4WXDf4mALkCwLS1uaZzJLiWwX+DdmOyyVSYE2HM49k5Mor9zeEtzfXBSbrJY+5H
 b5cudQfAW6Czh7Wi4JvVJxHFraurOtoBudtyNp9CJ0W68RemAulUQaTaqBAHhE4xytnr
 2MpAyWdFNZUq/ceBxSTavuWvtuEiOhE+j3qUdajCFN1JrcZ2eOVgpQLj0yMLLzh5G6Zs
 MQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vPE5hi5Fnb1TBTFYDCOg4YTynAMdSg5WYzz1E5fr4nI=;
 b=sRojy6GIML67UB6Njm8ChbuomRBQc1HfV0bGuRssEzTFH5zSd5WxYFr/W1L+bLxbH+
 ta+uF5u2bKK/VU6jtUpb6ZDkxVxrehYdXPiP9/CyCa8luRWzJh1ESJOTiXT0U6XLvB25
 CSmou89mgI344Wu3XLWl/Y1f2oyzWLxJbPuNI8t+pct5sKSEc4ZYjCRgkULOlQJtcT3F
 hSQ1yJlPRlxPIBUihf+Qh8mqPcsNQBHch+ocwms9n3vnYKefxG+bSwSGEtni88JCY55e
 Agc0Sttnb6+pSdHJ2sSnTHx6PgOEVxCrvwGe7wzt4Q+XFKeJhPNDXPDlsk+8o7uPwTK2
 GBgQ==
X-Gm-Message-State: AOAM532ouTLEkb0QWc1JnnMOUBWMMMiMQtwHiW2P7Ez4+NYbimW0MeG6
 wreIhNDZAFywhVXqMkHq3uI=
X-Google-Smtp-Source: ABdhPJy7acc4JODodFpEz5EEMfREPEYaDaoib1rHNDRdUKg7P4pq95BUlqY3yiTeBdf20sWgjGb9sg==
X-Received: by 2002:a63:392:0:b0:381:8483:73b2 with SMTP id
 140-20020a630392000000b00381848373b2mr1781868pgd.67.1647408808210; 
 Tue, 15 Mar 2022 22:33:28 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a056a00141400b004f65cedfb09sm1103746pfu.48.2022.03.15.22.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 22:33:27 -0700 (PDT)
Message-ID: <b885cf89-d292-62eb-62f4-3dbbbb2dba7f@gmail.com>
Date: Wed, 16 Mar 2022 14:33:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v20 5/7] net/vmnet: implement bridged mode (vmnet-bridged)
Content-Language: en-US
To: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>,
 qemu-devel@nongnu.org
References: <20220315230741.21578-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220315230741.21578-6-Vladislav.Yaroshchuk@jetbrains.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220315230741.21578-6-Vladislav.Yaroshchuk@jetbrains.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x429.google.com
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, jasowang@redhat.com,
 phillip.ennen@gmail.com, armbru@redhat.com, dirty@apple.com, f4bug@amsat.org,
 r.bolshakov@yadro.com, agraf@csgraf.de, phillip@axleos.com, roman@roolebo.dev,
 hsp.cat7@gmail.com, hello@adns.io, qemu_oss@crudebyte.com, eblake@redhat.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/03/16 8:07, Vladislav Yaroshchuk wrote:
> Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
> ---
>   net/vmnet-bridged.m | 128 ++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 123 insertions(+), 5 deletions(-)
> 
> diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m
> index 91c1a2f2c7..5936c87718 100644
> --- a/net/vmnet-bridged.m
> +++ b/net/vmnet-bridged.m
> @@ -10,16 +10,134 @@
>   
>   #include "qemu/osdep.h"
>   #include "qapi/qapi-types-net.h"
> -#include "vmnet_int.h"
> -#include "clients.h"
> -#include "qemu/error-report.h"
>   #include "qapi/error.h"
> +#include "clients.h"
> +#include "vmnet_int.h"
>   
>   #include <vmnet/vmnet.h>
>   
> +
> +static bool validate_ifname(const char *ifname)
> +{
> +    xpc_object_t shared_if_list = vmnet_copy_shared_interface_list();
> +    bool match = false;
> +    if (!xpc_array_get_count(shared_if_list)) {
> +        goto done;
> +    }
> +
> +    match = !xpc_array_apply(
> +        shared_if_list,
> +        ^bool(size_t index, xpc_object_t value) {
> +            return strcmp(xpc_string_get_string_ptr(value), ifname) != 0;
> +        });
> +
> +done:
> +    xpc_release(shared_if_list);
> +    return match;
> +}
> +
> +
> +static bool get_valid_ifnames(char *output_buf)
> +{
> +    xpc_object_t shared_if_list = vmnet_copy_shared_interface_list();
> +    __block const char *ifname = NULL;
> +    __block int str_offset = 0;
> +    bool interfaces_available = true;
> +
> +    if (!xpc_array_get_count(shared_if_list)) {
> +        interfaces_available = false;
> +        goto done;
> +    }
> +
> +    xpc_array_apply(
> +        shared_if_list,
> +        ^bool(size_t index, xpc_object_t value) {
> +            /* build list of strings like "en0 en1 en2 " */
> +            ifname = xpc_string_get_string_ptr(value);
> +            strcpy(output_buf + str_offset, ifname);
> +            strcpy(output_buf + str_offset + strlen(ifname), " ");
> +            str_offset += strlen(ifname) + 1;
> +            return true;
> +        });
> +
> +done:
> +    xpc_release(shared_if_list);
> +    return interfaces_available;
> +}
> +
> +
> +static bool validate_options(const Netdev *netdev, Error **errp)
> +{
> +    const NetdevVmnetBridgedOptions *options = &(netdev->u.vmnet_bridged);
> +    char ifnames[1024];

There is no guarantee it fits in 1024 bytes. It was 256 bytes in an old 
version, but growing into some arbitrary size is not an appropriate fix. 
It should be dynamically allocated as it was done in an older version.

I'm sorry for missing things repeatedly. This should be *really* the 
last comment so please have a look at this.

P.S. I'm testing the current version and it is pleasantly working well. 
(I'm actually writing this email on QEMU with this series.)

Regards,
Akihiko Odaki

> +
> +    if (!validate_ifname(options->ifname)) {
> +        if (get_valid_ifnames(ifnames)) {
> +            error_setg(errp,
> +                       "unsupported ifname '%s', expected one of [ %s]",
> +                       options->ifname,
> +                       ifnames);
> +            return false;
> +        }
> +        error_setg(errp,
> +                   "unsupported ifname '%s', no supported "
> +                   "interfaces available",
> +                   options->ifname);
> +        return false;
> +    }
> +
> +#if !defined(MAC_OS_VERSION_11_0) || \
> +    MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_11_0
> +    if (options->has_isolated) {
> +        error_setg(errp,
> +                   "vmnet-bridged.isolated feature is "
> +                   "unavailable: outdated vmnet.framework API");
> +        return false;
> +    }
> +#endif
> +    return true;
> +}
> +
> +
> +static xpc_object_t build_if_desc(const Netdev *netdev)
> +{
> +    const NetdevVmnetBridgedOptions *options = &(netdev->u.vmnet_bridged);
> +    xpc_object_t if_desc = xpc_dictionary_create(NULL, NULL, 0);
> +
> +    xpc_dictionary_set_uint64(if_desc,
> +                              vmnet_operation_mode_key,
> +                              VMNET_BRIDGED_MODE
> +    );
> +
> +    xpc_dictionary_set_string(if_desc,
> +                              vmnet_shared_interface_name_key,
> +                              options->ifname);
> +
> +#if defined(MAC_OS_VERSION_11_0) && \
> +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
> +    xpc_dictionary_set_bool(if_desc,
> +                            vmnet_enable_isolation_key,
> +                            options->isolated);
> +#endif
> +    return if_desc;
> +}
> +
> +
> +static NetClientInfo net_vmnet_bridged_info = {
> +    .type = NET_CLIENT_DRIVER_VMNET_BRIDGED,
> +    .size = sizeof(VmnetState),
> +    .receive = vmnet_receive_common,
> +    .cleanup = vmnet_cleanup_common,
> +};
> +
> +
>   int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
>                              NetClientState *peer, Error **errp)
>   {
> -  error_setg(errp, "vmnet-bridged is not implemented yet");
> -  return -1;
> +    NetClientState *nc = qemu_new_net_client(&net_vmnet_bridged_info,
> +                                             peer, "vmnet-bridged", name);
> +    if (!validate_options(netdev, errp)) {
> +        return -1;
> +    }
> +    return vmnet_if_create(nc, build_if_desc(netdev), errp);
>   }


