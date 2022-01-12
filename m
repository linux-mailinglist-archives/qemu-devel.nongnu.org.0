Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7803C48C245
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 11:27:48 +0100 (CET)
Received: from localhost ([::1]:53458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ar5-0006FG-Jk
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 05:27:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1n7anl-0003OK-7k
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:24:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1n7anj-0002EL-M3
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:24:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641983058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FW3A4IRNP8jNilVt2A6cuPNZUcWTNL+ec01VZgwQw8Q=;
 b=F7BYweqDPkEP4dDAYtuoxxHAl/F+ds7OmjGIENjg3b1bGXc9AF8q4bdYTEcVTSIM6fp1Ok
 DcVRR3m4KuYknTEkkNSSqzwNsZO59qPoz4+p4RPSAnzMiC16zCesIOIRh0lr69re3s9n5O
 mukIsDe3VnjjyfIjIIVhHCKKuuqUcRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-ehhhcrwGPJyw-rjvJ5roPQ-1; Wed, 12 Jan 2022 05:24:15 -0500
X-MC-Unique: ehhhcrwGPJyw-rjvJ5roPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CD5C10144E1;
 Wed, 12 Jan 2022 10:24:14 +0000 (UTC)
Received: from localhost (unknown [10.39.193.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65D0A6F169;
 Wed, 12 Jan 2022 10:24:00 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH RFC v2] MAINTAINERS: split out s390x sections
In-Reply-To: <aa11d65c8cb303b381c4e53aa948818b7b65a228.camel@linux.ibm.com>
Organization: Red Hat GmbH
References: <20211222105548.356852-1-cohuck@redhat.com>
 <aa11d65c8cb303b381c4e53aa948818b7b65a228.camel@linux.ibm.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Wed, 12 Jan 2022 11:23:58 +0100
Message-ID: <87r19dw8u9.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05 2022, Eric Farman <farman@linux.ibm.com> wrote:

> On Wed, 2021-12-22 at 11:55 +0100, Cornelia Huck wrote:
>> Split out some more specialized devices etc., so that we can build
>> smarter lists of people to be put on cc: in the future.
>>=20
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> Acked-by: David Hildenbrand <david@redhat.com>
>> Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
>> Acked-by: Thomas Huth <thuth@redhat.com>
>> Acked-by: Halil Pasic <pasic@linux.ibm.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>
> (Late to the party, Happy New Year!) I like the rearrangement:

Happy new year :)

>
> Acked-by: Eric Farman <farman@linux.ibm.com>
>
> Of course, you also said in v1:
>
> """
> - The new sections have inherited the maintainers of the sections
>   they have been split out of (except where people had already
>   volunteered). That's easy to change, obviously, and I hope that
>   the cc: list already contains people who might have interest in
>   volunteering for some sections.
> """
>
> As someone on cc, I could volunteer to help with these sections:
>
> S390 Machines
> -------------
> S390 Virtio-ccw
> S390 channel subsystem
>
> Devices
> -------
> virtio-ccw

Thanks!

Do you want to do a patch on top, or should I do a v3? (A separate patch
is probably better.)


