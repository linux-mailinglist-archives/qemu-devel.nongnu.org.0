Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9BB312A4E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 06:57:55 +0100 (CET)
Received: from localhost ([::1]:36134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8zYX-000359-Vy
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 00:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1l8zO3-0007hd-Gc
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 00:47:03 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:35765)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1l8zNs-0006SB-Ja
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 00:47:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1612763212; x=1644299212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XdAbo6GLl79o0whpMsVGoX/WeX/QuSgIWlP30a3+/rM=;
 b=RjJYiQtjdNL9aNxaIQpwmsoh/avGyeMvuDdpmZvwkkRKTjB9GUVxjYDB
 2djYKemSKAMjAc16RIM5/FtGBPDEQJEvo4zz0SiluMt5gEC2nPAvol9bL
 AHp7L6Aieg44ALfPKUyQuoB92QBXTBUG0XHAQr1E3ysAr4zkDxehEjluV o=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 07 Feb 2021 21:46:30 -0800
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg04-sd.qualcomm.com with ESMTP; 07 Feb 2021 21:46:29 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id EC24A2C77; Sun,  7 Feb 2021 23:46:28 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 06/35] Hexagon (target/hexagon) register names
Date: Sun,  7 Feb 2021 23:45:56 -0600
Message-Id: <1612763186-18161-7-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, tsimpson@quicinc.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpSZXZp
ZXdlZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+
ClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPgot
LS0KIHRhcmdldC9oZXhhZ29uL2hleF9yZWdzLmggfCA4MyArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDgzIGluc2VydGlvbnMo
KykKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0YXJnZXQvaGV4YWdvbi9oZXhfcmVncy5oCgpkaWZmIC0t
Z2l0IGEvdGFyZ2V0L2hleGFnb24vaGV4X3JlZ3MuaCBiL3RhcmdldC9oZXhhZ29uL2hleF9yZWdz
LmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uZjI5MTkxMQotLS0gL2Rldi9u
dWxsCisrKyBiL3RhcmdldC9oZXhhZ29uL2hleF9yZWdzLmgKQEAgLTAsMCArMSw4MyBAQAorLyoK
KyAqICBDb3B5cmlnaHQoYykgMjAxOS0yMDIxIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJ
bmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisgKgorICogIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNv
ZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CisgKiAgaXQgdW5k
ZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNo
ZWQgYnkKKyAqICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAy
IG9mIHRoZSBMaWNlbnNlLCBvcgorICogIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNp
b24uCisgKgorICogIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0
IGl0IHdpbGwgYmUgdXNlZnVsLAorICogIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91
dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisgKiAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJ
VE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQorICogIEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisgKgorICogIFlvdSBzaG91bGQgaGF2
ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCisgKiAg
YWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcv
bGljZW5zZXMvPi4KKyAqLworCisjaWZuZGVmIEhFWEFHT05fUkVHU19ICisjZGVmaW5lIEhFWEFH
T05fUkVHU19ICisKK2VudW0geworICAgIEhFWF9SRUdfUjAwICAgICAgICAgICAgICA9IDAsCisg
ICAgSEVYX1JFR19SMDEgICAgICAgICAgICAgID0gMSwKKyAgICBIRVhfUkVHX1IwMiAgICAgICAg
ICAgICAgPSAyLAorICAgIEhFWF9SRUdfUjAzICAgICAgICAgICAgICA9IDMsCisgICAgSEVYX1JF
R19SMDQgICAgICAgICAgICAgID0gNCwKKyAgICBIRVhfUkVHX1IwNSAgICAgICAgICAgICAgPSA1
LAorICAgIEhFWF9SRUdfUjA2ICAgICAgICAgICAgICA9IDYsCisgICAgSEVYX1JFR19SMDcgICAg
ICAgICAgICAgID0gNywKKyAgICBIRVhfUkVHX1IwOCAgICAgICAgICAgICAgPSA4LAorICAgIEhF
WF9SRUdfUjA5ICAgICAgICAgICAgICA9IDksCisgICAgSEVYX1JFR19SMTAgICAgICAgICAgICAg
ID0gMTAsCisgICAgSEVYX1JFR19SMTEgICAgICAgICAgICAgID0gMTEsCisgICAgSEVYX1JFR19S
MTIgICAgICAgICAgICAgID0gMTIsCisgICAgSEVYX1JFR19SMTMgICAgICAgICAgICAgID0gMTMs
CisgICAgSEVYX1JFR19SMTQgICAgICAgICAgICAgID0gMTQsCisgICAgSEVYX1JFR19SMTUgICAg
ICAgICAgICAgID0gMTUsCisgICAgSEVYX1JFR19SMTYgICAgICAgICAgICAgID0gMTYsCisgICAg
SEVYX1JFR19SMTcgICAgICAgICAgICAgID0gMTcsCisgICAgSEVYX1JFR19SMTggICAgICAgICAg
ICAgID0gMTgsCisgICAgSEVYX1JFR19SMTkgICAgICAgICAgICAgID0gMTksCisgICAgSEVYX1JF
R19SMjAgICAgICAgICAgICAgID0gMjAsCisgICAgSEVYX1JFR19SMjEgICAgICAgICAgICAgID0g
MjEsCisgICAgSEVYX1JFR19SMjIgICAgICAgICAgICAgID0gMjIsCisgICAgSEVYX1JFR19SMjMg
ICAgICAgICAgICAgID0gMjMsCisgICAgSEVYX1JFR19SMjQgICAgICAgICAgICAgID0gMjQsCisg
ICAgSEVYX1JFR19SMjUgICAgICAgICAgICAgID0gMjUsCisgICAgSEVYX1JFR19SMjYgICAgICAg
ICAgICAgID0gMjYsCisgICAgSEVYX1JFR19SMjcgICAgICAgICAgICAgID0gMjcsCisgICAgSEVY
X1JFR19SMjggICAgICAgICAgICAgID0gMjgsCisgICAgSEVYX1JFR19SMjkgICAgICAgICAgICAg
ID0gMjksCisgICAgSEVYX1JFR19TUCAgICAgICAgICAgICAgID0gMjksCisgICAgSEVYX1JFR19G
UCAgICAgICAgICAgICAgID0gMzAsCisgICAgSEVYX1JFR19SMzAgICAgICAgICAgICAgID0gMzAs
CisgICAgSEVYX1JFR19MUiAgICAgICAgICAgICAgID0gMzEsCisgICAgSEVYX1JFR19SMzEgICAg
ICAgICAgICAgID0gMzEsCisgICAgSEVYX1JFR19TQTAgICAgICAgICAgICAgID0gMzIsCisgICAg
SEVYX1JFR19MQzAgICAgICAgICAgICAgID0gMzMsCisgICAgSEVYX1JFR19TQTEgICAgICAgICAg
ICAgID0gMzQsCisgICAgSEVYX1JFR19MQzEgICAgICAgICAgICAgID0gMzUsCisgICAgSEVYX1JF
R19QM18wICAgICAgICAgICAgID0gMzYsCisgICAgSEVYX1JFR19NMCAgICAgICAgICAgICAgID0g
MzgsCisgICAgSEVYX1JFR19NMSAgICAgICAgICAgICAgID0gMzksCisgICAgSEVYX1JFR19VU1Ig
ICAgICAgICAgICAgID0gNDAsCisgICAgSEVYX1JFR19QQyAgICAgICAgICAgICAgID0gNDEsCisg
ICAgSEVYX1JFR19VR1AgICAgICAgICAgICAgID0gNDIsCisgICAgSEVYX1JFR19HUCAgICAgICAg
ICAgICAgID0gNDMsCisgICAgSEVYX1JFR19DUzAgICAgICAgICAgICAgID0gNDQsCisgICAgSEVY
X1JFR19DUzEgICAgICAgICAgICAgID0gNDUsCisgICAgSEVYX1JFR19VUENZQ0xFTE8gICAgICAg
ID0gNDYsCisgICAgSEVYX1JFR19VUENZQ0xFSEkgICAgICAgID0gNDcsCisgICAgSEVYX1JFR19G
UkFNRUxJTUlUICAgICAgID0gNDgsCisgICAgSEVYX1JFR19GUkFNRUtFWSAgICAgICAgID0gNDks
CisgICAgSEVYX1JFR19QS1RDTlRMTyAgICAgICAgID0gNTAsCisgICAgSEVYX1JFR19QS1RDTlRI
SSAgICAgICAgID0gNTEsCisgICAgLyogVXNlIHJlc2VydmVkIGNvbnRyb2wgcmVnaXN0ZXJzIGZv
ciBxZW11IGV4ZWN1dGlvbiBjb3VudHMgKi8KKyAgICBIRVhfUkVHX1FFTVVfUEtUX0NOVCAgICAg
ID0gNTIsCisgICAgSEVYX1JFR19RRU1VX0lOU05fQ05UICAgICA9IDUzLAorICAgIEhFWF9SRUdf
VVRJTUVSTE8gICAgICAgICAgPSA2MiwKKyAgICBIRVhfUkVHX1VUSU1FUkhJICAgICAgICAgID0g
NjMsCit9OworCisjZW5kaWYKLS0gCjIuNy40Cgo=

