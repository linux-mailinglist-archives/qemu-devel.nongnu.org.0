Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 315C65A1A16
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 22:12:23 +0200 (CEST)
Received: from localhost ([::1]:40138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRJDB-00027R-Qo
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 16:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1oRJ3y-0007ej-Jm
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 16:02:50 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:54252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1oRJ3u-0007Kb-J5
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 16:02:50 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27PJk8W1023615;
 Thu, 25 Aug 2022 20:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=corp-2022-7-12;
 bh=dYxkK+U8LvG+HcHx6BWW8mm+bh/wm/nuiccHyZo/Mxk=;
 b=BXa2c4BZGtPQus3qAByQHx3gC8jOw0Z3k/bX9sylu4hYQywbzCnBAiiYxeCGAqbfK9N/
 5SapDMGp/gU12Q7NrdXasaWvGRxfY7dVlVVd6WIf00ndggeSzQBlYcP9pR2bpv2Bdvvt
 AkYpzXjtRm4UA4ZECOw0e0lYF6ZSdIhCmS+ClNbSnOJeay7fCWwoTL0d0+a3qSQi/725
 U3kcgJepkPpu3/FlqHm3QptL4Djhylim02Xno5y2dZhMOxo8F5ViDvW/1X6yv9xpsqYl
 w2wm9fVbdn/fkdmSR+vtO8Kz/SyUgdhmpRu0H26c9kaDXI4yPpZ1RrWHQRfYePGfg26s Yw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j5aww588x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Aug 2022 20:02:21 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27PJbKnF016775; Thu, 25 Aug 2022 20:02:20 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3j5n5841nv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Aug 2022 20:02:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjQyrONPbiJPJV6Kw8jk5ekYc8xjQqDOq5EwqBHrwcJIGVPnp5w/Dw5WMxzbVN+ODxyHoqDzHVbn9HXXUzopMid/4qLYY85CV/rNLKkQl08MLt38GsFbsGx55a1QdvG7dmWpZo9so84hC2vw6hRAHkZLwVr7UkpR5rGfUgdtuWq3vm/N8iL2W4zjCs5aUvKLuVgw75wjSwFxcoDbbPk37ItJkkyxojYrpEDHQ4CPUNm68NZKZ51+W0LSsfzOmRNZf+uXKFomeco1tl969S38YscR3AgWkxhVYscJPE4Q/jnYhXV6z9MtJtqHH6aPwQEtuNw5gBees/pzXBRk8u9CxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYxkK+U8LvG+HcHx6BWW8mm+bh/wm/nuiccHyZo/Mxk=;
 b=OGmKWif7YaAmzeMcMXLjNoO90MmxWukOiPOia0ppkWiAkM8c61Le/BLfeF3dqltFVdf4TmEoa+iBtQfRsHiBxGspxGUPfeklVEu+eN8Y1iKFjnSL1rWc+R7X4R/EKJrPsuUY4qQ9wF/7qNrkb7g7F8WnRq5oqrUKY0+6XV7v742N1/js+H23hQqWIAMEaVs2FMBVlzA0Tebarhp/d7VbUNXatRPQhNgAUDaa2esnTEiSEpvU/LqhOZpVvYliB79tgc+2x/ZS5LWi9/eozVP8Q1ucsMynVO03VbgzhhWIP1hdrGM3Tfkw+511Eapv+0iexRcC3wrDeYJ8qP4uRH4gdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYxkK+U8LvG+HcHx6BWW8mm+bh/wm/nuiccHyZo/Mxk=;
 b=hoph7o2qKe2Yin+ZkN4vkN8VSQslqr1ccFsQUCPb+6FEoLURa/Dj+JJ5iSKOWVL3HnyOSclq9gIN2PgZXfs94P7F+uspyYTQj7sQ5dzWfzAdAOAcMFgUXCIt+FEdPJc9SEJ3wUR/tMN9sHUrHN4u2Z+VrPH/ihhw0PZ7/F+81gE=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN8PR10MB3377.namprd10.prod.outlook.com (2603:10b6:408:cf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Thu, 25 Aug
 2022 20:02:06 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::9d2b:e337:f68c:71ad]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::9d2b:e337:f68c:71ad%4]) with mapi id 15.20.5546.022; Thu, 25 Aug 2022
 20:02:06 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Thomas Huth <thuth@redhat.com>
