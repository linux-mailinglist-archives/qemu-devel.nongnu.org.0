Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AA73ECB79
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 23:37:13 +0200 (CEST)
Received: from localhost ([::1]:48202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFNoe-00020S-Dp
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 17:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oguzersen@protonmail.com>)
 id 1mFMgQ-0001vi-L9; Sun, 15 Aug 2021 16:24:38 -0400
Received: from mail-40141.protonmail.ch ([185.70.40.141]:18834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oguzersen@protonmail.com>)
 id 1mFMgO-0001Ol-9g; Sun, 15 Aug 2021 16:24:38 -0400
Date: Sun, 15 Aug 2021 20:24:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1629059071;
 bh=4pi7ZvjTxc1Zcxk6+V7rlZ4fRkMV036cXyGhACAAuCs=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=Pbe5ESFHqewKX3wTUGky9hLk7atiQpSK2vDSHSfbaTXgzh/fxulJ16oSEy/LDa44D
 i0kcSi/17+bRaOIkLg8QvUEcKx3Tv8wnhABbuxPQUMZZS3JT+Wx3V0CGD3h1w+ppUh
 GVwoL9ne2IHpDpZU5cNQAxIknLseZCcyW3nFaXzI=
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
From: =?utf-8?Q?O=C4=9Fuz_Ersen?= <oguzersen@protonmail.com>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: [PATCH] po: update turkish translation
Message-ID: <lDpmNUjNrVETJ2QoHoYmSoRvKoEIVFbF4IZAa1R5PVzqPCTh7nmV_ERHQlgYtNJN1Ppagtvelbo4uhSihEd5bSqIxCvGQchEWVpP-ofn2kw=@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1_aMKC5t7Z8BE4sjXYpf1qyJRPBnFYlv0bws9dDr6CQU"
Received-SPF: pass client-ip=185.70.40.141;
 envelope-from=oguzersen@protonmail.com; helo=mail-40141.protonmail.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 15 Aug 2021 17:35:19 -0400
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
Reply-To: =?utf-8?Q?O=C4=9Fuz_Ersen?= <oguzersen@protonmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.

--b1_aMKC5t7Z8BE4sjXYpf1qyJRPBnFYlv0bws9dDr6CQU
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi, this is a small patch to update Turkish translation, thanks.

--
Best Regards
O=C4=9Fuz Ersen
--b1_aMKC5t7Z8BE4sjXYpf1qyJRPBnFYlv0bws9dDr6CQU
Content-Type: text/x-patch; name=0001-po-update-turkish-translation.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=0001-po-update-turkish-translation.patch

