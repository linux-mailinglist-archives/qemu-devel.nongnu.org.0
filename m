Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3912F37724B
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 16:05:38 +0200 (CEST)
Received: from localhost ([::1]:47602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfNaK-0008Rb-LF
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 10:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dannyedykes@hotmail.com>)
 id 1lfKXy-0000SZ-Mf
 for qemu-devel@nongnu.org; Sat, 08 May 2021 06:50:58 -0400
Received: from mail-mw2nam08olkn2073.outbound.protection.outlook.com
 ([40.92.46.73]:37344 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dannyedykes@hotmail.com>)
 id 1lfKXu-0005gm-18
 for qemu-devel@nongnu.org; Sat, 08 May 2021 06:50:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQWKwrOv2t/lU6Jy7/HVzHTdZJIx/10yx+Wha0JWXjgI8L4J4i3n73RJBL4YyO0BNXiZgc4oqW7BipdkTzxFTdMklDrNv99w0xrFMJjApNw8jSHE7RmHFBZyNHOtB8cSkWPFZDjvSgiXl5FJ0hxL0Vz1n9hWv92nzXgXX+Jpqv1YdHeNRP+S05Fstn22nN7l8Gqpb0FYBngfmeSb9egWJWJVXlLONWPReIqwD3PUDYzKJ1xeaUo2ZpETyQynD98F4bPXqum4bdmlp8Fjn4Zx+5TRHbkFOf5kVUfjR60W4JXFtF+KeXkpf+zpAgk5dsUeha9y20f3oWuzosSQiczoXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZUrm+nliruBRjuG503srCFX1lBfd15dHiqaac5rLHw=;
 b=IduWTDU4Y6J3fMBfPqq0AfSczkdWY2S/1jQoTNoRPoIuKUkIuZt1Ys9e/0mlOp4jQIY2Ko/g0L/QXjCeP027ImQY8EuGvZGjdXKfxYpfKaBMw56M+HwS+T60ZVXzZcs01HZ509UEiXdb8RrqLXkFOZMPfMmj54WVQNKcCthckrrMQiyefPW7PHF4Etllp2piXATsfVyXB2V4I+/T+EoZ8fYi08QEy5USOw7N2cPXvRaJF0cQmlTl07ZsnHegycQLGlhRyq6zuJigyHZ+NUVFdlNC55and8nNQFFDl96DbjMecjH/HrMCeCRlUB8AiKR0QSZsmodVSRXb2C+sHS63ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZUrm+nliruBRjuG503srCFX1lBfd15dHiqaac5rLHw=;
 b=bgdIcI/sBYNu9uXlHLf/eQgnvU8oUu5UnEAouli9/FlTePq9ENlU1UiMC5n32hOcIFLM8cP98krWdo2OL550JSM6koL3LV20NxjJVQMPC9bQ626V+8r9DbJUKq56TAIg0673D6yIzQ8F51t/AOlL21hPWlmuQTX1O72+o4Bq56p6ayGSmculit22am90IfsV/oYECoY7pv5EJPW5V5rOBRR8q0I5TAig8X4zvZot6scpcM6wAc6sXF+wAarZN0LJ3GVSqzUjOm47Bq4JORR2B9Ft1sJFdYHRuLczg1aVBxzPk01zFldU7TQKCaXUzULdUMlnMo0a93D0Ph4zQroEcA==
Received: from SN1NAM04FT049.eop-NAM04.prod.protection.outlook.com
 (10.152.88.52) by SN1NAM04HT012.eop-NAM04.prod.protection.outlook.com
 (10.152.88.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Sat, 8 May
 2021 10:35:48 +0000
Received: from AT5PR8401MB0898.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7e4c::4f) by SN1NAM04FT049.mail.protection.outlook.com
 (2a01:111:e400:7e4c::416) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Sat, 8 May 2021 10:35:48 +0000
Received: from AT5PR8401MB0898.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::b890:6132:de68:1a12]) by AT5PR8401MB0898.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::b890:6132:de68:1a12%11]) with mapi id 15.20.4108.031; Sat, 8 May 2021
 10:35:47 +0000
