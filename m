Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EEEF98FC
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 19:43:23 +0100 (CET)
Received: from localhost ([::1]:38938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUb8M-0003kW-Lc
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 13:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42021)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sunilmut@microsoft.com>) id 1iUb79-0003Hp-9Q
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 13:42:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sunilmut@microsoft.com>) id 1iUb77-00009T-4I
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 13:42:06 -0500
Received: from mail-eopbgr720095.outbound.protection.outlook.com
 ([40.107.72.95]:42352 helo=NAM05-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sunilmut@microsoft.com>)
 id 1iUb76-00007G-Nj
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 13:42:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y2eRE4TxAebQD31pomoCKZFHWP3TG4R0BK9IqYy+JleNAvhSIwkxmci54T/wcpx66kp9Hi8CTBQrNiL3L3WMRxswHF8ogWSL03fuI8uKSo83av3IaR0TNpZ5nvIIQuVuLS89IEt7IIJDLtr88gYzyiPOlGXp+NjptX0NPvwoH5joKGms5MtCXDIDq4K7OLEFQ6BvNSN4QBDNlAQkPAJnyA801oBxgBF8aOQ20NPVF4NIT4dlT5XVG0QPj24guuc4Ur1XS5ESsjcZxoJKzLtrAQIshvPex4TBVHoZpm7pug/YEaoR/glQDKrGUawr7LseZIWz9ahAKcFZQ42BJ3xPdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojG8DIQLfCUn34ksC/rjxUFeUWDaDvrrc5DEvZaW0wg=;
 b=ePqH/wZ4qiaudEO8dXN7Kpb2cIfsA0xSBCsCLtfT2dNh7dZbVM9sVtu2HIXVqbgk0FeGd4YySpIkTFzzDMeyrvQGrKQtkfTfrke1FPzn2vX8d8O5nIRcHwkWu+VdvBCZ/gUwAuIDPwgQji/cdy45mZ2/vYAkdvBJ54yirKJRqdf7zkcAXxBOVeo77Vvr3nPsG7RgSepzIYcN/GH1VMJbZMZJYTSvyBLj/JU5uIxBOqxZAbG/DzxFBmZ7ntJJQnauCFAAP90VwXvJqBiONvMQooxMBi4yhxvWfnViZScZJ0fYZ4spcBA30bTAB7F9X+hv+ylLaagcrretMC0DnOz5Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojG8DIQLfCUn34ksC/rjxUFeUWDaDvrrc5DEvZaW0wg=;
 b=bkB0Mu0jvUB6Kc84mDhNS7rZbIk5lcVsD5n0ku1aENAPocnEK/9g2/irrvf33T27IiQKwex6I8hL6pYVt94I1HWCAr46OyUuRd7IQUamVMOC2c2HuRMzq1h7flH5sbRhneeeLCN4pP3Va4duwwdRQINMt9Ybw+zyOR1otdlvKnY=
