Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0CF17A897
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 16:13:02 +0100 (CET)
Received: from localhost ([::1]:50922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9sBJ-0007Z7-2k
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 10:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43797)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j9sAL-0006l5-P3
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 10:12:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j9sAJ-0001j2-Qr
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 10:12:00 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32041
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j9sAJ-0001hj-It
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 10:11:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583421118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d4S9qbCsWoD8rM63Z27mIW3K1No6Bfk4eROkJ2Zz9GQ=;
 b=OhIBUU8RSOzzRDtLLvoU2b5b2Y8CwX6oo40fUe/mryk21UvIfF/EU5GH4+g/CQS5b12+9P
 dkLNIIZmXSUMocrbNLra2K8W6inSPX/umct5NAy47v4pBW3Pht8IwqB6Aim7yqP8589X6o
 Me7K2zChsNFaTlpfn16hfR0VDbDSdPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-rvuoRA_2PX2finzVSsGo5g-1; Thu, 05 Mar 2020 10:11:56 -0500
X-MC-Unique: rvuoRA_2PX2finzVSsGo5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C24F1012070;
 Thu,  5 Mar 2020 15:11:55 +0000 (UTC)
Received: from [10.36.116.59] (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C594F177E5;
 Thu,  5 Mar 2020 15:11:54 +0000 (UTC)
Subject: Re: [PULL v1 00/10] Merge TPM 2020/03/04
To: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20200304131214.179000-1-stefanb@linux.vnet.ibm.com>
 <CAFEAcA9dW7MqCXYN6TvWiW_95BcC9K839Z=-an7hRYHvUvUJAg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <32857917-279b-3f63-6c14-cb6908b93da8@redhat.com>
Date: Thu, 5 Mar 2020 16:11:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9dW7MqCXYN6TvWiW_95BcC9K839Z=-an7hRYHvUvUJAg@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter, Stefan

On 3/5/20 3:50 PM, Peter Maydell wrote:
> On Wed, 4 Mar 2020 at 13:12, Stefan Berger <stefanb@linux.vnet.ibm.com> wrote:
>>
>> This series of patches adds support for TPM on ARM.
>>
>> Regards,
>>     Stefan
>>
>> The following changes since commit 2ac031d171ccd18c973014d9978b4a63f0ad5fb0:
>>
>>   Merge remote-tracking branch 'remotes/palmer/tags/riscv-for-master-5.0-sf3' into staging (2020-03-03 11:06:39 +0000)
>>
>> are available in the Git repository at:
>>
>>   git://github.com/stefanberger/qemu-tpm.git tags/pull-tpm-2020-03-04-1
>>
>> for you to fetch changes up to cf5b8ff14b38eb93363364635df3a0e6aa8c74e5:
>>
>>   test: tpm-tis: Add Sysbus TPM-TIS device test (2020-03-03 07:29:09 -0500)
> 
> 
> Hi; this fails 'make check' on osx hosts (possibly also elsewhere
> but that's the first build to fail):
> 
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_BINARY=aarch64-softmmu/qemu-system-aarch64
> QTEST_QEMU_IMG=qemu-img tests/qtest/arm-cpu-features -m=quick -k --tap
> < /dev/null | ./scripts/tap-driver.pl --test-name="arm-cpu-features"
> PASS 1 arm-cpu-features /aarch64/arm/query-cpu-model-expansion
> qemu-system-aarch64: -accel kvm: invalid accelerator kvm
> qemu-system-aarch64: falling back to tcg
> PASS 2 arm-cpu-features /aarch64/arm/kvm/query-cpu-model-expansion
> qemu-system-aarch64: -accel kvm: invalid accelerator kvm
> qemu-system-aarch64: falling back to tcg
> PASS 3 arm-cpu-features /aarch64/arm/kvm/query-cpu-model-expansion/sve-off
> PASS 4 arm-cpu-features /aarch64/arm/max/query-cpu-model-expansion/sve-max-vq-8
> PASS 5 arm-cpu-features /aarch64/arm/max/query-cpu-model-expansion/sve-off
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_BINARY=aarch64-softmmu/qemu-system-aarch64
> QTEST_QEMU_IMG=qemu-img tests/qtest/tpm-tis-device-test -m=quick -k
> --tap < /dev/null | ./scripts/tap-driver.pl
> --test-name="tpm-tis-device-test"
> qemu-system-aarch64: Device tpm-tis-device can not be dynamically instantiated
> Broken pipe
> /Users/pm215/src/qemu-for-merges/tests/qtest/libqtest.c:166:
> kill_qemu() tried to terminate QEMU process but encountered exit
> status 1 (expected 0)
> ERROR - missing test plan
I think it is an issue in
[PATCH v4 06/10] hw/arm/virt: vTPM support

    TYPE_BINDING(TYPE_TPM_TIS_SYSBUS, add_tpm_tis_fdt_node),
is within the CONFIG_LINUX and should be outside.

I am going to send a fix right now but I don't have any environment
ready to test it against make check.

By the way, Peter, you did not review
[PATCH v4 06/10] hw/arm/virt: vTPM support

Are you OK with it besides the above issue?

Thanks

Eric



> 
> 
> thanks
> -- PMM
> 


