Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ACC4A55B6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 04:52:27 +0100 (CET)
Received: from localhost ([::1]:43990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEkDS-00059J-NZ
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 22:52:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nEkB4-0004LD-Ua
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 22:49:58 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:4624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nEkB2-00023J-8m
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 22:49:58 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2113Dw2e028115; 
 Tue, 1 Feb 2022 03:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=zhnG93R9EVxwT4ADAlXGkqm1hgnSAcxmo/BIAyygfvc=;
 b=1GRfjAE1yYOKuibcn6osnvIwwecUznFOqbJLzRQ0/3lBE5N9hZ4/hbd8lmogaQ26WGC0
 6LNKxjgqZF0AI4qITmvMPT5Y2tzxjRsijrCSU+6V7d3j+FaK0RhY0MrnS2hEGkV3EKug
 Qh8ySJxdNZd71HbcVrgeVm1jvL4ZXO5hWjXJD9WfN6KtM36xtPiphgw7C2FrYdY9Ym/P
 NovfZcLy3yQXzgIJ4XaGmrnDr64iIFmWTuHlsnbFh6ST4n0fNHe4VZd961vMAxRpAnft
 we570di0El6F4lYYLOXSNivcVGVtXDOk4iKAy31G2Mhs6QlN7hn6JxqmtCBtmgT76XL0 9A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dxj9fsmnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Feb 2022 03:49:44 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 2113V7TY162423;
 Tue, 1 Feb 2022 03:49:43 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
 by aserp3020.oracle.com with ESMTP id 3dvwd5dgqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Feb 2022 03:49:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3xeWDCo7exy5+hZ8W5cOl+c312iETlVi2YjdXX+4GaxR3ZMO+pb/4iNldvJFFIkCAS2H6YFvWjAURAa0B9vzClG6OlHylzzZc7r9bmxu6pcezsrP2Fb6u1HUHWQ0v2fq54I0GRpqO9IhXznVyT+UjSgV+qDQaG3+JVH3GRL/0Tnlu4CCMr6qPp78k49YMThHiCr1ME6GPwrjZUaIja7cPRPVoIQ9ZcWF56D+MPzO/slKP5VWzeCUBPQ6HWyWBNLAbJ/L2QwHNqiJPBmcBHXqwFu1zlO2JoZbq6B/vP0BwZKXfywBpJpR8TGT7iuzNXwO65MioJnZRb4B4XyYAY28g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhnG93R9EVxwT4ADAlXGkqm1hgnSAcxmo/BIAyygfvc=;
 b=IAzHLV+/b35vpuxP+GNbSMbWNhaalRJ5hork9KJOoS7hH1Fhuqkbv8irdrIUOJrXBal4FgLzKjb2j1KpjOwaLLkX+RpgxBaOC/opt7cAh2RVogQwmOg0au5dEbZ2a8sSiuhUtxMj2i+6jCwNGxhCHm3krRbwBm8XxjQWQzXellmTza93CA0rYfpg+veAbY2xCSSthBOwHya9ctJjnbUR+6dTmiFv9wFZOhEj0kb0XR9Y5yAhPdBJ9qrD2IXj6/BTkOEDkQqesmwCymjabHrZpJ5xH5UJi5qA/tQzKFXDI0oeN5kS7iJd6nMoMYAJM98q9E2k/nY12UL8rGVl784jew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhnG93R9EVxwT4ADAlXGkqm1hgnSAcxmo/BIAyygfvc=;
 b=jBrqJZplLUPGBPRSdl3OuN3oxcPDkGAawah138bmkjClAymr4mmC/aWUpnvBRhK1fsT//Lusl2EVX/2ErQTMaueqY73l6o0iGDb+jmS+S2HqYprJsMYcRmql6y5Kn+yPQmMttxTCSES1z+h+U6Knq5Ks/JwBAm5I2cIw4n8XWEY=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB1582.namprd10.prod.outlook.com (2603:10b6:300:22::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Tue, 1 Feb
 2022 03:49:40 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::940f:c52d:e3e8:7ce2]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::940f:c52d:e3e8:7ce2%4]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 03:49:40 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5 17/18] vfio-user: register handlers to facilitate
 migration
Thread-Topic: [PATCH v5 17/18] vfio-user: register handlers to facilitate
 migration
Thread-Index: AQHYDX2RujIYB0vy6k2RdZWpw+Krfqxz6vMAgAM58YCAAQJyAIAF+yiA
Date: Tue, 1 Feb 2022 03:49:40 +0000
Message-ID: <D244CCE0-EAD3-40F1-9B52-8F3B119072D2@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <0ec006e5c309166cc1920871688508c1f6270ac3.1642626515.git.jag.raman@oracle.com>
 <YfAbwButynCFEBwY@stefanha-x1.localdomain>
 <A4D21E02-4F6A-49C6-A7D8-24C30BD2B645@oracle.com>
 <YfOpZmI4GM6oGhGH@stefanha-x1.localdomain>
