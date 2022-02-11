Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 729014B1AE5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:02:39 +0100 (CET)
Received: from localhost ([::1]:54752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIKKc-0005p0-9p
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:02:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nIKCX-0007xW-NR
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 19:54:18 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:27184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nIKCU-0007bi-4v
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 19:54:17 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21ANRNAT026373; 
 Fri, 11 Feb 2022 00:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=K3tHSUgVq1sasQM8xfZWVnsjuto36LlF0YBjCPQy7Ok=;
 b=i/Sa6TWFcQHojPlp6pgui5lVHEmRBuRHgPHB4XMyvDNAOGROW+a704OaA6a5iomRX7tL
 ecJH+zQMDktmlaJ1S4c2c7vShSMXYjzVMDyWfee+MTLh6lay6lo6H+3DQZIBBVy9mK+Z
 naacp9L84yQJM2HD1HiV5FvVNTXRQGPJIbhtFlQo9oUkc3+a8DTpp06vmB4UUPUNB/Si
 4D8d+GalPhLitasH+qbcqdE7mb0jom43AKSZvH2ktIEoKV/afCzOLZAwz+bX+4RxWKIj
 rWyFAdDgNPL4y9J5NdIiqv73dGlgmRWUmXayzhS+2eX/YpPXt64j6tg3BznLSYsuXGhU 3Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e54ykhemh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Feb 2022 00:54:09 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21B0fvlJ138814;
 Fri, 11 Feb 2022 00:54:08 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by userp3030.oracle.com with ESMTP id 3e1ec643tb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Feb 2022 00:54:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPJ3myHo+bY4i76D6ag/FoQm/31QJYEOvVXeLuf6cH2RQUErrlwGUkTRJyY/YXFYTSkvt3AlRyOvKdDuweJ7KTsxHc3THFxACNg3S8Yo/dZGtDauLjDUkOUaKkLls9ISSuQctb66x+1xl3FO+CImTiIgxcsB6toQlkm0lmQ/azFbMsyyzkKwGpOpw2vxnCOi6Ll/pIddxTJ8bdUGQzAhSCWMQzofq54nx4lo8IQMtGqwWyyQ26QwCJSW6TeaiSBc8IJMg8ENFNFm4JP/jAXFUC2hZkz1GAz7FkORzwwLMbICAZuhDpyUFg7IOH0soRecx2REUNa3nK7LQR85cAL/dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3tHSUgVq1sasQM8xfZWVnsjuto36LlF0YBjCPQy7Ok=;
 b=Ify1Yx7j0k33hOHd58wEnK8bPbHgA14wSkk4fJjDqmqRD86+RoBkmasNipd/8kiw3RtR4/5XFtgDo2ijilLIPAgT9O1I4VqscfytcjlTKNlcE3jK60YD4peMJ3SX/SOFfP60JwFd6aMymcCyQnXDgyo7d9RQkgbwB0JetJQnm0L5/yVD9X2OWvFo7ikQ49yEw5qxqEgp7ntjeUuwQv3kOmUvFebKZHPh9BIfZBz0VaiBPHLl6bqpyfsvQBb5KTvXFLYAhwGM6W/CqJr2VtTV9CVo5RABcWX+I2LivR6vIqAT/3MVqKb5QM3UtgrV1W/K8i3I1yKWTspT3r5JU4u5EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3tHSUgVq1sasQM8xfZWVnsjuto36LlF0YBjCPQy7Ok=;
 b=fpg3pIr093g4JbgErcy7BGOoA+vkVhM4f/4mbCqzYF7y3dcSyLabEME42piLaD1SmIKM9prkCtWnAvwbGhyBBGpxR8FzllSaMzLOvZthV7eTbSY4DuMjiF9vGMhi1f6Kp4al+3j7PHFbUMog8jREMskUWq16AHp26fiU5FWfceQ=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN0PR10MB5502.namprd10.prod.outlook.com (2603:10b6:408:149::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 00:54:05 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::58f2:8ac5:3d12:5afe]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::58f2:8ac5:3d12:5afe%5]) with mapi id 15.20.4951.018; Fri, 11 Feb 2022
 00:54:05 +0000
