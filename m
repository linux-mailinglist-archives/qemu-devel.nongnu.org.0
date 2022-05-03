Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C217518C1C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 20:19:01 +0200 (CEST)
Received: from localhost ([::1]:58826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlx6x-0007YD-M7
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 14:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nlx4a-000642-Hi; Tue, 03 May 2022 14:16:33 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:45632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nlx4W-0002Aw-R9; Tue, 03 May 2022 14:16:31 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so17955943fac.12; 
 Tue, 03 May 2022 11:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2G3bN6YMuIB+CGNBBM0t3eGhIY4FGeRP+zXCD/PVKJM=;
 b=EeiRmq5wgAb70aB7NFABVh+tNB8lPjfC7TufJ/rOEtrDnuTSRxWt/8TMT4qnwOaVhm
 qVYmqtgV54jrAfi8OdgL1ZguU7zOdEmf2TrDT+vKb6S4qy1XLlWIIZ/GVo/IhsQFzo4k
 EFtKIuYKWmCq3O51prvKajgF/yxbq4c47LxaK/0FE1/BXaeDZzCUOgKTc/qvHBd2L6g9
 OFql7cF+NxVZuKH8qkFHKvlOIMj+7glM/oD2UEmDor/W2tpyKnsY4Vg2JdCU9kwJEdrW
 xRCMJ0B0PVIMS4vmm5Mj5V9ypZA/FLDVfYx3h4GY9JwVMapfLZ0HeA1yDmhvXWvIVbfJ
 NiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2G3bN6YMuIB+CGNBBM0t3eGhIY4FGeRP+zXCD/PVKJM=;
 b=3ICRlIdqddDnIupGH9iVyBIbZbX5hlUrC1RD6hsDc9Br/HroK1hJmNWjZQVPmd02HQ
 dZtBzcbKQiF/6R9/t9zPiJcmB21wa+mxtLZqUyoQ55/ElbAIqfmQvyQs7TJLg/dvZHnK
 pfPyEzYaSeDWOfhTOj4gdPXzT5FZ6sBBtg05A9hD8H9WF2aiGR/UVuLV1d9gv5b1yy+c
 a0fnnUKi7ArWhQRHAsMegqYBQURZVZrqSV9VAYpl7+Hj2jKXcuKZi+hhzlkrTIDTdr4b
 KSa2+b2m/L6kJ+q6QvuICAszV39PhXqa54Dun6wTrVfgPH7wfKpG5jhHJa/SUh4LoYdC
 Hf3Q==
X-Gm-Message-State: AOAM532090s3Wjy9nKg9h8Zuw9ec4Eo/2yoDHK20R2B5kWWy1H3kCxtg
 /umhvNdDnQ267okoiW3aYnA=
X-Google-Smtp-Source: ABdhPJy7hFVr394tyBBcefx//sx9SA4XD9iVnsB+h6OL+OBl7gAKN3AZg7N/UkvY3qhkxyHNjkK0Jw==
X-Received: by 2002:a05:6870:17a4:b0:e5:8eee:1607 with SMTP id
 r36-20020a05687017a400b000e58eee1607mr2399310oae.12.1651601784820; 
 Tue, 03 May 2022 11:16:24 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:3589:466:9481:7296:c2be?
 ([2804:431:c7c7:3589:466:9481:7296:c2be])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a9d7685000000b006060322125asm4356617otl.42.2022.05.03.11.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 11:16:24 -0700 (PDT)
Message-ID: <0db62822-f5c8-186e-4c5b-23756cb34807@gmail.com>
Date: Tue, 3 May 2022 15:16:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] vhost-user: Use correct macro name TARGET_PPC64
Content-Language: en-US
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 mopsfelder@gmail.com, Fabiano Rosas <farosas@linux.ibm.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Peter Turschmid <peter.turschm@nutanix.com>
References: <20220503180108.34506-1-muriloo@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220503180108.34506-1-muriloo@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/3/22 15:01, Murilo Opsfelder Araujo wrote:
> The correct name of the macro is TARGET_PPC64.
> 
> Fixes: 27598393a232 ("Lift max memory slots limit imposed by vhost-user")
> Reported-by: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
> Cc: Peter Turschmid <peter.turschm@nutanix.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


>   hw/virtio/vhost-user.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 9c4f84f35f..e356c72c81 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -51,7 +51,7 @@
>   #include "hw/acpi/acpi.h"
>   #define VHOST_USER_MAX_RAM_SLOTS ACPI_MAX_RAM_SLOTS
>   
> -#elif defined(TARGET_PPC) || defined(TARGET_PPC_64)
> +#elif defined(TARGET_PPC) || defined(TARGET_PPC64)
>   #include "hw/ppc/spapr.h"
>   #define VHOST_USER_MAX_RAM_SLOTS SPAPR_MAX_RAM_SLOTS
>   

