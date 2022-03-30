Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88A44EC6FF
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 16:48:05 +0200 (CEST)
Received: from localhost ([::1]:42630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZZcC-0001bV-AF
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 10:48:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nZZat-0000se-8R
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 10:46:43 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:56026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nZZao-0005Ns-R9
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 10:46:41 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UCcZnF007018; 
 Wed, 30 Mar 2022 14:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=R/CKu5dQPj6iPOVF+qOviyOlg1Yg75oW0zrkaigWYjw=;
 b=pRL96JTmtyvGGr3YMF5ssa4+1azeTSSqWGp5eLEf82UGvTEZ4HclO9I0STKE0zp2Tt7w
 SYKhTc7MovedZ6mKT7LJoWTegNLYgiizL2lXtaljVUw9PXImZCT01J2k2nQ3oNVZuLgN
 J4a7ZCsmMA/67voq8GbOR4DJrZJ0R4kJDXKzN76cYvCdCbRD47zFpOlatjKGD6Rjk3Js
 wPmTRFbXE9T1YnUk7PeDGVtGqdxQVTgGann83c9tRu2pm8Dgg4YssFPb7JpSbb42mTtu
 S3cjXC37Ji4/xWAFVnNIS6D6E4aN9W8+xON9Rlb4dHr7L1JZIx/OsnAXmNAdyjcnsgF5 Rw== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1tes1par-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 14:46:23 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22UEfZSY025425;
 Wed, 30 Mar 2022 14:46:22 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2046.outbound.protection.outlook.com [104.47.73.46])
 by aserp3030.oracle.com with ESMTP id 3f1rv8f7g5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 14:46:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrW2U25i6a8Ky8NwZvsJGkrYnLjlg9/unlven9d1DJdIq2BbdpAbTN6dgNIlY1rzRCEaAM2Ce738FdJVJ8G5otbgtAUgyRo48vfFv/lKllWKhdC7rFZ9Qf1GxyjGjCiwEWajQ03H7BSgKzRkIcwVZDynwmHSWbFRJzEAL61X+gZ1ljBIQWzOtg/ZadmYV5b1UGhvGRot5Lu9De7Xjqp/9mPV2XMFH8a9tFyYneQBcsZfCzoEHWiWCij8Jw8GnZADaLuGu8tYI+zX7M1XjMUW/LNChcEfweLc14NrNJYhY8AGxQYN9u2vQOr7PnqGwRvUn+fbN5G0reYqZXUXR775wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/CKu5dQPj6iPOVF+qOviyOlg1Yg75oW0zrkaigWYjw=;
 b=VCLSKISww/0/9eeDPF2LVnvGz/y0ctywXYLJLUmlgd5oEr6rkJRUX/JGmJ789NX2CW1uuhf2Nx+TH7iXfgi7UUCR7d1qfC5EXGF4uTuxaEAO90tJfSQNDgD6gHl03qfX7DMoLzlMAmxJLEyG1lRSv+d3/OjFSnN/uOcMZ8wmxCGXuBU/G4WjtObA+ZhyLMiL3J7wzEnFkJxU18kNQtA+HGRfSF/e7rZKIBpnSYB44duTW3y25EmwICu3vxYT+9Idsnd2VQ6E15KL+m5TasQxW4JCeATH0iXR18sMnkpBj5vnRJWz8Krl8duhwYA5ua+vWDerB8ET9yA9rALbI74LLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/CKu5dQPj6iPOVF+qOviyOlg1Yg75oW0zrkaigWYjw=;
 b=Dw2WlVHX7XvIpILJm7fyK7UKjSwM3Md5ea3OAIkiux5QxM+HuHD51MaSiYjtRZGLiob9sQTbQalJys6GcjI4JkdkSaqYqsd0E7HRbA+LnfmOIo7bZHObJ6RkMXfqXylALu36Z1NxEgeJ4W1/g7nMlD8CqBGQEoCFbrylRxftbrw=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3326.namprd10.prod.outlook.com (2603:10b6:208:125::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Wed, 30 Mar
 2022 14:46:20 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5123.020; Wed, 30 Mar 2022
 14:46:20 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v7 14/17] vfio-user: handle PCI BAR accesses