From: Jag Raman <jag.raman@oracle.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Thread-Topic: [PATCH v5 03/18] pci: isolated address space for PCI bus
Thread-Index: AQHYDX1z2h/nyOzV1UqlYAx4HMB2U6xrCcSAgAD94YCACBLhAIAAtVOAgABH8QCAAK30AIAAEm2AgAC9D4CAANfhgIAAx9cAgAUr2oCAASDzgIAAYuuAgABkcYCAABdUAIAAKLiAgABI+gCADDeJgIAAhFKAgADwjACAAA9BAIAAAy0AgAAFw4CAAApxgIAAB5SA
Date: Fri, 11 Feb 2022 00:54:04 +0000
Message-ID: <707646C9-3E08-4DEA-BB8E-A59FE2C7478D@oracle.com>
References: <9BD98DD7-CC28-49E1-8150-BDECF0324FFA@oracle.com>
 <20220201154736.576e2a7e.alex.williamson@redhat.com>
 <BA348811-5C6D-4F9F-AC3C-824AC1681F1D@oracle.com>
 <20220201223432.4f58518f.alex.williamson@redhat.com>
 <69BE660C-C527-459B-A392-F5546A0BEB5B@oracle.com>
 <20220210022543-mutt-send-email-mst@kernel.org>
 <9E989878-326F-4E72-85DD-34D1CB72F0F8@oracle.com>
 <20220210161734.18f36e8b.alex.williamson@redhat.com>
 <20220210182157-mutt-send-email-mst@kernel.org>
 <20220210164933.53b32a1e.alex.williamson@redhat.com>
 <20220210190654-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220210190654-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ef33c91-7729-4db3-e65a-08d9ecf9009f