In-Reply-To: <YfOpZmI4GM6oGhGH@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 013400f9-301d-4f3f-615d-08d9e535e034
x-ms-traffictypediagnostic: MWHPR10MB1582:EE_
x-microsoft-antispam-prvs: <MWHPR10MB1582BE36BFA62EC0F1242AF690269@MWHPR10MB1582.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TG/CXwEYA6HMv2turHHLSwUfHRho3PXjG1nqOQwCqK2SVBLePYgyoUpRMN97C1lkzyH4x7V/nkc4RPwOQwKU2wMhj/nHhN8JtDD5DswODpwFVtcxeAw/MrIqkzb8x2Krs1ikMU05xBpNkm+FA7vrNqrcHWbY6ROrBWZbY0kUZAJMB9wr5fqJWdcBKWr2ShwIpcTDYifF4jg5FeQTtlbi6IG/d4DEgROgsxghbsaRMmb/WX69cLprmpOrdvper/1hSEMMMgIeMpWyJA+sY+sDB8hmi1nIeAX2H+mZmQSVx3E9D5z3+nwkec6I4BFdyl6WHM7Qq6crBHv45xZvdCOZvgjFRFjMcu876T1e6YkyFJLHm+n80KQslbXcRva3Sd4AR7WbYrn+4azXz0uUS22Z8HvG91hGGJvLs8o+gWVxBQseYgvJY3bNDVbgz09b24oE02Yla+ioLg+h+bIaXPK3S12aMQVoib6rz1dK6t/lKeNZpNP5UkFUZHf3+qJ6flc9xdwbvONDC+wZfIz1YTJerfVhtuEqrPuCX6GSFMcOWMvY/0Og45KrGOUuUeQzJKm8LnZG1Do+Se8OW9VnMNZIi/lZV54LzI5i4WahazU2tbB17kKXrkk0piqNdreDoW/pMJAt86ZPNpb6Tj57cFctZggvpHaowpbL0EOgy2hPZNpA+N3h3D3cuVkkv7KTGFqsdsZshhjDj8xuVUIe8wVuylBVFd4goHC+X/iW9Fp6qUiKOJixePt5w+eA1z5yIGul4FI+zUg+HysWA/+34cpMi2JLZodnGrrxfH+etLzQJlrBgAnEBIWs4zeEhTT5twHuZnD2QMKhv/e2Lg/J2NoF8w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(66946007)(53546011)(6506007)(6512007)(66446008)(71200400001)(36756003)(107886003)(186003)(2616005)(122000001)(8936002)(6486002)(966005)(8676002)(54906003)(66556008)(66476007)(64756008)(76116006)(6916009)(5660300002)(91956017)(4326008)(316002)(83380400001)(38100700002)(33656002)(44832011)(86362001)(7416002)(38070700005)(508600001)(45980500001)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGFxc1dKbG9kREVBaWw5ZmNiV3cxTzN2VHVxYW16VCtQd2VvT28rL0QwUXFH?=
 =?utf-8?B?NnQ5TTh3dnUrQUpUeXNHcVhwd284cldZcEZGKytqZnNjeXlvZWYxdlNWWDBw?=
 =?utf-8?B?dzFhazdQNHJnbTBaelF2UnVydnFGNWRqcE9oSjU0ZkNRdGZYWm5ITmdsNXd4?=
 =?utf-8?B?dVN5RG5xZUZROHVCTnkrcGcrenJrMmFJMW5qd1p4b0tHUUoyRmpoNXhiTHU4?=
 =?utf-8?B?MTBKcXQ5WDdOTUN0Rk53UVdySWlQNE5mc1k2QjJOQ0RNVGxrK29XWG10N1pY?=
 =?utf-8?B?dWY2WFliREdNQlVCc0h2eXVobExUQUpsaUV1bElEcUJrY3NmV2UxTGhDUjlq?=
 =?utf-8?B?dGtqWWNmVG9DdnpNL0t5eStEeUpxc1Z1MnpLdnp1NFRrT1B2aFZCUmd5ak5F?=
 =?utf-8?B?TUhpYUhIVXNCTmZXdGQ1OXNhNFJtc1RGUUgzb280dWtUUlEyTUF2SXFqek5h?=
 =?utf-8?B?TWJmRnViclpXQXl1bCtRdkhHcXdSM0xDRUVpbVJnWHVMaG5uWnhGeXIvZWla?=
 =?utf-8?B?NzhzOGxSSW92UWhDaHdXR2FSaXFHWDJkYTRIMWY2T3BwanJNeWFUK0p1dTFz?=
 =?utf-8?B?T3RldEhxZjNoczFnN3VLbnlNU1lHNVRMVzNoU3BQY052R3V4V0pkK3hvMTJv?=
 =?utf-8?B?dXhQZGxaTTFhOUlidDVwTTduSmJnOWhzU3QwUE84OVdITkZjQUw0aFNkMDQw?=
 =?utf-8?B?VjUyQTNPWVBvVjVBQnlDT2ZXUlgxNlRWTE1VS3Vya3VodjVOY1NjOUs2SUVp?=
 =?utf-8?B?WUQ5S1hEWnRiNCtQRDZEREpaSXU3QnN4T1Erdk5nS3BEQlZhbVY4eFF5TlBn?=
 =?utf-8?B?S0N4alZicWZzYXZ0NThDdjNRZ0R5MkM2bDkycWpRejNCRWh4Ylg1UTltVG1j?=
 =?utf-8?B?ZFVkTlVkcTk0emlNZDc0V3kwbVM1alY5d1pxUUF4S3JPbTBuT1NpQmxNQWha?=
 =?utf-8?B?RHU5VGVMSys0bTdldkhRTHFCNTJ3MUxiVTlxVUptMTN0QkkxOFh0MGZuMG1J?=
 =?utf-8?B?ZWtGSzFnbnMzQWluMGRkSWQvRkE2TXlQclpvY2tLUThPbjZReXFQVXZhZGZz?=
 =?utf-8?B?ZlQvSDdUL0pLZ0MwVy93Rll4dndrdDk3SXpUWmRscU5sbkQrQ25Yc28vSlNC?=
 =?utf-8?B?ZU1veE9rbjk1VUp0cWViV2V5Mk02L243eHNPeDJHcmh6VXNNWUVPU1VHYlFz?=
 =?utf-8?B?VWdMNkhoTEhJcVdscmVRSjUwWEdkTXg3S1o3dWxZbjQ4ZWJPTURjT2hhM2ZK?=
 =?utf-8?B?U01zQ2NYbEJHVUFXUTZvSmsvcVdSbmprVzduNUpHQkRiU2Rwd2VZL01BV2ht?=
 =?utf-8?B?QWhxQy9HTXRueWRzMWtUNlRZUG85aC9xRng4Y1Y0dlU5c3JFbnpCbkNQOU9I?=
 =?utf-8?B?Zk9LVVhPSHZTcUw0dlBzM3lBenY1dE8xZmMyelVzNVlhUXZ4OEJPd3ZmMlFT?=
 =?utf-8?B?QVFjaXl3S2NtdWNpYTV4NHUwWFRoMnJqcVdKbXVFQjluc1lYdHhOc1Y4Uk10?=
 =?utf-8?B?T0FmTVZrNm5NTTR5bnk3alBuVkFmcXZFSHJCOFNZWXR0OTAranNrT3FLUTJs?=
 =?utf-8?B?NFZtRkdOMHd5OVZJQkk5SHNWdHhqRFduYmVIT1JHWlE0b2lOSUVRS0o2eE94?=
 =?utf-8?B?aEE3bU9VZVNpYnUxcmd2TmJZbm1DYzJnaWdNbisraUR0SWx1NW5EUE1SWmRp?=
 =?utf-8?B?bnlUazkwa3Y3eklpb2J1SDZQN2ZQZFZsbnRqVUZrSXBFaVlGNlFWRjhlYjZO?=
 =?utf-8?B?M2gvNllIRmdBME5MMkMvWUtITnJLR2VIUG5GeU0rNU9mTW1aNXlTb2pJcHdR?=
 =?utf-8?B?dmRGdjh1M3hEdm9qQ2xsTDRGdW5RSnVnV0l4TjFONnZrTE5SS1Y4TUZ2Tmwz?=
 =?utf-8?B?bW01MGQ2UkV3RHk0WDlCdkxabVJvYTNHWmhwVWpMeEYxKzdLZmpUS3E3eDhs?=
 =?utf-8?B?K1hkVkxoS1dWTEtqN09STXFrRTVrajdvOGkrN2F1T0UwemZIdWNyeHlLN0RO?=
 =?utf-8?B?TjAydDJrWEZNOFRLbTRFK3UwRjhNUVA3TVh4VGJzdHZqdy9OTkRpc0F3T2wr?=
 =?utf-8?B?SzRLUXVVTnhwRko5NWE1TTFBNlBWNWtBeG1rV3ppNStMTEprM3lPNE5pSjFP?=
 =?utf-8?B?cWI2WXdVYU9ubTBEaHBSVmJZbW1YNGt6enJ3aU02YTBmWlFnTjd2K2VrTGNy?=
 =?utf-8?B?cjZqV01RdnhXN3JuQllSUWdEbzV0WkI0RG5oaHRxS1Myek5naFBnRlo1VldE?=
 =?utf-8?B?MzVNbVQrZEdTMEsyVEduclBZN0F3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7464E4B8EC39541A1659C6D4A09DA60@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 013400f9-301d-4f3f-615d-08d9e535e034
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 03:49:40.6411 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9UzKS3TFik12bYShJjEvh/nwLl8bcYnkYttzRFlv/rCobX7Dlu3ayw2YokM3V4NLSQiDTeCBU5/WmiX/9qc2Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1582
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10244
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202010020
X-Proofpoint-GUID: 71hx8S8uIcmPCXenSbx1YsKfAdxvB7Zm
X-Proofpoint-ORIG-GUID: 71hx8S8uIcmPCXenSbx1YsKfAdxvB7Zm
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Levon <john.levon@nutanix.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Eric Blake <eblake@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSmFuIDI4LCAyMDIyLCBhdCAzOjI5IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gVGh1LCBKYW4gMjcsIDIwMjIgYXQgMDU6
MDQ6MjZQTSArMDAwMCwgSmFnIFJhbWFuIHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiBKYW4gMjUs
IDIwMjIsIGF0IDEwOjQ4IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+
IHdyb3RlOg0KPj4+IA0KPj4+IE9uIFdlZCwgSmFuIDE5LCAyMDIyIGF0IDA0OjQyOjA2UE0gLTA1
MDAsIEphZ2FubmF0aGFuIFJhbWFuIHdyb3RlOg0KPj4+PiArICAgICAqIFRoZSBjbGllbnQgc3Vi
c2VxdWV0bHkgYXNrcyB0aGUgcmVtb3RlIHNlcnZlciBmb3IgYW55IGRhdGEgdGhhdA0KPj4+IA0K
Pj4+IHN1YnNlcXVlbnRseQ0KPj4+IA0KPj4+PiArc3RhdGljIHZvaWQgdmZ1X21pZ19zdGF0ZV9y
dW5uaW5nKHZmdV9jdHhfdCAqdmZ1X2N0eCkNCj4+Pj4gK3sNCj4+Pj4gKyAgICBWZnVPYmplY3Qg
Km8gPSB2ZnVfZ2V0X3ByaXZhdGUodmZ1X2N0eCk7DQo+Pj4+ICsgICAgVmZ1T2JqZWN0Q2xhc3Mg
KmsgPSBWRlVfT0JKRUNUX0dFVF9DTEFTUyhPQkpFQ1QobykpOw0KPj4+PiArICAgIHN0YXRpYyBp
bnQgbWlncmF0ZWRfZGV2czsNCj4+Pj4gKyAgICBFcnJvciAqbG9jYWxfZXJyID0gTlVMTDsNCj4+
Pj4gKyAgICBpbnQgcmV0Ow0KPj4+PiArDQo+Pj4+ICsgICAgLyoqDQo+Pj4+ICsgICAgICogVE9E
TzogbW92ZSB0byBWRlVfTUlHUl9TVEFURV9SRVNVTUUgaGFuZGxlci4gUHJlc2VudGx5LCB0aGUN
Cj4+Pj4gKyAgICAgKiBWTVNEIGRhdGEgZnJvbSBzb3VyY2UgaXMgbm90IGF2YWlsYWJsZSBhdCBS
RVNVTUUgc3RhdGUuDQo+Pj4+ICsgICAgICogV29ya2luZyBvbiBhIGZpeCBmb3IgdGhpcy4NCj4+
Pj4gKyAgICAgKi8NCj4+Pj4gKyAgICBpZiAoIW8tPnZmdV9taWdfZmlsZSkgew0KPj4+PiArICAg
ICAgICBvLT52ZnVfbWlnX2ZpbGUgPSBxZW11X2ZvcGVuX29wcyhvLCAmdmZ1X21pZ19mb3BzX2xv
YWQsIGZhbHNlKTsNCj4+Pj4gKyAgICB9DQo+Pj4+ICsNCj4+Pj4gKyAgICByZXQgPSBxZW11X3Jl
bW90ZV9sb2Fkdm0oby0+dmZ1X21pZ19maWxlKTsNCj4+Pj4gKyAgICBpZiAocmV0KSB7DQo+Pj4+
ICsgICAgICAgIFZGVV9PQkpFQ1RfRVJST1IobywgInZmdTogZmFpbGVkIHRvIHJlc3RvcmUgZGV2
aWNlIHN0YXRlIik7DQo+Pj4+ICsgICAgICAgIHJldHVybjsNCj4+Pj4gKyAgICB9DQo+Pj4+ICsN
Cj4+Pj4gKyAgICBxZW11X2ZpbGVfc2h1dGRvd24oby0+dmZ1X21pZ19maWxlKTsNCj4+Pj4gKyAg
ICBvLT52ZnVfbWlnX2ZpbGUgPSBOVUxMOw0KPj4+PiArDQo+Pj4+ICsgICAgLyogVkZVX01JR1Jf
U1RBVEVfUlVOTklORyBiZWdpbnMgaGVyZSAqLw0KPj4+PiArICAgIGlmICgrK21pZ3JhdGVkX2Rl
dnMgPT0gay0+bnJfZGV2cykgew0KPj4+IA0KPj4+IFdoZW4gaXMgdGhpcyBjb3VudGVyIHJlc2V0
IHNvIG1pZ3JhdGlvbiBjYW4gYmUgdHJpZWQgYWdhaW4gaWYgaXQNCj4+PiBmYWlscy9jYW5jZWxz
Pw0KPj4gDQo+PiBEZXRlY3RpbmcgY2FuY2VsbGF0aW9uIGlzIGEgcGVuZGluZyBpdGVtLiBXZSB3
aWxsIGFkZHJlc3MgaXQgaW4gdGhlDQo+PiBuZXh0IHJldi4gV2lsbCBjaGVjayB3aXRoIHlvdSBp
ZiAgd2UgZ2V0IHN0dWNrIGR1cmluZyB0aGUgcHJvY2Vzcw0KPj4gb2YgaW1wbGVtZW50aW5nIGl0
Lg0KPj4gDQo+Pj4gDQo+Pj4+ICtzdGF0aWMgc3NpemVfdCB2ZnVfbWlnX3JlYWRfZGF0YSh2ZnVf
Y3R4X3QgKnZmdV9jdHgsIHZvaWQgKmJ1ZiwNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVpbnQ2NF90IHNpemUsIHVpbnQ2NF90IG9mZnNldCkNCj4+Pj4gK3sNCj4+Pj4g
KyAgICBWZnVPYmplY3QgKm8gPSB2ZnVfZ2V0X3ByaXZhdGUodmZ1X2N0eCk7DQo+Pj4+ICsNCj4+
Pj4gKyAgICBpZiAob2Zmc2V0ID4gby0+dmZ1X21pZ19idWZfc2l6ZSkgew0KPj4+PiArICAgICAg
ICByZXR1cm4gLTE7DQo+Pj4+ICsgICAgfQ0KPj4+PiArDQo+Pj4+ICsgICAgaWYgKChvZmZzZXQg
KyBzaXplKSA+IG8tPnZmdV9taWdfYnVmX3NpemUpIHsNCj4+Pj4gKyAgICAgICAgd2Fybl9yZXBv
cnQoInZmdTogYnVmZmVyIG92ZXJmbG93IC0gY2hlY2sgcGVuZGluZ19ieXRlcyIpOw0KPj4+PiAr
ICAgICAgICBzaXplID0gby0+dmZ1X21pZ19idWZfc2l6ZSAtIG9mZnNldDsNCj4+Pj4gKyAgICB9
DQo+Pj4+ICsNCj4+Pj4gKyAgICBtZW1jcHkoYnVmLCAoby0+dmZ1X21pZ19idWYgKyBvZmZzZXQp
LCBzaXplKTsNCj4+Pj4gKw0KPj4+PiArICAgIG8tPnZmdV9taWdfYnVmX3BlbmRpbmcgLT0gc2l6
ZTsNCj4+PiANCj4+PiBUaGlzIGFzc3VtZXMgdGhhdCB0aGUgY2FsbGVyIGluY3JlbWVudHMgb2Zm
c2V0IGJ5IHNpemUgZWFjaCB0aW1lLiBJZg0KPj4+IHRoYXQgYXNzdW1wdGlvbiBpcyBva2F5LCB0
aGVuIHdlIGNhbiBqdXN0IHRydXN0IG9mZnNldCBhbmQgZG9uJ3QgbmVlZCB0bw0KPj4+IGRvIGFy
aXRobWV0aWMgb24gdmZ1X21pZ19idWZfcGVuZGluZy4gSWYgdGhhdCBhc3N1bXB0aW9uIGlzIG5v
dCBjb3JyZWN0LA0KPj4+IHRoZW4gdGhlIGNvZGUgbmVlZHMgdG8gYmUgZXh0ZW5kZWQgdG8gc2Fm
ZWx5IHVwZGF0ZSB2ZnVfbWlnX2J1Zl9wZW5kaW5nDQo+Pj4gd2hlbiBvZmZzZXQganVtcHMgYXJv
dW5kIGFyYml0cmFyaWx5IGJldHdlZW4gY2FsbHMuDQo+PiANCj4+IEdvaW5nIGJ5IHRoZSBkZWZp
bml0aW9uIG9mIHZmdV9taWdyYXRpb25fY2FsbGJhY2tzX3QgaW4gdGhlIGxpYnJhcnksIEkgYXNz
dW1lZA0KPj4gdGhhdCByZWFkX2RhdGEgYWR2YW5jZXMgdGhlIG9mZnNldCBieSBzaXplIGJ5dGVz
Lg0KPj4gDQo+PiBXaWxsIGFkZCBhIGNvbW1lbnQgYSBjb21tZW50IHRvIGV4cGxhaW4gdGhhdC4N
Cj4+IA0KPj4+IA0KPj4+PiArdWludDY0X3Qgdm1zdGF0ZV92bXNkX3NpemUoUENJRGV2aWNlICpw
Y2lfZGV2KQ0KPj4+PiArew0KPj4+PiArICAgIERldmljZUNsYXNzICpkYyA9IERFVklDRV9HRVRf
Q0xBU1MoREVWSUNFKHBjaV9kZXYpKTsNCj4+Pj4gKyAgICBjb25zdCBWTVN0YXRlRmllbGQgKmZp
ZWxkID0gTlVMTDsNCj4+Pj4gKyAgICB1aW50NjRfdCBzaXplID0gMDsNCj4+Pj4gKw0KPj4+PiAr
ICAgIGlmICghZGMtPnZtc2QpIHsNCj4+Pj4gKyAgICAgICAgcmV0dXJuIDA7DQo+Pj4+ICsgICAg
fQ0KPj4+PiArDQo+Pj4+ICsgICAgZmllbGQgPSBkYy0+dm1zZC0+ZmllbGRzOw0KPj4+PiArICAg
IHdoaWxlIChmaWVsZCAmJiBmaWVsZC0+bmFtZSkgew0KPj4+PiArICAgICAgICBzaXplICs9IHZt
c3RhdGVfc2l6ZShwY2lfZGV2LCBmaWVsZCk7DQo+Pj4+ICsgICAgICAgIGZpZWxkKys7DQo+Pj4+
ICsgICAgfQ0KPj4+PiArDQo+Pj4+ICsgICAgcmV0dXJuIHNpemU7DQo+Pj4+ICt9DQo+Pj4gDQo+
Pj4gVGhpcyBmdW5jdGlvbiBsb29rcyBpbmNvcnJlY3QgYmVjYXVzZSBpdCBpZ25vcmVzIHN1YnNl
Y3Rpb25zIGFzIHdlbGwgYXMNCj4+PiBydW50aW1lIGJlaGF2aW9yIGR1cmluZyBzYXZlKCkuIEFs
dGhvdWdoIFZNU3RhdGVEZXNjcmlwdGlvbiBpcyBwYXJ0aWFsbHkNCj4+PiBkZWNsYXJhdGl2ZSwg
dGhlcmUgaXMgc3RpbGwgYSBidW5jaCBvZiBpbXBlcmF0aXZlIGNvZGUgdGhhdCBjYW4gd3JpdGUg
dG8NCj4+PiB0aGUgUUVNVUZpbGUgYXQgc2F2ZSgpIHRpbWUgc28gdGhlcmUncyBubyB3YXkgb2Yg
a25vd2luZyB0aGUgc2l6ZSBhaGVhZA0KPj4+IG9mIHRpbWUuDQo+PiANCj4+IEkgc2VlIHlvdXIg
cG9pbnQsIGl0IHdvdWxkIGJlIGEgcHJvYmxlbSBmb3IgYW55IGZpZWxkIHdoaWNoIGhhcyB0aGUN
Cj4+IChWTVNfQlVGRkVSIHwgVk1TX0FMTE9DKSBmbGFncyBzZXQuDQo+PiANCj4+PiANCj4+PiBJ
IGFza2VkIHRoaXMgaW4gYSBwcmV2aW91cyByZXZpc2lvbiBvZiB0aGlzIHNlcmllcyBidXQgSSdt
IG5vdCBzdXJlIGlmDQo+Pj4gaXQgd2FzIGFuc3dlcmVkOiBpcyBpdCByZWFsbHkgbmVjZXNzYXJ5
IHRvIGtub3cgdGhlIHNpemUgb2YgdGhlIHZtc3RhdGU/DQo+Pj4gSSB0aG91Z2h0IHRoZSBWRklP
IG1pZ3JhdGlvbiBpbnRlcmZhY2UgaXMgZGVzaWduZWQgdG8gc3VwcG9ydA0KPj4+IHN0cmVhbWlu
ZyByZWFkcy93cml0ZXMuIFdlIGNvdWxkIGNob29zZSBhIGZpeGVkIHNpemUgbGlrZSA2NEtCIGFu
ZA0KPj4+IHN0cmVhbSB0aGUgdm1zdGF0ZSBpbiA2NEtCIGNodW5rcy4NCj4+IA0KPj4gVGhlIGxp
YnJhcnkgZXhwb3NlcyB0aGUgbWlncmF0aW9uIGRhdGEgdG8gdGhlIGNsaWVudCBhcyBhIGRldmlj
ZSBCQVIgd2l0aA0KPj4gZml4ZWQgc2l6ZSAtIHRoZSBzaXplIG9mIHdoaWNoIGlzIGZpeGVkIGF0
IGJvb3QgdGltZSwgZXZlbiB3aGVuIHVzaW5nDQo+PiB2ZnVfbWlncmF0aW9uX2NhbGxiYWNrc190
IGNhbGxiYWNrcy4NCj4+IA0KPj4gSSBkb27igJl0IGJlbGlldmUgdGhlIGxpYnJhcnkgc3VwcG9y
dHMgc3RyZWFtaW5nIHZtc3RhdGUvbWlncmF0aW9uLWRhdGEgLSBzZWUNCj4+IHRoZSBmb2xsb3dp
bmcgY29tbWVudCBpbiBtaWdyYXRpb25fcmVnaW9uX2FjY2VzcygpIGRlZmluZWQgaW4gdGhlIGxp
YnJhcnk6DQo+PiANCj4+ICogRG9lcyB0aGlzIG1lYW4gdGhhdCBwYXJ0aWFsIHJlYWRzIGFyZSBu
b3QgYWxsb3dlZD8NCj4+IA0KPj4gVGhhbm9zIG9yIEpvaG4sDQo+PiANCj4+ICAgIENvdWxkIHlv
dSBwbGVhc2UgY2xhcmlmeSB0aGlzPw0KPj4gDQo+PiBTdGVmYW4sDQo+PiAgICBXZSBhdHRlbXB0
ZWQgdG8gYW5zd2VyIHRoZSBtaWdyYXRpb24gY2FuY2VsbGF0aW9uIGFuZCB2bXN0YXRlIHNpemUN
Cj4+ICAgIHF1ZXN0aW9ucyBwcmV2aW91c2x5IGFsc28sIGluIHRoZSBmb2xsb3dpbmcgZW1haWw6
DQo+PiANCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9GNDg2MDZCMS0xNUE0LTRERDIt
OUQ3MS0yRkNBRkMwRTY3MUZAb3JhY2xlLmNvbS8NCj4gDQo+PiBsaWJ2ZmlvLXVzZXIgaGFzIHRo
ZSB2ZnVfbWlncmF0aW9uX2NhbGxiYWNrc190IGludGVyZmFjZSB0aGF0IGFsbG93cyB0aGUNCj4+
IGRldmljZSB0byBzYXZlL2xvYWQgbW9yZSBkYXRhIHJlZ2FyZGxlc3Mgb2YgdGhlIHNpemUgb2Yg
dGhlIG1pZ3JhdGlvbg0KPj4gcmVnaW9uLiBJIGRvbid0IHNlZSB0aGUgaXNzdWUgaGVyZSBzaW5j
ZSB0aGUgcmVnaW9uIGRvZXNuJ3QgbmVlZCB0byBiZQ0KPj4gc2l6ZWQgdG8gZml0IHRoZSBzYXZl
dm0gZGF0YT8NCj4gDQo+IFRoZSBhbnN3ZXIgZGlkbid0IG1ha2Ugc2Vuc2UgdG8gbWU6DQo+IA0K
PiAiSW4gYm90aCBzY2VuYXJpb3MgYXQgdGhlIHNlcnZlciBlbmQgLSB3aGV0aGVyIHVzaW5nIHRo
ZSBtaWdyYXRpb24gQkFSIG9yDQo+IHVzaW5nIGNhbGxiYWNrcywgdGhlIG1pZ3JhdGlvbiBkYXRh
IGlzIHRyYW5zcG9ydGVkIHRvIHRoZSBvdGhlciBlbmQgdXNpbmcNCj4gdGhlIEJBUi4gQXMgc3Vj
aCB3ZSBuZWVkIHRvIHNwZWNpZnkgdGhlIEJBUuKAmXMgc2l6ZSBkdXJpbmcgaW5pdGlhbGl6YXRp
b24uDQo+IA0KPiBJbiB0aGUgY2FzZSBvZiB0aGUgY2FsbGJhY2tzLCB0aGUgbGlicmFyeSB0cmFu
c2xhdGVzIHRoZSBCQVIgYWNjZXNzIHRvIGNhbGxiYWNrcy4iDQo+IA0KPiBUaGUgQkFSIGFuZCB0
aGUgbWlncmF0aW9uIHJlZ2lvbiB3aXRoaW4gaXQgbmVlZCBhIHNpemUgYnV0IG15DQo+IHVuZGVy
c3RhbmRpbmcgaXMgdGhhdCBWRklPIG1pZ3JhdGlvbiBpcyBkZXNpZ25lZCB0byBzdHJlYW0gdGhl
IGRldmljZQ0KPiBzdGF0ZSwgYWxsb3dpbmcgaXQgdG8gYmUgYnJva2VuIHVwIGludG8gbXVsdGlw
bGUgcmVhZHMvd3JpdGVzIHdpdGgNCj4ga25vd2luZyB0aGUgZGV2aWNlIHN0YXRlJ3Mgc2l6ZSB1
cGZyb250LiBIZXJlIGlzIHRoZSBkZXNjcmlwdGlvbiBmcm9tDQo+IDxsaW51eC92ZmlvLmg+Og0K
PiANCj4gICogVGhlIHNlcXVlbmNlIHRvIGJlIGZvbGxvd2VkIHdoaWxlIGluIHByZS1jb3B5IHN0
YXRlIGFuZCBzdG9wLWFuZC1jb3B5IHN0YXRlDQo+ICAqIGlzIGFzIGZvbGxvd3M6DQo+ICAqIGEu
IFJlYWQgcGVuZGluZ19ieXRlcywgaW5kaWNhdGluZyB0aGUgc3RhcnQgb2YgYSBuZXcgaXRlcmF0
aW9uIHRvIGdldCBkZXZpY2UNCj4gICogICAgZGF0YS4gUmVwZWF0ZWQgcmVhZCBvbiBwZW5kaW5n
X2J5dGVzIGF0IHRoaXMgc3RhZ2Ugc2hvdWxkIGhhdmUgbm8gc2lkZQ0KPiAgKiAgICBlZmZlY3Rz
Lg0KPiAgKiAgICBJZiBwZW5kaW5nX2J5dGVzID09IDAsIHRoZSB1c2VyIGFwcGxpY2F0aW9uIHNo
b3VsZCBub3QgaXRlcmF0ZSB0byBnZXQgZGF0YQ0KPiAgKiAgICBmb3IgdGhhdCBkZXZpY2UuDQo+
ICAqICAgIElmIHBlbmRpbmdfYnl0ZXMgPiAwLCBwZXJmb3JtIHRoZSBmb2xsb3dpbmcgc3RlcHMu
DQo+ICAqIGIuIFJlYWQgZGF0YV9vZmZzZXQsIGluZGljYXRpbmcgdGhhdCB0aGUgdmVuZG9yIGRy
aXZlciBzaG91bGQgbWFrZSBkYXRhDQo+ICAqICAgIGF2YWlsYWJsZSB0aHJvdWdoIHRoZSBkYXRh
IHNlY3Rpb24uIFRoZSB2ZW5kb3IgZHJpdmVyIHNob3VsZCByZXR1cm4gdGhpcw0KPiAgKiAgICBy
ZWFkIG9wZXJhdGlvbiBvbmx5IGFmdGVyIGRhdGEgaXMgYXZhaWxhYmxlIGZyb20gKHJlZ2lvbiAr
IGRhdGFfb2Zmc2V0KQ0KPiAgKiAgICB0byAocmVnaW9uICsgZGF0YV9vZmZzZXQgKyBkYXRhX3Np
emUpLg0KPiAgKiBjLiBSZWFkIGRhdGFfc2l6ZSwgd2hpY2ggaXMgdGhlIGFtb3VudCBvZiBkYXRh
IGluIGJ5dGVzIGF2YWlsYWJsZSB0aHJvdWdoDQo+ICAqICAgIHRoZSBtaWdyYXRpb24gcmVnaW9u
Lg0KPiAgKiAgICBSZWFkIG9uIGRhdGFfb2Zmc2V0IGFuZCBkYXRhX3NpemUgc2hvdWxkIHJldHVy
biB0aGUgb2Zmc2V0IGFuZCBzaXplIG9mDQo+ICAqICAgIHRoZSBjdXJyZW50IGJ1ZmZlciBpZiB0
aGUgdXNlciBhcHBsaWNhdGlvbiByZWFkcyBkYXRhX29mZnNldCBhbmQNCj4gICogICAgZGF0YV9z
aXplIG1vcmUgdGhhbiBvbmNlIGhlcmUuDQo+ICAqIGQuIFJlYWQgZGF0YV9zaXplIGJ5dGVzIG9m
IGRhdGEgZnJvbSAocmVnaW9uICsgZGF0YV9vZmZzZXQpIGZyb20gdGhlDQo+ICAqICAgIG1pZ3Jh
dGlvbiByZWdpb24uDQo+ICAqIGUuIFByb2Nlc3MgdGhlIGRhdGEuDQo+ICAqIGYuIFJlYWQgcGVu
ZGluZ19ieXRlcywgd2hpY2ggaW5kaWNhdGVzIHRoYXQgdGhlIGRhdGEgZnJvbSB0aGUgcHJldmlv
dXMNCj4gICogICAgaXRlcmF0aW9uIGhhcyBiZWVuIHJlYWQuIElmIHBlbmRpbmdfYnl0ZXMgPiAw
LCBnbyB0byBzdGVwIGIuDQo+ICAqDQo+ICAqIFRoZSB1c2VyIGFwcGxpY2F0aW9uIGNhbiB0cmFu
c2l0aW9uIGZyb20gdGhlIF9TQVZJTkd8X1JVTk5JTkcNCj4gICogKHByZS1jb3B5IHN0YXRlKSB0
byB0aGUgX1NBVklORyAoc3RvcC1hbmQtY29weSkgc3RhdGUgcmVnYXJkbGVzcyBvZiB0aGUNCj4g
ICogbnVtYmVyIG9mIHBlbmRpbmcgYnl0ZXMuIFRoZSB1c2VyIGFwcGxpY2F0aW9uIHNob3VsZCBp
dGVyYXRlIGluIF9TQVZJTkcNCj4gICogKHN0b3AtYW5kLWNvcHkpIHVudGlsIHBlbmRpbmdfYnl0
ZXMgaXMgMC4NCj4gDQo+IFRoaXMgbWVhbnMgeW91IGNhbiByZXBvcnQgcGVuZGluZ19ieXRlcyA+
IDAgdW50aWwgdGhlIGVudGlyZSB2bXN0YXRlIGhhcw0KPiBiZWVuIHJlYWQgYW5kIGNhbiBwaWNr
IGEgZml4ZWQgY2h1bmsgc2l6ZSBsaWtlIDY0S0IgZm9yIHRoZSBtaWdyYXRpb24NCj4gcmVnaW9u
LiBUaGVyZSdzIG5vIG5lZWQgdG8gc2l6ZSB0aGUgbWlncmF0aW9uIHJlZ2lvbiB0byBmaXQgdGhl
IGVudGlyZQ0KPiB2bXN0YXRlLg0KDQpUaGFuayB5b3UgZm9yIHRoZSBwb2ludGVyIHRvIGdlbmVy
aWMgVkZJTyBtaWdyYXRpb24sIFN0ZWZhbiEgTWFrZXMgc2Vuc2UuDQoNClNvIEkgdW5kZXJzdGFu
ZCB0aGF0IHRoZSBWRklPIG1pZ3JhdGlvbiByZWdpb24gY2FydmVzIG91dCBhIHNlY3Rpb24gdG8N
CnN0cmVhbS9zaHV0dGxlIGRldmljZSBkYXRhIGJldHdlZW4gdGhlIGFwcCAoUUVNVSBjbGllbnQg
aW4gdGhpcyBjYXNlKSBhbmQgdGhlDQpkcml2ZXIgKFFFTVUgc2VydmVyKS4gVGhpcyBzZWN0aW9u
IHN0YXJ0cyBhdCBkYXRhX29mZnNldCB3aXRoaW4gdGhlIHJlZ2lvbiBhbmQgc3BhbnMNCmRhdGFf
c2l6ZSBieXRlcy4NCg0KV2UgY291bGQgY2hhbmdlIHRoZSBzZXJ2ZXIgdG8gc3RyZWFtIHRoZSBk
YXRhIGFzIG91dGxpbmVkIGFib3ZlLiBEbyB5b3UgaGF2ZSBhDQpwcmVmZXJlbmNlIGZvciB0aGUg
c2VjdGlvbiBzaXplPyBEb2VzIHFlbXVfdGFyZ2V0X3BhZ2Vfc2l6ZSgpIHdvcms/IEkganVzdCB0
ZXN0ZWQNCmFuZCBhbSBhYmxlIHRvIHN0cmVhbSB3aXRoIGEgZml4ZWQgQkFSIHNpemUgc3VjaCBh
cyBxZW11X3RhcmdldF9wYWdlX3NpemUoKS4NCg0KVGhhbmsgeW91IQ0KLS0NCkphZw0KDQo+IA0K
PiBTdGVmYW4NCg0K

