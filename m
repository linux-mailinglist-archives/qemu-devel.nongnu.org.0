Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DE5355BB7
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 20:54:17 +0200 (CEST)
Received: from localhost ([::1]:44576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTqq8-0006WQ-3r
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 14:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lTqpD-00067A-8R
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 14:53:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lTqpB-0004gj-Iq
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 14:53:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617735196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WWU2L+y6T8xFj2FdfkD78M+Ura6tMW1Wx/zONmwgOT8=;
 b=FC1czz/tjhTJkqgc2Ky0HAVZdf3gpQt7BgGcxcvrZaZ5HfKPCA9tDgY8hRqxcFoMR5idDt
 /cFSKQtOsajxdBucF7TmZvwGK8rwYBdOAwltAMrV+E6TDWY/H8z3X9f6JbD/M0FiPcHvka
 dwLCqgDv0T3ezYVyVO7oYxu31L/O0MQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-RVvFUgplP7eKTHIkupWi7A-1; Tue, 06 Apr 2021 14:53:11 -0400
X-MC-Unique: RVvFUgplP7eKTHIkupWi7A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32CDA801FCE;
 Tue,  6 Apr 2021 18:53:10 +0000 (UTC)
Received: from localhost (unknown [10.40.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A10B10023AC;
 Tue,  6 Apr 2021 18:53:09 +0000 (UTC)
Date: Tue, 6 Apr 2021 20:53:07 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Christian Ehrhardt =?UTF-8?B?7oO/?= <1915063@bugs.launchpad.net>
Subject: Re: [Bug 1915063] Re: Windows 10 wil not install using
 qemu-system-x86_64
Message-ID: <20210406205307.755aec52@redhat.com>
In-Reply-To: <161746873353.29047.7907960307448967364.malone@gac.canonical.com>
References: <161281335451.16853.7070328699645987751.malonedeb@wampee.canonical.com>
 <161746873353.29047.7907960307448967364.malone@gac.canonical.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 03 Apr 2021 16:52:13 -0000
Christian Ehrhardt =EE=83=BF <1915063@bugs.launchpad.net> wrote:

> That is awesome David,
> qemu64 is like a very low common denominator with only very basic CPU fea=
tures.
> While "copy host" means "enable all you can".

Also it's worth to try setting real CPU topology for if EPYC cpu model is u=
sed.
i.e. use -smp with options that resemble a real EPYC cpu
(for number of core complexes is configured with 'dies' option in QEMU)


> We can surely work with that a bit, but until I get access to the same
> HW I need you to do it.
>=20
>
> If you run in a console `$virsh domcapabilities` it will spew some XML at=
 you. One of the sections will be for "host-model". In my case that looks l=
ike
>=20
>     <mode name=3D'host-model' supported=3D'yes'>
>       <model fallback=3D'forbid'>Skylake-Client-IBRS</model>
>       <vendor>Intel</vendor>
>       <feature policy=3D'require' name=3D'ss'/>
>       <feature policy=3D'require' name=3D'vmx'/>
>       <feature policy=3D'require' name=3D'hypervisor'/>
> ...
>     </mode>
>=20
>=20
> That means a names CPU type (the one that is closest to what you have) an=
d some feature additionally enabled/disabled.
>=20
> If you could please post the full output you have, that can be useful.
> >From there you could go two steps. =20
> 1. as you see in my example it will list some cpu features on top of the =
named type.
>    If you remove them one by one you might be able to identify the single=
-cpu featute
>    that breaks in your case.
> 2. The named CPU that you have also has a representation, it can be found=
 in
>    /usr/share/libvirt/cpu_map...
>    That ill list all the CPU features that make up the named type.
>    If #1 wasn't sufficient, you can now add those to your guest definitio=
n one by one in disabled=20
>    state, example
>     <feature policy=3D'disable' name=3D'ss'/>
>=20
> A description of the underlying mechanism is here
> https://libvirt.org/formatdomain.html#cpu-model-and-topology
>=20


