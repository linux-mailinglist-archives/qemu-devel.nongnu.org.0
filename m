Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DF142A53B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 15:16:05 +0200 (CEST)
Received: from localhost ([::1]:41648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maHdU-0000dS-DH
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 09:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-louis@dupond.be>)
 id 1maDGc-00006r-VT
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 04:36:11 -0400
Received: from apollo.dupie.be ([51.159.20.238]:56788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-louis@dupond.be>)
 id 1maDGZ-0000KY-JN
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 04:36:10 -0400
Received: from [IPV6:2a02:a03f:fa8f:3301:eba1:a8ad:64a3:d6c8] (unknown
 [IPv6:2a02:a03f:fa8f:3301:eba1:a8ad:64a3:d6c8])
 by apollo.dupie.be (Postfix) with ESMTPSA id 79D851521027;
 Tue, 12 Oct 2021 10:36:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dupond.be; s=dkim;
 t=1634027762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r7OD0iRbh62CVzuk+RcK1UpQazieePxuOcGGX0LVrcc=;
 b=Kem1MQg+m0B51KY1FFmkYizya3J9fpo+6TSx7fxmWfRbjxG6M4RSNFxH1qVQQodLHGWGSC
 XJm/Y8t6YWEpAdSPBnOYnjm0asynRGgQ8uUCS9WuHqfvfd9ZUyeZQWiYS8pCW5lAi+cBw5
 M0hQqo72DMW7NNeNWsI+m2vldn4mcel9UBRRXBc4MnZEzMjilBudvkBzmJ0cGjoq3TjIVv
 YpgcxWwrrBCYPuRWq9N8JQMuzcPW9ojsEpaRF2E1wZbQVLbReMImQYeufoWv5gTuvr/2QU
 2zcDHVBCKAvd4TKPIgfQ/sf2lVyIjO9FOXTRVsZhJGtES+XWkh9x1O634MS5GA==
Message-ID: <a9b2ff3a-0bba-216c-eeda-50821be4940e@dupond.be>
Date: Tue, 12 Oct 2021 10:36:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] hw/qdev-core: Add compatibility for (non)-transitional
 devs
Content-Language: nl-BE
To: qemu-devel@nongnu.org
References: <20211012082428.16222-1-jean-louis@dupond.be>
Cc: pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com
From: Jean-Louis Dupond <jean-louis@dupond.be>
In-Reply-To: <20211012082428.16222-1-jean-louis@dupond.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=51.159.20.238; envelope-from=jean-louis@dupond.be;
 helo=apollo.dupie.be
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 12 Oct 2021 09:07:05 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Forgot to CC maintainers.

On 12/10/2021 10:24, Jean-Louis Dupond wrote:
> hw_compat modes only take into account their base name.
> But if a device is created with (non)-transitional, then the compat
> values are not used, causing migrating issues.
>
> This commit adds their (non)-transitional entries with the same settings
> as the base entry.
>
> Fixes https://bugzilla.redhat.com/show_bug.cgi?id=1999141
>
> Signed-off-by: Jean-Louis Dupond <jean-louis@dupond.be>
> ---
>   include/hw/qdev-core.h | 34 ++++++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
>
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 4ff19c714b..5726825c2d 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -293,6 +293,30 @@ typedef struct GlobalProperty {
>       bool optional;
>   } GlobalProperty;
>   
> +
> +/**
> + * Helper to add (non)transitional compat properties
> + */
> +static inline void
> +compat_props_add_transitional(GPtrArray *arr, GlobalProperty *prop)
> +{
> +    GlobalProperty *transitional = g_new0(typeof(*transitional), 1);
> +    transitional->driver = g_strdup_printf("%s-transitional", prop->driver);
> +    transitional->property = g_strdup(prop->property);
> +    transitional->value = g_strdup(prop->value);
> +    transitional->used = prop->used;
> +    transitional->optional = prop->optional;
> +    g_ptr_array_add(arr, (void *)transitional);
> +
> +    GlobalProperty *non_transitional = g_new0(typeof(*non_transitional), 1);
> +    non_transitional->driver = g_strdup_printf("%s-non-transitional", prop->driver);
> +    non_transitional->property = g_strdup(prop->property);
> +    non_transitional->value = g_strdup(prop->value);
> +    non_transitional->used = prop->used;
> +    non_transitional->optional = prop->optional;
> +    g_ptr_array_add(arr, (void *)non_transitional);
> +}
> +
>   static inline void
>   compat_props_add(GPtrArray *arr,
>                    GlobalProperty props[], size_t nelem)
> @@ -300,6 +324,16 @@ compat_props_add(GPtrArray *arr,
>       int i;
>       for (i = 0; i < nelem; i++) {
>           g_ptr_array_add(arr, (void *)&props[i]);
> +        if (g_str_equal(props[i].driver, "vhost-user-blk-pci") ||
> +            g_str_equal(props[i].driver, "virtio-scsi-pci") ||
> +            g_str_equal(props[i].driver, "virtio-blk-pci") ||
> +            g_str_equal(props[i].driver, "virtio-balloon-pci") ||
> +            g_str_equal(props[i].driver, "virtio-serial-pci") ||
> +            g_str_equal(props[i].driver, "virtio-9p-pci") ||
> +            g_str_equal(props[i].driver, "virtio-net-pci") ||
> +            g_str_equal(props[i].driver, "virtio-rng-pci")) {
> +            compat_props_add_transitional(arr, &props[i]);
> +        }
>       }
>   }
>   

