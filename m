Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B7A347B4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 15:10:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52429 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hY9Cf-00072z-3x
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 09:10:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Michael.Jacky@protonmail.com>) id 1hY4Br-0008QZ-Gz
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 03:49:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Michael.Jacky@protonmail.com>) id 1hY4Bq-00033K-HA
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 03:49:03 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:60809)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Michael.Jacky@protonmail.com>)
	id 1hY4Bp-0002bf-VO
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 03:49:02 -0400
Date: Tue, 04 Jun 2019 07:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=default; t=1559634535;
	bh=viMk2W9kLp3P1em8l99jI1zVUV2gmJGo46EI922oWR8=;
	h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
	b=QitmR5wdQxvCzGDRZ2NZkuiv97tGVEph+MI0RHs4iTtXyQUENsNHzIDnuh47pQS4x
	810rZMn5yioJ5w33oJtioATSdK0A8LuBDmwnbIHKs7T0aGZiYKrdEjyccqveUk3DWU
	CvZjEctJxxfafjDmbWOHa+sUmg4ixACvAtPsMLG4=
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Message-ID: <F13Qey_Jyf_vQSjmSkO77i-Gt_DGMbZllNK-BrRixfqSg5U8WEHyqMQKTtyGN2wg49CFDgl5xGUjt73oiiJnWsctvX31ex65fFVZU8NnfWo=@protonmail.com>
Feedback-ID: lLRqVZ2xWcsQb5cyu5L-VrK136YRclC-0qoBtesUit4TFTvye7PTxNWtKI7vsxs_WZDkvIgSjjPJjXQg6rqVYA==:Ext:ProtonMail
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.70.40.136
X-Mailman-Approved-At: Tue, 04 Jun 2019 09:08:54 -0400
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: [Qemu-devel] How can i run different router or switch on qemu
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
From: "Michael.Jacky via Qemu-devel" <qemu-devel@nongnu.org>
Reply-To: "Michael.Jacky" <Michael.Jacky@protonmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGVsbG8sCkknbSBzb3JyeSB0byB3YXN0ZSB5b3VyIHRpbWUuCk5vdyBJIGhhdmUgYSBxdWVzdGlv
biBhbmQgaSBjYW4ndCBmaW5kIGFuc3dlciBieSBnb29nbGUuCkkgbmVlZCB0byB1c2UgcWVtdSB0
byBydW4gZGlmZmVyZW50IHJvdXRlcixzd2l0Y2gsYW5kIGRpZmZlcmVudCB0eXBlKGV4YW1wbGU6
Y2lzY28sbmV0Z2Vhcixmb3J0aSBhbmQgbW9yZSkgYW5kIHVzZSBvcGVuc3RhY2sgdm0gdG8gY29u
bmVjdCB0aGVzZSBlcXVpcG1lbnQuCkkgZm91bmQgdGhlc2UgZXF1aXBtZW50IHdpdGggZGlmZmVy
ZW50IHR5cGUsZm9yIGV4YW1wbGUgLmJpbiwuaW1nLGFuZCBkaWZmZXJlbnQgZXF1aXBtZW50IGRp
cmVjdG9yeSBzdHJ1Y3R1cmUgaXMgZGlmZmVyZW50LgpIb3cgY2FuIGkgcnVuIHRoZXNlIGVxdWlw
bWVudHMgb24gcWVtdSBhbmQgd2hhdCBpIG5lZWQgdG8gZG8gZmlyc3QuClRoYW5rIHlvdSB2ZXJ5
IG11Y2gu

