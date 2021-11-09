Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A769B44B24C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 19:04:30 +0100 (CET)
Received: from localhost ([::1]:33266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkVTx-0005Rx-JW
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 13:04:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shital_909@yahoo.com>)
 id 1mkUs9-0000Sc-UN
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:25:26 -0500
Received: from sonic304-24.consmr.mail.gq1.yahoo.com ([98.137.68.205]:46202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shital_909@yahoo.com>)
 id 1mkUs6-0001vb-0y
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:25:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1636478717; bh=p+SvCzXYYQJKq2Ki9O6hkadhAMi0aBYbwon4pwTkGAk=;
 h=Date:From:To:Subject:References:From:Subject:Reply-To;
 b=LrGAntYJTIspnibh6PJvVstcl/TJz9DdU1QoHipmm/DW8eYcGs1CVQuKgTsQbp0kLQDWe2+c930p0HoiAgmdJiTmqQ1zlLfzl6lxAghoIHzDjxQGMY9mXkzTUzcVN6SL1tfd9Xc0Id6/ArM/mLMgXbLTvAe93UR46CdMmUJelAmyIGPNffRlGIebyyh6PGTgiBPPCYRMW1oT2+PJ7zbKfLPkmmB5/11iqtwo6QoJhGFXvp+UWSd4jO/XjMehDvG4wTAC5adgf382PYPx8JeOcLf3bCHPbMvirHK2dhK6HW7VF9d5AY0OAdI50vzWbkjrp5E772ru/FuROQLn0xJzow==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1636478717; bh=DYwQt+k3xy+ZVmcO3TaYtxFl/x0DTrcvrmUZx7E1Kvh=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=A+AK/7inxc/DRtNhqRtrwop9o3478LrOKnB4J76T85rVYNKRdqpUPZEDoCWH5TPRWDhJ4PPif5//yV4UOX8Oo8QbpCSpnGB455vpPde9rV0x1hXGgQkCDLTqBddg9qbqsV39yFaYRRJ+I4UfBs0MkiC6U58x2EvceIsti+JsMVMuVg9tQD74SMs0qxiGiL5KVQyCww1Grv8PP0pAooqD05lAkkw/j9LtJBy19q0gv2IxwdrvesJnjNQh5yOqZgh2P76wzksMK8As2LadAiGZYpJUW5DqScrxs2ZCwc6HVu1u2+b89gwWHMD1byl4gFgDnbjOwKCjV2Vzf/9Bde72kg==
