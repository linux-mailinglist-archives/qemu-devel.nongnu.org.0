Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D3B62B5E9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 10:04:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovEKe-0003a2-No; Wed, 16 Nov 2022 04:03:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ORO@il.ibm.com>)
 id 1ovEKY-0003Za-Fq; Wed, 16 Nov 2022 04:03:38 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ORO@il.ibm.com>)
 id 1ovEKV-0008Ug-C0; Wed, 16 Nov 2022 04:03:37 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AG8X1Cu004912; Wed, 16 Nov 2022 09:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : date :
 message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=OBLTiwykBO/gH8g4e3M9/0mDDf56UGv8C9IZfWJTahg=;
 b=nGzHT84LFmmpHyF1K4rrRG5YyLrhEkubzU1LjA9lEpHo1obEJNopz9D3vDhUAU2nSCeq
 UEagjgAb8MZcv1IbGtWj1OLSc6XabPwBNogUeDEUPQblH34mbeJ3qWI8gLdPAuU1lIXe
 vF6zG5TIqN6XOn+V+NRQ3XmtTgpdKI9oK0SWIAflIRqQJbIClY8fxyOygDwfZxR8q4h9
 li+2kFX1FGvcttjeUPySALuQXCaNk4H3UDHcQhq+ry6ZBQkg9yK5EkKwkb/AC5DEmSNh
 7onCiLO1hIj93yq0f1ZuSGyx6xPL7ntohQ9cYlTDcOlNNwUqAyifxsic0jMAaaKyj1Ci XQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kvvetgqvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 09:03:33 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AG8YIEk010408;
 Wed, 16 Nov 2022 09:03:33 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kvvetgqur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 09:03:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4XbpX0+zBl9MODXrI85QWBV0cQWBeJO/Hst0ycK0U000zBE9UFbVlgpUOmQdHOC4yF64vPA2DrJpdkTRXU6V3IUlulSICWERDpeCXnZylw8DiZjsc2PaZk/47m172PujJJOPfz55Q0VmjjUIStixdA96bKXITTs6cmC2To70WgNO4DbCza4Fu/pSlrGMMaV49td6mR8rY0ywYl5sfeP95AJxwVIvF+g7P0YPt6I4K+tgE62EQz7au3VNA59pttF85he0Rb2fC6/eK41Ttf8ofAM2EYSJ1XYNr/S8zoDU49njFCF3jfJJ+wFasWwH5VEqgtSVbaYlek7xNNZe+L1+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBLTiwykBO/gH8g4e3M9/0mDDf56UGv8C9IZfWJTahg=;
 b=il0iq1+n0HCtgXePMGaTd9ahc6bwy1HudleEAsaXWglEZ1xFe2nTr+Nc58nymbcaU6FCJQHLqbDA6+ymh+jgT06YhtIhVVQb5luAw7Lqo9fPzg48huLpDz8D3ICij9acMccU4Ksz8p73Bfy/Q0VTd8No9uba7iXuolDon27U++Op19T115YexQHGXltbXE7yoHxNOs99tgaA8ilz3zlGVcrCMNQn8y2IQTdB2eXPVkvICh+6q2ieNDIHDY6+qQKIHuWOkvyFwVWKC41/NbPSgde5n1EY5kBJTwQ/Vz3OqljYQF+rN2F2y5vROSdc7v7P0KlaA7okX2mt1/qLHhxdTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=il.ibm.com; dmarc=pass action=none header.from=il.ibm.com;
 dkim=pass header.d=il.ibm.com; arc=none
