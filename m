Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5F9667935
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:28:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFzPP-0007oe-BE; Thu, 12 Jan 2023 10:22:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nealelliott@netscape.net>)
 id 1pFzK3-0004Wz-Kw
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 10:16:56 -0500
Received: from sonic303-24.consmr.mail.gq1.yahoo.com ([98.137.64.205])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nealelliott@netscape.net>)
 id 1pFzK1-0001r7-TF
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 10:16:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048;
 t=1673536609; bh=bU3D1XQ/RxI3c/OXGyvnogBrWdfFVvRSd0fn6qHaxog=;
 h=Date:From:To:Subject:References:From:Subject:Reply-To;
 b=KvDjlCQCvTpn8nc5Q0NnqqD3I/PmIQKWxOdTB/XBSx5gjiX4Pwuhm09LLJ44NH8rp1+5H0IxTTEPmSLMTHPttenyHhfb69EB0nUzg59s7H1KZqfl8JyRKxeWhy7PwAQnhqDJffwaTyC+OBqU94KcgOqF2buotxmhYvyVSpvNgQoPtSxem5IkcsI5rX51zfBHLkIsu3/wrIcXPWqLEw9TOSvTn+t7LT8WkSALB9zPB0xjH5s5+JrbbJu6TGqyU7+AoceqFV24O6DIhhpYg7i+j/7EcgzRa9iiHpMh44J7HzP8VURsZSs2q1eejvzEQz3wn6mYCgqHjeGsNIyKt8x5Cg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1673536609; bh=3CAfcnOHkXv7uvvaGht9HwbiNhAvEYJKUZz88cla4VI=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=AMEu0Qfzn0mu8nHLl9VpMRZTzQp1WaxUhVi9hvvcbFuXDuYfqaE/u+48o9LkuuczB19q4nff1U5MM6bZJ2nDNtyil1p/yuZy+a3i/lab9d7f/1IrTD9zjHcyP+mgfsNWkzP4nQfLd8EOksqCS1hOWpTw/urZx+Lb2OkcUpfOeXn+NmccO8rJkvkNzvCl2DZBp8Q4xoHiH4fDdv8yVQn6CXDFYc0kli+f+6YmTd7hZqT4kqHyVD6WRy+RLVzdH24vX2YRAMuwTciOUdkTo92/Gh6fDBBr6GawNoyRgyR+wr/zDXXwCTLf2xz4+MbbpX27KL5qhwBZJwfs0rG5r+Hugg==
