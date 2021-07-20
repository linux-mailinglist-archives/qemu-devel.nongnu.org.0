Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDCF3CF26F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 05:12:12 +0200 (CEST)
Received: from localhost ([::1]:38816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5gB1-0008FP-Oj
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 23:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <intermediadc@hotmail.com>)
 id 1m5g9C-0007Gq-On; Mon, 19 Jul 2021 23:10:18 -0400
Received: from mail-vi1eur05olkn2085.outbound.protection.outlook.com
 ([40.92.90.85]:64480 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <intermediadc@hotmail.com>)
 id 1m5g96-0007Lw-LN; Mon, 19 Jul 2021 23:10:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wvd6fZ4e2M0xRULr6M62Bn6Jm3/EL/wDD0x5KThoyiaGfaiWxVxhUzpe0txCdvD/679PmOdSodWrO0HRJqn2fyL3Kxe7LNH5XkS+yHrRxjeA7lrMZKb7T+1AJlo/5lFuPvakEO4x8xE5J5LscGZWdBS8txeVTTqP01EcXk4zP4wdw7E6cw3E5g9L2tutwRHzlUKcfNFpodL8zr/IOtLkLm2ACyCIAM6xqrdJGBjmwYM8171y4uv1p2vJRVrLgoxbYyk8sa+ib9g5mlDaGk/PbJFfX+7eqGfjd10shQQ9Bps2AYu9ZTnheMZg8500f6Z5ZZtHhIoBgkFPKb3F2mtHNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXHax0+OYenKU0TAzOPhUKJiy4Z/DbmgMaotsF0k9u8=;
 b=GPSnD/tMx511gIJhdZZZJP36ZFgHh6Re/CT5lpMNwpgZFnFaOW71FkNN8hmVPGs/alXs7Nn7rmd7oRkVwgTAS9HcUvParlj201cri00kv4AvCtmR7IQ9D1EVKvC/l4CLHOisKmAQLVAIpII8qRaj2DiPGTTzWBEF4GkrhsfR0Uh2hVDABGXIuXKvN7JG+VrponzSdDamUsMYE/hQ97jTk+6g1WOzu2jqIcp+JElEvhZjMqKDQ8pnMtcyd14wEHWuCf8+piQp6UUwYJeQwv/fEBYXCKVi2CyQzz13+t4fycdxUUrZ1szlQwEv/5VVFH3DF4peYtxW82jDkc6yHC6VTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXHax0+OYenKU0TAzOPhUKJiy4Z/DbmgMaotsF0k9u8=;
 b=oAmv2cxUp/fETGMtAVTAR6+IsNhRPjh8UvFd0RhXBPzmrA3ff1wpg6CBJKNFwjYaUNLOZd20w5wjXQiaPWMZ+nZr0sSxjNgeLMjQ1e1HImkpQs3thSlFqQJrtZLC/TZ9lx6gY1bL3f+HywYLRbtYnqO385jwnY1fkTn1hrGUXYzKQTGqfpxO/BxX5sqBwGQB5hxn6Oz4+IPDLIHlyD7F/9g1GW6DhqU90HDLqJJprGDl4pBEv58aLXA/ZwGYgDTddcC46aSygYa3pGjry6C3ic2GPdKblzhSFI72Asc+rdGRjRqQxGlxRbp8lHjBQr3l/Ba/f9HWuNsJQ9uoMemzjw==
