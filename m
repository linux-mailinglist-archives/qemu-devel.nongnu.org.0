Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E2049EA33
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 19:16:31 +0100 (CET)
Received: from localhost ([::1]:40334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD9Ju-0006V6-I0
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 13:16:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nD8of-0000m9-NC
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 12:44:13 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:32278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nD8oU-00016V-7o
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 12:44:05 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20RFuFfM005848; 
 Thu, 27 Jan 2022 17:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=hxaX++BkFgkIqqp1ALwf1exwG+jc07HC19DIlLQpO/E=;
 b=eGtnwXvyn7P8QC0xIupsHoXuFsUUVbbbVfU01jhGI4LSrmd90vXf5ccKSowzNk2hZktJ
 nlo3KBigqLuFntOXv2kP4w9xhr7enKwYQZCBpgGQy073rDAqKG/7OziwXllAZYuEd7SK
 H6vf8UNh4lyiLMtoRWVN2hxKD0SzLlPAIf0+QYt5iNZkGedQtsyFccc1x3tjkMfsLaO1
 dJbKaszJv4X4pqQPUJRBSdCZUULvPAGxgOdQx5k1CR5c3DlNLx+wjp48hpHmfB0gWBVm
 0xIbj9c0e9Z+HOaBxf12maWUcZh+WT+2xHx7w4GK+9GzvCvOy3MscdjQ2yEH28EXgh0M dw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3duvsj0rwp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 17:43:52 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20RHeqTX128319;
 Thu, 27 Jan 2022 17:43:50 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by userp3020.oracle.com with ESMTP id 3drbctyxgr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 17:43:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfe8CtinTzQn4KqD49PKCTIcUsqkEqKhRSot48p27HjMxay2KNdJhkJ/bEG0jvL8dxLO7pPH39O95C1u5Hg4K7RXP6bEvKmblMau3I3Z5/VumscyW5Fl+3aVwbhHZYPrYhBmaoDk1PrOB5XLCvWURq/AMjBHcmHS8V/oyXiHgX/vX/I/wtsg+jXWjoD99AfjlI1bmFf52MWi7kUXJWKItpBYq2I+93/vR/004rvn4Mhh6SwJujB32RtpO6PSYKYmg1e4JmvN7dtXpr0bzYbyv34ZqXVdIu12FYQQ3wYil7QjYakNLg67jZjrqK8U3rrTtxEJhOtYSowpwKIbv40yhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxaX++BkFgkIqqp1ALwf1exwG+jc07HC19DIlLQpO/E=;
 b=NzcVOhDhapANq5cQhRhAMAbp2yrEu9uPqtnYeV2F2bgwcKqkuq5XLGSsdq798/iF2qGryYZCsIei4LwpPq5CwIkWrSc5U9zSwO7ZldDh8DTCJfwtr/rzn7I9fg77k2l3Y817GfZHcSsBCcdpVE2rOyLWj/wlLl9ACimD6UzFzBF0pp6d7NEGvwgcI8N3W1avZDMC+brz19uaSlOfBy7zIJzoYuGo3MkdkpcuEDLOPqzQCfmrpK/D2asvFo6RPk3FyzbLngK3OcE0dsaFb/BC+No2Mm/4YBHCwCoO4Kl5bX5wjAm4Cprs7eqN8e96yBMSoiSdH/5hnoVjnCzAw3pRug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxaX++BkFgkIqqp1ALwf1exwG+jc07HC19DIlLQpO/E=;
 b=lKRrbbP7xSw/3xYme0R5eiyhyHN+ecImIr9iZJ65iOhAq2KWxdVO3x49I6LUHkz3E/wXiFCWEmyGo02XP5TXS3cR5X9Cqzv+463vjE9ScHra5CdjCc2TAh71xArPeEQqpivvJ+2rjk7OOOp52+bSrdBKkcWEexLWo9+q8jUNWNg=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by CY4PR1001MB2342.namprd10.prod.outlook.com (2603:10b6:910:46::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 17:43:47 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4909.019; Thu, 27 Jan 2022
 17:43:47 +0000
From: Jag Raman <jag.raman@oracle.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Thread-Topic: [PATCH v5 03/18] pci: isolated address space for PCI bus
Thread-Index: AQHYDX1z2h/nyOzV1UqlYAx4HMB2U6xrCcSAgAD94YCACBLhAIAAtVOAgADWGQCAAYnxAA==
Date: Thu, 27 Jan 2022 17:43:46 +0000
Message-ID: <777FBA88-44F3-4607-973A-91A3A4BE5679@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <2971c1bec04acaac4eb3c1f2b104cbeabad01e22.1642626515.git.jag.raman@oracle.com>
 <20220119190742-mutt-send-email-mst@kernel.org>
 <1CACFB08-1BBC-4ECC-9C0B-6F377018D795@oracle.com> <YfBDqMuO/l/gWzL8@work-vm>
 <AE47B5D2-6515-4BD3-B541-23E5274174AC@oracle.com> <YfGPXMziljiW7njm@work-vm>
In-Reply-To: <YfGPXMziljiW7njm@work-vm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c70bc212-0582-46f6-ceb5-08d9e1bc920c
x-ms-traffictypediagnostic: CY4PR1001MB2342:EE_
x-microsoft-antispam-prvs: <CY4PR1001MB2342693DC48E2770CD8F7EC390219@CY4PR1001MB2342.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iJkRwZRQjQGRalpdOhbVrDN0lmaboKDMxAz6jLq/DK55P47q/+dXM9dIWMg1TFDdrlC4l5C0QbmpbZrHZZHRR8bC6QNRefZTkwzyCxHXOIF7n8bBEzMpyvC6A8p4p6WGE3LL4nnvV15hry6M53HkrhMsDp/+GVqh9NNDUjlgimhwR9XK6Mzoz36H6lRg6WxkwEDEiQG9CadSiy5tpx4Syrr6I+VNXs0ELquSF5P+8fqNFi7LQVXbiORJutyyJGch3yspv7thaKJPvScUwVGHN4ZMieLX8EGyZmJ1OcbWnBhatZUPT/Z/zN9j6D5fPEiF/t9y3nnBnkTdBIqOxGfQdEZ9GLc0efrhB8CwRI7ZONBrtq/nbEE8TPAnugatftoFDSUhCGLM7YCSsYaT0lGaQvb+0VU6EOU7vYOIS6sKIFjx0JjDGlI2vBuFEdAutcUwtqtmD+lGi1kVIYX2F7zpfhBO7n9/0tbXejpo2vKl7h6NvVqAFj3IawVRRYnqzXmqUxnNexYWUACJdra+WLjE7L1PdOZ1o6tHU/b6IPYHU9+IJj/wKxTdS/yI3EsO8Cu5tEGNMQL0sCKjraULiDyCWpH7f+mteQ2O/e2DNYl4tol5hBndujq1h7wFoe+GsYCW4Bvusz+gD6W1pfEFGDXfxKfwzBtvrvMuiu/3602Uh2+wMDoTCMcaGqbv2OvqXqR6gqWp3GfbwAUiTf/LppE+G6TlV0+im+iqtVjKIDIDrNmLHgW5Wl8j+5cr7xblFBWwUOPPw2ePi9GRliJK+JOKD4T/A9zwsk4orALJ5bM1w0Mgmh5xqa9r4SdA6KCFrDXW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(76116006)(64756008)(8676002)(8936002)(4326008)(71200400001)(66446008)(66476007)(66556008)(66946007)(316002)(86362001)(5660300002)(107886003)(91956017)(6506007)(36756003)(7416002)(38070700005)(54906003)(6916009)(6486002)(966005)(53546011)(508600001)(2906002)(33656002)(38100700002)(6512007)(83380400001)(44832011)(122000001)(2616005)(26005)(186003)(45980500001)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UU5YbzBjRHJXMXlkL1p6VG4xdUFpS0EydzZwSnNYZ3ZKcXk2dnVJZU8yZjFz?=
 =?utf-8?B?TmFSTzVVY3FzUTJoZ1cyRmlHSG5XWFQ3S3dUd090Zk9OSzJsTDd2UHVRYjcw?=
 =?utf-8?B?bkVEdjI2ekQvR3I2b2tJL3RoRnhSNlBtUWNwY0NiQmo3TE42d2xubU90TkZx?=
 =?utf-8?B?WTR2U0dVQlRiOC9hcU5TN2owdmUwQWg3NEt3VkFiZnd4czhkYzA5a0o0bDNW?=
 =?utf-8?B?eXU3ZjRCaWVoK2dQZmZEemRWVk1FZFViNGpjbC9sSU5pMUhDUm5xb2RSZHla?=
 =?utf-8?B?WjdpRktVanRyRG9tdm15WjNBRnZRdlJiREpTRWRxajEycW5pRklyVjJpaDRQ?=
 =?utf-8?B?Uk1lV2xRc0R5SHRxeFRGenhNNXNxaldqdmRJYlNwN3VuNG5pL2JvLzUxTFFN?=
 =?utf-8?B?cUlJWS8yTFdRR0NrdGozeGVBMS9sREIrYmxWaFJndklXME5JUW53bzlwa1ZJ?=
 =?utf-8?B?RGFPeTlRS29mSnNrN0NEUzBQaG9YeHJFeEVsd1h6K1pFM2pTbWZyQzRLVys1?=
 =?utf-8?B?NURwSUNiVWhwbTlabUI0dGo3VE1sTUdnVDQzQW5Pbjd6NXhCZWlka0k1UHBG?=
 =?utf-8?B?Rm9LTUY1RlFhVzJlS2pKUlRaUEJwY2VPTEVXU3hyNDNuNWFBbmUvdjlUeGJI?=
 =?utf-8?B?WVRDT1kzQ2o3OFRSZStDblVzcEp6YjB3VWdmWnRoQXhzcHdpWXNneGxzK3Vj?=
 =?utf-8?B?RWVycXc4WWc3dnRtRkd0eFVhczRVSmk5MmZoNlpsTzJIRGhHcG53WUZYcUxP?=
 =?utf-8?B?cnNDNmxzbVkydnVuenpxazhKSGl5akU0MmVoV3dIUHVBODhkZ215NXkzUWNQ?=
 =?utf-8?B?algrN2NMNjJzWnVwYmZZODhyUkp1am1SVGJVd0FXOUdyT1dpTFU1ckZYMmhx?=
 =?utf-8?B?Vm1WYVpvajZuVTJlTHA1djN3YnFycGYxM01TOTZJV2pGS3hoUytMYXBiQnJM?=
 =?utf-8?B?YVRXL3FQSTRJbVpNcVlCL2M3Ri9YRjkyY3JUY0VuM2NucThDWGFuSDYrNmtT?=
 =?utf-8?B?UTVpTUd0emp6RHZxSFRZeVJnQjc2SEU4dlhqYXpKeEVaUlRrd1VYYkVZZk9Z?=
 =?utf-8?B?am5NZGY0d1c0SFBJcHN2aXJVSHMwalg5enZNS2hWdGNXZS9waFFzV0VQakhY?=
 =?utf-8?B?bTlwUGFxNzVmT01RZnpaRlkwdnRVY3B6VEY3R3NEZ3RtbmZxYmdMQUpZbERW?=
 =?utf-8?B?WFZYbGttQWFQeW9lbjQ0WEdieDhNb29iU1BXdkgzbWZOUnIzZStwZ3I0UHh0?=
 =?utf-8?B?Zm1zMFR1TjBtYnFseGxzbExab2hOT3UrVzB5QzJZdGU2Y00zWkZ3N0MyWHJV?=
 =?utf-8?B?eUJTSERFMktqcFNyeWRxek9WaHRSZktsTVA2L1g3amRYVXFQS2ZhaFJRUnZU?=
 =?utf-8?B?UGw5eXRxTkdHOW5pWUxuR044NERtTFk4UWRnaU1Xc0VIN1JHd01nSGRvQ1F3?=
 =?utf-8?B?YThCR0JMN3d2OEpnU1I4UmpOclF2T2hJaHlsWlc5VnMrMlhyN1h5RGhwOVpo?=
 =?utf-8?B?T01IRnplMHZRZ3BBcXJWeDNsYWkxQXZaWnRWUTkxSjEzYWpGdUFTYVlJYk5L?=
 =?utf-8?B?MlhyYWxhVUdERDcwbWpTckpKdDB2c0k3cEE1WFU3K216Y3VGWXNLdjV2YmtE?=
 =?utf-8?B?dUppWEllQmxjejVZdUNNNEhyZjFQNVFEUmJUTVl5TjM5NmhoZ1UyckxtS0xP?=
 =?utf-8?B?amtSUUtYRDU2eUFDbzVnaTVsVzFyS0g3a294cVQxWVFCV1RZQVVGNmFOSWNB?=
 =?utf-8?B?dzFWQ0hwOGU2YVpxWmJHeWtwbnplanNEdlYwMVp5TlMvaW9IV0J4WFhDc3JJ?=
 =?utf-8?B?b3ZPMC9HejRPRjhoa0REM1BMY2czUnU4amVzMVVGZFBkQWFydDlEUEdQMU8w?=
 =?utf-8?B?SElLN2hBNStHQkZDNVA5LzBkRTB3dVlKNVlXVFR0SzdIeExVMHB0b0R4bFo4?=
 =?utf-8?B?VFBDTEpuS0V6TXJvVlhkWmkwU2pHT2xDYlU0N2M3UUpDYi8xR2ZsODhHUmt6?=
 =?utf-8?B?OWgzM1dmM0x3Z0kzeGhsSG4wc0ZFcXJuYm8vQXN4RHhxWnpyV05IWlVuQkhJ?=
 =?utf-8?B?MFp3M01uTnliTWZQcFJibkZVK05xeGlYMWQ3R1htbUFLWlA1U2pEK05jeG52?=
 =?utf-8?B?UDRab0dKeVZ4M1FxTEVQRGt5V2toSmxnUUtHbkphWlpHWVhYN1FGRXpRVGxp?=
 =?utf-8?Q?82n+fnMZBETXIEL+ELQ7czc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5AB6798C1040294AAE3539715216BE39@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c70bc212-0582-46f6-ceb5-08d9e1bc920c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2022 17:43:46.8643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f5KPwNJkdSgHhG0fmfk9FEgTY2MGyxugi/zUm1PKWqboRP3rsfFdl+kJnt4utgOPNygB+W/tGhXX1B8CQFBfqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2342
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10239
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201270103
X-Proofpoint-ORIG-GUID: 3hObRHuJt-1Xy_1z7uesJZ-g3N2cxmQf
X-Proofpoint-GUID: 3hObRHuJt-1Xy_1z7uesJZ-g3N2cxmQf
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
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSmFuIDI2LCAyMDIyLCBhdCAxOjEzIFBNLCBEci4gRGF2aWQgQWxhbiBHaWxiZXJ0
IDxkZ2lsYmVydEByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+ICogSmFnIFJhbWFuIChqYWcucmFt
YW5Ab3JhY2xlLmNvbSkgd3JvdGU6DQo+PiANCj4+IA0KPj4+IE9uIEphbiAyNSwgMjAyMiwgYXQg
MTozOCBQTSwgRHIuIERhdmlkIEFsYW4gR2lsYmVydCA8ZGdpbGJlcnRAcmVkaGF0LmNvbT4gd3Jv
dGU6DQo+Pj4gDQo+Pj4gKiBKYWcgUmFtYW4gKGphZy5yYW1hbkBvcmFjbGUuY29tKSB3cm90ZToN
Cj4+Pj4gDQo+Pj4+IA0KPj4+Pj4gT24gSmFuIDE5LCAyMDIyLCBhdCA3OjEyIFBNLCBNaWNoYWVs
IFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gT24gV2Vk
LCBKYW4gMTksIDIwMjIgYXQgMDQ6NDE6NTJQTSAtMDUwMCwgSmFnYW5uYXRoYW4gUmFtYW4gd3Jv
dGU6DQo+Pj4+Pj4gQWxsb3cgUENJIGJ1c2VzIHRvIGJlIHBhcnQgb2YgaXNvbGF0ZWQgQ1BVIGFk
ZHJlc3Mgc3BhY2VzLiBUaGlzIGhhcyBhDQo+Pj4+Pj4gbmljaGUgdXNhZ2UuDQo+Pj4+Pj4gDQo+
Pj4+Pj4gVFlQRV9SRU1PVEVfTUFDSElORSBhbGxvd3MgbXVsdGlwbGUgVk1zIHRvIGhvdXNlIHRo
ZWlyIFBDSSBkZXZpY2VzIGluDQo+Pj4+Pj4gdGhlIHNhbWUgbWFjaGluZS9zZXJ2ZXIuIFRoaXMg
d291bGQgY2F1c2UgYWRkcmVzcyBzcGFjZSBjb2xsaXNpb24gYXMNCj4+Pj4+PiB3ZWxsIGFzIGJl
IGEgc2VjdXJpdHkgdnVsbmVyYWJpbGl0eS4gSGF2aW5nIHNlcGFyYXRlIGFkZHJlc3Mgc3BhY2Vz
IGZvcg0KPj4+Pj4+IGVhY2ggUENJIGJ1cyB3b3VsZCBzb2x2ZSB0aGlzIHByb2JsZW0uDQo+Pj4+
PiANCj4+Pj4+IEZhc2NpbmF0aW5nLCBidXQgSSBhbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQuIGFu
eSBleGFtcGxlcz8NCj4+Pj4gDQo+Pj4+IEhpIE1pY2hhZWwhDQo+Pj4+IA0KPj4+PiBtdWx0aXBy
b2Nlc3MgUUVNVSBhbmQgdmZpby11c2VyIGltcGxlbWVudCBhIGNsaWVudC1zZXJ2ZXIgbW9kZWwg
dG8gYWxsb3cNCj4+Pj4gb3V0LW9mLXByb2Nlc3MgZW11bGF0aW9uIG9mIGRldmljZXMuIFRoZSBj
bGllbnQgUUVNVSwgd2hpY2ggbWFrZXMgaW9jdGxzDQo+Pj4+IHRvIHRoZSBrZXJuZWwgYW5kIHJ1
bnMgVkNQVXMsIGNvdWxkIGF0dGFjaCBkZXZpY2VzIHJ1bm5pbmcgaW4gYSBzZXJ2ZXINCj4+Pj4g
UUVNVS4gVGhlIHNlcnZlciBRRU1VIG5lZWRzIGFjY2VzcyB0byBwYXJ0cyBvZiB0aGUgY2xpZW50
4oCZcyBSQU0gdG8NCj4+Pj4gcGVyZm9ybSBETUEuDQo+Pj4gDQo+Pj4gRG8geW91IGV2ZXIgaGF2
ZSB0aGUgb3Bwb3NpdGUgcHJvYmxlbT8gaS5lLiB3aGVuIGFuIGVtdWxhdGVkIFBDSSBkZXZpY2UN
Cj4+IA0KPj4gVGhhdOKAmXMgYW4gaW50ZXJlc3RpbmcgcXVlc3Rpb24uDQo+PiANCj4+PiBleHBv
c2VzIGEgY2h1bmsgb2YgUkFNLWxpa2Ugc3BhY2UgKGZyYW1lIGJ1ZmZlciwgb3IgbWF5YmUgYSBt
YXBwZWQgZmlsZSkNCj4+PiB0aGF0IHRoZSBjbGllbnQgY2FuIHNlZS4gIFdoYXQgaGFwcGVucyBp
ZiB0d28gZW11bGF0ZWQgZGV2aWNlcyBuZWVkIHRvDQo+Pj4gYWNjZXNzIGVhY2ggb3RoZXJzIGVt
dWxhdGVkIGFkZHJlc3Mgc3BhY2U/DQo+PiANCj4+IEluIHRoaXMgY2FzZSwgdGhlIGtlcm5lbCBk
cml2ZXIgd291bGQgbWFwIHRoZSBkZXN0aW5hdGlvbuKAmXMgY2h1bmsgb2YgaW50ZXJuYWwgUkFN
IGludG8NCj4+IHRoZSBETUEgc3BhY2Ugb2YgdGhlIHNvdXJjZSBkZXZpY2UuIFRoZW4gdGhlIHNv
dXJjZSBkZXZpY2UgY291bGQgd3JpdGUgdG8gdGhhdA0KPj4gbWFwcGVkIGFkZHJlc3MgcmFuZ2Us
IGFuZCB0aGUgSU9NTVUgc2hvdWxkIGRpcmVjdCB0aG9zZSB3cml0ZXMgdG8gdGhlDQo+PiBkZXN0
aW5hdGlvbiBkZXZpY2UuDQo+IA0KPiBBcmUgYWxsIGRldmljZXMgbWFwcGFibGUgbGlrZSB0aGF0
Pw0KDQpJZiB0aGVyZSBpcyBhbiBJT01NVSB0aGF0IHN1cHBvcnRzIERNQS1SZW1hcHBpbmcgKERN
QVIpLCB0aGF0IHdvdWxkIGJlDQpwb3NzaWJsZSAtIHRoZSBrZXJuZWwgY291bGQgY29uZmlndXJl
IHRoZSBETUFSIHRvIGZhY2lsaXRhdGUgc3VjaCBtYXBwaW5nLg0KDQpJZiB0aGVyZSBpcyBubyBE
TUFSLCB0aGUga2VybmVsL2NwdSBjb3VsZCBidWZmZXIgdGhlIHdyaXRlIGJldHdlZW4gZGV2aWNl
cy4NCg0KLS0NCkphZw0KDQo+IA0KPj4gSSB3b3VsZCBsaWtlIHRvIHRha2UgYSBjbG9zZXIgbG9v
ayBhdCB0aGUgSU9NTVUgaW1wbGVtZW50YXRpb24gb24gaG93IHRvIGFjaGlldmUNCj4+IHRoaXMs
IGFuZCBnZXQgYmFjayB0byB5b3UuIEkgdGhpbmsgdGhlIElPTU1VIHdvdWxkIGhhbmRsZSB0aGlz
LiBDb3VsZCB5b3UgcGxlYXNlDQo+PiBwb2ludCBtZSB0byB0aGUgSU9NTVUgaW1wbGVtZW50YXRp
b24geW91IGhhdmUgaW4gbWluZD8NCj4gDQo+IEkgZGlkbid0IGhhdmUgb25lIGluIG1pbmQ7IEkg
d2FzIGp1c3QgaGl0dGluZyBhIHNpbWlsYXIgcHJvYmxlbSBvbg0KPiBWaXJ0aW9mcyBEQVguDQo+
IA0KPiBEYXZlDQo+IA0KPj4gVGhhbmsgeW91IQ0KPj4gLS0NCj4+IEphZw0KPj4gDQo+Pj4gDQo+
Pj4gRGF2ZQ0KPj4+IA0KPj4+PiBJbiB0aGUgY2FzZSB3aGVyZSBtdWx0aXBsZSBjbGllbnRzIGF0
dGFjaCBkZXZpY2VzIHRoYXQgYXJlIHJ1bm5pbmcgb24gdGhlDQo+Pj4+IHNhbWUgc2VydmVyLCB3
ZSBuZWVkIHRvIGVuc3VyZSB0aGF0IGVhY2ggZGV2aWNlcyBoYXMgaXNvbGF0ZWQgbWVtb3J5DQo+
Pj4+IHJhbmdlcy4gVGhpcyBlbnN1cmVzIHRoYXQgdGhlIG1lbW9yeSBzcGFjZSBvZiBvbmUgZGV2
aWNlIGlzIG5vdCB2aXNpYmxlDQo+Pj4+IHRvIG90aGVyIGRldmljZXMgaW4gdGhlIHNhbWUgc2Vy
dmVyLg0KPj4+PiANCj4+Pj4+IA0KPj4+Pj4gSSBhbHNvIHdvbmRlciB3aGV0aGVyIHRoaXMgc3Bl
Y2lhbCB0eXBlIGNvdWxkIGJlIG1vZGVsbGVkIGxpa2UgYSBzcGVjaWFsDQo+Pj4+PiBraW5kIG9m
IGlvbW11IGludGVybmFsbHkuDQo+Pj4+IA0KPj4+PiBDb3VsZCB5b3UgcGxlYXNlIHByb3ZpZGUg
c29tZSBtb3JlIGRldGFpbHMgb24gdGhlIGRlc2lnbj8NCj4+Pj4gDQo+Pj4+PiANCj4+Pj4+PiBT
aWduZWQtb2ZmLWJ5OiBFbGVuYSBVZmltdHNldmEgPGVsZW5hLnVmaW10c2V2YUBvcmFjbGUuY29t
Pg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEpvaG4gRyBKb2huc29uIDxqb2huLmcuam9obnNvbkBv
cmFjbGUuY29tPg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEphZ2FubmF0aGFuIFJhbWFuIDxqYWcu
cmFtYW5Ab3JhY2xlLmNvbT4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiBpbmNsdWRlL2h3L3BjaS9wY2ku
aCAgICAgfCAgMiArKw0KPj4+Pj4+IGluY2x1ZGUvaHcvcGNpL3BjaV9idXMuaCB8IDE3ICsrKysr
KysrKysrKysrKysrDQo+Pj4+Pj4gaHcvcGNpL3BjaS5jICAgICAgICAgICAgIHwgMTcgKysrKysr
KysrKysrKysrKysNCj4+Pj4+PiBody9wY2kvcGNpX2JyaWRnZS5jICAgICAgfCAgNSArKysrKw0K
Pj4+Pj4+IDQgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKQ0KPj4+Pj4+IA0KPj4+Pj4+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3BjaS9wY2kuaCBiL2luY2x1ZGUvaHcvcGNpL3BjaS5o
DQo+Pj4+Pj4gaW5kZXggMDIzYWJjMGY3OS4uOWJiNDQ3MmFiYyAxMDA2NDQNCj4+Pj4+PiAtLS0g
YS9pbmNsdWRlL2h3L3BjaS9wY2kuaA0KPj4+Pj4+ICsrKyBiL2luY2x1ZGUvaHcvcGNpL3BjaS5o
DQo+Pj4+Pj4gQEAgLTM4Nyw2ICszODcsOCBAQCB2b2lkIHBjaV9kZXZpY2Vfc2F2ZShQQ0lEZXZp
Y2UgKnMsIFFFTVVGaWxlICpmKTsNCj4+Pj4+PiBpbnQgcGNpX2RldmljZV9sb2FkKFBDSURldmlj
ZSAqcywgUUVNVUZpbGUgKmYpOw0KPj4+Pj4+IE1lbW9yeVJlZ2lvbiAqcGNpX2FkZHJlc3Nfc3Bh
Y2UoUENJRGV2aWNlICpkZXYpOw0KPj4+Pj4+IE1lbW9yeVJlZ2lvbiAqcGNpX2FkZHJlc3Nfc3Bh
Y2VfaW8oUENJRGV2aWNlICpkZXYpOw0KPj4+Pj4+ICtBZGRyZXNzU3BhY2UgKnBjaV9pc29sX2Fz
X21lbShQQ0lEZXZpY2UgKmRldik7DQo+Pj4+Pj4gK0FkZHJlc3NTcGFjZSAqcGNpX2lzb2xfYXNf
aW8oUENJRGV2aWNlICpkZXYpOw0KPj4+Pj4+IA0KPj4+Pj4+IC8qDQo+Pj4+Pj4gKiBTaG91bGQg
bm90IG5vcm1hbGx5IGJlIHVzZWQgYnkgZGV2aWNlcy4gRm9yIHVzZSBieSBzUEFQUiB0YXJnZXQN
Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9wY2kvcGNpX2J1cy5oIGIvaW5jbHVkZS9o
dy9wY2kvcGNpX2J1cy5oDQo+Pj4+Pj4gaW5kZXggMzQ3NDQwZDQyYy4uZDc4MjU4ZTc5ZSAxMDA2
NDQNCj4+Pj4+PiAtLS0gYS9pbmNsdWRlL2h3L3BjaS9wY2lfYnVzLmgNCj4+Pj4+PiArKysgYi9p
bmNsdWRlL2h3L3BjaS9wY2lfYnVzLmgNCj4+Pj4+PiBAQCAtMzksOSArMzksMjYgQEAgc3RydWN0
IFBDSUJ1cyB7DQo+Pj4+Pj4gICB2b2lkICppcnFfb3BhcXVlOw0KPj4+Pj4+ICAgUENJRGV2aWNl
ICpkZXZpY2VzW1BDSV9TTE9UX01BWCAqIFBDSV9GVU5DX01BWF07DQo+Pj4+Pj4gICBQQ0lEZXZp
Y2UgKnBhcmVudF9kZXY7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICAgTWVtb3J5UmVnaW9uICphZGRyZXNz
X3NwYWNlX21lbTsNCj4+Pj4+PiAgIE1lbW9yeVJlZ2lvbiAqYWRkcmVzc19zcGFjZV9pbzsNCj4+
Pj4+PiANCj4+Pj4+PiArICAgIC8qKg0KPj4+Pj4+ICsgICAgICogSXNvbGF0ZWQgYWRkcmVzcyBz
cGFjZXMgLSB0aGVzZSBhbGxvdyB0aGUgUENJIGJ1cyB0byBiZSBwYXJ0DQo+Pj4+Pj4gKyAgICAg
KiBvZiBhbiBpc29sYXRlZCBhZGRyZXNzIHNwYWNlIGFzIG9wcG9zZWQgdG8gdGhlIGdsb2JhbA0K
Pj4+Pj4+ICsgICAgICogYWRkcmVzc19zcGFjZV9tZW1vcnkgJiBhZGRyZXNzX3NwYWNlX2lvLg0K
Pj4+Pj4gDQo+Pj4+PiBBcmUgeW91IHN1cmUgYWRkcmVzc19zcGFjZV9tZW1vcnkgJiBhZGRyZXNz
X3NwYWNlX2lvIGFyZQ0KPj4+Pj4gYWx3YXlzIGdsb2JhbD8gZXZlbiBpbiB0aGUgY2FzZSBvZiBh
biBpb21tdT8NCj4+Pj4gDQo+Pj4+IE9uIHRoZSBDUFUgc2lkZSBvZiB0aGUgUm9vdCBDb21wbGV4
LCBJIGJlbGlldmUgYWRkcmVzc19zcGFjZV9tZW1vcnkNCj4+Pj4gJiBhZGRyZXNzX3NwYWNlX2lv
IGFyZSBnbG9iYWwuDQo+Pj4+IA0KPj4+PiBJbiB0aGUgdmZpby11c2VyIGNhc2UsIGRldmljZXMg
b24gdGhlIHNhbWUgbWFjaGluZSAoVFlQRV9SRU1PVEVfTUFDSElORSkNCj4+Pj4gY291bGQgYmUg
YXR0YWNoZWQgdG8gZGlmZmVyZW50IGNsaWVudHMgVk1zLiBFYWNoIGNsaWVudCB3b3VsZCBoYXZl
IHRoZWlyIG93biBhZGRyZXNzDQo+Pj4+IHNwYWNlIGZvciB0aGVpciBDUFVzLiBXaXRoIGlzb2xh
dGVkIGFkZHJlc3Mgc3BhY2VzLCB3ZSBlbnN1cmUgdGhhdCB0aGUgZGV2aWNlcw0KPj4+PiBzZWUg
dGhlIGFkZHJlc3Mgc3BhY2Ugb2YgdGhlIENQVXMgdGhleeKAmXJlIGF0dGFjaGVkIHRvLg0KPj4+
PiANCj4+Pj4gTm90IHN1cmUgaWYgaXTigJlzIE9LIHRvIHNoYXJlIHdlYmxpbmtzIGluIHRoaXMg
bWFpbGluZyBsaXN0LCBwbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhhdOKAmXMNCj4+Pj4gbm90IHBy
ZWZlcnJlZC4gQnV0IEnigJltIHJlZmVycmluZyB0byB0aGUgdGVybWlub2xvZ3kgdXNlZCBpbiB0
aGUgZm9sbG93aW5nIGJsb2NrIGRpYWdyYW06DQo+Pj4+IGh0dHBzOi8vZW4ud2lraXBlZGlhLm9y
Zy93aWtpL1Jvb3RfY29tcGxleCMvbWVkaWEvRmlsZTpFeGFtcGxlX1BDSV9FeHByZXNzX1RvcG9s
b2d5LnN2Zw0KPj4+PiANCj4+Pj4+IA0KPj4+Pj4+IFRoaXMgYWxsb3dzIHRoZQ0KPj4+Pj4+ICsg
ICAgICogYnVzIHRvIGJlIGF0dGFjaGVkIHRvIENQVXMgZnJvbSBkaWZmZXJlbnQgbWFjaGluZXMu
IFRoZQ0KPj4+Pj4+ICsgICAgICogZm9sbG93aW5nIGlzIG5vdCB1c2VkIHVzZWQgY29tbW9ubHku
DQo+Pj4+Pj4gKyAgICAgKg0KPj4+Pj4+ICsgICAgICogVFlQRV9SRU1PVEVfTUFDSElORSBhbGxv
d3MgZW11bGF0aW5nIGRldmljZXMgZnJvbSBtdWx0aXBsZQ0KPj4+Pj4+ICsgICAgICogVk0gY2xp
ZW50cywNCj4+Pj4+IA0KPj4+Pj4gd2hhdCBhcmUgVk0gY2xpZW50cz8NCj4+Pj4gDQo+Pj4+IEl0
4oCZcyB0aGUgY2xpZW50IGluIHRoZSBjbGllbnQgLSBzZXJ2ZXIgbW9kZWwgZXhwbGFpbmVkIGFi
b3ZlLg0KPj4+PiANCj4+Pj4gVGhhbmsgeW91IQ0KPj4+PiAtLQ0KPj4+PiBKYWcNCj4+Pj4gDQo+
Pj4+PiANCj4+Pj4+PiBhcyBzdWNoIGl0IG5lZWRzIHRoZSBQQ0kgYnVzZXMgaW4gdGhlIHNhbWUg
bWFjaGluZQ0KPj4+Pj4+ICsgICAgICogdG8gYmUgcGFydCBvZiBkaWZmZXJlbnQgQ1BVIGFkZHJl
c3Mgc3BhY2VzLiBUaGUgZm9sbG93aW5nIGlzDQo+Pj4+Pj4gKyAgICAgKiB1c2VmdWwgaW4gdGhh
dCBzY2VuYXJpby4NCj4+Pj4+PiArICAgICAqDQo+Pj4+Pj4gKyAgICAgKi8NCj4+Pj4+PiArICAg
IEFkZHJlc3NTcGFjZSAqaXNvbF9hc19tZW07DQo+Pj4+Pj4gKyAgICBBZGRyZXNzU3BhY2UgKmlz
b2xfYXNfaW87DQo+Pj4+Pj4gKw0KPj4+Pj4+ICAgUUxJU1RfSEVBRCgsIFBDSUJ1cykgY2hpbGQ7
IC8qIHRoaXMgd2lsbCBiZSByZXBsYWNlZCBieSBxZGV2IGxhdGVyICovDQo+Pj4+Pj4gICBRTElT
VF9FTlRSWShQQ0lCdXMpIHNpYmxpbmc7LyogdGhpcyB3aWxsIGJlIHJlcGxhY2VkIGJ5IHFkZXYg
bGF0ZXIgKi8NCj4+Pj4+PiANCj4+Pj4+PiBkaWZmIC0tZ2l0IGEvaHcvcGNpL3BjaS5jIGIvaHcv
cGNpL3BjaS5jDQo+Pj4+Pj4gaW5kZXggNWQzMGY5Y2E2MC4uZDVmMWM2YzQyMSAxMDA2NDQNCj4+
Pj4+PiAtLS0gYS9ody9wY2kvcGNpLmMNCj4+Pj4+PiArKysgYi9ody9wY2kvcGNpLmMNCj4+Pj4+
PiBAQCAtNDQyLDYgKzQ0Miw4IEBAIHN0YXRpYyB2b2lkIHBjaV9yb290X2J1c19pbnRlcm5hbF9p
bml0KFBDSUJ1cyAqYnVzLCBEZXZpY2VTdGF0ZSAqcGFyZW50LA0KPj4+Pj4+ICAgYnVzLT5zbG90
X3Jlc2VydmVkX21hc2sgPSAweDA7DQo+Pj4+Pj4gICBidXMtPmFkZHJlc3Nfc3BhY2VfbWVtID0g
YWRkcmVzc19zcGFjZV9tZW07DQo+Pj4+Pj4gICBidXMtPmFkZHJlc3Nfc3BhY2VfaW8gPSBhZGRy
ZXNzX3NwYWNlX2lvOw0KPj4+Pj4+ICsgICAgYnVzLT5pc29sX2FzX21lbSA9IE5VTEw7DQo+Pj4+
Pj4gKyAgICBidXMtPmlzb2xfYXNfaW8gPSBOVUxMOw0KPj4+Pj4+ICAgYnVzLT5mbGFncyB8PSBQ
Q0lfQlVTX0lTX1JPT1Q7DQo+Pj4+Pj4gDQo+Pj4+Pj4gICAvKiBob3N0IGJyaWRnZSAqLw0KPj4+
Pj4+IEBAIC0yNjc2LDYgKzI2NzgsMTYgQEAgTWVtb3J5UmVnaW9uICpwY2lfYWRkcmVzc19zcGFj
ZV9pbyhQQ0lEZXZpY2UgKmRldikNCj4+Pj4+PiAgIHJldHVybiBwY2lfZ2V0X2J1cyhkZXYpLT5h
ZGRyZXNzX3NwYWNlX2lvOw0KPj4+Pj4+IH0NCj4+Pj4+PiANCj4+Pj4+PiArQWRkcmVzc1NwYWNl
ICpwY2lfaXNvbF9hc19tZW0oUENJRGV2aWNlICpkZXYpDQo+Pj4+Pj4gK3sNCj4+Pj4+PiArICAg
IHJldHVybiBwY2lfZ2V0X2J1cyhkZXYpLT5pc29sX2FzX21lbTsNCj4+Pj4+PiArfQ0KPj4+Pj4+
ICsNCj4+Pj4+PiArQWRkcmVzc1NwYWNlICpwY2lfaXNvbF9hc19pbyhQQ0lEZXZpY2UgKmRldikN
Cj4+Pj4+PiArew0KPj4+Pj4+ICsgICAgcmV0dXJuIHBjaV9nZXRfYnVzKGRldiktPmlzb2xfYXNf
aW87DQo+Pj4+Pj4gK30NCj4+Pj4+PiArDQo+Pj4+Pj4gc3RhdGljIHZvaWQgcGNpX2RldmljZV9j
bGFzc19pbml0KE9iamVjdENsYXNzICprbGFzcywgdm9pZCAqZGF0YSkNCj4+Pj4+PiB7DQo+Pj4+
Pj4gICBEZXZpY2VDbGFzcyAqayA9IERFVklDRV9DTEFTUyhrbGFzcyk7DQo+Pj4+Pj4gQEAgLTI2
OTksNiArMjcxMSw3IEBAIHN0YXRpYyB2b2lkIHBjaV9kZXZpY2VfY2xhc3NfYmFzZV9pbml0KE9i
amVjdENsYXNzICprbGFzcywgdm9pZCAqZGF0YSkNCj4+Pj4+PiANCj4+Pj4+PiBBZGRyZXNzU3Bh
Y2UgKnBjaV9kZXZpY2VfaW9tbXVfYWRkcmVzc19zcGFjZShQQ0lEZXZpY2UgKmRldikNCj4+Pj4+
PiB7DQo+Pj4+Pj4gKyAgICBBZGRyZXNzU3BhY2UgKmlvbW11X2FzID0gTlVMTDsNCj4+Pj4+PiAg
IFBDSUJ1cyAqYnVzID0gcGNpX2dldF9idXMoZGV2KTsNCj4+Pj4+PiAgIFBDSUJ1cyAqaW9tbXVf
YnVzID0gYnVzOw0KPj4+Pj4+ICAgdWludDhfdCBkZXZmbiA9IGRldi0+ZGV2Zm47DQo+Pj4+Pj4g
QEAgLTI3NDUsNiArMjc1OCwxMCBAQCBBZGRyZXNzU3BhY2UgKnBjaV9kZXZpY2VfaW9tbXVfYWRk
cmVzc19zcGFjZShQQ0lEZXZpY2UgKmRldikNCj4+Pj4+PiAgIGlmICghcGNpX2J1c19ieXBhc3Nf
aW9tbXUoYnVzKSAmJiBpb21tdV9idXMgJiYgaW9tbXVfYnVzLT5pb21tdV9mbikgew0KPj4+Pj4+
ICAgICAgIHJldHVybiBpb21tdV9idXMtPmlvbW11X2ZuKGJ1cywgaW9tbXVfYnVzLT5pb21tdV9v
cGFxdWUsIGRldmZuKTsNCj4+Pj4+PiAgIH0NCj4+Pj4+PiArICAgIGlvbW11X2FzID0gcGNpX2lz
b2xfYXNfbWVtKGRldik7DQo+Pj4+Pj4gKyAgICBpZiAoaW9tbXVfYXMpIHsNCj4+Pj4+PiArICAg
ICAgICByZXR1cm4gaW9tbXVfYXM7DQo+Pj4+Pj4gKyAgICB9DQo+Pj4+Pj4gICByZXR1cm4gJmFk
ZHJlc3Nfc3BhY2VfbWVtb3J5Ow0KPj4+Pj4+IH0NCj4+Pj4+PiANCj4+Pj4+PiBkaWZmIC0tZ2l0
IGEvaHcvcGNpL3BjaV9icmlkZ2UuYyBiL2h3L3BjaS9wY2lfYnJpZGdlLmMNCj4+Pj4+PiBpbmRl
eCBkYTM0YzhlYmNkLi45ODM2Njc2OGQyIDEwMDY0NA0KPj4+Pj4+IC0tLSBhL2h3L3BjaS9wY2lf
YnJpZGdlLmMNCj4+Pj4+PiArKysgYi9ody9wY2kvcGNpX2JyaWRnZS5jDQo+Pj4+Pj4gQEAgLTM4
Myw2ICszODMsMTEgQEAgdm9pZCBwY2lfYnJpZGdlX2luaXRmbihQQ0lEZXZpY2UgKmRldiwgY29u
c3QgY2hhciAqdHlwZW5hbWUpDQo+Pj4+Pj4gICBzZWNfYnVzLT5hZGRyZXNzX3NwYWNlX2lvID0g
JmJyLT5hZGRyZXNzX3NwYWNlX2lvOw0KPj4+Pj4+ICAgbWVtb3J5X3JlZ2lvbl9pbml0KCZici0+
YWRkcmVzc19zcGFjZV9pbywgT0JKRUNUKGJyKSwgInBjaV9icmlkZ2VfaW8iLA0KPj4+Pj4+ICAg
ICAgICAgICAgICAgICAgICAgIDQgKiBHaUIpOw0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgIC8qIFRo
aXMgUENJIGJyaWRnZSBwdXRzIHRoZSBzZWNfYnVzIGluIGl0cyBwYXJlbnQncyBhZGRyZXNzIHNw
YWNlICovDQo+Pj4+Pj4gKyAgICBzZWNfYnVzLT5pc29sX2FzX21lbSA9IHBjaV9pc29sX2FzX21l
bShkZXYpOw0KPj4+Pj4+ICsgICAgc2VjX2J1cy0+aXNvbF9hc19pbyA9IHBjaV9pc29sX2FzX2lv
KGRldik7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICAgYnItPndpbmRvd3MgPSBwY2lfYnJpZGdlX3JlZ2lv
bl9pbml0KGJyKTsNCj4+Pj4+PiAgIFFMSVNUX0lOSVQoJnNlY19idXMtPmNoaWxkKTsNCj4+Pj4+
PiAgIFFMSVNUX0lOU0VSVF9IRUFEKCZwYXJlbnQtPmNoaWxkLCBzZWNfYnVzLCBzaWJsaW5nKTsN
Cj4+Pj4+PiAtLSANCj4+Pj4+PiAyLjIwLjENCj4+Pj4gDQo+Pj4gLS0gDQo+Pj4gRHIuIERhdmlk
IEFsYW4gR2lsYmVydCAvIGRnaWxiZXJ0QHJlZGhhdC5jb20gLyBNYW5jaGVzdGVyLCBVSw0KPj4+
IA0KPj4gDQo+IC0tIA0KPiBEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IC8gZGdpbGJlcnRAcmVkaGF0
LmNvbSAvIE1hbmNoZXN0ZXIsIFVLDQo+IA0KDQo=

