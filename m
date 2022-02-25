Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ADF4C4DAA
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 19:24:40 +0100 (CET)
Received: from localhost ([::1]:48564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNfGh-0002n0-IJ
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 13:24:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNejU-0004wM-T8
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:50:21 -0500
Received: from [2607:f8b0:4864:20::62e] (port=41474
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNejQ-0008B4-GQ
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:50:20 -0500
Received: by mail-pl1-x62e.google.com with SMTP id z2so5429972plg.8
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KS3hzkCXI56vDkmoC6ZBMtd1GoYXw6vbPWivQ668uBg=;
 b=fjjL99jq11FwJAanDFFU1LmWvS1T2an3KJL1puEpIMvbpNLYgNyC1xHGq36SETiFs0
 yKOv5nCf2Qq2+h0KNfjt8ma2BxaEHnZxPOqscy/UsSWW78yqnwBH/u0vyvu/5mgi9QGQ
 YgbcD0G2px9Bu3p+J/3oS8PW1/mcLSIUfbU3iTPAsuQR+R7Ka7Inqz0hbE8w8DLjJzQT
 BXXx+JIQQUBZcwMEAY/4t9ZJepmCnoqUFpTm/4xmMhxChbyrHXCFz9JukMV0vZj8b116
 TGCGax7NxymIuLWobOM9dxqo3SH+qbKgZzvxxhyljAN+9OB11cBR1sL1pvgfWNPjYmg/
 ZJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KS3hzkCXI56vDkmoC6ZBMtd1GoYXw6vbPWivQ668uBg=;
 b=SBZ509OYjMpLbnSxcWEOgqiGZ9UNJPIQ0lC5KsxJPac2pS1unD8txeRJYHCDh1FBrr
 j/nKlMBBygYGS9uEery2ctCK5y7QO25FMobNrDr1C/PeN1Oxhr0lp2wm54wtHplqdH7U
 BQRLiP9VqYI26D9AVfSYECJ1mL2O0q6OUaHvSaD4enk6A+ItYMS5xVPqHgkzsueF8+Gf
 VswPw6itjejxWbo2aoC6qRxvkF40x8qVTlaxy4y2QLcOa/0qJLfaiwE+egTcdU1S7gC7
 jxMo0mf/v+P5Z8E87GnvN1B6EVOYOqFvYMhzlQ4fqiDpQhZ9uObZTMFHPjJ5jWI0hrhs
 NZVA==
X-Gm-Message-State: AOAM530YRGAvP0x0z3cBbYa7/FwFVdRKYFDSlBG37dQHlIzBVj3azdXw
 oGmoklneyspSYXB7ITP/yGw=
X-Google-Smtp-Source: ABdhPJxe6n0cY67QeeEM5xgdzwkKuDiS19XhfrQV6KYi/cNPJUpwakn6wbx/v3EiEaD/jmNzdKwbbw==
X-Received: by 2002:a17:90a:8582:b0:1b9:b0da:9ca9 with SMTP id
 m2-20020a17090a858200b001b9b0da9ca9mr4199670pjn.146.1645811410389; 
 Fri, 25 Feb 2022 09:50:10 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 lr11-20020a17090b4b8b00b001bc4098fa78sm3170887pjb.24.2022.02.25.09.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 09:50:10 -0800 (PST)
Message-ID: <6543543b-f934-7d97-dcc9-493a19c438af@gmail.com>
Date: Sat, 26 Feb 2022 02:50:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v15 5/8] net/vmnet: implement bridged mode (vmnet-bridged)
Content-Language: en-US
To: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>,
 qemu-devel@nongnu.org
References: <20220225171402.64861-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220225171402.64861-6-Vladislav.Yaroshchuk@jetbrains.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220225171402.64861-6-Vladislav.Yaroshchuk@jetbrains.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62e.google.com
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

On 2022/02/26 2:13, Vladislav Yaroshchuk wrote:
> Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
> ---
>   net/vmnet-bridged.m | 129 ++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 124 insertions(+), 5 deletions(-)
> 
> diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m
> index c735901666..a19b10909e 100644
> --- a/net/vmnet-bridged.m
> +++ b/net/vmnet-bridged.m
> @@ -10,16 +10,135 @@
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
> +typedef struct VmnetBridgedState {
> +    VmnetCommonState cs;
> +} VmnetBridgedState;
> +
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
> +static bool validate_options(const Netdev *netdev, Error **errp)
> +{
> +    const NetdevVmnetBridgedOptions *options = &(netdev->u.vmnet_bridged);
> +    char ifnames[256];

I'm not sure if it always fits in 256.

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
> +static NetClientInfo net_vmnet_bridged_info = {
> +    .type = NET_CLIENT_DRIVER_VMNET_BRIDGED,
> +    .size = sizeof(VmnetBridgedState),
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
> +        g_assert_not_reached();
> +    }
> +    return vmnet_if_create(nc, build_if_desc(netdev), errp);
>   }


