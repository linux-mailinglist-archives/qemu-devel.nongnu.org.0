Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682C851A401
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 17:26:49 +0200 (CEST)
Received: from localhost ([::1]:42112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmGts-0005Er-8z
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 11:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nmGs2-0003WZ-Dy
 for qemu-devel@nongnu.org; Wed, 04 May 2022 11:24:57 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:45400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nmGrz-00045I-B1
 for qemu-devel@nongnu.org; Wed, 04 May 2022 11:24:53 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 244EO0Jh013665;
 Wed, 4 May 2022 15:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=V3tZUEX0TsLNLf/FUuW16IYxuJ8SXQtANWbQgpsuGD0=;
 b=fQOIpR/OQuSD/cKt6+Xh8uqDi4bcmgTdsRxfcJAAqx/E/5sJu0UzYaL18Ib/As5fRC3P
 E49gqWGudYGVHJdG3PICl5nqwl5yZWpFeyLV/DQ2ej1WjsnIgzqMIMrhtwtrlA+Uwm46
 akfRhEeuk1sDtccvaQX0BGy/htropSs1Jn+ZinVICWfpC3W6fsg9nGnv1ztgt9PDYRp4
 WlS9KnjhWsyWBlTf+XnhqCUUa4QYtW+cf7+/wjVchRa/h8JH5Qv8jbqRar7EN5uW5VoY
 M8Xif2aL7+RL44NN7NBECcGBGDHNxWcC7G0dGLW0Upu1E9Vqiohv8ouM02fFhP69frvp 8A== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frvqsgu2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 May 2022 15:24:40 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 244FFLZu034108; Wed, 4 May 2022 15:24:39 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fs1a5tp6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 May 2022 15:24:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqNupnB6a2tx6U22L8b24qiEBcQwZnZYO7lruugzfNFwev5Uv0m10iEf6rOSs/dDE0J9jOVDOO/RyGfkWL9ZYBBHVMpLGC+yNbIhlBgPhhuApgXdDNPwV/E6JQLEplAAZMyzufpOyErYxSnok7SKXpwlzBOaKmc7Mszp4WKUXuO9jBARjcMHDUW146FUOgtpBk7HiNuBgfl9C8U/1+9ShzwoYEsarsqvfZKwZbMYOVQ3uDdu/beD1AkD53y5vYncgVPHTeh+28OPhnhCnLlwhiZdFcVVJXwx+wpW8Olzgoto8ZugGjBKzOhrfXnD+TK33h2AaYjQBO53yWgSl5rgpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3tZUEX0TsLNLf/FUuW16IYxuJ8SXQtANWbQgpsuGD0=;
 b=bdzLTEZj87kfyNOIxLqtA5kXSfMyRf3BZq2cR7xsHDDFR8HoUAKIm1X+VMLE/72LQCV0vTat7sH5Aqd8Tl0j619UkOm5QlN1P7CC/6O8dJhZjx1u9R41PqrOZXsJv5fyTmPndf869xOqcleMQeLoGe4WqFmkStlRo7+Tom+1h/kkhweyIPDu8tAkQhMIALC+a+5nfNCAA2x+yHZTRiZVOsQQTONDsTj739Lthz4L8oCtHb6bOkiRc0tRfgi62XlY1w51G0cQt383k80+vHFmEBCL/f1MJHdzcLrAsYIxgieJZBvBf52UUvIZwAXUnzhvSi2paZxIWC6LCLwiieQNWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3tZUEX0TsLNLf/FUuW16IYxuJ8SXQtANWbQgpsuGD0=;
 b=zPjatGlpYFbmnOsOsFoY7nLPaWQYwHt4q1NBlS+tUo8WKaNYj4vgAzvNCJdZuTJKy7TDsB7FGC3qfCzuGkm/iGDdznHu4pTPL34mw0ul71iFQqLY3j90VP6MIdn9ONHBV+a3CFfA9Sn4ydpqQThTvKR85dpUic+g/XVyaziwPyQ=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN7PR10MB2660.namprd10.prod.outlook.com (2603:10b6:406:ce::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 4 May
 2022 15:24:37 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 15:24:37 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Markus Armbruster <armbru@redhat.com>
CC: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "eduardo@habkost.net" <eduardo@habkost.net>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "eblake@redhat.com" <eblake@redhat.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "peterx@redhat.com"
 <peterx@redhat.com>, "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>, Elena Ufimtseva
 <elena.ufimtseva@oracle.com>, John Johnson <john.g.johnson@oracle.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>
Subject: Re: [PATCH v9 07/17] vfio-user: define vfio-user-server object
Thread-Topic: [PATCH v9 07/17] vfio-user: define vfio-user-server object
Thread-Index: AQHYXviB0Av0tOrBtUqoqo2vDlepLK0OmulpgAA9RgA=
Date: Wed, 4 May 2022 15:24:37 +0000
Message-ID: <45821C65-9A66-44BC-AC00-BC3BEAF982BF@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
 <48d0f7214036d48b1f70b90a8c4a6c2a46363ee9.1651586203.git.jag.raman@oracle.com>
 <871qx97c8s.fsf@pond.sub.org>
In-Reply-To: <871qx97c8s.fsf@pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1291939-7916-4a86-38ff-08da2de23361
x-ms-traffictypediagnostic: BN7PR10MB2660:EE_
x-microsoft-antispam-prvs: <BN7PR10MB2660BB9DAEF3A41CBEBA8F3690C39@BN7PR10MB2660.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L6JaFNFmt10QsxJ17Z/PmuORFkqzD5hTYjl/F9iggU59P0P4xAWIwdqhDRnDCqFkHyX+zM2Hj2M+kGNbAA93R9ljZKWcku0MVlIax9A3kcze0Bjx8df1cyfYYblmbFj/TYN77+pryFLZlQj0tdR+2tO05G8J567l45sM4TLJN+4ZgD4QzmGFWtgdtopzjjwEUCFLwdcKEOI5jQi70xe3MynGS9trv09RzBK06K/CBuNqB4RfFlnLQv+SUbpKN8rO/4ee85Lz5PSwd5bhWHrxGodihqM45PZ/KkVR4yzcoOC7/6PxbZAe9K6p5p1B3oXYhng+NhlTQONvrgKXnxBF6FVWSylIstN1oBsuwqwLU2jvZZFBIVvLD4Rapb95ihZtMBotOzkTc3LtBwuTFNg4RR2O7bo+shA+ekZmhRyhwzPSqReCRn8/NLofOiKPafoqm3/0bNUhLZivqusY/0QHowqjuj85gBM3p++yBbmoqrethCe/moZ+ZBh5ubUdNQotw6dViBTbCauqU/qzL9/4PK3sDwiHfHjpawOkMrWLiJXIeWZQVagq8RDsb90a+XLap33XGye4U0uEe3B6pnSOOrIPRWMWYV8OVpTV4Sl3f5iCa5DAyeDUZ0k0IBrLxridtr59DoqoDQhJa0DegUVvftjEoyFQtHwAOaYcRxKSiZApKfjaTl9A1KE9aKW92vzq4Yq0c16Bknbs64Kem74rAXYOQgyV8nYrrVXkoY8TvmG8Uk6wIQSuT1IkUlRW34OP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38070700005)(6916009)(316002)(122000001)(83380400001)(186003)(38100700002)(66946007)(86362001)(2616005)(54906003)(107886003)(76116006)(4326008)(64756008)(66446008)(66556008)(66476007)(8676002)(91956017)(508600001)(71200400001)(6512007)(6486002)(53546011)(36756003)(6506007)(5660300002)(7416002)(2906002)(8936002)(33656002)(44832011)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wm54akc4dTBMZkVML1NFeU5uVzl0VG11MFAwVTVPWUozWTBiaWdPL2VRNmxD?=
 =?utf-8?B?U1BhQWlVZ2hqWHgxL013b0tkVG04ZyswOStYV2ppT1VRWVlNbWxZeGd4QzZI?=
 =?utf-8?B?L2hWeHhnc3BYZlh6RncrNGkyTUV5QS9QeHNjRHBTQnZJY2lrTnBuemtJSCtv?=
 =?utf-8?B?KzN3M2VEMjFNSnoreEdQbmw5WHJkbTNWcWgvU0RIT3JkL1dNZ0o0UHNKTS93?=
 =?utf-8?B?bkJXMUZySXdOVTNteDdsdVZ6Ri9kM1kwMGgzaUdtMlF5alZOaHdpbmtJVWQ4?=
 =?utf-8?B?aVY1MjFuVGdQa1N1Tlc5cXh5NUxPL3F2c0I2UENlb1RRNmJ5R0orZ1Q0Q2tL?=
 =?utf-8?B?U3lUYlFXRThpaXZ6MFJ5NWMrUUZZVVlOM0tSRERQYitZczRzVFR6WkdpMlhp?=
 =?utf-8?B?WWw5cC93cFFScDdTYkg1NmY2eE1qbkhrTElOVm4yZlFmZFhpZG9vanNKdmFm?=
 =?utf-8?B?T0o4TUxDSnNOQVhSRUJtWlVSbEZ1cit6a0YrcCtCNHVHVnpDY3hIVFVKbWV3?=
 =?utf-8?B?TUQ3d252L3B5dmQyMm9CMW9rQkRLcnRkcjM1T1FheGlrRGNKNzhVOXFIRk80?=
 =?utf-8?B?cTR6TzRYSDVRSjZHUkZodE0xT3N6dnozY2tISkdHcEw3Tlc4MStranFGenFF?=
 =?utf-8?B?NzFsNjZHNmRzNkJtRTYxWjFpRVVaSW1wZTMvZkFDL3lHb0JMYkM5ZlF3blpt?=
 =?utf-8?B?THRTU283L0hnWjM2RGsyMXVQa2xrVnlqdVp2NHZTeFNGZDQ5ZU1FRUs0WmVQ?=
 =?utf-8?B?dmVqRUlKd01wNkpGU3Y2VlVXMGRwUGdSMTZlbzlSVjVIWFVLSEhvelEzSUIx?=
 =?utf-8?B?MGNNK3ZNTUh1ei9pOXl3UjVpZUFVNUxVOFVWcU5sQXhMRnJVZnhsRTVsTms5?=
 =?utf-8?B?TkRqR2hvazVxU05QSTlPVmQzSHJFUXY2L2pGaXV1NTVvbnZraFJ5M0YrZmFm?=
 =?utf-8?B?UERvczJWbW5NcmJadkJNMXNvV3ZTZkJlQ3hkL2F3THRLV1ZnQ3c0andZcHVZ?=
 =?utf-8?B?czVpYXNHc2pTWE95eE11VE5uTlE0YjNYNnhPTzcwYjdDUXFRWlVjcU11THRi?=
 =?utf-8?B?eEU4UU1WbzRrbmJBTmx0SHhoUkhsRHA4LzhSOHlxbzZ4U2xzNTh3VmhBTDVz?=
 =?utf-8?B?Nmg3V1ZnZ0F3cUxPUlQ2aHhYT1FmbGNTM2NLemI5bmd3Z25MNWxESmJNU1pq?=
 =?utf-8?B?S25zb2hpR2RqaFl2SGQxRlI0ay9aTVhTNTRCRFFHblk2RXo2MDV0VVhsR2NC?=
 =?utf-8?B?cHRVanNzZkREWmpsSWZoSUYwUkVZSDZCSFpNV3QxSW1Hdk9HSkV6OGJpalRu?=
 =?utf-8?B?eSsyNHowM3pDTGVnNk1aNW1tVHJJTlZ1cVlXcWJTOWF0TTd4Q1FQc3pHUkVC?=
 =?utf-8?B?VHV6dGxqUm9JeDJYMFRUZUZBK1BIYUhMQUtEVkJtY1IrTVZNV1RjZWdPbW5u?=
 =?utf-8?B?QkZublV1RTRablZhaTRTVWhKeW1lbXNhbUpTYWVlbkN4MkhiaUlJNSs3anF6?=
 =?utf-8?B?Z0VEQkVLM2g4U1JLUFpLdk01Uzd4b3RNV2VJTDVMbloxQ3Y0WXZoekE3OXM4?=
 =?utf-8?B?RVV6VmNGR2tnZWh0b2N5Sm1Ed1ZKV255YVhpSzJDS01PZS9LRk1CZFBwaisv?=
 =?utf-8?B?YnQ0V1lELzlkQWhaa3M5RlZNU21PU0Q3Ukc1eWx3VDhjeWJiV3c5YTdUQklK?=
 =?utf-8?B?SDFLTkNQdUttMXJsSVJSckRSMm9kQVJoSWQxZ3lwYVg5RjVNejBhdW0zZENs?=
 =?utf-8?B?M0xrbkxEZFBtckRIUS9ZK2g4c3dxNUR5U3JBeWtGeGx1K0NYYnU2WElYUmV3?=
 =?utf-8?B?eGJKUGJqN1h5Z2p4YTZOMVJRdWlydHNCVktLUHcrL0tUNVF5cUJxOWFPOHc1?=
 =?utf-8?B?NWF3Z21FQmdrMTJzVThzZjVJVzFkTjJ5WnkzVlJhZFpYOGJCNjZRTEYvTmli?=
 =?utf-8?B?RWdIZkxlbGRXNm9sRHJQQ2dUNVMvTVRtWEZvMGJ0QVNOL01IeXRCVHJZRzJu?=
 =?utf-8?B?ZjVoZlNMTUM5T2IzczR3Q01RbTNzTDF5MGp3T21oOEk5UCtTSSswMWkxUzdo?=
 =?utf-8?B?c1YrbzdJd2pHK0YzdmtwaE9YZHZxb2t5aHQvMmxGOXdWZW1HcWo5aWJMNzh4?=
 =?utf-8?B?ekdhR1FjNWhjNXVXcDlLak9lWi9PSi8wa3NZZ2tUTUwrNzdoVjUraGRtNUNN?=
 =?utf-8?B?bndIZGpCbDJKZkNWaGVqdEZUUXZBVWJsV1pJMnlhRldpSzVoV1ZPMDIzK2NT?=
 =?utf-8?B?dFRYaTZKelZXWFdZbWtHY3NlT2ZNMXVKZFovcW1Ed1loakF0aVhiTmxtK1dB?=
 =?utf-8?B?ekNwTnhUTFhCQjlQaWFhWjd4eDFuQjJveEprdmR2QTdEM09JU3lNT2M2ZHBL?=
 =?utf-8?Q?KOusDTCiLDyPnn9H9RU/QKvidHfHKKtGB2zJK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31BB139FE56D0347B1882AE4C3325162@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1291939-7916-4a86-38ff-08da2de23361
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 15:24:37.3746 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ZRyYT9cxFfBjw/CfuQRz8ZAQG24E//T0tO6lDJG+loaUZs9FYz9EgNytWJgyYugxObZ9yTmLXouTCD0Lba5hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2660
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-04_04:2022-05-04,
 2022-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205040098
X-Proofpoint-GUID: lZV79p6i21eP8DhgRnyCfJbBg0MZoKqP
X-Proofpoint-ORIG-GUID: lZV79p6i21eP8DhgRnyCfJbBg0MZoKqP
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTWF5IDQsIDIwMjIsIGF0IDc6NDUgQU0sIE1hcmt1cyBBcm1icnVzdGVyIDxhcm1i
cnVAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBKYWdhbm5hdGhhbiBSYW1hbiA8amFnLnJhbWFu
QG9yYWNsZS5jb20+IHdyaXRlczoNCj4gDQo+PiBEZWZpbmUgdmZpby11c2VyIG9iamVjdCB3aGlj
aCBpcyByZW1vdGUgcHJvY2VzcyBzZXJ2ZXIgZm9yIFFFTVUuIFNldHVwDQo+PiBvYmplY3QgaW5p
dGlhbGl6YXRpb24gZnVuY3Rpb25zIGFuZCBwcm9wZXJ0aWVzIG5lY2Vzc2FyeSB0byBpbnN0YW50
aWF0ZQ0KPj4gdGhlIG9iamVjdA0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBFbGVuYSBVZmltdHNl
dmEgPGVsZW5hLnVmaW10c2V2YUBvcmFjbGUuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSm9obiBH
IEpvaG5zb24gPGpvaG4uZy5qb2huc29uQG9yYWNsZS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBK
YWdhbm5hdGhhbiBSYW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+DQo+PiAtLS0NCj4+IHFhcGkv
cW9tLmpzb24gfCAyMCArKystDQo+PiBpbmNsdWRlL2h3L3JlbW90ZS9tYWNoaW5lLmggfCAyICsN
Cj4+IGh3L3JlbW90ZS9tYWNoaW5lLmMgfCAyNyArKysrKw0KPj4gaHcvcmVtb3RlL3ZmaW8tdXNl
ci1vYmouYyB8IDIxMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+IE1B
SU5UQUlORVJTIHwgMSArDQo+PiBody9yZW1vdGUvbWVzb24uYnVpbGQgfCAxICsNCj4+IGh3L3Jl
bW90ZS90cmFjZS1ldmVudHMgfCAzICsNCj4+IDcgZmlsZXMgY2hhbmdlZCwgMjYyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgaHcvcmVtb3RlL3Zm
aW8tdXNlci1vYmouYw0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvcWFwaS9xb20uanNvbiBiL3FhcGkv
cW9tLmpzb24NCj4+IGluZGV4IGVlYjUzOTVmZjMuLjU4MmRlZjA1MjIgMTAwNjQ0DQo+PiAtLS0g
YS9xYXBpL3FvbS5qc29uDQo+PiArKysgYi9xYXBpL3FvbS5qc29uDQo+PiBAQCAtNzAzLDYgKzcw
MywyMCBAQA0KPj4geyAnc3RydWN0JzogJ1JlbW90ZU9iamVjdFByb3BlcnRpZXMnLA0KPj4gJ2Rh
dGEnOiB7ICdmZCc6ICdzdHInLCAnZGV2aWQnOiAnc3RyJyB9IH0NCj4+IA0KPj4gKyMjDQo+PiAr
IyBAVmZpb1VzZXJTZXJ2ZXJQcm9wZXJ0aWVzOg0KPj4gKyMNCj4+ICsjIFByb3BlcnRpZXMgZm9y
IHgtdmZpby11c2VyLXNlcnZlciBvYmplY3RzLg0KPj4gKyMNCj4+ICsjIEBzb2NrZXQ6IHNvY2tl
dCB0byBiZSB1c2VkIGJ5IHRoZSBsaWJ2ZmlvLXVzZXIgbGlicmFyeQ0KPj4gKyMNCj4+ICsjIEBk
ZXZpY2U6IHRoZSBpZCBvZiB0aGUgZGV2aWNlIHRvIGJlIGVtdWxhdGVkIGF0IHRoZSBzZXJ2ZXIN
Cj4gDQo+IFN1Z2dlc3QgInRoZSBJRCIsIGJlY2F1c2UgImlkIiBpcyBub3QgYSB3b3JkLg0KPiAN
Cj4gV2hhdCBraW5kIG9mIElEIGlzIHRoaXM/IFRoZSBraW5kIHNldCB3aXRoIC1kZXZpY2UgaWQ9
Li4uPw0KDQpZZXMsIGl04oCZcyB0aGUg4oCcaWTigJ0gc3ViLW9wdGlvbiBvZiB0aGUg4oCcLWRl
dmljZeKAnSBvcHRpb24uIFdpbGwgdXBkYXRlIHRoaXMgY29tbWVudC4NCg0KVGhhbmsgeW91IQ0K
LS0NCkphZw0KDQo+IA0KPj4gKyMNCj4+ICsjIFNpbmNlOiA3LjENCj4+ICsjIw0KPj4gK3sgJ3N0
cnVjdCc6ICdWZmlvVXNlclNlcnZlclByb3BlcnRpZXMnLA0KPj4gKyAnZGF0YSc6IHsgJ3NvY2tl
dCc6ICdTb2NrZXRBZGRyZXNzJywgJ2RldmljZSc6ICdzdHInIH0gfQ0KPj4gKw0KPj4gIyMNCj4+
ICMgQFJuZ1Byb3BlcnRpZXM6DQo+PiAjDQo+PiBAQCAtODQyLDcgKzg1Niw4IEBADQo+PiAndGxz
LWNyZWRzLXBzaycsDQo+PiAndGxzLWNyZWRzLXg1MDknLA0KPj4gJ3Rscy1jaXBoZXItc3VpdGVz
JywNCj4+IC0geyAnbmFtZSc6ICd4LXJlbW90ZS1vYmplY3QnLCAnZmVhdHVyZXMnOiBbICd1bnN0
YWJsZScgXSB9DQo+PiArIHsgJ25hbWUnOiAneC1yZW1vdGUtb2JqZWN0JywgJ2ZlYXR1cmVzJzog
WyAndW5zdGFibGUnIF0gfSwNCj4+ICsgeyAnbmFtZSc6ICd4LXZmaW8tdXNlci1zZXJ2ZXInLCAn
ZmVhdHVyZXMnOiBbICd1bnN0YWJsZScgXSB9DQo+PiBdIH0NCj4+IA0KPj4gIyMNCj4+IEBAIC05
MDUsNyArOTIwLDggQEANCj4+ICd0bHMtY3JlZHMtcHNrJzogJ1Rsc0NyZWRzUHNrUHJvcGVydGll
cycsDQo+PiAndGxzLWNyZWRzLXg1MDknOiAnVGxzQ3JlZHNYNTA5UHJvcGVydGllcycsDQo+PiAn
dGxzLWNpcGhlci1zdWl0ZXMnOiAnVGxzQ3JlZHNQcm9wZXJ0aWVzJywNCj4+IC0gJ3gtcmVtb3Rl
LW9iamVjdCc6ICdSZW1vdGVPYmplY3RQcm9wZXJ0aWVzJw0KPj4gKyAneC1yZW1vdGUtb2JqZWN0
JzogJ1JlbW90ZU9iamVjdFByb3BlcnRpZXMnLA0KPj4gKyAneC12ZmlvLXVzZXItc2VydmVyJzog
J1ZmaW9Vc2VyU2VydmVyUHJvcGVydGllcycNCj4+IH0gfQ0KPj4gDQo+PiAjIw0KPiANCj4gWy4u
Ll0NCg0K

