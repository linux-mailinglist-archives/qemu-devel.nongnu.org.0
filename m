Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBD067D5A8
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 20:49:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL8Eo-0001cn-90; Thu, 26 Jan 2023 14:48:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninadpalsule@us.ibm.com>)
 id 1pL8Ek-0001cB-GO; Thu, 26 Jan 2023 14:48:42 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninadpalsule@us.ibm.com>)
 id 1pL8Ei-0001Zo-5F; Thu, 26 Jan 2023 14:48:42 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30QIErxX003070; Thu, 26 Jan 2023 19:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : date :
 message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=bH3nzvElvtH8MFEPjQxV1wZog6+iDhaJRhbDdgplpr4=;
 b=K2p1oan+2xG33LEwZ2Sycaj97bBIoE/x1sHRcOMAjB3o3BhDz93aGCPfNAoRIwYio9rX
 0r+J1H6oAwVe2XYTuzszkWfn5F10+OBUkROgutVviG9bweETSr4LTCJ1LugcX9KEyb9z
 BsR6WwmimTV49syZ0t6YPFB4EhJY8ccJsgW6s+3uuMxNCH+0fIvgB74R3mv6Rwo7ebBn
 gT7XZOupnZr08miEdIeCF9To873jKn/fsPnQlsoa7anWlcLoep9S5ePS87OcbTVKl63K
 qItiHYP/RTbHz0VgWNJyb0MDb0KBxr92InSf1tnAsiCiaS1CpqgePJktM98FPAKxPxC+ Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nbxmnu54w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jan 2023 19:48:20 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30QJU3f1022332;
 Thu, 26 Jan 2023 19:48:20 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nbxmnu54k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jan 2023 19:48:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUI2OAdS946/hRLrTiBrAvSdjP6hgdLshAaLNJk/tc1uf0RXjp32mVGKha4mDI5WGjDPSbPaOyjBCzNEpdLZFPPJXi2XMTSGQ1L+SB8GVK3gRbzIAds35q5As3Bn7vQAgZjUlV+o0GW6vYYK48UIkrcjjCrYKV/YPNbEyhvwXZJdWHgFK5VUsoBFD6CX+6TXk0PkTdp5iKQ81foFnJCEDW3NvmYm0u9y8pfvo2QpkU+zgBJacT7JnP4rpfkiSjAHZrEfmk+sKtCg2zrRmeRtncl92sCpc0HWYT1xXTwJ+AVCHK3RIxuMg9bGLb8hJ7ME0JDUczr+6/KK1yy4TMfuKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ubi4hri4qw8goh0zNna+5o7WZpjBgddIj6OzaQTmcEI=;
 b=LNW9RkR0IMzcam2NcSflIhv1DHNb1m+U9QbHBgiXC6b4F8A9AEFfyn/X4kg9hgM4KB+SLqRWd4oBTkgZ88PrJUTK3LheFd3+9v2XHgNCqnSHjjX63mkciiKdPGALM4HJErGWUK5GbQQtSWDshxoUpRxXHbcqM9qdvlkC+kIdZY25r8UW10yjCQ0niYSUZi3xUGHFFhe24IesQTvwGjYNznxr7NbO3D2uWPigtLjYjxKB5oyCdjCH46GGGEddIfOZcaskxyrIZuH6nOdO2pN+nhGq5T24Pby+BWV+H003kV5Z6L5odNaHVZ23BV4xsOktykjQc8dqwK2e9ARLXr3r8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=us.ibm.com; dmarc=pass action=none header.from=us.ibm.com;
 dkim=pass header.d=us.ibm.com; arc=none
