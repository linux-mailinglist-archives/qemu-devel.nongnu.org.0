Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EC8355BFB
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 21:07:30 +0200 (CEST)
Received: from localhost ([::1]:53022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTr2v-0002KK-IA
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 15:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lTr1n-0001nW-IZ
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 15:06:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lTr1g-00040L-J2
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 15:06:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617735968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wyaikwuhetfeXiyPQWDGFX9OZiTCFEPHIuiQbMNcdmU=;
 b=H6DiPOXs26Bw0G5qoP1rmP8GEPQyk6jqQijp0qESKv99twuFLly844FCA5Q8H6Bo1oPe14
 l+7ieJOqxr2FRiVc7xZdokOdk4LMM908hy3Ksn3Qwxb/6spkrxU/nXLf/hKy8b7DaFRI6Y
 0FIpNfdeTJg7mAG+voE4A2itb8xNjrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-rf1jNXUWMuK8RbyQ_gYLHQ-1; Tue, 06 Apr 2021 15:06:06 -0400
X-MC-Unique: rf1jNXUWMuK8RbyQ_gYLHQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1036A8189C8;
 Tue,  6 Apr 2021 19:06:06 +0000 (UTC)
Received: from localhost (unknown [10.40.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C786160C4A;
 Tue,  6 Apr 2021 19:06:00 +0000 (UTC)
Date: Tue, 6 Apr 2021 21:05:58 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Vincent Bernat <vincent@bernat.ch>
Subject: Re: [PATCH v3] hw/smbios: support for type 41 (onboard devices
 extended information)
Message-ID: <20210406210558.15749f84@redhat.com>
In-Reply-To: <m3wntkio0c.fsf@bernat.ch>
References: <20210401122658.37842-1-vincent@bernat.ch>
 <20210401225846.411ebd76@redhat.com> <m37dllk939.fsf@bernat.ch>
 <m3wntkio0c.fsf@bernat.ch>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
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
Cc: "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 02 Apr 2021 19:40:03 +0200
Vincent Bernat <vincent@bernat.ch> wrote:

>  =E2=9D=A6  1 avril 2021 23:07 +02, Vincent Bernat:
>=20
> >>> This can be invoked with:
> >>>=20
> >>>     $QEMU -netdev user,id=3Dinternet
> >>>           -device virtio-net-pci,mac=3D50:54:00:00:00:42,netdev=3Dint=
ernet,id=3Dinternet-dev \
> >>>           -smbios type=3D41,designation=3D'Onboard LAN',instance=3D1,=
kind=3Dethernet,pcidev=3Dinternet-dev =20
> >>
> >> an ACPI alternative was merged recently (current master).
> >> assigning 'designation=3D' wasn't implemented there, but important par=
t
> >> of giving users control over PCI devices 'eno' index is implemented.
> >>
> >> When I looked into the issue, smbios way was a bit over-kill for the t=
ask
> >> and didn't really work if hotplug were used.
> >>
> >> See, for example how to use new feature:
> >>  https://www.mail-archive.com/qemu-devel@nongnu.org/msg794164.html =20
> >
> > It seems simpler this way. I don't think my patch is needed then. =20
>=20
> Well, after thinking a bit, if the patch is good enough, maybe it can
> still be merged. It is fairly generic and it adds the ability to set the
> name of the card. It's not as convenient as using acpi-index, but I
> could add a note about acpi-index in the documentation to let people
> know they may prefer the simpler acpi-index?

Patch looks fine to me.
Can you fix TODO item in it (segment_group_number) on next respin, pls?

Also QEMU now is in soft-freeze, so only bug fixes got merged,
it's better to ping Michael after 6.0 is released so patch won't get lost.


