Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FB5E447A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 09:32:42 +0200 (CEST)
Received: from localhost ([::1]:56818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNu5Q-0005VN-CB
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 03:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40599)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iNtrE-0007bP-8d
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 03:18:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iNtrB-0007qT-W2
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 03:17:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44245
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1iNtrB-0007q1-Re
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 03:17:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571987876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C7tH+6dpkkfe8dCZ7Qc6pidiGZGafbF1SWrUPV57nRQ=;
 b=NQJTUALx9TkOqj5DWDZTR1PgZdfqneKu3dD+00jM1iWYsnEyuWzgqJ7ONfknzWSU8l/Oyk
 Sw4nhNw6KlNQFfMGGoD1RkxWw9/AmYC4wEpqhhq2ytyh33VSl+c1zqg8sX4JAqf1MQlKPr
 Eleoq7yzY7SrCXKyB4I5jBRX+PoC93E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-QaQH1wFzM8ic0lP4hZANcg-1; Fri, 25 Oct 2019 03:17:53 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65C20107AD31;
 Fri, 25 Oct 2019 07:17:51 +0000 (UTC)
Received: from [10.36.116.205] (ovpn-116-205.ams2.redhat.com [10.36.116.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E70B5D9CA;
 Fri, 25 Oct 2019 07:17:47 +0000 (UTC)
Subject: Re: [PATCH 0/7] i386: Add `machine` parameter to query-cpu-definitions
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20191025022553.25298-1-ehabkost@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <dbf9e4c1-0acf-9469-84f9-f80c41e2cae0@redhat.com>
Date: Fri, 25 Oct 2019 09:17:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191025022553.25298-1-ehabkost@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: QaQH1wFzM8ic0lP4hZANcg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Jiri Denemark <jdenemar@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.10.19 04:25, Eduardo Habkost wrote:
> We had introduced versioned CPU models in QEMU 4.1, including a
> method for querying for CPU model versions using

Interesting, I was not aware of that.

On s390x, we somewhat have versioned CPU models, but we decided against=20
giving them explicit names (e.g., z13-v1 or z13-4.1.0), because it=20
didn't really seem to be necessary. (and we often implement/add features=20
for older CPU models, there is a lot of fluctuation) Actually, you would=20
have had to add "z13-z/VM-x.x.x" or "z13-LPAR-x.x.x" or "z13-KVM-x.x.x"=20
to model the features you actually see in all the different virtual=20
environments ("what a CPU looks like"). Not to talk about QEMU versions=20
in addition to that. So we decided to always model what you would see=20
under LPAR and are able to specify for a KVM guest. So you can use "z13"=20
in an up-to-date LPAR environment, but not in a z/VM environment (you=20
would have to disable features).

Each (!base) CPU model has a specific feature set per machine. Libvirt=20
uses query-cpu-model-expansion() to convert this model+machine to a=20
machine-independent representation. That representation is sufficient=20
for all use cases we were aware of (esp. "virsh domcapabilities", the=20
host CPU model, migration).

While s390x has versioned CPU models, we have no explicit way of=20
specifying them for older machines, besides going over=20
query-cpu-model-expansion and using expanded "base model + features".

I can see that this might make sense on x86-64, where you only have=20
maybe 3 versions of a CPU (e.g., the one Intel messed up first -=20
Haswell, the one Intel messed up next - Haswell-noTSX, and the one that=20
Intel eventually did right - Haswell-noTSX-IBRS) and you might want to=20
specify "Haswell" vs. "Haswell-IBRS" vs. "Haswell-noTSX-IBRS". But=20
actually, you will always want to go for "Haswell-noTSX-IBRS", because=20
you can expect to run in updated environments if I am not wrong,=20
everything else are corner cases.

Of course, versioned CPU model are neat to avoid "base model + list of=20
features", but at least for expanding the host model on s390x, it is not=20
really helpful. When migrating, the model expansion does the trick.

I haven't looked into details of "how to specify or model versions".=20
Maybe IBM wants to look into creating versions for all the old models we=20
had. But again, not sure if that is of any help for s390x. CCing IBM.

> query-cpu-definitions.  This only has one problem: fetching CPU
> alias information for multiple machine types required restarting
> QEMU for each machine being queried.
>=20
> This series adds a new `machine` parameter to
> query-cpu-definitions, that can be used to query CPU model alias
> information for multiple machines without restarting QEMU.
>=20
> Eduardo Habkost (7):
>    i386: Use g_autofree at x86_cpu_list_entry()
>    i386: Add default_version parameter to CPU version functions
>    i386: Don't use default_cpu_version at "-cpu help"
>    machine: machine_find_class() function
>    i386: Remove x86_cpu_set_default_version() function
>    i386: Don't use default_cpu_version() inside query-cpu-definitions
>    cpu: Add `machine` parameter to query-cpu-definitions
>=20
>   qapi/machine-target.json                   | 14 +++-
>   include/hw/boards.h                        |  1 +
>   include/hw/i386/pc.h                       |  5 +-
>   target/i386/cpu.h                          |  6 --
>   hw/core/machine.c                          | 16 ++++
>   hw/i386/pc.c                               |  3 -
>   target/arm/helper.c                        |  4 +-
>   target/i386/cpu.c                          | 93 +++++++++++++++-------
>   target/mips/helper.c                       |  4 +-
>   target/ppc/translate_init.inc.c            |  4 +-
>   target/s390x/cpu_models.c                  |  4 +-
>   vl.c                                       | 17 +---
>   tests/acceptance/x86_cpu_model_versions.py | 42 ++++++++++
>   13 files changed, 154 insertions(+), 59 deletions(-)
>=20


--=20

Thanks,

David / dhildenb


