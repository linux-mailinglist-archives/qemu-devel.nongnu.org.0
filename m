Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0C54794AA
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 20:15:40 +0100 (CET)
Received: from localhost ([::1]:57352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myIhf-00048h-5r
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 14:15:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1myIeA-000240-8g
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 14:12:05 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:9460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1myIdx-0006Ub-I9
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 14:12:00 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BHGXpcb022563; 
 Fri, 17 Dec 2021 19:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=M27rZAQKCQ88nbrq9GGWBG+uH0/7NxPJX1SXz4/RwVU=;
 b=B1Oy8XTM06rcr8zmpjyCSIPRoQ2U7u+EHj/40Hd2RuA24l0cLaUmHjy1Whn2fTH7IDsg
 mGQ99kSk2ID1LKSN6Y/K+nOMpCmx5O+3dAGjGG3n1uWlVesLu8Aoi9AhMU8vrAYOYwxf
 ewgx8a/9cCydZFzCfKkjdZFJ3UkP8//Yp+ln3Qncu9c9aiG4QG85L1dcsOlbUeu2Xu3D
 c3ebtEkBu6QJdkqk6rQDrNoqTPFbR+W38BARaVWuQtUYr+5KYgt53R7KjmGZvRie70TU
 6NkyYEf5f+DH8NNu014SZrq6pJt+Y17kE+QQnZHm/4kLskj0Wpr7YB3P3x8vhW57DfdH gw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cykmcpenf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 19:11:45 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BHJ5vD6133815;
 Fri, 17 Dec 2021 19:11:44 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by userp3020.oracle.com with ESMTP id 3cvnevwrk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 19:11:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UyaNyKlub664+blwueXuCVcHagPWXAKYSVKnsjYervfydXl4DEFwnCWIS1f2KfT+QqBLOo/ZBZqrPCJ8AyMxZJUQe5XahPuaqofz/D7AaXq70v/4lMlT0DsLCm7JvOVkBZqoh9hvTKOuZQ/EMnkl9Y1uxsE/yfM8HloWtgFlXFjJtaJvaBWqM5lPA5d4t26rQG+66l/E7dhf6S3xB8XZSGDuwerOctHQxjD2cKNvT9+h0aKXrOJznca6iglvPXHxNJm/7ELm84FgmZiDZ28GPo+voknt+MVK/CSIIyGTzmCLYcJ8GWYVUthLAogvRCkc9brr0wG70M6TmJf9NCx1Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M27rZAQKCQ88nbrq9GGWBG+uH0/7NxPJX1SXz4/RwVU=;
 b=UYz/mO9QcxWRGgwtZYCXkX6d99uXsJ7k5yUTtQPCELg8ujmum93ByV5WzGqoPEx99LA/qkmUU9qpV9uItemGqUN/i8cYvJtXQAR/3njy6TVFvlAU8hGlY1JCjzVznyZwncPHKX0FsGt+e5xDIrQqBOU2qSXDKVrstGW1P70GEgWvGUJzNLVuDrGaiouyCYrQNQKPENAMUQlRvS4WlMGqAN/uVhel7zN1qLdIQiM0pJyKywmkwX1fP+eTNWlOUYV7bUOIo5/5JGWW6YSwfBQ1BqTS2rdafAwKoZKVVHN73Qliob85ZSIiHSGdJWsXhA3RdAeXIk3XcnrPy7JaALvn0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M27rZAQKCQ88nbrq9GGWBG+uH0/7NxPJX1SXz4/RwVU=;
 b=HuY9CaKnjZERo++cfuTKXtRjNmN8tzb5f2aM37wBMotqupWu1DUtMAYULEZoHwF3jLwmoRMYe+qLcCBvhe7UilHLp2jjc0tziSML/mqso8k2hGt8D7Jq62PzAZZe78QLqxjXnY0vkFejE4/W+xexP3uSwP1Ji21Vnp2o0QoTl/4=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5188.namprd10.prod.outlook.com (2603:10b6:208:30d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Fri, 17 Dec
 2021 19:11:41 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Fri, 17 Dec 2021
 19:11:41 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4 09/14] vfio-user: handle DMA mappings
Thread-Topic: [PATCH v4 09/14] vfio-user: handle DMA mappings
Thread-Index: AQHX8YAq/ukNYblODkyOyah9xxTkB6w1HWYAgAHzcoA=
Date: Fri, 17 Dec 2021 19:11:41 +0000
Message-ID: <5F00FC83-6E02-42C5-827B-71F5467DBCD9@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <2c9baf82a342cfc4ff3d35e017908b9050faf409.1639549843.git.jag.raman@oracle.com>
 <Ybs99rFUKFBIL/Md@stefanha-x1.localdomain>
In-Reply-To: <Ybs99rFUKFBIL/Md@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1451550a-bee6-4136-1132-08d9c1910f1d
x-ms-traffictypediagnostic: BLAPR10MB5188:EE_
x-microsoft-antispam-prvs: <BLAPR10MB5188AC19734FFC7F4D99A2A990789@BLAPR10MB5188.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4T9fOLl1VLE/AIxEAl6gZdG4FMlQc1stQD0jbZRYFcCcbwqmD5VF7qrZkX0s94nWsj6FI6/86K8lzBOHtnhr77ciBxrRDXmvcnuxP4XUz9qOHFMkkSNJIgTbCeTShTn1MAwIu6HKoO3smAAXTuE1x2v07b+CahpTEXI0fqqsY/UQ7LQR6IR54L0J6s0kGHd9pj8yL6ju2Cy8xI50+MAp4LhlAGEeIY1cNbnjZpcb4jOwXAoKFftakRYCrIOLNe6M5ko/M7iAP3ksnNShdWu4UNRrEbgcpi8P13g4XH134yNxeFvPQh3dRBe5iJzKn1nlXlha4iI5+9AWczFo4b/4kToLd6iymuCRfvYDl2FyK0UJKy3flvSVnJqse9XTYJu2qFcAEc7PrKgrr8nDjBsFxZlJtI3P237Yz/1V4TtMkBkWYdmBe1G2f7fgjNMPWTp/0hRTgePly36i3aAbwPxHK5gPG3hlWgRBJfdVEXVTwtEj1zmTmcW06eU2djloDTxa+CcUKOpKEkoLTElDElquCYJkEK7ZKS3tsLIpMsSh/PKcWx7pdgJ/tCEjSsyQIapCVfXdkq+774sz5WVonuJqt3QznuIQQme8HpSgjK+23temwmP9T2B7zTk3k297qEJFBGxJKJxBrcUx6dngTDDQc2VzqxdpZiVNxy+3wEV59RM/K1ZylwgfbT+47sYI1dtD34+M6P6sn8E1dmbHAFUWqzO6sryyfZJpyBqOrgaLdTDtJ3WObTWD3rjA4PC/5tFqecbk0pQHKQGvt09l+R8bbD4Vn0TgCI8cy47z1UU2sCeCVfJAliedq3mJwMQ2A4em
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(76116006)(316002)(36756003)(4326008)(44832011)(66476007)(91956017)(54906003)(33656002)(66446008)(122000001)(86362001)(5660300002)(83380400001)(66556008)(64756008)(6512007)(966005)(6506007)(8676002)(38100700002)(38070700005)(6486002)(508600001)(186003)(71200400001)(7416002)(53546011)(2906002)(2616005)(8936002)(6916009)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3paUExwSmtWcUVudFBhV3ZCc0lsYjhiYmJOUFlHbUJ5SXd6cFVQV0U3NVhJ?=
 =?utf-8?B?WE1JbnM3Z2pSU2o2Y2RPNk95dWVpeTJvK1ZTelZ4VGhmeC92Mm1YTUZrWXpu?=
 =?utf-8?B?R1ltd3hISjFxWVdjbGlwYk9MWFNDYWFHNGtNdktMbm1uUlFxa3JoM0JVVVR4?=
 =?utf-8?B?L1JxOXVIMjNWSWNYbGQ0NEhnMDNqSFJJMlFqdTdrd05lMFd4QlFGdGs3TEZ0?=
 =?utf-8?B?SjMzWURDaEd4cGpDcGFBVmFEekNDMTBQZFY3RzVGREtuZjc1clRCdDhWUms1?=
 =?utf-8?B?WUVJNkdaVXI4MWp5V2k2Tk4yMTZaWGk4L3k5T3RLenhySVhFZzBIOTJBTHll?=
 =?utf-8?B?MHl0cjlrZ0k0dTVpaUNPdTBpVnpScU0wemVqYzdwdzF6RlY1YlZkdXhNTU9Q?=
 =?utf-8?B?MHlGSndESnh4TGhCMnNZdE13TXQxQnpmSitiMytEaDRQWStITmFPUURvbVRG?=
 =?utf-8?B?ZkpTb2ZpeWNhNUwzSXJEYVRvU0lQSERKb2pSdDZZSXhpQlhRNFRZQkI4Ly9O?=
 =?utf-8?B?dWlKWGZ6TnRoTE5ibHhkUzBjcW5zSmZXa1doRUgyZ3hYNE9zK29CY2pWUHhv?=
 =?utf-8?B?OTd3MFZpcmhOakVla2FFRjByYmRrRFF0T2lBbUxLWVhvVjVuWU5pSVJqTzU4?=
 =?utf-8?B?dzMxWDNRdDRSY2VuZTJSZWRBUUdBakdUVGFOVi9JNTd0bkpUbFN4RWwxWHB1?=
 =?utf-8?B?UjlQcm9teEs0U0ZBdWk0cGRmb1lQdXZORVNmNzNLczBLWGhIRDZkb3RmSDNn?=
 =?utf-8?B?REJoMjB2Z0NuS1BsTWtWay95WEZTYU16YStpWUZ5d0ZJUFNjcjdRbnFOak1G?=
 =?utf-8?B?eFo4d1J5RlFpdlpjOVdYZFgrTEYxRXlyYnpPNzNYNU1MYThhQmlzcTVhRHZM?=
 =?utf-8?B?WitUQnRjYldvVHZ3M09LeW1jOGx2UFNjRUhFdDBESTNudUVJWlRadko4YWl5?=
 =?utf-8?B?czBGdjA4eFA2WncyRWNTVG5nbVFKMzE5d0JpN01oOEFxMXVWcWtNRzU3UzJN?=
 =?utf-8?B?Sm1Ld0ErektYTEtpcVp6bmRDdHllNCszNWtWa0k5YlV5VzlibFpiQkVDcTBY?=
 =?utf-8?B?K29hU0FtQXlZT2xFUGJwYkxHRkQvWW1ENmlJVnFLVWZxd25ibDh2MjJITlRz?=
 =?utf-8?B?RFVaUjNEV1d5bGxaeWs0eHNZNVFYTnA1ajAvODVTNFBQcmdmRTY5WEttcTZL?=
 =?utf-8?B?N3hFcDBlN1pyTjE5SHRXZ0ZZS3VNaUVJd05yZCtLWlZxSW1vNjJuWE1EWWhk?=
 =?utf-8?B?TWZGYk9XSW43NVo0UE5OM25FbHZ1eHFjMGx4NllPb0dEZy9BSnBsR2JCYmtF?=
 =?utf-8?B?WnYyOXY4N3J3R2pRbkFidHpYY3owTDUrdkVSK1FLUHlhSlhJeUFJNzlOL3FL?=
 =?utf-8?B?bXBsVk4rSjRuWXZDQUJHVzlQai83MVFyaUtPb29zM3Z2MGtCc0RSdFVPZHpD?=
 =?utf-8?B?S2wvVENjeHNHM3pkSXVBNjUwSjZpUXJwOFVCNzFseFZtT2pSbFVhYjY4OHlR?=
 =?utf-8?B?OHlIZGY4WGZTZUxKTWFOdkR0cElzZ01PUE9IRTVvemQwNzRMOXd6QXZBR2xw?=
 =?utf-8?B?bnNrUk42ZmRVRktYdjRMU2RYVkZMQWlLM1RMSXlVMTQxTzdPQkthOHhzei9m?=
 =?utf-8?B?V1ducCtJVU92ZmJSemNJTE0zalg1U0VEMkJzNzQwd05IZjJwVnNZRzd0SWNB?=
 =?utf-8?B?NXNaZGRqLzRpRnNiZ2FRS2xCOXhIY0xxQXBRelg3Tm5NdUx0aEhVL3p6cldv?=
 =?utf-8?B?L0QvT2dpQ3hxWGZvWTN5MDRiQlBUUlh6SmZmUStnZnBYNmw2WGZLY2I2NHda?=
 =?utf-8?B?T0JPMDRRUzdLUWltblpYUzhJLzc1MWpHbVFpYTUvbjhGOWRwMzdnZDczTmZx?=
 =?utf-8?B?R0ZpSXIzVU1DYlUrTFFib1VVZ2dmaVlmSFNhUlRMMkNWQ2pZTkIvRGhiSkQ5?=
 =?utf-8?B?aTNZaVpzRmNvaURDcFpoYTRFMEh6ZFgvaGV3eXN4dDhJUFdFNlhCM0NnaHgz?=
 =?utf-8?B?WXBpdWhjamNzUDZEaGtvWDltM2pPQ0xZWDBsT3lrVGpIQi8zTjNZQ0VJNTY0?=
 =?utf-8?B?VitIVE8rNE9KbExqNkFpT0FxZ21jRjZXVjZhTHhmN21GTlB1SFdTTnNqZlFa?=
 =?utf-8?B?MUxtaUJiY21KV0Z4d3kzamFyM2JhV0Jjd0pKZzlINUdwQzNqZmt6RFY5R0Ru?=
 =?utf-8?B?cmJESWVWcG1NTnpTdHV4SE9LTElua0Y1c0ljaDM2Q2xtcmpvekJLRjlCY0tS?=
 =?utf-8?B?eThtUVlSUEVjNXpPWDBMYWhvejJRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <60932174CCCB5B4C9142366499664960@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1451550a-bee6-4136-1132-08d9c1910f1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 19:11:41.7149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sTqKzdJrWtH1j5+QaLNr2/F+tX4uCCWVZrr8ePyC/EHuiCkQtan+T84b/YyM8N0HeoJsmOSp8MI30d9rW6rpqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5188
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10201
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112170109
X-Proofpoint-ORIG-GUID: MXhicNcB7nJ0D8LuQ6sKrRiJ2OpGV4ZQ
X-Proofpoint-GUID: MXhicNcB7nJ0D8LuQ6sKrRiJ2OpGV4ZQ
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "bleal@redhat.com" <bleal@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "wainersm@redhat.com" <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 "crosa@redhat.com" <crosa@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRGVjIDE2LCAyMDIxLCBhdCA4OjI0IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBEZWMgMTUsIDIwMjEgYXQgMTA6
MzU6MzNBTSAtMDUwMCwgSmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+PiBEZWZpbmUgYW5kIHJl
Z2lzdGVyIGNhbGxiYWNrcyB0byBtYW5hZ2UgdGhlIFJBTSByZWdpb25zIHVzZWQgZm9yDQo+PiBk
ZXZpY2UgRE1BDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEVsZW5hIFVmaW10c2V2YSA8ZWxlbmEu
dWZpbXRzZXZhQG9yYWNsZS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKb2huIEcgSm9obnNvbiA8
am9obi5nLmpvaG5zb25Ab3JhY2xlLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEphZ2FubmF0aGFu
IFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBTdGVmYW4gSGFq
bm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+DQo+PiAtLS0NCj4+IGh3L3JlbW90ZS92ZmlvLXVz
ZXItb2JqLmMgfCA0OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+
IGh3L3JlbW90ZS90cmFjZS1ldmVudHMgICAgfCAgMiArKw0KPj4gMiBmaWxlcyBjaGFuZ2VkLCA1
MCBpbnNlcnRpb25zKCspDQo+PiANCj4+IGRpZmYgLS1naXQgYS9ody9yZW1vdGUvdmZpby11c2Vy
LW9iai5jIGIvaHcvcmVtb3RlL3ZmaW8tdXNlci1vYmouYw0KPj4gaW5kZXggYzZkMGM2NzViNy4u
NDZmMjI1MWE2OCAxMDA2NDQNCj4+IC0tLSBhL2h3L3JlbW90ZS92ZmlvLXVzZXItb2JqLmMNCj4+
ICsrKyBiL2h3L3JlbW90ZS92ZmlvLXVzZXItb2JqLmMNCj4+IEBAIC0yMDgsNiArMjA4LDQ3IEBA
IHN0YXRpYyBzc2l6ZV90IHZmdV9vYmplY3RfY2ZnX2FjY2Vzcyh2ZnVfY3R4X3QgKnZmdV9jdHgs
IGNoYXIgKiBjb25zdCBidWYsDQo+PiAgICAgcmV0dXJuIGNvdW50Ow0KPj4gfQ0KPj4gDQo+PiAr
c3RhdGljIHZvaWQgZG1hX3JlZ2lzdGVyKHZmdV9jdHhfdCAqdmZ1X2N0eCwgdmZ1X2RtYV9pbmZv
X3QgKmluZm8pDQo+PiArew0KPj4gKyAgICBNZW1vcnlSZWdpb24gKnN1YnJlZ2lvbiA9IE5VTEw7
DQo+PiArICAgIGdfYXV0b2ZyZWUgY2hhciAqbmFtZSA9IE5VTEw7DQo+PiArICAgIHN0YXRpYyB1
bnNpZ25lZCBpbnQgc3VmZml4Ow0KPj4gKyAgICBzdHJ1Y3QgaW92ZWMgKmlvdiA9ICZpbmZvLT5p
b3ZhOw0KPj4gKw0KPj4gKyAgICBpZiAoIWluZm8tPnZhZGRyKSB7DQo+PiArICAgICAgICByZXR1
cm47DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgbmFtZSA9IGdfc3RyZHVwX3ByaW50ZigicmVt
b3RlLW1lbS0ldSIsIHN1ZmZpeCsrKTsNCj4+ICsNCj4+ICsgICAgc3VicmVnaW9uID0gZ19uZXcw
KE1lbW9yeVJlZ2lvbiwgMSk7DQo+PiArDQo+PiArICAgIG1lbW9yeV9yZWdpb25faW5pdF9yYW1f
cHRyKHN1YnJlZ2lvbiwgTlVMTCwgbmFtZSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaW92LT5pb3ZfbGVuLCBpbmZvLT52YWRkcik7DQo+PiArDQo+PiArICAgIG1lbW9yeV9y
ZWdpb25fYWRkX3N1YnJlZ2lvbihnZXRfc3lzdGVtX21lbW9yeSgpLCAoaHdhZGRyKWlvdi0+aW92
X2Jhc2UsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdWJyZWdpb24pOw0K
Pj4gKw0KPj4gKyAgICB0cmFjZV92ZnVfZG1hX3JlZ2lzdGVyKCh1aW50NjRfdClpb3YtPmlvdl9i
YXNlLCBpb3YtPmlvdl9sZW4pOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBkbWFfdW5y
ZWdpc3Rlcih2ZnVfY3R4X3QgKnZmdV9jdHgsIHZmdV9kbWFfaW5mb190ICppbmZvKQ0KPj4gK3sN
Cj4+ICsgICAgTWVtb3J5UmVnaW9uICptciA9IE5VTEw7DQo+PiArICAgIHJhbV9hZGRyX3Qgb2Zm
c2V0Ow0KPj4gKw0KPj4gKyAgICBtciA9IG1lbW9yeV9yZWdpb25fZnJvbV9ob3N0KGluZm8tPnZh
ZGRyLCAmb2Zmc2V0KTsNCj4+ICsgICAgaWYgKCFtcikgew0KPj4gKyAgICAgICAgcmV0dXJuOw0K
Pj4gKyAgICB9DQo+PiArDQo+PiArICAgIG1lbW9yeV9yZWdpb25fZGVsX3N1YnJlZ2lvbihnZXRf
c3lzdGVtX21lbW9yeSgpLCBtcik7DQo+PiArDQo+PiArICAgIG9iamVjdF91bnBhcmVudCgoT0JK
RUNUKG1yKSkpOw0KPj4gKw0KPj4gKyAgICB0cmFjZV92ZnVfZG1hX3VucmVnaXN0ZXIoKHVpbnQ2
NF90KWluZm8tPmlvdmEuaW92X2Jhc2UpOw0KPj4gK30NCj4gDQo+IFRoaXMgZG9lcyBub3Qgc3Vw
cG9ydCBob3QgdW5wbHVnIChtZW1vcnkgcmVnaW9ucyBwb2ludGluZyB0byBtZW1vcnkNCj4gbWFw
cGVkIGJ5IGxpYnZmaW8tdXNlciBhcmUgbGVmdCByZWdpc3RlcmVkKS4gVGhlIGNvZGUgc2hvdWxk
IGtlZXAgYSBsaXN0DQo+IChlLmcuIGh0dHBzOi8vZG9jcy5ndGsub3JnL2dsaWIvc3RydWN0LlNM
aXN0Lmh0bWwpIG9mIG1lbW9yeSByZWdpb25zIGFuZA0KPiBhdXRvbWF0aWNhbGx5IHJlbW92ZSB0
aGVtIGJlZm9yZSBkZXN0cm95aW5nIHRoZSB2ZnUgY29udGV4dC4NCj4gDQo+IEl0IGFsc28gZG9l
c24ndCBzdXBwb3J0IG11bHRpcGxlIHZmaW8tdXNlciBzZXJ2ZXIgaW5zdGFuY2VzIHJ1bm5pbmcg
aW4NCj4gdGhlIHNhbWUgUUVNVSBwcm9jZXNzLiBnZXRfc3lzdGVtX21lbW9yeSgpIGlzIGdsb2Jh
bCBidXQgdGhlIG1lbW9yeQ0KPiByZWdpb25zIHByb3ZpZGVkIGJ5IHZmaW8tdXNlciBhcmUgcGVy
LWNsaWVudCAoaS5lLiBWTSkuIElmIG11bHRpcGxlIFZNcw0KPiBhcmUgY29ubmVjdGVkIHRvIG9u
ZSB2ZmlvLXVzZXIgc2VydmVyIHByb2Nlc3MgdGhlbiB0aGV5IGNvbmZsaWN0Lg0KPiANCj4gSSBk
b24ndCBrbm93IHRoZSBiZXN0IHdheSB0byBzdXBwb3J0IG11bHRpcGxlIHZmaW8tdXNlciBzZXJ2
ZXINCj4gaW5zdGFuY2VzLCBpdCB3b3VsZCBiZSBzdHJhaWdodGZvcndhcmQgaWYgUUVNVSBzdXBw
b3J0ZWQgbXVsdGlwbGUNCj4gTWFjaGluZVN0YXRlcyBhbmQgZGlkbid0IHVzZSBnbG9iYWwgZ2V0
X3N5c3RlbV9tZW1vcnkoKS9nZXRfaW9fbWVtb3J5KCkNCj4gQVBJcy4gSXQgd291bGQgYmUgbmlj
ZSB0byBzb2x2ZSB0aGF0IGluIHRoZSBmdXR1cmUuDQoNCldl4oCZdmUgYWRkcmVzc2VkIHRoZSBt
dWx0aXBsZSB2ZmlvLXVzZXItc2VydmVyIGluc3RhbmNlcyBpbg0KIltQQVRDSCB2NCAxMS8xNF0g
dmZpby11c2VyOiBJT01NVSBzdXBwb3J0IGZvciByZW1vdGUgZGV2aWNl4oCdIHBhdGNoDQpkb3du
IHRoZSBsaW5lLiBJIHNlZSB5b3VyIGNvbW1lbnRzIHRoZXJlLCB3aWxsIGFkZHJlc3MgdGhlbS4N
Cg0KVGhhbmsgeW91IQ0KLS0NCkphZw0KDQo+IA0KPiBNYXliZSBpdCdzIHRvbyBoYXJkIHRvIGNo
YW5nZSB0aGF0LCBJIGhhdmVuJ3QgbG9va2VkLiBBbiBhbHRlcm5hdGl2ZSBpcw0KPiB0byBtYWtl
IHRoZSB4LXJlbW90ZSBtYWNoaW5lIGVtcHR5IChpdCBkb2Vzbid0IGNyZWF0ZSBhbnkgZGV2aWNl
cykgYW5kDQo+IGluc3RlYWQgY3JlYXRlIGEgbmV3IFBDSSBidXMsIGludGVycnVwdCBjb250cm9s
bGVyLCBtZW1vcnkgTWVtb3J5UmVnaW9uLA0KPiBhbmQgaW8gTWVtb3J5UmVnaW9uIGluIFZmdU9i
amVjdC4gU3RvcCB1c2luZyBnZXRfc3lzdGVtX21lbW9yeSgpIGFuZA0KPiBpbnN0ZWFkIHVzZSB0
aGUgcGVyLVZmdU9iamVjdCBtZW1vcnkgTWVtb3J5UmVnaW9uLg0KPiANCj4gSW4gZWl0aGVyIG9m
IHRob3NlIGFwcHJvYWNoZXMgaXQncyBwcm9iYWJseSBuZWNlc3NhcnkgdG8gc3BlY2lmeSB0aGUg
UENJDQo+IGJ1cyBJRCBpbiAtLWRldmljZSBhbmQgZGV2aWNlX2FkZCBzbyBpdCdzIGNsZWFyIHdo
aWNoIHZmaW8tdXNlciBzZXJ2ZXINCj4gdGhlIFBDSSBkZXZpY2UgaXMgYXNzb2NpYXRlZCB3aXRo
Lg0KPiANCj4gVGhlIG11bHRpcGxlIHZmaW8tdXNlciBzZXJ2ZXIgaW5zdGFuY2UgbGltaXRhdGlv
biBkb2Vzbid0IG5lZWQgdG8gYmUNCj4gc29sdmVkIG5vdywgYnV0IEkgd2FudGVkIHRvIHNoYXJl
IHNvbWUgaWRlYXMgYXJvdW5kIGl0LiBNYXliZSBzb21lb25lDQo+IGhhcyBiZXR0ZXIgaWRlYXMg
b3IgaXMgYXdhcmUgb2YgbGltaXRhdGlvbnMgcHJldmVudGluZyB3aGF0IEkgZGVzY3JpYmVkLg0K
PiANCj4gU3RlZmFuDQoNCg==

