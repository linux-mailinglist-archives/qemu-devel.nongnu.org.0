Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68538442F23
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:36:27 +0100 (CET)
Received: from localhost ([::1]:42266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtxi-0004ex-AI
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mhtwZ-00035C-Ct
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:35:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mhtwU-0000I7-BY
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:35:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635860108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1jX0R7A+poKwZvdU2L1Y9bmWVQoCycDhwjwvtD18mrs=;
 b=EQRc4XAAeY8LnsyTzQmtX+Pox0wM52TlRwfBaymgRI8v2kgVaZHu8AS2yAK2utI2f4MZv+
 mph2vSCLIG7KJ304d7TQRCP6TZKrB9S30aGFF7rNk/DDskWNoolV9ZHsETr65RmxhifLXr
 V0YLbUEsak9TYyggWqUTE/yswvWZ5Mw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-SOu_B0WDPja_8Vksk-A06w-1; Tue, 02 Nov 2021 09:35:04 -0400
X-MC-Unique: SOu_B0WDPja_8Vksk-A06w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D6F5802682;
 Tue,  2 Nov 2021 13:35:03 +0000 (UTC)
Received: from [10.39.192.88] (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EE5B19723;
 Tue,  2 Nov 2021 13:34:47 +0000 (UTC)
Message-ID: <ab71888b-fd72-4b08-0d36-4add85ba6278@redhat.com>
Date: Tue, 2 Nov 2021 14:34:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5] tests: qtest: Add virtio-iommu test
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, jean-philippe@linaro.org
References: <20211101184858.15223-1-eric.auger@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211101184858.15223-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/11/2021 19.48, Eric Auger wrote:
> Add the framework to test the virtio-iommu-pci device
> and tests exercising the attach/detach, map/unmap API.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> ---
> 
> v4 -> v5:
> - remove printf and move a comment
> - Added Jean-Philippe's T-b and R-b
> ---
>   tests/qtest/libqos/meson.build    |   1 +
>   tests/qtest/libqos/virtio-iommu.c | 126 ++++++++++++
>   tests/qtest/libqos/virtio-iommu.h |  40 ++++
>   tests/qtest/meson.build           |   1 +
>   tests/qtest/virtio-iommu-test.c   | 326 ++++++++++++++++++++++++++++++
>   5 files changed, 494 insertions(+)
>   create mode 100644 tests/qtest/libqos/virtio-iommu.c
>   create mode 100644 tests/qtest/libqos/virtio-iommu.h
>   create mode 100644 tests/qtest/virtio-iommu-test.c

There's another failure on Travis-CI:

  https://app.travis-ci.com/github/huth/qemu/jobs/546268575#L7240

  ERROR:../tests/qtest/virtio-iommu-test.c:38:pci_config:
  assertion failed (domain_range_end == 32): (536870912 == 32)

536870912 is 0x20000000, so this is likely an endianess issue?

  Thomas