Received: from MN2PR15MB3488.namprd15.prod.outlook.com (2603:10b6:208:a6::17)
 by DM6PR15MB3990.namprd15.prod.outlook.com (2603:10b6:5:2b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Wed, 16 Nov
 2022 09:03:31 +0000
Received: from MN2PR15MB3488.namprd15.prod.outlook.com
 ([fe80::95f:9dc4:235d:c082]) by MN2PR15MB3488.namprd15.prod.outlook.com
 ([fe80::95f:9dc4:235d:c082%7]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 09:03:31 +0000
From: Or Ozeri <ORO@il.ibm.com>
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, Danny Harnik <DANNYH@il.ibm.com>,
 "idryomov@gmail.com" <idryomov@gmail.com>
Thread-Topic: [EXTERNAL] Re: [PATCH v3] block/rbd: Add support for layered
 encryption
Thread-Index: AQHY+O1f2SmBS264OUGDNGysDDoGAa5AQqWAgAD970A=
Date: Wed, 16 Nov 2022 09:03:31 +0000
Message-ID: <MN2PR15MB34886DD5A9D0F5D64A248AA08A079@MN2PR15MB3488.namprd15.prod.outlook.com>
References: <20221115122527.2896476-1-oro@il.ibm.com>
 <Y3PQj/MBztn8SobQ@redhat.com>
In-Reply-To: <Y3PQj/MBztn8SobQ@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR15MB3488:EE_|DM6PR15MB3990:EE_
x-ms-office365-filtering-correlation-id: 2de3181f-a612-4aa7-668b-08dac7b16f19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OaK6g6KfENgwAD2nma2zjCUbN+/Zu/q6m3XMDPCVlDYc7jVWxqR5T3r7TmjiO6Am56pPm5chVexmJiGaDK7CKd1VvxQYnrRnPXQOgiDdD5nLnpvv0AdqlOtlr4u0vMYEFKzYnHVFq7IJg3Xr0aoelnwNws8KOPEdzbQexa7ijp7VgP00L1fO1AXIVYBQVcOHTEroXXLGLv8Dx2nyOWrVILTyjS/kR+Qr3Ul46kzUOaxsQtnS+czP8NRj8j8btBAkk2zaViSSyQzZiFu/TPiysEc1Ipm3wX6h+6Uc/D/4ZWjpsD6WBfWm6J+oVYAxjCvo1V9caK4JXlDDnB0Sm8128rAilnIsTXg0Do40eNUo0/jmJMbwB/HMetopaqRyfpFq8WbKhgsNP5svBYH6D1vbXSj9GD6XoKTDyzXrZmisLu4TuH6zuHk0wKkQT9QB2PnRhe4ugJ0eNuF49oC97IUknfKftI0bs3rsP7FAXCIqMe7ImxA/grAU5bkmCojPD+EhNhlY+t78lU7Ml3PvoQfP9LqFzpQCRpKXUgauop9qZsyDJdHf7TiagTWcy4pITEr+ccCul+kd3aYMauUz30GvTWw6yvAkEACGqjb1PTUE4JIQcWrlTf4oJ7HRieMHEuYS0Wb/VGHRO4FFnLUc5+JdSVMJQ8HJaAcH+2YS6+XcvL8B34kwJjaqgj7bs1FUlZT0IYDwWMLya1aOUHN0VOjnXqJ2EQPp3lCK+G4VbSYM8fdgfx9QOkktruzyIkoDn7Nhak1r8KmHMpqVZR65ng5ErA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR15MB3488.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199015)(86362001)(33656002)(4744005)(2906002)(8936002)(122000001)(52536014)(66556008)(83380400001)(38070700005)(38100700002)(186003)(54906003)(316002)(478600001)(6916009)(8676002)(5660300002)(55016003)(53546011)(71200400001)(66476007)(4326008)(41300700001)(76116006)(6506007)(66446008)(64756008)(9686003)(66946007)(26005)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkJPbnp4dTJsaTRHQWtYMzRXSjU5WmZEa0hNdmw5V1luQWt0OVM1eEkvSG03?=
 =?utf-8?B?czNNb2ovU2o1YkQyZHVqbElVRnZKdkJyK3BWL0FYNS9iSEl0WEVhWW51eThI?=
 =?utf-8?B?Q2ZzcXA4Z0hJNTZrd0dOM3lhcmpZTmJZTHJuQzluTlBCOTRDQUlVNVlrdmJN?=
 =?utf-8?B?VXJUVnRDbFdvVGpic0srTHl5eHZrMEV6WDBqVEtOSytPSWEvSGE5bW5xcHBY?=
 =?utf-8?B?bFVYVGR1WUdXU2FWU3NwVEwzMUErUEJhQ3dYQ0o1cUQyenBMenNkQkY5Z1ND?=
 =?utf-8?B?Um5SckVHajRhWVppMzAxR1h2SlJkUndadW9YOURTRVZWSWdxTEQ3RklHd09O?=
 =?utf-8?B?OUVXejFOQVVXM0FqcDEyWEdIYmtKdUpsNkNvMXNBVUxhOTAvNUtpQllxb2hF?=
 =?utf-8?B?bDNDUFYzcWNmMmtuYktxa09XRjJvV09yYmVvR05WbG9nSnQvMTY3TkNsQ21D?=
 =?utf-8?B?V00zMnlxSkcva1dxek1iSnd1TXhqeTBRTW9CYks2c0tqaWFMdHFNYzJySHVB?=
 =?utf-8?B?YjdsM1FIemNIbWpUcVZuMEhUVTlFWDR4ZStoMzhDeUZjYkIxaVJDV1lKNTJI?=
 =?utf-8?B?VnF1ald1bkYrR09vUVFhM1IxaDdCZXhXU3luUFYxRmo3Sm9ZaU4yeDQ0cG94?=
 =?utf-8?B?ZGdQQVFIMmxHNlJmOUhndUdoSXU2dkZaSVJyYXlzRE5TdDhneFJjOFdHRHZt?=
 =?utf-8?B?QXBXWTZXeEZsR1dKRS80NElMajQ0REd4L0Z2WWNzaERxdDVIbEoyZjdQVUpK?=
 =?utf-8?B?QnNYTkJtOHUvLzJxcmRUTk5aaW5OcXpGR05lY1d0azRKSWxYOTVaTm01cTlI?=
 =?utf-8?B?Qm5WcEdOUDNteDFGK3hoc0lnYjAzd0t5bi96RHNITWwvM256Sk4vNXpvWFh1?=
 =?utf-8?B?VmdHWFJXekg4TllPc1BwUkFaZGJMSHgrVVZvc2dXaGJIZUVwc2duODNJeUtO?=
 =?utf-8?B?bWZtclBWempwbU5IMU5CVXJDSzd0MklYMG93TGc0MGExQkF4aUZWWnlOOGRk?=
 =?utf-8?B?NS9BdGRiOG9NbC9UQTlLT2xGUC9ObTNBMTRtelllNTJib1hCNlRnYkhuM3Qv?=
 =?utf-8?B?V0psenhLSXlKbXJwU1JHVWswU280cktjTDNPVFFLZnQwNk45cnIyNVYyc1My?=
 =?utf-8?B?OXMyaHpweG1xV1ZWbXJxamRXenpmWDRyaWZuajJ2S2JaRy9zSjlBSVdJLzF4?=
 =?utf-8?B?UWVCWXppeTRHTFhqRllKcXEyZ3Y0Rkljbk1YajdCdEFYa0NvV2ZwQjJXa1ZT?=
 =?utf-8?B?Qi85dkZjeHN4WjJ1UUhLODBXS3VVcFMxQW15VVlkbUtvRTZSZ2RGV1dBQmRZ?=
 =?utf-8?B?ZVVxZWhnWWJvcnR1Q0Vmei81WUd1cFNKZENPQURIa3FlZmYvRUtnY2tUNS9F?=
 =?utf-8?B?N0JNU1FlNDVKemZ2Q0d1L1NBUk45TWNVRHNkckdhMDMrRlNvcVRRajYrR01U?=
 =?utf-8?B?RnVwMGRzR211YkhHQjZVRStrMHQwY1ZzL0t5dk1QL2JqampPSmtKZ25vMEhk?=
 =?utf-8?B?cG9YN1dlWUtYKzJjNEs1NnY3dm80a05MbUNOZ1dsVDI1OEFwUlphaExEaTlM?=
 =?utf-8?B?SjhieXZWVU1FYU44UmVVZHlIY1RMVXVRR0JNbktreS8rY0xabVp1WEcrVHE4?=
 =?utf-8?B?dG9ZajJta2lSWStLS0FsYzdEQVRISDl5Y0dTNnZZN0hzN0JjWjNESmVoVjV2?=
 =?utf-8?B?ZnNGKzUyeElSVkNJalVYZU9IQ1htakRJM1BaZ0l0OHZPZzFjZVZmbXRMUlYz?=
 =?utf-8?B?ZTBNZFRrbnZOYmdtclBlQUZ1YUhMWExyenNzR04rQ3VxYW1NZkJ6MWFXSEYx?=
 =?utf-8?B?SndCeDg1bm5FZWNqMGk0c0RGTzRuR0JSWjF3bUdrdFBzZjdvTTRhUGdWNGJO?=
 =?utf-8?B?WlR2L0xJWjFSS3BvNU1QSStseno2dnRwVGJBMHc0SW1YWC8zUlVtSlVwUmpZ?=
 =?utf-8?B?QTkvdjJiZ1BCcGVRRzB6YndSd1RCb2JTMlNVWlJDN0liR2JaempYL1JPVkVL?=
 =?utf-8?B?ZEtjMVN3eGxDa3VmQVF0OHdQOFdqTjBpeEJHaVZLTHhycjZGMGdKOWZGdWFk?=
 =?utf-8?B?ZDNIck53Y3FvZmcrV3BnSVlZQTB3Ni94ZktwRVkzcDZ4ZGVFVTRwUTFkejBY?=
 =?utf-8?Q?q4a8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: il.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR15MB3488.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de3181f-a612-4aa7-668b-08dac7b16f19
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 09:03:31.3108 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VogBI1t8f/WdyeZziLPHIDIKvXXXcasjOk7DzaRItakx2orBipy/O1JA+0pIj/pR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR15MB3990
X-Proofpoint-ORIG-GUID: _vgTOjaozgQH_3DdqU1RTR85RwSzZ_pS
X-Proofpoint-GUID: CD2oyARounCv-vhU5rRZ83TdLFCqeBYg
Subject: RE: [PATCH v3] block/rbd: Add support for layered encryption
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_08,2022-11-15_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=940
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211160063
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ORO@il.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEYW5pZWwgUC4gQmVycmFuZ8Op
IDxiZXJyYW5nZUByZWRoYXQuY29tPg0KPiBTZW50OiAxNSBOb3ZlbWJlciAyMDIyIDE5OjQ3DQo+
IFRvOiBPciBPemVyaSA8T1JPQGlsLmlibS5jb20+DQo+IENjOiBxZW11LWRldmVsQG5vbmdudS5v
cmc7IHFlbXUtYmxvY2tAbm9uZ251Lm9yZzsgRGFubnkgSGFybmlrDQo+IDxEQU5OWUhAaWwuaWJt
LmNvbT47IGlkcnlvbW92QGdtYWlsLmNvbQ0KPiBTdWJqZWN0OiBbRVhURVJOQUxdIFJlOiBbUEFU
Q0ggdjNdIGJsb2NrL3JiZDogQWRkIHN1cHBvcnQgZm9yIGxheWVyZWQNCj4gZW5jcnlwdGlvbg0K
PiANCj4gQUZBSUNULCBzdXBwb3J0aW5nIGxheWVyZWQgZW5jcnlwdGlvbiBzaG91bGRuJ3QgcmVx
dWlyZSBhbnl0aGluZyBvdGhlciB0aGFuDQo+IHRoZSAncGFyZW50JyBhZGRpdGlvbi4NCj4gDQoN
ClNpbmNlIHRoZSBsYXllcmVkIGVuY3J5cHRpb24gQVBJIGlzIG5ldyBpbiBsaWJyYmQsIHdlIGRv
bid0IGhhdmUgdG8gc3VwcG9ydCAibHVrcyIgYW5kICJsdWtzMiIgYXQgYWxsLg0KSW4gbGlicmJk
IHdlIGFyZSBhY3R1YWxseSBkZXByZWNhdGluZyB0aGUgdXNlIG9mICJsdWtzIiBhbmQgImx1a3My
IiwgYW5kIGluc3RlYWQgYXNrIHVzZXJzIHRvIHVzZSAibHVrcy1hbnkiLg0KSWYgd2UgZG9uJ3Qg
YWRkICJsdWtzLWFueSIgaGVyZSwgd2Ugd2lsbCBuZWVkIHRvIGltcGxlbWVudCBleHBsaWNpdCBj
YXNlcyBmb3IgImx1a3MiIGFuZCAibHVrczIiIGluIHRoZSBxZW11X3JiZF9lbmNyeXB0aW9uX2xv
YWQyLiBUaGlzIGxvb2tzIGxpa2UgYSBraW5kIG9mIHdhc3RlZnVsIGNvZGluZyB0aGF0IHdvbid0
IGJlIGFjdHVhbGx5IHVzZWQgYnkgdXNlcnMgb2YgdGhlIHJiZCBkcml2ZXIgaW4gcWVtdS4NCkFu
eWhvdywgd2UgbmVlZCB0aGUgImx1a3MtYW55IiBvcHRpb24gZm9yIG91ciB1c2UtY2FzZSwgc28g
aWYgeW91IGluc2lzdCwgSSB3aWxsIGZpcnN0IHN1Ym1pdCBhIHBhdGNoIHRvIGFkZCAibHVrcy1h
bnkiLCBiZWZvcmUgdGhpcyBwYXRjaC4NCg==

