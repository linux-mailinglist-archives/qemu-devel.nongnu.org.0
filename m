Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF4AE9267
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Oct 2019 22:54:04 +0100 (CET)
Received: from localhost ([::1]:34200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPZRC-0004iY-Cs
	for lists+qemu-devel@lfdr.de; Tue, 29 Oct 2019 17:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49495)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iPZOs-00036S-UO
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 17:51:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iPZOq-0000pA-9F
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 17:51:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55268
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iPZOp-0000lV-Tn
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 17:51:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572385894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ovcDOMjLXJnrP8ldWPzgZ2I34hUWCT6uC/AABU1blWU=;
 b=KoNzSh8HLfoEVZzSGjNx1eOYG7Ea8Ob0pZwnftnTKWxR8272L6BiAkHZJBsfZ5oMMKbNNA
 xUwYyQKGCry5RHrqqAMMyWTnzjv42IcACjMkxR8GJbKs5x1aQ/SuVY49Ie94SQrpe0/oXY
 CsXQuB0nYEAsC8pB2Gj/NZCYd4H4+NM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-Ps-WvZvBOzSJT_YGgzBr3w-1; Tue, 29 Oct 2019 17:51:30 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 796BE1005500;
 Tue, 29 Oct 2019 21:51:28 +0000 (UTC)
Received: from localhost.localdomain (ovpn-123-183.rdu2.redhat.com
 [10.10.123.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF97B19C69;
 Tue, 29 Oct 2019 21:51:20 +0000 (UTC)
Date: Tue, 29 Oct 2019 17:51:18 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/16] Python (acceptance tests) queue, 2019-10-28
Message-ID: <20191029215118.GA10535@localhost.localdomain>
References: <20191028235002.17691-1-crosa@redhat.com>
 <CAFEAcA9_ycm2nyJeAR-Y43VT6o6zkrUykNXJPQKYv8os107_wg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9_ycm2nyJeAR-Y43VT6o6zkrUykNXJPQKYv8os107_wg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Ps-WvZvBOzSJT_YGgzBr3w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 29, 2019 at 09:13:45PM +0000, Peter Maydell wrote:
> On Mon, 28 Oct 2019 at 23:50, Cleber Rosa <crosa@redhat.com> wrote:
> >
> > The following changes since commit aaffb853359829a37daaf883c773e8320b55=
c723:
> >
> >   Merge remote-tracking branch 'remotes/maxreitz/tags/pull-block-2019-1=
0-28' into staging (2019-10-28 14:40:01 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://github.com/clebergnu/qemu.git tags/python-next-pull-request
> >
> > for you to fetch changes up to efdb45bfd72745038909dfd1e970a827cb8d5d7e=
:
> >
> >   tests/boot_linux_console: Run BusyBox on 5KEc 64-bit cpu (2019-10-28 =
19:04:04 -0400)
> >
> > ----------------------------------------------------------------
>=20
> Hi; unless my scripts are driving gpg wrong, this seems to
> have been signed with an expired gpg key:
>=20
> gpg: Signature made Mon 28 Oct 2019 23:43:11 GMT
> gpg:                using RSA key 7ABB96EB8B46B94D5E0FE9BB657E8D33A5F209F=
3
> gpg: Good signature from "Cleber Rosa <crosa@redhat.com>" [expired]
> gpg: Note: This key has expired!
> Primary key fingerprint: 7ABB 96EB 8B46 B94D 5E0F  E9BB 657E 8D33 A5F2 09=
F3
>=20
>=20
> thanks
> -- PMM

Hi Peter,

Nothing wrong with your scripts.  I updated my key about a week ago,
but I'm almost certain that the key servers that I sent it to was
acting funky.

After some further pushes, I see it on:

  http://keys.gnupg.net/pks/lookup?op=3Dvindex&fingerprint=3Don&search=3D0x=
657E8D33A5F209F3

---

Search results for '0x657e8d33a5f209f3'
Type bits/keyID     cr. time   exp time   key expir
pub  4096R/A5F209F3 2014-10-16           =20
=09 Fingerprint=3D7ABB 96EB 8B46 B94D 5E0F  E9BB 657E 8D33 A5F2 09F3=20

uid Cleber Rosa <crosa@redhat.com>
sig  sig3  A5F209F3 2014-10-16 __________ 2019-10-15 [selfsig]
sig  sig   7657B59A 2014-10-16 __________ __________ Rud=E1 Moura <rmoura@r=
edhat.com>
sig  sig   2527436A 2019-03-05 __________ __________ Eric Blake <eblake@red=
hat.com>
sig  sig   984DC5A6 2019-03-06 __________ __________ Eduardo Habkost <ehabk=
ost@redhat.com>
sig  sig3  96799EF4 2019-03-06 __________ __________ Bandan Das <bsd@redhat=
.com>
sig  sig3  A5F209F3 2019-10-22 __________ 2024-10-20 [selfsig]

sub  4096R/5B75AD33 2014-10-16           =20
sig sbind  A5F209F3 2014-10-16 __________ 2019-10-15 []
sig sbind  A5F209F3 2019-10-22 __________ 2024-10-20 []

---

And with a fresh environment:

  $ podman run --rm -ti fedora:30
  [root@afba6c046a22 /]# gpg --search-key 657E8D33A5F209F3
  gpg: directory '/root/.gnupg' created
  gpg: keybox '/root/.gnupg/pubring.kbx' created
  gpg: data source: https://51.38.91.189:443
  (1)     Cleber Rosa <crosa@redhat.com>
            4096 bit RSA key 657E8D33A5F209F3, created: 2014-10-16, expires=
: 2024-10-20
  Keys 1-1 of 1 for "657E8D33A5F209F3".  Enter number(s), N)ext, or Q)uit >=
 1
  gpg: key 657E8D33A5F209F3: 4 signatures not checked due to missing keys
  gpg: /root/.gnupg/trustdb.gpg: trustdb created
  gpg: key 657E8D33A5F209F3: public key "Cleber Rosa <crosa@redhat.com>" im=
ported
  gpg: no ultimately trusted keys found
  gpg: Total number processed: 1
  gpg:               imported: 1

---

So I guess "all" you'd need is a refresh.  Sorry for the inconvenience,
and let me know if there's anything else I can do.

- Cleber.


