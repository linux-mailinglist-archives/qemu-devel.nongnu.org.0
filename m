Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 437CD505191
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 14:34:14 +0200 (CEST)
Received: from localhost ([::1]:48898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngQa4-0006sa-Qz
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 08:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ngQXW-00063G-BX
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 08:31:34 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:51597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ngQXS-0002rP-I3
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 08:31:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Y4XIhv8v48ikxiiT1TuynuAE66uFe9cESMTaAV5Mgx0=; b=FLWDRpZrsz6uSA9zyBxcfOVFkS
 7A6sg+B4JL48brrQSyKB96gxApXADHc7tVV9mxXkr8dMqy+d1t9udGqPLi4WlZNyHxxWqG2xTDIdo
 jeBhnp2Qt0ULXfggOqLfKIoVo+IXNVsR9/RxElxQclEMIWJtQ2BBK73F1l0R4afPBYZvqWDtOyf2m
 n9cYjDapfbDVD4Jlbz2TOEV2Sk7Habu2TGBh/icbR/7FLZLCVHTL7z+W6J6loSKAlAk0ofdFwO9mX
 +XYKSJgaR7scKCOvOzzcqY/K4PxsywXgT5fUIV2UPzf36vMqKjmwZyJwp/zI9QFz0fDVv+hBIqgzk
 6NechVkDPbeaLfETfTBGckBCJVAuy3R7HEBflQ3FfDW3YP47L9vypFemUYSGYYJtlBlKcHDvPPv4w
 0hbfw1/Mqj/OZtlH9+IAQxT3MjhgdjWzrIheboFnr2Hb1BIUYzmYyzRXoATvvQZ0h590zbTsoJQ2D
 GbqsnLDfPUzjUE3ymKriYvslZrFHBgmLcvAqg0twyjnE/5fLkq+eT/fySqTDQVu8fqosDq5H7jxAB
 vsRU1rG6AR34ik2uifdo0Z1aZxysGxFnmDZAly+3NvIMdpVQ8TvHkAah0nRIlAmdGohLSbafVRzxt
 j++f6wRICKbUxR8ZpPjwx5SmYxwBENHXsNfcQQD+c=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: "Shi, Guohuai" <Guohuai.Shi@windriver.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Subject: Re: [RFC PATCH 0/4] 9pfs: Add 9pfs support for Windows host
Date: Mon, 18 Apr 2022 14:31:17 +0200
Message-ID: <3596871.UiuOCll1Ve@silver>
In-Reply-To: <433fdc93-b483-3dc6-43e7-28b54a95318c@ilande.co.uk>
References: <20220408171013.912436-1-bmeng.cn@gmail.com>
 <4649965.RNUEIdHhq1@silver>
 <433fdc93-b483-3dc6-43e7-28b54a95318c@ilande.co.uk>
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

On Montag, 18. April 2022 11:07:33 CEST Mark Cave-Ayland wrote:
> On 17/04/2022 13:55, Christian Schoenebeck wrote:
> > On Donnerstag, 14. April 2022 19:25:04 CEST Shi, Guohuai wrote:
> >>> -----Original Message-----
> >>> From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> >>> Sent: 2022=E5=B9=B44=E6=9C=8814=E6=97=A5 19:24
> >>> To: qemu-devel@nongnu.org; Shi, Guohuai <Guohuai.Shi@windriver.com>
> >>> Cc: Bin Meng <bmeng.cn@gmail.com>; Greg Kurz <groug@kaod.org>
> >>> Subject: Re: [RFC PATCH 0/4] 9pfs: Add 9pfs support for Windows host
> >>>=20
> >>> [Please note: This e-mail is from an EXTERNAL e-mail address]
> >>>=20
> >>> On Mittwoch, 13. April 2022 05:30:57 CEST Shi, Guohuai wrote:
> >>>>> We have 3 fs drivers: local, synth, proxy. I don't mind about proxy,
> >>>>> it is in  bad shape and we will probably deprecate it in near future
> >>>>> anyway. But it would be good to have support for the synth driver,
> >>>>> because we are using it for running test cases and fuzzing tests
> >>>>> (QA).
> >=20
> > [...]
> >=20
> >> For 9p-synth:
> >>=20
> >> I had enabled 9p-synth.c and built it successfully on Windows platform.
> >> However, test cases code are not built on Windows host.
> >> So I think it is useless that enable synth on Windows host (no way to =
run
> >> it).
> >=20
> > Please, don't give up too soon. Looking at tests/qtest/meson.build it
> > starts with:
> >=20
> > # All QTests for now are POSIX-only, but the dependencies are
> > # really in libqtest, not in the testcases themselves.
> > if not config_host.has_key('CONFIG_POSIX')
> >=20
> >    subdir_done()
> >=20
> > endif
> >=20
> > And looking at tests/qtest/libqtest.c I "think" this should be working =
on
> > Windows as well. It uses socket APIs which are available on Windows. I
> > don't see a real show stopper here for Windows.
> >=20
> > Could you please try if you can compile the tests on Windows? What we
> > would
> > need is test/qtest/qos-test, we don't need all the other tests:
> >=20
> > https://wiki.qemu.org/Documentation/9p#Test_Cases
> >=20
> >>>> It is possible that to "map" extend attribute to NTFS stream data.
> >>>> However, if Windows host media is not NTFS (e.g. FAT) which does not
> >>>> support stream data, then the "map" can not work.
> >>>=20
> >>> ... yes exactly, it would make sense to use ADS [4] instead of xattr =
on
> >>> Windows. ADS are available with NTFS and ReFS and maybe also with exF=
AT
> >>> nowadays (?), not sure about the latter though. But I think it is fair
> >>> enough to assume Windows users to either use NTFS or ReFS. And if they
> >>> don't, you can still call error_report_once() to make user aware that
> >>> seucrity_model=3Dmapped(-xattr) requires a fileystem on Windows that
> >>> supports ADS.
> >>> [4] https://en.wikipedia.org/wiki/NTFS#Alternate_data_stream_(ADS)
> >>=20
> >> Windows does not support POSIX permission.
> >> So I think that only allow user to use security_model=3Dnone is reason=
able
> >> on
> >> Windows host.
> >=20
> > It depends on the use case. I assume your use case are Windows guests, =
in
> > that case you don't have the concept of POSIX permissions neither on
> > guest side, nor on host side (on the long-term I am pretty sure though
> > that Windows guest users would want to have some kind of Windows ACL
> > mapping implementation as well).
> >=20
> >> There is a difficulty to support "mapped" or "mapped-file" on Windows
> >> host:
> >> There are many functions in 9p-code using APIs like "openat", "mkdirat=
",
> >> etc. MSYS does not support that (openat is not valid on Windows host).=
 I
> >> remember that 9p replaced "open" by "openat" for a long time.
> >> To fully support "security_model=3Dmapped", 9p for Windows need to rep=
lace
> >> "openat" by "open". This may impact too many functions.
> >>=20
> >> I would have a try to enable "mapped" by using ADS, but it looks like a
> >> big
> >> refactor for 9p-local.c
> >=20
> > Regarding openat(): We had a similar challenge for macOS host
> > implementation; macOS does not have mknodat(), so what we're currently
> > doing is
> >=20
> >    pthread_fchdir_np(...)
> >    mknod(...)
> >   =20
> >    https://github.com/qemu/qemu/blob/master/hw/9pfs/9p-util-darwin.c#L84
> >=20
> > So on Windows you could do:
> >    chdir(...)
> >    open(...)
> >=20
> > as workaround for providing openat() for msys.
> >=20
> > For security_model=3Dmapped(-xattr) to work on Windows you basically wo=
uld
> > need to provide a replacement implementation (based on Windows ADS) in
> >=20
> > 9p-util-windows.c for:
> >    ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const
> >    char
> >   =20
> >                                 *name, void *value, size_t size);
> >   =20
> >    ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
> >   =20
> >                                  char *list, size_t size);
> >   =20
> >    ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
> >   =20
> >                                    const char *name);
> >   =20
> >    int fsetxattrat_nofollow(int dirfd, const char *filename, const char
> >    *name,
> >   =20
> >                             void *value, size_t size, int flags);
> >=20
> > So it does not look too bad I think to get security_model=3Dmapped work=
ing,
> > and it would make Windows 9p host support much more usable (for Linux
> > guests, macOS guests, but also for Windows guests with mapped Windows A=
CL
> > in future).
> FWIW even just having security_model=3Dnone would be very useful here, si=
nce
> then 9pfs could be used to share host files across all of Windows, MacOS
> and POSIX OSs which is something that can't yet be done with virtiofsd.
>=20
> Whilst using ADS would allow the xattrs to be attached to files, how would
> this work in the case of ACLs which are stored as a
> "system.posix_acl_access" attribute? My concern would be that files copied
> from the guest to the host wouldn't have sensible permissions when read
> directly on the host. Presumably there would be some existing precedent f=
or
> how this is handled in WSL2?

