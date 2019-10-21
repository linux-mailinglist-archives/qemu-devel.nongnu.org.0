Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5E1DE8ED
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 12:02:42 +0200 (CEST)
Received: from localhost ([::1]:36936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMUWP-0006As-7r
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 06:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39033)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iMUSe-0003wp-AN
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 05:58:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iMUSa-0007aR-Dd
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 05:58:45 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46101
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1iMUSZ-0007ZU-5X
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 05:58:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571651921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oIOAyND/cqIhkicgz2wGNT47kwnKIeHXS0PuLuEZ6oc=;
 b=GmBNLUBak9XmYDYjpxpdIaIQVhCjZ6Skm1CWdFT5lYbpICR7Vz8y3pUda597poOn4IrguQ
 TjDRPd3Cy2U5rQWrAKzr8njDK/tORP0DXAP96xUd0+4aIO6r8wg2oTxXWxAy9C756IZwjV
 Ft+fFLhB1g7PVbMoFGiZF5Gpl6FYZ4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-FP4hv41pMyGfOW0AYAOB3A-1; Mon, 21 Oct 2019 05:58:39 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89A6E476;
 Mon, 21 Oct 2019 09:58:38 +0000 (UTC)
Received: from [10.36.116.198] (ovpn-116-198.ams2.redhat.com [10.36.116.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A65521001B09;
 Mon, 21 Oct 2019 09:58:36 +0000 (UTC)
Subject: Re: [PATCH v1] s390x/kvm: Set default cpu model for all machine
 classes
From: David Hildenbrand <david@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20191021093456.6168-1-david@redhat.com>
 <96381cf8-a6cf-9583-7eb2-92ad9d333c1b@redhat.com>
 <e8ef32ee-de10-0015-6a45-de3d5bba4ff8@redhat.com>
Organization: Red Hat GmbH
Message-ID: <6404748d-1711-b6d7-f13b-10250d74dc92@redhat.com>
Date: Mon, 21 Oct 2019 11:58:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <e8ef32ee-de10-0015-6a45-de3d5bba4ff8@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: FP4hv41pMyGfOW0AYAOB3A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Jiri Denemark <jdenemar@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> query-machines probes with the "none" machine all other machines.
> Current code only fixes up the active machine.
>=20

To be more precise, libvirt probes with "-machine none,accel=3Dkvm:tcg"=20
all other machines.

> (that's why you won't notice when starting a machine - you will always
> get "host" for the active one)
>=20
>>
>> Anyway, your patch sounds fine, so (with "klass" replaced by "oc"):
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>
>=20
>=20


--=20

Thanks,

David / dhildenb


