Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC59410F79A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 07:02:37 +0100 (CET)
Received: from localhost ([::1]:48878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ic1Ge-0000yp-Jr
	for lists+qemu-devel@lfdr.de; Tue, 03 Dec 2019 01:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50940)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ic1FN-0000U2-SG
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 01:01:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ic1FK-0005aC-IJ
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 01:01:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46944
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ic1FH-0005YJ-UV
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 01:01:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575352864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=byVU9tROsrktGG3QdCxoCJOZduMltdFsTgbyJqGKgqo=;
 b=TP/8bjvv4nJQMWBja2Y9rTG1wug/SHmSjcr1q69Ydwe7RaUJ2oXL8dp6LBDidmUYr+EIrb
 moS7fyNEXkMDM+58k4nYah9keDcDnllCMKAVw1x0R82BY77QsNjC5BJvMngGusiADsQ3N8
 d/SetHra1gVZr710imVTE2si7vIVf6A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-pUIMeJjOOz2o-ezU4OhP0Q-1; Tue, 03 Dec 2019 01:01:00 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AD7BDB67;
 Tue,  3 Dec 2019 06:00:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 641B75C290;
 Tue,  3 Dec 2019 06:00:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BD7131138606; Tue,  3 Dec 2019 07:00:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v20 0/8] Build ACPI Heterogeneous Memory Attribute Table
 (HMAT)
References: <20191129075634.682-1-tao3.xu@intel.com>
 <a31eeaf7-406f-01c4-5183-cd25835af616@intel.com>
 <20191203003445-mutt-send-email-mst@kernel.org>
Date: Tue, 03 Dec 2019 07:00:53 +0100
In-Reply-To: <20191203003445-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Tue, 3 Dec 2019 00:35:30 -0500")
Message-ID: <87y2vu7xt6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: pUIMeJjOOz2o-ezU4OhP0Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
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
Cc: "lvivier@redhat.com" <lvivier@redhat.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>, "sw@weilnetz.de" <sw@weilnetz.de>,
 Tao Xu <tao3.xu@intel.com>, "Du, Fan" <fan.du@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "Liu,
 Jingqi" <jingqi.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Tue, Dec 03, 2019 at 08:53:30AM +0800, Tao Xu wrote:
>> Hi Michael,
>>=20
>> Could this patch series be queued?
>> Thank you very much!
>>=20
>> Tao
>
> QEMU is in freeze, so not yet. Please ping after the release.

Just to avoid confusion: it's Michael's personal preference not to
process patches for the next version during freeze.  Other maintainers
do, and that's actually the project's policy:

Subject: QEMU Summit 2017: minutes
Message-ID: <CAFEAcA-b9oDkPfZbntWfhWSv1HOnbUf75p_xB_tF74h_NBGPmw@mail.gmail=
.com>
https://lists.nongnu.org/archive/html/qemu-devel/2017-11/msg04453.html

    qemu-next:
     * Problem 1: Contributors cannot get patches merged during freeze
       (bad experience)
     [...]
     * Markus Armbruster: Problem 1 is solved if maintainers keep their own
       -next trees
     * Paolo Bonzini: Maintaining -next could slow down or create work for
       -freeze (e.g. who does backports)
     * Action: Maintainers mustn't tell submitters to go away just because
       we're in a release freeze (it's up to them whether they prefer to
       maintain a "-next" tree for their subsystem with patches queued for
       the following release, or track which patches they've accepted
       some other way)
     * We're not going to have an official project-wide "-next" tree, thoug=
h

Michael, would queuing up patches in a -next branch really be too much
trouble for you?


