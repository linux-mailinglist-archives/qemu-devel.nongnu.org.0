Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8678F75F7
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 15:07:08 +0100 (CET)
Received: from localhost ([::1]:53382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUALT-0008WL-V7
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 09:07:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51637)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crobinso@redhat.com>) id 1iUAKM-0007gT-H1
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 09:05:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crobinso@redhat.com>) id 1iUAKK-0002o6-Tk
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 09:05:58 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25202
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crobinso@redhat.com>) id 1iUAKK-0002mT-PZ
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 09:05:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573481156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L12RmkmNTN7CV9rL3yA2PSF247CoPVQnMQyDUeTbuG8=;
 b=Aqz33qcYxsOs56pxWXshCqxpqM9VKyxTi4b8aRg34bI8HjW1OcViHp3l+ILNL/Ob688VMU
 Wq2CHSo5ycJMlKpqS0g3cp+8C93OUFqx5encwxYhExkimt9S0jocBOjpehHzrBB52tc/zL
 RxEUwp79lEa6Egs64/GmGkZqMeSkSAI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-Bg_EgRT1OUKoAlTbyxALvQ-1; Mon, 11 Nov 2019 09:05:52 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E63A7106BF7E;
 Mon, 11 Nov 2019 14:05:51 +0000 (UTC)
Received: from [10.10.121.92] (ovpn-121-92.rdu2.redhat.com [10.10.121.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 862A910016EB;
 Mon, 11 Nov 2019 14:05:51 +0000 (UTC)
Subject: Re: [PATCH 00/55] Patch Round-up for stable 4.1.1, freeze on
 2019-11-12
To: Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20191105205243.3766-1-mdroth@linux.vnet.ibm.com>
 <fa7c8160-ac0e-ed54-ba77-2a516f08b003@redhat.com>
From: Cole Robinson <crobinso@redhat.com>
Message-ID: <cc9bab24-3539-455c-e216-64555bc8776c@redhat.com>
Date: Mon, 11 Nov 2019 09:06:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fa7c8160-ac0e-ed54-ba77-2a516f08b003@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Bg_EgRT1OUKoAlTbyxALvQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/19 9:03 AM, Cole Robinson wrote:
> On 11/5/19 3:51 PM, Michael Roth wrote:
>> Hi everyone,
>>
>> The following new patches are queued for QEMU stable v4.1.1:
>>
>>   https://github.com/mdroth/qemu/commits/stable-4.1-staging
>>
>> The release is tentatively planned for 2019-11-14:
>>
>>   https://wiki.qemu.org/Planning/4.1
>>
>> Please note that the original release date was planned for 2019-11-21,
>> but was moved up to address a number of qcow2 corruption issues:
>>
>>   https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg07144.html
>>
>> Fixes for the XFS issues noted in the thread are still pending, but will
>> hopefully be qemu.git master in time for 4.1.1 freeze and the
>> currently-scheduled release date for 4.2.0-rc1.
>>
>> The list of still-pending patchsets being tracked for inclusion are:
>>
>>   qcow2: Fix data corruption on XFS
>>     https://lists.gnu.org/archive/html/qemu-devel/2019-11/msg00073.html
>>     (PULL pending)
>>   qcow2: Fix QCOW2_COMPRESSED_SECTOR_MASK
>>     https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg07718.html
>>   qcow2-bitmap: Fix uint64_t left-shift overflow
>>     https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg07989.html
>>
>> Please respond here or CC qemu-stable@nongnu.org on any additional patch=
es
>> you think should be included in the release.
>>
>> Thanks!
>>
>=20
> Extra patches we are carrying in Fedora 31. First 2 were requested as
> fixes for gluster 4k issues. Last one fixes tests on newer kernels
>=20

Sorry, wrong commit IDs. Actual commits are

commit a6b257a08e3d72219f03e461a52152672fec0612
Author: Nir Soffer <nirsof@gmail.com>
Date:   Tue Aug 13 21:21:03 2019 +0300

    file-posix: Handle undetectable alignment

commit 3a20013fbb26d2a1bd11ef148eefdb1508783787
Author: Nir Soffer <nirsof@gmail.com>
Date:   Tue Aug 27 04:05:27 2019 +0300

    block: posix: Always allocate the first block

commit bf9e0313c27d8e6ecd7f7de3d63e1cb25d8f6311
Author: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Date:   Wed Aug 21 16:14:27 2019 +0100

    tests: make filemonitor test more robust to event ordering


Thanks,
Cole


