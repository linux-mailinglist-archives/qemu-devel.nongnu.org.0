Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB5AA4E4A
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Sep 2019 06:18:03 +0200 (CEST)
Received: from localhost ([::1]:33162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i4dmz-0005XR-QN
	for lists+qemu-devel@lfdr.de; Mon, 02 Sep 2019 00:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57908)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhlb29@foxmail.com>) id 1i4dll-0004wC-UA
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 00:16:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhlb29@foxmail.com>) id 1i4dlk-0008LE-J2
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 00:16:45 -0400
Received: from smtpproxy19.qq.com ([184.105.206.84]:42612)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhlb29@foxmail.com>) id 1i4dlj-0008G4-Q5
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 00:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1567397792;
 bh=42BupgJXk9ZNUFDJ7lt14+x4fwJ5tKpPhQsLysjygjQ=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=pO9HvkFhVF09G+eORZyjMPVqyqz3nyvWdigx2+ah2i0AB7vDIUcw9CCpJH8Ev3VRL
 ZXHbQF77uYQ0JbUpzIgTZ4o8Jc6A84KiQUcURYwK0+VuY3i7fFVLo5GI50TspVqTId
 lr6WgTm8Y9gRuz1XBjJVct1LpNq6XTmHbRqK0qms=
X-QQ-FEAT: 7560NedJMvuyQlXpbqJHN1ZU+RF5o6misGmPNoLBBu+YTLW5/RxBsvZ3P1SRv
 OqQrTpr9eO6iUJexFNyiwiMsvkHpQzTfpzPAqIoUQISpNufrV4/o0TT17gt06EZcjc5wExx
 Z2TltzuLVAgAyvmQ+Cys/ArqLJeyyXvQsE68nIfVBFKdrDEI1cSn4WO0g9EU9+fOKc+NEOv
 1A2hs8xCQ97590EHrWohs8ucf4JOLlhYQH/uAsIZy/hVXtqh6cEJ4dCNRTU/4SqVTvjfZF4
 ipYqhDRHtu8z3OrXNOFCDTWEvnLwmfe/KST+lb/7qapKU7
X-QQ-SSF: 000100000000008000000000000000G
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 124.200.70.7
X-QQ-STYLE: 
X-QQ-mid: webmail190t1567397791t3633208
From: "=?gb18030?B?TGlibyBaaG91?=" <zhlb29@foxmail.com>
To: "=?gb18030?B?cWVtdS1kZXZlbA==?=" <qemu-devel@nongnu.org>
Mime-Version: 1.0
Date: Mon, 2 Sep 2019 12:16:31 +0800
X-Priority: 3
Message-ID: <tencent_61024D4F136E131E2B085A7DACEA1593D007@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Mon, 02 Sep 2019 12:16:31 +0800 (CST)
Feedback-ID: webmail:foxmail.com:bgforeign:bgforeign4
X-QQ-Bgrelay: 1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 184.105.206.84
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: [Qemu-devel] Uncaught target signal 11 (Segmentation Faullt)
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SSBhbSB0cnlpbmcgdG8gcnVuIGEgc2ltcGxlIE1JUFMgcHJvZ3JhbSB3aXRoIFFFTVUgdXNl
ciBtb2RlLg0KDQoNCg0KSG9zdDogVWJ1bnR1IDE4LjA0IExUUyBvbiB4ODZfNjQNClFFTVUg
Y29uZmlnOiAuLi9jb25maWd1cmUgLS10YXJnZXQtbGlzdD1taXBzLWxpbnV4LXVzZXINCg0K
Q3Jvc3MgQ29tcGlsZXI6IHN1ZG8gYXB0IGluc3RhbGwgZ2NjLW1pcHMtbGludXgtZ251DQoN
Cg0KTXkgdGVzdC5jIGlzIHNpbXBsZTogaW50IG1haW4odm9pZCkge2ludCBhID0gMTsgaW50
IGIgPTI7IGludCBjOyBjID0gYSArIGI7IHJldHVybiAwO30NCkFmdGVyIGNvbXBpbGluZyBp
dCB3aXRoICJtaXBzLWxpbnV4LWdudS1nY2MgdGVzdC5jIC1vIHRlc3QiLCBJIHJhbiBpdCB3
aXRoICIuL3FlbXUtbWlwcyAtTCAvdXNyL21pcHMtbGludXgtZ251IHRlc3QiLCB0aGVuIEkg
Z290IHRoZSBmb2xsb3dpbmcgZXJyb3IgbWVzc2FnZToNCnFlbXU6IHVuY2F1Z2h0IHRhcmdl
dCBzaWduYWwgMTEgKFNlZ21lbnRhdGlvbiBmYXVsdCkgLSBjb3JlIGR1bXBlZA0KDQoNCkRv
ZXMgYW55b25lIGhhdmUgYSBzb2x1dGlvbiB0byB0aGlzPyBUaGFuayB5b3UgaW4gYWR2YW5j
ZS4NCg0KDQpDaGVlcnMsDQpMaWJv
