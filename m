Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C2E3B793B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 22:18:27 +0200 (CEST)
Received: from localhost ([::1]:41736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyKBe-0000Gq-Cj
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 16:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lyKAb-0007wo-7U
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 16:17:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lyKAZ-0005Dj-FA
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 16:17:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624997838;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3CUGT24weDdPiqi2VQ6n9fJaUaINmq2TpInvXst5jts=;
 b=U26DgVqBoS38CXUfaSPbi4FQXSPhV33nLhxjQAmydCtSQc1+A+ClC6nqd5Gxi12FapWZYF
 U1xp0Z1susTrIVGXFAcAZv8lQAcLiWAI8mI1TCwIl5FFW4PPz3Sfq3qrtRLcYC8Cz6qAWI
 s3ko7jyduOnVTooFZL5ZIQRBh9lMO8Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-Yqr1oqWeP2-BN8fArP0GbA-1; Tue, 29 Jun 2021 16:17:15 -0400
X-MC-Unique: Yqr1oqWeP2-BN8fArP0GbA-1
Received: by mail-wm1-f71.google.com with SMTP id
 o19-20020a05600c5113b02901ecf901808fso110226wms.6
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 13:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=3CUGT24weDdPiqi2VQ6n9fJaUaINmq2TpInvXst5jts=;
 b=l6+St1Ewyw72oD3IDI/pB4VR1QWApabBs5bYALggtS1/VJNR7wP1gTSTelpl5XOkxE
 f+mU81iwChDOSwEQRpPoNjsBe7mUhRyjZngv1kJKFbqPRQGG53inACK2kv+iECKptfe9
 EQY88RO/VoRQ1GOTtop20K3smzxcv0iNw+Hywhr6ECwGo6OuwWp1TqEZIrhUt5IgiaBZ
 5SXXsNQ2UBopGGCJAr8e8SoYL6CPoSCe45qYm2MAgANNaetdDIQ3Qk05YK/iazwZfBLK
 zaDY708iF81I+KS1yf9kOc9GufL650Gb4AroSZUU1BH+gMCQ1EeidU9GDDmzk4TL3IcO
 OJDQ==
X-Gm-Message-State: AOAM532QGgk7OcVk1SIx/mrcAzHII0xY9evNxM/fewXEPtixs4fsnNI0
 +J749QabzFpbOomcRAoEBFGNtj24JulyKc4+bFvsUmG5sMaibubv6+UXx5cka5OXUWvjTWmrF/A
 jdZXizwykhXJmt3I=
X-Received: by 2002:a05:600c:4843:: with SMTP id
 j3mr7698363wmo.73.1624997833975; 
 Tue, 29 Jun 2021 13:17:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjcNc3cE2pjQxTG5K5lrgjgYajgPeIl273XP29ts7sAenxtcoUgerLWEIpg0X9o7OnX/KHMw==
X-Received: by 2002:a05:600c:4843:: with SMTP id
 j3mr7698330wmo.73.1624997833624; 
 Tue, 29 Jun 2021 13:17:13 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id y14sm20919147wrq.66.2021.06.29.13.17.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 13:17:13 -0700 (PDT)
Subject: Re: [PATCH v4 0/4] avocado-qemu: New SMMUv3 and intel IOMMU tests
To: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, philmd@redhat.com,
 crosa@redhat.com, wainersm@redhat.com
References: <20210629143621.907831-1-eric.auger@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <e59e1cf9-d22e-e5f2-dfce-9997d2f61e03@redhat.com>
Date: Tue, 29 Jun 2021 22:17:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210629143621.907831-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Reply-To: eric.auger@redhat.com
Cc: wrampazz@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cleber, all,

On 6/29/21 4:36 PM, Eric Auger wrote:
> This series adds ARM SMMU and Intel IOMMU functional
> tests using Fedora cloud-init images.
>
> ARM SMMU tests feature guests with and without RIL
> (range invalidation support) using respectively fedora 33
> and 31.  For each, we test the protection of virtio-net-pci
> and virtio-block-pci devices. Also strict=no and passthrough
> modes are tested. So there is a total of 6 tests.
>
> The series applies on top of Cleber's series:
> - [PATCH 0/3] Acceptance Tests: support choosing specific
>
> Note:
> - SMMU tests 2, 3, 5, 6 (resp. test_smmu_noril_passthrough and
> test_smmu_noril_nostrict) pass but the log reports:
> "WARN: Test passed but there were warnings during execution."
> This seems due to the lack of hash when fetching the kernel and
> initrd through fetch_asset():
> WARNI| No hash provided. Cannot check the asset file integrity.
I wanted to emphasize that point and wondered how we could fix that
issue. Looks a pity the tests get tagged as WARN due to a lack of sha1.
Any advice?

Best Regards

Eric
>
> History:
> v3 -> v4:
> - I added Wainer's refactoring of KNOWN_DISTROS
> into a class (last patch) and took into account his comments.
>
> v2 -> v3:
> - Added Intel IOMMU tests were added. Different
> operating modes are tested such as strict, caching mode, pt.
>
> Best Regards
>
> Eric
>
> The series and its dependencies can be found at:
> https://github.com/eauger/qemu/tree/avocado-qemu-v4
>
> Eric Auger (3):
>   Acceptance Tests: Add default kernel params and pxeboot url to the
>     KNOWN_DISTROS collection
>   avocado_qemu: Add SMMUv3 tests
>   avocado_qemu: Add Intel iommu tests
>
> Wainer dos Santos Moschetta (1):
>   avocado_qemu: Fix KNOWN_DISTROS map into the LinuxDistro class
>
>  tests/acceptance/avocado_qemu/__init__.py | 118 +++++++++++++------
>  tests/acceptance/intel_iommu.py           | 115 +++++++++++++++++++
>  tests/acceptance/smmu.py                  | 132 ++++++++++++++++++++++
>  3 files changed, 332 insertions(+), 33 deletions(-)
>  create mode 100644 tests/acceptance/intel_iommu.py
>  create mode 100644 tests/acceptance/smmu.py
>