X-YMail-OSG: NA1gOIMVM1lqwUkvV1JowmNMustIYvEt6FsVH9KXp5GMjr4XiOYSGka.B1N8CCt
 W2LYVSquBmSlj6CvQcf3JMiX8wI.TKaYMr73P9BH9RtKih64UEPM3U49EgPvtckOdj6TUd_TjPm.
 SEac_GNz_m1NOGDKcIoC2SE2WaJlJG3u3884T07VrwVdIdmf3Zssymt_UoIohagL5378iiJ7eUpi
 9cHBJ1Av7l0NVyqxppbdFtvH83GLAsIrV7OVhH.pjLOgrNNe9SaDeZUl0DBgQBEnVYwhQh1s6y46
 GJ65otY4zeJORd9KLYt0NN_o.ne9qCNmUxurYOcczRHEIH4Gp2Z1Ox.AFvemWK9..J5S3_WTu_uS
 X0ulocVe4f6P4rzazz.eRsmxEB30ipZFPLomUpima1xy34OvrLJnwKvcBSxdZKBgSPdlg9hojig8
 yaKhmmoILS6SiXf2JPj24hZn3l8Bieo9uwwGLqR_116xdeWWOovs8Xt3Vp_NIbjQvLs5ooQgGyII
 F8qlRpc6HEG_1xvrIubwtGIWii0fbmfCjv6KD.gwaTR8ubERvVwFrjXu94D4cmRSVY5e.I7Wj5V6
 natQK1hApcd3Lqj1k91qLxc7WV408xCUzK0pONAnGNS.uWq0iYak.XSHpMYWgZDuObKMyDP8m6Xq
 BheXbD5T6c7Jq8WaKM.YTZnKxjlIS49pW6h9v8S0RfWHpmmS1Nh9bRepELrYjL4GRUumQjN58OtI
 gfvdUJ3GMOaew.vmNokmRln1yEmf3zcWu4M0VWKPf4tgRcT7wJJ1zkkK9FAJMPK8aojh0.D_pyNs
 0Y7eukl.7JUtBIGOLhlBd6qhi8TPO.e96rNjZByFYAA3pkIdc14EoadkYf5qK6NTHyIFF1ZbhZkl
 UUHio1rLiBTS157TM6_9SUZvmRVAxYW3LAjLD1Z7a7oJRgCRRGADJaetPtzt4nEhIHAntZ0c6gVR
 yB4adYOULACZB2xK8Yft.yWiz79ShPMAQQteYC8nZtydbbWxGB8ryQOgG8cqtBQuvYmPowYd60ch
 4dS.ck5GJn_yFlaAh3orLXYfI4NNNBXk_hT9anJha5ZhVkCB7v3X1Topo0YzRaXd9_K.dnEzKlC9
 eiUjdgvwG__TvOsn.Sbrxl.5QlMDNaTeiKgLjlhpHs3KGuBMAF5EuBZtYOMfSIJD_cmtfCWahepr
 L2IH39rugR11_81k5ehwHvLpZdJIHPI2xACE3b4Vl6SIrgX_JrJpmxZv7nWKyB74FCtLYr94DVsZ
 .MVttRKkuPzAbREUnkwiqROHLozSAB5x40H8hcWP.OOdIFxPwyJ3aJQunPifKNTPo3KavDkWBKTU
 Nu4BbKQ4vReJ_ncARGsuPbs2dF.DCPHlcpvVv1xRymAhJ95wXqMUBPmOE7rgiEQOTE9uzvI2avqO
 wX3ge.NZWPIyxfK0LX3VYNaTqv4NKCS6KdePONKmSyGjkbBPqgHoAofaRiT_anx4eNZY94NAOD_r
 d4sxJ1UUvbCiQEgGKc83xP7jKz3jz8gAB29_eK6bzfdPe77oJEIDgNw0yyxRTFZ7HjDy9gAfld3r
 4bJ.g2uXiFTW5lFo3a5gZAs4XQeVMWH.UtXuqLNIupOIrpM.7y0QXkE8XXrbWL4Ekg3z_JjDM2LJ
 Lzy1vfgEp7nKMQiQPVO0n4VWLYqojzPNPG1xg.WDPFd.TxpnCfKYwO0zCGYmj_LW_d5hKEIZIBTX
 1UEjn5jvGbpsnrAATXd7AnO7zKKCFw0o_yjDq2OTNyIrLaRincuUZgFH_d1TEyRPmhx1BuLRCBCT
 PF36.xu.j1FLmUBFHeOYHVswqEOK8Q73bOLeugvP1kEJsSTYC2Ly5PeS70Nd6MSW5Aad5Aa4.iZt
 tkP4Q3d6L2nuouL3pN4Jb9EUb6VLI9n5MOzDaTS2Icrv9AMUV4y0nlC3rEKPaAOPud0h.kvUnqRH
 l9_H.prqqwmjQT.5zq9UkiVkzkbkKDq6bikXt58Wi5YIXsq_NqwYHgeKt7tjq8y8b59E8qhdL1Sy
 dO507z1wk4a0vpX2G8nO2F2vRe6zN96My9fxEmOKN9QjL.5KR7t8ATPZigQ3veFV3mZgXNPGgaMu
 vyLfcT5.ZgyJY68lepsO8C7N6Z02et__CHBdjso_v.AcM4uMw91PZ_F74cfUVrtoOAtuW5E1mDQd
 D6X2rSIf4PG.GndNuFt1GvBbqbD2InumH8jwYcde6Q28yhxcj935XWqAHaG1qU9OpxYU-
X-Sonic-MF: <shital_909@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.gq1.yahoo.com with HTTP; Tue, 9 Nov 2021 17:25:17 +0000
Date: Tue, 9 Nov 2021 17:25:14 +0000 (UTC)
From: Shitalkumar Gandhi <shital_909@yahoo.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Message-ID: <253794259.1853610.1636478714403@mail.yahoo.com>
Subject: SME : Please review and merge : hw/arm/aspeed: Added eMMC boot
 support for AST2600 image.
MIME-Version: 1.0
Content-Type: multipart/mixed; 
 boundary="----=_Part_1853609_816390374.1636478714403"
