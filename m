Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA563AB15C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:30:12 +0200 (CEST)
Received: from localhost ([::1]:48460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltpHm-0007VX-C1
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltpFy-0005WP-K6
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 06:28:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltpFq-0004ds-O4
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 06:28:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623925689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ayXpSyu321/sISiFHDTKG1tObHBGcRmVIDKeuGs/4eM=;
 b=LX05OsxDvADJPooIPY4paT2uSZlF2g7/p5jgUufTqbgewrYxIZXPaBI0MlkGb1CGOAuWNS
 uvzEuDowkcJ2D4TrWIwZMFEXB2Acz/ccFL1i594uayXKvvj9guhIdncb77E2G8u0K8ISRz
 81r+0GCibaz5Ft/YVrtF42M3kFBE52I=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-HiqNmMJMOQ-gJWsZnSeJ8A-1; Thu, 17 Jun 2021 06:28:08 -0400
X-MC-Unique: HiqNmMJMOQ-gJWsZnSeJ8A-1
Received: by mail-ed1-f70.google.com with SMTP id
 q7-20020aa7cc070000b029038f59dab1c5so1224353edt.23
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 03:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ayXpSyu321/sISiFHDTKG1tObHBGcRmVIDKeuGs/4eM=;
 b=s/+AeKO19j5S+S1ylWuh8FVatcTPJz76HuBXdqlTgIc7uetrH4Q7B4+sblirMx+dQu
 imO0T3SB5QxWPsCLX4Rw379QG2JuvyxbJ7gGTuRjF0Uw/Ma6RqcpN/8+WV8rMKLaCAFb
 sDlVXqAtFYsykqzUpJYObmz/lNsKkgCjzWIfKhn818IfaPIxWUli6d9rrBUYOqYdRoXe
 B84g/7kavoe0fZGHgF8WEZOY9OO9bggNXoihHvHrHlYfupXiz00SHvUfptEiF99JMakL
 wzWy2ijzfx3yBhIhofNuwG+3l32JO3E4h8RTSrZMBOH/NuzuuqGbGQF/xf9zazG9OUcp
 qwPA==
X-Gm-Message-State: AOAM532oOXQZeOBSynZaUzNut/LQT249h2MlnR/SbRoPbVAyHCfbjL/U
 A65NZxQPRks+UaCddrEvvDqBc/SxA3qikaihofPJjD5OCGZZEWTrC9iV2YhtkeRoNKZp0UBdPyX
 gs80zORKnSfwmOnM=
X-Received: by 2002:a17:906:cc9b:: with SMTP id
 oq27mr4444048ejb.301.1623925687185; 
 Thu, 17 Jun 2021 03:28:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGac2bOxaixYHRvSdlVZ+zZUOjbRr86tJnRGmsIbLsU2QmSvwlWCxjKw9KY5BI51fUDINd6Q==
X-Received: by 2002:a17:906:cc9b:: with SMTP id
 oq27mr4443949ejb.301.1623925685933; 
 Thu, 17 Jun 2021 03:28:05 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n4sm3430965eja.121.2021.06.17.03.28.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 03:28:05 -0700 (PDT)
Subject: Re: [PATCH 1/3] hw/acpi: Provide stub version of
 acpi_ghes_record_errors()
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210603171259.27962-1-peter.maydell@linaro.org>
 <20210603171259.27962-2-peter.maydell@linaro.org>
 <794108a2-fbaf-dfbc-ed8f-2d3d87ba2c07@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3e6b9e75-a0b7-eb65-a357-43d0cb3a3027@redhat.com>
Date: Thu, 17 Jun 2021 12:28:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <794108a2-fbaf-dfbc-ed8f-2d3d87ba2c07@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.17, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Swetha <swjoshi@microsoft.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/06/21 20:52, Richard Henderson wrote:
> On 6/3/21 10:12 AM, Peter Maydell wrote:
>> +softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 
>> 'aml-build-stub.c', 'ghes-stub.c'))
>>   softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
>>   softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 
>> 'aml-build-stub.c',
>> -                                                  'acpi-x86-stub.c', 
>> 'ipmi-stub.c'))
>> +                                                  'acpi-x86-stub.c', 
>> 'ipmi-stub.c', 'ghes-stub.c'))
> 
> Gosh that last line is confusing.  I see it's documented in 
> build-system.rst, but yeesh.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Yeah, it's vestigial of the makefiles and I should remove it.

That said, here:

> +acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false:('ghes-stub.c'))

There's a missing "files" after if_false.

Paolo