Received: from MW2PR2101MB1116.namprd21.prod.outlook.com (52.132.149.33) by
 MW2PR2101MB1083.namprd21.prod.outlook.com (52.132.149.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.15; Tue, 12 Nov 2019 18:42:02 +0000
Received: from MW2PR2101MB1116.namprd21.prod.outlook.com
 ([fe80::121:8a4f:76a8:fd9]) by MW2PR2101MB1116.namprd21.prod.outlook.com
 ([fe80::121:8a4f:76a8:fd9%6]) with mapi id 15.20.2451.018; Tue, 12 Nov 2019
 18:42:01 +0000
From: Sunil Muthuswamy <sunilmut@microsoft.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, 
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Justin Terry (VM)"
 <juterry@microsoft.com>
Subject: RE: [PATCH] WHPX: refactor load library
Thread-Topic: [PATCH] WHPX: refactor load library
Thread-Index: AdWWczxfa/0gc1vPTEu6TOvflPR6ngDFYVqA
Date: Tue, 12 Nov 2019 18:42:00 +0000
Message-ID: <MW2PR2101MB1116C3DF422DB5E301B74AEEC0770@MW2PR2101MB1116.namprd21.prod.outlook.com>
References: <MW2PR2101MB1116386CFE4628B6767D6CDBC07B0@MW2PR2101MB1116.namprd21.prod.outlook.com>
In-Reply-To: <MW2PR2101MB1116386CFE4628B6767D6CDBC07B0@MW2PR2101MB1116.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sunilmut@microsoft.com; 
x-originating-ip: [2001:4898:80e8:0:4c8c:ac9e:157a:29d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0227ff82-e3e1-4ada-416c-08d767a00170
x-ms-traffictypediagnostic: MW2PR2101MB1083:|MW2PR2101MB1083:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW2PR2101MB1083B00670B2C76D8A33FCAAC0770@MW2PR2101MB1083.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(346002)(366004)(136003)(39860400002)(13464003)(199004)(189003)(81156014)(186003)(14454004)(486006)(4744005)(8936002)(107886003)(74316002)(5660300002)(81166006)(2906002)(7736002)(76176011)(10290500003)(6246003)(54906003)(7696005)(305945005)(110136005)(25786009)(33656002)(8676002)(6506007)(53546011)(316002)(102836004)(99286004)(64756008)(8990500004)(66446008)(71190400001)(71200400001)(229853002)(446003)(6436002)(476003)(11346002)(256004)(10090500001)(66556008)(66476007)(66946007)(478600001)(52536014)(4326008)(86362001)(22452003)(76116006)(46003)(55016002)(6116002)(9686003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MW2PR2101MB1083;
 H:MW2PR2101MB1116.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 93Ry8pbjQsJcz5RCjShg8qXOLRXpVAPS01XzlYvrGqtuJbztByui2uYJXDu3pI4u6o8HjYAWHcheOFaq/o22F93hT/pccruIhh9EOrWmjegS2VXoDcpqsGDrLqR6DCgoxoU8QkAIfqVvVS4wuF6ZJG9CH0uyu8vwkDOKlqpdzyllj0Z0ZEoDMmBjTC943hgHRhsl/ieU5qZYEChpX/SpiTNwHrBYDTz4JsrMMjhXTKKouvRECJEAchMReOJFg87Xak9MU2ziSL7mRfYyiFXRsAvQP/q1WB8TL5oXrPIDUfB9ZQRt+Z2Pum13fJLAqTCLBelZSzNk0BxOaiCjrQplkd0eOyY0+LdXP9bHrAWMVtJrhEZpomvO/8rwLKHQFsBktpBdf90rcRBzwrXaZj3eXsszpUFBOSt3y9qs/dRqKs6DOBzd5UUfDFBk1O8dVx8/
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0227ff82-e3e1-4ada-416c-08d767a00170
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 18:42:01.0368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: szDWew4JMoOs26azIGSUN1QNR0eA+eCZrgZDrYzZOAXnyAp3F8OQsrmvo7nKZQUztJAVMIG/31ACqHfgD5PPb4OwTtvR/GYlEdzO7QcsHnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR2101MB1083
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.72.95
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



> -----Original Message-----
> From: Sunil Muthuswamy
> Sent: Friday, November 8, 2019 12:32 PM
> To: 'Paolo Bonzini' <pbonzini@redhat.com>; 'Richard Henderson' <rth@twidd=
le.net>; 'Eduardo Habkost' <ehabkost@redhat.com>; 'Stefan
> Weil' <sw@weilnetz.de>
> Cc: 'qemu-devel@nongnu.org' <qemu-devel@nongnu.org>; Justin Terry (VM) <j=
uterry@microsoft.com>
> Subject: [PATCH] WHPX: refactor load library
>=20
> This refactors the load library of WHV libraries to make it more
> modular. It makes a helper routine that can be called on demand.
> This allows future expansion of load library/functions to support
> functionality that is depenedent on some feature being available.
>=20
> Signed-off-by: Sunil Muthuswamy <sunilmut@microsoft.com>
> ---

Can I possibly get some eyes on this?


