Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9AA51C106
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 15:41:59 +0200 (CEST)
Received: from localhost ([::1]:47470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmbjz-00063j-0z
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 09:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nmbi1-0003gU-4l
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:39:57 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:40700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nmbhx-0005SI-JC
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:39:55 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245DEWDK018680;
 Thu, 5 May 2022 13:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=dNx58GD1jCh98VlIebSRpItvL68Dm4Jp9IWC3GViwW8=;
 b=YRmu7FL3jMrgVbyUPlaGgzvXmErBpYIQ/e9UtvYyuE1/+2g8wkxb3NpEn+JsVhJGVRu5
 F6OQ5t+8jzpQ/ehCfgK/gvH50az3rE1UQ9T16nEYbTtuUlFIbIoxxopkimf8K/5uv6Vi
 aenQ+XCTDE+gtxFH58fIfZPZosAfD2n/CI3ti6thSibvzYO3jQubm2xruVKgvRF4tN/j
 A+Qegfqd7WD9n1hQMjZL3MindprOz4eNE016Oj+GurslcLgBITr4ROklUDl8kQFXkOas
 kSyfOBRfWZq8lz8qTU/S7z9iXsw9pqKCb0VJAaf6oDBHVouzjvObxro3ozkIDGEUPBFV Uw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frwntbee1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 May 2022 13:39:44 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245DaY5c035410; Thu, 5 May 2022 13:39:43 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fus8y26f6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 May 2022 13:39:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQ9VBuZK38fcIZMme9T+tX9MgJtbCU+BZ4A2zDnxaXFtBOw44dCsqYh39q8Doij7PATAVuA6VnZc/hFGaHePXYeUxxVv4Go7B0TI13EgP7S0Rn5+yOPPT4dFsSgQjOlYwgv3Upp8pSX73XjFf48QCCdgShdmt+RTA3wY8UphCtcA1pZtVGh4ndF/gq4eAE4wK8Q0JbtbH/WZCGzc6NibllJjB3AgytkTzs+ptkAezHI7iWJgvRa+39VSfmQtCZK+9jK3AMbsYK4UtPYDnoI+VwzRJdlnhqWuiIqI6ULf9QGO0We21X315ZXhjaCUXGwFmzKCboHKzQHmUMj5qz8ILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNx58GD1jCh98VlIebSRpItvL68Dm4Jp9IWC3GViwW8=;
 b=JQkci+RnKZIP8Of7AWyQQltxq8R5A7Nxs3RFEnLwJ2IeFJDG3qZCzzmtHeUCgpyohFyJzLr3CnjwtsQyiFswZixjk2x94teKsea33/0jX1/mdmlyvz3DAVydMjo6eFkItpvSM7MdkAsTe1pTIUej2qjj04PzDMaH7OSC9kQLIgkxHFfojYlqN2II24BkkjdTvFcpxIqnEuuK5YsV3bjwSxdi11j6WVZRM6w1AuAaGKzZoXpR6H0wst6A1/2ruruZGtSlgl3QVR6d3Bib2LGOwTtgmQ8rlBXulOEw8p6gX0O6MrQNvL8rX8eds30fWx2EvfLf58j4KZosF2gbOVNLgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNx58GD1jCh98VlIebSRpItvL68Dm4Jp9IWC3GViwW8=;
 b=MyOLQBF4eUm+9reY66nTv6sKg+JxfuXUtMj4mz/59d1ATkknj5CtvOgXCwEjOjqyfY603S/UHPZrUuvHvWua+17UpAY7sY3sYQtw//u0okn5H5WgzHLIcvJEvHK4ZfffIfqz/eqmaUatbZCzJlWNQjhgwG36yPQCWlPv2s8I564=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3230.namprd10.prod.outlook.com (2603:10b6:208:128::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.28; Thu, 5 May
 2022 13:39:41 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 13:39:41 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Markus Armbruster <armbru@redhat.com>
CC: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, "f4bug@amsat.org" <f4bug@amsat.org>,
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
Subject: Re: [PATCH v9 10/17] vfio-user: run vfio-user context
Thread-Topic: [PATCH v9 10/17] vfio-user: run vfio-user context
Thread-Index: AQHYXviFJ6gKC1s68E+zRCuFWJP0wa0OmjM5gAA9ZQCAARKwwYAAYuaA
Date: Thu, 5 May 2022 13:39:41 +0000
Message-ID: <A0DB61EE-A8D2-4EBB-82E7-BC5F205C7051@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
 <7350f4813b73af783965b758ecf39d0a6a76db53.1651586203.git.jag.raman@oracle.com>
 <877d717cd2.fsf@pond.sub.org>
 <86AE24D4-C203-491D-9FBF-BEE748A52E2C@oracle.com>
 <87k0b0zamn.fsf@pond.sub.org>
In-Reply-To: <87k0b0zamn.fsf@pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a511788-54d6-4099-5785-08da2e9cb4ed
x-ms-traffictypediagnostic: MN2PR10MB3230:EE_
x-microsoft-antispam-prvs: <MN2PR10MB3230D9A17B7A0EFE7F23AB4690C29@MN2PR10MB3230.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: noKtRGCFyXfsUX2v2xgEf9RX/VFSu9JPY3F5EFyR29wkUCK1PZd+w65ZD6B+Q2rtTqMnaLhllpshXDbaFk7Rl7tK1V74X8mKASvcCY1zOF6YR4+kUpE3cmqBeim2531dZV0pgGGerq8rqxd/UygJsIfk8SU/2QKfMcJLW04KvQNdLmfSrA5fepHU21j3+d+Dkm0z2PzCZI6ouRSNdjYI5CWpbSutJ5vpoPsNKpQQhe9jkIiBxVglPSg9MSmCngUVzpzRDG0ydpz03FkbCfc18PwJmT2qhNI/R5YYNsDWl4NdkAPlvZ9Dw36gykiV8kTa7d79vdnw9bpua+GPi6PxYB6fwwSssSqdtc48W8sm3Ftx7Dggh4hD6ozTNtPcd14qEA/xAmnVRWfq/WzADbClYmytdrRwdjvfeodl9zfeK2JFGKex5nBhEmBXBFAlsMg6h3OlKfJ+KqNRP2zEHh7xAouOD/feUEjuBg+BJ1+ZAv1DoZ/Hd+KyZC7woFmXGtle7MoQML9xNA55NONzY5G4QxmouN87GXnZz2wy5SeACKemdRysbyLvWPXhQ2L6z3pw2vOUW4JmDg48qH3l15QpWm18zhvyHDO5DlGHvAQr2htj+0Zok/D7ob7Ih3j6yw6IRnm/RnBfgUzZAngVILh3hBWefO1Hq6BDBOm+VF87j8D3aa0eQPoUjF5UvTsvkQRkQiCR3jelgBYUJJv8CCRKn6k4dV2auLWbMnqMveuu+4c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(71200400001)(38070700005)(44832011)(38100700002)(5660300002)(508600001)(7416002)(122000001)(6486002)(33656002)(8936002)(107886003)(6512007)(2616005)(83380400001)(53546011)(86362001)(66946007)(2906002)(6506007)(36756003)(186003)(76116006)(4326008)(8676002)(66446008)(66476007)(91956017)(64756008)(66556008)(6916009)(54906003)(316002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K05jUDJZZUJvVGhUL2pPVnd0OEJyOVdjNzM2UnIvbitQODk2OTg0SHNwYlZq?=
 =?utf-8?B?a29FaXNXaGRVWnMvSHlRNlB0NWl2RC9Cb21UR3FhRWNvU2VPTzRZZkk2YUov?=
 =?utf-8?B?dVRwZnRiWTdBTDlKYitJeXg2YWszSXlTWHRJeFVFcFlqVzlVYWErMEtzYTA1?=
 =?utf-8?B?NjJTb2dZdHU3UUxHTGRlYzFNbk5pSlNmRHE3WjBvTkE4cmo3OXRDZ1VPS2g1?=
 =?utf-8?B?ME8rN3JmNEgyeWtDK3lJY2ZJWlZzbk5JbUtZV0ZiQ09BR09qbUpMSXc3VE1m?=
 =?utf-8?B?TlJXYUlJMXVCTnJ6VnN2MVhQWlYrU0VWWnpOMGd1SUNEcmVla3lnaXR5R3di?=
 =?utf-8?B?YTdQL2d4ZHJLc0djd01lTEQwRDVCU0hHTmt1QkFXbjg3RG00NURna2IwQ2Qx?=
 =?utf-8?B?UXhCNjF3YnlZNW44T3BRb0RpdWdrNDN5dEt6ZlVWeUNTdGNQVW1mWURVeThH?=
 =?utf-8?B?S1JFUjRRYWI5Vk1MbW15ZzdNcHNBWnBPU1paa2RneDhDekxlZTRGN1JXR0FV?=
 =?utf-8?B?KzNBbVFLRlFXSm55dEJvTTVNU1BvUGloeU5Tek9oT3VueU9FbXA4WU0wSVRn?=
 =?utf-8?B?eWl3WGVkdE41aHg1SGpsUFQwdWNhemxHbnNHNldkZEszM0RvTHZZUE5TNy9G?=
 =?utf-8?B?aVdMR2V6QS8ycTYvQitOQTJoZU1GcnVPb2I1WnR1b1crYVFkODJxMzYyVzg2?=
 =?utf-8?B?VDdvOHFHZE5wK0FPWktXUUhxUXBYNmNpUmtTZDVZemx0ajZ1WlBGaE43L2pK?=
 =?utf-8?B?NXoySWRxZnA3TFd6RjZDaFBGZ0RQSVJ0Q1hMakpVbngrMmJreTZWNEFqekY1?=
 =?utf-8?B?Z0FHS3NSbDF0N1JvOXRtN3F4cnNESk5uTFc4V3ZaMVN0YkRGWVpSZkZvaDlK?=
 =?utf-8?B?cDVmUVpCYys3R2RRa3VjVDhqTkVHV2dZTzE0N29LTEZhaUhhUDczS3JCb2U3?=
 =?utf-8?B?M1ZESnJSSC9UMkN0NXJUSm1iUzFBRjFJSlcrYVkwVS9HcEVYNE1ESUVmSXpx?=
 =?utf-8?B?L0g5M2swWG01YTE3b05aMDRGM1JQcmZFSWRNOXUwb2ErZ0NVdG4reS9KMTlF?=
 =?utf-8?B?V3laSXM4TjR1TDlzc29JWTl1MUZOVVZjRHBzdGZBb3AzeHVOeTNVbnMreVRO?=
 =?utf-8?B?cnErcUVPbzY3Y0FvSUp4aVhLUXVZR2hoaFFLR3QzcXMyQW5ISHkyeFZHeWlh?=
 =?utf-8?B?SDZZaUcySmNReVdXYnFRVU83SnIybk4zSmQ1dC9Wbm1ZT2VnN0xubWo0MkFP?=
 =?utf-8?B?WCtHWE41OEpRcjF6UHo0cW5UeWFnQUFSVk1rZGpzUHVwd0FrR2toUmpPWXQ2?=
 =?utf-8?B?RnlucFREMFAvcTBxenBkT2lmQWtmdk95YjNhMENDQTlvS2hUODhLTmJMRHFQ?=
 =?utf-8?B?bS95UUNaeDZHYXAxbDFJZFAxS1dQdUVWUitkRGI4ZkxmM05SckV0YndLc1JG?=
 =?utf-8?B?VHEvaHpXR3BqZVBqWUlFUmw3ZDNTeUUwVTlrSC8vMmxhdGc4VTVCdkx0dTgr?=
 =?utf-8?B?N3gvODVYOGhUaWxYS3h3d1RYSFJOcUg4OWlQdVdVK2Vla0hmSFFhWjNkSTQz?=
 =?utf-8?B?RGpHbzJVdUVaTG9ISHhIT292ekt0eTVJUW5PbzFKYktua1lvcHJxSE55blVM?=
 =?utf-8?B?RHNNTzg1Uzg3Q0JFL3JLZ0t3eDJJaWdaSEdER1VPVk1QYjZRTldpb1psR3ZJ?=
 =?utf-8?B?VzVldEdHalRpWVR3VEMzZ3ZXRHh5Q1FGRXpBRmxwMEk3R0hJK3dkbWhNZnFH?=
 =?utf-8?B?YVBSWDRTeUJRbEtOLzRqZjlPL0J3RE8zVU9obmwwdWZqaTJGcitXdU9Dc2JN?=
 =?utf-8?B?M2tSNG9ZSjlKZ0c0T3BYb0RNb3FnODdieTA3ZkdWUzBrSk1oR0xsMGJCMW4w?=
 =?utf-8?B?ZTArYnFRbE03U1d4WTVwUnhaVDJGeE9OaFUyem1oUjJhdlZFbU91MFdCVDFE?=
 =?utf-8?B?RWR5alNRY1pHQnRPUVZFeHNxRjcxN1hJclR2dnpFRVVpcEVrL25kWDFOOTFV?=
 =?utf-8?B?MVQ1SUNlR1haeG5UaXhNd0hwMDhqbk5meHBOdHM1U2xud0lSdFhHYWlTRHkv?=
 =?utf-8?B?TyszTVFNMGFIWmRSbGdRWUxtU1JrdUxueWFvMXRVMXJJUWZCZTZpdTZrVHZ5?=
 =?utf-8?B?ekdiNHEzTmZZMXhHVW5jNkdyNkVNbFNEYlNjT2VoeTJtOTYzbCtCTitVY2xu?=
 =?utf-8?B?WTFaY0ZIVFR5YlNUU3UwU2w3MzVJd2J6MC9wQW1xZVF0ekNNbVo1dWhUWlBR?=
 =?utf-8?B?dDBjN2pSaDFwaTZnK29tcVhkVmdmWmxnTk5NSS8vYlZxRlB0VVBZRFdVTGJE?=
 =?utf-8?B?VCtPRjdpUkJZVHoyTmluTDFFWENZUGZhS3dmYTZiTW9ZUTJERktBT1VGTGFH?=
 =?utf-8?Q?H9RhNTqkNoh7ZdxHDa8oWvBbzjHouvOYc+iEC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E091DBDDC611FF4B969728ED5923B673@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a511788-54d6-4099-5785-08da2e9cb4ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2022 13:39:41.1263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AX5v3/xS4R5JQhLsmMlT5+Dq919mEPSHt0haYdGEdG2VjTuFkTnhuJFxRpaeZgIdJb2nFP/gSI1MkIsp9wibkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3230
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_05:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050099
X-Proofpoint-ORIG-GUID: sQfyL3zmwrzR1DVWTPkBN0UXRAkbD0l2
X-Proofpoint-GUID: sQfyL3zmwrzR1DVWTPkBN0UXRAkbD0l2
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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

DQoNCj4gT24gTWF5IDUsIDIwMjIsIGF0IDM6NDQgQU0sIE1hcmt1cyBBcm1icnVzdGVyIDxhcm1i
cnVAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBKYWcgUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUu
Y29tPiB3cml0ZXM6DQo+IA0KPj4+IE9uIE1heSA0LCAyMDIyLCBhdCA3OjQyIEFNLCBNYXJrdXMg
QXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IEphZ2FubmF0
aGFuIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNvbT4gd3JpdGVzOg0KPj4+IA0KPj4+PiBTZXR1
cCBhIGhhbmRsZXIgdG8gcnVuIHZmaW8tdXNlciBjb250ZXh0LiBUaGUgY29udGV4dCBpcyBkcml2
ZW4gYnkNCj4+Pj4gbWVzc2FnZXMgdG8gdGhlIGZpbGUgZGVzY3JpcHRvciBhc3NvY2lhdGVkIHdp
dGggaXQgLSBnZXQgdGhlIGZkIGZvcg0KPj4+PiB0aGUgY29udGV4dCBhbmQgaG9vayB1cCB0aGUg
aGFuZGxlciB3aXRoIGl0DQo+Pj4+IA0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBFbGVuYSBVZmltdHNl
dmEgPGVsZW5hLnVmaW10c2V2YUBvcmFjbGUuY29tPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKb2hu
IEcgSm9obnNvbiA8am9obi5nLmpvaG5zb25Ab3JhY2xlLmNvbT4NCj4+Pj4gU2lnbmVkLW9mZi1i
eTogSmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPg0KPj4+PiBSZXZpZXdl
ZC1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPg0KPj4+PiAtLS0NCj4+
Pj4gcWFwaS9taXNjLmpzb24gfCAzMCArKysrKysrKysrKw0KPj4+PiBody9yZW1vdGUvdmZpby11
c2VyLW9iai5jIHwgMTAyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+
Pj4+IDIgZmlsZXMgY2hhbmdlZCwgMTMxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+
Pj4gDQo+Pj4+IGRpZmYgLS1naXQgYS9xYXBpL21pc2MuanNvbiBiL3FhcGkvbWlzYy5qc29uDQo+
Pj4+IGluZGV4IGI4M2NjMzkwMjkuLmZhNDlmMjg3NmEgMTAwNjQ0DQo+Pj4+IC0tLSBhL3FhcGkv
bWlzYy5qc29uDQo+Pj4+ICsrKyBiL3FhcGkvbWlzYy5qc29uDQo+Pj4+IEBAIC01NTMsMyArNTUz
LDMzIEBADQo+Pj4+ICMjDQo+Pj4+IHsgJ2V2ZW50JzogJ1JUQ19DSEFOR0UnLA0KPj4+PiAnZGF0
YSc6IHsgJ29mZnNldCc6ICdpbnQnLCAncW9tLXBhdGgnOiAnc3RyJyB9IH0NCj4+Pj4gKw0KPj4+
PiArIyMNCj4+Pj4gKyMgQFZGVV9DTElFTlRfSEFOR1VQOg0KPj4+PiArIw0KPj4+PiArIyBFbWl0
dGVkIHdoZW4gdGhlIGNsaWVudCBvZiBhIFRZUEVfVkZJT19VU0VSX1NFUlZFUiBjbG9zZXMgdGhl
DQo+Pj4+ICsjIGNvbW11bmljYXRpb24gY2hhbm5lbA0KPj4+PiArIw0KPj4+PiArIyBAdmZ1LWlk
OiBJRCBvZiB0aGUgVFlQRV9WRklPX1VTRVJfU0VSVkVSIG9iamVjdA0KPj4+PiArIw0KPj4+PiAr
IyBAdmZ1LXFvbS1wYXRoOiBwYXRoIHRvIHRoZSBUWVBFX1ZGSU9fVVNFUl9TRVJWRVIgb2JqZWN0
IGluIHRoZSBRT00gdHJlZQ0KPj4+PiArIw0KPj4+PiArIyBAZGV2LWlkOiBJRCBvZiBhdHRhY2hl
ZCBQQ0kgZGV2aWNlDQo+Pj4+ICsjDQo+Pj4+ICsjIEBkZXYtcW9tLXBhdGg6IHBhdGggdG8gYXR0
YWNoZWQgUENJIGRldmljZSBpbiB0aGUgUU9NIHRyZWUNCj4+PiANCj4+PiBJJ20gc3RpbGwgdW5z
dXJlIHdoYXQga2luZChzKSBvZiBJRCBAdmZ1LWlkIGFuZCBAZGV2LWlkIGFyZS4gU2VlIGJlbG93
Lg0KPj4gDQo+PiBJ4oCZbSBub3Qgc3VyZSB3aGF0IHlvdSBtZWFuIGJ5IGtpbmQgb2YgSUQgLSBJ
IHRob3VnaHQgb2YgSUQgYXMgYQ0KPj4gdW5pcXVlIHN0cmluZy4gSeKAmWxsIHRyeSBteSBiZXN0
IHRvIGV4cGxhaW4uDQo+IA0KPiBPa2F5LCBsZXQgbWUgdHJ5IHRvIGNsYXJpZnkuDQo+IA0KPiBX
ZSBoYXZlIG1hbnksIG1hbnkgSUQgbmFtZXNwYWNlcywgZWFjaCBhc3NvY2lhdGVkIHdpdGggYSBj
ZXJ0YWluIGtpbmQgb2YNCj4gb2JqZWN0OiBkZXZpY2UgSURzIGZvciBUWVBFX0RFVklDRSwgb2Jq
ZWN0IElEcyBmb3IgVFlQRV9PQkpFQ1QNCj4gaW1wbGVtZW50aW5nIFRZUEVfVVNFUl9DUkVBVEFC
TEUpLCBibG9jayBiYWNrZW5kIG5vZGUgbmFtZXMgZm9yDQo+IEJsb2NrRHJpdmVyU3RhdGUsIC4u
Lg0KPiANCj4gQXNpZGU6IEkgYmVsaWV2ZSBhIHNpbmdsZSBuYW1lc3BhY2Ugd291bGQgaGF2ZSBi
ZWVuIGEgd2lzZXIgZGVzaWduDQo+IGNob2ljZSwgYnV0IHRoYXQgc2hpcCBzYWlsZWQgbG9uZyBh
Z28uDQo+IA0KPiBUbyB3aGljaCBvZiB0aGVzZSBuYW1lc3BhY2VzIGRvIHRoZXNlIHR3byBJRHMg
YmVsb25nLCByZXNwZWN0aXZlbHk/DQo+IA0KPj4gZGV2LWlkIGFuZCB2ZnUtaWQgYXJlIHRoZSDi
gJxpZCIgc3ViLW9wdGlvbnMgb2Yg4oCcLWRldmljZeKAnSBhbmQg4oCcLW9iamVjdOKAnSBjb21t
YW5kLWxpbmUNCj4+IG9wdGlvbnMgcmVzcGVjdGl2ZWx5Lg0KPiANCj4gVGhpcyBhbnN3ZXJzIG15
IHF1ZXN0aW9uLg0KPiANCj4+ICJkZXYtaWTigJ0gaXMgdGhlIOKAnGlk4oCdIG1lbWJlciBvZiDi
gJxEZXZpY2VTdGF0ZeKAnSB3aGljaCBRRU1VIHNldHMgdXNpbmcNCj4+IHFkZXZfc2V0X2lkKCkg
d2hlbiB0aGUgZGV2aWNlIGlzIGFkZGVkLiANCj4+IA0KPj4gVGhlIE9iamVjdCBJRCAodmZ1LWlk
IGluIHRoaXMgY2FzZSkgaXMgYSBiaXQgdHJpY2t5LiBJdOKAmXMgYWxzbyB0aGUg4oCcaWTigJ0N
Cj4+IGNvbW1hbmQtbGluZSBzdWItb3B0aW9uLCBidXQgUUVNVSBzdG9yZXMgaXQgYXMgYSBjaGls
ZCBwcm9wZXJ0eQ0KPj4gb2YgdGhlIHBhcmVudCBvYmplY3QuDQo+PiANCj4+PiANCj4+Pj4gKyMN
Cj4+Pj4gKyMgU2luY2U6IDcuMQ0KPj4+PiArIw0KPj4+PiArIyBFeGFtcGxlOg0KPj4+PiArIw0K
Pj4+PiArIyA8LSB7ICJldmVudCI6ICJWRlVfQ0xJRU5UX0hBTkdVUCIsDQo+Pj4+ICsjICJkYXRh
IjogeyAidmZ1LWlkIjogInZmdTEiLA0KPj4+PiArIyAidmZ1LXFvbS1wYXRoIjogIi9vYmplY3Rz
L3ZmdTEiLA0KPj4+PiArIyAiZGV2LWlkIjogInNhczEiLA0KPj4+PiArIyAiZGV2LXFvbS1wYXRo
IjogIi9tYWNoaW5lL3BlcmlwaGVyYWwvc2FzMSIgfSwNCj4+Pj4gKyMgInRpbWVzdGFtcCI6IHsg
InNlY29uZHMiOiAxMjY1MDQ0MjMwLCAibWljcm9zZWNvbmRzIjogNDUwNDg2IH0gfQ0KPj4+PiAr
Iw0KPj4+PiArIyMNCj4+Pj4gK3sgJ2V2ZW50JzogJ1ZGVV9DTElFTlRfSEFOR1VQJywNCj4+Pj4g
KyAnZGF0YSc6IHsgJ3ZmdS1pZCc6ICdzdHInLCAndmZ1LXFvbS1wYXRoJzogJ3N0cicsDQo+Pj4+
ICsgJ2Rldi1pZCc6ICdzdHInLCAnZGV2LXFvbS1wYXRoJzogJ3N0cicgfSB9DQo+Pj4+IGRpZmYg
LS1naXQgYS9ody9yZW1vdGUvdmZpby11c2VyLW9iai5jIGIvaHcvcmVtb3RlL3ZmaW8tdXNlci1v
YmouYw0KPj4+PiBpbmRleCAzY2E2YWEyYjQ1Li4zYTRjNmE5ZmEwIDEwMDY0NA0KPj4+PiAtLS0g
YS9ody9yZW1vdGUvdmZpby11c2VyLW9iai5jDQo+Pj4+ICsrKyBiL2h3L3JlbW90ZS92ZmlvLXVz
ZXItb2JqLmMNCj4+Pj4gQEAgLTI3LDYgKzI3LDkgQEANCj4+Pj4gKg0KPj4+PiAqIGRldmljZSAt
IGlkIG9mIGEgZGV2aWNlIG9uIHRoZSBzZXJ2ZXIsIGEgcmVxdWlyZWQgb3B0aW9uLiBQQ0kgZGV2
aWNlcw0KPj4+PiAqIGFsb25lIGFyZSBzdXBwb3J0ZWQgcHJlc2VudGx5Lg0KPj4+PiArICoNCj4+
Pj4gKyAqIG5vdGVzIC0geC12ZmlvLXVzZXItc2VydmVyIGNvdWxkIGJsb2NrIElPIGFuZCBtb25p
dG9yIGR1cmluZyB0aGUNCj4+Pj4gKyAqIGluaXRpYWxpemF0aW9uIHBoYXNlLg0KPj4+PiAqLw0K
Pj4+PiANCj4+Pj4gI2luY2x1ZGUgInFlbXUvb3NkZXAuaCINCj4+Pj4gQEAgLTQwLDExICs0Mywx
NCBAQA0KPj4+PiAjaW5jbHVkZSAiaHcvcmVtb3RlL21hY2hpbmUuaCINCj4+Pj4gI2luY2x1ZGUg
InFhcGkvZXJyb3IuaCINCj4+Pj4gI2luY2x1ZGUgInFhcGkvcWFwaS12aXNpdC1zb2NrZXRzLmgi
DQo+Pj4+ICsjaW5jbHVkZSAicWFwaS9xYXBpLWV2ZW50cy1taXNjLmgiDQo+Pj4+ICNpbmNsdWRl
ICJxZW11L25vdGlmeS5oIg0KPj4+PiArI2luY2x1ZGUgInFlbXUvdGhyZWFkLmgiDQo+Pj4+ICNp
bmNsdWRlICJzeXNlbXUvc3lzZW11LmgiDQo+Pj4+ICNpbmNsdWRlICJsaWJ2ZmlvLXVzZXIuaCIN
Cj4+Pj4gI2luY2x1ZGUgImh3L3FkZXYtY29yZS5oIg0KPj4+PiAjaW5jbHVkZSAiaHcvcGNpL3Bj
aS5oIg0KPj4+PiArI2luY2x1ZGUgInFlbXUvdGltZXIuaCINCj4+Pj4gDQo+Pj4+ICNkZWZpbmUg
VFlQRV9WRlVfT0JKRUNUICJ4LXZmaW8tdXNlci1zZXJ2ZXIiDQo+Pj4+IE9CSkVDVF9ERUNMQVJF
X1RZUEUoVmZ1T2JqZWN0LCBWZnVPYmplY3RDbGFzcywgVkZVX09CSkVDVCkNCj4+Pj4gQEAgLTg2
LDYgKzkyLDggQEAgc3RydWN0IFZmdU9iamVjdCB7DQo+Pj4+IFBDSURldmljZSAqcGNpX2RldjsN
Cj4+Pj4gDQo+Pj4+IEVycm9yICp1bnBsdWdfYmxvY2tlcjsNCj4+Pj4gKw0KPj4+PiArIGludCB2
ZnVfcG9sbF9mZDsNCj4+Pj4gfTsNCj4+Pj4gDQo+Pj4+IHN0YXRpYyB2b2lkIHZmdV9vYmplY3Rf
aW5pdF9jdHgoVmZ1T2JqZWN0ICpvLCBFcnJvciAqKmVycnApOw0KPj4+PiBAQCAtMTY0LDYgKzE3
Miw3NiBAQCBzdGF0aWMgdm9pZCB2ZnVfb2JqZWN0X3NldF9kZXZpY2UoT2JqZWN0ICpvYmosIGNv
bnN0IGNoYXIgKnN0ciwgRXJyb3IgKiplcnJwKQ0KPj4+PiB2ZnVfb2JqZWN0X2luaXRfY3R4KG8s
IGVycnApOw0KPj4+PiB9DQo+Pj4+IA0KPj4+PiArc3RhdGljIHZvaWQgdmZ1X29iamVjdF9jdHhf
cnVuKHZvaWQgKm9wYXF1ZSkNCj4+Pj4gK3sNCj4+Pj4gKyBWZnVPYmplY3QgKm8gPSBvcGFxdWU7
DQo+Pj4+ICsgY29uc3QgY2hhciAqdmZ1X2lkOw0KPj4+PiArIGNoYXIgKnZmdV9wYXRoLCAqcGNp
X2Rldl9wYXRoOw0KPj4+PiArIGludCByZXQgPSAtMTsNCj4+Pj4gKw0KPj4+PiArIHdoaWxlIChy
ZXQgIT0gMCkgew0KPj4+PiArIHJldCA9IHZmdV9ydW5fY3R4KG8tPnZmdV9jdHgpOw0KPj4+PiAr
IGlmIChyZXQgPCAwKSB7DQo+Pj4+ICsgaWYgKGVycm5vID09IEVJTlRSKSB7DQo+Pj4+ICsgY29u
dGludWU7DQo+Pj4+ICsgfSBlbHNlIGlmIChlcnJubyA9PSBFTk9UQ09OTikgew0KPj4+PiArIHZm
dV9pZCA9IG9iamVjdF9nZXRfY2Fub25pY2FsX3BhdGhfY29tcG9uZW50KE9CSkVDVChvKSk7DQo+
Pj4+ICsgdmZ1X3BhdGggPSBvYmplY3RfZ2V0X2Nhbm9uaWNhbF9wYXRoKE9CSkVDVChvKSk7DQo+
Pj4gDQo+Pj4gSG1tLiBAdmZ1X2lkIGlzIGFsd2F5cyB0aGUgbGFzdCBjb21wb25lbnQgb2YgQHZm
dV9wYXRoLiBXaHkgZG8gd2UgbmVlZA0KPj4+IHRvIHNlbmQgYm90aD8NCj4+IA0KPj4gdmZ1X2lk
IGlzIHRoZSBJRCB0aGF0IHRoZSB1c2VyL09yY2hlc3RyYXRvciBwYXNzZWQgYXMgYSBjb21tYW5k
LWxpbmUgb3B0aW9uDQo+PiBkdXJpbmcgYWRkaXRpb24vY3JlYXRpb24uIFNvIGl0IG1hZGUgc2Vu
c2UgdG8gcmVwb3J0IGJhY2sgd2l0aCB0aGUgc2FtZSBJRA0KPj4gdGhhdCB0aGV5IHVzZWQuIEJ1
dCBJ4oCZbSBPSyB3aXRoIGRyb3BwaW5nIHRoaXMgaWYgdGhhdOKAmXMgd2hhdCB5b3UgcHJlZmVy
Lg0KPiANCj4gTWF0dGVyIG9mIHRhc3RlLCBJIGd1ZXNzLiAgSSdkIGRyb3AgaXQgc2ltcGx5IHRv
IHNhdmVzIHVzIHRoZSB0cm91YmxlIG9mDQo+IGRvY3VtZW50aW5nIGl0Lg0KPiANCj4gSWYgd2Ug
ZGVjaWRlIHRvIGtlZXAgaXQsIHRoZW4gSSB0aGluayB3ZSBzaG91bGQgZG9jdW1lbnQgaXQncyBh
bHdheXMgdGhlDQo+IGxhc3QgY29tcG9uZW50IG9mIEB2ZnVfcGF0aC4NCj4gDQo+Pj4+ICsgZ19h
c3NlcnQoby0+cGNpX2Rldik7DQo+Pj4+ICsgcGNpX2Rldl9wYXRoID0gb2JqZWN0X2dldF9jYW5v
bmljYWxfcGF0aChPQkpFQ1Qoby0+cGNpX2RldikpOw0KPj4+PiArIHFhcGlfZXZlbnRfc2VuZF92
ZnVfY2xpZW50X2hhbmd1cCh2ZnVfaWQsIHZmdV9wYXRoLA0KPj4+PiArIG8tPmRldmljZSwgcGNp
X2Rldl9wYXRoKTsNCj4+PiANCj4+PiBXaGVyZSBpcyBvLT5kZXZpY2Ugc2V0PyBJJ20gYXNraW5n
IGJlY2F1c2UgSSBpdCBtdXN0IG5vdCBiZSBudWxsIGhlcmUsDQo+Pj4gYW5kIHRoYXQncyBub3Qg
bG9jYWxseSBvYnZpb3VzLg0KPj4gDQo+PiBZZWFoLCBpdOKAmXMgbm90IG9idmlvdXMgZnJvbSB0
aGlzIHBhdGNoIHRoYXQgby0+ZGV2aWNlIGlzIGd1YXJhbnRlZWQgdG8gYmUNCj4+IG5vbi1OVUxM
LiBJdOKAmXMgc2V0IGJ5IHZmdV9vYmplY3Rfc2V0X2RldmljZSgpLiBQbGVhc2Ugc2VlIHRoZSBm
b2xsb3dpbmcNCj4+IHBhdGNoZXMgaW4gdGhlIHNlcmllczoNCj4+IHZmaW8tdXNlcjogZGVmaW5l
IHZmaW8tdXNlci1zZXJ2ZXIgb2JqZWN0DQo+PiB2ZmlvLXVzZXI6IGluc3RhbnRpYXRlIHZmaW8t
dXNlciBjb250ZXh0DQo+IA0KPiB2ZnVfb2JqZWN0X3NldF9kZXZpY2UoKSBpcyBhIFFPTSBwcm9w
ZXJ0eSBzZXR0ZXIuICBJdCBnZXRzIGNhbGxlZCBpZiBhbmQNCj4gb25seSBpZiB0aGUgcHJvcGVy
dHkgaXMgc2V0LiAgSWYgaXQncyBuZXZlciBzZXQsIC0+ZGV2aWNlIHJlbWFpbnMgbnVsbC4NCj4g
V2hhdCBlbnN1cmVzIGl0J3MgYWx3YXlzIHNldD8NCg0KVGhhdOKAmXMgYSBnb29kIHF1ZXN0aW9u
IC0gaXTigJlzIG5vdCBvYnZpb3VzIGZyb20gdGhpcyBwYXRjaC4NCg0KVGhlIGNvZGUgd291bGQg
bm90IHJlYWNoIGhlcmUgaWYgby0+ZGV2aWNlIGlzIG5vdCBzZXQuIElmIG8tPmRldmljZSBpcyBO
VUxMLA0KdmZ1X29iamVjdF9pbml0X2N0eCgpIHdvdWxkIGJhaWwgb3V0IGVhcmx5IHdpdGhvdXQg
c2V0dGluZyB1cA0KdmZ1X29iamVjdF9hdHRhY2hfY3R4KCkgYW5kIHZmdV9vYmplY3RfY3R4X3J1
bigpICh0aGlzIGZ1bmN0aW9uKSBoYW5kbGVycy4NCg0KQWxzbywgZGV2aWNlIGlzIGEgcmVxdWly
ZWQgcGFyYW1ldGVyLiBRRU1VIHdvdWxkIG5vdCBpbml0aWFsaXplIHRoaXMgb2JqZWN0DQp3aXRo
b3V0IGl0LiBQbGVhc2Ugc2VlIHRoZSBkZWZpbml0aW9uIG9mIFZmaW9Vc2VyU2VydmVyUHJvcGVy
dGllcyBpbiB0aGUNCmZvbGxvd2luZyBwYXRjaCAtIG5vdGluZyB0aGF0IG9wdGlvbmFsIHBhcmFt
ZXRlcnMgYXJlIHByZWZpeGVkIHdpdGggYSDigJgq4oCZOg0KW1BBVENIIHY5IDA3LzE3XSB2Zmlv
LXVzZXI6IGRlZmluZSB2ZmlvLXVzZXItc2VydmVyIG9iamVjdC4NCg0KTWF5IGJlIHdlIHNob3Vs
ZCBhZGQgYSBjb21tZW50IGhlcmUgdG8gZXhwbGFpbiB3aHkgby0+ZGV2aWNlDQp3b3VsZG7igJl0
IGJlIE5VTEw/DQoNClRoYW5rIHlvdSENCg0KPiANCj4+IFRoZXJl4oCZcyBhbHJlYWR5IGFuIGFz
c2VydCBmb3Igby0+cGNpX2RldiBoZXJlLCBidXQgd2UgY291bGQgYWRkIG9uZQ0KPj4gZm9yIG8t
PmRldmljZSB0b28/DQo+IA0KPiBJJ2xsIG1ha2UgdXAgbXkgbWluZCB3aGVuIEknbSBjb252aW5j
ZWQgby0+ZGV2aWNlIGNhbid0IGJlIG51bGwgaGVyZS4NCj4gDQo+PiBUaGFuayB5b3UhDQo+IA0K
PiBZb3UncmUgd2VsY29tZSENCj4gDQoNCg==

