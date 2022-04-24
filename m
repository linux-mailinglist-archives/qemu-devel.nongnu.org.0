Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAA550D182
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Apr 2022 13:43:22 +0200 (CEST)
Received: from localhost ([::1]:37728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niae9-0006VT-LL
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 07:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cvz185@web.de>) id 1niabp-0005KZ-BL
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 07:40:57 -0400
Received: from mout.web.de ([217.72.192.78]:39641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cvz185@web.de>) id 1niabn-0005Va-Je
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 07:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1650800453;
 bh=qWXqMhwzG5qjDU86ppl8JMDLCYPKR3j8NQtFB2pcImI=;
 h=X-UI-Sender-Class:From:Subject:Date:To;
 b=dvm2nT8l46MJVaL6FfuuF9qBEoxnAJ2EO3+XZR43umfiqgxB5sKc1TFcP+6fkJyL/
 lfLw+ecUojAJ60APwHgD3c7GbBjb4hVFyILJSGRLxTBAJx3GL1nbLajmy0IOsnF8CB
 9N1A6dVmWDlzjm6VoakD8IfjvZhqdWDz62YQQfdA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [172.29.0.96] ([217.239.164.58]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MJFhJ-1nTXV00h2Z-00KhHy for
 <qemu-devel@nongnu.org>; Sun, 24 Apr 2022 13:40:53 +0200
From: Chris Howard <cvz185@web.de>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Possible bug when setting aarch64 watchpoints
Message-Id: <DF7731C2-424F-4438-BD46-A09CAAE21835@web.de>
Date: Sun, 24 Apr 2022 13:40:52 +0200
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3445.104.21)
X-Provags-ID: V03:K1:mAEYyUwbLM0qedZrl0epP+UvoFrx1Fux61/Iq2cIQW/3GvxoAen
 yxgzvqfkZGd6c02uo5f28r5/bDyl2gAyP4Di1bZnOCGCrPtigEquLZJBm8YavAfVPZPSDnt
 8POQgIGGv7Kz6uLyWk/71wzSJ6kd+l509hOgyjtHKffVTe61p1DpBi4wEOAL6v3mcEpeBL1
 PqAUDlFY3TohW5hxWjbKA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZdPMrCAjnI0=:LZW5bPGLD5CTbvr/jR+fGW
 PGRn7tWMzRZlD6x1gkPYnPrlfhA3htjmnojohQ9a7QeQj6JJiWMOs68we4tSRYxt91vkntEIu
 idjecwK24sQ8a02zBIUOOxjGL43N97noV2BIe6XWVFN8vY6pS2mBbJdopCDSaadnTsOF5qBbk
 6OJBTJd3eTF1FTdchhZLb7QFxbQnSt88m0wmQgMr2NJUL60n5utALSkIfI2rwHM+ZtIlZ94BN
 imuHaO73g6HF3H1hVG1pa9VV2QqyOFjAdlQGqF6sgkaZZ1la/druO9a+xJLvkFBCRw31V6iWt
 XzoRik6x10BoHsgdLRsQLBiPFJ65XB6S2ONvfSwRDO0edr7JZ/kE00ZSbYW4MkQsU49RT6lEt
 Kh3KsQ5+Htq/xsrVOh5DeofwCwV79U88FN1DxCrxBFVH+kxCuOL4sozkGqEyQ9RNIRdmesUKM
 5bnKul6UkXe+XaZ6cUnXpVjJ+E2VeBX0HEpqj3GNjR8xG1Lwc549irVAUIAMb1in0IfbK1Pyg
 jr5TtxnElE3xK9GEBJWrOcWHQKOC06GQ6j7w38QP71S+AnDPawBfOBhDggoGm72VTC9vmUmj8
 Le0+6hwEaWcA9ZsXjulj8sbmR8yyeBbAi7DEtyojflDlK5RBTHYqoN/D2MjjzIzsEn9KOwDs3
 ff6RyalhgyAoF+7+OFuVUAX0dula6lFXXrekaVuz8Vrl7Hu/MmMBTs2bm68oyfEZDecCDDZZX
 WdW9BEvRmOmBT9dZvISk6ynKx5bbR/TQyRHIAe+hBnzp3QKZE4MrP9FQ8OK/spI7TnGSsKggn
 JlzsjmScuxZ9s2zGxVGka7x5BKNhzC0XXE5AR7g84Ps4htT1FDvEjKhRiBzOPyChh7W+0uB9Z
 lBDQ0iVjgQn473yLdAjfbn9Zgh3bTfyvVVTD4H9ggIzSar+SXcCMkM5YkQ7Fzq5H1j1Nl1nHv
 kYSWH47T6B/TCUnlOadK1k46zvPUXHuXUoCKBOysSLsIGIivU7A3RhGn8TYmYHOad53e3xG+W
 jUSzvfkuCLJ8iQJsBtvGc0MdizjjPFSIjdBvA0DxyhCdP3eqrxQD0qy+5kGJh/bUMw==
Received-SPF: pass client-ip=217.72.192.78; envelope-from=cvz185@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi, I=E2=80=99m new to qemu (and even bug-reporting) so apologies in =
advance=E2=80=A6

The MASK field in DBGWCRx_EL1 is **5** bits wide [28:24].

In target/arm/kvm64.c I found the line:

 wp.wcr =3D deposit32(wp.wcr, 24, 4, bits);		// ie **4** bits =
instead of **5**


If it=E2=80=99s not copying (or calculating?) the number of bits =
correctly this would explain the behaviour I=E2=80=99m seeing:

If I set

DBGWVR0_EL1 =3D 0x00800000

and

DBGWCR0_EL1 =3D 0x1F<<24 | 0xFF<<5 | 0b11<<3 | 0b11<<1 | 0b1<<0

and then access  memory [0x00807FFF]  I get a watchpoint exception. (ie. =
watchpoints ARE working/enabled)

But if I access [0x008080000] I *don=E2=80=99t* get an exception.

**If the MASK field gets set to 0b1111 instead of 0b11111 then only the =
bottom 15 bits of the address get masked (instead of 31) and the masked =
address isn=E2=80=99t 0x00800000, and the exception won=E2=80=99t be =
triggered.**


Unfortunately, changing the 4 to a 5 and recompiling had no effect :-(

I may well have misunderstood something. :-/

=E2=80=94Chris=

