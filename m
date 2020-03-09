Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB19117DCF3
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 11:09:19 +0100 (CET)
Received: from localhost ([::1]:39956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBFLa-0008Iq-Nj
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 06:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34876)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jBFHv-00033f-9w
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 06:05:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jBFHu-0008Vu-8t
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 06:05:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25525
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jBFHu-0008Vf-4A
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 06:05:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583748329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rPHjQmc4lUQZyXMAjqIZw++pTTrMFhHq9xmNp/wY6rI=;
 b=hLHw/9RDHQr7n15qILI3bBCcka4+VKruo9zLsHUKtipftv8R8rOxjOO3eKXvzT+ZaXMB/u
 R+YqNynSKy6Jdwt2B+xOhfNN9YGGAMiKKYcPdpvPwRLXrAUytgaKzRympx1IqgVyU9HKXl
 Sp+Zsp0WcpHHxShK4J94z2OKHygc358=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-P-ae4Tr4N1ur5lkyE6lqTA-1; Mon, 09 Mar 2020 06:05:28 -0400
X-MC-Unique: P-ae4Tr4N1ur5lkyE6lqTA-1
Received: by mail-wr1-f71.google.com with SMTP id y5so4303276wrq.8
 for <qemu-devel@nongnu.org>; Mon, 09 Mar 2020 03:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rPHjQmc4lUQZyXMAjqIZw++pTTrMFhHq9xmNp/wY6rI=;
 b=PIqpAaOsoYRm0JbwAzs+APb6WnPjySaA8cTzL1fWKZX/ECn2qV8yCdy3PSRP1F89hQ
 7xIsRTpak0x1BFPGQJVAL6QN2T3Wzy+an3i14MTvW9IVDSKUBSnsf5hBjj94eqiNGRPs
 4RQlM3Lw780L/P/c5QXN1t2AiyzlP1DIhQjxywHxOofUgBrYWYPezpr893LfDzWLDwIO
 YeIrhs/7tGg9wgVvnxCIgb8binkzs6MERmo2o1XIeNNkgraUqmKLj7NF2xYZnaz9j9i6
 iQ5vy5Xr8jljA0gFQD1ilw0SHTMA81y+A3O4PXsNvUn6sLH7kEVCyBvLFsfOf8oJTDjA
 wRiw==
X-Gm-Message-State: ANhLgQ3mBPPJ4YEbik9xScnnQ3mEjgoHM3qV/0wcrPgaC4mWRoVcQw6u
 5kVSAjnQg5c7A5rURW9pZiQ3T6DtIISkt+utR41H4+XJ44eiCt8D/ynbadAV5vLNRhjzAh+IRmY
 ImKZH7MyK8+Hj1HM=
X-Received: by 2002:a5d:4683:: with SMTP id u3mr706421wrq.251.1583748327021;
 Mon, 09 Mar 2020 03:05:27 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuDZd6rRLHVIFsPxktHpYN0c1Ua6WuWD4uHLNuPHP8lFKPd/QcKWxiF8ixR10Ze/rLnfTAidQ==
X-Received: by 2002:a5d:4683:: with SMTP id u3mr706408wrq.251.1583748326836;
 Mon, 09 Mar 2020 03:05:26 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:f1b5:9f9:3125:2a5a?
 ([2001:b07:6468:f312:f1b5:9f9:3125:2a5a])
 by smtp.gmail.com with ESMTPSA id v2sm21656657wme.2.2020.03.09.03.05.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2020 03:05:26 -0700 (PDT)
Subject: Re: [PATCH] mem-prealloc: initialize cond and mutex
To: Igor Mammedov <imammedo@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20200306085014.120669-1-borntraeger@de.ibm.com>
 <20200309110331.3ef650a9@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <13a05c3e-e374-8411-952d-05f4312ad6c0@redhat.com>
Date: Mon, 9 Mar 2020 11:05:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309110331.3ef650a9@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, Marc Hartmayer <mhartmay@linux.ibm.com>,
 qemu-devel <qemu-devel@nongnu.org>, bauerchen <bauerchen@tencent.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/20 11:03, Igor Mammedov wrote:
>> +    qemu_cond_init(&page_cond);
>> +    qemu_mutex_init(&page_mutex);
> Is it possible for touch_all_pages to be called several times?
> If it's then it probably needs a guard against that to make
> sure it won't explode, something like:
> 
> static bool page_mutex_inited;
> 
> if(page_mutex_inited)
>   page_mutex_inited = true
>   qemu_mutex_init(&page_mutex) 
>   ...
> 

Hmm, good idea, it should also use GOnce.

Paolo