Thread-Topic: [PATCH v7 14/17] vfio-user: handle PCI BAR accesses
Thread-Index: AQHYQH1ggKGjl7r8gk6LjOzjnAA7wqzWVkSAgAAyZgCAATHdgIAATlOA
Date: Wed, 30 Mar 2022 14:46:20 +0000
Message-ID: <F0C4F49C-BB5A-4719-BB21-BE9BDA6D2510@oracle.com>
References: <cover.1648234157.git.jag.raman@oracle.com>
 <1c2cc82cc72964216fb63270805fefb095f4d4a8.1648234157.git.jag.raman@oracle.com>
 <YkMArX56GKwOTsc0@stefanha-x1.localdomain>
 <45272D4A-0625-446A-804E-3211F2D91B81@oracle.com>
 <YkQrh5pWniHTT1LK@stefanha-x1.localdomain>
In-Reply-To: <YkQrh5pWniHTT1LK@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74d49f5f-eb29-4190-0ed2-08da125c0dd6
x-ms-traffictypediagnostic: MN2PR10MB3326:EE_
x-microsoft-antispam-prvs: <MN2PR10MB3326EE90F52ACBF67644605A901F9@MN2PR10MB3326.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4pZWFnBQIwoUzyxn6ifu3gReyb4u/kavSQ86u1bRsyjTsoiQt7mGgv28k53ba6M1xOCtkvHU2z2D1FPYB8uZBLEfM+QVfcaqdTpYerapi1SUtG9qGnVbbtt3J4O2Dd85sFNAKqb/+CdtLhvY2om6wYkaxWsOZYRNUE0NBfJflq44KdV1VNYB9c1ZJ8f+30JrPuhHpdkbzYEcsrGhlaUXlILtOhhIbisdMyzrBa5HvJ6uGv07O7wwnt5CSyc2qWFdPQEhMrYEnC5Dc1C4BdlhNdFMd+i6I+LT/fti+cv7dyNMymwx04vsyf+VJKrNv8hBClILKwyVO+qPrEDVPaDDXXXHEusyVhBIMkpeVrgnD/3CGBw6SnIEsGw76BD3F3kuiMMo8TYJQJWvnrIBmRhSfPEl5qiOJb7bYXOLk0JgCaCdHM5XcA6VKVd9GLWj/JBY6yRBi0rakNt7fe1dbBe2DV5MbHXElccSkkWSGPEQpdbnLGqU3BaRTfpKeNUZNatHJMny8GQu1HaGMv7QnqMB/0KgS8Aeca3WKQelyvoxOvPgtBftvJPl0J4qOvxyBz2gh2bD+gGwaMSuJlKvOsxtA1SBoWl1b2O8x+LKjeOr/gOOXVHDoao5+DydDMhkQBVnBJ5k5MvICqABfItzwx0RblwPTj8lKnmcPPv8HnprYyHczvlnc9cx4DZc/sYyS3j18d0aQxMG4wEV12Fxgb9uTrb8FNsSrQXnZdSI2Xk5KXU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(38100700002)(6512007)(2616005)(107886003)(186003)(86362001)(71200400001)(44832011)(122000001)(2906002)(64756008)(66476007)(91956017)(6506007)(83380400001)(54906003)(38070700005)(53546011)(66946007)(316002)(66446008)(5660300002)(508600001)(66556008)(6916009)(4326008)(8676002)(33656002)(76116006)(8936002)(36756003)(7416002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1NvcHIzTFBnYUtTc3RIYjlweG1JQlVuYjR0a2NsZmRuSHU0ekVaOHAzOG1Q?=
 =?utf-8?B?ZHVsYlluak9WRng2dytmdExCbWFoRVB6MmNZTTJZRk9RQk96ZDdoSE5SdWFK?=
 =?utf-8?B?djE2R2h1SW52K0dra0M3ZHlxQ3Y3c2VqRHNUbCtFby9RNHAxcHg4RjB0dG9D?=
 =?utf-8?B?cVkyUVEvR01BUzFzYzdpOVdoOHVWNzA4ZktIaSs3UXBFaEpHa2N4aUpuL21I?=
 =?utf-8?B?MDN2Q2RkT2VUWVBBRHNOMWI4amhaUFYvMytUc2ZRVmwvZ09EU29CS29ERWxw?=
 =?utf-8?B?V3V6Sm5WbTlQNXcrTUxGTTI1K2tMOUtDWjU4dDJOdm9ZcW9MbEIvQ25BcVVk?=
 =?utf-8?B?UUVhczlSVThla1JyOWYyYVRkcHFBSkxOdGdDRFYxZUpGQU1sR2FFUVQwSjFN?=
 =?utf-8?B?SU5IM25zZEhMOVBHRUtiaTFBYmRmYndVWkxWV3pjN1BBaFNTbjYxeVFDT2lx?=
 =?utf-8?B?cWxoK1hpVkdkTTlrNStZNVFyamt5ODQ1ZEVVbjJuK3ZtdlVGR3E2dHVuekND?=
 =?utf-8?B?bzA4ZmVjRTJuN1NkNElXRTNOUGVSL3V3WjQ3Y3FTTzl6cnNoOFpXd1ZadUFF?=
 =?utf-8?B?OEhHSlNHZDQ3TVNHOVRPbEh4azcrTEpJQVMyS3pSZDFablZTSXU0SkZ1OUR1?=
 =?utf-8?B?K3hiTUZlSjgrdzM4Szg5allBWVFUd0FIU2JiYlc3eThscjh6eFFaYThGci85?=
 =?utf-8?B?RjRBWlRMVHp3dStrMUNMM1dlQTcvUGtMQW1EYnpyd0lhMFdybWtXbXdhSE1Y?=
 =?utf-8?B?M1I0V2E5NE5MVVFtTGtBRUEwd1NidXhvR2p5cWNxT1pEQSt6SUNaYi85TWtt?=
 =?utf-8?B?ZTljeDMxNzhQMzYzTDJ6cFN0Z1BlN2FIYzJ2VGhHZ2ZvT2tOSXdFN21wVTJW?=
 =?utf-8?B?ZjFUSEFiS2MwZU1va1dwWStXcXNPcWdVQXZWN3pGRHZvSUdHQkFvZXBmSWhU?=
 =?utf-8?B?aGpMNHUxajRqVEExeXBiYlppaDhybFkrQ2JSSkMwTWpDNGNUSWhVb0dYVFRn?=
 =?utf-8?B?dUVzMzU2WjRJa0gxeHNJZ0k1TzhnZzVEUDRVdmpUZzdsZU9rY203eUlsQnh3?=
 =?utf-8?B?YUU2WUVjclJRaFNOclo3NkUreGh1U3h0UnByQzJhaGlJVXY4ZDhDL1p0c3g5?=
 =?utf-8?B?a0lhOFV2Q3d2aTgzelNRWjZPclpTclhZbHZvSHFiYndSaGU3OUlWU21pdFk3?=
 =?utf-8?B?Y3JTUTJKVFpSa01XaUtZRlE0clpHekJzeksrWHRrSzhIRDdZUkRwcG1wWmhm?=
 =?utf-8?B?bUJmNUR5SlNKeFhKNVVNMU5EbUFJTkJyd1hyYzJGMS9JQ0xLcGltRHJjOXB2?=
 =?utf-8?B?OThEVXR3L3Zac2M3bmIxK1dyMkM4TVZyV0Z1WE14b2d6Mk1NbEhTVm1FQXFO?=
 =?utf-8?B?Y0xuaXhQZVZ4UjJSb0VidHk2TnFnTG1HQUhXMWcwNE1KZGoxTHUvTExVS3RS?=
 =?utf-8?B?SnpTM29vWkptQTJqZWg4OGkxNHIxeHh0M3JoT2ZPcndYbUkzcWViZXc5NUgw?=
 =?utf-8?B?Tk1sMU9jSSt1aHl1UGJudC92RVFZN3Vwc01FNHgyR1hqZ2M5NzRTNzdqNjl0?=
 =?utf-8?B?Wi9EeC9BSnRRNEhFVkcyZ0tGb1hTNStVTkZJSUd1dXlWdGxrVzJYWE5HUXBD?=
 =?utf-8?B?eGVMcGo1VHNuZkJ1dGxUQ0VkVVJvWkxvN2pHN3lReUdhN3hxWTJKeUwxQSsy?=
 =?utf-8?B?NzdQRGxwNS9uZUhyay9qUkNEOHdVeHF4Y1NlVEdhYUpHZWVLZHlWei85T1RK?=
 =?utf-8?B?eGpia0NUSzNQdGhVTmhoWkFmUXBDd0tkMHlBcTIrM1FhU1dQNWh3OXA3Z3lQ?=
 =?utf-8?B?MEMyRXJrTlBPeVVQTTZxelhBNmZpN3hMaVZOZXQybDUrMkc3NGhkMmY4bmdp?=
 =?utf-8?B?dUZpSjRmVEFrVlN1YzNkclFvYk91d1RvbktBT0IzajBlQVNkNUdZTXpTWlJp?=
 =?utf-8?B?dzYzNktoNmRveUNHWUlobDE1SW02VWFmNHgybGF4R1FyZzVMQ1duZi9RbkVx?=
 =?utf-8?B?cjBYWkdNZjRROFp1WC9NREY5T3hGR0l6RUQwdU5RQ3c5Mm16ZkdDR1VuYXI4?=
 =?utf-8?B?SldZbDN6bnVnd0FsM05kcmEyVU5yZ1RVWlBweGR6V3BYWEduNW5hbWdBd2N3?=
 =?utf-8?B?bTZ0VWZFSjZTVXY1RVloRmdrWnVEZ1dRTUxmV055M01GQXl5eUVBKzJhWkFR?=
 =?utf-8?B?M1d5VTVxN05mdlluMG42WWR3NXdqTGdaNCtIbE9DVHNtRW5mbEdXb3ZDY0Ns?=
 =?utf-8?B?UTRNZkVjZ3ppMWczbGo4SFYwTzZodmJDUTlwZi82RE9rS2ZYNjhva1VzVjlK?=
 =?utf-8?B?aWdMdFB3V1M5UmdrNHAzKy8zcUpIaExaZlgrS001VTg2K0hUUmNpVW1xYWxE?=
 =?utf-8?Q?+C2SLqSr+QYj79+PhjvORfIEduX1DL/W3YxSo?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BCDDA4B0EDEB81408548F8127E81B58D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d49f5f-eb29-4190-0ed2-08da125c0dd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2022 14:46:20.3676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BV+NPBUUxAohCdDYI3T3Q7rakCr0Ro3HoR2whzy2iS3uQCQEepQzbgwzKkboRs9nfHPKwhD6C1f7pQ0dT39L2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3326
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10301
 signatures=695566
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=779
 spamscore=0
 adultscore=0 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203300072
X-Proofpoint-GUID: sb-6i4kJAgVY9nDftYkO8xEtyMsmdJkN
X-Proofpoint-ORIG-GUID: sb-6i4kJAgVY9nDftYkO8xEtyMsmdJkN
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTWFyIDMwLCAyMDIyLCBhdCA2OjA1IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gVHVlLCBNYXIgMjksIDIwMjIgYXQgMDM6
NTE6MTdQTSArMDAwMCwgSmFnIFJhbWFuIHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiBNYXIgMjks
IDIwMjIsIGF0IDg6NTAgQU0sIFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4g
d3JvdGU6DQo+Pj4gDQo+Pj4gT24gRnJpLCBNYXIgMjUsIDIwMjIgYXQgMDM6MTk6NDNQTSAtMDQw
MCwgSmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+Pj4+IEBAIC0zMjQsNiArMzI1LDE3MCBAQCBz
dGF0aWMgdm9pZCBkbWFfdW5yZWdpc3Rlcih2ZnVfY3R4X3QgKnZmdV9jdHgsIHZmdV9kbWFfaW5m
b190ICppbmZvKQ0KPj4+PiAgICB0cmFjZV92ZnVfZG1hX3VucmVnaXN0ZXIoKHVpbnQ2NF90KWlu
Zm8tPmlvdmEuaW92X2Jhc2UpOw0KPj4+PiB9DQo+Pj4+IA0KPj4+PiArc3RhdGljIHNpemVfdCB2
ZnVfb2JqZWN0X2Jhcl9ydyhQQ0lEZXZpY2UgKnBjaV9kZXYsIGludCBwY2lfYmFyLA0KPj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBod2FkZHIgb2Zmc2V0LCBjaGFyICogY29u
c3QgYnVmLA0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBod2FkZHIgbGVu
LCBjb25zdCBib29sIGlzX3dyaXRlKQ0KPj4+PiArew0KPj4+PiArICAgIHVpbnQ4X3QgKnB0ciA9
ICh1aW50OF90ICopYnVmOw0KPj4+PiArICAgIHVpbnQ4X3QgKnJhbV9wdHIgPSBOVUxMOw0KPj4+
PiArICAgIGJvb2wgcmVsZWFzZV9sb2NrID0gZmFsc2U7DQo+Pj4+ICsgICAgTWVtb3J5UmVnaW9u
U2VjdGlvbiBzZWN0aW9uID0geyAwIH07DQo+Pj4+ICsgICAgTWVtb3J5UmVnaW9uICptciA9IE5V
TEw7DQo+Pj4+ICsgICAgaW50IGFjY2Vzc19zaXplOw0KPj4+PiArICAgIGh3YWRkciBzaXplID0g
MDsNCj4+Pj4gKyAgICBNZW1UeFJlc3VsdCByZXN1bHQ7DQo+Pj4+ICsgICAgdWludDY0X3QgdmFs
Ow0KPj4+PiArDQo+Pj4+ICsgICAgc2VjdGlvbiA9IG1lbW9yeV9yZWdpb25fZmluZChwY2lfZGV2
LT5pb19yZWdpb25zW3BjaV9iYXJdLm1lbW9yeSwNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG9mZnNldCwgbGVuKTsNCj4+Pj4gKw0KPj4+PiArICAgIGlmICghc2VjdGlv
bi5tcikgew0KPj4+PiArICAgICAgICByZXR1cm4gMDsNCj4+Pj4gKyAgICB9DQo+Pj4+ICsNCj4+
Pj4gKyAgICBtciA9IHNlY3Rpb24ubXI7DQo+Pj4+ICsgICAgb2Zmc2V0ID0gc2VjdGlvbi5vZmZz
ZXRfd2l0aGluX3JlZ2lvbjsNCj4+Pj4gKw0KPj4+PiArICAgIGlmIChpc193cml0ZSAmJiBtci0+
cmVhZG9ubHkpIHsNCj4+Pj4gKyAgICAgICAgd2Fybl9yZXBvcnQoInZmdTogYXR0ZW1wdGluZyB0
byB3cml0ZSB0byByZWFkb25seSByZWdpb24gaW4gIg0KPj4+PiArICAgICAgICAgICAgICAgICAg
ICAiYmFyICVkIC0gWzB4JSJQUkl4NjQiIC0gMHglIlBSSXg2NCJdIiwNCj4+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgcGNpX2Jhciwgb2Zmc2V0LCAob2Zmc2V0ICsgbGVuKSk7DQo+Pj4+ICsgICAg
ICAgIHJldHVybiAwOw0KPj4+IA0KPj4+IEEgbXIgcmVmZXJlbmNlIGlzIGxlYWtlZC4gVGhlIHJl
dHVybiBzdGF0ZW1lbnQgY2FuIGJlIHJlcGxhY2VkIHdpdGggZ290bw0KPj4+IGV4aXQuDQo+PiAN
Cj4+IE9LLg0KPj4gDQo+Pj4gDQo+Pj4+ICsgICAgfQ0KPj4+PiArDQo+Pj4+ICsgICAgaWYgKG1l
bW9yeV9hY2Nlc3NfaXNfZGlyZWN0KG1yLCBpc193cml0ZSkpIHsNCj4+Pj4gKyAgICAgICAgLyoq
DQo+Pj4+ICsgICAgICAgICAqIFNvbWUgZGV2aWNlcyBleHBvc2UgYSBQQ0kgZXhwYW5zaW9uIFJP
TSwgd2hpY2ggY291bGQgYmUgYnVmZmVyDQo+Pj4+ICsgICAgICAgICAqIGJhc2VkIGFzIGNvbXBh
cmVkIHRvIG90aGVyIHJlZ2lvbnMgd2hpY2ggYXJlIHByaW1hcmlseSBiYXNlZCBvbg0KPj4+PiAr
ICAgICAgICAgKiBNZW1vcnlSZWdpb25PcHMuIG1lbW9yeV9yZWdpb25fZmluZCgpIHdvdWxkIGFs
cmVhZHkgY2hlY2sNCj4+Pj4gKyAgICAgICAgICogZm9yIGJ1ZmZlciBvdmVyZmxvdywgd2UgZG9u
J3QgbmVlZCB0byByZXBlYXQgaXQgaGVyZS4NCj4+Pj4gKyAgICAgICAgICovDQo+Pj4+ICsgICAg
ICAgIHJhbV9wdHIgPSBtZW1vcnlfcmVnaW9uX2dldF9yYW1fcHRyKG1yKTsNCj4+Pj4gKw0KPj4+
PiArICAgICAgICBzaXplID0gbGVuOw0KPj4+IA0KPj4+IFRoaXMgbG9va3MgbGlrZSBpdCB3aWxs
IGFjY2VzcyBiZXlvbmQgdGhlIGVuZCBvZiByYW1fcHRyIHdoZW4NCj4+PiBzZWN0aW9uLnNpemUg
PCBsZW4gYWZ0ZXIgbWVtb3J5X3JlZ2lvbl9maW5kKCkgcmV0dXJucy4NCj4+IA0KPj4gT0sgLSB3
aWxsIHdpbGwgaGFuZGxlIHNob3J0ZXIgc2VjdGlvbnMgcmV0dXJuZWQgYnkgbWVtb3J5X3JlZ2lv
bl9maW5kKCkuDQo+PiANCj4+PiANCj4+Pj4gKw0KPj4+PiArICAgICAgICBpZiAoaXNfd3JpdGUp
IHsNCj4+Pj4gKyAgICAgICAgICAgIG1lbWNweSgocmFtX3B0ciArIG9mZnNldCksIGJ1Ziwgc2l6
ZSk7DQo+Pj4+ICsgICAgICAgIH0gZWxzZSB7DQo+Pj4+ICsgICAgICAgICAgICBtZW1jcHkoYnVm
LCAocmFtX3B0ciArIG9mZnNldCksIHNpemUpOw0KPj4+PiArICAgICAgICB9DQo+Pj4+ICsNCj4+
Pj4gKyAgICAgICAgZ290byBleGl0Ow0KPj4+IA0KPj4+IFdoYXQgaGFwcGVucyB3aGVuIHRoZSBh
Y2Nlc3Mgc3BhbnMgdHdvIGFkamFjZW50IE1lbW9yeVJlZ2lvbnM/IEkgdGhpbmsNCj4+PiB0aGUg
d2hpbGUgKGxlbiA+IDApIGxvb3AgaXMgbmVlZGVkIGV2ZW4gaW4gdGhlIG1lbW9yeV9hY2Nlc3Nf
aXNfZGlyZWN0KCkNCj4+PiBjYXNlIHNvIHdlIHBlcmZvcm0gdGhlIGZ1bGwgYWNjZXNzIGluc3Rl
YWQgb2YgdHJ1bmNhdGluZyBpdC4NCj4+IA0KPj4gT0sgLSB0aGlzIHNob3VsZCBiZSBjb3ZlcmVk
IGJ5IHRoZSBzaG9ydGVyIHNlY3Rpb24gaGFuZGxpbmcgYWJvdmUuDQo+IA0KPiBObywgc2hvcnRl
ciBzZWN0aW9uIGhhbmRsaW5nIHRydW5jYXRlcyB0aGF0IGFjY2Vzcy4gSSB0aGluayB0aGUgY2Fs
bGVyDQo+IGV4cGVjdHMgYWxsIGxlbiBieXRlcyB0byBiZSBhY2Nlc3NlZCwgbm90IGp1c3QgdGhl
IGZpcnN0IGZldyBieXRlcz8NCg0KWWVzLCBJIGFsc28gdGhpbmsgdGhhdCB0aGUgY2FsbGVyIGV4
cGVjdHMgdG8gYWNjZXNzIGFsbCBsZW4gYnl0ZXMuDQoNCkkgc2hvdWxk4oCZdmUgcHJvdmlkZWQg
bW9yZSBkZXRhaWxzIC0gYnV0IGJ5IHNob3J0ZXIgc2VjdGlvbiBoYW5kbGluZyBJDQptZWFudCBp
dGVyYXRpbmcgb3ZlciBhbGwgdGhlIHNlY3Rpb25zIHRoYXQgbWFrZSB1cCBsZW4gYnl0ZXMuDQoN
ClRoYW5rIHlvdSENCi0tDQpKYWcNCg0KPiANCj4gU3RlZmFuDQoNCg==

