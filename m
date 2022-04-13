Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59B94FFDBB
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 20:27:03 +0200 (CEST)
Received: from localhost ([::1]:52478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nehhm-0007Og-Af
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 14:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nehgJ-0006jF-W6
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 14:25:32 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:26150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nehgF-0004kk-Rd
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 14:25:31 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23DGAjxQ018415; 
 Wed, 13 Apr 2022 18:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=T+IhwYjkRhFyNPC8fnXjUjME+l4gBSWAfSPtmBxoyXo=;
 b=A82lxsaFGrx3UwSBHseEaLhqHpN+Ha8hXfsGnsuZF276HwJES1xb9L9LhLW2EA6Bi/gX
 am79m41XzBA/kX1hkw3YKtkZWIGnZFpV8Hbo+O/YXgj7Df+p2K3RE3hxtAnUtaVBfGDB
 12AVblWu582NSeqmFi+/2gOShb6iPc33YiBkFnQ/BOLuqCXB17v57jwzAr/t1zT1C1xv
 1TMEh9XPiUCkpWSrCOTewj46KJhS8CQV0RpWw5gjvINmr1mWPBt/8WxKrcTd56+fLbiO
 EdS8lf4h0JhFb9JZ3JCdzgV6XEgnDCNIz7DItfHjpjCHdM5+acsuE3s3SLIwHjdUQpG1 2w== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com with ESMTP id 3fb0r1jv4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Apr 2022 18:25:08 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23DI2Xfo030112; Wed, 13 Apr 2022 18:25:04 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fcg9k066n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Apr 2022 18:25:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDTv1ASXI757Hm2cllV5LvqmpWpPnJEOf+x5h4PN7grGSZ7jYXF/VGU5VO1CIdv1JdeQbWvqjEebbsxrzqzUGYUF+K43xeXaKO/NZiIESyvaPyl1swJthwNZRzQo1j3y/LM0WzHOvAq9aQZbztyH4BO8TeaWXDabYGnM9FfJGG0buhexfMOjkLrQ7KbuRi9rMSvWO8u8T5B5NwIT4pENjvlbObEVIk3fP2tOTpB53XezjIllKtioV9Bgsu3VnO9TGLlxNWYx41jtnFoJGVCtVnDy+zh3sgMMiPj6vGe9UBo/ONaNmCP7wjzWjMqZgdkhRAvDEC3WL/ZQGFeR6GpyFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+IhwYjkRhFyNPC8fnXjUjME+l4gBSWAfSPtmBxoyXo=;
 b=UCw4HktPgijY3U2W+kfwvgY/OgHlfvZyp1GwPx5HIbQ555X7fUdjmnBVLdDPQIvYbdMF0yfjmfoKDIHE1EV1Bee7yzQdoh22sPrJHFUsJYd6MND7oA0FEdUehviyMGUESTrJPc9BA+UQVJoQTe03yzYLEX5FAryaV0zkP3lTg1PScSjpGNKKp6OP7iSk2eH4o0NcHWev7w/2VrxyibuNr6l6B+/+9qgw0Muk4i9cBse0k94IlRgD/7LrbARnBbShD07PVu8iq1OxrYR3c748VmMlr+ZyYje8oZd9itiZIatRVfwDlfg6VzGcwAjsksRY0J5sbbhG4NUCSog1B9n/AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+IhwYjkRhFyNPC8fnXjUjME+l4gBSWAfSPtmBxoyXo=;
 b=GfOuZ/VXcImltue+U0upnVUxa5PXt4b53nQQ0fE1L+DTZpXSYkceztrvQixeGdqdgyagbdDTzdmhLVJe5pjt5P9228ZZi4F2NuCImBOmy3OdKEjHQuDS7y3cc64rpgfeys9YPmKUiKf7sBDcKa5nXAk2bPf0uHpEXCcOb+Wt+is=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by CY4PR1001MB2392.namprd10.prod.outlook.com (2603:10b6:910:43::39)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Wed, 13 Apr
 2022 18:25:01 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::acd4:7d0c:f4ac:1d0b]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::acd4:7d0c:f4ac:1d0b%3]) with mapi id 15.20.5144.029; Wed, 13 Apr 2022
 18:25:00 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v7 12/17] vfio-user: IOMMU support for remote device