X-YMail-OSG: .a1kQ.0VM1knetXJaJFB7v_zG1Jw_eViHwB3ezDAbucI8tV9oiQyQX5Gh9.N52h
 lNl1pdQoiavdU9sQnbGWMxcxSS.E1s7UZbVWS8CGCidr3HNE7p1gCIeuropJZqcEOwWWUPVclu_a
 BgpR1ht2Ag2E3GR7OqVs0XNS1wTWAvM0gjqAAYibMmpJwQCuQCqCn2p7fFZKTuaRRHLZYPC30umS
 2pg4MC3zOAUJ4zOGrWH58wWWXaGoMAmcrPc52Ej0oiDF8ItfD061Vnp62Fsh6Whi809v4puOr7u8
 NxU710ghvbXDOLk6DsjThE6gzg3SMADG.cUgY17D7M0gVvm6i99IxQK1ABwJpRSKuSh0uJFSP6NE
 zdGqRdtnHkEiaZ9NoSsy6nO9fm7zKK1aJX3a9yqg5hHVMrN6g0JpT0oXVsAzuiO.s.GhqftrNi.P
 dkze8rx6TT01lR88rIyj4fNhrRtRRGCtSAa1NrPMK6gXk0SZC8aovRGPhbz0joK.0bWoT1l3HFVV
 bnHU_GimeozElqrzaWWOuhohA7x5rQguvxWNvjPKdLpkEuM9Dhu8OmlI.3hlrvL.ilwYP52qe1u8
 QnrrQxVtHPoSpURkL8esxgDP7VT7iLiMXmtZqRXxAoPvxM2UzHU_4Vl79F784Ws4ZIWWrZkuRbaG
 oCe8jfGTAs8V3UdYT5ee0wfm9AsY5rheS.tVGojjLKIjOwnBTfck1zjFsDXxLLYXW53H9kLCLmJH
 NOef9Tk4Jp9or6rdMJCrVHsdKh8S9CBUY063QjF1coC7d39TXfxp4vGQ57NXuBokgbWZzjx5uni5
 cgJ0TOrKmss1lWJ4Rmihl5fwMsaMQZoaYFbk6pEa31NFRer6ZA8PIQ0dNIUe_eM9CK2UID7MKnbv
 rDqk9SiKEhegGBRngSQuvSW6w5C2loeCLj2PbHiuwQfCjyAQrqMG9NvYSpTb07V3xpDVsET3wLB2
 V6Hjh202wIhDT4fBFoYlkIrB2XZiVq7Eu_ot9Ti0PzNfEWH8TJBP1TvwsmeH6at1fxaS5_s.IfEG
 PF2d.KYwN9R8h9tUfiR241f7SD0WHBJa3_r7RW8_8rUjaoDyMM6X22Ph837hMYw9StTJF6Cp8Cun
 MU5S6C7d6Wp9U69XFLgyEH3H0mEDM4hiiyolFKTdizVuzpz37VWJWn71CgjctDtXzmvWshMxbxcu
 JRn5xWV10QsisiSvsDxZG7mtDl.2YwefV7ihXk7Ekz3Kx.i9C_gIxBbFc666nwRC0hC.Fnn1tr7Y
 yd46lPZ2Tu1vWgp7rQYWGxBzgJByEXVzNPy679_M.K81Kg5Y.0bY1JVlu4cOAjjqk7njBAT2l6Yw
 29yN53avxqNc_d6UfkkL5yPggyso9pwSkflVmMeMUXdpXHnmFqgUBoXXPECZ.IobBgjlyOXbHJpB
 JKtig8w72_U6H2pIl1K2hWpSL3Oe2IfuZnDQiPBJYBvSCqCGjvc2ntOoHcstN26KZN58RBjipgod
 xXMyyioHq.mJGc4kbcQmlGCBkCx7m3NegmWWmz4Br6hU3aPicPlcmc4iI86qrgTn5w7n7BuJTnOc
 tO9M3K9mm0Sg9K7V5JuogdEq4W4xwFZEyqODAQOZwflzSxOGvvuJCDlG3BueFiGcpF0K5_ldUPYW
 HNvjIMKxDAtBzp9rWx40TQZuLLBPrlu4c5UFSHizjwP3UdYZOn3XvyEWzB_Cxpc4vB5FlAt01eUq
 cOZEQ.D4bsFJOn37aSISOH9INJV71zOOyy3D6SgvDjC55pSRlKgrxHj3RHfcslAS7XWmCaYCQGY0
 sbEwK2XHBBjDcBVICgwv4JzcYZhBAjBdS52ilmwk_ZmohdTvISP0DL40BKnxR1su_lkZxyz4ZscD
 3U.IJuaWbT1uYLf4vSI_IUyETdjRBYvXeIYUo3YZQHTth3IyICZIMwe6jTvJzdLtaiOyeft5J4Yd
 oGgO5K65x5mnD9Tq6dvAOLQ4mbtA0zxW1JULJtKqC8k0L5El.I0ha4hEcPsixxBKB6Z_6ZQByEVs
 h0j6Z8fFg569ZiAZuLV..twZD5ZHtH8QTsoROHhwErqnPllbAjwB9EeidI6dlvOAUaGky715dtmp
 JJUG2150xClxNIePTsxWkDHttXLhRlk3_UTmbR5dlr5fcPfAhV2Yp_70_LSwhDuGNPApDXh0aoIV
 T1XRGIxoGOXe3yqd6gvLpv59PL1nrIql5DRN83Q--
X-Sonic-MF: <nealelliott@netscape.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.gq1.yahoo.com with HTTP; Thu, 12 Jan 2023 15:16:49 +0000
Date: Thu, 12 Jan 2023 15:16:46 +0000 (UTC)
From: Neal Elliott <nealelliott@netscape.net>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Message-ID: <1742086835.396699.1673536606737@mail.yahoo.com>
Subject: building qemu on windows 11
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_396698_463526241.1673536606736"
References: <1742086835.396699.1673536606737.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.21062 AolMailNorrin
Received-SPF: pass client-ip=98.137.64.205;
 envelope-from=nealelliott@netscape.net;
 helo=sonic303-24.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 12 Jan 2023 10:22:23 -0500
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

------=_Part_396698_463526241.1673536606736
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is it possible,=
 or has anyone built qemu from the master branch using visual studio? I att=
empted to=C2=A0build the code using mingw64, but it failed to build. is the=
re a current build document for windows?=C2=A0
------=_Part_396698_463526241.1673536606736
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head></head><body><div class="yahoo-style-wrap" style="font-family:Arial, Helvetica, sans-serif;font-size:16px;"><div dir="ltr" data-setdir="false">Hello,&nbsp;</div><div dir="ltr" data-setdir="false">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;is it possible, or has anyone built qemu from the master branch using visual studio? I attempted to&nbsp;</div><div dir="ltr" data-setdir="false">build the code using mingw64, but it failed to build. is there a current build document for windows?&nbsp;</div></div></body></html>
------=_Part_396698_463526241.1673536606736--