From: Danny Dykes <dannyedykes@hotmail.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: disconnect from all devices 
Thread-Topic: disconnect from all devices 
Thread-Index: AQHXQ/W0AxPkgfnNKUSmzgq6Oe4PzA==
Date: Sat, 8 May 2021 10:35:47 +0000
Message-ID: <AT5PR8401MB08987F6D019F74E7E96F5CA0B6569@AT5PR8401MB0898.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:C8EBF372CA97519EF9012A70882E215D0C365F5076142E5002115D11747EA6AE;
 UpperCasedChecksum:CAABBACFDB74A738A27355E7E1CC4BB4DAB2F91866C3AB8C663D08A7C6C01DF0;
 SizeAsReceived:6626; Count:41
x-tmn: [wticE9y2l/ZZQBLdqGNxEDsbxuE5AhQh]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: c4f338a4-ef8b-4bca-44ad-08d9120d0af1
x-ms-traffictypediagnostic: SN1NAM04HT012:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vqzqdk+sArHL+OWdYDU+R0uHCQVqwKK21L9/cL9qlwHRxj8eFk+gpDbjdy7+lSTaR6DQ7g/TS3uQF56tx9Dxmdj4Nd+fXfzirYHh7PpVV4qCfOY0bzxXMTUj3twtrxu8k/Nv9ruX4aI5l6QHd365NXLTZfQjTgJi0H8t4IEAYPDG6hotbFtlZTZSmBc2RHEXy4lgxi9V/sSS0kh2CbZnVkFdE9yw+aIfMYsp+Fb5FVilS2WrEJsobNMqhsc5p9oQAJMbiW4FpHLa699YGq0S6a1VHFNJUAxmRMG/sy+G3cC96xsARNW18tsIfvQBt8qHZx2SafAzlJ9wsiuyPqYAyLd4Ygq5aZjiwmfKpuAOU7FR+OONlWqziVYjh9TIzYNfAIeDRL4G2uj65uLyb5JOyfwV5/ro2D9ht9fiqxY8qgO11RFuiqcQ7ekcMquVjSoRCRrjo3n/q5W/oyhPY4yTqWtr+MsDvDbyB6rfzG1vxiM=
x-ms-exchange-antispam-messagedata: a+OgSIP/rvJwthyXRKFEhTGpzJ6jROOPl6gvy2I9cT/RyDLAMq2EJ7j2u9GeXjYtk/+IPPih6vYmFS7jSZjM1pIjUop9tm7aGTcaFW5oXPpSNrpABiHMvvhtSm+/7kZ5ZW4SyykqtW4UlB6qga8CRQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_AT5PR8401MB08987F6D019F74E7E96F5CA0B6569AT5PR8401MB0898_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM04FT049.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f338a4-ef8b-4bca-44ad-08d9120d0af1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2021 10:35:47.6404 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM04HT012
Received-SPF: pass client-ip=40.92.46.73; envelope-from=dannyedykes@hotmail.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: 56
X-Spam_score: 5.6
X-Spam_bar: +++++
X-Spam_report: (5.6 / 5.0 requ) BAYES_99=4, BAYES_999=0.2, BAYES_99_FREEMAIL=1,
 BAYES_99_HTML=0.6, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: reject
X-Mailman-Approved-At: Sat, 08 May 2021 10:02:41 -0400
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

--_000_AT5PR8401MB08987F6D019F74E7E96F5CA0B6569AT5PR8401MB0898_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

PLEASE!! Disconnect from all devices.

Sent from Mail<https://go.microsoft.com/fwlink/?LinkId=3D550986> for Window=
s 10


--_000_AT5PR8401MB08987F6D019F74E7E96F5CA0B6569AT5PR8401MB0898_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">PLEASE!! Disconnect from all devices.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Sent from <a href=3D"https://go.microsoft.com/fwlink=
/?LinkId=3D550986">
Mail</a> for Windows 10</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_AT5PR8401MB08987F6D019F74E7E96F5CA0B6569AT5PR8401MB0898_--

