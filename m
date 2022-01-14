Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D230E48E6F5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 09:54:02 +0100 (CET)
Received: from localhost ([::1]:54356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8ILR-0006Pz-VF
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 03:54:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n8IBX-0007ev-Lv
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 03:43:47 -0500
Received: from [2607:f8b0:4864:20::42b] (port=33482
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n8IBW-00079S-1N
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 03:43:47 -0500
Received: by mail-pf1-x42b.google.com with SMTP id x83so2171820pfc.0
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 00:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:subject:to:cc
 :references:content-language:in-reply-to:content-transfer-encoding;
 bh=mN+AMFDwsWlV/yPnE2XHf0NpAao/rlZZMOX7907hcBA=;
 b=hAC/qjoLBH7+GBKTcAD/WSy06ukf1RevY3T2zJ6K00zRV8qfDH50avCyxhY96r75Gp
 I50127TEPF0IJ83CVf8lAdHvaJ8sG8KTGqTIXjKnbH22p+2X0qr/DpBOQ/vmuFvyYFN8
 i0wTqfgHZ6HRyEgs9a+NrA3QuMhqL4cZpVj+CkgxnD9yPsZ5PN2YF+rJiON7EWl9aywr
 3YnNe8kbhLc+DososrMceAf5FI5o0pCd2AY4xhl8+/3ZRZHasibM6G/DJhDkJ42l1yQ7
 hdwzqr5mvEv3ufNywOmMJ2BqTHJlVrIQ6QJr1ZG0mmXFlEJ4yAEkQvekmhnMGB3+Ibak
 7DCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:references:content-language:in-reply-to
 :content-transfer-encoding;
 bh=mN+AMFDwsWlV/yPnE2XHf0NpAao/rlZZMOX7907hcBA=;
 b=JMvYnBkzJbqY0+tBXEKopgpX7ufznV/F2sjyPPzaL/k0VS4Mv4aNfPkAGKBBYG+qVJ
 QGw1X6jJoNBx+3Tkc/UEnl7hH9q2yHPPo4vWQWHOBfxSLRMlZHHXb9DshUpnlHu+wpl4
 lEG1RGhoeLmkwD8iQTK5iXUSkXUQjNdUkDL4Da1P2dGtUqIIQzs5kNZ4CCbbBKB9WSq9
 Q9mPPt3PA2idHvxet7z9vQ5Lp6wHCzoH3dwlQjdX21yamIRjcY7Ik1j8N2ytpHNCoGTl
 O+z+61XelvoFhbetfd3T9cmQDm16pvfMoIBnP/ejHmlxof7yETQ68BxoJ0JKcijIvcVa
 mmow==
X-Gm-Message-State: AOAM533LUZnSF74H7sUBlAkS83mKWG/66r7HEOuQ7gisqy+cbHXEueIb
 rR0RIHPT7sjYuUCahMDp4Dk=
X-Google-Smtp-Source: ABdhPJxMB8uFjVXtdF8WVBtK0JApbtIsVW59KMylbuat8kQCI1Joeoa2zJA4pG+UgcmmrhWn8IKAJw==
X-Received: by 2002:a63:90c8:: with SMTP id a191mr7374659pge.622.1642149824726; 
 Fri, 14 Jan 2022 00:43:44 -0800 (PST)
Received: from [192.168.64.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 z18sm5249758pfe.146.2022.01.14.00.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 00:43:44 -0800 (PST)
Message-ID: <fde9c204-646c-8f56-495f-fe0b6f6a2066@gmail.com>
Date: Fri, 14 Jan 2022 17:43:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v13 5/7] net/vmnet: implement bridged mode (vmnet-bridged)
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, qemu-devel@nongnu.org
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <20220113172219.66372-6-yaroshchuk2000@gmail.com>
Content-Language: en-US
In-Reply-To: <20220113172219.66372-6-yaroshchuk2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 2022/01/14 2:22, Vladislav Yaroshchuk wrote:
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> ---
>   net/vmnet-bridged.m | 105 +++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 100 insertions(+), 5 deletions(-)
> 
> diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m
> index 4e42a90391..bc499c6195 100644
> --- a/net/vmnet-bridged.m
> +++ b/net/vmnet-bridged.m
> @@ -10,16 +10,111 @@
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
> +  VmnetCommonState cs;
> +} VmnetBridgedState;
> +
> +static bool validate_ifname(const char *ifname)
> +{
> +    xpc_object_t shared_if_list = vmnet_copy_shared_interface_list();
> +    __block bool match = false;
> +
> +    xpc_array_apply(
> +        shared_if_list,
> +        ^bool(size_t index, xpc_object_t value) {
> +          if (strcmp(xpc_string_get_string_ptr(value), ifname) == 0) {
> +              match = true;
> +              return false;
> +          }
> +          return true;
> +        });
> +
> +    return match;
> +}

shared_if_list leaks here. Add xpc_release(shared_if_list);

It can be simpler like the following:
return !xpc_array_apply(
     shared_if_list,
     ^bool(size_t index, xpc_object_t value) {
         return strcmp(xpc_string_get_string_ptr(value), ifname) != 0;
     });

> +
> +static const char *get_valid_ifnames(void)
> +{
> +    xpc_object_t shared_if_list = vmnet_copy_shared_interface_list();
> +    __block char *if_list = NULL;
> +
> +    xpc_array_apply(
> +        shared_if_list,
> +        ^bool(size_t index, xpc_object_t value) {
> +          if_list = g_strconcat(xpc_string_get_string_ptr(value),
> +                                " ",
> +                                if_list,
> +                                NULL);
> +          return true;
> +        });
> +
> +    if (if_list) {
> +        return if_list;
> +    }
> +    return "[no interfaces]";
> +}
> +
> +static xpc_object_t create_if_desc(const Netdev *netdev, Error **errp)
> +{
> +    const NetdevVmnetBridgedOptions *options = &(netdev->u.vmnet_bridged);
> +    xpc_object_t if_desc = xpc_dictionary_create(NULL, NULL, 0);
> +
> +    xpc_dictionary_set_uint64(
> +        if_desc,
> +        vmnet_operation_mode_key,
> +        VMNET_BRIDGED_MODE
> +    );
> +
> +#if defined(MAC_OS_VERSION_11_0) && \
> +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
> +    xpc_dictionary_set_bool(
> +        if_desc,
> +        vmnet_enable_isolation_key,
> +        options->isolated
> +    );
> +#else
> +    if (options->has_isolated) {
> +        error_setg(errp,
> +                   "vmnet-bridged.isolated feature is "
> +                   "unavailable: outdated vmnet.framework API");
> +    }
> +#endif
> +
> +    if (validate_ifname(options->ifname)) {
> +        xpc_dictionary_set_string(if_desc,
> +                                  vmnet_shared_interface_name_key,
> +                                  options->ifname);
> +    } else {
> +        return NULL;
> +    }

The dictionary leaks if the validation fails. The validation should 
happen as early as possible.

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
>   int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
>                              NetClientState *peer, Error **errp)
>   {
> -  error_setg(errp, "vmnet-bridged is not implemented yet");
> -  return -1;
> +    NetClientState *nc = qemu_new_net_client(&net_vmnet_bridged_info,
> +                                             peer, "vmnet-bridged", name);
> +    xpc_object_t if_desc = create_if_desc(netdev, errp);;

Duplicate semicolon.

> +
> +    if (!if_desc) {
> +        error_setg(errp,
> +                   "unsupported ifname, should be one of: %s",
> +                   get_valid_ifnames());

nc and get_valid_ifnames() leaks.

> +        return -1;
> +    }
> +
> +    return vmnet_if_create(nc, if_desc, errp, NULL);
>   }

