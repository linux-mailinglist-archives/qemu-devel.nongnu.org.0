Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBED6EAE44
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 17:48:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppsyQ-0003zn-9r; Fri, 21 Apr 2023 11:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1ppsyN-0003x9-2l
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 11:46:55 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1ppsyL-0001Ek-Hz
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 11:46:54 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-63b73203e0aso15053133b3a.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 08:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682092011; x=1684684011;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O8Uxa3S72Z9rVJkGbzw5lcDAfcOnT2b+z7l7fTJCB4c=;
 b=ihsOMH0fWijm/sJVu0GGnzsuzADh/LOO6u5xHK23wBmYToIPmhWblz1kJhu3oOjkgU
 rvnKnacUlsT4iD4r8L47X4uQcDfI12c0a5pkC1QL9U0U7+aw3PvXIU8biWUrjSTw7UtP
 hWvB8cH1pmhJAokkHo4Gae0RrbyaPFlniZeMRJNsDsbJ2N80tBb9X2ZVjGUmMYpNCNaD
 XSbqSNKLiXE0bfMEGLQEbm1yE/ZqVNdMtHE3p+yBi/V8IPyoI9SmK6z3uAMh5rgLp9jR
 ZAWTRIgtm6NSq5y3aXQaff+SFgsGM+iwSrQrbbovV3rTQHYtLu2NaCYqFuuJFn32ZYG1
 g0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682092011; x=1684684011;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O8Uxa3S72Z9rVJkGbzw5lcDAfcOnT2b+z7l7fTJCB4c=;
 b=K5Q7Mqj3f5MypWEl49zw+0KlfP8i5jWFWCT+tDgObBQRMQuqf2l2/7+iSlhEavUXAM
 Ea2CoIyB13pNPhrm0pq4RzIfzKWVLykZr0C8tWMlqdZEjreB1YF0FGI0xXX53+GRycoH
 qY9x6Fi5CkHGJgWg0WDBTyQuPFC5WaNeSN0nutD2BBtE9q2pMd3zXilSNB1breCf+g5I
 WWVeM2peHnp57qqDVQ4xInD89ondMQlKTlugVjBCr97mGJzyMEMuSYlAA6VcZK/W9Tl2
 scXLs+1wUjcgRl/rM95WHDHtGbUjGudFYR4sUvsahmo12TZiuQ9fHRW1JPwq6WzugrAl
 FzNw==
X-Gm-Message-State: AAQBX9dfTCrmG6STngoWQVJUvbir4CR9HAaEFsfUXigrx4A3RmMO0KVq
 lLRdzOIrljh89WOYaYHYoto=
X-Google-Smtp-Source: AKy350ZfS8+RF957oVF1GJyYng/VDgO9Nov+ZGxXCle9Nbn1ZQ6yvu4fC4YFvDVKrGcK1CO3z9Zieg==
X-Received: by 2002:a17:902:f686:b0:1a6:9762:6eed with SMTP id
 l6-20020a170902f68600b001a697626eedmr6702622plg.22.1682092011099; 
 Fri, 21 Apr 2023 08:46:51 -0700 (PDT)
Received: from ?IPV6:2001:ee0:4f90:ea90:2875:138:44cc:ff1f?
 ([2001:ee0:4f90:ea90:2875:138:44cc:ff1f])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a1709028f8c00b001a1a9a639c2sm2919854plo.134.2023.04.21.08.46.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 08:46:50 -0700 (PDT)
Message-ID: <2501e9a1-92e5-2e56-65f4-14de7d02ba13@gmail.com>
Date: Fri, 21 Apr 2023 22:46:44 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [REPOST PATCH v3 0/5] Support x2APIC mode with TCG accelerator
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, David Woodhouse <dwmw2@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230411142440.8018-1-minhquangbui99@gmail.com>
 <20230421035707-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Bui Quang Minh <minhquangbui99@gmail.com>
In-Reply-To: <20230421035707-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.297,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/21/23 14:57, Michael S. Tsirkin wrote:
> On Tue, Apr 11, 2023 at 09:24:35PM +0700, Bui Quang Minh wrote:
>> [Reposting due to broken threading in previous post]
>>
>> Hi everyone,
>>
>> This series implements x2APIC mode in userspace local APIC and the
>> RDMSR/WRMSR helper to access x2APIC registers in x2APIC mode. Intel iommu
>> and AMD iommu are adjusted to support x2APIC interrupt remapping. With this
>> series, we can now boot Linux kernel into x2APIC mode with TCG accelerator
>> using either Intel or AMD iommu.
>>
>> Testing the emulated userspace APIC with kvm-unit-tests, disable test
>> device with this patch
> 
> 
> Series:
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 
> any acks from tcg maintainers?

Thank you for your review. There is no ack from tcg maintainers yet.
Quang Minh.

