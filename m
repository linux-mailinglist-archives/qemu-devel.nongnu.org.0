Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E49017B861
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 09:38:18 +0100 (CET)
Received: from localhost ([::1]:32832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jA8Ur-0006Ro-7e
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 03:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38062)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jA8Te-0005KJ-Bt
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 03:37:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jA8Tc-00080o-Tu
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 03:37:01 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:55108
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jA8Tc-0007vJ-PE
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 03:37:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583483819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=19lh3jsSD1mF3JqH3mn55RbQxq+w9hyFeQ2KzS/qOV4=;
 b=WLMNSmlYFb63FxorJejy7H3tz0VRcWf/+8/FHJwsVv/oQpBf5hZDwknp3RjZVCSzhdsgmD
 82q1Mz7opFwuu7Q16Im0JA4ExwTo88hnGPKc+I7105244WM4XnJJddq1Hcgk9UDqVCg8Tc
 7ZKCwCf8vg6eY2776IGfZ1UIfqSdeTk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-Y-YvSTNGMAu5c4wKx8sr8Q-1; Fri, 06 Mar 2020 03:36:56 -0500
X-MC-Unique: Y-YvSTNGMAu5c4wKx8sr8Q-1
Received: by mail-wr1-f70.google.com with SMTP id n12so687233wrp.19
 for <qemu-devel@nongnu.org>; Fri, 06 Mar 2020 00:36:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=19lh3jsSD1mF3JqH3mn55RbQxq+w9hyFeQ2KzS/qOV4=;
 b=Ny3PiWDUaxp7Df12HmI7hdIMHj+wHDEMuK8gbXUSD5Z4r4hkTN0SjfYieFvQs4XHLc
 Whjhcyf9dUhWRs9a9UWU8gsoX7LZkqHPorVmW9zNPLrCxD99vHFdtWYZGnL1Iy4sO7fo
 mMyZTvI5cYshbV1RwfIvR2TwzDN5ngwEyr+VgWiKQVz18Elpqj+jKNt8vUNS1IWgamQ6
 zbQOD2xsf1MWngMsny1Mx9hdF1Bdq8OmaqE1OYlNtNroy3P/MfBqIdVFObPon88clrMG
 aIh5mD+rmQKFRRCwgUMiOuLe5V6ksq3kRJ4GHQaWcJy+dZoOuxrXuoBrbuqqjQUnshih
 nGPQ==
X-Gm-Message-State: ANhLgQ2QIKzvI1B8rP/0nlcw13om0EVFd2TOkTjwyOSDMjmtz0od3MPB
 jQ+sV/Gb/BjIeGY8Embqs+y5IqxVw+akEIWbqcgds5LO9d5mQmYn2iOIz3uozdKBAqDB/hDLZYD
 teJ3xqjWrFQR9Nj8=
X-Received: by 2002:a1c:2d4f:: with SMTP id t76mr2728271wmt.60.1583483815161; 
 Fri, 06 Mar 2020 00:36:55 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtxItmlPUu6O0jUJo8iIAucrBvT5r52QpX/m5XSThW7Yy9P48SOvKJgodt+Mi6McXCMxaj/bg==
X-Received: by 2002:a1c:2d4f:: with SMTP id t76mr2728247wmt.60.1583483814842; 
 Fri, 06 Mar 2020 00:36:54 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:b99a:4374:773d:f32e?
 ([2001:b07:6468:f312:b99a:4374:773d:f32e])
 by smtp.gmail.com with ESMTPSA id q3sm12027909wmj.38.2020.03.06.00.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2020 00:36:54 -0800 (PST)
Subject: Re: [PATCH v4 0/2] Add AVX512F optimization option and
 buffer_zero_avx512()
To: Robert Hoo <robert.hu@linux.intel.com>, qemu-devel@nongnu.org,
 richard.henderson@linaro.org, laurent@vivier.eu, philmd@redhat.com,
 berrange@redhat.com
References: <1582979675-22550-1-git-send-email-robert.hu@linux.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <912797a8-2199-dea1-61fb-970e0b24dfa7@redhat.com>
Date: Fri, 6 Mar 2020 09:36:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1582979675-22550-1-git-send-email-robert.hu@linux.intel.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: robert.hu@intel.com, chao.p.peng@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/02/20 13:34, Robert Hoo wrote:
> 1) Introduce {enable,disable}-avx512f configure option
> 
> 2) Implement new buffer_zero_avx512() with AVX512F instructions
> 
> Changes in v4:
> In init_cpuid_cache(), stringently test AVX512F OS level enablement.
> 
> Changes in v3:
> In init_accel(), init length_to_accel value in every accel case, because
> in unit test, it will be invoked several times with different accel cases.
> (Thanks Richard's careful review)
> 
> Changes in v2:
> 1. Fixes wrong definition of CACHE_SSE2 in v1.
> 2. Fixes not handle <256 length case in buffer_zero_avx512() implementaion.
> (Follow Richard's suggestion: handle the case in select_accel_fn(), and have a
> global variable alongside buffer_accel)
> 3. Changes avx512f configuration option's default status to disabled.
> 4. Ran 'make check-unit' on this patch, on both a Ivybridge machine and a
> CascadeLake machine.
> 
> 
> Robert Hoo (2):
>   configure: add configure option avx512f_opt
>   util: add util function buffer_zero_avx512()
> 
>  configure            | 41 +++++++++++++++++++++++++++++
>  include/qemu/cpuid.h |  3 +++
>  util/bufferiszero.c  | 74 +++++++++++++++++++++++++++++++++++++++++++++-------
>  3 files changed, 108 insertions(+), 10 deletions(-)
> 

Queued, thanks.

Paolo


