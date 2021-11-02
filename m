Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7526442EBC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:03:31 +0100 (CET)
Received: from localhost ([::1]:46202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtRq-0001Rx-Vz
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mhtN5-0003rt-4m
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:58:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mhtN1-0005Jw-Ke
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635857910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1NctDjfAYxjOBW0cyhhat8u0Pd9cGRth4zaMJvXE22Y=;
 b=BfIg1Kt4H0m7jQQko4jhZzcoXo0kJ6lmT3YRM+jNlrH0lT9tOAtDdOa0vLs3d6WwQ/SUcs
 rC2LC1NvrL+s5wZld37sXTBzfEe+iSoHmFe7YflfJQ98gzFENvVUg5xEXwjJBqkkrzMFrE
 vYRZmlx6qDJrPAhp7Yq+M1lN5tS4RMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-j0oPrIyQNYyAtODPX-K53A-1; Tue, 02 Nov 2021 08:58:25 -0400
X-MC-Unique: j0oPrIyQNYyAtODPX-K53A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4097D80A5C0;
 Tue,  2 Nov 2021 12:58:24 +0000 (UTC)
Received: from [10.39.192.88] (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A245104A9C1;
 Tue,  2 Nov 2021 12:58:02 +0000 (UTC)
Message-ID: <5e8c9e6a-830c-5f47-3b19-e878f021fa6f@redhat.com>
Date: Tue, 2 Nov 2021 13:58:01 +0100
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

  Hi Eric,

I tried to add this patch to my queue, but unfortunately, it fails some of 
the gitlab CI pipelines, e.g.:

  https://gitlab.com/thuth/qemu/-/jobs/1739091817#L311

  ...
  Running test qtest-x86_64/qos-test
  qemu-system-x86_64: -device virtio-iommu-pci,addr=04.0:
  pc-i440fx-6.2 machine fails to create iommu-map device tree
  bindings
  Check your machine implements a hotplug handler for the
  virtio-iommu-pci device
  Check the guest is booted without FW or with -no-acpi
  Broken pipe
  ...

Could you please have a look?

  Thanks,
   Thomas


