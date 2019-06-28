Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A69A59C95
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 15:08:06 +0200 (CEST)
Received: from localhost ([::1]:59584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgqbl-0006EQ-CV
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 09:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40197)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <fam@euphon.net>) id 1hgqDg-00059k-QD
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 08:43:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fam@euphon.net>) id 1hgqDd-0008Mk-1C
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 08:43:10 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17946
 helo=sender1.zoho.com.cn)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fam@euphon.net>) id 1hgqDZ-0008C2-FX
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 08:43:07 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1561725685; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=YbJp6WuuqjjImoJaedDcAilxyZWsDGRlUJur43X045oMG02KupTAb/3+sV9j1+R3sNPQKCaw2gRjS4rR+hFAaIBnb4seoSaKy0AcqAbJf548XiTpbebL77ybpUlzd1vgSHrXEvmr/gdNLhnWnF9d9i+0fiD2D3kaqoJQ+eyjWm4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1561725685;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To:ARC-Authentication-Results;
 bh=okssoxUiTUCe7QEbtOsi21uAvwu3qEkBpeMnTblubtw=; 
 b=EaFceqaqyCEDGOrzmhGtTtPc/AajHgKca6Q+yc4qdg6TUh2QG7cE5jUDnvtcyd4vgwlysLWGYENWiHSLyvZQhCrTxIEt0juwLr0CUwY8hMYQHkBWfuzna0H77Dh32U14PaUlDjXBJYXJkM1Ncmk1z3Czfzsv50BsaF31IGg4T8k=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=euphon.net;
 spf=pass  smtp.mailfrom=fam@euphon.net;
 dmarc=pass header.from=<fam@euphon.net> header.from=<fam@euphon.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1561725685; 
 s=zoho; d=euphon.net; i=fam@euphon.net;
 h=Date:From:To:Cc:Message-ID:Subject:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
 l=1537; bh=okssoxUiTUCe7QEbtOsi21uAvwu3qEkBpeMnTblubtw=;
 b=QXMusISPLqXotR1fxqWWWZb5t8ug7CUHU7MJurJTkq/AazDq1NFfWwWD7mn4PpFa
 0vfs+0NLma4R2XQlPHI6jNlJLX6M8eJ4PE+zHZund+yGulDgsCaJr3rKbVSURj/3Tdf
 +5aa4KiFgXPMc/DUM/AAKFdIeU5rpOiNyQTCjCQc=
Received: from localhost (120.52.147.40 [120.52.147.40]) by mx.zoho.com.cn
 with SMTPS id 1561725683026983.364449497505;
 Fri, 28 Jun 2019 20:41:23 +0800 (CST)
Date: Fri, 28 Jun 2019 20:41:17 +0800
From: Fam Zheng <fam@euphon.net>
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <20190628124117.2lltlf7yiwlwy4j4@debian>
References: <156171539473.6332.3788894025347542150@c4a48874b076>
 <f1ff093c-cb64-a54e-778e-eb18a0fdddb2@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f1ff093c-cb64-a54e-778e-eb18a0fdddb2@vivier.eu>
User-Agent: NeoMutt/20170113 (1.7.2)
X-ZohoCNMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 124.251.121.243
Subject: Re: [Qemu-devel] [Patchew-devel] [PATCH v15 0/5] linux-user: A set
 of miscellaneous patches
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
Cc: "patchew-devel@redhat.com" <patchew-devel@redhat.com>,
 aleksandar.markovic@rt-rk.com, qemu-devel@nongnu.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 06/28 14:15, Laurent Vivier wrote:
> Dear Patchew developers,
>=20
> Le 28/06/2019 =C3=A0 11:49, no-reply@patchew.org a =C3=A9crit=C2=A0:
> > Patchew URL: https://patchew.org/QEMU/1561712082-31441-1-git-send-email=
-aleksandar.markovic@rt-rk.com/
> >=20
> >=20
> >=20
> > Hi,
> >=20
> > This series failed build test on s390x host. Please find the details be=
low.
>=20
> To debug this kind of problem (at least to reproduce it), it may be
> interesting to know the OS release of the target build environment
> (glibc version, gcc version, ...) on which the build fails.
>=20
> Is this possible to add this in the mail (or in the logs)?

I've moved the env/rpm/uname commands before the actual testing commands, s=
o
the information can be collected even upon failures.

Fam

>=20
> ...
> >   CC      microblaze-linux-user/linux-user/strace.o
> >   CC      mips64el-linux-user/linux-user/syscall.o
> >   LINK    microblazeel-linux-user/qemu-microblazeel
> > /var/tmp/patchew-tester-tmp-tr0wvoyz/src/linux-user/syscall.c:322:16: e=
rror: conflicting types for =E2=80=98statx=E2=80=99
> >   322 | _syscall5(int, statx, int, dirfd, const char *, pathname, int, =
flags,
> >       |                ^~~~~
> > /var/tmp/patchew-tester-tmp-tr0wvoyz/src/linux-user/syscall.c:213:13: n=
ote: in definition of macro =E2=80=98_syscall5=E2=80=99
>=20
> Thanks,
> Laurent
>=20
> _______________________________________________
> Patchew-devel mailing list
> Patchew-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/patchew-devel



