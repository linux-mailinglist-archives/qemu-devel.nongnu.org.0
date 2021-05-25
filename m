Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1326138FC4C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 10:10:41 +0200 (CEST)
Received: from localhost ([::1]:45778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llS99-0007Jo-C3
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 04:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1llS5p-0003Di-8K
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:07:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1llS5k-0003TP-KC
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621930025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iWd/Tpnq4ZbbDHPBRZAYyFTlVp9IR0rPvfsUGivHDIs=;
 b=JyjxMQq0ZHFJXrwpTmxM19j/yknm3Dk/voVEdILNOu7+wbXLEhdYYHZZA2DTQQuevkEA97
 VvW5CdFoRmhxRHJ0RxGmiWDxBApWwfYki/yDNRSidxkKLPttAcysh8ZXSaznB+BQ3zDk8x
 YcaZlB8KjxRkx/l1Xk9U/uF49Fw72pI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-S7y9sqamMqWhdr8Ffu9kYA-1; Tue, 25 May 2021 04:07:01 -0400
X-MC-Unique: S7y9sqamMqWhdr8Ffu9kYA-1
Received: by mail-wr1-f71.google.com with SMTP id
 u20-20020a0560001614b02901115c8f2d89so14078692wrb.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 01:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=iWd/Tpnq4ZbbDHPBRZAYyFTlVp9IR0rPvfsUGivHDIs=;
 b=r//vvwdHc2vDC6PBH/WXjgRXUBxJsZ+mLe46Kh59IZkmiaeRmOrtbfNfsmHGjHB4zZ
 +4gg6PSeQZNr8Xyrk2K7uLG7d4439Q/4EbwGDk5kbLLERw/KByAAYgDU2r894mYs2X0g
 kQP4pKsrYZ5JrGqNIjVcb8Ze3h131SamEL2tuBXoxBR9+EwqYm0rEddcL/qd4oyLmacL
 vog1xn6NDOMfhUdkqhm08PiCeB423RS94zI2qhc35YmKG/gknm6EefGpt6WdjTlEr4eN
 ChqgU48UvINf4rEUTpyOrwdkbI/YAqUNr4/l4dU6zQmaUrTG4cBpD6W+l9cJglXwpuMT
 3urg==
X-Gm-Message-State: AOAM533xotkjnWw1h6qgw0j+4Vd+dbG/fGYpvRaOWnnidb91TGMR4mk/
 V4Xfx0c/eiHQM7LfQjZ+N2K+45yZqs7tzQ3wDNOQDTZw2CJn0OgC/p1vbUa4X8yxxBb4Q2QKPBi
 IeXMF7faczJy2SvM=
X-Received: by 2002:a1c:98c6:: with SMTP id a189mr2629994wme.178.1621930020383; 
 Tue, 25 May 2021 01:07:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJym9HNrFOkJ0Zlk+Hy+MpzbRvuyQ4N1Ei5q9EaKMiDEqG5m1HXvhiNzpF5PRCotF5EyYa5fBg==
X-Received: by 2002:a1c:98c6:: with SMTP id a189mr2629973wme.178.1621930020191; 
 Tue, 25 May 2021 01:07:00 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f38:2400:62f4:c5fa:ba13:ac32?
 (p200300d82f38240062f4c5faba13ac32.dip0.t-ipconnect.de.
 [2003:d8:2f38:2400:62f4:c5fa:ba13:ac32])
 by smtp.gmail.com with ESMTPSA id m9sm14966826wrq.78.2021.05.25.01.06.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 01:06:59 -0700 (PDT)
Subject: Re: [PATCH for-6.0 v1 0/3] softmmu/physmem: shared anonymous memory
 fixes
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20210406080126.24010-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <9f1ece73-2a1d-8454-c1f5-cbbb108604fd@redhat.com>
Date: Tue, 25 May 2021 10:06:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210406080126.24010-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.04.21 10:01, David Hildenbrand wrote:
> Fixes related to shared anonymous memory, previously sent as part of
>      https://lore.kernel.org/r/20210319101230.21531-1-david@redhat.com
> 

Peter, Eduardo, Michael, David, Paolo,

can someone please pick this up?

Thanks

> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> 
> David Hildenbrand (3):
>    softmmu/physmem: Mark shared anonymous memory RAM_SHARED
>    softmmu/physmem: Fix ram_block_discard_range() to handle shared
>      anonymous memory
>    softmmu/physmem: Fix qemu_ram_remap() to handle shared anonymous
>      memory
> 
>   softmmu/physmem.c | 23 ++++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)
> 
> 
> base-commit: ee82c086baaa534d1af26cb8b86e86fb047af918
> 


-- 
Thanks,

David / dhildenb


