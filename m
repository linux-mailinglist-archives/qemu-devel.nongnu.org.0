Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700E0403637
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 10:40:26 +0200 (CEST)
Received: from localhost ([::1]:55530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNt85-0001S9-Go
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 04:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNt6n-0000WU-QS
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:39:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNt6m-0006mB-7p
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:39:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631090343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cjVkqXdWiMFUuKkcn/w57LGltJyYSZ52679tolhPlU0=;
 b=BiK0c/DmKEvCArt0pz8MNGun0ORvxwJRKeivxEMmOrJ27ww+bytv1mqWVkqw56LSapHFDr
 y48o+Wmp3UwdqOq38ZZfUFfHigslbDiWsD9AkwPz6bghj/Iosfp2pkjpP/LbgNfGhekcN4
 Amj3s07SC2V+dUMOwc6EMUiClFhNwKo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-InfaDDzgPl6bVeOTuGz1Gg-1; Wed, 08 Sep 2021 04:39:02 -0400
X-MC-Unique: InfaDDzgPl6bVeOTuGz1Gg-1
Received: by mail-wm1-f70.google.com with SMTP id
 m22-20020a7bcb96000000b002f7b840d9dcso590261wmi.1
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 01:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cjVkqXdWiMFUuKkcn/w57LGltJyYSZ52679tolhPlU0=;
 b=eWwbbtCSx313Sg+QOx+r3f8cZKb8EBDYhnKwLu/HjfepIY0sHwmUBbzMq1r8NqRxjq
 QH51kFFTObeQThTqjKzLxhLwHFGBQfacqTBo4ZNNq4bRL0yEhIeAHEMsiI9OT7fC2Jji
 Atg3mzKwj/N/+qYbPF0SwWFMMI83YgGyCs3oy6KwAbPv5o/yqdQqw2obU13XHgIJLYXh
 T5uadGBZYX+zgg+nBshWtakkpkqzw8A5mW+GNzjBJUYL7aFioK79zAisJcXODakspKWB
 61q8a3maK3qSU1eae8tEad2dsWRziEq/tWFUIe4gEri67kJiC32WBU5EIiAgVB8LqSS6
 Kbiw==
X-Gm-Message-State: AOAM533j8C1Hn6Z9W/lG6p76bE+oAXyxxAgVLXM8XV5h4I+5CuXc9BPI
 rPGw1yvT3cEgx0VHIisvlc46d3szeMipOfUxmF4MkozCdef/F767T6/WaEzHau8BrFJDNhTG5+t
 l7qYduVEmcEKUsOM=
X-Received: by 2002:adf:eac3:: with SMTP id o3mr2728873wrn.60.1631090341544;
 Wed, 08 Sep 2021 01:39:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlgEYa2+xDbvvIkLmZxCcyzfMFI9HOfP5LNxCqwDg9TQawLd8IShYkiYPeveSO3GNhu0/i1w==
X-Received: by 2002:adf:eac3:: with SMTP id o3mr2728843wrn.60.1631090341261;
 Wed, 08 Sep 2021 01:39:01 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id i11sm1491358wrb.48.2021.09.08.01.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 01:39:00 -0700 (PDT)
Subject: Re: [PATCH 5/7] qmp: Add the qmp_query_sgx_capabilities()
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210908081937.77254-1-yang.zhong@intel.com>
 <20210908081937.77254-6-yang.zhong@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fe8b02c8-d7f8-c733-9577-311251a5f66d@redhat.com>
Date: Wed, 8 Sep 2021 10:38:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908081937.77254-6-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, eblake@redhat.com, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 10:19 AM, Yang Zhong wrote:
> Libvirt can use qmp_query_sgx_capabilities() to get the host
> sgx capabilities.
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  hw/i386/sgx.c              | 66 ++++++++++++++++++++++++++++++++++++++
>  include/hw/i386/sgx.h      |  1 +
>  qapi/misc-target.json      | 18 +++++++++++
>  target/i386/monitor.c      |  5 +++
>  tests/qtest/qmp-cmd-test.c |  1 +
>  5 files changed, 91 insertions(+)

> +SGXInfo *sgx_get_capabilities(Error **errp)
> +{
> +    SGXInfo *info = NULL;
> +    uint32_t eax, ebx, ecx, edx;
> +
> +    int fd = qemu_open_old("/dev/sgx_vepc", O_RDWR);
> +    if (fd < 0) {
> +        error_setg(errp, "SGX is not enabled in KVM");
> +        return NULL;
> +    }

Is this Linux specific?


