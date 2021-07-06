Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2881F3BC7A7
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 10:10:50 +0200 (CEST)
Received: from localhost ([::1]:48250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0gAL-0007fh-54
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 04:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0g9E-0006g9-TQ
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:09:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0g99-0005ai-Fr
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:09:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625558974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3apjUO002lKlJ+HVc/mpUaSFR8VbuhO2sr6kpK81uWQ=;
 b=IAOhBdyXdEbyq1OO0EFE4HDQRee+gwaRK5c1WbYyHTjg7CCxrgsqHFvH6wuXNHGOCYdp5y
 781jK1me7/KK7kz+QIGCOANvnIDYI84ODVJDIdNIAMYYJPfin27CKgzGj6MUShZGXEQ1f3
 kvZHvZYl8IVoOj5ueAAoHwJZC8EYTVY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-yBdFJl_GNA6N19yO6gT9_g-1; Tue, 06 Jul 2021 04:09:32 -0400
X-MC-Unique: yBdFJl_GNA6N19yO6gT9_g-1
Received: by mail-wr1-f70.google.com with SMTP id
 g4-20020a5d64e40000b029013398ce8904so2229441wri.16
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 01:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3apjUO002lKlJ+HVc/mpUaSFR8VbuhO2sr6kpK81uWQ=;
 b=fD8pQik7OEHdcvkpuZBSH7sLMBclGRg5BEpWJL6P+lrZjBe/5wGqCBaaKag61xWrDq
 9/hKkTtuAcDY3lb8HHxOwWRbgFHT570YZZduSGI1BFUvoG6IQRQhaDRRaiNiNWhf9Xr+
 ZPgwG6m8mwJ9YEhIXm1R1zbHMCvBk/3/y3HjTdNFnEjl2zkGbhXeCafVFf/am3UmFwVA
 YMI2xNBl2YEgHwvkxu+z09fEoeXpCVU54Sc0d3FdU7IXmZwNJgifiQmXrgph83k/DVSj
 ZA9kx2JyniMbCKnNur0qQZKYHUlXU19qTFBCG//iGB5+n1y7T5t9akpuGhYYe+jqdtZZ
 kAiw==
X-Gm-Message-State: AOAM533yS7b7wQoJh18ul19fGm407NLgmxeYlUcGf0HvrWJ/sc+KNwSm
 v/XxE9XzMfMgE1hSmOtqNvgNN0Ny/hvcp1UUWrYNszfsCWbGPtIdWbSnnSR5bJ3MaJMJ2oXR8a2
 u8+Nug8wZ8U4/fgF0yEYxWxLYfQWiWoCdyXw4Yr/PyOa3cb85xCD7iC/KqFmQJIfdCbw=
X-Received: by 2002:a1c:9d8f:: with SMTP id g137mr3227945wme.13.1625558970606; 
 Tue, 06 Jul 2021 01:09:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcew2OZY1cES3lnu6N3Wz+zJfmIhMu8H90Mw+8a0ytstYUgXz1rfhJjRCuJaWnr8VnPiP5Tw==
X-Received: by 2002:a1c:9d8f:: with SMTP id g137mr3227920wme.13.1625558970347; 
 Tue, 06 Jul 2021 01:09:30 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n5sm7115096wri.31.2021.07.06.01.09.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 01:09:29 -0700 (PDT)
Subject: Re: [PATCH] config-host.mak: remove unused compiler-related lines
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210706072907.296061-1-pbonzini@redhat.com>
 <e53e0e67-a508-84af-70cf-552154b3501a@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c4d3516a-5788-fec5-c8fc-2051c9f46a50@redhat.com>
Date: Tue, 6 Jul 2021 10:09:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e53e0e67-a508-84af-70cf-552154b3501a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/07/21 09:37, Thomas Huth wrote:
> 
> I wasn't quite sure whether we'd still need some of those e.g. for 
> compiling capstone or dtc, but looking at meson.build again, I think 
> you're right, we're not using "make" to build those anymore, right?

Yeah, only the ROMs are built via makefiles (I'd like to reuse the 
tests/tcg machinery for them as well, but not yet).  Also 
config-host.mak is not used in submodules such as SLOF or u-boot, so 
those are safe too.

Thanks,

Paolo

> In that case:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>