x-ms-traffictypediagnostic: BN0PR10MB5502:EE_
x-microsoft-antispam-prvs: <BN0PR10MB550255F0513206E405846A3C90309@BN0PR10MB5502.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +L9NSl2a4iqExofPxm8vaaNnACqgYML8gnFRtHmrBX/TC3duqyrR1wr2tmIHHJIumRSCMzzZQBy69VQhr4gFSxbjy7g8kGqbW26LItzSjk1xN9HkfHSmdaxEajFtheimiSg5Ij9wFRUwXKtEdZr9qyVh0w+y1jgWawUPpTwpVAJMLHn342NXSD6ESAXsUpjHhoGfZq5EXA96NUS68b1Egu8cLRhoGsiIS/R7Fx1ySNYldwBFMtMRuStjPhZB/sUBD7RwP7TG7GNPXssDS7AHvAzBTYbQ2tCCgXOqI6dkqEW+ICUPzyJSX1Tk0uuwfGOzOpCs64X1bLBwoSt4EQcxpDZjveTyygJ5YiGODfDcYoWKL3hx0kHryJr8asutAXIxMWYKNoX+O6vNEyimnJl/YwDrkrlAfX0jnMOicp6Or5wKGGIBH6p4NI25if4Ajv2R0u1NfCBp0MSVDrpAggmZ01UOMMuBf/3PfgCKLg336a9pU04Dym7FaeuEYXJm+pm1f38puZk53A25Kf1fIX7H+dAgEEb/pqvY2mwKsEHLM7+02mufyWrOv0Q3Hpof7/85sJKQCQ8bn9Jr26eVhBwlbnmF4V/aOrFL2H+ru4GG+bu3IPrl+FY2BlO6dAhIz4DEPiOpUnWRMPE3ebKaSQ2puGBDo5Dvzgak2IF5KlnI9wJi6OCiLwborvN6AM8y+lBpgRQotuIWyJTRfG/2qRRG0MwianOOqeCByqdw4jwnL/2qzKcD6YdPDrFzK3Hz01Ig
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(71200400001)(53546011)(4326008)(8936002)(66556008)(66446008)(66946007)(5660300002)(6916009)(64756008)(83380400001)(38100700002)(91956017)(8676002)(76116006)(6486002)(38070700005)(66476007)(6506007)(6512007)(7416002)(316002)(54906003)(86362001)(508600001)(44832011)(36756003)(33656002)(2616005)(186003)(2906002)(122000001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzA3K09wRlBGSnNjNWEvMWxJc05jdUx3eWVYRE8xMG42ajhlQ1BjTnNYMjdt?=
 =?utf-8?B?RVAwY2E2VnhTU2xoWnJnWmJYc0pndEY3T05oazNDOENMTTYzek9YYWtMMXJX?=
 =?utf-8?B?YWdJYzlDSHpBNUJkSzMwdXNuWmpZMlNKMkNGaUhONW1uaXlaUGV4aXpoWHZo?=
 =?utf-8?B?bmJXSHdhRXgzQzhaM1B4ZHJXUUF3ZUtaSUs2ekxYQmVjcThGZ0ZEWFVkSU5l?=
 =?utf-8?B?b3Zsc3V5T1ozd0Z4eHpQT1NOMXhXQXJabkJ3Q1JpdGpMSWNyL080R2pMNnFT?=
 =?utf-8?B?cW93WkoyM1Npand4elFpQ1Z4TzFXK1B5YnlMR0tpR0M1WWQwMjZuV0ZTZjA1?=
 =?utf-8?B?aHJWcmpRbzVJMTBDQXE1YnNMb3NBZmRqUDZ3Z2dBajd0cTJHUlB1MWhBVnVm?=
 =?utf-8?B?b0xBOEpsQ1JKTEh2UUo0cEZqWWV4cHgxSndIc1JkQTdSUjY2NW14MVgvelo2?=
 =?utf-8?B?UDM1VW5oMDhpQUxyQXcxNDBaWVF5UzltWnMxT01LSUl1Q2ZWZDl6a1dSTnRX?=
 =?utf-8?B?R2JLNXo3RnFpWWVRRXV4a2ZkWXlhMklvdzlCeWVoUjE4alpsU1pod3RuZXZr?=
 =?utf-8?B?L1BORWd2c28rS3oyd3pYRTBNZFZTNnVFOXFQbjRmU201b09KSzlyZk42YWtF?=
 =?utf-8?B?Zk1wSFlaSkpTSnNPQW1GM2tiU0E5bHR3UEJzWHdrNVJ1M3dNSVJUemJIampr?=
 =?utf-8?B?cDJJQkoxSlM4ODhCaDBVcTFFNWVWVEU1NlFMYVZ5ZnpHOThib3dkY1BuNVNV?=
 =?utf-8?B?ZUlKa2hOZ24xeVpXU0NnSk5QMitGdVRtUnAxWTk4MU5Xb0loV3BLcmtkeHFl?=
 =?utf-8?B?RExiT2xSeURqa0ZjZVhpTFE2VDBoeW9Dc0VIWmFhRSthQ3A4ZldUd3JUdWdM?=
 =?utf-8?B?VmJuQytrcFM1L3ZaR25sZ0FENW94akZWWTlpYlA4L0hwbjdUS05uSkltNlhz?=
 =?utf-8?B?cDRUMDJqSFZvYWhSblVRM1ZJMXpuRkcvSG5pZk1QVkdwTVorQ3VVeUxXQnI1?=
 =?utf-8?B?ejBwTkNiYVFrS0NKOUtMTnFPT1VIc01VcUVRRk5ZWEw0Um1PcWkramFQc1Bs?=
 =?utf-8?B?Y1FpcFdwMk1EWHhlbERBQ1pvTWxzNk5nRWhYZUpwZldMNGI4TWdUa3lic1dX?=
 =?utf-8?B?dXZDVEl6OVZvTENEOXlZakw2d3pjS0xOTEdaNFFpbzdiRmRzT3lzbDhGcDBX?=
 =?utf-8?B?Zm5DSmRhakUxdG9DVGJwU0d0akxxaXFFMDZGODBOU1QyRHdvLzVCeThLYk1S?=
 =?utf-8?B?Tmh5WUhVNXJCdVpldzlxMWxLaThOa0w1SVdZc3ltUUFQYTdmQmpmUXcrSlZM?=
 =?utf-8?B?MzNlUlNLYXZSdEFjajhPR3NacDVBbFNHcEs4VGlNYllCekRORW5LNE9NbFVi?=
 =?utf-8?B?OURYaUErZEc0eExpZWY2TFBUVm4vSFA3OUNKVUZiQ2JudVNUbjl3Y09rRVBW?=
 =?utf-8?B?S3lyeE1sWnA3djNjOGRPaXpYS2VGN0ljczhKWG15ek9qVHMrTHdlRXk5eVda?=
 =?utf-8?B?RTRlNFdleWFsSmFKWUg1aHptV1B2aCtuNHZaYTl6NHpSRmxZZzFyRm1PUGs1?=
 =?utf-8?B?Y0lKeTJJWUgya0lrOEJqTlZibHB5bmpUaFVCMWVxY0VtbFpjNkp3UUpyeXda?=
 =?utf-8?B?YVFMS2oxRUowYlVUYmtJU0xwWlJndzNhL044SXNzZGhSdXFDaGdZekRNcW84?=
 =?utf-8?B?U3hJUFEvWTRmWDRJcDZ4UGFKQXNwY08wcW5VOUxLMGcrUU1OU0FkOUlZTW5w?=
 =?utf-8?B?b1c1RzBGS1NUZ00ybmd2R3phRXVEUHNHWXZRUElBd2swWVQ5K0VKK0lscGRv?=
 =?utf-8?B?TUYvM2Z4MDB3Y1RMQ2pxUExjOTNqNXdJZVQ3SW5MVDZ2VVdJdjRhUGpDKzJz?=
 =?utf-8?B?bmwrd0VRanJuWlVaRkwrZ0t4S1Z0Y2VJTWFRaXVrQmNaZS9CQTF0alR5QWxZ?=
 =?utf-8?B?UGJUME1PV2lKVGp4VEs1ejNPcDdoU3hBYVFSU1o5dVRnc2lrYm0rS3diS3Ir?=
 =?utf-8?B?YlkvT2RLZTQzSTB5MTR3a2JLc0tnRUFnOVd5L2JjK3FYU09IWE9hM3Z5R1V6?=
 =?utf-8?B?c3Q4R1ZWdzA3WFJKNExNcXhWeFl2SjBsVmlpckVUbGkvbnMzSlpmODl3S09J?=
 =?utf-8?B?ZWY1MERYWTF0NWVUYzRrUGVhWHRYa3FtYTlDWHZlUHMrTkdadXBsdFBlWVZu?=
 =?utf-8?B?a215Sko4VTU3YVFRbFFVbzdKM0EvWFJaeDdBS3ZwWUhRRlhGM3UyaTh6QnR6?=
 =?utf-8?B?TitBUWw4U3NrbU1mWGFKcEFINklnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4F5E5F2086F3244BF6C81AD30C4F8A1@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef33c91-7729-4db3-e65a-08d9ecf9009f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 00:54:04.9876 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GpqUnuG5WKkMqOxjCEy6zzYmeQswEhGEiTgn4azeGfgRObHUNN2glh32QT6A8GceOskJGFHFncsSMEInCD8rEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5502
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10254
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202110001
X-Proofpoint-GUID: ilfAtYKzuFtZ6wV7jxsBq_1wYVmlHjxG
X-Proofpoint-ORIG-GUID: ilfAtYKzuFtZ6wV7jxsBq_1wYVmlHjxG
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
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Johnson <john.g.johnson@oracle.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "armbru@redhat.com" <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Eric Blake <eblake@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDEwLCAyMDIyLCBhdCA3OjI2IFBNLCBNaWNoYWVsIFMuIFRzaXJraW4gPG1z
dEByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIFRodSwgRmViIDEwLCAyMDIyIGF0IDA0OjQ5
OjMzUE0gLTA3MDAsIEFsZXggV2lsbGlhbXNvbiB3cm90ZToNCj4+IE9uIFRodSwgMTAgRmViIDIw
MjIgMTg6Mjg6NTYgLTA1MDANCj4+ICJNaWNoYWVsIFMuIFRzaXJraW4iIDxtc3RAcmVkaGF0LmNv
bT4gd3JvdGU6DQo+PiANCj4+PiBPbiBUaHUsIEZlYiAxMCwgMjAyMiBhdCAwNDoxNzozNFBNIC0w
NzAwLCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6DQo+Pj4+IE9uIFRodSwgMTAgRmViIDIwMjIgMjI6
MjM6MDEgKzAwMDANCj4+Pj4gSmFnIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNvbT4gd3JvdGU6
DQo+Pj4+IA0KPj4+Pj4+IE9uIEZlYiAxMCwgMjAyMiwgYXQgMzowMiBBTSwgTWljaGFlbCBTLiBU
c2lya2luIDxtc3RAcmVkaGF0LmNvbT4gd3JvdGU6DQo+Pj4+Pj4gDQo+Pj4+Pj4gT24gVGh1LCBG
ZWIgMTAsIDIwMjIgYXQgMTI6MDg6MjdBTSArMDAwMCwgSmFnIFJhbWFuIHdyb3RlOiAgICANCj4+
Pj4+Pj4gDQo+Pj4+Pj4+IFRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLCBBbGV4LiBUaGFua3Mg
dG8gZXZlcnlvbmUgZWxzZSBpbiB0aGUgdGhyZWFkIHdobw0KPj4+Pj4+PiBoZWxwZWQgdG8gY2xh
cmlmeSB0aGlzIHByb2JsZW0uDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBXZSBoYXZlIGltcGxlbWVudGVk
IHRoZSBtZW1vcnkgaXNvbGF0aW9uIGJhc2VkIG9uIHRoZSBkaXNjdXNzaW9uIGluIHRoZQ0KPj4+
Pj4+PiB0aHJlYWQuIFdlIHdpbGwgc2VuZCB0aGUgcGF0Y2hlcyBvdXQgc2hvcnRseS4NCj4+Pj4+
Pj4gDQo+Pj4+Pj4+IERldmljZXMgc3VjaCBhcyDigJxuYW1lIiBhbmQg4oCcZTEwMDDigJ0gd29y
a2VkIGZpbmUuIEJ1dCBJ4oCZZCBsaWtlIHRvIG5vdGUgdGhhdA0KPj4+Pj4+PiB0aGUgTFNJIGRl
dmljZSAoVFlQRV9MU0k1M0M4OTVBKSBoYWQgc29tZSBwcm9ibGVtcyAtIGl0IGRvZXNu4oCZdCBz
ZWVtDQo+Pj4+Pj4+IHRvIGJlIElPTU1VIGF3YXJlLiBJbiBMU0nigJlzIGNhc2UsIHRoZSBrZXJu
ZWwgZHJpdmVyIGlzIGFza2luZyB0aGUgZGV2aWNlIHRvDQo+Pj4+Pj4+IHJlYWQgaW5zdHJ1Y3Rp
b25zIGZyb20gdGhlIENQVSBWQSAobHNpX2V4ZWN1dGVfc2NyaXB0KCkgLT4gcmVhZF9kd29yZCgp
KSwNCj4+Pj4+Pj4gd2hpY2ggaXMgZm9yYmlkZGVuIHdoZW4gSU9NTVUgaXMgZW5hYmxlZC4gU3Bl
Y2lmaWNhbGx5LCB0aGUgZHJpdmVyIGlzIGFza2luZw0KPj4+Pj4+PiB0aGUgZGV2aWNlIHRvIGFj
Y2VzcyBvdGhlciBCQVIgcmVnaW9ucyBieSB1c2luZyB0aGUgQkFSIGFkZHJlc3MgcHJvZ3JhbW1l
ZA0KPj4+Pj4+PiBpbiB0aGUgUENJIGNvbmZpZyBzcGFjZS4gVGhpcyBoYXBwZW5zIGV2ZW4gd2l0
aG91dCB2ZmlvLXVzZXIgcGF0Y2hlcy4gRm9yIGV4YW1wbGUsDQo+Pj4+Pj4+IHdlIGNvdWxkIGVu
YWJsZSBJT01NVSB1c2luZyDigJwtZGV2aWNlIGludGVsLWlvbW114oCdIFFFTVUgb3B0aW9uIGFu
ZCBhbHNvDQo+Pj4+Pj4+IGFkZGluZyB0aGUgZm9sbG93aW5nIHRvIHRoZSBrZXJuZWwgY29tbWFu
ZC1saW5lOiDigJxpbnRlbF9pb21tdT1vbiBpb21tdT1ub3B04oCdLg0KPj4+Pj4+PiBJbiB0aGlz
IGNhc2UsIHdlIGNvdWxkIHNlZSBhbiBJT01NVSBmYXVsdC4gICAgDQo+Pj4+Pj4gDQo+Pj4+Pj4g
U28sIGRldmljZSBhY2Nlc3NpbmcgaXRzIG93biBCQVIgaXMgZGlmZmVyZW50LiBCYXNpY2FsbHks
IHRoZXNlDQo+Pj4+Pj4gdHJhbnNhY3Rpb25zIG5ldmVyIGdvIG9uIHRoZSBidXMgYXQgYWxsLCBu
ZXZlciBtaW5kIGdldCB0byB0aGUgSU9NTVUuICAgIA0KPj4+Pj4gDQo+Pj4+PiBIaSBNaWNoYWVs
LA0KPj4+Pj4gDQo+Pj4+PiBJbiBMU0kgY2FzZSwgSSBkaWQgbm90aWNlIHRoYXQgaXQgd2VudCB0
byB0aGUgSU9NTVUuIFRoZSBkZXZpY2UgaXMgcmVhZGluZyB0aGUgQkFSDQo+Pj4+PiBhZGRyZXNz
IGFzIGlmIGl0IHdhcyBhIERNQSBhZGRyZXNzLg0KPj4+Pj4gDQo+Pj4+Pj4gSSB0aGluayBpdCdz
IGp1c3QgdXNlZCBhcyBhIGhhbmRsZSB0byBhZGRyZXNzIGludGVybmFsIGRldmljZSBtZW1vcnku
DQo+Pj4+Pj4gVGhpcyBraW5kIG9mIHRyaWNrIGlzIG5vdCB1bml2ZXJzYWwsIGJ1dCBub3QgdGVy
cmlibHkgdW51c3VhbC4NCj4+Pj4+PiANCj4+Pj4+PiANCj4+Pj4+Pj4gVW5mb3J0dW5hdGVseSwg
d2Ugc3RhcnRlZCBvZmYgb3VyIHByb2plY3Qgd2l0aCB0aGUgTFNJIGRldmljZS4gU28gdGhhdCBs
ZWFkIHRvIGFsbCB0aGUNCj4+Pj4+Pj4gY29uZnVzaW9uIGFib3V0IHdoYXQgaXMgZXhwZWN0ZWQg
YXQgdGhlIHNlcnZlciBlbmQgaW4tdGVybXMgb2YNCj4+Pj4+Pj4gdmVjdG9yaW5nL2FkZHJlc3Mt
dHJhbnNsYXRpb24uIEl0IGdhdmUgYW4gaW1wcmVzc2lvbiBhcyBpZiB0aGUgcmVxdWVzdCB3YXMg
c3RpbGwgb24NCj4+Pj4+Pj4gdGhlIENQVSBzaWRlIG9mIHRoZSBQQ0kgcm9vdCBjb21wbGV4LCBi
dXQgdGhlIGFjdHVhbCBwcm9ibGVtIHdhcyB3aXRoIHRoZQ0KPj4+Pj4+PiBkZXZpY2UgZHJpdmVy
IGl0c2VsZi4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IEnigJltIHdvbmRlcmluZyBob3cgdG8gZGVhbCB3
aXRoIHRoaXMgcHJvYmxlbS4gV291bGQgaXQgYmUgT0sgaWYgd2UgbWFwcGVkIHRoZQ0KPj4+Pj4+
PiBkZXZpY2XigJlzIEJBUiBpbnRvIHRoZSBJT1ZBLCBhdCB0aGUgc2FtZSBDUFUgVkEgcHJvZ3Jh
bW1lZCBpbiB0aGUgQkFSIHJlZ2lzdGVycz8NCj4+Pj4+Pj4gVGhpcyB3b3VsZCBoZWxwIGRldmlj
ZXMgc3VjaCBhcyBMU0kgdG8gY2lyY3VtdmVudCB0aGlzIHByb2JsZW0uIE9uZSBwcm9ibGVtDQo+
Pj4+Pj4+IHdpdGggdGhpcyBhcHByb2FjaCBpcyB0aGF0IGl0IGhhcyB0aGUgcG90ZW50aWFsIHRv
IGNvbGxpZGUgd2l0aCBhbm90aGVyIGxlZ2l0aW1hdGUNCj4+Pj4+Pj4gSU9WQSBhZGRyZXNzLiBL
aW5kbHkgc2hhcmUgeW91ciB0aG91Z2h0IG9uIHRoaXMuDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBUaGFu
ayB5b3UhICAgIA0KPj4+Pj4+IA0KPj4+Pj4+IEkgYW0gbm90IDEwMCUgc3VyZSB3aGF0IGRvIHlv
dSBwbGFuIHRvIGRvIGJ1dCBpdCBzb3VuZHMgZmluZSBzaW5jZSBldmVuDQo+Pj4+Pj4gaWYgaXQg
Y29sbGlkZXMsIHdpdGggdHJhZGl0aW9uYWwgUENJIGRldmljZSBtdXN0IG5ldmVyIGluaXRpYXRl
IGN5Y2xlcyAgICANCj4+Pj4+IA0KPj4+Pj4gT0sgc291bmRzIGdvb2QsIEnigJlsbCBjcmVhdGUg
YSBtYXBwaW5nIG9mIHRoZSBkZXZpY2UgQkFScyBpbiB0aGUgSU9WQS4gIA0KPj4+PiANCj4+Pj4g
SSBkb24ndCB0aGluayB0aGlzIGlzIGNvcnJlY3QuICBMb29rIGZvciBpbnN0YW5jZSBhdCBBQ1BJ
IF9UUkEgc3VwcG9ydA0KPj4+PiB3aGVyZSBhIHN5c3RlbSBjYW4gc3BlY2lmeSBhIHRyYW5zbGF0
aW9uIG9mZnNldCBzdWNoIHRoYXQsIGZvciBleGFtcGxlLA0KPj4+PiBhIENQVSBhY2Nlc3MgdG8g
YSBkZXZpY2UgaXMgcmVxdWlyZWQgdG8gYWRkIHRoZSBwcm92aWRlZCBvZmZzZXQgdG8gdGhlDQo+
Pj4+IGJ1cyBhZGRyZXNzIG9mIHRoZSBkZXZpY2UuICBBIHN5c3RlbSB1c2luZyB0aGlzIGNvdWxk
IGhhdmUgbXVsdGlwbGUNCj4+Pj4gcm9vdCBicmlkZ2VzLCB3aGVyZSBlYWNoIGlzIGdpdmVuIHRo
ZSBzYW1lLCBvdmVybGFwcGluZyBNTUlPIGFwZXJ0dXJlLiAgDQo+Pj4+PiBGcm9tIHRoZSBwcm9j
ZXNzb3IgcGVyc3BlY3RpdmUsIGVhY2ggTU1JTyByYW5nZSBpcyB1bmlxdWUgYW5kIHBvc3NpYmx5
ICANCj4+Pj4gbm9uZSBvZiB0aG9zZSBkZXZpY2VzIGhhdmUgYSB6ZXJvIF9UUkEsIHRoZXJlIGNv
dWxkIGJlIHN5c3RlbSBtZW1vcnkgYXQNCj4+Pj4gdGhlIGVxdWl2YWxlbnQgZmxhdCBtZW1vcnkg
YWRkcmVzcy4gIA0KPj4+IA0KPj4+IEkgYW0gZ3Vlc3NpbmcgdGhlcmUgYXJlIHJlYXNvbnMgdG8g
aGF2ZSB0aGVzZSBpbiBhY3BpIGJlc2lkZXMgZmlybXdhcmUNCj4+PiB2ZW5kb3JzIHdhbnRpbmcg
dG8gZmluZCBjb3JuZXIgY2FzZXMgaW4gZGV2aWNlIGltcGxlbWVudGF0aW9ucyB0aG91Z2gNCj4+
PiA6KS4gRS5nLiBpdCdzIHBvc3NpYmxlIHNvbWV0aGluZyBlbHNlIGlzIHR3ZWFraW5nIERNQSBp
biBzaW1pbGFyIHdheXMuIEkNCj4+PiBjYW4ndCBzYXkgZm9yIHN1cmUgYW5kIEkgd29uZGVyIHdo
eSBkbyB3ZSBjYXJlIGFzIGxvbmcgYXMgUUVNVSBkb2VzIG5vdA0KPj4+IGhhdmUgX1RSQS4NCj4+
IA0KPj4gSG93IG1hbnkgY29tcGxhaW50cyBkbyB3ZSBnZXQgYWJvdXQgcnVubmluZyBvdXQgb2Yg
SS9PIHBvcnQgc3BhY2Ugb24NCj4+IHEzNSBiZWNhdXNlIHdlIGFsbG93IGFuIGFyYml0cmFyeSBu
dW1iZXIgb2Ygcm9vdCBwb3J0cz8gIFdoYXQgaWYgd2UNCj4+IHVzZWQgX1RSQSB0byBwcm92aWRl
IHRoZSBmdWxsIEkvTyBwb3J0IHJhbmdlIHBlciByb290IHBvcnQ/ICAzMi1iaXQNCj4+IE1NSU8g
Y291bGQgYmUgZHVwbGljYXRlZCBhcyB3ZWxsLg0KPiANCj4gSXQncyBhbiBpbnRlcmVzdGluZyBp
ZGVhLiBUbyBjbGFyaWZ5IHdoYXQgSSBzYWlkLCBJIHN1c3BlY3Qgc29tZSBkZXZpY2VzDQo+IGFy
ZSBicm9rZW4gaW4gcHJlc2VuY2Ugb2YgdHJhbnNsYXRpbmcgYnJpZGdlcyB1bmxlc3MgRE1BDQo+
IGlzIGFsc28gdHJhbnNsYXRlZCB0byBtYXRjaC4NCj4gDQo+IEkgYWdyZWUgaXQncyBhIG1lc3Mg
dGhvdWdoLCBpbiB0aGF0IHNvbWUgZGV2aWNlcyB3aGVuIGdpdmVuIHRoZWlyIG93bg0KPiBCQVIg
dG8gRE1BIHRvIHdpbGwgcHJvYmFibHkganVzdCBzYXRpc2Z5IHRoZSBhY2Nlc3MgZnJvbSBpbnRl
cm5hbA0KPiBtZW1vcnksIHdoaWxlIG90aGVycyB3aWxsIGlnbm9yZSB0aGF0IGFuZCBzZW5kIGl0
IHVwIGFzIERNQQ0KPiBhbmQgYm90aCB0eXBlcyBhcmUgcHJvYmFibHkgb3V0IHRoZXJlIGluIHRo
ZSBmaWVsZC4NCj4gDQo+IA0KPj4+PiBTbyBpZiB0aGUgdHJhbnNhY3Rpb24gYWN0dWFsbHkgaGl0
cyB0aGlzIGJ1cywgd2hpY2ggSSB0aGluayBpcyB3aGF0DQo+Pj4+IG1ha2luZyB1c2Ugb2YgdGhl
IGRldmljZSBBZGRyZXNzU3BhY2UgaW1wbGllcywgSSBkb24ndCB0aGluayBpdCBjYW4NCj4+Pj4g
YXNzdW1lIHRoYXQgaXQncyBzaW1wbHkgcmVmbGVjdGVkIGJhY2sgYXQgaXRzZWxmLiAgQ29udmVu
dGlvbmFsIFBDSSBhbmQNCj4+Pj4gUENJIEV4cHJlc3MgbWF5IGJlIHNvZnR3YXJlIGNvbXBhdGli
bGUsIGJ1dCB0aGVyZSdzIGEgcmVhc29uIHdlIGRvbid0DQo+Pj4+IHNlZSBJT01NVXMgdGhhdCBw
cm92aWRlIGJvdGggdHJhbnNsYXRpb24gYW5kIGlzb2xhdGlvbiBpbiBjb252ZW50aW9uYWwNCj4+
Pj4gdG9wb2xvZ2llcy4NCj4+Pj4gDQo+Pj4+IElzIHRoaXMgbW9yZSBhIGJ1ZyBpbiB0aGUgTFNJ
IGRldmljZSBlbXVsYXRpb24gbW9kZWw/ICBGb3IgaW5zdGFuY2UgaW4NCj4+Pj4gdmZpby1wY2ks
IGlmIEkgd2FudCB0byBhY2Nlc3MgYW4gb2Zmc2V0IGludG8gYSBCQVIgZnJvbSB3aXRoaW4gUUVN
VSwgSQ0KPj4+PiBkb24ndCBjYXJlIHdoYXQgYWRkcmVzcyBpcyBwcm9ncmFtbWVkIGludG8gdGhh
dCBCQVIsIEkgcGVyZm9ybSBhbg0KPj4+PiBhY2Nlc3MgcmVsYXRpdmUgdG8gdGhlIHZmaW8gZmls
ZSBkZXNjcmlwdG9yIHJlZ2lvbiByZXByZXNlbnRpbmcgdGhhdA0KPj4+PiBCQVIgc3BhY2UuICBJ
J2QgZXhwZWN0IHRoYXQgYW55IHZpYWJsZSBkZXZpY2UgZW11bGF0aW9uIG1vZGVsIGRvZXMgdGhl
DQo+Pj4+IHNhbWUsIGFuIGFjY2VzcyB0byBkZXZpY2UgbWVtb3J5IHVzZXMgYW4gb2Zmc2V0IGZy
b20gYW4gaW50ZXJuYWwNCj4+Pj4gcmVzb3VyY2UsIGlycmVzcGVjdGl2ZSBvZiB0aGUgQkFSIGFk
ZHJlc3MuICANCj4+PiANCj4+PiBIb3dldmVyLCB1c2luZyBCQVIgc2VlbXMgbGlrZSBhIHJlYXNv
bmFibGUgc2hvcnRjdXQgYWxsb3dpbmcNCj4+PiBkZXZpY2UgdG8gdXNlIHRoZSBzYW1lIDY0IGJp
dCBhZGRyZXNzIHRvIHJlZmVyIHRvIHN5c3RlbQ0KPj4+IGFuZCBkZXZpY2UgUkFNIGludGVyY2hh
bmdlYWJseS4NCj4+IA0KPj4gQSBzaG9ydGN1dCB0aGF0IGJyZWFrcyB3aGVuIGFuIElPTU1VIGlz
IGludm9sdmVkLg0KPiANCj4gTWF5YmUuIEJ1dCBpZiB0aGF0J3MgaG93IGhhcmR3YXJlIGJlaGF2
ZXMsIHdlIGhhdmUgbGl0dGxlIGNob2ljZSBidXQNCj4gZW11bGF0ZSBpdC4NCg0KSSB3YXMgd29u
ZGVyaW5nIGlmIHdlIGNvdWxkIG1hcCB0aGUgQkFScyBpbnRvIHRoZSBJT1ZBIGZvciBhIGxpbWl0
ZWQgc2V0IG9mDQpkZXZpY2VzIC0gdGhlIG9uZXMgd2hpY2ggYXJlIGRlc2lnbmVkIGJlZm9yZSBJ
T01NVSBzdWNoIGFzIGxzaTUzYzg5NWEuDQpUaGlzIHdvdWxkIGVuc3VyZSB0aGF0IHdlIGZvbGxv
dyB0aGUgc3BlYyB0byB0aGUgYmVzdCB3aXRob3V0IGJyZWFraW5nDQpleGlzdGluZyBkZXZpY2Vz
Pw0KDQotLQ0KSmFnDQoNCj4gDQo+Pj4+IEl0IHdvdWxkIHNlZW0gc3RyYW5nZSBpZiB0aGUgZHJp
dmVyIGlzIGFjdHVhbGx5IHByb2dyYW1taW5nIHRoZSBkZXZpY2UNCj4+Pj4gdG8gRE1BIHRvIGl0
c2VsZiBhbmQgaWYgdGhhdCdzIGFjdHVhbGx5IGhhcHBlbmluZywgSSdkIHdvbmRlciBpZiB0aGlz
DQo+Pj4+IGRyaXZlciBpcyBhY3R1YWxseSBjb21wYXRpYmxlIHdpdGggYW4gSU9NTVUgb24gYmFy
ZSBtZXRhbC4gIA0KPj4+IA0KPj4+IFlvdSBrbm93LCBpdCdzIGhhcmR3YXJlIGFmdGVyIGFsbC4g
QXMgbG9uZyBhcyB0aGluZ3Mgd29yayB2ZW5kb3JzDQo+Pj4gaGFwcGlseSBzaGlwIHRoZSBkZXZp
Y2UuIFRoZXkgZG9uJ3QgcmVhbGx5IHdvcnJ5IGFib3V0IHRoZW9yZXRpY2FsIGlzc3VlcyA7KS4N
Cj4+IA0KPj4gV2UncmUgdGFsa2luZyBhYm91dCBhIDMyLWJpdCBjb252ZW50aW9uYWwgUENJIGRl
dmljZSBmcm9tIHRoZSBwcmV2aW91cw0KPj4gY2VudHVyeS4gIElPTU1VcyBhcmUgbm8gbG9uZ2Vy
IHRoZW9yZXRpY2FsLCBidXQgbm90IGFsbCBkcml2ZXJzIGhhdmUNCj4+IGtlcHQgdXAuICBJdCdz
IG1heWJlIG5vdCB0aGUgYmVzdCBjaG9pY2UgYXMgdGhlIGRlIGZhY3RvIHN0YW5kYXJkDQo+PiBk
ZXZpY2UsIGltby4gIFRoYW5rcywNCj4+IA0KPj4gQWxleA0KPiANCj4gTW9yZSBpbXBvcnRhbnRs
eSBsb3RzIGRldmljZXMgbW9zdCBsaWtlbHkgZG9uJ3Qgc3VwcG9ydCBhcmJpdHJhcnkNCj4gY29u
ZmlndXJhdGlvbnMgYW5kIGJyZWFrIGlmIHlvdSB0cnkgdG8gY3JlYXRlIHNvbWV0aGluZyB0aGF0
IG1hdGNoZXMgdGhlDQo+IHNwZWMgYnV0IG5ldmVyIG9yIGV2ZW4gcmFyZWx5IG9jY3VycyBvbiBi
YXJlIG1ldGFsLg0KPiANCj4gLS0gDQo+IE1TVA0KPiANCg0K

