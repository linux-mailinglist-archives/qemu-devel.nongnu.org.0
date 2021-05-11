Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4AB37A665
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 14:16:27 +0200 (CEST)
Received: from localhost ([::1]:55648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgRJK-0002Q6-CF
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 08:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lgRGn-0001QR-Iv
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:13:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lgRGf-0005xy-IS
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:13:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620735216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aGVYbxoSRUQAt8YskbH5eEFWUTV/T+toHqln3Ukhhyg=;
 b=LiUhuG0y/EYkKSQ+xLxXxglOs4w6DyX3wEt6dGKVqliLQvAbXIvmLErkDWeis8i5N77fAS
 tY4NrbN8zfj+w9E9ZM5TLvqQqU7OPSMnqEWJ3pacRAddOEQsiP2znFFEcceg8/IMQLvHfy
 6j2fHSZ92/HWMPv0GXExWbVGpgDdvzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-fHV3l_G5PDW658isJICrHw-1; Tue, 11 May 2021 08:13:34 -0400
X-MC-Unique: fHV3l_G5PDW658isJICrHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D38E6D241;
 Tue, 11 May 2021 12:13:33 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-172.ams2.redhat.com
 [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E57D5D9E3;
 Tue, 11 May 2021 12:13:32 +0000 (UTC)
Date: Tue, 11 May 2021 14:13:30 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Ilya Leoshkevich
 <iii@linux.ibm.com>
Subject: Re: [PULL 0/7] s390x update
Message-ID: <20210511141330.247ea6f1.cohuck@redhat.com>
In-Reply-To: <CAFEAcA-KKTOjFxZAg5xz17SoqncGS+VwPrBevp+ShEH-0OyKAw@mail.gmail.com>
References: <20210506154423.459930-1-cohuck@redhat.com>
 <CAFEAcA-KKTOjFxZAg5xz17SoqncGS+VwPrBevp+ShEH-0OyKAw@mail.gmail.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 May 2021 13:02:08 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 6 May 2021 at 16:44, Cornelia Huck <cohuck@redhat.com> wrote:
> >
> > The following changes since commit d45a5270d075ea589f0b0ddcf963a5fea1f5=
00ac:
> >
> >   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for=
-6.1-pull-request' into staging (2021-05-05 13:52:00 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/cohuck/qemu.git tags/s390x-20210506
> >
> > for you to fetch changes up to 2337ca0dd1747851cf596e90a2360578e3f9a473=
:
> >
> >   vfio-ccw: Attempt to clean up all IRQs on error (2021-05-06 13:49:07 =
+0200)
> >
> > ----------------------------------------------------------------
> > s390x fixes and cleanups; also related fixes in xtensa and arm
> >
> > ----------------------------------------------------------------
> >
> > Eric Farman (2):
> >   vfio-ccw: Permit missing IRQs
> >   vfio-ccw: Attempt to clean up all IRQs on error
> >
> > Ilya Leoshkevich (4):
> >   target/s390x: Fix translation exception on illegal instruction
> >   target/arm: Make sure that commpage's tb->size !=3D 0
> >   target/xtensa: Make sure that tb->size !=3D 0
> >   accel/tcg: Assert that tb->size !=3D 0 after translation
> >
> > Philippe Mathieu-Daud=C3=A9 (1):
> >   hw/s390x/ccw: Register qbus type in abstract TYPE_CCW_DEVICE parent =
=20
>=20
> This asserts running x86-64 linux-user:
>=20
> /home/petmay01/linaro/qemu-for-merges/build/all-linux-static/x86_64-linux=
-user/qemu-x86_64
> -L ./gnemul/qemu-x86_64 x86_64/ls -l dummyfile
> qemu-x86_64: ../../accel/tcg/translate-all.c:1915: tb_gen_code:
> Assertion `tb->size !=3D 0' failed.
> qemu-x86_64: ../../accel/tcg/cpu-exec.c:766: cpu_exec: Assertion
> `!have_mmap_lock()' failed.
> Makefile:6: recipe for target 'test' failed
>=20
> This is for the TARGET_VSYSCALL_PAGE case in i386_tr_translate_insn(),
> which generates a zero-size TB.

Ilya, can you please take a look?


