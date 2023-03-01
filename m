Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA3C6A763F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 22:38:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXU9U-00088k-8e; Wed, 01 Mar 2023 16:38:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus.ripke@secunet.com>)
 id 1pXU9S-00087A-M4
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:38:18 -0500
Received: from a.mx.secunet.com ([62.96.220.36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus.ripke@secunet.com>)
 id 1pXU9Q-00011k-QO
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:38:18 -0500
Received: from localhost (localhost [127.0.0.1])
 by a.mx.secunet.com (Postfix) with ESMTP id 43A58200A7;
 Wed,  1 Mar 2023 22:38:11 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
 by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q9Y9lZOs8Tkq; Wed,  1 Mar 2023 22:38:10 +0100 (CET)
Received: from mailout2.secunet.com (mailout2.secunet.com [62.96.220.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by a.mx.secunet.com (Postfix) with ESMTPS id C7C0120082;
 Wed,  1 Mar 2023 22:38:10 +0100 (CET)
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
 by mailout2.secunet.com (Postfix) with ESMTP id B3D4E80004A;
 Wed,  1 Mar 2023 22:38:10 +0100 (CET)
Received: from mbx-dresden-01.secunet.de (10.53.40.199) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 1 Mar 2023 22:37:55 +0100
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 mbx-dresden-01.secunet.de (10.53.40.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 1 Mar 2023 22:37:54 +0100
Received: from mbx-essen-01.secunet.de ([fe80::1522:bd4f:78cd:ce75]) by
 mbx-essen-01.secunet.de ([fe80::1522:bd4f:78cd:ce75%6]) with mapi id
 15.01.2507.017; Wed, 1 Mar 2023 22:37:54 +0100
From: "Ripke, Klaus" <klaus.ripke@secunet.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "philmd@linaro.org"
 <philmd@linaro.org>
CC: "kraxel@redhat.com" <kraxel@redhat.com>, "marcandre.lureau@gmail.com"
 <marcandre.lureau@gmail.com>
Subject: seeking advice for configuring usb_desc in ccid /
 dev-smartcard-reader.c
Thread-Topic: seeking advice for configuring usb_desc in ccid /
 dev-smartcard-reader.c
Thread-Index: AQHZTIYV1mcb9zumxEqVG8c8FR4b3A==
Date: Wed, 1 Mar 2023 21:37:54 +0000
Message-ID: <dc0771fc75bf2028c96724a15b73cffa2ff768bb.camel@secunet.com>
References: <c07957e3813d9d2f84e981bb1b8d99862a2998b9.camel@secunet.com>
 <cff14816-39eb-db1c-9bda-51cad7fcb7c1@linaro.org>
 <9af0fa866799966fd9a4bcb10898d063db651744.camel@secunet.com>
In-Reply-To: <9af0fa866799966fd9a4bcb10898d063db651744.camel@secunet.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FAC496B98152942B7F15B9F84A09DEA@secunet.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
Received-SPF: pass client-ip=62.96.220.36;
 envelope-from=klaus.ripke@secunet.com; helo=a.mx.secunet.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

SGVsbG8NCg0KDQppbiBoZS91c2IvZGV2LXNtYXJ0Y2FyZC1yZWFkZXIuYzogd2UgbmVlZCBhIHNs
aWdodGx5IGRpZmZlcmluZyB2ZXJzaW9uDQpvZiB0aGUgIkF0aGVuYSBTbWFydCBDYXJkIFJlYWRl
ciIgYXMgb2YgcWVtdV9jY2lkX2Rlc2NyaXB0b3Igd2l0aCB0d28NCmJ5dGVzIGNoYW5nZWQgdG8g
Zml4ZWQgImV4dGVuZGVkIiB2YWx1ZXMsIDE0IGZvciBtYXggc2xvdCBhbmQgNCBpbg0KZmVhdHVy
ZSAyLg0KVGhpcyBkYXRhIGlzIHNoYXJlZCBieSBhbGwgY2NpZCBkZXZpY2VzIHRocm91Z2ggYSBj
aGFpbiBkb3duIHRvDQp1c2JfZGVzYyAod2hpY2ggaXMga2xhc3MtPnVzYl9kZXNjIGZvciBhbGwg
Y2NpZCBhcyBvZiBub3cpLg0KDQpTaG91bGQgd2UgYmVzdCBmb2xsb3cgdGhlIHByYWN0aWNlIG9m
IGRldi1hdWRpbyBhbmQgZGV2LWhpZCBieSB1c2luZw0KYW5vdGhlciBzdGF0aWMgY29uZmlnLCBz
ZWxlY3RlZCBieSBzb21lIGRldmljZSBwcm9wZXJ0eT8NCg0KT3IgYmV0dGVyIGR5bmFtaWNhbGx5
IGNyZWF0ZSBhbmQgbW9kaWZ5IGNvcGllcyBvZiBhbGwgc3RydWN0dXJlcyBpbg0KcmVhbGl6ZT8N
Cg0KT3Igc29tZSBvdGhlciB3YXk/DQoNCg0KbWFueSB0aGFua3MgZm9yIHlvdXIgaGVscCwga2lu
ZCByZWdhcmRzDQpLbGF1cw0K

