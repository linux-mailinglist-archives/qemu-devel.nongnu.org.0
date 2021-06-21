Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9D73AE54A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:52:00 +0200 (CEST)
Received: from localhost ([::1]:49496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvFex-0004We-IC
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvFdj-0003oi-04
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:50:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvFdh-0004lP-77
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:50:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624265440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=35cVI1MWh1Csbl3Zzmx3ebFqnff/g/R/Ir7RJzovRjo=;
 b=OaGEJSF+TqF4jFk1fWzo+BefWp0hmYqXdk7hF+3nM7cd3X/hgmTPOFxscNcH2VmWzTKDJc
 TuQKj/uyN8JONskWH/CowKgUMEcN5cINsXjtaLNMLKX0KPXGEmkRANSxuVzGowv/57D+KU
 0/oLNG+aNfRcWX2h7nec5MT20F0SFP0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-9uMtUtM7OSKNOgyhJUv4Nw-1; Mon, 21 Jun 2021 04:50:37 -0400
X-MC-Unique: 9uMtUtM7OSKNOgyhJUv4Nw-1
Received: by mail-wm1-f69.google.com with SMTP id
 v25-20020a1cf7190000b0290197a4be97b7so6732362wmh.9
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 01:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=35cVI1MWh1Csbl3Zzmx3ebFqnff/g/R/Ir7RJzovRjo=;
 b=h8NKyy6f9gc9oi2bjymoVHZELVzIyZqAK3ZLxXDVHHfaH48BuqrcIux47ew0EIPHkN
 q5PVxFxtSGHPJp4B3ktAMPlOEUpfjqJ/TO1+MhdlUJbXfDLsGOqXAzUMgOgJYDNDHgUv
 DLm0AXX3Atz0HTP+M3repZMYAIau1WavPGtsw2kHNCfjwyp5wHzn+QqG1l9MVv+KfK6t
 Tp7KAxjyW1P0SVH3CfS4r2EtFg+hHW73RhkiOLtoGWx5Km2MitaDFomYv7KEBvRBt2uS
 O3Crr/5dd1Qpg8P0h7egZnUWYMi+5oHpKPAN+FrjkrpWlzpVJOhJ5FhO4/v8mhUdO+li
 Ls4A==
X-Gm-Message-State: AOAM531byEPVeNHaiAaaEM4t2ee48B4ucXb14OFTLoPOwLsuaZis3RCR
 mWevv8ZORtBAGKCU9d3b1nJ1KCxILXHUR6JwprF1osJqsXastTIb3ywHod5cxYuv6X1hIINWWVm
 cRtlpJUxAsuu2mxM=
X-Received: by 2002:a1c:98d5:: with SMTP id a204mr25215879wme.43.1624265436707; 
 Mon, 21 Jun 2021 01:50:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvqPntkgadh5kRnegslUAvqxfYUoOCOszT63ARl+E/fekKul3jQlaEFDlc2xN15G/jelGH8w==
X-Received: by 2002:a1c:98d5:: with SMTP id a204mr25215862wme.43.1624265436522; 
 Mon, 21 Jun 2021 01:50:36 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id 4sm16251676wry.74.2021.06.21.01.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 01:50:36 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] avocado-qemu: New SMMUv3 and intel IOMMU tests
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com
References: <20210621080824.789274-1-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7b05cff7-c110-f756-f9e4-e2c6b520e9de@redhat.com>
Date: Mon, 21 Jun 2021 10:50:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210621080824.789274-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: peterx@redhat.com, crosa@redhat.com, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>, wainersm@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Willian

On 6/21/21 10:08 AM, Eric Auger wrote:
> This series adds ARM SMMU and Intel IOMMU functional
> tests using Fedora cloud-init images.
> 
> ARM SMMU tests feature guests with and without RIL
> (range invalidation support) using respectively fedora 33
> and 31.  For each, we test the protection of virtio-net-pci
> and virtio-block-pci devices. Also strict=no and passthrough
> modes are tested. So there is a total of 6 tests.
> 
> Compared to v2, Intel IOMMU tests were added. Different
> operating modes are tested such as strict, caching mode, pt.
> 
> The series applies on top of Cleber's series:
> - [PATCH 0/3] Acceptance Tests: support choosing specific
> 
> Best Regards
> 
> Eric
> 
> The series and its dependencies can be found at:
> https://github.com/eauger/qemu/tree/avocado-qemu-v3
> 
> 
> Eric Auger (3):
>   Acceptance Tests: Add default kernel params and pxeboot url to the
>     KNOWN_DISTROS collection
>   avocado_qemu: Add SMMUv3 tests
>   avocado_qemu: Add Intel iommu tests
> 
>  tests/acceptance/avocado_qemu/__init__.py |  52 ++++++++-
>  tests/acceptance/intel_iommu.py           | 115 +++++++++++++++++++
>  tests/acceptance/smmu.py                  | 133 ++++++++++++++++++++++
>  3 files changed, 298 insertions(+), 2 deletions(-)
>  create mode 100644 tests/acceptance/intel_iommu.py
>  create mode 100644 tests/acceptance/smmu.py
> 


