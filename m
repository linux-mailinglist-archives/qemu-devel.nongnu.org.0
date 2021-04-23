Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F03B3691C8
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 14:12:00 +0200 (CEST)
Received: from localhost ([::1]:37972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZuf9-0004bD-99
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 08:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lZudh-0003YJ-KU
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 08:10:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lZudg-0003pw-2j
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 08:10:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619179827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ukP1hCEne8SCWd7ZkAQ/bycrNihJ5gDcFSy8nTflG4E=;
 b=FVBLZPSjcJjvZkZ856+6yVO9sIWO92ODrUI1BnjPuctH6tWXN1IHKlSvKFP2zTy7B1T5QD
 jjGlEkee9uc/KAqrrhEG/kbrI69x11ZE6QvwFusFuGEC3qBmctlnyYbWaXZ7JrkGAxYagr
 2KNBAjNMUgjjwf3WySVeRrTSeQUt6QE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-rJThXbxsP8iPjLrbDghPVw-1; Fri, 23 Apr 2021 08:10:25 -0400
X-MC-Unique: rJThXbxsP8iPjLrbDghPVw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3BE68030C9;
 Fri, 23 Apr 2021 12:10:24 +0000 (UTC)
Received: from localhost (unknown [10.40.208.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35C4860854;
 Fri, 23 Apr 2021 12:10:19 +0000 (UTC)
Date: Fri, 23 Apr 2021 14:10:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [PULL 0/2] pc: last minute bugfixes
Message-ID: <20210423141018.51ee6d97@redhat.com>
In-Reply-To: <YIKM/TmY/5AYI8JF@redhat.com>
References: <20210422222429.183108-1-mst@redhat.com>
 <YIKM/TmY/5AYI8JF@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Apr 2021 10:01:49 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Thu, Apr 22, 2021 at 06:24:48PM -0400, Michael S. Tsirkin wrote:
> > The following changes since commit d83f46d189a26fa32434139954d264326f19=
9a45:
> >=20
> >   virtio-pci: compat page aligned ATS (2021-04-06 07:11:36 -0400)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> >=20
> > for you to fetch changes up to 9106db1038bf3db5e4f8007038b3a1962018fa07=
:
> >=20
> >   x86: acpi: use offset instead of pointer when using build_header() (2=
021-04-22 18:22:01 -0400)
> >=20
> > ----------------------------------------------------------------
> > pc: last minute bugfixes
> >=20
> > Two bugfixes - both seem pretty obvious and safe ... =20
>=20
> Are they fixing regressions from the previous release, and if so
> what's the severity of them ?

 - [PULL 2/2] x86: acpi: use offset instead of pointer when using  build_he=
ader()
    * regression: no (reported on 5.1)
    * severity: qemu assert on guest boot
        could happen when configuration pushes ACPI tables blob over curren=
t limit (virt/arm had similar fix)
         (frankly speaking, why it's happening in reporter's case is still =
not clear)
      I was hoping it would get into rc4, but it missed that train,
      it probably would be fine to postpone patch to 6.1 at this point

> Regards,
> Daniel


