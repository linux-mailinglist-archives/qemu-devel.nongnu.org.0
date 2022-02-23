Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7CB4C10B3
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:53:04 +0100 (CET)
Received: from localhost ([::1]:44168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMpGZ-00032s-4u
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:53:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMp8p-0005Ho-SW
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 05:45:03 -0500
Received: from [2607:f8b0:4864:20::102d] (port=38654
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMp8a-0001jC-VP
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 05:44:50 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 nh8-20020a17090b364800b001bc023c6f34so1783793pjb.3
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 02:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1OQM/Kxt37o2FiC+ntmRlUVPrrgayaEdQfI8P8A+zAk=;
 b=oqSEoNapZVSGCt0yOP6lzyYyhxZJxJO57uFZAeI+upNHJpHUpyaSF/Brl4kEX0iIAr
 qWzHi9tESF+ULlWrisllEFPRJLRYIox2DmV394xiNET4PoJL3dJfueKEHMK1AnjGk94O
 sS/wmBZOH4VM08IPfYGPGasjbzU4qUS0/lnN3y8zsddC0fSOUazPWOPs0EnzQTCednbs
 6D6YDs+D1SCKPx1/hdUngskWEPBayp+eunIVwjJeRu9+8PmVlIKkfRbZGkt5Xi3bKJfU
 0Y+2H7gg2j+tBKW3p9cbU3NW8vEJjEUQ0dO7muWyGXpTOUMKAJVwySTzu1u+WqzR4obx
 4KXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1OQM/Kxt37o2FiC+ntmRlUVPrrgayaEdQfI8P8A+zAk=;
 b=RqCKnRCHsbkGftVJxxOJTxVr3sYpTDk4sJXdDHD+V3qsPfhUtwoAeUJwi64M99FlyO
 WEwbn+IP87GYT7szBfPIJNHUVXoOH0SoSH0rx4s1cNUcF4HqrVqA0PSjz1POXbVg1vVL
 djqMaCKGy6LNVi1FmE08JiUORdB1vz+EOe3ain2JBXlI1J+0KLuFL8fyzgozrcSGOE0r
 J1kSItdg5JDidKi3ccfjRsIylxSBq1/xsceY0HiX3ayBqrD1Ov7ud7WiYqFNnChX3VQ4
 wAwxY2RmApHZ+MLH3iQWvvcEjW0S0EvVyYHDA8E7JPL8QfQnk0jrCFs7c3iU2Gckb1IV
 Y5Yg==
X-Gm-Message-State: AOAM532AXHpbIhezRnrJPz3HHD3NRlbkP1gn6CZijjtLXh04Nrs1mep1
 WjO8NU0FXjOVyUZ6DXiVIl8=
X-Google-Smtp-Source: ABdhPJxWU3z4DpGHGu4wI321E50rk+bjSljxsNWwTY4xrJlrbo13+0+7F99HyKAZxfL9NkyUMe0tEQ==
X-Received: by 2002:a17:903:110d:b0:14d:ca16:2c7 with SMTP id
 n13-20020a170903110d00b0014dca1602c7mr26963593plh.68.1645613087170; 
 Wed, 23 Feb 2022 02:44:47 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id z21sm23390312pgv.21.2022.02.23.02.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 02:44:46 -0800 (PST)
Message-ID: <aae09db2-2691-6e24-ee30-4f667461b70b@gmail.com>
Date: Wed, 23 Feb 2022 11:44:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] thread-posix: optimize qemu_sem_timedwait with zero
 timeout
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220223083628.231589-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220223083628.231589-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
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
Cc: "Longpeng\(Mike\)" <longpeng2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/2/22 09:36, Paolo Bonzini wrote:
> In this case there is no need to call pthread_cond_timedwait; the
> function is just a trywait and waiting on the condition variable would
> always time out.
> 
> Based-on: <20220222090507.2028-1-longpeng2@huawei.com>

^ Please remove when applying.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Cc: "Longpeng(Mike)" <longpeng2@huawei.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   util/qemu-thread-posix.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)