Received: from AM7PR03MB6579.eurprd03.prod.outlook.com (2603:10a6:20b:1c3::22)
 by AS8PR03MB6950.eurprd03.prod.outlook.com (2603:10a6:20b:23e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Tue, 20 Jul
 2021 03:10:08 +0000
Received: from AM7PR03MB6579.eurprd03.prod.outlook.com
 ([fe80::edf6:af70:24e4:4e37]) by AM7PR03MB6579.eurprd03.prod.outlook.com
 ([fe80::edf6:af70:24e4:4e37%4]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 03:10:08 +0000
From: luigi burdo <intermediadc@hotmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: R: R: [PULL 0/3] ppc-for-6.1 queue 20210713
Thread-Topic: R: [PULL 0/3] ppc-for-6.1 queue 20210713
Thread-Index: AQHXd4vsuqOtcHULYEO3zuYAiDlsqqtHPJMqgABfwgCAAy3yBw==
Date: Tue, 20 Jul 2021 03:10:08 +0000
Message-ID: <AM7PR03MB6579113A5DB8C252A57CEB00C8E19@AM7PR03MB6579.eurprd03.prod.outlook.com>
References: <20210713020736.28960-1-david@gibson.dropbear.id.au>
 <AM7PR03MB65797B7495CACEE7AA4C70A0C8109@AM7PR03MB6579.eurprd03.prod.outlook.com>,
 <ff76ae6-28a7-7139-9c58-ed507f438d89@eik.bme.hu>
In-Reply-To: <ff76ae6-28a7-7139-9c58-ed507f438d89@eik.bme.hu>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [FZm51WliwXcZXKqNH3gptTiknBy1DZ/+Wh7sFbx99fBZ2A+DHw7+qKcamBW7gd+R]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98d0fd01-bab6-4b42-dd68-08d94b2be12d
x-ms-traffictypediagnostic: AS8PR03MB6950:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1Dt3/aprDvCrqyrPw79StXM2zjv0T40W+bILPPsnYVl0LKmTEyHTvi13Z9MIwRdBRAt0ii7RZP6wZ/XgaDopsBpZQZqKGyvVGfzg5BeDYlZabwc7pFJK46+BBFQQdMY42LfaSUZs3nKmM3/ByXvIMhPp1RpHSwvXgPKsFskTDPj6Epf2CGUtmXMZ0njPxfVb/yTnsk8U8GMyxOZ4H8PUXmoXXVH3FzR7X1E90uhnV6eQXvCZm0rKtqBfMjWsPuLs3gOxlqFbJMy1bcyujIu+MF6XlbJBmW3wFk4j+SzxsbEhnvcfAOCOo5xIcZYa6cxgDZrV8WBAIkzJY+v1G2JOufsUbaBjKhThMtxgdNbAlX4iraDk2TpKlbZJ0J2sm7DdhUarrjmSSbY9eozlXOlSyL0rbUGzUfzWyH+ltOONCxkIXtCtmjT01T5I1a/nnNz6lu5+t8cjYWw73kLjEqdSP1Fjng4teek7Vz8a+m/gwhY=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: Sz+qWsePCkqT+LK3FcKahciGL6hnDSYeBfk/HGvt0fxcvhgRazXK5qVg1iE0fnF87V53CNWr12kOd2LtkKybRaJXfyVVG1qA+2TP/GzR0DBxsXuOJERwYK8nIrtJOHworJEV/5Ju8j9+WyVZw/FAg+kFwB3aa6LsETg6uYl0/4f2fXZo3u5XsyMl5sOLSq+dlHVzde6qzuNKcV34qyfVPA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_AM7PR03MB6579113A5DB8C252A57CEB00C8E19AM7PR03MB6579eurp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-e50d8.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6579.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d0fd01-bab6-4b42-dd68-08d94b2be12d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 03:10:08.2574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6950
Received-SPF: pass client-ip=40.92.90.85;
 envelope-from=intermediadc@hotmail.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_AM7PR03MB6579113A5DB8C252A57CEB00C8E19AM7PR03MB6579eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

I Zoltan,
i was able to build on my quad qemu, a ram bank was die and make me the iss=
ue with gcc..
this is what happening if i run pegasos 2 with --enable-kvm.

via_superio_cfg: unimplemented register 0xf2
via_superio_cfg: unimplemented register 0xf4
via_superio_cfg: unimplemented register 0xf6
via_superio_cfg: unimplemented register 0xf7
via_superio_cfg: unimplemented register 0xf4
via_superio_cfg: unimplemented register 0xf2
PegasosII Boot Strap (c) 2002-2003 bplan GmbH
Running on CPU PVR:000C0209
Enable L1 ICache...                                                    Done=
.
mv64361_write: Unimplemented register write 0x108 =3D 0
Reading W83194 :                                                       FAIL=
ED.
Setting Front Side Bus to 133MHz...                                    FAIL=
ED.
Invalid access at addr 0xFE000E43, size 1, region '(null)', reason: rejecte=
d
Invalid access at addr 0xFE000E44, size 1, region '(null)', reason: rejecte=
d
Invalid access at addr 0xFE000E41, size 1, region '(null)', reason: rejecte=
d
Invalid access at addr 0xFE000E42, size 1, region '(null)', reason: rejecte=
d
Invalid access at addr 0xFE000E40, size 1, region '(null)', reason: rejecte=
d
Configuring DDR...mv64361_write: Unimplemented register write 0x1494 =3D 29=
1
mv64361_write: Unimplemented register write 0x1494 =3D 291
mv64361_write: Unimplemented register write 0x1494 =3D 291
mv64361_write: Unimplemented register write 0x1494 =3D 291

(tooo many i cut)

mv64361_write: Unimplemented register write 0x1494 =3D 291
mv64361_write: Unimplemented register write 0x1494 =3D 291
mv64361_write: Unimplemented register write 0x1494 =3D 291
mv64361_write: Unimplemented register write 0x1494 =3D 291
mv64361_write: Unimplemented register write 0x1480 =3D 300000
mv64361_write: Unimplemented register write 0x10 =3D 0
mv64361_write: Unimplemented register write 0x210 =3D 0
mv64361_write: Unimplemented register write 0x20 =3D 0
mv64361_write: Unimplemented register write 0x220 =3D 0
mv64361_write: Unimplemented register write 0x8 =3D 0
mv64361_write: Unimplemented register write 0x208 =3D 20000000
mv64361_write: Unimplemented register write 0x18 =3D 40000000
mv64361_write: Unimplemented register write 0x218 =3D 60000000
mv64361_write: Unimplemented register write 0x8 =3D 0
mv64361_write: Unimplemented register write 0x10 =3D 1fff
mv64361_write: Unimplemented register write 0x208 =3D 2000
mv64361_write: Unimplemented register write 0x210 =3D 1fff
mv64361_write: Unimplemented register write 0x1400 =3D 58200400
mv64361_write: Unimplemented register write 0x1404 =3D 24110051
mv64361_write: Unimplemented register write 0x1408 =3D 12813330
mv64361_write: Unimplemented register write 0x140c =3D 11b
mv64361_write: Unimplemented register write 0x1414 =3D 0
mv64361_write: Unimplemented register write 0x1410 =3D 12
mv64361_write: Unimplemented register write 0x1418 =3D 5
mv64361_read: Unimplemented register read 0x1418
mv64361_write: Unimplemented register write 0x1418 =3D 1
mv64361_read: Unimplemented register read 0x1418
mv64361_write: Unimplemented register write 0x1420 =3D 0
mv64361_write: Unimplemented register write 0x1418 =3D 4
mv64361_read: Unimplemented register read 0x1418
mv64361_write: Unimplemented register write 0x141c =3D 162
mv64361_write: Unimplemented register write 0x1418 =3D 3
mv64361_read: Unimplemented register read 0x1418
mv64361_write: Unimplemented register write 0x141c =3D 62
mv64361_write: Unimplemented register write 0x1418 =3D 3
mv64361_read: Unimplemented register read 0x1418
mv64361_write: Unimplemented register write 0x1418 =3D 1
mv64361_read: Unimplemented register read 0x1418
mv64361_write: Unimplemented register write 0x1418 =3D 2
mv64361_read: Unimplemented register read 0x1418
mv64361_write: Unimplemented register write 0x1418 =3D 2
mv64361_read: Unimplemented register read 0x1418
                                                     Done.
Configuring PCI0...mv64361_write: Unimplemented register write 0xc3c =3D ff=
ffffff
mv64361_read: Unimplemented register read 0x10
mv64361_write: Unimplemented register write 0xc08 =3D 0
mv64361_read: Unimplemented register read 0x210
mv64361_write: Unimplemented register write 0xd08 =3D 0
mv64361_read: Unimplemented register read 0x20
mv64361_write: Unimplemented register write 0xc0c =3D 0
mv64361_read: Unimplemented register read 0x220
mv64361_write: Unimplemented register write 0xd0c =3D 0
mv64361_write: Unimplemented register write 0xc10 =3D 0
mv64361_write: Unimplemented register write 0xd10 =3D 0
mv64361_write: Unimplemented register write 0xd18 =3D 0
mv64361_write: Unimplemented register write 0xc14 =3D 0
mv64361_write: Unimplemented register write 0xd14 =3D 0
mv64361_write: Unimplemented register write 0xd1c =3D 0
mv64361_write: Unimplemented register write 0xd20 =3D 0
mv64361_write: Unimplemented register write 0xd24 =3D 0
mv64361_write: Unimplemented register write 0xd28 =3D 0
mv64361_write: Unimplemented register write 0xe00 =3D 0
                                                    Done.
Configuring PCI1...mv64361_write: Unimplemented register write 0xcbc =3D ff=
ffffff
mv64361_read: Unimplemented register read 0x10
mv64361_write: Unimplemented register write 0xc88 =3D 0
mv64361_read: Unimplemented register read 0x210
mv64361_write: Unimplemented register write 0xd88 =3D 0
mv64361_read: Unimplemented register read 0x20
mv64361_write: Unimplemented register write 0xc8c =3D 0
mv64361_read: Unimplemented register read 0x220
mv64361_write: Unimplemented register write 0xd8c =3D 0
mv64361_write: Unimplemented register write 0xc90 =3D 0
mv64361_write: Unimplemented register write 0xd90 =3D 0
mv64361_write: Unimplemented register write 0xd98 =3D 0
mv64361_write: Unimplemented register write 0xc94 =3D 0
mv64361_write: Unimplemented register write 0xd94 =3D 0
mv64361_write: Unimplemented register write 0xd9c =3D 0
mv64361_write: Unimplemented register write 0xda0 =3D 0
mv64361_write: Unimplemented register write 0xda4 =3D 0
mv64361_write: Unimplemented register write 0xda8 =3D 0
mv64361_write: Unimplemented register write 0xe80 =3D 0
                                                    Done.
Configuring ETH...mv64361_write: Unimplemented register write 0x2290 =3D 3f
mv64361_read: Unimplemented register read 0x10
mv64361_write: Unimplemented register write 0x2204 =3D 0
mv64361_write: Unimplemented register write 0x2200 =3D 0
mv64361_read: Unimplemented register read 0x210
mv64361_write: Unimplemented register write 0x220c =3D 0
mv64361_write: Unimplemented register write 0x2208 =3D 0
mv64361_read: Unimplemented register read 0x20
mv64361_write: Unimplemented register write 0x2214 =3D 0
mv64361_write: Unimplemented register write 0x2210 =3D 0
mv64361_read: Unimplemented register read 0x220
mv64361_write: Unimplemented register write 0x221c =3D 0
mv64361_write: Unimplemented register write 0x2218 =3D 0
mv64361_write: Unimplemented register write 0x2220 =3D 0
mv64361_write: Unimplemented register write 0x2224 =3D 0
mv64361_write: Unimplemented register write 0x2228 =3D 0
mv64361_write: Unimplemented register write 0x222c =3D 0
mv64361_write: Unimplemented register write 0x2290 =3D 3f
mv64361_write: Unimplemented register write 0x2000 =3D e0
                                                     Done.
mv64361_write: Unimplemented register write 0xd9c =3D 1ffff000
mv64361_read: Unimplemented register read 0xcbc
mv64361_write: Unimplemented register write 0xcbc =3D 0
mv64361_write: Unimplemented register write 0xf008 =3D 30011
mv64361_write: Unimplemented register write 0x1d00 =3D 801f0030
mv64361_read: Unimplemented register read 0xc80
mv64361_write: Unimplemented register write 0xc80 =3D 0
mv64361_read: Unimplemented register read 0x1424
mv64361_write: Unimplemented register write 0x1424 =3D 1000000
Releasing IDE reset ...                                                Done=
.
Configuring Legacy Devices
Initializing KBD...Invalid access at addr 0xFE0003F0, size 1, region '(null=
)', reason: rejected
                                                    Done.
via_superio_cfg: unimplemented register 0xf6
via_superio_cfg: unimplemented register 0xf7
via_superio_cfg: unimplemented register 0xf2
Invalid access at addr 0xFE000084, size 1, region '(null)', reason: rejecte=
d
Invalid access at addr 0xFE000085, size 1, region '(null)', reason: rejecte=
d
Invalid access at addr 0xFE000086, size 1, region '(null)', reason: rejecte=
d
Invalid access at addr 0xFE000088, size 1, region '(null)', reason: rejecte=
d
Invalid access at addr 0xFE00008C, size 1, region '(null)', reason: rejecte=
d
Invalid access at addr 0xFE00008D, size 1, region '(null)', reason: rejecte=
d
Invalid access at addr 0xFE00008E, size 1, region '(null)', reason: rejecte=
d
Testing 10000000 Bytes, Pass: 00000000 Failed: 00000000

In dmesg i had many of this.

[ 3634.418495] kvmppc_exit_pr_progint: emulation at 700 failed (00000700)
[ 3634.418525] Couldn't emulate instruction 0x00000700 (op 0 xop 896)
[ 3634.418551] Couldn't emulate instruction 0x00000700 (op 0 xop 896)
[ 3634.418577] Couldn't emulate instruction 0x00000700 (op 0 xop 896)
[ 3634.418603] Couldn't emulate instr...

___
i will build  latest linux kernel and do new test.
thanks
Luigi

________________________________
Da: BALATON Zoltan <balaton@eik.bme.hu>
Inviato: sabato 17 luglio 2021 21:55
A: luigi burdo <intermediadc@hotmail.com>
Cc: David Gibson <david@gibson.dropbear.id.au>; peter.maydell@linaro.org <p=
eter.maydell@linaro.org>; groug@kaod.org <groug@kaod.org>; qemu-ppc@nongnu.=
org <qemu-ppc@nongnu.org>; qemu-devel@nongnu.org <qemu-devel@nongnu.org>
Oggetto: Re: R: [PULL 0/3] ppc-for-6.1 queue 20210713

On Sat, 17 Jul 2021, luigi burdo wrote:
> Hi
> i small report
> im try to build last relesase on a PowerMac G5 quad on debian sid PPC64 b=
ut ld exit with an error:

Looks like it's gcc that crashes not ld. If you're sure it's not a
hardware problem this may be a gcc bug. Sometimes big compile jobs can
break if a machine is not stable but if it always fails at the same place
and does not fail when compiling something else like a Linux kernel then
it's more likely to be an actual bug. That function has some crazy use of
macros so maybe it's exposing some bug in gcc. You could restrict what
targets you build with --target-list configure option of QEMU if you don't
actually need mips (compiling will be faster if you only build the targets
you need) or you can try with clang if available in your distro to check
if that works better. If this can be consistently reproduced you could try
reporting it to gcc as the error message suggests. Probably not much QEMU
can do about it.

Regards,
BALATON Zoltan

> gigi@debian:~/src/tags/ppc-for-6.1-20210713/build$ ninja
> [3864/9215] Compiling C object libqemu-mipsel-softmmu.fa.p/target_mips_tc=
g_msa_helper.c.o
> FAILED: libqemu-mipsel-softmmu.fa.p/target_mips_tcg_msa_helper.c.o
> cc -Ilibqemu-mipsel-softmmu.fa.p -I. -I.. -Itarget/mips -I../target/mips =
-I../capstone/include/capstone -Iqapi -Itrace -Iui -Iui/shader -I/usr/inclu=
de/pixman-1 -I/usr/include/glib-2.0 -I/usr/lib/powerpc64-linux-gnu/glib-2.0=
/include -fdiagnostics-color=3Dauto -pipe -Wall -Winvalid-pch -Werror -std=
=3Dgnu11 -O2 -g -isystem /home/gigi/src/tags/ppc-for-6.1-20210713/linux-hea=
ders -isystem linux-headers -iquote . -iquote /home/gigi/src/tags/ppc-for-6=
.1-20210713 -iquote /home/gigi/src/tags/ppc-for-6.1-20210713/include -iquot=
e /home/gigi/src/tags/ppc-for-6.1-20210713/disas/libvixl -iquote /home/gigi=
/src/tags/ppc-for-6.1-20210713/tcg/ppc -pthread -U_FORTIFY_SOURCE -D_FORTIF=
Y_SOURCE=3D2 -m64 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURC=
E -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-p=
rototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration =
-Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-=
self -Wignored-qualifiers -Wempt
 y-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-f=
allthrough=3D2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psa=
bi -fstack-protector-strong -fPIE -isystem../linux-headers -isystemlinux-he=
aders -DNEED_CPU_H '-DCONFIG_TARGET=3D"mipsel-softmmu-config-target.h"' '-D=
CONFIG_DEVICES=3D"mipsel-softmmu-config-devices.h"' -MD -MQ libqemu-mipsel-=
softmmu.fa.p/target_mips_tcg_msa_helper.c.o -MF libqemu-mipsel-softmmu.fa.p=
/target_mips_tcg_msa_helper.c.o.d -o libqemu-mipsel-softmmu.fa.p/target_mip=
s_tcg_msa_helper.c.o -c ../target/mips/tcg/msa_helper.c
> during RTL pass: sched1
> ../target/mips/tcg/msa_helper.c: In function =91helper_msa_fmin_df=92:
> ../target/mips/tcg/msa_helper.c:7536:1: internal compiler error: Errore d=
i segmentazione
> 7536 | }
>      | ^
> 0x3fffa7b8e1c3 generic_start_main
> ../csu/libc-start.c:308
> 0x3fffa7b8e3d3 __libc_start_main
> ../sysdeps/unix/sysv/linux/powerpc/libc-start.c:98
> Please submit a full bug report,
> with preprocessed source if appropriate.
> Please include the complete backtrace with any bug report.
> See <file:///usr/share/doc/gcc-10/README.Bugs> for instructions.
> [3869/9215] Compiling C object libqemu-mipsel-softmmu.fa.p/target_mips_tc=
g_translate.c.o
> ninja: build stopped: subcommand failed.
>
> Ciao
> Luigi
> ________________________________
> Da: Qemu-ppc <qemu-ppc-bounces+intermediadc=3Dhotmail.com@nongnu.org> per=
 conto di David Gibson <david@gibson.dropbear.id.au>
