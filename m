Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3291049BDC2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 22:14:50 +0100 (CET)
Received: from localhost ([::1]:51654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCT9M-0002uk-R7
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 16:14:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCT7I-0002Ba-Jp
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 16:12:40 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:32556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCT7F-00033d-Tg
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 16:12:40 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20PJH8oY003671; 
 Tue, 25 Jan 2022 21:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Ic8B9pkeJSpxj53zPpDM864WdUV0xRhBgaUd1Cq/4hc=;
 b=NS4s+5OFdRTLa8rxxCkXG0QDm5fO3vmepMeYco4aurAzG462ind4GrCI03dyKDm5eI16
 lA/IjngsagjZ2mXK4XevT5wfXxgcJ5OUFqs0UAY85pJ+xUvHRXtJ8TVEl0Y3MRZTxy2I
 RxkExjNJHSW1qFtgrxylWScWCdJ/exRPwYwIMMfWdoO/EBS/5SVl67oTFAEHNkulKP5U
 4E7r4hcvezakQg9PS/RvgcesNxjm/5rvO/9PbB1Fqo9JFEIdvqnbf8qkGGNdiHQAfOWQ
 5vcbr6E0jQj4t2ytf7Jw4TZ47b/X0CsTliP/1bZDeuATjcfd3zI/Ycu7APgZI/oNW+ue dg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsvmjcvvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 21:12:32 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20PLAxlZ052433;
 Tue, 25 Jan 2022 21:12:31 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by userp3030.oracle.com with ESMTP id 3dr71yt95m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 21:12:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5LocbWWSWXOUm5q9V59MLdjNxsoIr8KhbtXuF/pzXOgipecO/9nXucBQYAflFdEVPeFqsPwWoRVg/4CN0MFrsOfYULRhqhNS9veKHkZkxPGBZDacTjrRAecRahItN4VIPdSur3EjTvqmoxe9iQFHZODZa7prkzyFFo2M1nLyjtzWo09hpyeeqSsAVKzNYB9mvrQh8WXz9SDDvNUn4LCOi+ebcRfUi9inplZY2KE+PXuCbVLwOtl7h+0PyCeetanXyuyp9ZaiYKJoASNykfYti/YuAhLMZG44Sjyw2hvPuQHeWaJS9jWu3BU6rJdmH+Rp1s6KjaioEoQuHowlAqAjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ic8B9pkeJSpxj53zPpDM864WdUV0xRhBgaUd1Cq/4hc=;
 b=EqYW2ehFouDktsHTFGKgc/uXiLOLGDPNZRQAKOpkDfzi+Z/S2i0Y9ONlN0kHnGV26pcVfv9IjYOaO6CCm5TiovIEGMpdwEjQdlpBMJCgSZCbcAAi66xiS99y7+BZfbHpAkTwGsXT6nSitL7RTkjuluJenLH3rI+ozWpAknitFdHSrqLU1uPYK5vdZnXO8YxU8/lT721BN7cyJPvCfpGIhx7CyLDgO832ga3aPMpWQmGdAFG/WwqMoBpnvGFW9RQ0Th0hateozGkYX5fv7/rg9wXkrx0upCcLIXgtkPHM11YfeGa7NnFwJ+Ms6IRaleGtOt077B+VMSS7Uva3VSDDlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ic8B9pkeJSpxj53zPpDM864WdUV0xRhBgaUd1Cq/4hc=;
 b=QLi8i8sDJYE+GGf3048fLAehSbDPP20c/cXZ1BYa66nCJcEarqyp7SV/1JlBcIbI9FK+cyXcIluDbxMOOTYW/itk0WxoLHhbYVnKRqiMh7PRaXML9Ba38L9buX1cx6ueEYqEhz+p4xjLeZNu2T9MId/dqchTIftajUYXiLadYlM=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SJ0PR10MB4528.namprd10.prod.outlook.com (2603:10b6:a03:2d4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Tue, 25 Jan
 2022 21:12:28 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 21:12:28 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5 07/18] vfio-user: set qdev bus callbacks for remote
 machine
Thread-Topic: [PATCH v5 07/18] vfio-user: set qdev bus callbacks for remote
 machine
Thread-Index: AQHYDX18Inv/ubc/mUqScvbK4VQgOqxzljYAgACvUAA=
Date: Tue, 25 Jan 2022 21:12:28 +0000
Message-ID: <5C83E65E-33B6-4282-9276-D651B2E56592@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <1dee463f227f7a865877cd98f78e4ce48ce8ab32.1642626515.git.jag.raman@oracle.com>
 <Ye/UqqSippA8LTHK@stefanha-x1.localdomain>
In-Reply-To: <Ye/UqqSippA8LTHK@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b6963b7-33bd-4f72-b2ba-08d9e047649a
x-ms-traffictypediagnostic: SJ0PR10MB4528:EE_
x-microsoft-antispam-prvs: <SJ0PR10MB45288334AAD5C7609F96E267905F9@SJ0PR10MB4528.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oorhUypW3mJ54nKmxEpjGppvjCloP8mQDDqlkEJGB5LVNCw+XBh4AqMQOU8HywEcJiwM3Nn/uXnMzAkH4i0r8Y+2nEX8rdXt+UQbC4Z+7Dliw8snLR+BJJ9SNsKCne6N3hnnpv9EmXZs1LCsbe609StpBYwEv1Ndt6IagKD/8d18R1LpjjsbBtgm4b6GoqZqNB4KjAeiDzYSrCt2XXjqNAxxhd/DYHrUaqyTyZZkWo8fxepVPXY4QdJhF3g/M/1uLOWR4oXFmSu6F+isggYCHyNaSUqLhlBn3cnSbsgR55wAbOOwgjig1YOECeiogQWZtzh1np3Al7KR2VP/XwOZwhmppIjkCiTd366CD4FKtESyAMLB3KsIZHokfzPnKNjkqzJqK3EtxvhzP+3hPfmm+5UiA/l8EfWcS/EB+a9UOAOOUjSmCXqGWhV86OHzGDvwLD1J+TofTHYefXFd3icFYHu0k3sA8a/zn1QKtbdzfukH8E37QU+Sb2khXbs9qi1WK/deNFqm9oasHXAbq8MRavpaUxg5+isCHVfcSMTSGV0bAkQpZ2PhzwxsOEe1feMp/+xyCO2XwM7yQct/VBEN9My14406rXFiD1cpes2OqQbzqtoFRlfF5YzgXis8RDEzOd7n0+1ZyVP+ekzba/xLA8OFGO3Jv6UN2CuNyZf1bM3FCucCdjEwHTYGgTlSKOGaw4iEXaM81AgYYazF8KKur3msq6876LEan92k8vYemTE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(64756008)(66556008)(186003)(5660300002)(33656002)(8676002)(122000001)(107886003)(2616005)(86362001)(66476007)(66946007)(66446008)(53546011)(6506007)(6512007)(2906002)(38070700005)(316002)(6916009)(76116006)(38100700002)(4326008)(508600001)(71200400001)(36756003)(44832011)(8936002)(83380400001)(54906003)(6486002)(7416002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTQ0WXY3TWIzbWMvRzNPL2MrSFErOVhNUWw5T3E5dlE1ZXRhdnhhcXQxNjVJ?=
 =?utf-8?B?ZXlib2ZhRG5JL2psZmVlaHdCRnphOXRYc29ub25kb2lLekVrV0ZyRGIxb3U5?=
 =?utf-8?B?NXpTWlM5UDZabXREUDhxU3lDYm5RY3dZdm53V0JzVXc1cUp4QzQ3NlBXQ2t2?=
 =?utf-8?B?cFNZM2l6RnpoUHU1L3pORkhoRVp0TmwvN2J3Szg5OC9OOG9kbTR0eE1PYVVy?=
 =?utf-8?B?Uy81dTNlOTBSdWxuMXprU3U5Y1ZXNmpoc0d4STlXR1ZoS0tGZmJnMVI3UWw4?=
 =?utf-8?B?bU4wMU1JZDFnTjF0YnhXV3BnRWlZbFBvQ2QyUUhSODV0QVhscWhCZjlQY1hF?=
 =?utf-8?B?S2xTNTRta3VIc2UwOUFlOVFzb0czazRSbVRNdmVhQU1hcFBwUUJ6VjJKV3NP?=
 =?utf-8?B?Skl3TVRTMmk4d1lNdXl6NnQ0TWZ2VXBkdUVweEFRbGJWZHh3VXRqUVpXYVpy?=
 =?utf-8?B?WTRXNU9UdzAxTERML0lwcVFqbGtRY2FCU0tYRGNoWHNVNURxc0NvcnhDT1Fh?=
 =?utf-8?B?NDFYR0R1VXNNbWZoUEpaTU94YisyNG81Z1VYam5zZUNSenpEL1FSTXcyUi8z?=
 =?utf-8?B?NHl2Q3RWUzYvdEw4Y2FzRWxhY1dWYWIvZ2hDaUMyNS9aNUNOOGNpQTllckxS?=
 =?utf-8?B?Y0JveFBEc0hVRHM2bC9BSmpxeFpUTUwraEk4SDBMODU2NG1CZGdsSEhsbm1n?=
 =?utf-8?B?Q1VGdWp2YjduZGkyN2VTcTJlbUtPVVBTRXFWTTQxMGszMkFDekVRUVJvTDRp?=
 =?utf-8?B?cm1nQWxxSXZPeFNYeEJZZTZoUTRoL1l6S3NVWlZDakc2blYraTVkbDEyOW93?=
 =?utf-8?B?ZHJUWWJEbzBNUEJMaTloWHdmbmk1NW52ajJLb0wweUFxU2Y5UmI4WVdwWE9E?=
 =?utf-8?B?WVEyWjUzcnpCY3hXL0lDTVV4M2Z6NEUxRWtrMThsZ3dFRENBOE5sY3RZQXFK?=
 =?utf-8?B?ZHJ2SThldFRwSG9sT1kvT3NzUzRDL1dhd3BPSWlacVZ4Y3ZOdm1NTWJNRm10?=
 =?utf-8?B?Z2VRMXphQjBMRnJOU0Ntbis2azh0N09nZnc2SzNlYVNpS2JTb25oRVFBS2N0?=
 =?utf-8?B?Mms2QkJaNDdOWUE1Sis1RjlVZHFIQWJGZDJBUjZUNzJMVEM3d29XMHpXVUU0?=
 =?utf-8?B?Z3UrUlZCMzB6b0U4cERwNzhjbmYyRFJPM25CbWV0OVRjWExUS1c1bDdWcStL?=
 =?utf-8?B?KzUxZ2ZnVWJvcVRoWVZKL0JUMnlaMk1HcFhMc2I5eGdpay9FVlhMMTNiTnM1?=
 =?utf-8?B?VE1oREM5WHA1dVdQRXNvMk1OckRsSmJLMHV5ZE0remQ2ckVqbzVLbWVqSk5F?=
 =?utf-8?B?UllvU2kxMXRvUnBDd3l4bERGcndwTVMyWFJOalJibjhtN0xwcDV6cHd2Q3hH?=
 =?utf-8?B?Vk5zWUErVnhUZkhNV29sRzRRRkw1UDl1RjJaMk8vQmtkeFF6Zy8rWlllbWtr?=
 =?utf-8?B?ZWs3Yno2MTJlcDU1azhIU3h0Q3doU2JGb2RYbHJ0L092ZElGQnpzRlArWnhB?=
 =?utf-8?B?elNrMnl2ZlB3N3hHSFdRNTRRN2dsS1ljcTJGZ1VVdnhhSVhvdENuMnpXdSsy?=
 =?utf-8?B?MVBNRnpLOWJZU3JucjdYaEVJN1NpRTQ5K3Nmc3dhVUpsaGlRNlExcEZMT0k2?=
 =?utf-8?B?WGJFcXRmRnpZak1XZENhbUNKRHRaL0twTU1BVWlldWRXSzNMVW83WU9TREtp?=
 =?utf-8?B?eUhBbUo1cTdlQTVwNlc4bnI3MHVlNFVRUmZYUDc0ZWsrMlovR0RSUUJPZ211?=
 =?utf-8?B?cCs1K0Y3VXdZdkQ4K0VlSEtoYmRPd28xYnljdU9NU3pVVzZTWjJ6M3YyS1Jx?=
 =?utf-8?B?L3lvaVJjUERpNWp4TTlGZG1KcDUxb2xuYys3SWhCR2t0eHJXY2d1aVlRRmw3?=
 =?utf-8?B?QU1pbVhPczE4M2hYRzFNRlE3RzF1MEkrbkd6RXlUK1J4NlE3UVY3YndEN0pm?=
 =?utf-8?B?aVZYb1l3NkpnQk5NVW5iaEIwUi9Rd1Z6bWhCaTk5bytuM05iNk9oNEgxemlH?=
 =?utf-8?B?N3BTZHJvdDBrbHA1Y2Q5bjVxWDFvSmdkNzJTbnYrQUYyaVR4ZHVSMElWV2Zk?=
 =?utf-8?B?MGgyYm5KT0tXMTVVRWROUG9VRzMrWEdjSndtamc2K2FDVkw4QmdCd3BYVE12?=
 =?utf-8?B?bE15THNUaU9oUGlWYm5haVNEWWdKNU5IOExQOGFYZEdFUmFmaU5ka1FyM2Fv?=
 =?utf-8?B?MHJpV0ZTeitJaW1NN2NwMithUXNFaVF3andJMXVXNmFvU2pRNFA0aE1JTXZO?=
 =?utf-8?B?NXpObWNYR0x2R0dEOStIbjEySzFnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <851AE5E38D241549BCBAA5F2B25DD09A@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6963b7-33bd-4f72-b2ba-08d9e047649a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2022 21:12:28.3545 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RNVzCffhCCw2RuoXMcolow4uyYkCUPfxoYZ77aHaHCflTRsIzQn6oDa0zp9beq5/9vWiC9KWR6D6oo1phrvZ+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4528
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10238
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201250127
X-Proofpoint-GUID: mWLC7G98046SsHB5rZLDuzI18GHSzaIG
X-Proofpoint-ORIG-GUID: mWLC7G98046SsHB5rZLDuzI18GHSzaIG
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "mst@redhat.com" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSmFuIDI1LCAyMDIyLCBhdCA1OjQ0IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBKYW4gMTksIDIwMjIgYXQgMDQ6
NDE6NTZQTSAtMDUwMCwgSmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+PiBTaWduZWQtb2ZmLWJ5
OiBFbGVuYSBVZmltdHNldmEgPGVsZW5hLnVmaW10c2V2YUBvcmFjbGUuY29tPg0KPj4gU2lnbmVk
LW9mZi1ieTogSm9obiBHIEpvaG5zb24gPGpvaG4uZy5qb2huc29uQG9yYWNsZS5jb20+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBKYWdhbm5hdGhhbiBSYW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+DQo+
PiAtLS0NCj4+IGh3L3JlbW90ZS9tYWNoaW5lLmMgfCA1NyArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4+IDEgZmlsZSBjaGFuZ2VkLCA1NyBpbnNlcnRpb25z
KCspDQo+PiANCj4+IGRpZmYgLS1naXQgYS9ody9yZW1vdGUvbWFjaGluZS5jIGIvaHcvcmVtb3Rl
L21hY2hpbmUuYw0KPj4gaW5kZXggMjIwZmYwMWFhOS4uMjIxYTg0MzBjMSAxMDA2NDQNCj4+IC0t
LSBhL2h3L3JlbW90ZS9tYWNoaW5lLmMNCj4+ICsrKyBiL2h3L3JlbW90ZS9tYWNoaW5lLmMNCj4+
IEBAIC0yMiw2ICsyMiw2MCBAQA0KPj4gI2luY2x1ZGUgImh3L3BjaS9wY2lfaG9zdC5oIg0KPj4g
I2luY2x1ZGUgImh3L3JlbW90ZS9pb2h1Yi5oIg0KPj4gDQo+PiArc3RhdGljIGJvb2wgcmVtb3Rl
X21hY2hpbmVfZ2V0X2J1cyhjb25zdCBjaGFyICp0eXBlLCBCdXNTdGF0ZSAqKmJ1cywNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEVycm9yICoqZXJycCkNCj4+ICt7DQo+
PiArICAgIEVSUlBfR1VBUkQoKTsNCj4+ICsgICAgUmVtb3RlTWFjaGluZVN0YXRlICpzID0gUkVN
T1RFX01BQ0hJTkUoY3VycmVudF9tYWNoaW5lKTsNCj4+ICsgICAgQnVzU3RhdGUgKnJvb3RfYnVz
ID0gTlVMTDsNCj4+ICsgICAgUENJQnVzICpuZXdfcGNpX2J1cyA9IE5VTEw7DQo+PiArDQo+PiAr
ICAgIGlmICghYnVzKSB7DQo+PiArICAgICAgICBlcnJvcl9zZXRnKGVycnAsICJJbnZhbGlkIGFy
Z3VtZW50Iik7DQo+PiArICAgICAgICByZXR1cm4gZmFsc2U7DQo+PiArICAgIH0NCj4+ICsNCj4+
ICsgICAgaWYgKHN0cmNtcCh0eXBlLCBUWVBFX1BDSV9CVVMpICYmIHN0cmNtcCh0eXBlLCBUWVBF
X1BDSV9CVVMpKSB7DQo+PiArICAgICAgICByZXR1cm4gdHJ1ZTsNCj4+ICsgICAgfQ0KPj4gKw0K
Pj4gKyAgICByb290X2J1cyA9IHFidXNfZmluZF9yZWN1cnNpdmUoc3lzYnVzX2dldF9kZWZhdWx0
KCksIE5VTEwsIFRZUEVfUENJRV9CVVMpOw0KPj4gKyAgICBpZiAoIXJvb3RfYnVzKSB7DQo+PiAr
ICAgICAgICBlcnJvcl9zZXRnKGVycnAsICJVbmFibGUgdG8gZmluZCByb290IFBDSSBkZXZpY2Ui
KTsNCj4+ICsgICAgICAgIHJldHVybiBmYWxzZTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBu
ZXdfcGNpX2J1cyA9IHBjaV9pc29sX2J1c19uZXcocm9vdF9idXMsIHR5cGUsIGVycnApOw0KPj4g
KyAgICBpZiAoIW5ld19wY2lfYnVzKSB7DQo+PiArICAgICAgICByZXR1cm4gZmFsc2U7DQo+PiAr
ICAgIH0NCj4+ICsNCj4+ICsgICAgKmJ1cyA9IEJVUyhuZXdfcGNpX2J1cyk7DQo+PiArDQo+PiAr
ICAgIHBjaV9idXNfaXJxcyhuZXdfcGNpX2J1cywgcmVtb3RlX2lvaHViX3NldF9pcnEsIHJlbW90
ZV9pb2h1Yl9tYXBfaXJxLA0KPj4gKyAgICAgICAgICAgICAgICAgJnMtPmlvaHViLCBSRU1PVEVf
SU9IVUJfTkJfUElSUVMpOw0KPj4gKw0KPj4gKyAgICByZXR1cm4gdHJ1ZTsNCj4+ICt9DQo+IA0K
PiBDYW4gdGhlIHVzZXIgY3JlYXRlIHRoZSBzYW1lIFBDSSBidXMgdmlhIFFNUCBjb21tYW5kcz8g
SWYgc28sIHRoZW4gdGhpcw0KDQpJIHRoaW5rIHRoZXJlIGlzIGEgd2F5IHdlIGNvdWxkIGFjaGll
dmUgaXQuDQoNCldoZW4gSSBsb29rZWQgYXJvdW5kLCBib3RoIHRoZSBjb21tYW5kIGxpbmUgYW5k
IHRoZSBRTVAgZGlkbuKAmXQgaGF2ZSBhIGRpcmVjdA0Kd2F5IHRvIGNyZWF0ZSBhIGJ1cy4gSG93
ZXZlciwgdGhlcmUgYXJlIHNvbWUgaW5kaXJlY3Qgd2F5cy4gRm9yIGV4YW1wbGUsIHRoZQ0KVFlQ
RV9MU0k1M0M4OTVBIGRldmljZSBjcmVhdGVzIGEgU0NTSSBidXMgdG8gYXR0YWNoIFNDU0kgZGV2
aWNlcy4gU2ltaWxhcmx5LA0KdGhlcmUgYXJlIHNvbWUgc3BlY2lhbCBQQ0kgZGV2aWNlcyBsaWtl
IFRZUEVfUENJX0JSSURHRSB3aGljaCBjcmVhdGUgYQ0Kc2Vjb25kYXJ5IFBDSSBidXMuDQoNClNp
bWlsYXJseSwgd2UgY291bGQgaW1wbGVtZW50IGEgUENJIGRldmljZSB0aGF0IGNyZWF0ZXMgYSBQ
Q0kgYnVzIHdpdGgNCmlzb2xhdGVkIGFkZHJlc3Mgc3BhY2VzLg0KDQo+IGlzIGp1c3QgYSBjb252
ZW5pZW5jZSB0aGF0IHNhdmVzIHRoZSBleHRyYSBzdGVwLiBPciBpcyB0aGVyZSBzb21lIG1hZ2lj
DQo+IHRoYXQgY2Fubm90IGJlIGRvbmUgdmlhIFFNUCBkZXZpY2VfYWRkPw0KPiANCj4gSSdtIGFz
a2luZyBiZWNhdXNlIHRoZXJlIGFyZSAzIG9iamVjdHMgaW52b2x2ZWQgYW5kIEknZCBsaWtlIHRv
DQo+IHVuZGVyc3RhbmQgdGhlIGxpZmVjeWNsZS9kZXBlbmRlbmNpZXM6DQo+IDEuIFRoZSBQQ0lE
ZXZpY2Ugd2Ugd2lzaCB0byBleHBvcnQuDQo+IDIuIFRoZSBQQ0lCdXMgd2l0aCBpc29sYXRlZCBh
ZGRyZXNzIHNwYWNlcyB0aGF0IGNvbnRhaW5zIHRoZSBQQ0lEZXZpY2UuDQo+IDMuIFRoZSB2Zmlv
LXVzZXIgc2VydmVyIHRoYXQgZXhwb3J0cyBhIGdpdmVuIFBDSURldmljZS4NCj4gDQo+IFVzZXJz
IGNhbiBhbHJlYWR5IGNyZWF0ZSB0aGUgUENJRGV2aWNlIHZpYSBob3RwbHVnIGFuZCB0aGUgdmZp
by11c2VyDQo+IHNlcnZlciB2aWEgb2JqZWN0LWFkZC4gU28gaWYgdGhlcmUncyBubyBtYWdpYyB0
aGV5IGNvdWxkIGFsc28gY3JlYXRlIHRoZQ0KPiBQQ0kgYnVzOg0KPiAxLiBkZXZpY2VfYWRkIC4u
LnNvbWUgUENJIGJ1cyBzdHVmZiBoZXJlLi4uLGlkPWlzb2wtcGNpLWJ1czANCj4gMi4gZGV2aWNl
X2FkZCAuLi50aGUgUENJRGV2aWNlLi4uLGJ1cz1pc29sLXBjaS1idXMwLGlkPW15ZGV2DQo+IDMu
IG9iamVjdC1hZGQgeC12ZmlvLXVzZXItc2VydmVyLGRldmljZT1teWRldg0KDQpXZSBhcmUgYWJs
ZSB0byBkbyAyICYgMyBhbHJlYWR5LiBXZSBjb3VsZCBpbnRyb2R1Y2UgYSBQQ0kgZGV2aWNlIHRo
YXQNCmNyZWF0ZXMgYW4gaXNvbGF0ZWQgUENJIGJ1cy4gVGhhdCB3b3VsZCBjb3ZlciBzdGVwIDEg
b3V0bGluZWQgYWJvdmUuDQoNCj4gDQo+IFVucGx1ZyB3b3VsZCB3b3JrIGluIHRoZSByZXZlcnNl
IG9yZGVyLg0KPiANCj4gSXQgbWF5IGJlIG1vcmUgY29udmVuaWVudCB0byBhdXRvbWF0aWNhbGx5
IGNyZWF0ZSBhIFBDSUJ1cyB3aGVuIHRoZQ0KPiBQQ0lEZXZpY2UgaXMgaG90cGx1Z2dlZCwgYnV0
IHRoaXMga2luZCBvZiBtYWdpYyBhbHNvIGhhcyBkcmF3YmFja3MNCj4gKGhpZGRlbiBkZXZpY2Vz
LCBuYW1pbmcgY29sbGlzaW9ucywgZXRjKS4NCg0KT0ssIG1ha2VzIHNlbnNlLg0KDQotLQ0KSmFn
DQoNCj4gDQo+PiArDQo+PiArc3RhdGljIGJvb2wgcmVtb3RlX21hY2hpbmVfcHV0X2J1cyhCdXNT
dGF0ZSAqYnVzLCBFcnJvciAqKmVycnApDQo+PiArew0KPj4gKyAgICBQQ0lCdXMgKnBjaV9idXMg
PSBOVUxMOw0KPj4gKw0KPj4gKyAgICBpZiAoIWJ1cykgew0KPj4gKyAgICAgICAgZXJyb3Jfc2V0
ZyhlcnJwLCAiSW52YWxpZCBhcmd1bWVudCIpOw0KPj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOw0K
Pj4gKyAgICB9DQo+PiArDQo+PiArICAgIGlmICghb2JqZWN0X2R5bmFtaWNfY2FzdChPQkpFQ1Qo
YnVzKSwgVFlQRV9QQ0lfQlVTKSkgew0KPj4gKyAgICAgICAgcmV0dXJuIHRydWU7DQo+PiArICAg
IH0NCj4+ICsNCj4+ICsgICAgcGNpX2J1cyA9IFBDSV9CVVMoYnVzKTsNCj4+ICsNCj4+ICsgICAg
cmV0dXJuIHBjaV9pc29sX2J1c19mcmVlKHBjaV9idXMsIGVycnApOw0KPj4gK30NCj4+ICsNCj4+
IHN0YXRpYyB2b2lkIHJlbW90ZV9tYWNoaW5lX2luaXQoTWFjaGluZVN0YXRlICptYWNoaW5lKQ0K
Pj4gew0KPj4gICAgIE1lbW9yeVJlZ2lvbiAqc3lzdGVtX21lbW9yeSwgKnN5c3RlbV9pbywgKnBj
aV9tZW1vcnk7DQo+PiBAQCAtNTYsNiArMTEwLDkgQEAgc3RhdGljIHZvaWQgcmVtb3RlX21hY2hp
bmVfaW5pdChNYWNoaW5lU3RhdGUgKm1hY2hpbmUpDQo+PiAgICAgICAgICAgICAgICAgICZzLT5p
b2h1YiwgUkVNT1RFX0lPSFVCX05CX1BJUlFTKTsNCj4+IA0KPj4gICAgIHFidXNfc2V0X2hvdHBs
dWdfaGFuZGxlcihCVVMocGNpX2hvc3QtPmJ1cyksIE9CSkVDVChzKSk7DQo+PiArDQo+PiArICAg
IHFkZXZfc2V0X2J1c19jYnMocmVtb3RlX21hY2hpbmVfZ2V0X2J1cywgcmVtb3RlX21hY2hpbmVf
cHV0X2J1cywNCj4+ICsgICAgICAgICAgICAgICAgICAgICAmZXJyb3JfZmF0YWwpOw0KPj4gfQ0K
Pj4gDQo+PiBzdGF0aWMgdm9pZCByZW1vdGVfbWFjaGluZV9wcmVfcGx1Z19jYihIb3RwbHVnSGFu
ZGxlciAqaG90cGx1Z19kZXYsDQo+PiAtLSANCj4+IDIuMjAuMQ0KPj4gDQoNCg==

