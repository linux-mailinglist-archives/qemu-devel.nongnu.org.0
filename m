Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB75833FD6B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 03:53:47 +0100 (CET)
Received: from localhost ([::1]:47536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMinC-0002gF-U1
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 22:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atmgnd@outlook.com>)
 id 1lMimP-0002F3-Vv
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 22:52:58 -0400
Received: from mail-oln040092255036.outbound.protection.outlook.com
 ([40.92.255.36]:41040 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atmgnd@outlook.com>)
 id 1lMimM-0003HN-UA
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 22:52:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wme+nHtIbu5LtLcNZwZPncnFBbS/Dbr+hW1m+xOccRvChOjKrBpBLjVHdlrylki3ZZ/SlZhBtRDS5r2dLs/od1DfMinfnI64Kncm+aefVTAX2pjbujo4SsIcs6i3Q3mqcH3niev0tOht3pum09zriS4BFioO7NPSKN+hjrRJKcCJmW2KL9/VoSImaAL2qC9X3z+r9ZkDld/zBn9WshiCGsd2sWHjhO09jGRtLYn8VlVmct43CZa2DzDM+hNz0kVloByV1lYj1aG1S82RVOpavT8slJX1wWWIjf2Euz4UJ5l+H8oqEirHgu42uOdJY+QYXhuOBn9xX9cDRPR9wZJN2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGnKWlseM1UHSTrxFwDLotsfhX5q2sX/YnNIwGjdUNU=;
 b=bWHeAB2kF2Y0b1Nzned8rwkiHVpvLZjG22qsBJqb4etobjJ+MseGdOC324Hd05yIzLUw9mvtpiDHReRjB62EQ+ls3HPRyEcl1eIOw9SifU/kOV13cKtaEgil9F1aYKNkfAMCUFKc3u+2fbhw0JmxmR90RewjD8hNLrPZV54JnsmJODg+9qmL/69Y4TMfyKLqqK9swfm4M5OJ0FlvUfFMfJCJmTPEE0YC/hMrYZVBuyOiHpHQfPrN+cYfUUYDY6LFE6SdEuxOKj5EuPgohefaeGI+X41fYBrNDPRK3dndjSb+JiIBuL4krhketYUrCu+TlJWdmnUig7QXwUhvG/97Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGnKWlseM1UHSTrxFwDLotsfhX5q2sX/YnNIwGjdUNU=;
 b=D8P8nLSLlpBuchVXSvBUG42qxsLJs5L7yx4knXC4Lts5p5XyqZ9J3C+qLqB2hZfrejNk+72hwNJxvku8RWOG8Mo53LOrmgg1/TxoVgz+ZLcy+DF+mU706G842hF+tfCgTmLhn7tgH0BN1rZzcGYnYG5A9bRqfoCn3b047HmQs5QERd9flmrJsm0OqEjIyUJf4rNYa2Ca0mBU/p69f7cITwmP3Yl7xMIhasz74fw9NFVd0fHsFqIczb0O0EzrubpX9/FfNgeG8lg+z0HJJNjeUmu6F00aViYWm2jEs5MmNMntJaqt813AWHflbSaPkBO4Yepp31mREuMeh146hLgApQ==
Received: from HK2APC01FT006.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::4f) by
 HK2APC01HT163.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::472)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 02:37:27 +0000
Received: from ME3P282MB1665.AUSP282.PROD.OUTLOOK.COM (10.152.248.59) by
 HK2APC01FT006.mail.protection.outlook.com (10.152.248.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 02:37:27 +0000
Received: from ME3P282MB1665.AUSP282.PROD.OUTLOOK.COM
 ([fe80::5424:59d6:a5f3:c14b]) by ME3P282MB1665.AUSP282.PROD.OUTLOOK.COM
 ([fe80::5424:59d6:a5f3:c14b%9]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 02:37:27 +0000
From: qi zhou <atmgnd@outlook.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: How to create vhdx differencing disk using qemu-img
Thread-Topic: How to create vhdx differencing disk using qemu-img
Thread-Index: AQHXG53rcZAgANi2mUSVmzWFB+NRiQ==
Date: Thu, 18 Mar 2021 02:37:27 +0000
Message-ID: <ME3P282MB16654DBBEAE47620226F448DC9699@ME3P282MB1665.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:A57E37D1C8C7423674BFC982C46D4A22355C7FB7B90823EC1531214CA098FF23;
 UpperCasedChecksum:455B3462CBA5D8A60FD2184F47069D0F9B892F5C90C37E91081F4F63808C6B61;
 SizeAsReceived:6676; Count:42
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [E/fRD9akvhG25GCbbv2R6q0Vf2xjdIoe]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 1c17059d-4125-41fc-044a-08d8e9b6c544
x-ms-traffictypediagnostic: HK2APC01HT163:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hhmt3DNoAN1v27KtynmDPJGLD7GJIrqrsFYaa3JNF963GhojV3bILzwm4SDWAmS3LJbt58UaMO766X46D5WYzPmwGZYwErWaSjmtpjhJoCdrCRqQZtfhWn3HY5eT0dbc+jI5TWq2KxU3Zqx6kPLpTKWZZ6R8kGY1ouDv87YC3oBNViLeV+//hlkUcFyzQf90G3YUTdGmM1wehnnt9ntAnf+MYo0yXAWlZGiajzVjxTIdcMtFk7j0XzP6inVecVqnpu3y3pBZyWOlix725rfn6k7qXqo/6mVA6ndYVfMnDNnpvmOYSnE9TGqtybUt3RGtEVtEATxfxz2Fy1o4gAUbPl8dWExVPhSUK3/ozMureL9WKPbKMmcA63zUi66J4U95E5cVjxl+6bzR4GIah24C+Q==
x-ms-exchange-antispam-messagedata: NEc0R3ZdtYhpC63m1jqvwxr3V4yQFmqTDoROzTvpHCNYBWG6We1e8XODQgUa8liBcsrCFpm/Vwcvkt7KaY4xOUMTE41NRHOisYiClaf3FBFYwazjqWCFjh+Swkior1IsELr/9btptsrWIwFusoiNeA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT006.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c17059d-4125-41fc-044a-08d8e9b6c544
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2021 02:37:27.5236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT163
Received-SPF: pass client-ip=40.92.255.36; envelope-from=atmgnd@outlook.com;
 helo=APC01-HK2-obe.outbound.protection.outlook.com
X-Spam_score_int: 16
X-Spam_score: 1.6
X-Spam_bar: +
X-Spam_report: (1.6 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When I create vhdx differencing disk using qemu-img, It says=0A=
=A0qemu-img: xxx.vhd Backing file not supported for file format 'vhdx'=0A=
=0A=
The command I used is=0A=
qemu-img create -f vhdx -b test.vhdx test-snapshot.vhdx=0A=
=0A=
Here is my questions=0A=
1. Is vhdx format [full] supported by qemu ?=0A=
2. If not, is there any easy way to implement differencing disk of vhdx in =
qemu-img ?=0A=
3. Is there any other tools support vhdx on linux ?=

