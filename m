Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31315047CF
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 14:58:10 +0200 (CEST)
Received: from localhost ([::1]:53668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng4Th-0007wB-KY
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 08:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ng4Rj-0007E1-RN
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 08:56:08 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:34987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ng4Rf-0003Mh-66
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 08:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=BZK90stPtUVKhGolTvN33UcWw5HmPP3kRTE+JXznktk=; b=ppzXzIXnL/QugBlSZ+k/QubU1s
 mJj/ugUnOgKKLIsSojOLHxuOsiO3ggpYLbj3Knbx8ZpDrwpuDy5GjGJO7Q8VmLOy0ALteRc2XfT6o
 QcO9zUBNA07jVLPNdErp1bIHLDHr7UjqgrdMDl7ZcqTb4lJhLdfcSevqzHRWeUA9noyeaUfjddFo5
 oww3NIDbHE+d4AN2oME+EYsJKzkTQs0WkPHXENOgHaOeYj9x/ckEDXMeVoBpN3Nq+bifN7Ctx6Rf/
 NdFI+J/iUyJh0vRXa+O999NqitULbfYXQZs/zmsTqg6x1ojt5nU9B2YHKqNO6iqVlNBq2OvM3TxVl
 gZCj14YukPrhYEj7Tnm7ECtZhVkrASlHlE7Vi0gOFm27MWIt7lqWuB2iRoAoss9RFIiHEIpblrZE8
 963qBUG7YzfkUpdUyrVoc5pHUDeNuXkgF3IUyKI4lMKQMtBIyNDNzcZmWNmE+lQ+w2znn923psOeL
 xuokUeCU/rxBLTP2OTMxTxAXU6640NGmJeFnS4bIy/MDRMeNCej5ngCMAvFpWQqKoL86I+dEe95oZ
 fsHPbeAMcWsv+g7wV/xzXLqKZ7tgYDE+I3H5+7Q2FSISm9jEX8LhLTTdpa1px92cxBliCKxyqkBzH
 tDXuvQQ5gnXzHGPzwGNOrGe8dYL8/QsuzEMZXzPVg=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Greg Kurz <groug@kaod.org>
Subject: Re: [RFC PATCH 0/4] 9pfs: Add 9pfs support for Windows host
Date: Sun, 17 Apr 2022 14:55:54 +0200
Message-ID: <4649965.RNUEIdHhq1@silver>
In-Reply-To: <CH2PR11MB445407B4D35ECD8B77AD53F7EFEF9@CH2PR11MB4454.namprd11.prod.outlook.com>
References: <20220408171013.912436-1-bmeng.cn@gmail.com>
 <9940864.osJUfx695o@silver>
 <CH2PR11MB445407B4D35ECD8B77AD53F7EFEF9@CH2PR11MB4454.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Donnerstag, 14. April 2022 19:25:04 CEST Shi, Guohuai wrote:
> > -----Original Message-----
> > From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > Sent: 2022=E5=B9=B44=E6=9C=8814=E6=97=A5 19:24
> > To: qemu-devel@nongnu.org; Shi, Guohuai <Guohuai.Shi@windriver.com>
> > Cc: Bin Meng <bmeng.cn@gmail.com>; Greg Kurz <groug@kaod.org>
> > Subject: Re: [RFC PATCH 0/4] 9pfs: Add 9pfs support for Windows host
> >=20
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >=20
> > On Mittwoch, 13. April 2022 05:30:57 CEST Shi, Guohuai wrote:
> >=20
> > > > We have 3 fs drivers: local, synth, proxy. I don't mind about proxy,
> > > > it is in  bad shape and we will probably deprecate it in near future
> > > > anyway. But it would be good to have support for the synth driver,
> > > > because we are using it for running test cases and fuzzing tests
> > > > (QA).
[...]
> For 9p-synth:
>=20
> I had enabled 9p-synth.c and built it successfully on Windows platform.
> However, test cases code are not built on Windows host.
> So I think it is useless that enable synth on Windows host (no way to run
> it).

Please, don't give up too soon. Looking at tests/qtest/meson.build it start=
s=20
with:

# All QTests for now are POSIX-only, but the dependencies are
# really in libqtest, not in the testcases themselves.
if not config_host.has_key('CONFIG_POSIX')
  subdir_done()
endif

And looking at tests/qtest/libqtest.c I "think" this should be working on=20
Windows as well. It uses socket APIs which are available on Windows. I don'=
t=20
see a real show stopper here for Windows.

Could you please try if you can compile the tests on Windows? What we would=
=20
need is test/qtest/qos-test, we don't need all the other tests:

https://wiki.qemu.org/Documentation/9p#Test_Cases

> > > It is possible that to "map" extend attribute to NTFS stream data.
> > > However, if Windows host media is not NTFS (e.g. FAT) which does not
> > > support stream data, then the "map" can not work.
> >=20
> > ... yes exactly, it would make sense to use ADS [4] instead of xattr on
> > Windows. ADS are available with NTFS and ReFS and maybe also with exFAT
> > nowadays (?), not sure about the latter though. But I think it is fair
> > enough to assume Windows users to either use NTFS or ReFS. And if they
> > don't, you can still call error_report_once() to make user aware that
> > seucrity_model=3Dmapped(-xattr) requires a fileystem on Windows that
> > supports ADS.
> > [4] https://en.wikipedia.org/wiki/NTFS#Alternate_data_stream_(ADS)
> >=20
>=20
> Windows does not support POSIX permission.=20
> So I think that only allow user to use security_model=3Dnone is reasonabl=
e on
> Windows host.

It depends on the use case. I assume your use case are Windows guests, in t=
hat=20
case you don't have the concept of POSIX permissions neither on guest side,=
=20
nor on host side (on the long-term I am pretty sure though that Windows gue=
st=20
users would want to have some kind of Windows ACL mapping implementation as=
=20
well).

> There is a difficulty to support "mapped" or "mapped-file" on Windows hos=
t:
> There are many functions in 9p-code using APIs like "openat", "mkdirat",
> etc. MSYS does not support that (openat is not valid on Windows host). I
> remember that 9p replaced "open" by "openat" for a long time.
> To fully support "security_model=3Dmapped", 9p for Windows need to replace
> "openat" by "open". This may impact too many functions.
>=20
> I would have a try to enable "mapped" by using ADS, but it looks like a b=
ig
> refactor for 9p-local.c

Regarding openat(): We had a similar challenge for macOS host implementatio=
n;=20
macOS does not have mknodat(), so what we're currently doing is

  pthread_fchdir_np(...)
  mknod(...)

  https://github.com/qemu/qemu/blob/master/hw/9pfs/9p-util-darwin.c#L84

So on Windows you could do:

  chdir(...)
  open(...)

as workaround for providing openat() for msys.

=46or security_model=3Dmapped(-xattr) to work on Windows you basically woul=
d need=20
to provide a replacement implementation (based on Windows ADS) in
9p-util-windows.c for:

  ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char =
 =20
                               *name, void *value, size_t size);

  ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
                                char *list, size_t size);

  ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
                                  const char *name);

  int fsetxattrat_nofollow(int dirfd, const char *filename, const char *nam=
e,
                           void *value, size_t size, int flags);

So it does not look too bad I think to get security_model=3Dmapped working,=
 and=20
it would make Windows 9p host support much more usable (for Linux guests,=20
macOS guests, but also for Windows guests with mapped Windows ACL in future=
).

Best regards,
Christian Schoenebeck



