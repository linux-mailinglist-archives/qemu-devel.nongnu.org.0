Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F9017A8F6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 16:37:47 +0100 (CET)
Received: from localhost ([::1]:51252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9sZF-0007vu-QO
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 10:37:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48712)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j9sYO-0007NU-Un
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 10:36:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j9sYN-0001d4-PZ
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 10:36:52 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52825
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j9sYN-0001bv-MA
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 10:36:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583422610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eB+L1gNv7b+d1PiIVmJQ8UPkddvEJpWARbCW9mxks78=;
 b=F4bq9jWbiUHJYDdY/zAtCrlT7tAeCLhBtgJ1sKMMidQ0MuihKgSuxTMC8sRgcBTar+nx0U
 RZBC2Iz25RHqPpHrWJTa7Mo4ZAOU6rNfrrdwwZXtfP6TjxQwOD5Oc6mISfuKmQkyfp2KiI
 /XTWQEEJzWb2eafoRqFjF6Wn79pK2QQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-Vvan60GxNIWaRm0gTyewlQ-1; Thu, 05 Mar 2020 10:36:49 -0500
X-MC-Unique: Vvan60GxNIWaRm0gTyewlQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ACF5193EF15;
 Thu,  5 Mar 2020 15:36:48 +0000 (UTC)
Received: from [10.36.116.59] (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17FFF8B75D;
 Thu,  5 Mar 2020 15:36:46 +0000 (UTC)
Subject: Re: [PULL v1 00/10] Merge TPM 2020/03/04
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200304131214.179000-1-stefanb@linux.vnet.ibm.com>
 <CAFEAcA9dW7MqCXYN6TvWiW_95BcC9K839Z=-an7hRYHvUvUJAg@mail.gmail.com>
 <32857917-279b-3f63-6c14-cb6908b93da8@redhat.com>
 <CAFEAcA-WCx1a+Ynd7BoVoSR-GuSnvmCp4DLX=pU97+-LwivS6w@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <176006b6-763f-4980-cd30-18d401a7cf0e@redhat.com>
Date: Thu, 5 Mar 2020 16:36:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-WCx1a+Ynd7BoVoSR-GuSnvmCp4DLX=pU97+-LwivS6w@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 3/5/20 4:17 PM, Peter Maydell wrote:
> On Thu, 5 Mar 2020 at 15:11, Auger Eric <eric.auger@redhat.com> wrote:
>>
>> Hi Peter, Stefan
>>
>> On 3/5/20 3:50 PM, Peter Maydell wrote:
>> I think it is an issue in
>> [PATCH v4 06/10] hw/arm/virt: vTPM support
>>
>>     TYPE_BINDING(TYPE_TPM_TIS_SYSBUS, add_tpm_tis_fdt_node),
>> is within the CONFIG_LINUX and should be outside.
>>
>> I am going to send a fix right now but I don't have any environment
>> ready to test it against make check.
> 
> It fails also on the BSD VM setups in tests/vm, which
> you can probably use to test locally.

OK thank you for the hint. Currently running it.

Best Regards

Eric
> 
> thanks
> -- PMM
> 