CC: Elena Ufimtseva <elena.ufimtseva@oracle.com>, John Johnson
 <john.g.johnson@oracle.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Subject: Re: libvfio-user test-client-server test hanging in the CI
Thread-Topic: libvfio-user test-client-server test hanging in the CI
Thread-Index: AQHYuLyHKOkh5Sv7LEeRkOlXCrpUdq3ACZ+A
Date: Thu, 25 Aug 2022 20:02:06 +0000
Message-ID: <66394A5D-B277-4B47-85AF-E854E8B06137@oracle.com>
References: <8b49b0cf-7fb3-1450-c72b-cdc21003ceeb@redhat.com>
In-Reply-To: <8b49b0cf-7fb3-1450-c72b-cdc21003ceeb@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d3c5ef7-20ec-4523-ca01-08da86d4afcc
x-ms-traffictypediagnostic: BN8PR10MB3377:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v0qTGIjlA9RCi8oRTCpzTVKQrIp8Q9/1ZbtsOR7Rz8Ygklf9VhZQjnQg2JafFKrfQ0ZWTkd/jVozo4CZtHbMaQsgQ2uyPK+r3QvoFErMYymj85W29ph5zGE/z/dtCKlraoyAkguwXv82FDOXmq85AmlpttNx3SkMM75giCCiNW1YgtsQ4yY7pKp587FOBpYwVWY9ENNxboXdNyygPOS7v2dmytLbQXBKOwpTDxk+vZlTXxomhwZ88u38tuW5g8l1pD3MVN23Gs8ju7OcrGMZZ6OEhkBY7wNK1ScAYsRPW2h3c3f+1fvLH2w41EegEECuB3Z4y/77qOc0oP/nwBuB+57AAtN85QTKFdndhsuV+RTJB3ekEkYb4pav5kkIngSLW5/Vpl/48pAC1CzruK+OXiHEe9GG+ZrTmySoNJ1ZUSsN1KJ5Oii0FhFlcGzfR357IXLNZOCLH5L8m0iuWpSYPDsNq0BV3P2RbaJJ4gYdCKH7F8FPkl9ctCZmdl9rSahB73OF0rMD2ED3HjODymcAuWyVO0lUoQqqyJ3KoSzZkHBe/DVlRvZxO9FTdJZqWlphWH+Ugx8FjiNu4LL+b7scUnabmeLT0WSaSv7oW26ArloX4dEhARLNOTLPUQ/fAtEGPNrIOBS9qy5Nn88hy5phziKbMgS/14toNNxH34fbWTbNUHNk3glUNWXsJXaupYdSrWZkEHih2r8HcToDibVxysJpjw9oUTf/lXSGa0Q4KQ4Uy42s5CGQUbYvSyM0MNKlSVkJK+RNg5RH4SLmXFmFnamVJAvRtosU8+fvIFEuhx/ZDdcsWlp9kVUcLqQn7MGeqR2zbR9ywet7XFFP6NnsoU8N254NEbHKgefBR/rRlkY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(39860400002)(346002)(136003)(366004)(53546011)(478600001)(2616005)(186003)(122000001)(41300700001)(966005)(83380400001)(6486002)(5660300002)(36756003)(71200400001)(316002)(6512007)(86362001)(6506007)(2906002)(166002)(4744005)(38070700005)(8936002)(38100700002)(44832011)(76116006)(6916009)(64756008)(91956017)(66446008)(33656002)(8676002)(66556008)(54906003)(4326008)(66946007)(66476007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFoxckFKTkdodzgydnJ4Z015YzNKV3Q3eWNQKzAxM2JSTE1keG9rTU1CQWhk?=
 =?utf-8?B?MWZXLzhKN3hDRk5WZm4zVDlSUlJNbkVPQTlsbjdETDcrTHpkWEdOUjYwUDcy?=
 =?utf-8?B?NG81YU1LNmpjZ2NGOVowaEpnbkFMY0o3RUZzWjZRWGs0WVJqdnJ0aHd2QkE2?=
 =?utf-8?B?ajVtRHFMS08xcEY1S3E3MGxpSzVNaGgxYkVZQXFRZUQxcU1Va1lWc3VycXJx?=
 =?utf-8?B?TkNrNHVDbnh4U2ZvRVE4L0xIaWVjWnI5U1ZKakY1VGRYZ203YWd2OUlBcEZh?=
 =?utf-8?B?V2EzcStRbEloc1ZCNGJaU20rbzhhKzFFd0E0emR5UUFCaHJCcXA4RkdWekZ0?=
 =?utf-8?B?cHJXLzNycGViaCthdlRrNkVTTkRQUnZsWHlSa216aDJpdFR2RkxCNWRUQU5y?=
 =?utf-8?B?SUNyVHVpNjBmUGQrRkU2WStWYnBXNWc1SWU0VTF5b0RON1Y0SnNUNktVSzg5?=
 =?utf-8?B?ZGYxTVJGUHV6dVRBdUx1ZzZ0NEVjWkZjR0lGUGZjWVk4emJyVExQdFlqYlE2?=
 =?utf-8?B?YzBLVm0vb29PL3RIdnNZaVBFb3Rpc3ZtZ0hRNHpSdGUvZmNEa2QwNlRPeXVy?=
 =?utf-8?B?VHA0VCtkem1IZUFRQW1IU0kzdXBpVFpMa2I5bmxQWU9TT0RPamNzcnFXMVBC?=
 =?utf-8?B?SHlUZWJOS0gwZ09zZ2IrVU9nc0I0VVlVWUhyT005bXpEZTdDYzhSTXFCMGUy?=
 =?utf-8?B?MUxMM282YjAvWkZaZHhNb0tzZVJ5c2QyM004RW9ENGJ1Y3VITGpHVG1NWk11?=
 =?utf-8?B?ZE5oMm9VQ3JhTlVTV1NDNlZOd1lSSGFVaU90YVEweGEydjZTcUVMNW10Rzha?=
 =?utf-8?B?NUhtYnhXUkJlTjZvaWMzZlhuQVdNVEJoSjYzOXJUVlovemwwcEgvVjIraTFC?=
 =?utf-8?B?QkpXZHBuUmxCMDBhR0xLcXdJZTYzZHlnQ1U4SW94V3lHcnlseWJraUpYZ2N0?=
 =?utf-8?B?NEdMUXZhZHlHSUFZdFdQNVFtMmxJREVTVk0vSFg1MEE2RGpkYlhidlk2RTY3?=
 =?utf-8?B?a2YxeFZveEh6YUF5YUplWWFYcUJXaFJ0bjRYdjRsMnBxK0ZwdzVMZytUZlor?=
 =?utf-8?B?Qmk4bm9TakM2alVGOFJtaTNBdldKbFZsQThaSWNPV3pOeE9SeDZSQ0JHSHpy?=
 =?utf-8?B?Ymttd2hmK3JyYVdQcHRtK2d0OFJ5UmFWcXVrYXRRYXQxKzFCYnFCeitLMXhz?=
 =?utf-8?B?eG95SWt2aFJOamJlTnc1TG9OR2xrQWcwQlpqQ3Q3L1o2VFlGOUtKTDNwQzRJ?=
 =?utf-8?B?NlRYamhITkJwUTVhYXJwcjZ1M2NvTnVMSFFsSXdNZXNGNWZ6MW5XY3JLbFQ5?=
 =?utf-8?B?NWFSV21DUDN5TDFPNjRWMXo4NFlhVVVtWW9sMW1hdTJlbHp1TE90TnBnWXU2?=
 =?utf-8?B?T2xDY0lCMG1lVWNTSElWcW1yT0tCeEFzZEJZd0VuRXhOWXZ2MmlzeWE2NUJm?=
 =?utf-8?B?djdGZnVoN21iOWJnZDdnZ2lmOU0xTytmVy9HNEhnS3M0eXNUYlNJblhPaEZj?=
 =?utf-8?B?dkhwQWdTZDdFQk9Ic1l6RWV4Z1FVZHViNVNOUVkrQVc1RmYwTnBvNHI2ZVh5?=
 =?utf-8?B?TDFoS0FtVlBkUUNEczNlR3VQOWpidFBlNnRHTmZaK1hpZVN2eVI5OE1sR1Ew?=
 =?utf-8?B?eFIvTVJkTk4ybnUxQUhBT01OdUkzeGdLczFBVEE4YUllM2FYeE5tRzJ3VEJq?=
 =?utf-8?B?OXUxQ2RtMVV4OUticWg0SVE1T1lIc3FIMTlxalNyMk12Nm1KeDZOLzVLaER4?=
 =?utf-8?B?RDF0UGRZUEdVVlJzeVNIeTdFVjg2N0RZSDN4YWt6UmlMVmNvYWlUUUIrQWZY?=
 =?utf-8?B?NHBsaGRtK1B0SkpXTXdZM1RGd2U3RzRZNDFkNmxONzE5TFRQdk5yT2pFS0d4?=
 =?utf-8?B?RmJlMnluU3VzZll5UUtwbEIyeDE3ajVrTU96bm1ydG1YcTljUlJXbFUxTEFi?=
 =?utf-8?B?UmxnV2ZpVEtOQjBHNUVjdUZxUExsbTA2byt0cGoxcEZXM2Z5TmFPKzdNcytG?=
 =?utf-8?B?UE44alRUcEozTmFHVkhUQ0FtUXpYY1dZQzlrMVBPWTd6bjVtOG5uOWovL1Zn?=
 =?utf-8?B?aWZVNGtxUVN0Z2Z0ak1kZlYzYzV6QllqVnZZSWVDbWgrN0d6VmJhV1BKMDBL?=
 =?utf-8?B?a3hzMWZpVC9SanBWd1lQakVpVnBHbEs1SjFyZnRwWmd6Ti9XSmdSb1hGQ0Ju?=
 =?utf-8?Q?sdZ/b46zW4vfpLSZOjXOQMM=3D?=
Content-Type: multipart/alternative;
 boundary="_000_66394A5DB2774B4785AFE854E8B06137oraclecom_"
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d3c5ef7-20ec-4523-ca01-08da86d4afcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2022 20:02:06.6500 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YcjoPVrFRs4tFdKoXtEn/rpYvDwX+eRlCJeH+ofaQUbhdafYjsfJ4He5Ac/G3rualJm6273OBEZE3XJUPn1sRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3377
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_10,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208250076
X-Proofpoint-GUID: MhhDV7QPHGAXy3XPfPZxNnTP7wY-uz0V
X-Proofpoint-ORIG-GUID: MhhDV7QPHGAXy3XPfPZxNnTP7wY-uz0V
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_66394A5DB2774B4785AFE854E8B06137oraclecom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIEF1ZyAyNSwgMjAyMiwgYXQgMzo1NCBQTSwgVGhvbWFzIEh1dGggPHRodXRoQHJlZGhh
dC5jb208bWFpbHRvOnRodXRoQHJlZGhhdC5jb20+PiB3cm90ZToNCg0KDQpIaSBFbGVuYSwgSmFn
YW5uYXRoYW4gJiBKb2huIQ0KDQpJIG5vdGljZWQgdGhhdCB0aGUgbGlidmZpby11c2VyIHRlc3Qt
Y2xpZW50LXNlcnZlciB0ZXN0IGlzIHJlY2VudGx5IGhhbmdpbmcgaW4gdGhlIGNoZWNrLXN5c3Rl
bS1jZW50b3Mgam9icyBpbiBRRU1VJ3MgZ2l0bGFiLUNJLiBOb3JtYWxseSB0aGUgdGVzdCBmaW5p
c2hlcyB3aXRoaW4gMjAgbWludXRlcywgc2VlIGUuZy4gaGVyZToNCg0KaHR0cHM6Ly9naXRsYWIu
Y29tL3FlbXUtcHJvamVjdC9xZW11Ly0vam9icy8yOTI4NTYxNDAzDQoNCihub3RpY2UgdGhhdCB0
ZXN0LWNsaWVudC1zZXJ2ZXIgaGFzIG51bWJlciAyNTIvMjc0IGhlcmUpLg0KDQpCdXQgaW4gbWFu
eSByZWNlbnQgcnVucywgaXQgc2VlbXMgdG8gaGFuZyBhZnRlciBudW1iZXIgMjUxOg0KDQpodHRw
czovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9qb2JzLzI5MjI3NDMzMjQNCmh0dHBz
Oi8vZ2l0bGFiLmNvbS90aHV0aC9xZW11Ly0vam9icy8yOTM0Mjk5MDA1DQouLi4NCg0KQ291bGQg
eW91IHBsZWFzZSBoYXZlIGEgbG9vaz8gQWxzbywgd2h5IGlzIHRoZSB0ZXN0IG5vdCB0aW1pbmcg
b3V0IGFmdGVyIHNvbWUgbWludXRlcz8gLi4uIGNvbXBsZXRlbHkgYmxvY2tpbmcgdGhlIENJIGpv
YiBmb3IgdGhlIHJlc3Qgb2YgdGhlIGhvdXIgJ3RpbCB0aGUgZ2xvYmFsIDYwIG1pbnV0ZXMgdGlt
ZW91dCBraWNrcyBpbiBpcyBub3QgdmVyeSBuaWNlIDotKA0KDQpIaSBUaG9tYXMsDQoNClRoZSBm
b2xsb3dpbmcgcGF0Y2ggc2hvdWxkIGZpeCBpdCAtIGl04oCZcyBzdGlsbCB1bmRlciByZXZpZXc6
DQpbUEFUQ0ggMC8xXSBVcGRhdGUgdmZpby11c2VyIG1vZHVsZSB0byB0aGUgbGF0ZXN0DQoNCkni
gJlsbCBraWNrIHRoYXQgdGhyZWFkIHRvIGNoZWNrIHRoZSBzdGF0dXMgb2YgdGhpcyBwYXRjaC4N
Cg0KLS0NCkphZw0KDQoNClRoYW5rcywNCiBUaG9tYXMNCg0KDQo=

--_000_66394A5DB2774B4785AFE854E8B06137oraclecom_
Content-Type: text/html; charset="utf-8"
Content-ID: <1130F051A2B4894182156CCA2A239D93@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCjxkaXY+PGJyIGNsYXNz
PSIiPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPk9u
IEF1ZyAyNSwgMjAyMiwgYXQgMzo1NCBQTSwgVGhvbWFzIEh1dGggJmx0OzxhIGhyZWY9Im1haWx0
bzp0aHV0aEByZWRoYXQuY29tIiBjbGFzcz0iIj50aHV0aEByZWRoYXQuY29tPC9hPiZndDsgd3Jv
dGU6PC9kaXY+DQo8YnIgY2xhc3M9IkFwcGxlLWludGVyY2hhbmdlLW5ld2xpbmUiPg0KPGRpdiBj
bGFzcz0iIj4NCjxkaXYgY2xhc3M9IiI+PGJyIGNsYXNzPSIiPg0KSGkgRWxlbmEsIEphZ2FubmF0
aGFuICZhbXA7IEpvaG4hPGJyIGNsYXNzPSIiPg0KPGJyIGNsYXNzPSIiPg0KSSBub3RpY2VkIHRo
YXQgdGhlIGxpYnZmaW8tdXNlciB0ZXN0LWNsaWVudC1zZXJ2ZXIgdGVzdCBpcyByZWNlbnRseSBo
YW5naW5nIGluIHRoZSBjaGVjay1zeXN0ZW0tY2VudG9zIGpvYnMgaW4gUUVNVSdzIGdpdGxhYi1D
SS4gTm9ybWFsbHkgdGhlIHRlc3QgZmluaXNoZXMgd2l0aGluIDIwIG1pbnV0ZXMsIHNlZSBlLmcu
IGhlcmU6PGJyIGNsYXNzPSIiPg0KPGJyIGNsYXNzPSIiPg0KPGEgaHJlZj0iaHR0cHM6Ly9naXRs
YWIuY29tL3FlbXUtcHJvamVjdC9xZW11Ly0vam9icy8yOTI4NTYxNDAzIiBjbGFzcz0iIj5odHRw
czovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9qb2JzLzI5Mjg1NjE0MDM8L2E+PGJy
IGNsYXNzPSIiPg0KPGJyIGNsYXNzPSIiPg0KKG5vdGljZSB0aGF0IHRlc3QtY2xpZW50LXNlcnZl
ciBoYXMgbnVtYmVyIDI1Mi8yNzQgaGVyZSkuPGJyIGNsYXNzPSIiPg0KPGJyIGNsYXNzPSIiPg0K
QnV0IGluIG1hbnkgcmVjZW50IHJ1bnMsIGl0IHNlZW1zIHRvIGhhbmcgYWZ0ZXIgbnVtYmVyIDI1
MTo8YnIgY2xhc3M9IiI+DQo8YnIgY2xhc3M9IiI+DQo8YSBocmVmPSJodHRwczovL2dpdGxhYi5j
b20vcWVtdS1wcm9qZWN0L3FlbXUvLS9qb2JzLzI5MjI3NDMzMjQiIGNsYXNzPSIiPmh0dHBzOi8v
Z2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8tL2pvYnMvMjkyMjc0MzMyNDwvYT48YnIgY2xh
c3M9IiI+DQo8YSBocmVmPSJodHRwczovL2dpdGxhYi5jb20vdGh1dGgvcWVtdS8tL2pvYnMvMjkz
NDI5OTAwNSIgY2xhc3M9IiI+aHR0cHM6Ly9naXRsYWIuY29tL3RodXRoL3FlbXUvLS9qb2JzLzI5
MzQyOTkwMDU8L2E+PGJyIGNsYXNzPSIiPg0KLi4uPGJyIGNsYXNzPSIiPg0KPGJyIGNsYXNzPSIi
Pg0KQ291bGQgeW91IHBsZWFzZSBoYXZlIGEgbG9vaz8gQWxzbywgd2h5IGlzIHRoZSB0ZXN0IG5v
dCB0aW1pbmcgb3V0IGFmdGVyIHNvbWUgbWludXRlcz8gLi4uIGNvbXBsZXRlbHkgYmxvY2tpbmcg
dGhlIENJIGpvYiBmb3IgdGhlIHJlc3Qgb2YgdGhlIGhvdXIgJ3RpbCB0aGUgZ2xvYmFsIDYwIG1p
bnV0ZXMgdGltZW91dCBraWNrcyBpbiBpcyBub3QgdmVyeSBuaWNlIDotKDxiciBjbGFzcz0iIj4N
CjwvZGl2Pg0KPC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8ZGl2PjxiciBjbGFzcz0iIj4NCjwvZGl2
Pg0KPGRpdj5IaSBUaG9tYXMsPC9kaXY+DQo8ZGl2PjxiciBjbGFzcz0iIj4NCjwvZGl2Pg0KPGRp
dj5UaGUgZm9sbG93aW5nIHBhdGNoIHNob3VsZCBmaXggaXQgLSBpdOKAmXMgc3RpbGwgdW5kZXIg
cmV2aWV3OjwvZGl2Pg0KPGRpdj4NCjxkaXYgc3R5bGU9Im1hcmdpbjogMHB4IDBweCAwcHggNnB4
OyBmb250LXN0cmV0Y2g6IG5vcm1hbDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsgZm9udC1mYW1pbHk6
ICZxdW90O0hlbHZldGljYSBOZXVlJnF1b3Q7OyBjb2xvcjogcmdiYSgwLCAwLCAwLCAwLjg1KTsi
IGNsYXNzPSIiPg0KW1BBVENIIDAvMV0gVXBkYXRlIHZmaW8tdXNlciBtb2R1bGUgdG8gdGhlIGxh
dGVzdDwvZGl2Pg0KPC9kaXY+DQo8ZGl2PjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiYSgwLCAwLCAw
LCAwLjg1KTsgZm9udC1mYW1pbHk6ICZxdW90O0hlbHZldGljYSBOZXVlJnF1b3Q7OyIgY2xhc3M9
IiI+PGJyIGNsYXNzPSIiPg0KPC9zcGFuPjwvZGl2Pg0KPGRpdj48c3BhbiBzdHlsZT0iY29sb3I6
IHJnYmEoMCwgMCwgMCwgMC44NSk7IGZvbnQtZmFtaWx5OiAmcXVvdDtIZWx2ZXRpY2EgTmV1ZSZx
dW90OzsiIGNsYXNzPSIiPknigJlsbCBraWNrIHRoYXQgdGhyZWFkIHRvIGNoZWNrIHRoZSBzdGF0
dXMgb2YgdGhpcyBwYXRjaC48L3NwYW4+PC9kaXY+DQo8ZGl2PjxzcGFuIHN0eWxlPSJjb2xvcjog
cmdiYSgwLCAwLCAwLCAwLjg1KTsgZm9udC1mYW1pbHk6ICZxdW90O0hlbHZldGljYSBOZXVlJnF1
b3Q7OyIgY2xhc3M9IiI+PGJyIGNsYXNzPSIiPg0KPC9zcGFuPjwvZGl2Pg0KPGRpdj48Zm9udCBm
YWNlPSJIZWx2ZXRpY2EgTmV1ZSIgY2xhc3M9IiI+PHNwYW4gc3R5bGU9ImNhcmV0LWNvbG9yOiBy
Z2JhKDAsIDAsIDAsIDAuODUpOyBjb2xvcjogcmdiYSgwLCAwLCAwLCAwLjg1KTsiIGNsYXNzPSIi
Pi0tPC9zcGFuPjwvZm9udD48L2Rpdj4NCjxkaXY+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2JhKDAs
IDAsIDAsIDAuODUpOyBmb250LWZhbWlseTogJnF1b3Q7SGVsdmV0aWNhIE5ldWUmcXVvdDs7IiBj
bGFzcz0iIj5KYWc8L3NwYW4+PC9kaXY+DQo8YnIgY2xhc3M9IiI+DQo8YmxvY2txdW90ZSB0eXBl
PSJjaXRlIiBjbGFzcz0iIj4NCjxkaXYgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPjxiciBjbGFz
cz0iIj4NClRoYW5rcyw8YnIgY2xhc3M9IiI+DQombmJzcDtUaG9tYXM8YnIgY2xhc3M9IiI+DQo8
YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8YnIg
Y2xhc3M9IiI+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_66394A5DB2774B4785AFE854E8B06137oraclecom_--