Thread-Topic: [PATCH v7 12/17] vfio-user: IOMMU support for remote device
Thread-Index: AQHYQH1dtH36jxsvk0ChB2A9jkjfZazuA8QAgABC0oA=
Date: Wed, 13 Apr 2022 18:25:00 +0000
Message-ID: <1DB8CC98-EAC6-4991-BFD4-ACFD504369CC@oracle.com>
References: <cover.1648234157.git.jag.raman@oracle.com>
 <2fdb90acd40a1f79d571d4e68c56e6b08aded60d.1648234157.git.jag.raman@oracle.com>
 <20220413162550.4a02be89@redhat.com>
In-Reply-To: <20220413162550.4a02be89@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 796c7cc7-dd93-43c9-bdd8-08da1d7aec0e
x-ms-traffictypediagnostic: CY4PR1001MB2392:EE_
x-microsoft-antispam-prvs: <CY4PR1001MB2392789AF744F56B2CA900FB90EC9@CY4PR1001MB2392.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 40bfL2MWOyfCSKj7W8DlBC4r7TkGUzO2rNBp+BOAOMxs8cvy2H8VkxMV40xUz6tQ0/Ht0PzVswKgrJT3kiH4bEwU8kikuP9W0Dxw3+OQRof85pWRnqsP3DqeBs62SNCTWy/bs2RKxJKjuAqHOZlZ6xarmoZGzXseP5JqCBH/WDT7d0vxipd41hE6JOXiUPdpq1/u7m01rRFF0I+Uu/IxDZLY/UWS6yGthfqi56tNz/m4Ih9d0g40jzUc74vqbzGRfKNG93XK8bex66GjqiZv0CXEgC/LKOwET8SHkk/UHzW18W6yMYAZ7neRdlXZpfiURVSp/moPQhi6/VI1xGGMOOezUSMtnzmLhcHkayjIi+gKHuoEW/xl5Ovc0Xt2OdKzDmu67tn2ww3jZ4F5inFJlXcMi/MWvnTr/uw0e2xpgO81P/jRcb1x0M4m5oLijYGmgFnC+n3cG5NJwab26k6JnMMZzHgHsjeUeuoGH2sVHRQIVwY6SQlztKmBfaWTwNbtVoz7PDJNSDgfukk6fUzIuhlZs/Lv29/+P7MuB8+PMUASVw9xck1splvsiyhAaqLFgz83yPaljD+5VTeM4MzWcTKPcuftX75EJ7onfRt/z16pHfbK372fy2IA+ttRybAf2FjIVTtE1ytuU+9IIJ4k/kJWCBT3pCidf7yKAggwd3Fa8RnD+orLfZHuMouTDzT3NdPbeP7NjZjzoFl4bBSoDqKfrDeOJvL2SNfKyz05YUk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(71200400001)(6506007)(6486002)(83380400001)(54906003)(2906002)(6916009)(53546011)(44832011)(122000001)(38070700005)(38100700002)(316002)(8936002)(6512007)(8676002)(5660300002)(508600001)(33656002)(4326008)(36756003)(76116006)(66476007)(66946007)(66446008)(66556008)(64756008)(86362001)(2616005)(91956017)(186003)(7416002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGhCYnVZUFE0MzFZU1BWTnhJaFNDQ0l4bnlFY3AwcHg0T1pLUzQxcGdmaEk0?=
 =?utf-8?B?RkZvZFpudTE1RnBQeFN3blFsSk84dHYrSXREYWhXOTlhL0NWcEtxdWVXMm1P?=
 =?utf-8?B?MUloekhtbDJZekx5SzhDcXRWejdFU2laS21sdkVKTWZma2FEd1NwQkJKRm84?=
 =?utf-8?B?QXJiVmFQMUpjczBlKzYxWXRxeHVzWk4vYzFBUWVoU3VkUzQrSUwxZklPMjEr?=
 =?utf-8?B?VXZta0VEMVp0eEtyWWJxdklRNE81MFNEa3I1YWFqdWpiM0h6b3FSNnoyT3dG?=
 =?utf-8?B?bG5tb2l1d1N1TTdmMW0zUmpkSlR5bHVmNEUrQnM1dWZ2WjB2dTUwV0VTZ2k3?=
 =?utf-8?B?YkJqLzBGdVZvWEd0aDdNMG0ySGxUQ3ZaakdtRmJWTjVkSzI4dFc1UWJRR2J0?=
 =?utf-8?B?UWtvaVhjYUlMbkJtaDVDQUc2STV3N2RUbUlnL1lQYWNocUVsVXd5T1gwNnF1?=
 =?utf-8?B?cFQ3NC82WmRXOGF3YWg0ekhJT0xWOE0zVUh6d2ZFQ1paSFRoUm9KMkZHWGZB?=
 =?utf-8?B?UlAxSDNSODRPaTdwWmxzYlQ2NlBiQVJuL2crUjQ5L2NHbFpTTUhwdUV4TnhX?=
 =?utf-8?B?aGlSODdNRDB3TUJ5U2ltR2RxUEQvMlhna3V0cFVWdFpQbVBNajU4alFCNGh2?=
 =?utf-8?B?L29DclRLZFJnUE1rZFlZSHhEbE5mTUZwWDVvRE5vNGp0UHZQQWZ4eGRKOWpx?=
 =?utf-8?B?cVFpcXNxeE1OLzdNbEpyZGFOY1M3eVhNM09wQ09GSUozcFFLZjltYnRBRXRO?=
 =?utf-8?B?aGJHb1A4R0lxckIwTCtNZlJ1eUEvM1FQR3VwUENrY1FuWmJYRnd6MEpTcm1v?=
 =?utf-8?B?bHpIL0lONnZZTy83Zk02R0JBM3lHMUZVWWlzQzZKSUJLOGNNVlgxTVFicFI1?=
 =?utf-8?B?NmFURm9jbDlQRWtvSWhMbTlWaENjWXI1L2dzekgrSmdhdENCZlExemw0dDgx?=
 =?utf-8?B?anl3dHhYTWhXZko1bzJVNnpUV2RMUlR1QlBkLzlWN0dETGl5MmdFQXpuNjg3?=
 =?utf-8?B?dWpicEUvMVZTZWN1R0VZVjQ5cXgrUVlwSEdYMWRqYWY3QlJNTGliWkQyaVFP?=
 =?utf-8?B?OEFhT0ZSMThFeGdsYjJ3WnVZSUk3YXFoTTNrekN1SVorZmMxbHNTc1dUZW9B?=
 =?utf-8?B?amxKYi9nb3R1Q2VJNVVsUTZzS0lkSUFhblJ0UnErb0Z3S2ZYUGpZcEdWV3FV?=
 =?utf-8?B?azNpL01IbWpHaDUxWlN3eVh1V3NvbG16dG9EMjI5WkZVYTNxcWZoRDlGYlBr?=
 =?utf-8?B?d1B5czBFUlhQSjFvNkNXMDYrRkppSHNxc0FoekJEemUwdkJvT3REekNDVVBx?=
 =?utf-8?B?akFtdEc4bEhKTmROaXZVeFJpUjg3MGZORktiWU9Ld2diSWFXcDNBZ09RSHdN?=
 =?utf-8?B?Y0dsODdrZ3FuU0x6ek1KN0hoYkZUSzZrN0lOMFZRNXFaQXhCVy91ZWxkNzBn?=
 =?utf-8?B?QzNPOXZaYWRRTW9qMGhnUkFUOEdVb2dVS21pQjhPeXh5am1EZzhnMHFkNVVr?=
 =?utf-8?B?MEo1ZDFzdURIbVpoVkdidjNaaXFvR0JFR2piOEdVMWRwS3RsV2d3SXRRbmxs?=
 =?utf-8?B?cGo0NFZMMTZRc29XSTloZVhGL3RvK0lsa3lYbjQzaHRRVXVMSk9TWU9wcUlZ?=
 =?utf-8?B?bXhHTU1nLy95VURQS2FZQ0wzN3lDVDE2MkNuZXNCSFRuOG51UnhVVC9tZFhk?=
 =?utf-8?B?S1U0M1hwZkQwU0dmQkdlVmtQTjBjZGtMODh3cDhRK3RBQTlnVFpUWG56d1dD?=
 =?utf-8?B?UjZnRXZwTm1TWkF4R2QxNVFteEU0alVCZDFYNW9sS091ZFFvWStDSktPUjY5?=
 =?utf-8?B?L01ublkyY1l2RTYxbFhEU2k1SG9odXRVdFRjM0xBSzhWcTFtT0hlRWVRWUE3?=
 =?utf-8?B?UG9oSkx6Q2ZPc3hkTnMxTDNBZm1pZ0lWTHhLeGZvTlVLcEdIbG5LMCtnSjM0?=
 =?utf-8?B?RUlSMlM1M0s2enpZZjYxYlppb2J3Yyt3ZU5tRVp0Rjhwd2dHSTlYVzlFUTAy?=
 =?utf-8?B?MXZqbjBUNDF6V3lVWEhRc000OHJKRXpjakdKVTFIeXBGY09PcG0xZjN1QUtp?=
 =?utf-8?B?RnI5M3h6YzVuS2RCWjFyQW5CYnczOGVQRllGdDZKRktmdU5LSU9Sb3Bza21Z?=
 =?utf-8?B?NG5nNTcvU2FRRy9JZk9qNlVmU2JNOURnanNUWnFoZ1Q1Qmg2ZXpVY2NSUDBl?=
 =?utf-8?B?bTZqYXNHaDJKZVR0ZkVpSTRzWG1kWUVGNmtzK2YyaGxZNHZiYytQd1BqTy9T?=
 =?utf-8?B?UHVoSDhYbkNMeFFoZ0pRdjZyRURJOGhzVWJoQ2x3bjlMZ3ZVOTB1YkhRSGFV?=
 =?utf-8?B?Q01kaHllM3FER2dVNzhsSzZXRm5ZVkltd2ZRT3pWNHJKc1dLQUN5OEQvZFQ1?=
 =?utf-8?Q?SmlxxPOHCDIizL9bUcLe4ocmQbI5fO1HnAs+S?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C25BA4AF1840DB46A0C582D25AAA3AB1@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 796c7cc7-dd93-43c9-bdd8-08da1d7aec0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 18:25:00.8857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A5reHXZQHTkRbhiASa4HWLzZsyjpQ4TwU78fUbHozCZgEDJATGqW34AqhT/ioHK6ueVUcKcMEU1v9+DpCh5VCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2392
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-13_03:2022-04-13,
 2022-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204130089
X-Proofpoint-GUID: 3Te8M25xFlktjX4CysDgZsoWNt4IC9CM
X-Proofpoint-ORIG-GUID: 3Te8M25xFlktjX4CysDgZsoWNt4IC9CM
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 qemu-devel <qemu-devel@nongnu.org>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gQXByIDEzLCAyMDIyLCBhdCAxMDoyNSBBTSwgSWdvciBNYW1tZWRvdiA8aW1hbW1l
ZG9AcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIDI1IE1hciAyMDIyIDE1OjE5OjQx
IC0wNDAwDQo+IEphZ2FubmF0aGFuIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNvbT4gd3JvdGU6
DQo+IA0KPj4gQXNzaWduIHNlcGFyYXRlIGFkZHJlc3Mgc3BhY2UgZm9yIGVhY2ggZGV2aWNlIGlu
IHRoZSByZW1vdGUgcHJvY2Vzc2VzLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBFbGVuYSBVZmlt
dHNldmEgPGVsZW5hLnVmaW10c2V2YUBvcmFjbGUuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSm9o
biBHIEpvaG5zb24gPGpvaG4uZy5qb2huc29uQG9yYWNsZS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBKYWdhbm5hdGhhbiBSYW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+DQo+PiAtLS0NCj4+IGlu
Y2x1ZGUvaHcvcmVtb3RlL2lvbW11LmggfCAxOCArKysrKysrKw0KPj4gaHcvcmVtb3RlL2lvbW11
LmMgICAgICAgICB8IDk1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
Pj4gTUFJTlRBSU5FUlMgICAgICAgICAgICAgICB8ICAyICsNCj4+IGh3L3JlbW90ZS9tZXNvbi5i
dWlsZCAgICAgfCAgMSArDQo+PiA0IGZpbGVzIGNoYW5nZWQsIDExNiBpbnNlcnRpb25zKCspDQo+
PiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody9yZW1vdGUvaW9tbXUuaA0KPj4gY3JlYXRl
IG1vZGUgMTAwNjQ0IGh3L3JlbW90ZS9pb21tdS5jDQo+PiANCj4+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2h3L3JlbW90ZS9pb21tdS5oIGIvaW5jbHVkZS9ody9yZW1vdGUvaW9tbXUuaA0KPj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAuLjhmODUwNDAwZjENCj4+IC0t
LSAvZGV2L251bGwNCj4+ICsrKyBiL2luY2x1ZGUvaHcvcmVtb3RlL2lvbW11LmgNCj4+IEBAIC0w
LDAgKzEsMTggQEANCj4+ICsvKioNCj4+ICsgKiBDb3B5cmlnaHQgwqkgMjAyMiBPcmFjbGUgYW5k
L29yIGl0cyBhZmZpbGlhdGVzLg0KPj4gKyAqDQo+PiArICogVGhpcyB3b3JrIGlzIGxpY2Vuc2Vk
IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdQTCwgdmVyc2lvbiAyIG9yIGxhdGVyLg0KPj4g
KyAqIFNlZSB0aGUgQ09QWUlORyBmaWxlIGluIHRoZSB0b3AtbGV2ZWwgZGlyZWN0b3J5Lg0KPj4g
KyAqDQo+PiArICovDQo+PiArDQo+PiArI2lmbmRlZiBSRU1PVEVfSU9NTVVfSA0KPj4gKyNkZWZp
bmUgUkVNT1RFX0lPTU1VX0gNCj4+ICsNCj4+ICsjaW5jbHVkZSAiaHcvcGNpL3BjaV9idXMuaCIN
Cj4+ICsNCj4+ICt2b2lkIHJlbW90ZV9jb25maWd1cmVfaW9tbXUoUENJQnVzICpwY2lfYnVzKTsN
Cj4+ICsNCj4+ICt2b2lkIHJlbW90ZV9pb21tdV9kZWxfZGV2aWNlKFBDSURldmljZSAqcGNpX2Rl
dik7DQo+PiArDQo+PiArI2VuZGlmDQo+PiBkaWZmIC0tZ2l0IGEvaHcvcmVtb3RlL2lvbW11LmMg
Yi9ody9yZW1vdGUvaW9tbXUuYw0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAw
MDAwMDAwMDAuLjEzZjMyOWI0NWQNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL2h3L3JlbW90
ZS9pb21tdS5jDQo+PiBAQCAtMCwwICsxLDk1IEBADQo+PiArLyoqDQo+PiArICogSU9NTVUgZm9y
IHJlbW90ZSBkZXZpY2UNCj4+ICsgKg0KPj4gKyAqIENvcHlyaWdodCDCqSAyMDIyIE9yYWNsZSBh
bmQvb3IgaXRzIGFmZmlsaWF0ZXMuDQo+PiArICoNCj4+ICsgKiBUaGlzIHdvcmsgaXMgbGljZW5z
ZWQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR1BMLCB2ZXJzaW9uIDIgb3IgbGF0ZXIuDQo+
PiArICogU2VlIHRoZSBDT1BZSU5HIGZpbGUgaW4gdGhlIHRvcC1sZXZlbCBkaXJlY3RvcnkuDQo+
PiArICoNCj4+ICsgKi8NCj4+ICsNCj4+ICsjaW5jbHVkZSAicWVtdS9vc2RlcC5oIg0KPj4gKyNp
bmNsdWRlICJxZW11LWNvbW1vbi5oIg0KPj4gKw0KPj4gKyNpbmNsdWRlICJody9yZW1vdGUvaW9t
bXUuaCINCj4+ICsjaW5jbHVkZSAiaHcvcGNpL3BjaV9idXMuaCINCj4+ICsjaW5jbHVkZSAiaHcv
cGNpL3BjaS5oIg0KPj4gKyNpbmNsdWRlICJleGVjL21lbW9yeS5oIg0KPj4gKyNpbmNsdWRlICJl
eGVjL2FkZHJlc3Mtc3BhY2VzLmgiDQo+PiArI2luY2x1ZGUgInRyYWNlLmgiDQo+PiArDQo+PiAr
c3RydWN0IFJlbW90ZUlvbW11RWxlbSB7DQo+PiArICAgIEFkZHJlc3NTcGFjZSAgYXM7DQo+PiAr
ICAgIE1lbW9yeVJlZ2lvbiAgbXI7DQo+PiArfTsNCj4+ICsNCj4+ICtzdHJ1Y3QgUmVtb3RlSW9t
bXVUYWJsZSB7DQo+PiArICAgIFFlbXVNdXRleCBsb2NrOw0KPj4gKyAgICBHSGFzaFRhYmxlICpl
bGVtX2J5X2JkZjsNCj4+ICt9IHJlbW90ZV9pb21tdV90YWJsZTsNCj4+ICsNCj4+ICsjZGVmaW5l
IElOVDJWT0lEUChpKSAodm9pZCAqKSh1aW50cHRyX3QpKGkpDQo+PiArDQo+PiArc3RhdGljIEFk
ZHJlc3NTcGFjZSAqcmVtb3RlX2lvbW11X2ZpbmRfYWRkX2FzKFBDSUJ1cyAqcGNpX2J1cywNCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqb3Bh
cXVlLCBpbnQgZGV2Zm4pDQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgUmVtb3RlSW9tbXVUYWJsZSAq
aW9tbXVfdGFibGUgPSBvcGFxdWU7DQo+PiArICAgIHN0cnVjdCBSZW1vdGVJb21tdUVsZW0gKmVs
ZW0gPSBOVUxMOw0KPj4gKyAgICBpbnQgcGNpX2JkZiA9IFBDSV9CVUlMRF9CREYocGNpX2J1c19u
dW0ocGNpX2J1cyksIGRldmZuKTsNCj4+ICsNCj4+ICsgICAgZWxlbSA9IGdfaGFzaF90YWJsZV9s
b29rdXAoaW9tbXVfdGFibGUtPmVsZW1fYnlfYmRmLCBJTlQyVk9JRFAocGNpX2JkZikpOw0KPj4g
Kw0KPj4gKyAgICBpZiAoIWVsZW0pIHsNCj4+ICsgICAgICAgIGdfYXV0b2ZyZWUgY2hhciAqbXJf
bmFtZSA9IGdfc3RyZHVwX3ByaW50ZigidmZ1LXJhbS0lZCIsIHBjaV9iZGYpOw0KPj4gKyAgICAg
ICAgZ19hdXRvZnJlZSBjaGFyICphc19uYW1lID0gZ19zdHJkdXBfcHJpbnRmKCJ2ZnUtYXMtJWQi
LCBwY2lfYmRmKTsNCj4+ICsNCj4+ICsgICAgICAgIGVsZW0gPSBnX21hbGxvYzAoc2l6ZW9mKHN0
cnVjdCBSZW1vdGVJb21tdUVsZW0pKTsNCj4+ICsNCj4+ICsgICAgICAgIG1lbW9yeV9yZWdpb25f
aW5pdCgmZWxlbS0+bXIsIE5VTEwsIG1yX25hbWUsIFVJTlQ2NF9NQVgpOw0KPiBnb2VzIGhlcmU6
DQo+ICAgbWVtb3J5X3JlZ2lvbl9kb19pbml0KCkNCj4gICAgICAgIGlmICghb3duZXIpIHsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAN
Cj4gICAgICAgICAgICBvd25lciA9IGNvbnRhaW5lcl9nZXQocWRldl9nZXRfbWFjaGluZSgpLCAi
L3VuYXR0YWNoZWQiKTsgICAgICAgICAgICANCj4gICAgICAgIH0gIA0KPiANCj4gdGhlbg0KPiAN
Cj4+ICsgICAgICAgIGFkZHJlc3Nfc3BhY2VfaW5pdCgmZWxlbS0+YXMsICZlbGVtLT5tciwgYXNf
bmFtZSk7DQo+PiArDQo+PiArICAgICAgICBxZW11X211dGV4X2xvY2soJmlvbW11X3RhYmxlLT5s
b2NrKTsNCj4+ICsgICAgICAgIGdfaGFzaF90YWJsZV9pbnNlcnQoaW9tbXVfdGFibGUtPmVsZW1f
YnlfYmRmLCBJTlQyVk9JRFAocGNpX2JkZiksIGVsZW0pOw0KPj4gKyAgICAgICAgcWVtdV9tdXRl
eF91bmxvY2soJmlvbW11X3RhYmxlLT5sb2NrKTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBy
ZXR1cm4gJmVsZW0tPmFzOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCByZW1vdGVfaW9t
bXVfZGVsX2VsZW0oZ3BvaW50ZXIgZGF0YSkNCj4+ICt7DQo+PiArICAgIHN0cnVjdCBSZW1vdGVJ
b21tdUVsZW0gKmVsZW0gPSBkYXRhOw0KPj4gKw0KPj4gKyAgICBnX2Fzc2VydChlbGVtKTsNCj4+
ICsNCj4+ICsgICAgbWVtb3J5X3JlZ2lvbl91bnJlZigmZWxlbS0+bXIpOw0KPiANCj4gaGVyZSB3
ZSBjYWxsDQo+ICAgICAgb2JqZWN0X3VucmVmKG1yLT5vd25lcik7IA0KPiBsZWF2aW5nIGRhbmds
aW5nIHBvaW50ZXIgaW4gb3duZXIgJyhxZGV2X2dldF9tYWNoaW5lKCksICIvdW5hdHRhY2hlZCIp
Jw0KPiBpdCBkb2Vzbid0IGxvb2sgY29ycmVjdA0KPiANCj4gSSB0aG91Z2h0IHRoYXQgbWVtb3J5
X3JlZ2lvbl91bnJlZigpIHNob3VsZCBiZSBhbHdheXMgcGFpcmVkIHdpdGggbWVtb3J5X3JlZ2lv
bl9yZWYoKQ0KPiANCj4gYW5kIGxvb2tpbmcgYXQgbWVtb3J5X3JlZ2lvbl9pbml0KC4uLm93bmVy
Li4uKSBoaXN0b3J5IGl0IGxvb2tzIGxpa2UNCj4gb3duZXItbGVzcyAoTlVMTCkgcmVnaW9ucyBh
cmUgbm90IG1lYW50IHRvIGJlIGRlbGV0ZWQgZXZlci4NCg0KSGkgSWdvciwNCg0KVGhhbmtzIGZv
ciB0aGUgcG9pbnRlcnMgYWJvdXQgcmVmIGNvdW50ZXJzIGZvciBNZW1vcnlSZWdpb25zLg0KDQpJ
dCBtYWtlcyBzZW5zZSAtIE1lbW9yeVJlZ2lvbnMgYXJlIG5vdCBRRU1VIE9iamVjdHMuIFNvIHRo
ZWlyDQpvd25lcuKAmXMgcmVmIGNvdW50ZXJzIGFyZSB1c2VkIGluc3RlYWQuIFNvIHRoZSBleHBl
Y3RhdGlvbiBpcyB0aGF0DQp3aGVuIHRoZSBvd25lciBpcyBkZXN0cm95ZWQsIHRoZSBNZW1vcnlS
ZWdpb25zIGluaXRpYWxpemVkIGJ5IHRoZW0NCmFsc28gZ2V0IGRlc3Ryb3llZCBzaW11bHRhbmVv
dXNseS4NCg0KSW4gdGhpcyBjYXNlLCBSZW1vdGVJb21tdUVsZW0tPm1yIGRvZXMgbm90IGhhdmUg
YW4gb3duZXIuIFRoZXJlZm9yZSwNCndlIGRvbuKAmXQgaGF2ZSB0byBtYW5hZ2UgaXRzIHJlZiBj
b3VudGVyLiBXaGVuIFJlbW90ZUlvbW11RWxlbSBpcw0KZGVzdHJveWVkLCB0aGUgTWVtb3J5UmVn
aW9uIHNob3VsZCBiZSBjbGVhbmVkIHVwIGF1dG9tYXRpY2FsbHkuDQoNCi0tDQpKYWcNCg0KPiAN
Cj4+ICsgICAgYWRkcmVzc19zcGFjZV9kZXN0cm95KCZlbGVtLT5hcyk7DQo+PiArDQo+PiArICAg
IGdfZnJlZShlbGVtKTsNCj4+ICt9DQo+PiArDQo+PiArdm9pZCByZW1vdGVfaW9tbXVfZGVsX2Rl
dmljZShQQ0lEZXZpY2UgKnBjaV9kZXYpDQo+PiArew0KPj4gKyAgICBpbnQgcGNpX2JkZjsNCj4+
ICsNCj4+ICsgICAgaWYgKCFyZW1vdGVfaW9tbXVfdGFibGUuZWxlbV9ieV9iZGYgfHwgIXBjaV9k
ZXYpIHsNCj4+ICsgICAgICAgIHJldHVybjsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBwY2lf
YmRmID0gUENJX0JVSUxEX0JERihwY2lfYnVzX251bShwY2lfZ2V0X2J1cyhwY2lfZGV2KSksIHBj
aV9kZXYtPmRldmZuKTsNCj4+ICsNCj4+ICsgICAgcWVtdV9tdXRleF9sb2NrKCZyZW1vdGVfaW9t
bXVfdGFibGUubG9jayk7DQo+PiArICAgIGdfaGFzaF90YWJsZV9yZW1vdmUocmVtb3RlX2lvbW11
X3RhYmxlLmVsZW1fYnlfYmRmLCBJTlQyVk9JRFAocGNpX2JkZikpOw0KPj4gKyAgICBxZW11X211
dGV4X3VubG9jaygmcmVtb3RlX2lvbW11X3RhYmxlLmxvY2spOw0KPj4gK30NCj4+ICsNCj4+ICt2
b2lkIHJlbW90ZV9jb25maWd1cmVfaW9tbXUoUENJQnVzICpwY2lfYnVzKQ0KPj4gK3sNCj4+ICsg
ICAgaWYgKCFyZW1vdGVfaW9tbXVfdGFibGUuZWxlbV9ieV9iZGYpIHsNCj4+ICsgICAgICAgIHJl
bW90ZV9pb21tdV90YWJsZS5lbGVtX2J5X2JkZiA9DQo+PiArICAgICAgICAgICAgZ19oYXNoX3Rh
YmxlX25ld19mdWxsKE5VTEwsIE5VTEwsIE5VTEwsIHJlbW90ZV9pb21tdV9kZWxfZWxlbSk7DQo+
PiArICAgICAgICBxZW11X211dGV4X2luaXQoJnJlbW90ZV9pb21tdV90YWJsZS5sb2NrKTsNCj4+
ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBwY2lfc2V0dXBfaW9tbXUocGNpX2J1cywgcmVtb3RlX2lv
bW11X2ZpbmRfYWRkX2FzLCAmcmVtb3RlX2lvbW11X3RhYmxlKTsNCj4+ICt9DQo+PiBkaWZmIC0t
Z2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KPj4gaW5kZXggZTdiMDI5N2E2My4uMjE2
OTRhOTY5OCAxMDA2NDQNCj4+IC0tLSBhL01BSU5UQUlORVJTDQo+PiArKysgYi9NQUlOVEFJTkVS
Uw0KPj4gQEAgLTM1OTksNiArMzU5OSw4IEBAIEY6IGh3L3JlbW90ZS9pb2h1Yi5jDQo+PiBGOiBp
bmNsdWRlL2h3L3JlbW90ZS9pb2h1Yi5oDQo+PiBGOiBzdWJwcm9qZWN0cy9saWJ2ZmlvLXVzZXIN
Cj4+IEY6IGh3L3JlbW90ZS92ZmlvLXVzZXItb2JqLmMNCj4+ICtGOiBody9yZW1vdGUvaW9tbXUu
Yw0KPj4gK0Y6IGluY2x1ZGUvaHcvcmVtb3RlL2lvbW11LmgNCj4+IA0KPj4gRUJQRjoNCj4+IE06
IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+PiBkaWZmIC0tZ2l0IGEvaHcvcmVt
b3RlL21lc29uLmJ1aWxkIGIvaHcvcmVtb3RlL21lc29uLmJ1aWxkDQo+PiBpbmRleCA1MzRhYzVk
Zjc5Li5iY2VmODNjOGNjIDEwMDY0NA0KPj4gLS0tIGEvaHcvcmVtb3RlL21lc29uLmJ1aWxkDQo+
PiArKysgYi9ody9yZW1vdGUvbWVzb24uYnVpbGQNCj4+IEBAIC02LDYgKzYsNyBAQCByZW1vdGVf
c3MuYWRkKHdoZW46ICdDT05GSUdfTVVMVElQUk9DRVNTJywgaWZfdHJ1ZTogZmlsZXMoJ21lc3Nh
Z2UuYycpKQ0KPj4gcmVtb3RlX3NzLmFkZCh3aGVuOiAnQ09ORklHX01VTFRJUFJPQ0VTUycsIGlm
X3RydWU6IGZpbGVzKCdyZW1vdGUtb2JqLmMnKSkNCj4+IHJlbW90ZV9zcy5hZGQod2hlbjogJ0NP
TkZJR19NVUxUSVBST0NFU1MnLCBpZl90cnVlOiBmaWxlcygncHJveHkuYycpKQ0KPj4gcmVtb3Rl
X3NzLmFkZCh3aGVuOiAnQ09ORklHX01VTFRJUFJPQ0VTUycsIGlmX3RydWU6IGZpbGVzKCdpb2h1
Yi5jJykpDQo+PiArcmVtb3RlX3NzLmFkZCh3aGVuOiAnQ09ORklHX01VTFRJUFJPQ0VTUycsIGlm
X3RydWU6IGZpbGVzKCdpb21tdS5jJykpDQo+PiByZW1vdGVfc3MuYWRkKHdoZW46ICdDT05GSUdf
VkZJT19VU0VSX1NFUlZFUicsIGlmX3RydWU6IGZpbGVzKCd2ZmlvLXVzZXItb2JqLmMnKSkNCj4+
IA0KPj4gcmVtb3RlX3NzLmFkZCh3aGVuOiAnQ09ORklHX1ZGSU9fVVNFUl9TRVJWRVInLCBpZl90
cnVlOiB2ZmlvdXNlcikNCj4gDQoNCg==