> Inviato: marted=EC 13 luglio 2021 04:07
> A: peter.maydell@linaro.org <peter.maydell@linaro.org>; groug@kaod.org <g=
roug@kaod.org>
> Cc: qemu-ppc@nongnu.org <qemu-ppc@nongnu.org>; qemu-devel@nongnu.org <qem=
u-devel@nongnu.org>; David Gibson <david@gibson.dropbear.id.au>
> Oggetto: [PULL 0/3] ppc-for-6.1 queue 20210713
>
> The following changes since commit 57e28d34c0cb04abf7683ac6a12c87ede447c3=
20:
>
>  Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210708'=
 into staging (2021-07-12 19:15:11 +0100)
>
> are available in the Git repository at:
>
>  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.1-20210713
>
> for you to fetch changes up to c785a40179b10ce2d7a4afdb04f63c98d53a1756:
>
>  mv64361: Remove extra break from a switch case (2021-07-13 10:12:17 +100=
0)
>
> ----------------------------------------------------------------
> ppc patch queue 2021-07-13
>
> I thought I'd sent the last PR before the 6.1 soft freeze, but
> unfortunately I need one more.  This last minute one puts in a SLOF
> update, along with a couple of bugfixes.
>
> ----------------------------------------------------------------
> Alexey Kardashevskiy (1):
>      pseries: Update SLOF firmware image
>
> BALATON Zoltan (2):
>      ppc/pegasos2: Allow setprop in VOF
>      mv64361: Remove extra break from a switch case
>
> hw/pci-host/mv64361.c |   1 -
> hw/ppc/pegasos2.c     |  10 ++++++++++
> pc-bios/README        |   2 +-
> pc-bios/slof.bin      | Bin 968888 -> 991744 bytes
> roms/SLOF             |   2 +-
> 5 files changed, 12 insertions(+), 3 deletions(-)
>
>

