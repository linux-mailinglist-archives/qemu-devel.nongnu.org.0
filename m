Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BC65086CB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 13:18:29 +0200 (CEST)
Received: from localhost ([::1]:51356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh8Ls-0000Rb-JL
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 07:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nh8J1-0007C1-Id
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 07:15:31 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:20016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nh8Iy-0005s8-AB
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 07:15:30 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23KAlCxB020622; 
 Wed, 20 Apr 2022 11:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=lc1J7huXTyybkk65zhc7lGKbU1gAfWdXdyX6NLhUdDk=;
 b=cv+Qgv+LSj/zVouwNd6bFviZ49rWI3lnNYqRcBwrPBQD7fAl05Po+neZYjD+oKyBIc3+
 bf1GiV6bDRhvGaTUAKfS+qGu27tU4oCd869hvkhYxdOpRHQSE/VuVH8dc4Zw3xHSx1W5
 6bCKjvrwT67YxwM/g9flgcvuaiuuxcDH0ZlnHssPW569w3+8q5qdQ+XZY2FcRZOxjM+A
 gY76NAhhsjKj9Upw3qupk8n4VwV7j5MMkwP6AH4u2LAmvVcy0kcqKPhZ4rtuIXjKeywF
 BqfChhvPWuBpFQxh+fLBSTFPgwCIWD7XdKvfkdV4K1bvaW6ygbAbfiXTx29L2ASgajXY Ng== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffmd18t22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Apr 2022 11:15:20 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23KB5p6x016115; Wed, 20 Apr 2022 11:15:20 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3ffm85knf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Apr 2022 11:15:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SeQ/rya1peI/HNyCjVFso2MrO3AtFf/eCf9wdmlZVFeLIuTHtYD7JA9H8ae8S3wE22MbBbWPw2sjWklUX7pKDvgcuA01myD1snRyvV4hSxehBkXywXYdJ9ZqZIjT0+1OEospmkJqVU/g0CdD1muVmiEoDtVXkHbvZH7sKACUGLDvfGeKcmDed7R0lxBCHmDmvfw7msEYBQfr4FPIt0fmF6VORj5TaF6NiOQNSkKZ1gkfBwofnfKigX/cCQfbYOa3xgWJd/8BIs9Kk6d/IeM2I+t2gkGQUM7SVfgYPBMu+3iWfDVUHLSXiYj6dhvIoLVv+tmGiLMlBA8iPyLG/yKUkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lc1J7huXTyybkk65zhc7lGKbU1gAfWdXdyX6NLhUdDk=;
 b=BA8BmWPb0/yF7BDsI2WbefNRmbsBn4mO5OUPejIfIUkyQcEWAy4HDpU5Vy4mId+hi6cMEOy7uYkFUSXjU3uVaQxaa0Moh+tO48nS02Jy68vEXrJJMU1iRxiaziAkdTntgfN4NzO9cMuYAysPtrMssEDfItxf+wMcrn0Mg4MKv3CS4zwxeQ2VpHkrqQ8dPtfGRxBb4Cu+1kJpNrgkv7horbpbFgt/HAZKLJtj1eAlzEcHTy4V3QsuvxdH8x5exlV5zguOavjDBBsoa2aAcqtnkvQTdWp7lvKgGvxtQqm9hwhQRbk1vigK8ytDDbRgTzQ2O6sqcrt77a3zfI/4rRe5fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lc1J7huXTyybkk65zhc7lGKbU1gAfWdXdyX6NLhUdDk=;
 b=Hpw+Mwh2a/emo6Tsu4Yv89HApRBi25hYtSdX+qpJkEtzFsNp9aO+yuA27NbSkHBvV4kM8LMz4Q1oBjZYYN7RenNfF7eSpElGIX48ZdASS7xa2FOQi8Lg6RuAwSRMlTGlq6uI7l/5PzZW6dl/5cnEsp8fJbLhYMELwTAe27UzHIA=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SN4PR10MB5654.namprd10.prod.outlook.com (2603:10b6:806:20d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 11:15:17 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac%4]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 11:15:17 +0000
From: Jag Raman <jag.raman@oracle.com>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v8 12/17] vfio-user: IOMMU support for remote device
Thread-Topic: [PATCH v8 12/17] vfio-user: IOMMU support for remote device
Thread-Index: AQHYVC5hP+b0lxyaWEa1TGZcvM2cNKz4p3SA
Date: Wed, 20 Apr 2022 11:15:16 +0000
Message-ID: <9D4970CA-122E-4F1C-8598-D841A4A7E78D@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
 <2a42664b61cef7cdd44688679b60a8c6c397b075.1650379269.git.jag.raman@oracle.com>
