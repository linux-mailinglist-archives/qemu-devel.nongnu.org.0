Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 483C9181CD8
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 16:50:02 +0100 (CET)
Received: from localhost ([::1]:54600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3cP-0005Py-7q
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 11:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60538)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jC3aX-0003Xx-39
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:48:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jC3aW-0001ip-2d
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:48:05 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:45313
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jC3aV-0001hP-Uw
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:48:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583941683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UcFcy+P5OSEH/ZlLu1SpwRmiQzxtCziFp2P7AeR9cGw=;
 b=Rto73vXWMmxED4p+0SVaRsEPGI1I9Rc25ARATESEZGewl+6Q+f52BcHpvmFbetjZFydQda
 iZ2pjdSzVqJZOR6PfnBfdg0kfQEPhi6NGHthZx0Mb4OLBc3tt/SD5m+Nr4YySX+jhx8+iY
 bHGkrj1YWDnKoksvH3EQhFnLnqYqjPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-l7dWPsJ1OFO0_BN3Bsfawg-1; Wed, 11 Mar 2020 11:47:59 -0400
X-MC-Unique: l7dWPsJ1OFO0_BN3Bsfawg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A78918A72A3;
 Wed, 11 Mar 2020 15:47:58 +0000 (UTC)
Received: from [10.36.118.12] (unknown [10.36.118.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EADFA60BEE;
 Wed, 11 Mar 2020 15:47:51 +0000 (UTC)
Subject: Re: [kvm-unit-tests PATCH v6 07/13] arm/arm64: ITS:
 its_enable_defaults
To: Andrew Jones <drjones@redhat.com>
References: <20200311135117.9366-1-eric.auger@redhat.com>
 <20200311135117.9366-8-eric.auger@redhat.com>
 <20200311153842.knuyqfnzqopb35gj@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <75e9a1b2-8bd1-232a-91e4-5bd606c70c1a@redhat.com>
Date: Wed, 11 Mar 2020 16:47:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200311153842.knuyqfnzqopb35gj@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, kvm@vger.kernel.org,
 maz@kernel.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 andre.przywara@arm.com, yuzenghui@huawei.com, alexandru.elisei@arm.com,
 kvmarm@lists.cs.columbia.edu, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Drew,
On 3/11/20 4:38 PM, Andrew Jones wrote:
> On Wed, Mar 11, 2020 at 02:51:11PM +0100, Eric Auger wrote:
>> +/* must be called after gicv3_enable_defaults */
>> +void its_enable_defaults(void)
>> +{
>> +	int i;
>> +
>> +	/* Allocate LPI config and pending tables */
>> +	gicv3_lpi_alloc_tables();
>> +
>> +	for (i = 0; i < nr_cpus; i++)
>> +		gicv3_lpi_rdist_enable(i);
> 
> You still haven't explained what's wrong with for_each_present_cpu.

The previous comment you did was related to a spurious change I made in
gicv3_lpi_alloc_tables. This change was removed in v5:
[kvm-unit-tests PATCH v5 05/13] arm/arm64: gicv3: Set the LPI config and
pending tables

I did not understand from your comment you wanted all locations to use
for_each_present_cpu(). I have nothing against it ;-)

 Also,
> I see you've added 'i < nr_cpus' loops in arm/gic.c too. I'd prefer we not
> assume that all cpu's are present (even though, currently, they must be),
> because we may want to integrate cpu hotplug tests with these tests at
> some point.

OK

Thanks

Eric
> 
>> +
>> +	writel(GITS_CTLR_ENABLE, its_data.base + GITS_CTLR);
>> +}
>> -- 
>> 2.20.1
>>
>>
> 