--_000_AM7PR03MB6579113A5DB8C252A57CEB00C8E19AM7PR03MB6579eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div id=3D"appendonsend" style=3D"font-family:Calibri,Helvetica,sans-serif;=
 font-size:12pt; color:rgb(0,0,0)">
I Zoltan,</div>
<div id=3D"appendonsend" style=3D"font-family:Calibri,Helvetica,sans-serif;=
 font-size:12pt; color:rgb(0,0,0)">
i was able to build on my quad qemu, a ram bank was die and make me the iss=
ue with gcc..</div>
<div id=3D"appendonsend" style=3D"font-family:Calibri,Helvetica,sans-serif;=
 font-size:12pt; color:rgb(0,0,0)">
this is what happening if i run pegasos 2 with --enable-kvm.</div>
<div id=3D"appendonsend" style=3D"font-family:Calibri,Helvetica,sans-serif;=
 font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div id=3D"appendonsend" style=3D"font-family:Calibri,Helvetica,sans-serif;=
 font-size:12pt; color:rgb(0,0,0)">
via_superio_cfg: unimplemented register 0xf2 </div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<div>via_superio_cfg: unimplemented register 0xf4</div>
<div>via_superio_cfg: unimplemented register 0xf6</div>
<div>via_superio_cfg: unimplemented register 0xf7</div>
<div>via_superio_cfg: unimplemented register 0xf4</div>
<div>via_superio_cfg: unimplemented register 0xf2</div>
<div>PegasosII Boot Strap (c) 2002-2003 bplan GmbH</div>
<div>Running on CPU PVR:000C0209</div>
<div>Enable L1 ICache... &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Done.</div>
<div>mv64361_write: Unimplemented register write 0x108 =3D 0</div>
<div>Reading W83194 : &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; FAILED.</div>
<div>Setting Front Side Bus to 133MHz... &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;FAILED.</div>
<div>Invalid access at addr 0xFE000E43, size 1, region '(null)', reason: re=
jected</div>
<div>Invalid access at addr 0xFE000E44, size 1, region '(null)', reason: re=
jected</div>
<div>Invalid access at addr 0xFE000E41, size 1, region '(null)', reason: re=
jected</div>
<div>Invalid access at addr 0xFE000E42, size 1, region '(null)', reason: re=
jected</div>
<div>Invalid access at addr 0xFE000E40, size 1, region '(null)', reason: re=
jected</div>
<div>Configuring DDR...mv64361_write: Unimplemented register write 0x1494 =
=3D 291</div>
<div>mv64361_write: Unimplemented register write 0x1494 =3D 291</div>
<div>mv64361_write: Unimplemented register write 0x1494 =3D 291</div>
<div>mv64361_write: Unimplemented register write 0x1494 =3D 291</div>
<div><br>
</div>
<div>(tooo many i cut)</div>
<div><br>
</div>
<div>mv64361_write: Unimplemented register write 0x1494 =3D 291</div>
<div>mv64361_write: Unimplemented register write 0x1494 =3D 291</div>
<div>mv64361_write: Unimplemented register write 0x1494 =3D 291</div>
<div>mv64361_write: Unimplemented register write 0x1494 =3D 291</div>
<div>mv64361_write: Unimplemented register write 0x1480 =3D 300000</div>
<div>mv64361_write: Unimplemented register write 0x10 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0x210 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0x20 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0x220 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0x8 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0x208 =3D 20000000</div>
<div>mv64361_write: Unimplemented register write 0x18 =3D 40000000</div>
<div>mv64361_write: Unimplemented register write 0x218 =3D 60000000</div>
<div>mv64361_write: Unimplemented register write 0x8 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0x10 =3D 1fff</div>
<div>mv64361_write: Unimplemented register write 0x208 =3D 2000</div>
<div>mv64361_write: Unimplemented register write 0x210 =3D 1fff</div>
<div>mv64361_write: Unimplemented register write 0x1400 =3D 58200400</div>
<div>mv64361_write: Unimplemented register write 0x1404 =3D 24110051</div>
<div>mv64361_write: Unimplemented register write 0x1408 =3D 12813330</div>
<div>mv64361_write: Unimplemented register write 0x140c =3D 11b</div>
<div>mv64361_write: Unimplemented register write 0x1414 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0x1410 =3D 12</div>
<div>mv64361_write: Unimplemented register write 0x1418 =3D 5</div>
<div>mv64361_read: Unimplemented register read 0x1418</div>
<div>mv64361_write: Unimplemented register write 0x1418 =3D 1</div>
<div>mv64361_read: Unimplemented register read 0x1418</div>
<div>mv64361_write: Unimplemented register write 0x1420 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0x1418 =3D 4</div>
<div>mv64361_read: Unimplemented register read 0x1418</div>
<div>mv64361_write: Unimplemented register write 0x141c =3D 162</div>
<div>mv64361_write: Unimplemented register write 0x1418 =3D 3</div>
<div>mv64361_read: Unimplemented register read 0x1418</div>
<div>mv64361_write: Unimplemented register write 0x141c =3D 62</div>
<div>mv64361_write: Unimplemented register write 0x1418 =3D 3</div>
<div>mv64361_read: Unimplemented register read 0x1418</div>
<div>mv64361_write: Unimplemented register write 0x1418 =3D 1</div>
<div>mv64361_read: Unimplemented register read 0x1418</div>
<div>mv64361_write: Unimplemented register write 0x1418 =3D 2</div>
<div>mv64361_read: Unimplemented register read 0x1418</div>
<div>mv64361_write: Unimplemented register write 0x1418 =3D 2</div>
<div>mv64361_read: Unimplemented register read 0x1418</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Done.</div>
<div>Configuring PCI0...mv64361_write: Unimplemented register write 0xc3c =
=3D ffffffff</div>
<div>mv64361_read: Unimplemented register read 0x10</div>
<div>mv64361_write: Unimplemented register write 0xc08 =3D 0</div>
<div>mv64361_read: Unimplemented register read 0x210</div>
<div>mv64361_write: Unimplemented register write 0xd08 =3D 0</div>
<div>mv64361_read: Unimplemented register read 0x20</div>
<div>mv64361_write: Unimplemented register write 0xc0c =3D 0</div>
<div>mv64361_read: Unimplemented register read 0x220</div>
<div>mv64361_write: Unimplemented register write 0xd0c =3D 0</div>
<div>mv64361_write: Unimplemented register write 0xc10 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0xd10 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0xd18 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0xc14 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0xd14 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0xd1c =3D 0</div>
<div>mv64361_write: Unimplemented register write 0xd20 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0xd24 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0xd28 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0xe00 =3D 0</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Done.</div>
<div>Configuring PCI1...mv64361_write: Unimplemented register write 0xcbc =
=3D ffffffff</div>
<div>mv64361_read: Unimplemented register read 0x10</div>
<div>mv64361_write: Unimplemented register write 0xc88 =3D 0</div>
<div>mv64361_read: Unimplemented register read 0x210</div>
<div>mv64361_write: Unimplemented register write 0xd88 =3D 0</div>
<div>mv64361_read: Unimplemented register read 0x20</div>
<div>mv64361_write: Unimplemented register write 0xc8c =3D 0</div>
<div>mv64361_read: Unimplemented register read 0x220</div>
<div>mv64361_write: Unimplemented register write 0xd8c =3D 0</div>
<div>mv64361_write: Unimplemented register write 0xc90 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0xd90 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0xd98 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0xc94 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0xd94 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0xd9c =3D 0</div>
<div>mv64361_write: Unimplemented register write 0xda0 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0xda4 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0xda8 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0xe80 =3D 0</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Done.</div>
<div>Configuring ETH...mv64361_write: Unimplemented register write 0x2290 =
=3D 3f</div>
<div>mv64361_read: Unimplemented register read 0x10</div>
<div>mv64361_write: Unimplemented register write 0x2204 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0x2200 =3D 0</div>
<div>mv64361_read: Unimplemented register read 0x210</div>
<div>mv64361_write: Unimplemented register write 0x220c =3D 0</div>
<div>mv64361_write: Unimplemented register write 0x2208 =3D 0</div>
<div>mv64361_read: Unimplemented register read 0x20</div>
<div>mv64361_write: Unimplemented register write 0x2214 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0x2210 =3D 0</div>
<div>mv64361_read: Unimplemented register read 0x220</div>
<div>mv64361_write: Unimplemented register write 0x221c =3D 0</div>
<div>mv64361_write: Unimplemented register write 0x2218 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0x2220 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0x2224 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0x2228 =3D 0</div>
<div>mv64361_write: Unimplemented register write 0x222c =3D 0</div>
<div>mv64361_write: Unimplemented register write 0x2290 =3D 3f</div>
<div>mv64361_write: Unimplemented register write 0x2000 =3D e0</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Done.</div>
<div>mv64361_write: Unimplemented register write 0xd9c =3D 1ffff000</div>
<div>mv64361_read: Unimplemented register read 0xcbc</div>
<div>mv64361_write: Unimplemented register write 0xcbc =3D 0</div>
<div>mv64361_write: Unimplemented register write 0xf008 =3D 30011</div>
<div>mv64361_write: Unimplemented register write 0x1d00 =3D 801f0030</div>
<div>mv64361_read: Unimplemented register read 0xc80</div>
<div>mv64361_write: Unimplemented register write 0xc80 =3D 0</div>
<div>mv64361_read: Unimplemented register read 0x1424</div>
<div>mv64361_write: Unimplemented register write 0x1424 =3D 1000000</div>
<div>Releasing IDE reset ... &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Done.</div>
<div>Configuring Legacy Devices</div>
<div>Initializing KBD...Invalid access at addr 0xFE0003F0, size 1, region '=
(null)', reason: rejected</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Done.</div>
<div>via_superio_cfg: unimplemented register 0xf6</div>
<div>via_superio_cfg: unimplemented register 0xf7</div>
<div>via_superio_cfg: unimplemented register 0xf2</div>
<div>Invalid access at addr 0xFE000084, size 1, region '(null)', reason: re=
jected</div>
<div>Invalid access at addr 0xFE000085, size 1, region '(null)', reason: re=
jected</div>
<div>Invalid access at addr 0xFE000086, size 1, region '(null)', reason: re=
jected</div>
<div>Invalid access at addr 0xFE000088, size 1, region '(null)', reason: re=
jected</div>
<div>Invalid access at addr 0xFE00008C, size 1, region '(null)', reason: re=
jected</div>
<div>Invalid access at addr 0xFE00008D, size 1, region '(null)', reason: re=
jected</div>
<div>Invalid access at addr 0xFE00008E, size 1, region '(null)', reason: re=
jected</div>
<span>Testing 10000000 Bytes, Pass: 00000000 Failed: 00000000</span><br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span><br>
</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
In dmesg i had many of this.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
[ 3634.418495] kvmppc_exit_pr_progint: emulation at 700 failed (00000700)
<div>[ 3634.418525] Couldn't emulate instruction 0x00000700 (op 0 xop 896)<=
/div>
<div>[ 3634.418551] Couldn't emulate instruction 0x00000700 (op 0 xop 896)<=
/div>
<div>[ 3634.418577] Couldn't emulate instruction 0x00000700 (op 0 xop 896)<=
/div>
[ 3634.418603] Couldn't emulate instr...</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
___</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
i will build&nbsp; latest linux kernel and do new test.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
thanks&nbsp;</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
Luigi</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>Da:</b> BALATON Zoltan &lt;bala=
ton@eik.bme.hu&gt;<br>
<b>Inviato:</b> sabato 17 luglio 2021 21:55<br>
<b>A:</b> luigi burdo &lt;intermediadc@hotmail.com&gt;<br>
<b>Cc:</b> David Gibson &lt;david@gibson.dropbear.id.au&gt;; peter.maydell@=
linaro.org &lt;peter.maydell@linaro.org&gt;; groug@kaod.org &lt;groug@kaod.=
org&gt;; qemu-ppc@nongnu.org &lt;qemu-ppc@nongnu.org&gt;; qemu-devel@nongnu=
.org &lt;qemu-devel@nongnu.org&gt;<br>
<b>Oggetto:</b> Re: R: [PULL 0/3] ppc-for-6.1 queue 20210713</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Sat, 17 Jul 2021, luigi burdo wrote:<br>
&gt; Hi<br>
&gt; i small report<br>
&gt; im try to build last relesase on a PowerMac G5 quad on debian sid PPC6=
4 but ld exit with an error:<br>
<br>
Looks like it's gcc that crashes not ld. If you're sure it's not a <br>
hardware problem this may be a gcc bug. Sometimes big compile jobs can <br>
break if a machine is not stable but if it always fails at the same place <=
br>
and does not fail when compiling something else like a Linux kernel then <b=
r>
it's more likely to be an actual bug. That function has some crazy use of <=
br>
macros so maybe it's exposing some bug in gcc. You could restrict what <br>
targets you build with --target-list configure option of QEMU if you don't =
<br>
actually need mips (compiling will be faster if you only build the targets =
<br>
you need) or you can try with clang if available in your distro to check <b=
r>
if that works better. If this can be consistently reproduced you could try =
<br>
reporting it to gcc as the error message suggests. Probably not much QEMU <=
br>
can do about it.<br>
<br>
Regards,<br>
BALATON Zoltan<br>
<br>
&gt; gigi@debian:~/src/tags/ppc-for-6.1-20210713/build$ ninja<br>
&gt; [3864/9215] Compiling C object libqemu-mipsel-softmmu.fa.p/target_mips=
_tcg_msa_helper.c.o<br>
&gt; FAILED: libqemu-mipsel-softmmu.fa.p/target_mips_tcg_msa_helper.c.o<br>
&gt; cc -Ilibqemu-mipsel-softmmu.fa.p -I. -I.. -Itarget/mips -I../target/mi=
ps -I../capstone/include/capstone -Iqapi -Itrace -Iui -Iui/shader -I/usr/in=
clude/pixman-1 -I/usr/include/glib-2.0 -I/usr/lib/powerpc64-linux-gnu/glib-=
2.0/include -fdiagnostics-color=3Dauto
 -pipe -Wall -Winvalid-pch -Werror -std=3Dgnu11 -O2 -g -isystem /home/gigi/=