References: <253794259.1853610.1636478714403.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.19266 YMailNorrin
Received-SPF: pass client-ip=98.137.68.205; envelope-from=shital_909@yahoo.com;
 helo=sonic304-24.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, FREEMAIL_REPLY=1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_KAM_HTML_FONT_INVALID=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 09 Nov 2021 13:02:32 -0500
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

------=_Part_1853609_816390374.1636478714403
Content-Type: multipart/alternative; 
	boundary="----=_Part_1853608_1805552017.1636478714342"

------=_Part_1853608_1805552017.1636478714342
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



Hi SME's,

Please see the attached patch, which has been added to the boot eMMC image =
for AST2600 machine on QEMU.


qemu should be run as follows:

./qemu-system-arm -m 1G -M ast2600-evb -nographic -drive
file=3Dmmc-evb-ast2600.img,format=3Draw,if=3Dsd,index=3D2

Tested: Booted AST2600 eMMC image on QEMU.

Suggested-by: Troy Lee=C2=A0leetroy@gmail.com
Reviewed-by: Troy Lee=C2=A0leetroy@gmail.com
Reviewed-by: Andrew Jeffery=C2=A0andrew@aj.id.au
Signed-off-by: Shitalkumar Gandhi=C2=A0shitalkumar.gandhi@seagate.com



BR,
Shitalkumar Gandhi
------=_Part_1853608_1805552017.1636478714342
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydpdf28a5ceyahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px=
;"><div dir=3D"ltr" data-setdir=3D"false"><div><p style=3D"margin-bottom: 1=
6px; color: rgb(36, 41, 47); font-family: -apple-system, BlinkMacSystemFont=
, Segoe UI, Helvetica, Arial, sans-serif, Apple Color Emoji, Segoe UI Emoji=
; font-size: 14px; margin-top: 0px !important;" dir=3D"ltr" data-setdir=3D"=
false"></p><div>Hi SME's,<br><br>Please see the attached patch, which has b=
een added to the boot eMMC image for AST2600 machine on QEMU.</div><p></p><=
p style=3D"margin-top: 0px; margin-bottom: 16px; color: rgb(36, 41, 47); fo=
nt-family: -apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, s=
ans-serif, Apple Color Emoji, Segoe UI Emoji; font-size: 14px;">qemu should=
 be run as follows:</p><p style=3D"margin-top: 0px; margin-bottom: 16px; co=
lor: rgb(36, 41, 47); font-family: -apple-system, BlinkMacSystemFont, Segoe=
 UI, Helvetica, Arial, sans-serif, Apple Color Emoji, Segoe UI Emoji; font-=
size: 14px;">./qemu-system-arm -m 1G -M ast2600-evb -nographic -drive<br>fi=
le=3Dmmc-evb-ast2600.img,format=3Draw,if=3Dsd,index=3D2</p><p style=3D"marg=
in-top: 0px; margin-bottom: 16px; color: rgb(36, 41, 47); font-family: -app=
le-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif, Appl=
e Color Emoji, Segoe UI Emoji; font-size: 14px;">Tested: Booted AST2600 eMM=
C image on QEMU.</p><p style=3D"margin-top: 0px; color: rgb(36, 41, 47); fo=
nt-family: -apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, s=
ans-serif, Apple Color Emoji, Segoe UI Emoji; font-size: 14px; margin-botto=
m: 0px !important;">Suggested-by: Troy Lee&nbsp;<a href=3D"mailto:leetroy@g=
mail.com" style=3D"background-color: transparent;" rel=3D"nofollow" target=
=3D"_blank">leetroy@gmail.com</a><br>Reviewed-by: Troy Lee&nbsp;<a href=3D"=
mailto:leetroy@gmail.com" style=3D"background-color: transparent;" rel=3D"n=
ofollow" target=3D"_blank">leetroy@gmail.com</a><br>Reviewed-by: Andrew Jef=
fery&nbsp;<a href=3D"mailto:andrew@aj.id.au" style=3D"background-color: tra=
nsparent;" rel=3D"nofollow" target=3D"_blank">andrew@aj.id.au</a><br>Signed=
-off-by: Shitalkumar Gandhi&nbsp;<a href=3D"mailto:shitalkumar.gandhi@seaga=
te.com" style=3D"background-color: transparent;" rel=3D"nofollow" target=3D=
"_blank">shitalkumar.gandhi@seagate.com</a></p></div><br><br></div><div><br=
></div><div class=3D"ydpdf28a5cesignature"><div dir=3D"ltr" style=3D"font-f=
amily:Helvetica, Arial, sans-serif;font-size:13px;"><div><span style=3D"fon=
t-family:Helvetica, Arial, sans-serif;">BR,</span><br clear=3D"none" style=
=3D"font-family:Helvetica, Arial, sans-serif;"><span style=3D"font-family:H=
elvetica, Arial, sans-serif;">Shitalkumar Gandhi</span></div></div></div></=
div></body></html>
------=_Part_1853608_1805552017.1636478714342--

