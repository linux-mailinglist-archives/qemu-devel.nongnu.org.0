Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E3735DA9D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 11:04:37 +0200 (CEST)
Received: from localhost ([::1]:45576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWEyJ-0002TL-Jl
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 05:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lWExH-0001jx-F8
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:03:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lWExE-0005xt-Q1
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:03:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618304607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rXiI4LsD/Fcjk5/iIYvpUD7CgcEr3pwyX3vWkVfjR4o=;
 b=H5YXj6LBOd59QA0lZQkd5fJVyZytQsYUAPi5hlMKo4OwU3QudHVwlcntZF8ZVlFw68TvYz
 whbJWmw/XGhaxIDLjOf4nLf8l4/tAAWIieVX9EDH53kTt7z5zHZvhJJ+d2IK8a0fZhwrAT
 v2Lbxog0t768nJGnh7vqrFXi/LltbKo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-q2gW6l3aN0-ib3YRAdc4eA-1; Tue, 13 Apr 2021 05:03:23 -0400
X-MC-Unique: q2gW6l3aN0-ib3YRAdc4eA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F38487A82A;
 Tue, 13 Apr 2021 09:03:22 +0000 (UTC)
Received: from localhost (unknown [10.40.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA8685C239;
 Tue, 13 Apr 2021 09:03:21 +0000 (UTC)
Date: Tue, 13 Apr 2021 11:03:20 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ed Davison <1923497@bugs.launchpad.net>
Subject: Re: [Bug 1923497] [NEW] bios_linker_loader_add_checksum: Assertion
 `start_offset < file->blob->len' failed
Message-ID: <20210413110320.7e67c2bb@redhat.com>
In-Reply-To: <161825934506.9582.2393035423485633300.malonedeb@chaenomeles.canonical.com>
References: <161825934506.9582.2393035423485633300.malonedeb@chaenomeles.canonical.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 12 Apr 2021 20:29:04 -0000
Ed Davison <1923497@bugs.launchpad.net> wrote:

> Public bug reported:
> 
> Trying boot/start a Windows 10 VM.  Worked until recently when this
> error started showing up.
> 
> I have the following installed on Fedora 33:
> qemu-kvm-5.1.0-9.fc33.x86_64

Could you add used QEMU command line in your case?

> 
> This is the error:
> 
> Error starting domain: internal error: process exited while connecting
> to monitor: qemu-system-x86_64: /builddir/build/BUILD/qemu-5.1.0/hw/acpi
> /bios-linker-loader.c:239: bios_linker_loader_add_checksum: Assertion
> `start_offset < file->blob->len' failed.
> 
> Traceback (most recent call last):
>   File "/usr/share/virt-manager/virtManager/asyncjob.py", line 65, in cb_wrapper
>     callback(asyncjob, *args, **kwargs)
>   File "/usr/share/virt-manager/virtManager/asyncjob.py", line 101, in tmpcb
>     callback(*args, **kwargs)
>   File "/usr/share/virt-manager/virtManager/object/libvirtobject.py", line 57, in newfn
>     ret = fn(self, *args, **kwargs)
>   File "/usr/share/virt-manager/virtManager/object/domain.py", line 1329, in startup
>     self._backend.create()
>   File "/usr/lib64/python3.9/site-packages/libvirt.py", line 1234, in create
>     if ret == -1: raise libvirtError ('virDomainCreate() failed', dom=self)
> libvirt.libvirtError: internal error: process exited while connecting to monitor: qemu-system-x86_64: /builddir/build/BUILD/qemu-5.1.0/hw/acpi/bios-linker-loader.c:239: bios_linker_loader_add_checksum: Assertion `start_offset < file->blob->len' failed.
> 
> I see this were referenced in a patch from some time ago and supposedly
> fixed.  Here is the patch info I was able to find:
> 
> http://next.patchew.org/QEMU/1515677902-23436-1-git-send-email-
> peter.maydell@linaro.org/1515677902-23436-10-git-send-email-
> peter.maydell@linaro.org/
> 
> ** Affects: qemu
>      Importance: Undecided
>          Status: New
> 


