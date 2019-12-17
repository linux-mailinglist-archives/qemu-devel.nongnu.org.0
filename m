Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BCB1229CD
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 12:23:43 +0100 (CET)
Received: from localhost ([::1]:39198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihAx3-0002bq-UU
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 06:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47650)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1ihAwG-0002DC-Pi
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 06:22:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1ihAwC-00059e-Oa
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 06:22:49 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25918
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1ihAwC-00056m-6a
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 06:22:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576581767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1wI/xmmxIc4bqvNqjaEUZQ4DNTHhzyeUkp8vlNpwhbE=;
 b=GXOB60zoA6YAy+AyaTSx80izPbmW0v6kVp9TakDIgsSgqmSpeBXBBPliXB1jybJoKGs1oY
 w5NdZxvr4ENZzeQYPfmFHgkwSz0kRtZWu1C4dGzmq3ggKYgwQdOKZRNHa16jkoam4z/pjq
 fTO1toaGKPYTsTGOr6rNvwy4Y5wzzec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-jq2fQ4yXP1G-pw9a-2rz3w-1; Tue, 17 Dec 2019 06:22:40 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 868E5800D4C;
 Tue, 17 Dec 2019 11:22:39 +0000 (UTC)
Received: from work-vm (ovpn-117-232.ams2.redhat.com [10.36.117.232])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B3E17C83E;
 Tue, 17 Dec 2019 11:22:38 +0000 (UTC)
Date: Tue, 17 Dec 2019 11:22:36 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, quintela@redhat.com
Subject: Re: [PULL 00/62] Misc patches for 2019-12-16
Message-ID: <20191217112236.GA2826@work-vm>
References: <1576513726-53700-1-git-send-email-pbonzini@redhat.com>
 <CAFEAcA_kFsxDKY-ktQ5E4gHxpkQq0Go38DPevKxgf3pTimRxeg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_kFsxDKY-ktQ5E4gHxpkQq0Go38DPevKxgf3pTimRxeg@mail.gmail.com>
User-Agent: Mutt/1.13.0 (2019-11-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: jq2fQ4yXP1G-pw9a-2rz3w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Mon, 16 Dec 2019 at 16:34, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > The following changes since commit 084a398bf8aa7634738e6c6c0103236ee1b3=
b72f:
> >
> >   Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-reques=
t' into staging (2019-12-13 18:14:07 +0000)
> >
> > are available in the git repository at:
> >
> >
> >   git://github.com/bonzini/qemu.git tags/for-upstream
> >
> > for you to fetch changes up to cfba0eb1146e7ccf839df29fd99cb90dd3c7640a=
:
> >
> >   colo: fix return without releasing RCU (2019-12-16 17:25:46 +0100)
> >
> > ----------------------------------------------------------------
> > * More uses of RCU_READ_LOCK_GUARD (Dave, myself)
> > * QOM doc improvments (Greg)
> > * Cleanups from the Meson conversion (Marc-Andr=E9)
> > * Support for multiple -accel options (myself)
> > * Many x86 machine cleanup (Philippe, myself)
> > * tests/migration-test cleanup (Juan)
> >
> > ----------------------------------------------------------------
>=20
> This generates a set of extra warnings from the clang runtime
> sanitizers:
>=20
> (1) in the bios-tables-test:
> MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_BINARY=3Di386-softmmu/qemu-system-i386
> QTEST_QEMU_IMG=3Dqemu-img tests/bios-tabl
> es-test -m=3Dquick -k --tap < /dev/null | ./scripts/tap-driver.pl
> --test-name=3D"bios-tables-test"
> /home/petmay01/linaro/qemu-for-merges/qom/object.c:390:16: runtime
> error: load of value 22, which is not a valid value for type 'bool'
>=20
> Looking for expected file 'tests/data/acpi/pc/FACP'
> Using expected file 'tests/data/acpi/pc/FACP'
> Looking for expected file 'tests/data/acpi/pc/APIC'
> Using expected file 'tests/data/acpi/pc/APIC'
> Looking for expected file 'tests/data/acpi/pc/HPET'
> Using expected file 'tests/data/acpi/pc/HPET'
> Looking for expected file 'tests/data/acpi/pc/FACS'
> Using expected file 'tests/data/acpi/pc/FACS'
> Looking for expected file 'tests/data/acpi/pc/DSDT'
> Using expected file 'tests/data/acpi/pc/DSDT'
> PASS 1 bios-tables-test /i386/acpi/piix4
> /home/petmay01/linaro/qemu-for-merges/qom/object.c:390:16: runtime
> error: load of value 151, which is not a valid value for type 'bool'
>=20
> (and others similar)
>=20
> and in the migration-test:
> MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_BINARY=3Di386-softmmu/qemu-system-i386
> QTEST_QEMU_IMG=3Dqemu-img tests/migration-test -m=3Dquick -k --tap <
> /dev/null | ./scripts/tap-driver.pl --test-name=3D"migration-test"
> PASS 1 migration-test /i386/migration/deprecated
> /home/petmay01/linaro/qemu-for-merges/tests/migration-test.c:689:15:
> runtime error: load of value 255, which is not a valid value for type
> 'bool'
> /home/petmay01/linaro/qemu-for-merges/tests/migration-test.c:690:16:
> runtime error: null pointer passed as argument 1, which is declared to
> never be null
> /usr/include/unistd.h:828:48: note: nonnull attribute specified here

That's a use-after-free from Juan's 'migration-test: Use a struct for
test_migrate_start parameters';  it's calling migrate_start_destroy and
then checks args->use_shmem.

Dave

> PASS 2 migration-test /i386/migration/bad_dest
> PASS 3 migration-test /i386/migration/fd_proto
> PASS 4 migration-test /i386/migration/validate_uuid
> PASS 5 migration-test /i386/migration/validate_uuid_error
>=20
> I also saw a hang in migration-test (x86 host, aarch64 guest),
> but that didn't reoccur on my rerun, so it's intermittent and
> might be present already in master.
>=20
> thanks
> -- PMM
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