src/tags/ppc-for-6.1-20210713/linux-headers -isystem linux-headers -iquote =
. -iquote /home/gigi/src/tags/ppc-for-6.1-20210713 -iquote /home/gigi/src/t=
ags/ppc-for-6.1-20210713/include -iquote
 /home/gigi/src/tags/ppc-for-6.1-20210713/disas/libvixl -iquote /home/gigi/=
src/tags/ppc-for-6.1-20210713/tcg/ppc -pthread -U_FORTIFY_SOURCE -D_FORTIFY=
_SOURCE=3D2 -m64 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE=
 -Wstrict-prototypes -Wredundant-decls
 -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-com=
mon -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits -W=
format-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempt<br>
&nbsp;y-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimpli=
cit-fallthrough=3D2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wn=
o-psabi -fstack-protector-strong -fPIE -isystem../linux-headers -isystemlin=
ux-headers -DNEED_CPU_H '-DCONFIG_TARGET=3D&quot;mipsel-softmmu-config-targ=
et.h&quot;'
 '-DCONFIG_DEVICES=3D&quot;mipsel-softmmu-config-devices.h&quot;' -MD -MQ l=
ibqemu-mipsel-softmmu.fa.p/target_mips_tcg_msa_helper.c.o -MF libqemu-mipse=
l-softmmu.fa.p/target_mips_tcg_msa_helper.c.o.d -o libqemu-mipsel-softmmu.f=
a.p/target_mips_tcg_msa_helper.c.o -c ../target/mips/tcg/msa_helper.c<br>
&gt; during RTL pass: sched1<br>
&gt; ../target/mips/tcg/msa_helper.c: In function =91helper_msa_fmin_df=92:=
<br>
&gt; ../target/mips/tcg/msa_helper.c:7536:1: internal compiler error: Error=
e di segmentazione<br>
&gt; 7536 | }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ^<br>
&gt; 0x3fffa7b8e1c3 generic_start_main<br>
&gt; ../csu/libc-start.c:308<br>
&gt; 0x3fffa7b8e3d3 __libc_start_main<br>
&gt; ../sysdeps/unix/sysv/linux/powerpc/libc-start.c:98<br>
&gt; Please submit a full bug report,<br>
&gt; with preprocessed source if appropriate.<br>
&gt; Please include the complete backtrace with any bug report.<br>
&gt; See &lt;<a href=3D"file:///usr/share/doc/gcc-10/README.Bugs">file:///u=
sr/share/doc/gcc-10/README.Bugs</a>&gt; for instructions.<br>
&gt; [3869/9215] Compiling C object libqemu-mipsel-softmmu.fa.p/target_mips=
_tcg_translate.c.o<br>
&gt; ninja: build stopped: subcommand failed.<br>
&gt;<br>
&gt; Ciao<br>
&gt; Luigi<br>
&gt; ________________________________<br>
&gt; Da: Qemu-ppc &lt;qemu-ppc-bounces+intermediadc=3Dhotmail.com@nongnu.or=
g&gt; per conto di David Gibson &lt;david@gibson.dropbear.id.au&gt;<br>
&gt; Inviato: marted=EC 13 luglio 2021 04:07<br>
&gt; A: peter.maydell@linaro.org &lt;peter.maydell@linaro.org&gt;; groug@ka=
od.org &lt;groug@kaod.org&gt;<br>
&gt; Cc: qemu-ppc@nongnu.org &lt;qemu-ppc@nongnu.org&gt;; qemu-devel@nongnu=
.org &lt;qemu-devel@nongnu.org&gt;; David Gibson &lt;david@gibson.dropbear.=
id.au&gt;<br>
&gt; Oggetto: [PULL 0/3] ppc-for-6.1 queue 20210713<br>
&gt;<br>
&gt; The following changes since commit 57e28d34c0cb04abf7683ac6a12c87ede44=
7c320:<br>
&gt;<br>
&gt;&nbsp; Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-2=
0210708' into staging (2021-07-12 19:15:11 +0100)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;&nbsp; <a href=3D"https://gitlab.com/dgibson/qemu.git">https://gitlab.c=
om/dgibson/qemu.git</a> tags/ppc-for-6.1-20210713<br>
&gt;<br>
&gt; for you to fetch changes up to c785a40179b10ce2d7a4afdb04f63c98d53a175=
6:<br>
&gt;<br>
&gt;&nbsp; mv64361: Remove extra break from a switch case (2021-07-13 10:12=
:17 +1000)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; ppc patch queue 2021-07-13<br>
&gt;<br>
&gt; I thought I'd sent the last PR before the 6.1 soft freeze, but<br>
&gt; unfortunately I need one more.&nbsp; This last minute one puts in a SL=
OF<br>
&gt; update, along with a couple of bugfixes.<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; Alexey Kardashevskiy (1):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pseries: Update SLOF firmware image<br>
&gt;<br>
&gt; BALATON Zoltan (2):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ppc/pegasos2: Allow setprop in VOF<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mv64361: Remove extra break from a switc=
h case<br>
&gt;<br>
&gt; hw/pci-host/mv64361.c |&nbsp;&nbsp; 1 -<br>
&gt; hw/ppc/pegasos2.c&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 10 ++++++++++<br>
&gt; pc-bios/README&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
 2 +-<br>
&gt; pc-bios/slof.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 968888 -&gt; 9917=
44 bytes<br>
&gt; roms/SLOF&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&gt; 5 files changed, 12 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt;</div>
</span></font></div>
</body>
</html>

--_000_AM7PR03MB6579113A5DB8C252A57CEB00C8E19AM7PR03MB6579eurp_--