------=_Part_1853609_816390374.1636478714403
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hw-arm-aspeed-Added-eMMC-boot-support-for-AST2600-im.patch"
Content-ID: <cbb8e1ab-66f5-c9f8-018c-420b0fcbd1de@yahoo.com>

RnJvbSA3YTQ4NTZkMDdiYWQxYTk1N2I3ZjZkMDgzNmZiYjJkYTZhOGJlNWI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaGl0YWxrdW1hciBHYW5kaGkgPHNoaXRhbGt1bWFyLmdhbmRo
aUBzZWFnYXRlLmNvbT4KRGF0ZTogRnJpLCAyNCBTZXAgMjAyMSAyMDo0NjoyMiArMDUzMApTdWJq
ZWN0OiBbUEFUQ0hdIGh3L2FybS9hc3BlZWQ6IEFkZGVkIGVNTUMgYm9vdCBzdXBwb3J0IGZvciBB
U1QyNjAwIGltYWdlLgoKVGhpcyBwYXRjaCBoYXMgYmVlbiBhZGRlZCB0byBib290IGVNTUMgaW1h
Z2UgZm9yIEFTVDI2MDAgbWFjaGluZSBvbgpRRU1VLgoKUnVuIHF1ZW11IGFzIGZvbGxvd3M6Cgou
L3FlbXUtc3lzdGVtLWFybSAtbSAxRyAtTSBhc3QyNjAwLWV2YiAtbm9ncmFwaGljIC1kcml2ZQpm
aWxlPW1tYy1ldmItYXN0MjYwMC5pbWcsZm9ybWF0PXJhdyxpZj1zZCxpbmRleD0yCgpUZXN0ZWQ6
IEJvb3RlZCBBU1QyNjAwIGVNTUMgaW1hZ2Ugb24gUUVNVS4KClN1Z2dlc3RlZC1ieTogVHJveSBM
ZWUgPGxlZXRyb3lAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogVHJveSBMZWUgPGxlZXRyb3lAZ21h
aWwuY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT4KU2ln
bmVkLW9mZi1ieTogU2hpdGFsa3VtYXIgR2FuZGhpIDxzaGl0YWxrdW1hci5nYW5kaGlAc2VhZ2F0
ZS5jb20+Ci0tLQogaHcvYXJtL2FzcGVlZC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaHcvYXJtL2FzcGVlZC5jIGIv
aHcvYXJtL2FzcGVlZC5jCmluZGV4IGJhNWYxZGM1YWYuLjZhODkwYWRiODMgMTAwNjQ0Ci0tLSBh
L2h3L2FybS9hc3BlZWQuYworKysgYi9ody9hcm0vYXNwZWVkLmMKQEAgLTE0OCw3ICsxNDgsNyBA
QCBzdHJ1Y3QgQXNwZWVkTWFjaGluZVN0YXRlIHsKICAgICAgICAgU0NVX0FTVDI0MDBfSFdfU1RS
QVBfQk9PVF9NT0RFKEFTVDI0MDBfU1BJX0JPT1QpKQogCiAvKiBBU1QyNjAwIGV2YiBoYXJkd2Fy
ZSB2YWx1ZSAqLwotI2RlZmluZSBBU1QyNjAwX0VWQl9IV19TVFJBUDEgMHgwMDAwMDBDMAorI2Rl
ZmluZSBBU1QyNjAwX0VWQl9IV19TVFJBUDEgKDB4MDAwMDAwQzAgfCBBU1QyNjUwMF9IV19TVFJB
UF9CT09UX1NSQ19FTU1DKQogI2RlZmluZSBBU1QyNjAwX0VWQl9IV19TVFJBUDIgMHgwMDAwMDAw
MwogCiAvKiBUYWNvbWEgaGFyZHdhcmUgdmFsdWUgKi8KLS0gCjIuMzAuMgoK

------=_Part_1853609_816390374.1636478714403--

