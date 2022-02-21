Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F4F4BD9C9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 14:08:25 +0100 (CET)
Received: from localhost ([::1]:51748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM8QS-0005wj-K5
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 08:08:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7ht-0005mS-SX
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:22:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7hq-0004uU-5X
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:22:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645446136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wznZDv6ewjz8+5i3JtQzn0raGVOmTEkXxTfBUmpBqCk=;
 b=HKGrJI6KL3W8TRW38fDwHDUhWhiob5b16WpJYTx4SuK4egu/w3oiaO6GspHiEG/k/9biD9
 0D/I04h/b1iYSwCv1G6xReBsbTrQu1TlAZbqY2p9IqVE/zwjO74R31NldEZ1ozM9wjOEgM
 bRwVid34Hn2eCNoQwNNNiFncicwnF3I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-pXIR8PSpOBaYbSVHFR3vgg-1; Mon, 21 Feb 2022 07:22:14 -0500
X-MC-Unique: pXIR8PSpOBaYbSVHFR3vgg-1
Received: by mail-wr1-f72.google.com with SMTP id
 v17-20020adfc5d1000000b001e6405c2b56so7385553wrg.7
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 04:22:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wznZDv6ewjz8+5i3JtQzn0raGVOmTEkXxTfBUmpBqCk=;
 b=W93+7pGm4peMySHrpsTXiCRqjJb49EWz1sEfSl9EgJzGm+6c1Q9B7IAX1tw2UUr23B
 tcxBZubUYUKQBrwmvsaxXbELKdOFcbQHUFSSN57KsVMY/9z6lNpjWs4K5lgB0Wlvw0cw
 5IwA/048+a862zme7dZFo8fHuMmbRN8OWlDB9pDrnny+13GDrSkVnONzGyq4axEZIw53
 B+Acg/D9+h2F/ZPzZFIz4mhjgt5G0DJEk54T7aAdCIJSSr0bRYE6eGWQhzyqw2fMO95/
 NNfCOMqYVMRvA7cGOc1LqXD46VX+TxywdJua3nOq9juv6VL5l7YWUKxhYWw7CHRCWHJR
 zmIA==
X-Gm-Message-State: AOAM531pS4Ur8Ie18PdY955Mx+8R6rRPdozB92MGNgDPJCob297dDBOe
 hTP9q3gZLhE2Df69kIVkjbEgjuSG6EzP+hUUW5aSNaBk+Et88rXDaWfXN/CpybUdnfiP8A4xOg5
 2agqBudTUkn6Z/IE=
X-Received: by 2002:adf:dccc:0:b0:1e4:a588:4cb9 with SMTP id
 x12-20020adfdccc000000b001e4a5884cb9mr15528232wrm.461.1645446133687; 
 Mon, 21 Feb 2022 04:22:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4wZpg7ZY7GPr2I+ejqu+AesdHDm1EkJe5d8UaFGIV/6JwbBRx2uPoAf0qksOxJP1wTvCW0w==
X-Received: by 2002:adf:dccc:0:b0:1e4:a588:4cb9 with SMTP id
 x12-20020adfdccc000000b001e4a5884cb9mr15528223wrm.461.1645446133466; 
 Mon, 21 Feb 2022 04:22:13 -0800 (PST)
Received: from [192.168.42.76] (tmo-080-215.customers.d1-online.com.
 [80.187.80.215]) by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b0037c06fe68casm7896601wmq.44.2022.02.21.04.22.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 04:22:12 -0800 (PST)
Message-ID: <16022773-ad2c-23f2-f325-1f11d3423868@redhat.com>
Date: Mon, 21 Feb 2022 13:22:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/9] exec: Remove 'qemu/log.h' from 'exec-all.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220207082756.82600-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220207082756.82600-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/02/2022 09.27, Philippe Mathieu-Daudé via wrote:
> Yet another noisy/boring refactor, but it will allow us to better
> split exec/ includes as being target-agnostic/specific (the next
> series).
> 
> Since v1:
> - Remove unrelated "hw/s390x/virtio: missing 'cpu.h'" (thuth)
> - Reword some commit descriptions (thuth)
> 
> Based-on: <20220207075426.81934-1-f4bug@amsat.org>
> "softmmu: Make various objects target agnostic"
> 
> Philippe Mathieu-Daudé (9):
>    hw/tpm: Clean includes
>    hw/remote: Add missing include
>    hw/acpi/memory_hotplug: Remove unused 'hw/acpi/pc-hotplug.h' header
>    qtest: Add missing 'hw/qdev-core.h' include
>    exec/ramblock: Add missing includes
>    core/ptimers: Remove unnecessary 'sysemu/cpus.h' include
>    target: Add missing "qemu/timer.h" include
>    linux-user: Add missing "qemu/timer.h" include
>    exec/exec-all: Move 'qemu/log.h' include in units requiring it

FYI, since nobody else picked this up yet, I've added this series to my 
qtests+misc pull request today.

  Thomas