The behaviour with security_level=3Dmapped on Windows would be identical to=
 that=20
of other already supported systems, that is there are two *distinct* levels=
=20
for ownership and permissions in mapped mode:

1. The actual ownership information and permissions on host's file system.=
=20
Guest won't ever get more permissions than those on host fs level, so this=
=20
level defines the maximum permissions if you will. Those information are no=
t=20
directly exposed to, visible to, nor altered by guest though.

2. The ownership information and permissions mapped by 9p server. That's wh=
at=20
guest sees and is able to alter in this mode. The only difference between=20
security_level=3Dmapped(-xattr) and security_level=3Dmapped-file is just th=
e=20
location where those mapped ownership and permissions are stored to by 9p=20
server (currently: either hidden xattr vs. hidden file).

See also section "1. local fs driver" for some more explanation on this:
https://wiki.qemu.org/Documentation/9p#9p_Filesystem_Drivers

As for POSIX ACLs specifically: a Linux guest kernel does access those as=20
"system.posix_acl_access" and "system.posix_acl_default" xattrs, but on hos=
t=20
fs level they are actually stored and read by 9p server as=20
"user.virtfs.posix_acl_access" and "user.virtfs.posix_acl_default" xattrs=20
instead. So again, ACLs that may exist on host fs level are separated from=
=20
ACLs on guest level in mapped mode, similar to POSIX ownership, permissions=
=20
and device type info.

Best regards,
Christian Schoenebeck



