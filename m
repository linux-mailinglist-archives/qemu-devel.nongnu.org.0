Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD42571BF1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 16:07:37 +0200 (CEST)
Received: from localhost ([::1]:38202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBGY4-0003tO-La
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 10:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vitalii.ovchinnikov@auriga.com>)
 id 1oBBaR-0002XE-LM
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 04:49:44 -0400
Received: from hq-ms.auriga.com ([82.97.202.32]:30356 helo=hq-ms.auriga.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vitalii.ovchinnikov@auriga.com>)
 id 1oBBaO-0007Md-85
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 04:49:41 -0400
Received: from HQ-MS1.office.auriga.msk (82.97.202.32) by
 hq-ms1.office.auriga.msk (82.97.202.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Tue, 12 Jul 2022 11:38:26 +0300
Received: from HQ-MS1.office.auriga.msk ([fe80::e47e:a86e:e738:f45e]) by
 hq-ms1.office.auriga.msk ([fe80::e47e:a86e:e738:f45e%3]) with mapi id
 15.02.1118.007; Tue, 12 Jul 2022 11:38:26 +0300
From: "Ovchinnikov, Vitalii" <vitalii.ovchinnikov@auriga.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Jason Wang <jasowang@redhat.com>
Subject: Internal MAC addresses list (mac_table) usage
Thread-Topic: Internal MAC addresses list (mac_table) usage
Thread-Index: AQHYlcZo8cC1dmFBMkyljjkQx472uw==
Date: Tue, 12 Jul 2022 08:38:26 +0000
Message-ID: <cfdc8ffef03c4574a72faea46f2e1ef1@auriga.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.99.99.26]
x-tm-as-product-ver: SMEX-14.0.0.1158-9.0.1002-27010.002
x-tm-as-result: No-10--2.483200-8.000000
x-tmase-matchedrid: kinNcrfyXcUpsn9kdROMaazSsZt54aj7NjaQozXs+pO6pZ/o2Hu2YYH3
 unOkxn1hb1TGnuLRfUl0R7kGywzHs8SaXeAAVkNsmIe0I1iNyQxMkOX0UoduuZBz1ZAU7t9TyL5
 QmWOgMfCWxW4Piwz4HlVkuxkeBaduY7Ie2kjTlf+p3Btb1bH20N+43C02PchEVz8J52OVy+TwBe
 NyF2o9oEiJ9d0G5WsdPzNxndwjOimjxYyRBa/qJUl4W8WVUOR/9xS3mVzWUuAojN1lLei7Ra49Z
 RiuzE3+tHmgCQyHgZQ5risbGw3F22jk5aRs2g5sDLvuWJyBw/mwYx3R9rliWOXMP06/97STGi9s
 DBu5kqHKdXp2El2Kzef3tOmTVFRyUysIYQW7SlZq9oascRUICazuvRtJcohk
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--2.483200-8.000000
x-tmase-version: SMEX-14.0.0.1158-9.0.1002-27010.002
x-tm-snts-smtp: 6038D5BCB816EA27D36A6A30A92CF28F740F05A3E0A653175ECD6F19538703BB2000:8
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=82.97.202.32;
 envelope-from=vitalii.ovchinnikov@auriga.com; helo=hq-ms.auriga.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 12 Jul 2022 10:01:15 -0400
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

Hi folks,

While developing an Ethernet NIC model I noticed that QEMU maintains the fo=
llowing internal array which marks used/free MAC addresses in net/net.c:

static int mac_table[256] =3D {0};

with three private (static) functions accessing it: qemu_macaddr_set_used, =
qemu_macaddr_set_free, qemu_macaddr_get_free.
Public (non-static) interface to this array includes two functions: qemu_ma=
caddr_default_if_unset and qemu_del_nic.

The vast majority of existing NIC models calls qemu_macaddr_default_if_unse=
t in their *_realize functions replacing zeroed-out MAC address with the fr=
ee one returned by QEMU, for instance (lan9118_realize functions from hw/ne=
t/lan9118.c):

   ...
    qemu_macaddr_default_if_unset(&s->conf.macaddr);

    s->nic =3D qemu_new_nic(&net_lan9118_info, &s->conf,
                          object_get_typename(OBJECT(dev)), dev->id, s);
    qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
   ...

qemu_del_nic is being called from net_cleanup function right before QEMU fi=
nishes execution.

What appears to be a possible SW architecture gap is that NIC models have n=
o means to inform QEMU about changing their MAC addresses during execution =
(again from hw/net/lan9118.c, do_mac_write function):

    case MAC_ADDRH:
        s->conf.macaddr.a[4] =3D val & 0xff;
        s->conf.macaddr.a[5] =3D (val >> 8) & 0xff;
        lan9118_mac_changed(s);
        break;
    case MAC_ADDRL:
        s->conf.macaddr.a[0] =3D val & 0xff;
        s->conf.macaddr.a[1] =3D (val >> 8) & 0xff;
        s->conf.macaddr.a[2] =3D (val >> 16) & 0xff;
        s->conf.macaddr.a[3] =3D (val >> 24) & 0xff;
        lan9118_mac_changed(s);
        break;

lan9118_mac_changed function here simply changes NIC info string using qemu=
_format_nic_info_str, hence stale MAC address stays marked as used in the m=
ac_table whereas it's not actually in use any more.

Am I right in thinking of it as a SW architecture gap/bug that needs to be =
addressed?

BR,
Vitalii=

