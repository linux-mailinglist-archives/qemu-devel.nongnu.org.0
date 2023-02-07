Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B42D68D197
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 09:42:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPJXz-0007Rm-7r; Tue, 07 Feb 2023 03:41:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPJXx-0007Ra-4n
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:41:49 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPJXv-00036s-I2
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:41:48 -0500
Received: by mail-wm1-x329.google.com with SMTP id n13so10461363wmr.4
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 00:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7RyJv85ili1ctOxWaeXaMet0B3SqW8r1ZTzoRdAI8GY=;
 b=E4K6DAFpg1aIkdN4yxClPMklFZaxx6zhJdGux87WFghCcgLnIhVPmgXvAzHU68J3yd
 Wye7nPV/ZHNb5omoS6/pHERJ3qcjmnvBEJCA2WSZ4Gm96QEL++0pOwbtwVH4ME2UYzuN
 emDaO88AELgwX3NUHz8pRm1GxlfFdq+ZAjcdGI05emmBNwH9Jlp9XIDv1X1R30zfeKZT
 CLeoxnyac/BbWHMK42iEwAxjMWdFZqah+V5Eyd9igsJnlLPjA0ecGlBE6o3KFejY4moy
 RwcHD/RAkWtjmyUB7hvIZ7wwbp5GeydWn1xotoCQOYN6hV9cO4VDS+MI8MxsMlZa6d5E
 h7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7RyJv85ili1ctOxWaeXaMet0B3SqW8r1ZTzoRdAI8GY=;
 b=y5ryTDdw7mc3v05cioqnr6QI+9hHtHusP9I/FHQ+piKJ+mR4aZGjea6mjgfvt0AGN3
 UZO0upzEmDgFJ+TNwy/xXUexG3ggobFoyRNmO0qLEf2DfJNg0HLd+/HeyYjs/r1FhwOv
 ObVwDOhDY1NCNyLnSVOqJMZ+oihdGWlSxWVNYibgl313nN5Vxr5zrjuougY3WJLJCftH
 v3bU6ZWbOQ5mtb2P/2puXemdyD6fgRPNwhQL29MR1fHU6zx+jLDqkXeSBJzY6poyjrl1
 wHuRJ5OxnZM+B20ecrhirUvIY6HMtVYqhxDlojPz6OC7S0I9t7Kpqw83RRS0NK3ftuav
 rEiA==
X-Gm-Message-State: AO0yUKUtZ4ZLZ/Hen8ZqBRs/j6pzA7cuRMvlldkDrmSJp1jWVb3Bfrho
 TxgvhHmo9tX+vb/tlfkjn67FcA==
X-Google-Smtp-Source: AK7set9h370vjyboaozFhkferrxRd23AECHOmJHE1rob8sIiR+8GLhd+L4ITFcTOZTxU+1Tm4+arZQ==
X-Received: by 2002:a05:600c:1817:b0:3df:e54a:4ac5 with SMTP id
 n23-20020a05600c181700b003dfe54a4ac5mr2327957wmp.27.1675759305199; 
 Tue, 07 Feb 2023 00:41:45 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g42-20020a05600c4caa00b003de664d4c14sm13012056wmp.36.2023.02.07.00.41.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 00:41:44 -0800 (PST)
Message-ID: <5e9239ca-f6cd-9396-2b7b-21ef7e4df5d2@linaro.org>
Date: Tue, 7 Feb 2023 09:41:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/12] error: Reduce qerror.h usage a bit more
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, jiri@resnulli.us, jasowang@redhat.com,
 pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, zhanghailiang@xfusion.com,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com
References: <20230207075115.1525-1-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230207075115.1525-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
> This series gets rid of two out of 15 remaining QERR_ macros and
> confines use of one more to qga/.  Bonus: better error messages.
> 
> Markus Armbruster (12):
>    error: Drop superfluous #include "qapi/qmp/qerror.h"
>    dump: Improve error message when target doesn't support memory dump
>    dump: Assert cpu_get_note_size() can't fail
>    hw/core: Improve error message when machine doesn't provide NMIs
>    hw/smbios: Dumb down smbios_entry_add() stub
>    hw/acpi: Dumb down acpi_table_add() stub
>    hw/acpi: Move QMP command to hw/core/
>    qga: Drop dangling reference to QERR_QGA_LOGGING_DISABLED
>    replay: Simplify setting replay blockers
>    hw/core: Improve the query-hotpluggable-cpus error message
>    migration/colo: Improve an x-colo-lost-heartbeat error message
>    rocker: Tweak stubbed out monitor commands' error messages

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