In-Reply-To: <2a42664b61cef7cdd44688679b60a8c6c397b075.1650379269.git.jag.raman@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13390272-0fc8-4346-4d1c-08da22bf0c8b
x-ms-traffictypediagnostic: SN4PR10MB5654:EE_
x-microsoft-antispam-prvs: <SN4PR10MB56543B393005EE159EB685B390F59@SN4PR10MB5654.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8WD42YNuuXW8Oc0/R6/ggs/eyM3Z5S91tYF9oM3Ci5xab6WGiPikEAQRjSxmuztEebn3nic1r/7sp0wl1mFvF88Vl7dUtJoSw6ofgXgf7eXXN9Z/t3kBCXDLqZ1M5D1L+O9d0JfbU2QMb+qQ/k6wpz4t6KlyLWcXHPWMlA8XPYe2d5rt3GmsqamPMPr7nRMpdlc1bgEniCb/ERdXkke3cBHSNmeqbNeit/XK9fx2Y0kgT6w3BhELWFKMW4R3r8PDBkXkagqYpV32W3xEGSWwZMJewQnZeCmrl5j2aZfcdcHnpUDP9RFSD2r97hylS7Ar4gn4DzKXunP/+ENu+SfzEJlW7NNMkan1ogN4WgOMXaSUjCqBvZf7QPEqNV/IIKm2nid+cMfQq1Y3qbFfEwk3ptelyas2dsiM/orL2tUF+aIRr3+wwN9Cgf02halGMLhE1oWo1iPDYTIxO5FFWj25Yk1Z0KFhllNwOxjNPEL6HZXRMq3P3n1E2G8/IVIDE6GDJKoP8AD0Lf2Y7i3JKrbIduQVxPkE2BUhOBCUJR1opic0vXcECVO3HnD0mFAM9DElKvwzTQ3vZNBPxf94NocXy8JO7VgsyT0CSH7m3ds32A9MR+F7oladMkJH5fzskb6TisDPOPsEduHYZaD97+nrTXvRl3hrReDL2CAdRjLQqE2y4zQMFdiIN2RDVp/6Yo+SmAAOwj95CCDbLFYh7oNSbjSUy65szCFUF8sH33gjaeDkHfeycmpYWuQPrvwUsju0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(83380400001)(508600001)(86362001)(8936002)(38100700002)(71200400001)(53546011)(38070700005)(6506007)(186003)(54906003)(6916009)(66946007)(44832011)(76116006)(2906002)(66556008)(36756003)(4326008)(66476007)(8676002)(66446008)(64756008)(2616005)(6512007)(316002)(91956017)(122000001)(6486002)(7416002)(33656002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2UvL1k3Ry96VWlwZUlMNUx2djBhamxvVHVFNlVFT3J4VllRNkhZS3ljVE8y?=
 =?utf-8?B?aDg1U3crTWcyT0JJeTFEOHQwVXlNRDNCSkhHTURvM0o5UDl4d3U2QjhqUE4y?=
 =?utf-8?B?SXpUcFoxREczTUF0Q3kwTVhsWG1HREtBN1puRDFaK0h6V0pyTDRSWDVSWTRw?=
 =?utf-8?B?UzB4M2ppY1JKQU9HVERqbExnb01WaDNsaDZzZHlYdHQrZElFbGVIZHpobWUy?=
 =?utf-8?B?OFdoanVXdkhkWVBNVUI2UGVXYmJEM21JcDZnYWJ5aGg4dU9BQ2FQRUVZRndz?=
 =?utf-8?B?Rm8vMEZSVzdZZkRHTjNmWlVQY2RUT1NHWXYralUvSlJvSXpySVYvU0g5c0VW?=
 =?utf-8?B?QlF0L3BBb01LNGlLTUJBVkhLR2hiODh1eWVaRXN2N1RPK2JSV1NDRGhBN1dR?=
 =?utf-8?B?bkpyQnI0dFhha1lnVEQ1VUJYaE9OV2tlQ1Y2NXJGOHFWQVRxOWU2aEdVMVlq?=
 =?utf-8?B?U245TzM5TXZhaldVaVVqdGNzaWhnMzdURC8xM0tpd3k5eS9jT1VoZWdmVTlO?=
 =?utf-8?B?blAwZjJpSHVQQkpxQ1UyNUlXNXQ4a0gwVHg2Q3kyQ2RxSW8zdDl6RTd0SmV3?=
 =?utf-8?B?VUVCY0NIUlozRVpvbDlYUDI4cnJFMWdVL1Q3MVpncFdNcUpITzZ2b0QwT3E2?=
 =?utf-8?B?a1lxNXcxeVRXWHdWTlAydm1IbU8rV2Q0QitOeFdQY20wQVBUYVhWa2ZQQlgr?=
 =?utf-8?B?ZG5XbVgvc0t4WWZsVElIRkY1c3lJM2F6VjlXWHJtNXBtampKWFhScUI4UXRZ?=
 =?utf-8?B?bGNLUGdMRG5jRTBqM3hVSlA0dGhicFFzOE94UGxTTVhrbC9pb1ZjUHlIOGpt?=
 =?utf-8?B?emw3RE1OemxmMVFJY0drVm5ZYTJ0b2x2YnNabFYxUm1pMEo0Y0VJN1lYQUpy?=
 =?utf-8?B?ZE5WdjlQcSsydHoxT0Y4bE1tcWdFOTFHNzRMSGNPbUNYL0UxQnB6MEdqellj?=
 =?utf-8?B?dTRicStZYVFhZDhVdjN4UHBIK0drSC9oK2FuNUlkbElzSGR0Z0dxM2hNVitT?=
 =?utf-8?B?VUY1WHNOcVFzTzRiZTVCVkpYYnhMbVlHdWNhb3dYdDdwdjJoZFd6WkJpZ2NC?=
 =?utf-8?B?TUFUclY5Zy9paW10c2x5UGNLbkdidFhlZlhVLzZ4VUdTb0dvbHdHaGM3NEpl?=
 =?utf-8?B?blBXanN3eVl5bWl4Q2owYlZiZE9vTjYzdU1zbnZUYU1HOVZtbTVWVlNwT29q?=
 =?utf-8?B?bHVmMUZybWVaR2ZReDFYSU5PQlp3VmtwQ1hLdGNJRUUvcU93eWN4YllDUlJh?=
 =?utf-8?B?Nzg0S1dHTm1kTWx6S1Zockw2SkJ0UlJGNVdaVEo5em8zM0FrQTJCdXY1WXor?=
 =?utf-8?B?NUFxSzdrdmJ0bS9ZVlo4UklxZ2lJQ0xISEVrNEtDam9lVGNyNGRlU3o1cVdn?=
 =?utf-8?B?aUJzK0tzdjgxRFZIMG5ZSG02NFZLd0lEV1N1Nzh3bmF4cGRXR0VnU25pOXVi?=
 =?utf-8?B?ZWptSzBqVExleDRPK1RHVXF2K3p5aEZldk5IWUtHaHdUTmJtWVJ1Q0JLdU1T?=
 =?utf-8?B?ZTFhMUFIQlhxUmtsbUpRT1VvOTNXd3VHS3J2S0p1bFRranVpUlRONHdSWkNm?=
 =?utf-8?B?S2xLaGMya2lpSHhtLzAxZHpBd3UxVWplaFlqaVlZb0NnTzJLUWpJN3NkT3Rn?=
 =?utf-8?B?TTBQM0lncldSbDNpcXFXaEcxYjlaN1o5UTlPTUcvOW9DcW5PeTJhSG1OVHlS?=
 =?utf-8?B?aDA3NmFYY0Zqb29yQUl4NS9BemdaVXNURXVMRWI0TWVEZU9xUXdvRlV4cTNz?=
 =?utf-8?B?UTJXMzJ0UkVQRnBNekFsL3BoYW0zVVNPZ3A3eHRmUjZqMUdHenpBWEJhbnJF?=
 =?utf-8?B?eEk4VVQ5N1EvK0QxcEYrVDgxSndpVXpMS3pRS2RSMVA2dHlicC9FTEhHc0hS?=
 =?utf-8?B?WFN2MHpTS0FqZEZHODBkNXAydW15QUFSbHp1bEYzdU1lSjM2OVJXMGtKK0lj?=
 =?utf-8?B?enBiUzZsRUs5OGQ2NE9HTGREK1NnMVBTZDRlS0Q5VEtHcEVxcUNUWm9rRDNP?=
 =?utf-8?B?bFBJT2doRzFRcGMxd2kyaU9jd3VwbEJ2NWhVczZXWWZsZmozNDJqYlpyMHgr?=
 =?utf-8?B?blNOTVRiYWpnUTNlSHRyOHEvVHhRbmhXWkc4d09EZ1ZuZmw2NVVKdHJ6YUhI?=
 =?utf-8?B?QWwyTUFGOTMvSUQ4YXI4RjJ4WEZ3bmpuVll6ci9HUW9vUnVxN2VaVzNLc0lB?=
 =?utf-8?B?Q21JRVNNcHduTFRONG4rN2g3cEFoNGd4TUlZT1NPNUZ5czRjcVcrNTZEOUcy?=
 =?utf-8?B?MnJnUFhnN2lNOTdmZWhvMnAwSHIxaElvcXFxZTRkbVRWekpQbnhDZER4YlpY?=
 =?utf-8?B?d0ErQ1VRdTdCYmg4RG4wVHZTczNkWFM4NjE4KzJPQ3VLQzQ3RjV6cWhRMDJ2?=
 =?utf-8?Q?ioYNQZmb0geEWCkV8NxGihWKweto0stynlRyv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8416516A597EF4CA53B46888C1928B1@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13390272-0fc8-4346-4d1c-08da22bf0c8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 11:15:16.9650 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JSJlUtpWfYFJYBy+91M8DA2v8qjZUed1NpMPc52iqQ7HceVf/fU59jQN0qhCEzqKyTcht7wIUNzq1EgfCSDwjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5654
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-20_02:2022-04-20,
 2022-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204200070
X-Proofpoint-ORIG-GUID: ZDY1kV7al2F_hQcGBT7ce-URglfKFy10
X-Proofpoint-GUID: ZDY1kV7al2F_hQcGBT7ce-URglfKFy10
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
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Thomas Huth <thuth@redhat.com>,
 John Johnson <john.g.johnson@oracle.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Levon <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gQXByIDE5LCAyMDIyLCBhdCA0OjQ1IFBNLCBKYWcgUmFtYW4gPGphZy5yYW1hbkBv
cmFjbGUuY29tPiB3cm90ZToNCj4gDQo+IEFzc2lnbiBzZXBhcmF0ZSBhZGRyZXNzIHNwYWNlIGZv
ciBlYWNoIGRldmljZSBpbiB0aGUgcmVtb3RlIHByb2Nlc3Nlcy4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEVsZW5hIFVmaW10c2V2YSA8ZWxlbmEudWZpbXRzZXZhQG9yYWNsZS5jb20+DQo+IFNpZ25l
ZC1vZmYtYnk6IEpvaG4gRyBKb2huc29uIDxqb2huLmcuam9obnNvbkBvcmFjbGUuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBKYWdhbm5hdGhhbiBSYW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+DQo+
IC0tLQ0KPiBpbmNsdWRlL2h3L3JlbW90ZS9pb21tdS5oIHwgIDQwICsrKysrKysrKysrKysNCj4g
aHcvcmVtb3RlL2lvbW11LmMgICAgICAgICB8IDExNCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPiBody9yZW1vdGUvbWFjaGluZS5jICAgICAgIHwgIDEzICsrKystDQo+
IE1BSU5UQUlORVJTICAgICAgICAgICAgICAgfCAgIDIgKw0KPiBody9yZW1vdGUvbWVzb24uYnVp
bGQgICAgIHwgICAxICsNCj4gNSBmaWxlcyBjaGFuZ2VkLCAxNjkgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody9yZW1vdGUvaW9tbXUu
aA0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgaHcvcmVtb3RlL2lvbW11LmMNCj4gDQo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2h3L3JlbW90ZS9pb21tdS5oIGIvaW5jbHVkZS9ody9yZW1vdGUvaW9tbXUu
aA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwLi4zM2I2OGE4ZjRi
DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvaW5jbHVkZS9ody9yZW1vdGUvaW9tbXUuaA0KPiBA
QCAtMCwwICsxLDQwIEBADQo+ICsvKioNCj4gKyAqIENvcHlyaWdodCDCqSAyMDIyIE9yYWNsZSBh
bmQvb3IgaXRzIGFmZmlsaWF0ZXMuDQo+ICsgKg0KPiArICogVGhpcyB3b3JrIGlzIGxpY2Vuc2Vk
IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdQTCwgdmVyc2lvbiAyIG9yIGxhdGVyLg0KPiAr
ICogU2VlIHRoZSBDT1BZSU5HIGZpbGUgaW4gdGhlIHRvcC1sZXZlbCBkaXJlY3RvcnkuDQo+ICsg
Kg0KPiArICovDQo+ICsNCj4gKyNpZm5kZWYgUkVNT1RFX0lPTU1VX0gNCj4gKyNkZWZpbmUgUkVN
T1RFX0lPTU1VX0gNCj4gKw0KPiArI2luY2x1ZGUgImh3L3BjaS9wY2lfYnVzLmgiDQo+ICsjaW5j
bHVkZSAiaHcvcGNpL3BjaS5oIg0KPiArDQo+ICsjaWZuZGVmIElOVDJWT0lEUA0KPiArI2RlZmlu
ZSBJTlQyVk9JRFAoaSkgKHZvaWQgKikodWludHB0cl90KShpKQ0KPiArI2VuZGlmDQo+ICsNCj4g
K3R5cGVkZWYgc3RydWN0IFJlbW90ZUlvbW11RWxlbSB7DQo+ICsgICAgTWVtb3J5UmVnaW9uICpt
cjsNCj4gKw0KPiArICAgIEFkZHJlc3NTcGFjZSBhczsNCj4gK30gUmVtb3RlSW9tbXVFbGVtOw0K
PiArDQo+ICsjZGVmaW5lIFRZUEVfUkVNT1RFX0lPTU1VICJ4LXJlbW90ZS1pb21tdSINCj4gK09C
SkVDVF9ERUNMQVJFX1NJTVBMRV9UWVBFKFJlbW90ZUlvbW11LCBSRU1PVEVfSU9NTVUpDQo+ICsN
Cj4gK3N0cnVjdCBSZW1vdGVJb21tdSB7DQo+ICsgICAgT2JqZWN0IHBhcmVudDsNCj4gKw0KPiAr
ICAgIEdIYXNoVGFibGUgKmVsZW1fYnlfZGV2Zm47DQo+ICsNCj4gKyAgICBRZW11TXV0ZXggbG9j
azsNCj4gK307DQo+ICsNCj4gK3ZvaWQgcmVtb3RlX2lvbW11X3NldHVwKFBDSUJ1cyAqcGNpX2J1
cyk7DQo+ICsNCj4gK3ZvaWQgcmVtb3RlX2lvbW11X3VucGx1Z19kZXYoUENJRGV2aWNlICpwY2lf
ZGV2KTsNCj4gKw0KPiArI2VuZGlmDQo+IGRpZmYgLS1naXQgYS9ody9yZW1vdGUvaW9tbXUuYyBi
L2h3L3JlbW90ZS9pb21tdS5jDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAw
MDAwMDAuLjE2YzZiMDgzNGUNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9ody9yZW1vdGUvaW9t
bXUuYw0KPiBAQCAtMCwwICsxLDExNCBAQA0KPiArLyoqDQo+ICsgKiBJT01NVSBmb3IgcmVtb3Rl
IGRldmljZQ0KPiArICoNCj4gKyAqIENvcHlyaWdodCDCqSAyMDIyIE9yYWNsZSBhbmQvb3IgaXRz
IGFmZmlsaWF0ZXMuDQo+ICsgKg0KPiArICogVGhpcyB3b3JrIGlzIGxpY2Vuc2VkIHVuZGVyIHRo
ZSB0ZXJtcyBvZiB0aGUgR05VIEdQTCwgdmVyc2lvbiAyIG9yIGxhdGVyLg0KPiArICogU2VlIHRo
ZSBDT1BZSU5HIGZpbGUgaW4gdGhlIHRvcC1sZXZlbCBkaXJlY3RvcnkuDQo+ICsgKg0KPiArICov
DQo+ICsNCj4gKyNpbmNsdWRlICJxZW11L29zZGVwLmgiDQo+ICsjaW5jbHVkZSAicWVtdS1jb21t
b24uaCINCj4gKw0KPiArI2luY2x1ZGUgImh3L3JlbW90ZS9pb21tdS5oIg0KPiArI2luY2x1ZGUg
Imh3L3BjaS9wY2lfYnVzLmgiDQo+ICsjaW5jbHVkZSAiaHcvcGNpL3BjaS5oIg0KPiArI2luY2x1
ZGUgImV4ZWMvbWVtb3J5LmgiDQo+ICsjaW5jbHVkZSAiZXhlYy9hZGRyZXNzLXNwYWNlcy5oIg0K
PiArI2luY2x1ZGUgInRyYWNlLmgiDQo+ICsNCj4gK3N0YXRpYyBBZGRyZXNzU3BhY2UgKnJlbW90
ZV9pb21tdV9maW5kX2FkZF9hcyhQQ0lCdXMgKnBjaV9idXMsDQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqb3BhcXVlLCBpbnQgZGV2Zm4pDQo+
ICt7DQo+ICsgICAgUmVtb3RlSW9tbXUgKmlvbW11ID0gb3BhcXVlOw0KPiArICAgIFJlbW90ZUlv
bW11RWxlbSAqZWxlbSA9IE5VTEw7DQo+ICsNCj4gKyAgICBxZW11X211dGV4X2xvY2soJmlvbW11
LT5sb2NrKTsNCj4gKw0KPiArICAgIGVsZW0gPSBnX2hhc2hfdGFibGVfbG9va3VwKGlvbW11LT5l
bGVtX2J5X2RldmZuLCBJTlQyVk9JRFAoZGV2Zm4pKTsNCj4gKw0KPiArICAgIGlmICghZWxlbSkg
ew0KPiArICAgICAgICBlbGVtID0gZ19tYWxsb2MwKHNpemVvZihSZW1vdGVJb21tdUVsZW0pKTsN
Cj4gKyAgICAgICAgZ19oYXNoX3RhYmxlX2luc2VydChpb21tdS0+ZWxlbV9ieV9kZXZmbiwgSU5U
MlZPSURQKGRldmZuKSwgZWxlbSk7DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgaWYgKCFlbGVtLT5t
cikgew0KPiArICAgICAgICBlbGVtLT5tciA9IE1FTU9SWV9SRUdJT04ob2JqZWN0X25ldyhUWVBF
X01FTU9SWV9SRUdJT04pKTsNCj4gKyAgICAgICAgbWVtb3J5X3JlZ2lvbl9zZXRfc2l6ZShlbGVt
LT5tciwgVUlOVDY0X01BWCk7DQo+ICsgICAgICAgIGFkZHJlc3Nfc3BhY2VfaW5pdCgmZWxlbS0+
YXMsIGVsZW0tPm1yLCBOVUxMKTsNCg0KSGksDQoNCknigJlkIGxpa2UgdG8gYWRkIGEgbm90ZSBo
ZXJlLg0KDQpXZSB0cmllZCB0byBhZGQgImVsZW0tPm1y4oCdIGFzIGEgY2hpbGQgb2YgUENJRGV2
aWNlLiBUaGF0IHdheSwgd2hlbiBQQ0lEZXZpY2UgaXMNCnVucGx1Z2dlZCwgdGhlIGNoaWxkIGlz
IGFsc28gZmluYWxpemVkLg0KDQpIb3dldmVyLCB0aGVyZSB3YXMgc29tZSBpc3N1ZSB3aXRoIGhv
dHBsdWcuIER1cmluZyB0aGUgaG90cGx1ZywgdGhlcmXigJlzIGEgd2luZG93DQpkdXJpbmcgaW5p
dGlhbGl6YXRpb24gd2hlcmUgd2UgY291bGRu4oCZdCBsb29rdXAgdGhlIFBDSURldmljZSBieSDi
gJxkZXZmbuKAnS4NCg0KZG9fcGNpX3JlZ2lzdGVyX2RldmljZSgpIC0+IHBjaV9pbml0X2J1c19t
YXN0ZXIoKSAtPiBwY2lfZGV2aWNlX2lvbW11X2FkZHJlc3Nfc3BhY2UoKQ0KaGFwcGVucyBiZWZv
cmUgZG9fcGNpX3JlZ2lzdGVyX2RldmljZSgpIC0+IOKAnGJ1cy0+ZGV2aWNlc1tkZXZmbl0gPSBw
Y2lfZGV24oCdLiBBcyBzdWNoLA0KcGNpX2ZpbmRfZGV2aWNlKCkgZG9lc27igJl0IHdvcmsgYXQg
dGhpcyB0aW1lLg0KDQpUaGFuayB5b3UhDQotLQ0KSmFnDQoNCj4gKyAgICB9DQo+ICsNCj4gKyAg
ICBxZW11X211dGV4X3VubG9jaygmaW9tbXUtPmxvY2spOw0KPiArDQo+ICsgICAgcmV0dXJuICZl
bGVtLT5hczsNCj4gK30NCj4gKw0KPiArdm9pZCByZW1vdGVfaW9tbXVfdW5wbHVnX2RldihQQ0lE
ZXZpY2UgKnBjaV9kZXYpDQo+ICt7DQo+ICsgICAgQWRkcmVzc1NwYWNlICphcyA9IHBjaV9kZXZp
Y2VfaW9tbXVfYWRkcmVzc19zcGFjZShwY2lfZGV2KTsNCj4gKyAgICBSZW1vdGVJb21tdUVsZW0g
KmVsZW0gPSBOVUxMOw0KPiArDQo+ICsgICAgaWYgKGFzID09ICZhZGRyZXNzX3NwYWNlX21lbW9y
eSkgew0KPiArICAgICAgICByZXR1cm47DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgZWxlbSA9IGNv
bnRhaW5lcl9vZihhcywgUmVtb3RlSW9tbXVFbGVtLCBhcyk7DQo+ICsNCj4gKyAgICBhZGRyZXNz
X3NwYWNlX2Rlc3Ryb3koJmVsZW0tPmFzKTsNCj4gKw0KPiArICAgIG9iamVjdF91bnJlZihlbGVt
LT5tcik7DQo+ICsNCj4gKyAgICBlbGVtLT5tciA9IE5VTEw7DQo+ICt9DQo+ICsNCj4gK3N0YXRp
YyB2b2lkIHJlbW90ZV9pb21tdV9pbml0KE9iamVjdCAqb2JqKQ0KPiArew0KPiArICAgIFJlbW90
ZUlvbW11ICppb21tdSA9IFJFTU9URV9JT01NVShvYmopOw0KPiArDQo+ICsgICAgaW9tbXUtPmVs
ZW1fYnlfZGV2Zm4gPSBnX2hhc2hfdGFibGVfbmV3X2Z1bGwoTlVMTCwgTlVMTCwgTlVMTCwgZ19m
cmVlKTsNCj4gKw0KPiArICAgIHFlbXVfbXV0ZXhfaW5pdCgmaW9tbXUtPmxvY2spOw0KPiArfQ0K
PiArDQo+ICtzdGF0aWMgdm9pZCByZW1vdGVfaW9tbXVfZmluYWxpemUoT2JqZWN0ICpvYmopDQo+
ICt7DQo+ICsgICAgUmVtb3RlSW9tbXUgKmlvbW11ID0gUkVNT1RFX0lPTU1VKG9iaik7DQo+ICsN
Cj4gKyAgICBxZW11X211dGV4X2Rlc3Ryb3koJmlvbW11LT5sb2NrKTsNCj4gKw0KPiArICAgIGlm
IChpb21tdS0+ZWxlbV9ieV9kZXZmbikgew0KPiArICAgICAgICBnX2hhc2hfdGFibGVfZGVzdHJv
eShpb21tdS0+ZWxlbV9ieV9kZXZmbik7DQo+ICsgICAgICAgIGlvbW11LT5lbGVtX2J5X2RldmZu
ID0gTlVMTDsNCj4gKyAgICB9DQo+ICt9DQo+ICsNCj4gK3ZvaWQgcmVtb3RlX2lvbW11X3NldHVw
KFBDSUJ1cyAqcGNpX2J1cykNCj4gK3sNCj4gKyAgICBSZW1vdGVJb21tdSAqaW9tbXUgPSBOVUxM
Ow0KPiArDQo+ICsgICAgZ19hc3NlcnQocGNpX2J1cyk7DQo+ICsNCj4gKyAgICBpb21tdSA9IFJF
TU9URV9JT01NVShvYmplY3RfbmV3KFRZUEVfUkVNT1RFX0lPTU1VKSk7DQo+ICsNCj4gKyAgICBw
Y2lfc2V0dXBfaW9tbXUocGNpX2J1cywgcmVtb3RlX2lvbW11X2ZpbmRfYWRkX2FzLCBpb21tdSk7
DQo+ICsNCj4gKyAgICBvYmplY3RfcHJvcGVydHlfYWRkX2NoaWxkKE9CSkVDVChwY2lfYnVzKSwg
InJlbW90ZS1pb21tdSIsIE9CSkVDVChpb21tdSkpOw0KPiArDQo+ICsgICAgb2JqZWN0X3VucmVm
KE9CSkVDVChpb21tdSkpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgY29uc3QgVHlwZUluZm8gcmVt
b3RlX2lvbW11X2luZm8gPSB7DQo+ICsgICAgLm5hbWUgPSBUWVBFX1JFTU9URV9JT01NVSwNCj4g
KyAgICAucGFyZW50ID0gVFlQRV9PQkpFQ1QsDQo+ICsgICAgLmluc3RhbmNlX3NpemUgPSBzaXpl
b2YoUmVtb3RlSW9tbXUpLA0KPiArICAgIC5pbnN0YW5jZV9pbml0ID0gcmVtb3RlX2lvbW11X2lu
aXQsDQo+ICsgICAgLmluc3RhbmNlX2ZpbmFsaXplID0gcmVtb3RlX2lvbW11X2ZpbmFsaXplLA0K
PiArfTsNCj4gKw0KPiArc3RhdGljIHZvaWQgcmVtb3RlX2lvbW11X3JlZ2lzdGVyX3R5cGVzKHZv
aWQpDQo+ICt7DQo+ICsgICAgdHlwZV9yZWdpc3Rlcl9zdGF0aWMoJnJlbW90ZV9pb21tdV9pbmZv
KTsNCj4gK30NCj4gKw0KPiArdHlwZV9pbml0KHJlbW90ZV9pb21tdV9yZWdpc3Rlcl90eXBlcykN
Cj4gZGlmZiAtLWdpdCBhL2h3L3JlbW90ZS9tYWNoaW5lLmMgYi9ody9yZW1vdGUvbWFjaGluZS5j
DQo+IGluZGV4IGVkOTE2NTk3OTQuLmNjYTVkMjVmNTAgMTAwNjQ0DQo+IC0tLSBhL2h3L3JlbW90
ZS9tYWNoaW5lLmMNCj4gKysrIGIvaHcvcmVtb3RlL21hY2hpbmUuYw0KPiBAQCAtMjEsNiArMjEs
NyBAQA0KPiAjaW5jbHVkZSAicWFwaS9lcnJvci5oIg0KPiAjaW5jbHVkZSAiaHcvcGNpL3BjaV9o
b3N0LmgiDQo+ICNpbmNsdWRlICJody9yZW1vdGUvaW9odWIuaCINCj4gKyNpbmNsdWRlICJody9y
ZW1vdGUvaW9tbXUuaCINCj4gI2luY2x1ZGUgImh3L3FkZXYtY29yZS5oIg0KPiANCj4gc3RhdGlj
IHZvaWQgcmVtb3RlX21hY2hpbmVfaW5pdChNYWNoaW5lU3RhdGUgKm1hY2hpbmUpDQo+IEBAIC0x
MDAsNiArMTAxLDE2IEBAIHN0YXRpYyB2b2lkIHJlbW90ZV9tYWNoaW5lX2luc3RhbmNlX2luaXQo
T2JqZWN0ICpvYmopDQo+ICAgICBzLT5hdXRvX3NodXRkb3duID0gdHJ1ZTsNCj4gfQ0KPiANCj4g
K3N0YXRpYyB2b2lkIHJlbW90ZV9tYWNoaW5lX2Rldl91bnBsdWdfY2IoSG90cGx1Z0hhbmRsZXIg
KmhvdHBsdWdfZGV2LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApDQo+ICt7DQo+ICsgICAgcWRldl91bnJl
YWxpemUoZGV2KTsNCj4gKw0KPiArICAgIGlmIChvYmplY3RfZHluYW1pY19jYXN0KE9CSkVDVChk
ZXYpLCBUWVBFX1BDSV9ERVZJQ0UpKSB7DQo+ICsgICAgICAgIHJlbW90ZV9pb21tdV91bnBsdWdf
ZGV2KFBDSV9ERVZJQ0UoZGV2KSk7DQo+ICsgICAgfQ0KPiArfQ0KPiArDQo+IHN0YXRpYyB2b2lk
IHJlbW90ZV9tYWNoaW5lX2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKm9jLCB2b2lkICpkYXRhKQ0K
PiB7DQo+ICAgICBNYWNoaW5lQ2xhc3MgKm1jID0gTUFDSElORV9DTEFTUyhvYyk7DQo+IEBAIC0x
MDgsNyArMTE5LDcgQEAgc3RhdGljIHZvaWQgcmVtb3RlX21hY2hpbmVfY2xhc3NfaW5pdChPYmpl
Y3RDbGFzcyAqb2MsIHZvaWQgKmRhdGEpDQo+ICAgICBtYy0+aW5pdCA9IHJlbW90ZV9tYWNoaW5l
X2luaXQ7DQo+ICAgICBtYy0+ZGVzYyA9ICJFeHBlcmltZW50YWwgcmVtb3RlIG1hY2hpbmUiOw0K
PiANCj4gLSAgICBoYy0+dW5wbHVnID0gcWRldl9zaW1wbGVfZGV2aWNlX3VucGx1Z19jYjsNCj4g
KyAgICBoYy0+dW5wbHVnID0gcmVtb3RlX21hY2hpbmVfZGV2X3VucGx1Z19jYjsNCj4gDQo+ICAg
ICBvYmplY3RfY2xhc3NfcHJvcGVydHlfYWRkX2Jvb2wob2MsICJ2ZmlvLXVzZXIiLA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlbW90ZV9tYWNoaW5lX2dldF92ZmlvX3Vz
ZXIsDQo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQo+IGluZGV4IDM3
YWZkZWNjNjEuLjNlNjJjY2FiMGEgMTAwNjQ0DQo+IC0tLSBhL01BSU5UQUlORVJTDQo+ICsrKyBi
L01BSU5UQUlORVJTDQo+IEBAIC0zNTk5LDYgKzM1OTksOCBAQCBGOiBody9yZW1vdGUvaW9odWIu
Yw0KPiBGOiBpbmNsdWRlL2h3L3JlbW90ZS9pb2h1Yi5oDQo+IEY6IHN1YnByb2plY3RzL2xpYnZm
aW8tdXNlcg0KPiBGOiBody9yZW1vdGUvdmZpby11c2VyLW9iai5jDQo+ICtGOiBody9yZW1vdGUv
aW9tbXUuYw0KPiArRjogaW5jbHVkZS9ody9yZW1vdGUvaW9tbXUuaA0KPiANCj4gRUJQRjoNCj4g
TTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gZGlmZiAtLWdpdCBhL2h3L3Jl
bW90ZS9tZXNvbi5idWlsZCBiL2h3L3JlbW90ZS9tZXNvbi5idWlsZA0KPiBpbmRleCA1MzRhYzVk
Zjc5Li5iY2VmODNjOGNjIDEwMDY0NA0KPiAtLS0gYS9ody9yZW1vdGUvbWVzb24uYnVpbGQNCj4g
KysrIGIvaHcvcmVtb3RlL21lc29uLmJ1aWxkDQo+IEBAIC02LDYgKzYsNyBAQCByZW1vdGVfc3Mu
YWRkKHdoZW46ICdDT05GSUdfTVVMVElQUk9DRVNTJywgaWZfdHJ1ZTogZmlsZXMoJ21lc3NhZ2Uu
YycpKQ0KPiByZW1vdGVfc3MuYWRkKHdoZW46ICdDT05GSUdfTVVMVElQUk9DRVNTJywgaWZfdHJ1
ZTogZmlsZXMoJ3JlbW90ZS1vYmouYycpKQ0KPiByZW1vdGVfc3MuYWRkKHdoZW46ICdDT05GSUdf
TVVMVElQUk9DRVNTJywgaWZfdHJ1ZTogZmlsZXMoJ3Byb3h5LmMnKSkNCj4gcmVtb3RlX3NzLmFk
ZCh3aGVuOiAnQ09ORklHX01VTFRJUFJPQ0VTUycsIGlmX3RydWU6IGZpbGVzKCdpb2h1Yi5jJykp
DQo+ICtyZW1vdGVfc3MuYWRkKHdoZW46ICdDT05GSUdfTVVMVElQUk9DRVNTJywgaWZfdHJ1ZTog
ZmlsZXMoJ2lvbW11LmMnKSkNCj4gcmVtb3RlX3NzLmFkZCh3aGVuOiAnQ09ORklHX1ZGSU9fVVNF
Ul9TRVJWRVInLCBpZl90cnVlOiBmaWxlcygndmZpby11c2VyLW9iai5jJykpDQo+IA0KPiByZW1v
dGVfc3MuYWRkKHdoZW46ICdDT05GSUdfVkZJT19VU0VSX1NFUlZFUicsIGlmX3RydWU6IHZmaW91
c2VyKQ0KPiAtLSANCj4gMi4yMC4xDQo+IA0KDQo=

