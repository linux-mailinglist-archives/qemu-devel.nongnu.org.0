Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E356D30E3
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 15:03:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piard-0003qc-SF; Sat, 01 Apr 2023 09:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@gorilla.13thmonkey.org>)
 id 1piarZ-0003qP-IU
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 09:01:45 -0400
Received: from 77-173-18-117.fixed.kpn.net ([77.173.18.117]
 helo=gorilla.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@gorilla.13thmonkey.org>) id 1piarX-0004td-Mk
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 09:01:45 -0400
Received: by gorilla.13thmonkey.org (Postfix, from userid 103)
 id 678692FF09A7; Sat,  1 Apr 2023 15:00:36 +0200 (CEST)
Date: Sat, 1 Apr 2023 15:00:36 +0200
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: Warner Losh <imp@bsdimp.com>
Cc: qemu-devel@nongnu.org, Ryo ONODERA <ryoon@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Brad Smith <brad@comstyle.com>, Kyle Evans <kevans@freebsd.org>
Subject: Re: [PATCH 0/7] bsd-user: remove bitrotted NetBSD and OpenBSD
 bsd-user support
Message-ID: <ZCgq9Ll+QJoZDVl3@gorilla.13thmonkey.org>
References: <20230331141833.3647-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6C2mIPRls12YrPA3"
Content-Disposition: inline
In-Reply-To: <20230331141833.3647-1-imp@bsdimp.com>
Received-SPF: none client-ip=77.173.18.117;
 envelope-from=reinoud@gorilla.13thmonkey.org; helo=gorilla.13thmonkey.org
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, KHOP_HELO_FCRDNS=0.399,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 TVD_RCVD_IP=0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--6C2mIPRls12YrPA3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Dear Qemu folks,

I'll throw it in the NetBSD group for feedback.

With regards,
Reinoud

On Fri, Mar 31, 2023 at 08:18:26AM -0600, Warner Losh wrote:
> The NetBSD and OpenBSD support in bsd-user hasn't built since before the meson
> conversion. It's also out of sync with many of the recent changes in the
> bsd-user fork and has just been removed there. Remove it from master for the
> same reasons: it generates a number of false positives with grep and has
> increasingly gotten in the way. The bsd-user fork code is much more advanced,
> and even it doesn't compile and is out of date. Remove this from both
> branches. If others wish to bring it up to speed, I'm happy to help them.
> 
> Warner Losh (7):
>   bsd-user: Remove obsolete prototypes
>   bsd-user: Remove netbsd system call inclusion and defines
>   bsd-user: Remove netbsd system call tracing
>   bsd-user: Remove openbsd system call inclusion and defines
>   bsd-user: Remove openbsd system call tracing
>   bsd-user: Remove netbsd directory
>   bsd-user: Remove openbsd directory
> 
>  bsd-user/netbsd/host-os.h            |  25 --
>  bsd-user/netbsd/os-strace.h          |   1 -
>  bsd-user/netbsd/strace.list          | 145 -----------
>  bsd-user/netbsd/syscall_nr.h         | 373 ---------------------------
>  bsd-user/netbsd/target_os_elf.h      | 147 -----------
>  bsd-user/netbsd/target_os_siginfo.h  |  82 ------
>  bsd-user/netbsd/target_os_signal.h   |  69 -----
>  bsd-user/netbsd/target_os_stack.h    |  56 ----
>  bsd-user/netbsd/target_os_thread.h   |  25 --
>  bsd-user/openbsd/host-os.h           |  25 --
>  bsd-user/openbsd/os-strace.h         |   1 -
>  bsd-user/openbsd/strace.list         | 187 --------------
>  bsd-user/openbsd/syscall_nr.h        | 225 ----------------
>  bsd-user/openbsd/target_os_elf.h     | 147 -----------
>  bsd-user/openbsd/target_os_siginfo.h |  82 ------
>  bsd-user/openbsd/target_os_signal.h  |  69 -----
>  bsd-user/openbsd/target_os_stack.h   |  56 ----
>  bsd-user/openbsd/target_os_thread.h  |  25 --
>  bsd-user/qemu.h                      |  16 --
>  bsd-user/strace.c                    |  34 ---
>  bsd-user/syscall_defs.h              |  29 +--
>  21 files changed, 1 insertion(+), 1818 deletions(-)
>  delete mode 100644 bsd-user/netbsd/host-os.h
>  delete mode 100644 bsd-user/netbsd/os-strace.h
>  delete mode 100644 bsd-user/netbsd/strace.list
>  delete mode 100644 bsd-user/netbsd/syscall_nr.h
>  delete mode 100644 bsd-user/netbsd/target_os_elf.h
>  delete mode 100644 bsd-user/netbsd/target_os_siginfo.h
>  delete mode 100644 bsd-user/netbsd/target_os_signal.h
>  delete mode 100644 bsd-user/netbsd/target_os_stack.h
>  delete mode 100644 bsd-user/netbsd/target_os_thread.h
>  delete mode 100644 bsd-user/openbsd/host-os.h
>  delete mode 100644 bsd-user/openbsd/os-strace.h
>  delete mode 100644 bsd-user/openbsd/strace.list
>  delete mode 100644 bsd-user/openbsd/syscall_nr.h
>  delete mode 100644 bsd-user/openbsd/target_os_elf.h
>  delete mode 100644 bsd-user/openbsd/target_os_siginfo.h
>  delete mode 100644 bsd-user/openbsd/target_os_signal.h
>  delete mode 100644 bsd-user/openbsd/target_os_stack.h
>  delete mode 100644 bsd-user/openbsd/target_os_thread.h
> 
> -- 
> 2.39.2
> 

--6C2mIPRls12YrPA3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELRHWktq6GkG74/X0gpw3AEPIqmgFAmQoKvEACgkQgpw3AEPI
qmh90wf9ET07OM8QxvdgJQNmZVvPWCJ2JcxMzOmPNenO52ifxafrf3BoYPKbVNf/
+heYqDVCZq4o1GWy0jHWJDAtzPZef7/oUOIdZ3uis+0ocD0w4I4VujcKBUTCP2ZY
8eRoOatfJ27IYQUyycIWuM98O+mO6qted+McZS3IIP9fsL83oHSl0NV/vaJzp2zX
mtx6J9B3/pwd24n5D/4mUYDL/H58yGRmd8rnrczZH6+6Olf5YBrkxGPejLzZzCjW
oYL7DgFEsS+odRccOm5omxEniBCHTDsC3vGyEgOFnfcZPaiNHlzBOVP4A2Dt9UJ2
54j8R5QTyCzzzA2igp7eC1TBqX7UAQ==
=E+wc
-----END PGP SIGNATURE-----

--6C2mIPRls12YrPA3--