RnJvbSBjMTEwOWMxNmU1ZDcyY2Y1NTk1NGE4MDlhZmRkZTkyYzNjMDE0ZjNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/Tz1DND05RnV6PTIwRXJzZW4/PSA8b2d1emVy
c2VuQHByb3Rvbm1haWwuY29tPgpEYXRlOiBTdW4sIDE1IEF1ZyAyMDIxIDIyOjIyOjE4ICswMzAw
ClN1YmplY3Q6IFtQQVRDSF0gcG86IHVwZGF0ZSB0dXJraXNoIHRyYW5zbGF0aW9uCk1JTUUtVmVy
c2lvbjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50
LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CgpTaWduZWQtb2ZmLWJ5OiBPxJ91eiBFcnNlbiA8b2d1
emVyc2VuQHByb3Rvbm1haWwuY29tPgotLS0KIHBvL3RyLnBvIHwgMjMgKysrKysrKysrKystLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9wby90ci5wbyBiL3BvL3RyLnBvCmluZGV4IDYzMmM3ZjM4NTEuLjI4
NDVmMzc3OWMgMTAwNjQ0Ci0tLSBhL3BvL3RyLnBvCisrKyBiL3BvL3RyLnBvCkBAIC0xLDE0ICsx
LDE1IEBACiAjIFR1cmtpc2ggdHJhbnNsYXRpb24gZm9yIFFFTVUuCiAjIFRoaXMgZmlsZSBpcyBw
dXQgaW4gdGhlIHB1YmxpYyBkb21haW4uCiAjIE96YW4gw4dhxJ9sYXlhbiA8b3phbmNhZ0BnbWFp
bC5jb20+LCAyMDEzLgorIyBPxJ91eiBFcnNlbiA8b2d1emVyc2VuQHByb3Rvbm1haWwuY29tPiwg
MjAyMS4KICMKIG1zZ2lkICIiCiBtc2dzdHIgIiIKICJQcm9qZWN0LUlkLVZlcnNpb246IFFFTVUg
MS40LjUwXG4iCiAiUmVwb3J0LU1zZ2lkLUJ1Z3MtVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZ1xu
IgogIlBPVC1DcmVhdGlvbi1EYXRlOiAyMDE4LTA3LTE4IDA3OjU2KzAyMDBcbiIKLSJQTy1SZXZp
c2lvbi1EYXRlOiAyMDEzLTA0LTIyIDE4OjM1KzAzMDBcbiIKLSJMYXN0LVRyYW5zbGF0b3I6IE96
YW4gw4dhxJ9sYXlhbiA8b3phbmNhZ0BnbWFpbC5jb20+XG4iCisiUE8tUmV2aXNpb24tRGF0ZTog
MjAyMS0wOC0xNSAyMjoxNyswMzAwXG4iCisiTGFzdC1UcmFuc2xhdG9yOiBPxJ91eiBFcnNlbiA8
b2d1emVyc2VuQHByb3Rvbm1haWwuY29tPlxuIgogIkxhbmd1YWdlLVRlYW06IFTDvHJrw6dlIDw+
XG4iCiAiTGFuZ3VhZ2U6IHRyXG4iCiAiTUlNRS1WZXJzaW9uOiAxLjBcbiIKQEAgLTMzLDI0ICsz
NCwyMiBAQCBtc2dpZCAiUG93ZXIgX0Rvd24iCiBtc2dzdHIgIl9LYXBhdCIKIAogbXNnaWQgIl9R
dWl0IgotbXNnc3RyICIiCittc2dzdHIgIl/Dh8Sxa8SxxZ8iCiAKIG1zZ2lkICJfRnVsbHNjcmVl
biIKLW1zZ3N0ciAiIgorbXNnc3RyICJfVGFtIEVrcmFuIgogCiBtc2dpZCAiX0NvcHkiCi1tc2dz
dHIgIiIKK21zZ3N0ciAiS19vcHlhbGEiCiAKLSMsIGZ1enp5CiBtc2dpZCAiWm9vbSBfSW4iCi1t
c2dzdHIgIllha8SxbmxhxZ8gdmUgU8SxxJ9fZMSxciIKK21zZ3N0ciAiX1lha8SxbmxhxZ8iCiAK
LSMsIGZ1enp5CiBtc2dpZCAiWm9vbSBfT3V0IgotbXNnc3RyICJZYWvEsW5sYcWfIHZlIFPEscSf
X2TEsXIiCittc2dzdHIgIl9VemFrbGHFnyIKIAogbXNnaWQgIkJlc3QgX0ZpdCIKLW1zZ3N0ciAi
IgorbXNnc3RyICJfRW4gVXlndW4iCiAKIG1zZ2lkICJab29tIFRvIF9GaXQiCiBtc2dzdHIgIllh
a8SxbmxhxZ8gdmUgU8SxxJ9fZMSxciIKQEAgLTY1LDEwICs2NCwxMCBAQCBtc2dpZCAiU2hvdyBf
VGFicyIKIG1zZ3N0ciAiU2Vfa21lbGVyaSBHw7ZzdGVyIgogCiBtc2dpZCAiRGV0YWNoIFRhYiIK
LW1zZ3N0ciAiIgorbXNnc3RyICJTZWttZXlpIEF5xLFyIgogCiBtc2dpZCAiU2hvdyBNZW51YmFy
IgotbXNnc3RyICIiCittc2dzdHIgIk1lbsO8IMOHdWJ1xJ91bnUgR8O2c3RlciIKIAogbXNnaWQg
Il9NYWNoaW5lIgogbXNnc3RyICJfTWFraW5lIgotLSAKMi4zMS4xCgo=

--b1_aMKC5t7Z8BE4sjXYpf1qyJRPBnFYlv0bws9dDr6CQU--