Received: from MN2PR15MB3502.namprd15.prod.outlook.com (2603:10b6:208:ff::26)
 by SN7PR15MB5706.namprd15.prod.outlook.com (2603:10b6:806:34c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 19:48:18 +0000
Received: from MN2PR15MB3502.namprd15.prod.outlook.com
 ([fe80::be97:8dd6:5058:a62d]) by MN2PR15MB3502.namprd15.prod.outlook.com
 ([fe80::be97:8dd6:5058:a62d%5]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 19:48:18 +0000
From: Ninad S Palsule <ninadpalsule@us.ibm.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, "peter@pjd.dev"
 <peter@pjd.dev>
CC: "andrew@aj.id.au" <andrew@aj.id.au>, "hskinnemoen@google.com"
 <hskinnemoen@google.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "kfting@nuvoton.com" <kfting@nuvoton.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "philmd@linaro.org" <philmd@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Thread-Topic: [EXTERNAL] Re: [PATCH v4 3/5] hw/nvram/eeprom_at24c: Add
 init_rom field and at24c_eeprom_init_rom helper
Thread-Index: AQHZMN2HjTOj4RpcukKp4ueV4IqnkK6wSHCAgAA2NwCAAHRHAP//xQaA
Date: Thu, 26 Jan 2023 19:48:18 +0000
Message-ID: <682706AF-2691-4755-8344-9B388ACB23E0@us.ibm.com>
References: <3C616E21-EED8-4A17-9FC9-970939CC0926@contoso.com>
 <60a7ed30-b9f7-4943-5afe-fcd826ee6783@kaod.org>
 <5ADC51CD-F3D7-4F51-B125-9480C7FE86B0@us.ibm.com>
 <33448f9b-3a99-a15b-1176-229435a2d182@kaod.org>
In-Reply-To: <33448f9b-3a99-a15b-1176-229435a2d182@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR15MB3502:EE_|SN7PR15MB5706:EE_
x-ms-office365-filtering-correlation-id: d9dc7663-dcc0-4738-9512-08daffd645a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8uuYs6OKMHce6ha1nm3HYQK/wcREmhhJHoROTxaI+U5nIaxbcv9hP2qOv5jpPI1qrtFERdgc0vsrZITKO1sBXv0mlS4NMehh7nncC2MqqG+TYaaFka16jGiKObvo2cAee4010dOgwh+Z+68dwAj8W4dsfQtmgxopdeXGDDAI0uAeM3g+jaeNHIX/XWMcyXGBMUO/Q9noep7rFISDkMk7BLtCsRMOMuncuHwajC3joPraaBu04RMfe86hI0OGdhZmC2iDhZvYXtRF2ilQW4WmR7sO4ZOCdAX/H8TfAHBSGqPnWg/5BnKtyBOhxi9jgvEB8/Mu8lcOgkNHQwy1AJFtnMd1py3HMANzD4rJB25EciXzIIo9gSkMwZmhJJWrk9Q92VXURBmFe+D4WCaKbavE2THLunU/huyphxZd1eHmpt5KvpJcH7gdLhKbiSqUWqEn2QW7ixezrwSlOP8yUI8jnKf+1EXr9ihf+KKVC1imoo2R82qrtM6KIUDN2Zpaj62t2gWbh3YnOwmOv+uV80VYUKkA2zcZ4cx2VxJUR8ZafG84xyGqSRrkHpPVEPZ011aogXsVIDM+VanZD7rfqEA2vCOnk12c0WoWihBhMdbUOgzshKVpTId2je7d6I8ZfFJvkPskaW1wOCkSgMvFEJT0Pyp9Ef5GCKbtdBG7oNd2eVmjNG93hxuxiOowXYw4Fqrd0FBzcOuhxdSO1dJPKGbKzG3TvpEqOy+yc3v7J9acU48kSIAMLWvv/uMtyipptev7u2hgqkN2VK+wSGGmEGfbeA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR15MB3502.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199018)(76116006)(8676002)(66556008)(8936002)(5660300002)(122000001)(7416002)(316002)(66476007)(66946007)(186003)(966005)(2906002)(478600001)(53546011)(6512007)(91956017)(66446008)(86362001)(2616005)(66574015)(6506007)(38100700002)(33656002)(54906003)(110136005)(41300700001)(64756008)(6486002)(38070700005)(71200400001)(4326008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0tpWGNrYUdPcGs1NExUaCtKNGlkZGtHM0drM2Fsa2pQNWk1YW8wclJNaGg4?=
 =?utf-8?B?QlpjWEhoVnYyR3lzTk5sZk1QTnBFeU9DMnRsZHB4ZWV3TkRwMW4xWjFmWFNC?=
 =?utf-8?B?ZlMzcktGb0VjZnEzL0pLdTIwL09STEF1QUNrZS9UYXVHUjVlb1pmbTVqdEl2?=
 =?utf-8?B?VzhqYkRDNW92Zi9KdHRoZ00rRUZwMGJTZU05TnBydXpQS3J2eHBaNjBSUisr?=
 =?utf-8?B?OGNvZHJQT29rak9kVjFsd2x5VktudldxSEhhZ2xJUmJqMXR2a3IvSlprVStv?=
 =?utf-8?B?dG9KcTZ2MDd6c0JyT3ZzNnhZS3pEenlUQWs5YzdFUVQyakZZTDgwNnE3QlFY?=
 =?utf-8?B?OHZYWi9uR2puSmd2Rm1rOTc0Y0JqbkNyVDM0WFd2eUNhVHl3MDRBNkdNc2Mr?=
 =?utf-8?B?Nm9lWEhqZ3pyNnQwNjM2RGJob002SWFiOCtIVU5JZlRSN1R4dUF4NFRTUDZM?=
 =?utf-8?B?RHduWlR6T3BNTGtHRWd2VVhuSmE2QldoRnd6Ymt5THNya3RvU1A0cW9sZi81?=
 =?utf-8?B?Mk9kOWZCRUIzV2gyMHVjWTgrN0ZGenZSRm8vRXZQWU5kdXRFRHBzOXBKVjVa?=
 =?utf-8?B?a3BoNGw4SDl3WCtIcE5VLzRMZjdCazQraXh5Um1rakIvQVFPcTdqTGdTQ2lx?=
 =?utf-8?B?ODFRenE4N0FPRnB0QWZFR2k1T3NjMG5jQURuSHVJZ3E0bDBGVHRDVmdXc0Ur?=
 =?utf-8?B?Y0t3eWg0MncyUkdLQ1BRY2V0MFIvWmc2YXFRTzZZQzFSTFdhcHVaNElCclJG?=
 =?utf-8?B?bzI4WGFaSGgycXhwZ2QxOCtkTUZFTDdHTlNaZWd6bm5Sc2RNZ09wd3pOcDMx?=
 =?utf-8?B?N28vNXNMRXhCd2JVTjVORGZ0S2lHdHAvZk9aWDBKWXVBTG1lWkNwS1lwRjUr?=
 =?utf-8?B?MFJjVitjR0dVU25EdlhzR254dnFLVG9SdElCazQ3ZUN3ck1UejhXVzFXRkIz?=
 =?utf-8?B?ZCs3VFZNeVlPcG9BVVY4bFhtaGkvS09POFE3dXVhc3F0VUNtMm9EUG81YW5S?=
 =?utf-8?B?ZEhSYUV1MU1YeStvWmZyWUx6WFh4U0h5NStsb2EycDdmdlRaRlIzVUxhcnY2?=
 =?utf-8?B?cldvQ2NtUWRoM1J5Yy9YVU91TlBNNFFsQXFnQ3FYaGhHS3VPdk1ldEI2L1F2?=
 =?utf-8?B?MDJENm0rMSsyaWhuTFVXenlvVFFNL1RoZ1BIdU9rdisxMGNvT3lMZE5XR0NS?=
 =?utf-8?B?YlpCanFKL0x0elpYMVU4b1k5N2dPMnd5WXhidnhsNVhUYVhCZmtNTUpMdWUz?=
 =?utf-8?B?bjBzL1krS2daUS9jYTIweWFjcjgwNkI2a2NZNytXdzJJdlJ2V1VkYmFLMGZU?=
 =?utf-8?B?VHVnY1VsQ0s1eUU0WVVxcll6amc1RGpVN2d5SmdQVWpvdkRuQTlhdUk4clBy?=
 =?utf-8?B?SDB3QWVVWVRpaTdJbUhqNHVUVTlhWFd4dkZtSUZNbGV3U3ZUaStlV24vWDht?=
 =?utf-8?B?U1JLOFJ0RU1xOGEvZ0hVMm02QmFvS0FIU1BmSCtaeEQwTnpnV0F0dkxIL1ky?=
 =?utf-8?B?RnVhS1g2MmhodGxnaGM0MkIrWS9pYnRHNHZZNmVJMWxUamJHbVluc3JkbUsr?=
 =?utf-8?B?a2loUktyVGw4bXUyVjBDZE1maDlXeExKbmNXVXdLaWpOVCtibnRlSXRKTW9Y?=
 =?utf-8?B?dzc3VEtwVjBzN0ovSVd6Nk9RdE9vN2RSY0I2QldLWnpjVE50bXhtMm92MWNV?=
 =?utf-8?B?RlVITGxhZXBLVjFDbmxSS3VQU0V0NjFnTnFtdjZaWmtsZDhyMmVSMHFYUm1H?=
 =?utf-8?B?QnlRQ1kzcUhBTTRMQjQ1b1U3Q0xsckl4THU5Y1kxaHRtcC9BeFhQL01kOXlx?=
 =?utf-8?B?OUhNT09ISi8vZnpFQU1BTHE0UUgxY1pVVDUzcUM5SEljcENpTTQzdmVyb2Ra?=
 =?utf-8?B?QjU5eWZZZFN1cTVkblIrei9OTjcrR25YSWdKdWRmYnhFM1pRbTNNQUkyd2Fx?=
 =?utf-8?B?TjFyOElCNDdMZTFmYmxvMWN0WVBBQmZwZVVMVWxyODV6ZTJNcm4rU2pNSll6?=
 =?utf-8?B?U21FNzlyc2FmYVhSOVlGalk5ZXU0a1QxeU1TcWtvTE1kaE5uSUlTR2JFVFFk?=
 =?utf-8?B?b3F4MDdSdGdMZDlSVXg1Ym1yQXVSMVZkNGM2VmR0YUxmelZZVzlLN2NtSmxx?=
 =?utf-8?B?Vk9yT3BzVHd1MXYrQk13Q0V3SEVOV0dFRDRyYVJ2UFFybGtLN25HOUlzbUcx?=
 =?utf-8?B?b2lnNFJHWVBLWFI1Y0Nuem9RTHZWK2QvWlBBNC9sNG1ieDcvemhsVzdEbXRV?=
 =?utf-8?B?QjZhZE9IZWFWbTVHeUFHeTA0V0ZRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DDF980FDCC5C6445979B66BB2E4FF8EB@namprd15.prod.outlook.com>
X-OriginatorOrg: us.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR15MB3502.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9dc7663-dcc0-4738-9512-08daffd645a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2023 19:48:18.2688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XN3hOFLwMVNNZAKnDpILSmoYiGNtIPmqWPNZlntUYZYqB8DRvAbIDMSxRBogHuwsjU6LCMWgZLbx2Wo00mKi4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR15MB5706
X-Proofpoint-GUID: H_AjY3nrl3e3S_POCBgP9sXurMwVyEuS
X-Proofpoint-ORIG-GUID: VD9jY5jOfl00Sg_zrn6Hzex8PbgK5drb
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 2 URL's were un-rewritten
MIME-Version: 1.0
Subject: RE: [PATCH v4 3/5] hw/nvram/eeprom_at24c: Add init_rom field and
 at24c_eeprom_init_rom helper
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-26_09,2023-01-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301260183
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=ninadpalsule@us.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

T24gMS8yNi8yMywgMTE6MTkgQU0sICJDw6lkcmljIExlIEdvYXRlciIgPGNsZ0BrYW9kLm9yZyA8
bWFpbHRvOmNsZ0BrYW9kLm9yZz4+IHdyb3RlOg0KDQoNCk9uIDEvMjYvMjMgMTc6MjMsIE5pbmFk
IFMgUGFsc3VsZSB3cm90ZToNCj4gSGkgQ2VkcmljLA0KPiANCj4gR29vZCBzdWdnZXN0aW9uIGJ1
dCB3ZSB3aWxsIG5vdCBiZSBhYmxlIHRvIHNoYXJlIHRob3NlIEVFUFJPTSBpbWFnZSBmaWxlcyB5
ZXQuDQo+IFdlIGFyZSB0cnlpbmcgdG8gZmlndXJlIG91dCBob3cgdG8gc2FuaXRpemUgdGhlbS4N
Cg0KDQpGb3IgZWVwcm9tIHRlc3RzLCB0aGV5IGNvdWxkIGNvbnRhaW4gYW55IGRhdGEgd2l0aCBz
b21lIHdlbGwga25vdyBwYXR0ZXJuDQp0byBjaGVjay4gSXQgY291bGQvc2hvdWxkIGJlIGdlbmVy
YXRlZC4gTm8gbmVlZCB0byB1c2UgcmVhbCBkYXRhLg0KDQoNClJlYWwgZWVwcm9tIGRhdGEgd291
bGQgYmUgZm9yIHRlc3RpbmcgdGhlIHJhaW5pZXItYm1jIG1hY2hpbmUgd2l0aCBhIHJlYWwNCmZp
cm13YXJlIGltYWdlLCBzdWNoIGFzIE9wZW5CTUMgOg0KDQoNCmh0dHBzOi8vamVua2lucy5vcGVu
Ym1jLm9yZy9qb2IvY2ktb3BlbmJtYy9kaXN0cm89dWJ1bnR1LGxhYmVsPWRvY2tlci1idWlsZGVy
LHRhcmdldD1wMTBibWMvbGFzdFN1Y2Nlc3NmdWxCdWlsZC9hcnRpZmFjdC9vcGVuYm1jL2J1aWxk
L3RtcC9kZXBsb3kvaW1hZ2VzL3AxMGJtYy8gPGh0dHBzOi8vamVua2lucy5vcGVuYm1jLm9yZy9q
b2IvY2ktb3BlbmJtYy9kaXN0cm89dWJ1bnR1LGxhYmVsPWRvY2tlci1idWlsZGVyLHRhcmdldD1w
MTBibWMvbGFzdFN1Y2Nlc3NmdWxCdWlsZC9hcnRpZmFjdC9vcGVuYm1jL2J1aWxkL3RtcC9kZXBs
b3kvaW1hZ2VzL3AxMGJtYy8+IA0KDQoNClRoaXMgaXMgdXNlZnVsIHRvbyBidXQgdGhlc2UgYXJl
IHN5c3RlbSBsZXZlbCB0ZXN0cy4NCg0KDQpUaGFua3MsDQoNCg0KQy4NCg0KU3VyZSwgSSB3aWxs
IGNoZWNrLiBUaGFua3MhDQoNCg0KDQo+IA0KPiBPbiAxLzI2LzIzLCAxOjA5IEFNLCAiQ8OpZHJp
YyBMZSBHb2F0ZXIiIDxjbGdAa2FvZC5vcmcgPG1haWx0bzpjbGdAa2FvZC5vcmc+IDxtYWlsdG86
Y2xnQGthb2Qub3JnIDxtYWlsdG86Y2xnQGthb2Qub3JnPj4+IHdyb3RlOg0KPiANCj4gDQo+IEhl
bGxvIE5pbmFkLA0KPiANCj4gDQo+IE9uIDEvMjUvMjMgMTc6NTMsIE5pbmFkIFMgUGFsc3VsZSB3
cm90ZToNCj4+IFNpZ25lZC1vZmYtYnk6IFBldGVyIERlbGV2b3J5YXMgcGV0ZXJAcGpkLmRldiA8
bWFpbHRvOnBldGVyQHBqZC5kZXY+IDxtYWlsdG86cGV0ZXJAcGpkLmRldiA8bWFpbHRvOnBldGVy
QHBqZC5kZXY+PiA8bWFpbHRvOnBldGVyQHBqZC5kZXYgPG1haWx0bzpwZXRlckBwamQuZGV2PiA8
bWFpbHRvOnBldGVyQHBqZC5kZXYgPG1haWx0bzpwZXRlckBwamQuZGV2Pj4+DQo+Pg0KPj4gUmV2
aWV3ZWQtYnk6IEpvZWwgU3RhbmxleSBqb2VsQGptcy5pZC5hdSA8bWFpbHRvOmpvZWxAam1zLmlk
LmF1PiA8bWFpbHRvOmpvZWxAam1zLmlkLmF1IDxtYWlsdG86am9lbEBqbXMuaWQuYXU+PiA8bWFp
bHRvOmpvZWxAam1zLmlkLmF1IDxtYWlsdG86am9lbEBqbXMuaWQuYXU+IDxtYWlsdG86am9lbEBq
bXMuaWQuYXUgPG1haWx0bzpqb2VsQGptcy5pZC5hdT4+Pg0KPj4NCj4+IFRlc3RlZC1ieTogTmlu
YWQgUGFsc3VsZSBuaW5hZHBhbHN1bGVAdXMuaWJtLmNvbSA8bWFpbHRvOm5pbmFkcGFsc3VsZUB1
cy5pYm0uY29tPiA8bWFpbHRvOm5pbmFkcGFsc3VsZUB1cy5pYm0uY29tIDxtYWlsdG86bmluYWRw
YWxzdWxlQHVzLmlibS5jb20+PiA8bWFpbHRvOm5pbmFkcGFsc3VsZUB1cy5pYm0uY29tIDxtYWls
dG86bmluYWRwYWxzdWxlQHVzLmlibS5jb20+IDxtYWlsdG86bmluYWRwYWxzdWxlQHVzLmlibS5j
b20gPG1haWx0bzpuaW5hZHBhbHN1bGVAdXMuaWJtLmNvbT4+Pg0KPj4NCj4+IEhpIFBldGVyLA0K
Pj4NCj4+IEkgYXBwbGllZCB5b3VyIHBhdGNoZXMgYW5kIG1hZGUgc3VyZSB0aGF0IGRpZmZlcmVu
dCBFRVBST00gaW1hZ2VzIGNhbiBiZSBsb2FkZWQgZnJvbQ0KPj4NCj4+IGFwcHJvcHJpYXRlIGlt
YWdlIGZpbGVzIGFuZCBpdCBpcyB3b3JraW5nIGFzIGV4cGVjdGVkLg0KPiANCj4gDQo+IE1heSBi
ZSB5b3UgY291bGQgY29udHJpYnV0ZSBhbiBlZXByb20gcXRlc3QgPyBJIHdvdWxkIHB1dCB0aGUg
ZGF0YSB1bmRlcg0KPiB0ZXN0cy9kYXRhL2VlcHJvbS4NCj4gDQo+IA0KPiBUaGFua3MsDQo+IA0K
PiANCj4gQy4NCj4gDQo+IA0KPiANCj4gDQo+Pg0KPj4gIyBVc2VkIGZvbGxvd2luZyBjb21tYW5k
IHRvIGludm9rZSB0aGUgcWVtdS4NCj4+DQo+PiBxZW11LXN5c3RlbS1hcm0gLU0gcmFpbmllci1i
bWMgLW5vZ3JhcGhpYyBcDQo+Pg0KPj4gLWtlcm5lbCBmaXRJbWFnZS1saW51eC5iaW4gXA0KPj4N
Cj4+IC1kdGIgYXNwZWVkLWJtYy1pYm0tcmFpbmllci5kdGIgXA0KPj4NCj4+IC1pbml0cmQgb2Jt
Yy1waG9zcGhvci1pbml0cmFtZnMucm9vdGZzLmNwaW8ueHogXA0KPj4NCj4+IC1kcml2ZSBmaWxl
PW9ibWMtcGhvc3Bob3ItaW1hZ2Uucm9vdGZzLndpYy5xY293MixpZj1zZCxpbmRleD0yIFwNCj4+
DQo+PiAtYXBwZW5kICJyb290d2FpdCBjb25zb2xlPXR0eVM0LDExNTIwMG44IHJvb3Q9UEFSVExB
QkVMPXJvZnMtYSIgXA0KPj4NCj4+IC1kZXZpY2UgYXQyNGMtZWVwcm9tLGJ1cz1hc3BlZWQuaTJj
LmJ1cy4wLGFkZHJlc3M9MHg1MSxkcml2ZT1hLHJvbS1zaXplPTMyNzY4IC1kcml2ZSBmaWxlPXRw
bS5lZXByb20uYmluLGZvcm1hdD1yYXcsaWY9bm9uZSxpZD1hIFwNCj4+DQo+PiAtZGV2aWNlIGF0
MjRjLWVlcHJvbSxidXM9YXNwZWVkLmkyYy5idXMuNyxhZGRyZXNzPTB4NTAsZHJpdmU9Yixyb20t
c2l6ZT02NTUzNiAtZHJpdmUgZmlsZT1vcHBhbmVsLmVlcHJvbS5iaW4sZm9ybWF0PXJhdyxpZj1u
b25lLGlkPWIgXA0KPj4NCj4+IC1kZXZpY2UgYXQyNGMtZWVwcm9tLGJ1cz1hc3BlZWQuaTJjLmJ1
cy43LGFkZHJlc3M9MHg1MSxkcml2ZT1jLHJvbS1zaXplPTY1NTM2IC1kcml2ZSBmaWxlPWxjZC5l
ZXByb20uYmluLGZvcm1hdD1yYXcsaWY9bm9uZSxpZD1jIFwNCj4+DQo+PiAtZGV2aWNlIGF0MjRj
LWVlcHJvbSxidXM9YXNwZWVkLmkyYy5idXMuOCxhZGRyZXNzPTB4NTAsZHJpdmU9ZCxyb20tc2l6
ZT02NTUzNiAtZHJpdmUgZmlsZT1iYXNlYm9hcmQuZWVwcm9tLmJpbixmb3JtYXQ9cmF3LGlmPW5v
bmUsaWQ9ZCBcDQo+Pg0KPj4gLWRldmljZSBhdDI0Yy1lZXByb20sYnVzPWFzcGVlZC5pMmMuYnVz
LjgsYWRkcmVzcz0weDUxLGRyaXZlPWUscm9tLXNpemU9NjU1MzYgLWRyaXZlIGZpbGU9Ym1jLmVl
cHJvbS5iaW4sZm9ybWF0PXJhdyxpZj1ub25lLGlkPWUgXA0KPj4NCj4+IC1kZXZpY2UgYXQyNGMt
ZWVwcm9tLGJ1cz1hc3BlZWQuaTJjLmJ1cy45LGFkZHJlc3M9MHg1MCxkcml2ZT1mLHJvbS1zaXpl
PTEzMTA3MiAtZHJpdmUgZmlsZT12cm0uZWVwcm9tLmJpbixmb3JtYXQ9cmF3LGlmPW5vbmUsaWQ9
ZiBcDQo+Pg0KPj4gLWRldmljZSBhdDI0Yy1lZXByb20sYnVzPWFzcGVlZC5pMmMuYnVzLjEwLGFk
ZHJlc3M9MHg1MCxkcml2ZT1nLHJvbS1zaXplPTEzMTA3MiAtZHJpdmUgZmlsZT12cm0uZWVwcm9t
LmJpbixmb3JtYXQ9cmF3LGlmPW5vbmUsaWQ9ZyBcDQo+Pg0KPj4gLWRldmljZSBhdDI0Yy1lZXBy
b20sYnVzPWFzcGVlZC5pMmMuYnVzLjEzLGFkZHJlc3M9MHg1MCxkcml2ZT1oLHJvbS1zaXplPTY1
NTM2IC1kcml2ZSBmaWxlPW52bWUuZWVwcm9tLmJpbixmb3JtYXQ9cmF3LGlmPW5vbmUsaWQ9aCBc
DQo+Pg0KPj4gLWRldmljZSBhdDI0Yy1lZXByb20sYnVzPWFzcGVlZC5pMmMuYnVzLjE0LGFkZHJl
c3M9MHg1MCxkcml2ZT1pLHJvbS1zaXplPTY1NTM2IC1kcml2ZSBmaWxlPW52bWUuZWVwcm9tLmJp
bixmb3JtYXQ9cmF3LGlmPW5vbmUsaWQ9aSBcDQo+Pg0KPj4gLWRldmljZSBhdDI0Yy1lZXByb20s
YnVzPWFzcGVlZC5pMmMuYnVzLjE1LGFkZHJlc3M9MHg1MCxkcml2ZT1qLHJvbS1zaXplPTY1NTM2
IC1kcml2ZSBmaWxlPW52bWUuZWVwcm9tLmJpbixmb3JtYXQ9cmF3LGlmPW5vbmUsaWQ9ag0KPj4N
Cj4gDQo+IA0KPiANCj4gDQo+IA0KDQoNCg0KDQoNCg==

