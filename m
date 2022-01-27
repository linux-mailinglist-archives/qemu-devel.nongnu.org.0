Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A3949E9A5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 19:07:52 +0100 (CET)
Received: from localhost ([::1]:55106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD9BX-0004hc-Ea
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 13:07:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nD8Cn-0005qf-6K
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 12:05:06 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:16204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nD8CT-0002uD-8C
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 12:04:47 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20RFtugv012353; 
 Thu, 27 Jan 2022 17:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=VZ6I6U+auVm3DCue8COgg20Ct8cBOpGDz6ZjB4Pg65w=;
 b=RSLdbghoWDk2uwOiBJB0gi/7iq8v+sINytKn6ZT0d2zMLnmDjuNC0Q06I8CMTWJwANg8
 PMR9CDtxFRq2gcciIFScCLdBJzVkIRa6sxOfx8uxCHtL+VYxhWJ0s1llZHZaMpibyKjT
 FbUUTgdVQZ6qUPf+zje24++CXr6KKztNAvB3j+KGlwmZYJPqkIqWPc/6Z/5l1beG3HRh
 A4ipP67HS7P31MuRnowWsJY0tv8XglRIiRSrGWSmSkBgV2OcEuvgr3SYw6c338Bl4aHb
 RZc8dawTR/spTU4ba30m/R+22zU4ClJp7VV2wEKABNH1O3fkxCebQwwLM6/Cwa09xnRp IA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3duvnk8pya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 17:04:30 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20RGulR7141289;
 Thu, 27 Jan 2022 17:04:29 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by userp3020.oracle.com with ESMTP id 3drbctvr5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 17:04:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9QY8rHF9bVzQFCjdSOggv+HLLeuLVHT8WEYWvgXq6H/UvFFxiXzeweMrxhfysaSLcAoi3iQiKbwJUEx+RNDu7bPP2I/bz5YmgTlEg13EKTT2ehdxyFW4L9EmtxIkjHBgZAEpf4epDmLDo2nJETL7f1LI8r16m/g+tMu1459G29yVoIvh6IlTALfji+nnM0yNIXo4w9a3B4lqhypKD1rv/q9nZEAZfUSphyJsBIxczxQHdAF1M9ReXeuS1yk98rIkstqIAMjAEUXuumYrRNtkCM4Ox71badmjRBlbabhLKbTB7ZG+Td1DL4BMxcNsGbVh5X6whH/kjkmoj6sckNBEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZ6I6U+auVm3DCue8COgg20Ct8cBOpGDz6ZjB4Pg65w=;
 b=FHqoAXBfRLc3e9rkyJ5zTZnVRFtfb+6z7OPgUY4F7ACfzxPNHAv69aM6mwvjXXufilZAEYt3SZpDu15key8vfj9lkyxFEaGzS8HslQIQhb/x/4DNsKdikE7A/CyKcI90kTzBJ9Gl/niOHHF6UGnR1MZUmh3/CXV8RaUH5zlmhdyWZ7SyaYhvhJn6wsoO4fXhkPG66qmAnitjPmmA7X1CKuze0L0r3lXkLhJP0r3D9XiSzRhToa4pKcAn1t7ZkTHI4f4dTggXzFr6tPOrWv8UVJzQBbVzTFCt2CFHO0BW6ooC8WlU/cK7kkpts7fS0bvI4Ld+ROlbaY0XrqdQxA4KCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZ6I6U+auVm3DCue8COgg20Ct8cBOpGDz6ZjB4Pg65w=;
 b=Po5PRvovfhGa8JRBlwshIKX0UPIh8nApw7rEzDP1aUa8aua+biND436zbwRwExLS0qHTU9J1SAILdJ3y3oG0pvYWFoTvtBPoO8aEEXujSqGm+oDamqoT3gE371daQ8kE6rcXV/S/5MA3ZIytpAQd9aDh2+RLvBmH77V7836Tits=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by CY4PR1001MB2246.namprd10.prod.outlook.com (2603:10b6:910:41::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.14; Thu, 27 Jan
 2022 17:04:26 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4909.019; Thu, 27 Jan 2022
 17:04:26 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, John Levon <john.levon@nutanix.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Subject: Re: [PATCH v5 17/18] vfio-user: register handlers to facilitate
 migration
Thread-Topic: [PATCH v5 17/18] vfio-user: register handlers to facilitate
 migration
Thread-Index: AQHYDX2RujIYB0vy6k2RdZWpw+Krfqxz6vMAgAM58YA=
Date: Thu, 27 Jan 2022 17:04:26 +0000
Message-ID: <A4D21E02-4F6A-49C6-A7D8-24C30BD2B645@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <0ec006e5c309166cc1920871688508c1f6270ac3.1642626515.git.jag.raman@oracle.com>
 <YfAbwButynCFEBwY@stefanha-x1.localdomain>
In-Reply-To: <YfAbwButynCFEBwY@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e36f64e-926d-4ba0-51c0-08d9e1b712fb
x-ms-traffictypediagnostic: CY4PR1001MB2246:EE_
x-microsoft-antispam-prvs: <CY4PR1001MB22460B7DA896B8E002E26EA690219@CY4PR1001MB2246.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E2rgVKyiutxQ9U6Lve+LlZ1VLbkCuwK3Dbj+YXiiANrj/C2Xu4D62W8Q3ccg5PqcDSILS2lMiSR/TALu3P2PMdAWyRALWAkAAMwS9p8T3R0fQYOcIIsYe6WiMvDBhwOmGV8VVmH/i44fNk8C5JVRBwggxRDCLAEpByK2Mi7onWSnHxfL/+2bopDO/tms63UNGglUN5lB54Y66pOmsMpOmKEOOxms8d3r/Gn2oUNSjruAJHKCJceRZNplIZxLHyBJUcCZvdfFpvBMFfamv71SM8u+tZNxA7xX17XQMXmMsadjTmqZps9kDFjNS4AB/AhwCYXlPhsvyYL0ztHwVYI8mgJN43MavHubufFR+FM4mLebI8PItk2Lh/mA5p+iI8fn02xO1PM0J9LJl5GwTZOp3+S6XkJCEv3dr13N6nzqoK+N0vUBP/OgsdGxhPr3AI/GXWqrXqdbboFztTyPNavOGSIZ+f9jViob+N8YYhwk/xXvO7OgL5WHl/wl7FR5Yx0aXTsf3nngCxJmcjhufXQCNRhYti5a2FesXfUNpMBTtMEccxxvHZ+72dRTlC8qMv4sedzpaeXz0j9sZM5rNMRzO/2SkHD/3YG1IAAwWy9/a9BtyumEA3Fs+s8PJhUUm5riLuQiYIo82nFXq8lVR5Q4q1cpSQGoH+9ONWNUSFE6OKyGXi1H1/5oKZdFMo9lOT+3bN+CsgtMIg6gmQTxLz4KUGG/W4XinoGKUNlxAUCOBikMie5ljDYp0eCXsCVvbXA+KEMlWVlYAFI0XEBRFJORVKl2txbFplX7hX5muyv+jd1o2F3TYqiMLk1pq/CDhudo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(54906003)(53546011)(966005)(83380400001)(5660300002)(6512007)(107886003)(36756003)(71200400001)(7416002)(76116006)(6506007)(38070700005)(38100700002)(316002)(122000001)(110136005)(44832011)(6486002)(508600001)(66476007)(66556008)(8936002)(2616005)(66946007)(66446008)(4326008)(64756008)(26005)(8676002)(186003)(2906002)(33656002)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ajNiMkJVZW9DaE95UlozNkxnSmtmZFhweUxTSVo4RFZ1aUxNOEFQQzVmejRW?=
 =?utf-8?B?L3lmcXZCbEFMTnVnS3V0RDk3YWpMNXB2bndCaEljNlN6UWU4SldwY0tHWExM?=
 =?utf-8?B?QTdZZWdNczN6OHUwSXZzSlRBd0kyc1B5cWpFNGxkVm9jaFFNVjd1NHF2ckNE?=
 =?utf-8?B?R21HSDhyTmJubE12WDBLd0xYNGZ0QUtIbnRZV3A1d0VEZUZ3NzFSWWQzT2V3?=
 =?utf-8?B?K1lXUWhET2tOYTgwNGNnN04vTHNQN0NORkxjQlBzQk5FOGN5cWV1MlR4ZVhy?=
 =?utf-8?B?MFhMcFFaV29FclFsN3ozbmVxR1RmaGh4R3NkK3hHaWJDSnFRUU5rTG0zMnhO?=
 =?utf-8?B?bHg4MCtqK0ZUZStFN1lvUGtVU0dZeFMvVUEvMWo5MC9vekpFWnNsNDhza3Yr?=
 =?utf-8?B?dHVFbnpnb252YUtYeXB1amxZOTExQzQ3aW1YK2VwbURWRTBwZ0YrbTVCZnc4?=
 =?utf-8?B?MWd1MXpnV1l4NFV2QUowemkvMUpZcUNqZUszTUFXNGU1UEhkdGpBQ09IV05Q?=
 =?utf-8?B?R1FwaE8xeHY1YVA4VWN5Y0tORG5BZDJsTURBQnBZMk56TTAzLzZDdW9lLyts?=
 =?utf-8?B?dzEvUkNOSE1ZMzA5aGJBMThiT2l0dDBJNWRTaU4wVnV6L0VhS1V1czk2WGkv?=
 =?utf-8?B?blY4SmxLb3IwVTgzN2Q4ZmJXN1Q2RFdhV1k2NFFxOFhrV0d5cDRmQnJVVlNV?=
 =?utf-8?B?TUg2M2FFZy92SGxWVVJ1RCtESUNTQWNTYXEyR0xYc1ZGeHRNblZMNWFMcVJm?=
 =?utf-8?B?MDRQelVQcUpoeUJlRS9iTlArUzBGUTZNWGswWlZaTGxYNkFVcnhYZWFSM0Q0?=
 =?utf-8?B?Y0dqMFdtZW83bmxqR3BnMnlwNXBzUUhHZ0hqSXBxVklsUWp4Z21VbHg3RjV3?=
 =?utf-8?B?ZktxUHlIek1Ta2ZLZVlzV2lCMktQM1RDOGZYNnhwZFVlNXlRM3kydnltT1Ji?=
 =?utf-8?B?Vm95cjRSR3p5RjFXelZ2UjVvU2NRMTRoTW9JQy9iQ05hU0NkMGY1NFNuY1d2?=
 =?utf-8?B?U0dQWFhua3RCNlQyTFJxck4yVmswSnl5eDVoRXMrSVVMUlI4VVNmcWdtUzdF?=
 =?utf-8?B?aHVDQkpqT2dkQ05aM2tDUnRPMzlzRmZnNzFsWWlma05BVU0zZXVkQlpKZEky?=
 =?utf-8?B?cGUwYVFNNnJnNHRiVHl1eFVLN2NjS2d3S05uenBUbmdVVFdCZVZrcmlISCtv?=
 =?utf-8?B?d0QrQWRwcGtiM2pTL0lKUDh1UmZ4aEpLYkdOdGpScllLQko4MUh3akk5MlMv?=
 =?utf-8?B?RDNndkw1d1BsNjdkSW45ZXhnQVE4STF0MExGYlZSYUltM2dEVDFMQzk2dTZ5?=
 =?utf-8?B?cUVmRXhTTzJHQzEvSEd6MUxtODdVc0liRFdBT0JjaHQzTUlxcFlKZWFwWFRF?=
 =?utf-8?B?U0RRM0wrNEl2V1JLbW5vQlNKUTFnL0wvYWN0cDF3eHo5aWprRnlPaVFjQ2pW?=
 =?utf-8?B?N0NwQWVVbjhlamd6RVFMb0doYUp5WjRDVFY3YUQzL2RKKzdyaEN2MTY0MjNi?=
 =?utf-8?B?bjBPWFBpb0pNc2pXenhkRDRlSzFEMVZiN3NoY2UwWGNxdExzbzg5VkJ6Y2I4?=
 =?utf-8?B?UGEyQ0JXTm5kNWhhUW9QeGlBZE9rQjFEQjJmc0pOeWg5azdzZjNMZ0ozTk1P?=
 =?utf-8?B?ZFJ0ekN3NlVtQXZReFdIcnFkM09pNW1XMndOTGdUcGdqZmcvM1NhWks5eDhM?=
 =?utf-8?B?bG9rcEY0bDNHVUFOcU94V3FCakUxRDRTY3pWMWFsdXNuY3JGOVROQ3NFRnV4?=
 =?utf-8?B?dGliQmdLd3IweEgrRnE2djMyQlpKRDFwSkc3UzNPK1Voa0NyZXc4ckdyM3lq?=
 =?utf-8?B?RGp0YnlDUEVRajkwT0RqdGFGMlZxeFNaN09DZFdKa3BUSExnUGlpMXNwMG1k?=
 =?utf-8?B?SDA4Um1ENG9BOENDRGpxejVsajlINHR0S1BJa01sVDVNRVhRK2JMRkdCOG01?=
 =?utf-8?B?N3VzOEtpT1JKemh3azJ5ZC9sS1VXczArMm9FaUZsczBtenhsK1diR0NUcHVY?=
 =?utf-8?B?NlliUWpVbVV5QUErd1pwMml3c3hxS2J0UlFOcnZzRmliWmFJMFJQbGtldkx6?=
 =?utf-8?B?REYwUG1EamxoVldscWRwN0VhVXFVcDErT0szK1A2cjBySmxxOVdjNlBLOGRh?=
 =?utf-8?B?L05xWGZHOUFlZklubXFjVXdrMjZnOU9BRzJHSm41aHFHbHI2WWhmMnN5LzlM?=
 =?utf-8?Q?lt7aHNjCIyh7lJCI70o9wkY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2DADD9F7A34C4549BB0E81801922318E@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e36f64e-926d-4ba0-51c0-08d9e1b712fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2022 17:04:26.2267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mC7nyc0wTp0nb8pTbARVEiQf9Ok1I0fHVlfJG33ozwf7h8GSBPm7VAdbBR6uLyLZfQGGct4JegAdx80SBexFyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2246
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10239
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201270101
X-Proofpoint-GUID: H6Mzwv8Ais1DAv_uR0uObQotOszJxygc
X-Proofpoint-ORIG-GUID: H6Mzwv8Ais1DAv_uR0uObQotOszJxygc
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSmFuIDI1LCAyMDIyLCBhdCAxMDo0OCBBTSwgU3RlZmFuIEhham5vY3ppIDxzdGVm
YW5oYUByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgSmFuIDE5LCAyMDIyIGF0IDA0
OjQyOjA2UE0gLTA1MDAsIEphZ2FubmF0aGFuIFJhbWFuIHdyb3RlOg0KPj4gKyAgICAgKiBUaGUg
Y2xpZW50IHN1YnNlcXVldGx5IGFza3MgdGhlIHJlbW90ZSBzZXJ2ZXIgZm9yIGFueSBkYXRhIHRo
YXQNCj4gDQo+IHN1YnNlcXVlbnRseQ0KPiANCj4+ICtzdGF0aWMgdm9pZCB2ZnVfbWlnX3N0YXRl
X3J1bm5pbmcodmZ1X2N0eF90ICp2ZnVfY3R4KQ0KPj4gK3sNCj4+ICsgICAgVmZ1T2JqZWN0ICpv
ID0gdmZ1X2dldF9wcml2YXRlKHZmdV9jdHgpOw0KPj4gKyAgICBWZnVPYmplY3RDbGFzcyAqayA9
IFZGVV9PQkpFQ1RfR0VUX0NMQVNTKE9CSkVDVChvKSk7DQo+PiArICAgIHN0YXRpYyBpbnQgbWln
cmF0ZWRfZGV2czsNCj4+ICsgICAgRXJyb3IgKmxvY2FsX2VyciA9IE5VTEw7DQo+PiArICAgIGlu
dCByZXQ7DQo+PiArDQo+PiArICAgIC8qKg0KPj4gKyAgICAgKiBUT0RPOiBtb3ZlIHRvIFZGVV9N
SUdSX1NUQVRFX1JFU1VNRSBoYW5kbGVyLiBQcmVzZW50bHksIHRoZQ0KPj4gKyAgICAgKiBWTVNE
IGRhdGEgZnJvbSBzb3VyY2UgaXMgbm90IGF2YWlsYWJsZSBhdCBSRVNVTUUgc3RhdGUuDQo+PiAr
ICAgICAqIFdvcmtpbmcgb24gYSBmaXggZm9yIHRoaXMuDQo+PiArICAgICAqLw0KPj4gKyAgICBp
ZiAoIW8tPnZmdV9taWdfZmlsZSkgew0KPj4gKyAgICAgICAgby0+dmZ1X21pZ19maWxlID0gcWVt
dV9mb3Blbl9vcHMobywgJnZmdV9taWdfZm9wc19sb2FkLCBmYWxzZSk7DQo+PiArICAgIH0NCj4+
ICsNCj4+ICsgICAgcmV0ID0gcWVtdV9yZW1vdGVfbG9hZHZtKG8tPnZmdV9taWdfZmlsZSk7DQo+
PiArICAgIGlmIChyZXQpIHsNCj4+ICsgICAgICAgIFZGVV9PQkpFQ1RfRVJST1IobywgInZmdTog
ZmFpbGVkIHRvIHJlc3RvcmUgZGV2aWNlIHN0YXRlIik7DQo+PiArICAgICAgICByZXR1cm47DQo+
PiArICAgIH0NCj4+ICsNCj4+ICsgICAgcWVtdV9maWxlX3NodXRkb3duKG8tPnZmdV9taWdfZmls
ZSk7DQo+PiArICAgIG8tPnZmdV9taWdfZmlsZSA9IE5VTEw7DQo+PiArDQo+PiArICAgIC8qIFZG
VV9NSUdSX1NUQVRFX1JVTk5JTkcgYmVnaW5zIGhlcmUgKi8NCj4+ICsgICAgaWYgKCsrbWlncmF0
ZWRfZGV2cyA9PSBrLT5ucl9kZXZzKSB7DQo+IA0KPiBXaGVuIGlzIHRoaXMgY291bnRlciByZXNl
dCBzbyBtaWdyYXRpb24gY2FuIGJlIHRyaWVkIGFnYWluIGlmIGl0DQo+IGZhaWxzL2NhbmNlbHM/
DQoNCkRldGVjdGluZyBjYW5jZWxsYXRpb24gaXMgYSBwZW5kaW5nIGl0ZW0uIFdlIHdpbGwgYWRk
cmVzcyBpdCBpbiB0aGUNCm5leHQgcmV2LiBXaWxsIGNoZWNrIHdpdGggeW91IGlmICB3ZSBnZXQg
c3R1Y2sgZHVyaW5nIHRoZSBwcm9jZXNzDQpvZiBpbXBsZW1lbnRpbmcgaXQuDQoNCj4gDQo+PiAr
c3RhdGljIHNzaXplX3QgdmZ1X21pZ19yZWFkX2RhdGEodmZ1X2N0eF90ICp2ZnVfY3R4LCB2b2lk
ICpidWYsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDY0X3Qgc2l6
ZSwgdWludDY0X3Qgb2Zmc2V0KQ0KPj4gK3sNCj4+ICsgICAgVmZ1T2JqZWN0ICpvID0gdmZ1X2dl
dF9wcml2YXRlKHZmdV9jdHgpOw0KPj4gKw0KPj4gKyAgICBpZiAob2Zmc2V0ID4gby0+dmZ1X21p
Z19idWZfc2l6ZSkgew0KPj4gKyAgICAgICAgcmV0dXJuIC0xOw0KPj4gKyAgICB9DQo+PiArDQo+
PiArICAgIGlmICgob2Zmc2V0ICsgc2l6ZSkgPiBvLT52ZnVfbWlnX2J1Zl9zaXplKSB7DQo+PiAr
ICAgICAgICB3YXJuX3JlcG9ydCgidmZ1OiBidWZmZXIgb3ZlcmZsb3cgLSBjaGVjayBwZW5kaW5n
X2J5dGVzIik7DQo+PiArICAgICAgICBzaXplID0gby0+dmZ1X21pZ19idWZfc2l6ZSAtIG9mZnNl
dDsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBtZW1jcHkoYnVmLCAoby0+dmZ1X21pZ19idWYg
KyBvZmZzZXQpLCBzaXplKTsNCj4+ICsNCj4+ICsgICAgby0+dmZ1X21pZ19idWZfcGVuZGluZyAt
PSBzaXplOw0KPiANCj4gVGhpcyBhc3N1bWVzIHRoYXQgdGhlIGNhbGxlciBpbmNyZW1lbnRzIG9m
ZnNldCBieSBzaXplIGVhY2ggdGltZS4gSWYNCj4gdGhhdCBhc3N1bXB0aW9uIGlzIG9rYXksIHRo
ZW4gd2UgY2FuIGp1c3QgdHJ1c3Qgb2Zmc2V0IGFuZCBkb24ndCBuZWVkIHRvDQo+IGRvIGFyaXRo
bWV0aWMgb24gdmZ1X21pZ19idWZfcGVuZGluZy4gSWYgdGhhdCBhc3N1bXB0aW9uIGlzIG5vdCBj
b3JyZWN0LA0KPiB0aGVuIHRoZSBjb2RlIG5lZWRzIHRvIGJlIGV4dGVuZGVkIHRvIHNhZmVseSB1
cGRhdGUgdmZ1X21pZ19idWZfcGVuZGluZw0KPiB3aGVuIG9mZnNldCBqdW1wcyBhcm91bmQgYXJi
aXRyYXJpbHkgYmV0d2VlbiBjYWxscy4NCg0KR29pbmcgYnkgdGhlIGRlZmluaXRpb24gb2YgdmZ1
X21pZ3JhdGlvbl9jYWxsYmFja3NfdCBpbiB0aGUgbGlicmFyeSwgSSBhc3N1bWVkDQp0aGF0IHJl
YWRfZGF0YSBhZHZhbmNlcyB0aGUgb2Zmc2V0IGJ5IHNpemUgYnl0ZXMuDQoNCldpbGwgYWRkIGEg
Y29tbWVudCBhIGNvbW1lbnQgdG8gZXhwbGFpbiB0aGF0Lg0KDQo+IA0KPj4gK3VpbnQ2NF90IHZt
c3RhdGVfdm1zZF9zaXplKFBDSURldmljZSAqcGNpX2RldikNCj4+ICt7DQo+PiArICAgIERldmlj
ZUNsYXNzICpkYyA9IERFVklDRV9HRVRfQ0xBU1MoREVWSUNFKHBjaV9kZXYpKTsNCj4+ICsgICAg
Y29uc3QgVk1TdGF0ZUZpZWxkICpmaWVsZCA9IE5VTEw7DQo+PiArICAgIHVpbnQ2NF90IHNpemUg
PSAwOw0KPj4gKw0KPj4gKyAgICBpZiAoIWRjLT52bXNkKSB7DQo+PiArICAgICAgICByZXR1cm4g
MDsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBmaWVsZCA9IGRjLT52bXNkLT5maWVsZHM7DQo+
PiArICAgIHdoaWxlIChmaWVsZCAmJiBmaWVsZC0+bmFtZSkgew0KPj4gKyAgICAgICAgc2l6ZSAr
PSB2bXN0YXRlX3NpemUocGNpX2RldiwgZmllbGQpOw0KPj4gKyAgICAgICAgZmllbGQrKzsNCj4+
ICsgICAgfQ0KPj4gKw0KPj4gKyAgICByZXR1cm4gc2l6ZTsNCj4+ICt9DQo+IA0KPiBUaGlzIGZ1
bmN0aW9uIGxvb2tzIGluY29ycmVjdCBiZWNhdXNlIGl0IGlnbm9yZXMgc3Vic2VjdGlvbnMgYXMg
d2VsbCBhcw0KPiBydW50aW1lIGJlaGF2aW9yIGR1cmluZyBzYXZlKCkuIEFsdGhvdWdoIFZNU3Rh
dGVEZXNjcmlwdGlvbiBpcyBwYXJ0aWFsbHkNCj4gZGVjbGFyYXRpdmUsIHRoZXJlIGlzIHN0aWxs
IGEgYnVuY2ggb2YgaW1wZXJhdGl2ZSBjb2RlIHRoYXQgY2FuIHdyaXRlIHRvDQo+IHRoZSBRRU1V
RmlsZSBhdCBzYXZlKCkgdGltZSBzbyB0aGVyZSdzIG5vIHdheSBvZiBrbm93aW5nIHRoZSBzaXpl
IGFoZWFkDQo+IG9mIHRpbWUuDQoNCkkgc2VlIHlvdXIgcG9pbnQsIGl0IHdvdWxkIGJlIGEgcHJv
YmxlbSBmb3IgYW55IGZpZWxkIHdoaWNoIGhhcyB0aGUNCihWTVNfQlVGRkVSIHwgVk1TX0FMTE9D
KSBmbGFncyBzZXQuDQoNCj4gDQo+IEkgYXNrZWQgdGhpcyBpbiBhIHByZXZpb3VzIHJldmlzaW9u
IG9mIHRoaXMgc2VyaWVzIGJ1dCBJJ20gbm90IHN1cmUgaWYNCj4gaXQgd2FzIGFuc3dlcmVkOiBp
cyBpdCByZWFsbHkgbmVjZXNzYXJ5IHRvIGtub3cgdGhlIHNpemUgb2YgdGhlIHZtc3RhdGU/DQo+
IEkgdGhvdWdodCB0aGUgVkZJTyBtaWdyYXRpb24gaW50ZXJmYWNlIGlzIGRlc2lnbmVkIHRvIHN1
cHBvcnQNCj4gc3RyZWFtaW5nIHJlYWRzL3dyaXRlcy4gV2UgY291bGQgY2hvb3NlIGEgZml4ZWQg
c2l6ZSBsaWtlIDY0S0IgYW5kDQo+IHN0cmVhbSB0aGUgdm1zdGF0ZSBpbiA2NEtCIGNodW5rcy4N
Cg0KVGhlIGxpYnJhcnkgZXhwb3NlcyB0aGUgbWlncmF0aW9uIGRhdGEgdG8gdGhlIGNsaWVudCBh
cyBhIGRldmljZSBCQVIgd2l0aA0KZml4ZWQgc2l6ZSAtIHRoZSBzaXplIG9mIHdoaWNoIGlzIGZp
eGVkIGF0IGJvb3QgdGltZSwgZXZlbiB3aGVuIHVzaW5nDQp2ZnVfbWlncmF0aW9uX2NhbGxiYWNr
c190IGNhbGxiYWNrcy4NCg0KSSBkb27igJl0IGJlbGlldmUgdGhlIGxpYnJhcnkgc3VwcG9ydHMg
c3RyZWFtaW5nIHZtc3RhdGUvbWlncmF0aW9uLWRhdGEgLSBzZWUNCnRoZSBmb2xsb3dpbmcgY29t
bWVudCBpbiBtaWdyYXRpb25fcmVnaW9uX2FjY2VzcygpIGRlZmluZWQgaW4gdGhlIGxpYnJhcnk6
DQoNCiogRG9lcyB0aGlzIG1lYW4gdGhhdCBwYXJ0aWFsIHJlYWRzIGFyZSBub3QgYWxsb3dlZD8N
Cg0KVGhhbm9zIG9yIEpvaG4sDQoNCiAgICBDb3VsZCB5b3UgcGxlYXNlIGNsYXJpZnkgdGhpcz8N
Cg0KU3RlZmFuLA0KICAgIFdlIGF0dGVtcHRlZCB0byBhbnN3ZXIgdGhlIG1pZ3JhdGlvbiBjYW5j
ZWxsYXRpb24gYW5kIHZtc3RhdGUgc2l6ZQ0KICAgIHF1ZXN0aW9ucyBwcmV2aW91c2x5IGFsc28s
IGluIHRoZSBmb2xsb3dpbmcgZW1haWw6DQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9G
NDg2MDZCMS0xNUE0LTRERDItOUQ3MS0yRkNBRkMwRTY3MUZAb3JhY2xlLmNvbS8NCg0KVGhhbmsg
eW91IHZlcnkgbXVjaCENCi0tDQpKYWcNCg0K

