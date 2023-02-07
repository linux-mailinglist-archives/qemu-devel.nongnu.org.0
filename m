Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3C768D194
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 09:41:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPJWo-0006aA-OV; Tue, 07 Feb 2023 03:40:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPJWi-0006Xs-Vp
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:40:34 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPJWg-0002yR-Q7
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:40:32 -0500
Received: by mail-wr1-x42e.google.com with SMTP id bk16so12731933wrb.11
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 00:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eLsdd+HyG5ZPpaUQ8uSpeY5hss2PqXFI1YTiwoBFang=;
 b=DgHbUodRYamrAxFXHtABvP2ZhU4iBVbXwcKxkxK0Vnd0Gy01fwQoB/i9XSCPjox4CV
 robTnVMUW0dtNFshMrx/+fYp0YCK//Z1VAkJpapk4/RMoZQtNIES3O48gNvt90lqBRY2
 6DjFlYL2QmjFnvVC9tOgv+2E7MrqMVJqh+0/+O1+MJmjFEqo5q/xl/0DSxIi8fNApTQi
 2PXtiLobiUvTMPq4pcD0qAASOL8EuSFIyOz3swHBL9FkfmOfCrspxmm4Ys/hauBUU09d
 O5wHuP3DmZQKsTIIUNvi+Obib+6Dy2q7vnVxoOBbhJSBruYNJpUJWVEj7UHtO1R5bZzy
 pxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eLsdd+HyG5ZPpaUQ8uSpeY5hss2PqXFI1YTiwoBFang=;
 b=XzClRW2Fr7Bcr2k5RHSUV9GFX/cdhU8WODRDYOGxyk7+1K73TEL+wa8J0QLTuiadQy
 YF6aae5lJL9JrY48zUB6fylconXXkOGf7wpQq1D8WcUYire7+VAsZLPyIaMNc0j3v0Ku
 cYhfcj/7kQUN0ijGgex9UDqD67bTODmuBSBgk7eiMC4P4S8b6GdOQws6FJMKCoXH+gqu
 ZJOHAp0Pvb6fehHSNu4eBwwJCsFZQxazxkobjbcZWjj2YrxF3W5ZY3fKDG6rdzhfAXQ7
 v2bCyJwtCKmke1RK8/pAC88JdDmMIaW6aoXKzY+CK2ydb1mBt5HlO4vkDF9nehiRj06R
 2uhQ==
X-Gm-Message-State: AO0yUKWk2EZvPOM+jsnpYasEXxeozG0JEBjjVbhDU+bvkHPclLVvw6tW
 0jck9S1SZEQidYImzVaA69qZyw==
X-Google-Smtp-Source: AK7set8nwSi2RGNGxAatuzbcXNVpGAGKpbdmTYFBpFtoPUXlqZN4lWXEhqu3bI1rVgRO+45xGlElPg==
X-Received: by 2002:adf:e544:0:b0:2c3:f06f:8509 with SMTP id
 z4-20020adfe544000000b002c3f06f8509mr1584656wrm.18.1675759229095; 
 Tue, 07 Feb 2023 00:40:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u10-20020adfdb8a000000b002bfb0c5527esm10799653wri.109.2023.02.07.00.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 00:40:27 -0800 (PST)
Message-ID: <636770da-898e-5bae-fe62-7cb1358ea752@linaro.org>
Date: Tue, 7 Feb 2023 09:40:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 10/12] hw/core: Improve the query-hotpluggable-cpus error
 message
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, jiri@resnulli.us, jasowang@redhat.com,
 pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, zhanghailiang@xfusion.com,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com
References: <20230207075115.1525-1-armbru@redhat.com>
 <20230207075115.1525-11-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230207075115.1525-11-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/2/23 08:51, Markus Armbruster wrote:
> The QERR_ macros are leftovers from the days of "rich" error objects.
> We've been trying to reduce their remaining use.
> 
> Get rid of a use of QERR_FEATURE_DISABLED, and improve the slightly
> awkward error message
> 
>      (qemu) info hotpluggable-cpus
>      Error: The feature 'query-hotpluggable-cpus' is not enabled
> 
> to
> 
>      Error: machine does not support hot-plugging CPUs
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/core/machine-qmp-cmds.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index a6ed3a63c3..2d904747c0 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -16,7 +16,6 @@
>   #include "qapi/error.h"
>   #include "qapi/qapi-builtin-visit.h"
>   #include "qapi/qapi-commands-machine.h"
> -#include "qapi/qmp/qerror.h"
>   #include "qapi/qmp/qobject.h"
>   #include "qapi/qobject-input-visitor.h"
>   #include "qapi/type-helpers.h"
> @@ -141,7 +140,7 @@ HotpluggableCPUList *qmp_query_hotpluggable_cpus(Error **errp)
>       MachineClass *mc = MACHINE_GET_CLASS(ms);
>   
>       if (!mc->has_hotpluggable_cpus) {
> -        error_setg(errp, QERR_FEATURE_DISABLED, "query-hotpluggable-cpus");
> +        error_setg(errp, "machine does not support hot-plugging CPUs");

"hotplug CPUs" or "hot-pluggable CPUs"?

>           return NULL;
>       }
>   


