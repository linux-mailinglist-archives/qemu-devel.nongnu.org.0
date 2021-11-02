Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEB0442B15
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 10:53:04 +0100 (CET)
Received: from localhost ([::1]:36322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhqTW-000611-Qs
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 05:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mhqOe-00053H-AU
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:48:00 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:46734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mhqOb-0002l7-S3
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:47:59 -0400
Received: from [192.168.15.140] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id EF3C52077D;
 Tue,  2 Nov 2021 09:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1635846473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xvqz2SIi46eGwoJcBmtEQtqBSg6IabIAtIEnPiRVJaI=;
 b=35rWHVxBF+7kuzd/LIpJgnsWGfNgj6cYjNvIguzLszNNd/YTbxVj+bFOqZr6Bn+Huy7Sql
 fH8rfqWxvERlAs156LMhcKBUvE8PXylDQfnbb5UOwMBQC5r1SMGFmcz942RMrEj4YS4sdd
 K19T7Fky1+wANfulPQGkHJuPJqAsO6k=
Message-ID: <388aebc7-f4a7-d1d1-40ab-f50abd86c686@greensocs.com>
Date: Tue, 2 Nov 2021 10:47:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 4/5] hw/core: Remove uses of QERR_PROPERTY_VALUE_BAD
Content-Language: en-US-large
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211029230147.2465055-1-philmd@redhat.com>
 <20211029230147.2465055-5-philmd@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20211029230147.2465055-5-philmd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/30/21 01:01, Philippe Mathieu-Daudé wrote:
> QERR_PROPERTY_VALUE_BAD definition is obsolete since 2015 (commit
> 4629ed1e989, "qerror: Finally unused, clean up"). Replace the two
> uses and drop the definition.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   include/qapi/qmp/qerror.h | 3 ---
>   hw/core/qdev-properties.c | 2 +-
>   target/i386/cpu.c         | 2 +-
>   3 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
> index f49ae01cdb0..a3f44fc4a1e 100644
> --- a/include/qapi/qmp/qerror.h
> +++ b/include/qapi/qmp/qerror.h
> @@ -50,9 +50,6 @@
>   #define QERR_PERMISSION_DENIED \
>       "Insufficient permission to perform this operation"
>   
> -#define QERR_PROPERTY_VALUE_BAD \
> -    "Property '%s.%s' doesn't take value '%s'"
> -
>   #define QERR_PROPERTY_VALUE_OUT_OF_RANGE \
>       "Property %s.%s doesn't take value %" PRId64 " (minimum: %" PRId64 ", maximum: %" PRId64 ")"
>   
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index c34aac6ebc9..dbea4cf8e5e 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -663,7 +663,7 @@ void error_set_from_qdev_prop_error(Error **errp, int ret, Object *obj,
>           break;
>       default:
>       case -EINVAL:
> -        error_setg(errp, QERR_PROPERTY_VALUE_BAD,
> +        error_setg(errp, "Property '%s.%s' doesn't take value '%s'",
>                      object_get_typename(obj), name, value);
>           break;
>       case -ENOENT:
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index fc3ed80ef1e..bc63b80e5bd 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4469,7 +4469,7 @@ static void x86_cpuid_set_vendor(Object *obj, const char *value,
>       int i;
>   
>       if (strlen(value) != CPUID_VENDOR_SZ) {
> -        error_setg(errp, QERR_PROPERTY_VALUE_BAD, "", "vendor", value);
> +        error_setg(errp, "Property '.vendor' doesn't take value '%s'", value);
>           return;
>       }
>   
> 
Hi,

maybe we can remove the '.' before vendor in this case.

--
Damien

