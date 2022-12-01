Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6250063F781
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 19:33:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0oM6-0002P9-7A; Thu, 01 Dec 2022 13:32:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0oLl-0002N7-MD
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 13:32:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0oLZ-0000T6-QJ
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 13:31:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669919501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/F+VmLboyv0AIuZDsGKjjGahwvyjS3VgvMkXfGO2uCg=;
 b=P2p4TkttTS6i4UmJSvM1Kz26wy0S9Jznhd4B3TWybXfA8ciJFBg0w8bhzwbpiGEzkTkAm7
 a2X4LBCMIJPVnsScRwx/vk7oQmMZQZ6YSaIOMfmRlybvS4h/1d11kV9JzGwJJ1GKKnyNPQ
 yNYdlfaheMWJvyGobkUQeYWohWF5Cu4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-323-z449E-mYM3ewgC6YOoFAHA-1; Thu, 01 Dec 2022 13:31:40 -0500
X-MC-Unique: z449E-mYM3ewgC6YOoFAHA-1
Received: by mail-wm1-f72.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so2900460wme.7
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 10:31:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/F+VmLboyv0AIuZDsGKjjGahwvyjS3VgvMkXfGO2uCg=;
 b=yGFowkf1Bjh1JHiUx6YoNwjqc3UYgattEMxwqXuBCEWCYctxyu3aE7Ub8QXXd0B3Rs
 8b00u/xY/D8gKDiAOjRufyTo5mxm+sPx1VLLxfm6alcUwRqJbB2t429ERyHfNfp8Cx+V
 ZYhrRXqDk1N3jTrgPpw1PJvEgy6/7GxOsgrYCbRGvEHKG/HgTEarwZfBXiSwQ0IGPgyA
 wU4RFXKPJOyW8D0My7juBE+q0Ny5E5dlYvpO89sL1qBSZtApCWj2xoTG0JKo9dt2Eo8R
 pW4WO15pNYoIDFW2MB1OWFWGH4WElhPJosq1hAZ+gG6RJuR4TPAupHfI2V+bOazOWmG4
 I+pA==
X-Gm-Message-State: ANoB5pkGl8W+cedtfJFauvhvGSX3AQDceC+p/EdtJZVZ8sZKEftDFWe3
 UOGyrDGcjUPFZUJNY7Zb4mc/zSio/ohFrhW5Q5RphrUvc4GhzKaizfJxY0BfCxzRMM/Uo6HmOfK
 Kiwxhwt9MXzvV6u+oUpGTxaHzgvlRsIWp3lWNfXH/uuDviX7oVnQG1uDOeKHTeF0=
X-Received: by 2002:a05:600c:6549:b0:3d0:5aa:b315 with SMTP id
 dn9-20020a05600c654900b003d005aab315mr47076703wmb.101.1669919499301; 
 Thu, 01 Dec 2022 10:31:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4MK0vqJ2cl/OSl/1PKb/znwjZ8FuMKQhwljEbR310NVVpeyDSYR0n+4Qzzhsswj75bjGfqzQ==
X-Received: by 2002:a05:600c:6549:b0:3d0:5aa:b315 with SMTP id
 dn9-20020a05600c654900b003d005aab315mr47076682wmb.101.1669919498973; 
 Thu, 01 Dec 2022 10:31:38 -0800 (PST)
Received: from [192.168.8.102] (tmo-073-221.customers.d1-online.com.
 [80.187.73.221]) by smtp.gmail.com with ESMTPSA id
 bg2-20020a05600c3c8200b003a3170a7af9sm7479612wmb.4.2022.12.01.10.31.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 10:31:38 -0800 (PST)
Message-ID: <119d3f62-d8db-3568-7b38-3e055bc54faf@redhat.com>
Date: Thu, 1 Dec 2022 19:31:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH for-8.0] target/s390x/tcg: Fix and improve the SACF
 instruction
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-s390x@nongnu.org
References: <20221201182729.133002-1-thuth@redhat.com>
In-Reply-To: <20221201182729.133002-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 01/12/2022 19.27, Thomas Huth wrote:
> The SET ADDRESS SPACE CONTROL FAST code has a couple of issues:
> 
> 1) The instruction is not privileged, it can be used from problem space,
> too. Just the switching to the home address space is privileged and
> should still generate a privilege exception. This bug is e.g. causing
> programs like Java that use the "getcpu" vdso kernel function to crash
> (see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=990417)
> 
> 2) If DAT is not enabled, the instruction is supposed to generate
> a special operation exception.
> 
> 3) The switch-case statement in the code hid a weird oddity: It did not
> support the secondary address space though that should be working without
> problems. But there is a "case 0x100" which means access register mode -
> and that is not implemented in QEMU yet. The code used the secondary mode
> for the access register mode instead - which seems to sufficient to make
> the Linux kernel happy that still temporarily tries to switch to the access
> register mode here and there. Anyway, let's get rid of the cumbersome
> switch-case statement and add a proper comment for the access register
> oddity to make it more clear what is going on here.

Oooops, never mind, I just missed the part in the Principles of Operations 
where this is explained: The bit ordering is different here compared to the 
bits in the PSW. Ugly. I'll rework my patch...

  Thomas


