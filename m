Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D4010521C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 13:16:13 +0100 (CET)
Received: from localhost ([::1]:39512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXlNb-0005o4-Lz
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 07:16:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43930)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iXlMV-0005K2-2U
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 07:15:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iXlMS-0005Ed-IR
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 07:15:01 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:58136
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1iXlMS-0005E6-BX
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 07:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574338499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPPQ+s+5vOi2Vmd9q9RFDv+JMTC+2jkvktldLmnSFYQ=;
 b=d44ULUky6CpW7xGqrLIYzQ4nQeXCDlxE42eezwta/Ew8CdXAiZwtVhLI5cDRVea2XNpmdp
 +044JaiurS+oypumY71aUq9WNztZBviGUMGr1J7Fhlw2r1098GnmktTIuBJZ5N72VzzFEU
 z6Jgme52uWYLjK66G6cuM1JvZ5olrYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-ZH6BfruuPviql526b-6p9g-1; Thu, 21 Nov 2019 07:14:56 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26F4E1883523;
 Thu, 21 Nov 2019 12:14:55 +0000 (UTC)
Received: from [10.36.116.214] (ovpn-116-214.ams2.redhat.com [10.36.116.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8022E60138;
 Thu, 21 Nov 2019 12:14:53 +0000 (UTC)
Subject: Re: [PATCH 11/15] RFC: s390x: Exit on vcpu reset error
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20191120114334.2287-1-frankja@linux.ibm.com>
 <20191120114334.2287-12-frankja@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <09359386-a91b-d98c-08f5-5b375f0bd942@redhat.com>
Date: Thu, 21 Nov 2019 13:14:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191120114334.2287-12-frankja@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: ZH6BfruuPviql526b-6p9g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, cohuck@redhat.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.11.19 12:43, Janosch Frank wrote:
> If a vcpu is not properly reset it might be better to just end the VM.
>=20
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>   target/s390x/kvm.c | 2 ++
>   1 file changed, 2 insertions(+)
>=20
> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
> index 190400df55..0210b54157 100644
> --- a/target/s390x/kvm.c
> +++ b/target/s390x/kvm.c
> @@ -418,11 +418,13 @@ static void kvm_s390_reset_vcpu(S390CPU *cpu, unsig=
ned long type)
>           if (kvm_vcpu_ioctl(cs, KVM_S390_VCPU_RESET, type)) {
>               error_report("CPU reset type %ld failed on CPU %i",
>                            type, cs->cpu_index);
> +            exit(1);
>           }
>           return;
>       }
>       if (kvm_vcpu_ioctl(cs, KVM_S390_INITIAL_RESET, NULL)) {
>           error_report("Initial CPU reset failed on CPU %i", cs->cpu_inde=
x);
> +        exit(1);
>       }
>   }
>  =20
>=20

According to the comment in include/qapi/error.h

"Please don't error_setg(&error_fatal, ...), use error_report() and=20
exit(), because that's more obvious."

This is the right thing to do.

... and it's a fairly pathological thing to happen either way.

Reviewed-by: David Hildenbrand <david@redhat.com>

--=20

Thanks,

David / dhildenb


