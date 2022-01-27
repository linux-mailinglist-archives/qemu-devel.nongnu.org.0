Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B79649DE64
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 10:48:03 +0100 (CET)
Received: from localhost ([::1]:55134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1Nq-0003E1-Ey
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 04:48:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1nD1L8-0000T2-OA
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:45:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1nD1L2-0001Z6-2c
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643276706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dobif/4tFyStkEqKVSqNV+rtVyIIZf9bx/o02fOQFjc=;
 b=YuCOvqGxQXFT7gCpygz/TlSEWG4bWL9Lh3VHMDk7UO1n2n+aABOxd/qiKYjnEHa+UAcz9Q
 6/SW6DbKWTVNixchfWsAC6dMQ/w6/IfAsPeCevHuHcooKVwtw3iFNohCxsfn+87MQBwij7
 yrn3LGS9gESiMQNZH8VVHfM2yLwZ5Rg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-A2FUhrQnNJW8sFOHDp6VGA-1; Thu, 27 Jan 2022 04:45:04 -0500
X-MC-Unique: A2FUhrQnNJW8sFOHDp6VGA-1
Received: by mail-ed1-f71.google.com with SMTP id
 k10-20020a50cb8a000000b00403c8326f2aso1147593edi.6
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 01:45:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Dobif/4tFyStkEqKVSqNV+rtVyIIZf9bx/o02fOQFjc=;
 b=QU+XvmNhU2b5HfuBkEwCkHuMAk5m4LLfL9nhXbG6F9HcU2G+n+EoGs6aAu4FiWYReY
 YNVqd0PVP6W4kYMpFo7gFOsynKJ8J8BqLRo0mR7gZdgILFfb8jKU/yEor6/Umam0z8Mi
 AQcaomNIgZJnwhce8DbzRClMy/cKN6D6YKDVC37LSqe2JoSOzkFpf0w52UHCAfkT3p+T
 fmXos36wDZs8FUINq06JjC+aGryFp6rxWCn3nvT4VjKnsAsOLQGIN0OzWnumWL683PZm
 i+/DOno424sklbzPLO3HaZmdsuHRPic1X6hxrxxlGsagnR6TRg3qPt4NZtnEZRSBRm0p
 wYFA==
X-Gm-Message-State: AOAM532ryZZZb7MRlmRnNJgA7SMhRCY+JwU1NZV8f8iGBC0I3PQixkIZ
 mszJOsLYvuvWuOG6Pkl9HGtcrKlA9rRs0N/OcX+nvN0v+CKY9wP6TtRKFw/1VTOYya7awUTs7ph
 57Um/3BTWWiJ/ouA=
X-Received: by 2002:a17:907:7ba9:: with SMTP id
 ne41mr2387921ejc.4.1643276703458; 
 Thu, 27 Jan 2022 01:45:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1/4KjRagXUmgKUV5X5zZ8v5oIGAv7v5xs8e0CiEq5DyYssqrhqaUwN0WZniLEkcwzVFA9fw==
X-Received: by 2002:a17:907:7ba9:: with SMTP id
 ne41mr2387913ejc.4.1643276703296; 
 Thu, 27 Jan 2022 01:45:03 -0800 (PST)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id gh14sm8436281ejb.38.2022.01.27.01.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 01:45:02 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] i386: Add support for Hyper-V Enlightened
 MSR-Bitmap feature
In-Reply-To: <20220105085704.1267530-1-vkuznets@redhat.com>
References: <20220105085704.1267530-1-vkuznets@redhat.com>
Date: Thu, 27 Jan 2022 10:45:01 +0100
Message-ID: <87bkzxh5r6.fsf@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vitaly Kuznetsov <vkuznets@redhat.com> writes:

> The new nested specific enlightenment speeds up L2 vmexits by avoiding
> unnecessary updates to L2 MSR-Bitmap. Support for both VMX and SVM is
> coming to KVM:
> https://lore.kernel.org/kvm/20211129094704.326635-1-vkuznets@redhat.com/
> https://lore.kernel.org/kvm/20211220152139.418372-1-vkuznets@redhat.com/
>

Ping)

VMX part made it to KVM in v5.17-rc1:

commit 502d2bf5f2fd7c05adc2d4f057910bd5d4c4c63e
Author: Vitaly Kuznetsov <vkuznets@redhat.com>
Date:   Mon Nov 29 10:47:04 2021 +0100

    KVM: nVMX: Implement Enlightened MSR Bitmap feature

SVM part is still pending, will likely go to 5.18. QEMU enablement code
is, however, the same.

> Vitaly Kuznetsov (2):
>   i386: Use hv_build_cpuid_leaf() for HV_CPUID_NESTED_FEATURES
>   i386: Hyper-V Enlightened MSR bitmap feature
>
>  docs/hyperv.txt                | 10 ++++++++++
>  target/i386/cpu.c              |  2 ++
>  target/i386/cpu.h              |  2 +-
>  target/i386/kvm/hyperv-proto.h |  5 +++++
>  target/i386/kvm/kvm.c          | 30 ++++++++++++++++++++++--------
>  5 files changed, 40 insertions(+), 9 deletions(-)

-- 
Vitaly


