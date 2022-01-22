Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5541D49697C
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 03:54:26 +0100 (CET)
Received: from localhost ([::1]:40592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB6Xo-000531-Rb
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 21:54:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nB6Wb-0003mM-Vi; Fri, 21 Jan 2022 21:53:10 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:28594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nB6WZ-00068K-9Y; Fri, 21 Jan 2022 21:53:09 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20M1i1h9015992; 
 Sat, 22 Jan 2022 02:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=KMu7OfFA6icjqOXlij0foDHvTFFEFcIvir/VfhGgs4Y=;
 b=JYRaWanPqKd0STbDSup4EtovXRNieTn4tMf7t4ih7/RpMlPZZyE3kT4/+4Qu8Jt2PYI8
 Xp0jqwzCwMyfYe/7T2WO5uagSqaZZuS7XHrezCTPvrLM8xATr0gaXm3MmAL/vaOa41im
 DfeQuancZ0oggEPv1pRehRMOcILlQSepxedYXS6dgt+c+rw7nEMrgTkbilyOnsonfjtb
 PvBSnAVoFBwr33FSaA0BRPlw2YFzBeItj5dZ55pVmjy/G0qV1RubI51axOHueYRKX+XE
 4yqxGHiQ4gVRMrvkfE4/mUjDjSP6rBpgJ0qp5oNaO2Y+kgH7VP1xymWANNndQWA2s9M9 3A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dr8h182kw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 22 Jan 2022 02:52:53 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20M2oaWX066703;
 Sat, 22 Jan 2022 02:52:52 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by aserp3020.oracle.com with ESMTP id 3dqj0tv16p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 22 Jan 2022 02:52:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lo1zMhrAp4VELnbEcSVhOdiTTURujjFnHOTImiXtqNe1zPHyMikATFv7o563mfHBOmfTKwQc5pN43CPV4wwPOEh2MFlRtYsKUUYHPDrMgJzQg6hObgcfYbKBOOfDpUxvqVyuV+O2fG+u+lQ6/cZPfdVi5q3ayREWU1xMUY7Igjd9sDVW1dqRK7zbBDtGIKc2v/KzDcGfsVVyi4AVOtYxFH88NyhnKcocYliyzkFT/hTOW4TIvW0AN2TNr79NGnXtka481ERnwPlWGFTWkK7ZydzfJop3hXNp0DyFaOcehS73kZ7fQ6ffyWAzPlrL6lfqO/K+dcvbDllerV+hdL3zbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMu7OfFA6icjqOXlij0foDHvTFFEFcIvir/VfhGgs4Y=;
 b=nSDrGtQVQG2FnIqegU9Vr64/0vrG5Tu48SJgSOHSVbthbXRJs2g4dD/1DziZ9mT01m9ilWuxNSB+XOneyLvfPohMRtP3tHTlRLRc39HxxG1SrN2a3Xqj+kbrA0RX0noHFXq1OvRah4enN1ooW2EasBJmuXBLFFxKqCTP/wDYfCnyg0lDHr2GLOljywCfOMNpjYiVBBDuwxfCBOq7ks3UR7T/mATQSN0Ex96ClF4IIPcfUTEnT45zJqCUtICXcs5gl0wrex1F5MO5JHUvyUc7EHVSznXuTbmFGGWdc47PI/PHKtWkXrxLuz7HOv17xbP2prDyZ5whx37eWsUMRuvwPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMu7OfFA6icjqOXlij0foDHvTFFEFcIvir/VfhGgs4Y=;
 b=G1D63H8JOLVBbytSZpRL1rCL4Qh6xlPgEdbhOlWFe2x7LYK1E1WY6+0O7kcnVEeTeMcPYvZjfJkYGgUGP4LUKrLgabp9EUaPJjqUFUzyaBAGSbylR+Aa76K7FArp3H7MYuyw0OSTj1EUgn2C6Dyu+DmIQvNyX1iVfrWUW6fb7Bs=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3408.namprd10.prod.outlook.com (2603:10b6:208:127::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Sat, 22 Jan
 2022 02:52:50 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4909.012; Sat, 22 Jan 2022
 02:52:49 +0000
From: Jag Raman <jag.raman@oracle.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH] hw/remote: Add missing include
Thread-Topic: [PATCH] hw/remote: Add missing include
Thread-Index: AQHYDye9UNLDGdMYGkCHNewGRhU5D6xuV/aA
Date: Sat, 22 Jan 2022 02:52:49 +0000
Message-ID: <4AC03C2C-FC1E-4FD1-84F1-EF6C56CCD1D2@oracle.com>
References: <20220122003345.84522-1-f4bug@amsat.org>
In-Reply-To: <20220122003345.84522-1-f4bug@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 211e076d-180f-44d8-91bb-08d9dd524712
x-ms-traffictypediagnostic: MN2PR10MB3408:EE_
x-microsoft-antispam-prvs: <MN2PR10MB34083718C146D30FD7842E0D905C9@MN2PR10MB3408.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:439;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xr1Nh2poNYVrGUmED1X7zAG7s+/PYgnoyXPP3c0skpJN4u/SUsClvlEvwRpSmEucOSPUNPtu2HhGD9Hndcl1Nw+94lbKsBts3eINwL14qRIPE9KRgVDkAFm5VG28zYAOx4qQqRKEs1J85pMtUTkHF71E4s1EjuTuy9rZz6HjDhwM1nsl7DJK3POC5nBzj0utu2b9EBCtk3kY7YWBCMURHIKbDvkXh6PxSodv1K9ttqZSpkSGmuZSW7XB59d7VANRrL7IygJ1FEmYGsUoSomiv9+olOpaFk9HDqHu+UmVMBleQUdQnf8+9zJVFuXh40oYSR4r+o++C7hvgy+35XjKaYJAc5VddFbKj+Ho2FPwS2yIy6tZBrTm8/hw52JEIviyDRFdHulxEPuNdrBpMTm18gzknj8lviW/tdXEP96vYpzka95i1i9udM9raRS5u1AxSSN2ioQZBMljvvwRdBWe4TRjSPv5L0YLB+64pm9mWXMyPMibW0nKJC8DbTFOnWy0RZbl2Kt8qH7lF2Lrex/O0kXRBnNLvP7DNr9VvtNJRNAZUZpeBE0rLrVn3QPCpKW99rZAMkGLt88F+30yR6c7KrKzGkWb0c8a/LQgf5pRwp3GL0szKD7uZ2oQjvhVb9vdufFi5xJ9SmN6F8DVlNvGoPV+vXYbHMvq7XTX8uM58VXJE4kX394qGx2aZC9vIUn6CTcTNFsHylEdcIvQWngEvMXaA3KkKnzeOys2D2B4p8Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(122000001)(2616005)(66556008)(66476007)(6486002)(6916009)(36756003)(508600001)(66946007)(76116006)(44832011)(54906003)(64756008)(66446008)(91956017)(6512007)(4326008)(8936002)(33656002)(186003)(53546011)(6506007)(2906002)(86362001)(71200400001)(107886003)(5660300002)(316002)(8676002)(38100700002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDcrK0U5ZE5adElUeW03NSthblRaTlJ6Q3JUZkhBSTRtWFpEaTJRTVhEbUlh?=
 =?utf-8?B?NHVGR1prck9tQVJ6b1ROR1h1MzNMRU9JMWNBeDlvODFZV1ZtbWErOGtFUEJX?=
 =?utf-8?B?T1dEYXhBUzFDN1lmK0orTE5NMUdVUlZHaElOWDhLWi9heEtiU3pWd21GVGpO?=
 =?utf-8?B?SEI5TFFGTk1hQWl0Y1hLUWVhNXpCTmZSRnJId1ZGTHBmamlTL1FKblp0dnVK?=
 =?utf-8?B?VHdFaFg0NEFBUmV5ajJGOWEvVmptanlaNGN3RTA4NDVDUWRreWNpUkEwOURH?=
 =?utf-8?B?VGYvM3NxZHU3UVFROGczL1A4L2w3c1hqSTRleWlDZmdEMnFVSGcwandxVlVP?=
 =?utf-8?B?VTdhQVBmKzMrMnB4S3hCMkQ3NDFYS3N5T2VEWlF0bkRQNkdqMkZwdmx6dTNZ?=
 =?utf-8?B?WnhGdGRxUndRMU1yaXMzK1lPcjV3Q3JxOHlLbWtaOUNJMUlZOHRaQUZoakpR?=
 =?utf-8?B?ZnhFMnRpSENGQy81eVcvVW5XT1VaaEFRbExKRmU1eER2SmZHMnVUajFHRzg5?=
 =?utf-8?B?SXFEWE5mSUxNV3pZZWZYQzZrUFJHbkxlOUovYkRUT25QY0UvUUFqQkY3UkQ2?=
 =?utf-8?B?RXh6OC9ZNmZ1ZHlmQThSMG9jK2hFWW5mQm83NEJxNGZQVTB4UkdweVQrUWxJ?=
 =?utf-8?B?SHpJNVBiKzREdHpBOWY1cWVzWHhrNnUyeVc3cFN5WEJSaWFCNWMzMlBZWDJZ?=
 =?utf-8?B?MC9ZVm54eHNlRkhoQnVnbWgrcEVQdUlmd2I2NjN1NjJYRUVKN3dmbkVOTVZU?=
 =?utf-8?B?OGg1Z2FYZ3ZrSGJpRDUxSG1XRGJwM3IvVmZROEltSkdNTUxITjlsQ3ptL3la?=
 =?utf-8?B?d2tjYjJkZHVVRmJuRWhkS2VNeVRhTFVXYWE3eVJCODV4Rm94WFBDSXlZMk95?=
 =?utf-8?B?elhkRWZ1OTd1amw4Mjk2Qk1SSTlJb2tVTGRXYTBnQ3A1YmppbnF0NjgxR2Ra?=
 =?utf-8?B?MXZESkU1QmtpeWg0M3VWbWNPMWdEMUU3Q3cvUittUXV5cmlkSGpid01zTUpj?=
 =?utf-8?B?dytKdGNRM1hibS9uSzNCR0xxUjRZUDhQMGhBU2lBWHlIYXJZTTRyQTNCTThz?=
 =?utf-8?B?M2Z3alBhbDB0alBYdmtWZ2dDdUt0NWRhZnA5dm93VFlaYWl5a1A4Wk9nTzdn?=
 =?utf-8?B?Um9YalE3a1dkRlJSYkpoZEJ6NVdPV0xiYWt4YVNtTHJkNjZwV3JYRUFGdGVN?=
 =?utf-8?B?Qm0vbFA1dDhOd2R0bVR0dDhIbTdyS1VGOXhMc0svNTVBc2RRdE5vQVNmTFRD?=
 =?utf-8?B?MnRNQkQwM3hjU0Fac2hRZ3k4ZzNJd2xIWEZxSWJRREtvZTB4a1hyQ2QxMHRk?=
 =?utf-8?B?S24vWFRVNHZ2K0U4Q0hxRlVUL2tvSWZMbWtFKy9hNS9EeEYwUVFVQW5LQUlJ?=
 =?utf-8?B?OUNUaDNCT2p6R2hyMG4zcHhWK3VaS0haRk9vZVQxOGk1b3dZZHpheGhHOEIv?=
 =?utf-8?B?dG9CaHI3R0FZOEw4Vk5FTE8rRGN4VFNXSENZQXFPYzFoRWFwRkovWmI0V2o4?=
 =?utf-8?B?dkUyMGJ0dGhHVStQdjY2RkNrOW1SQ1NuSGJ4dGRGUnlXTnc3THNhd0FCS3lJ?=
 =?utf-8?B?SksxTm1KNHh2d3NscmhxRHBlNWl1dlBjTk1PSE9mMENpT0hhckw1STRRZjYy?=
 =?utf-8?B?WVR3c25VNS9LaFZhRVlCbmFrT2NVYjVWVWMxdzNwVHJXYUtwWE15S29qRHVz?=
 =?utf-8?B?d055OEJsK2liUldDL25mbDl4aHNGNmhzU2M4TW1xSFhKcjN0TGY0d29nbzFr?=
 =?utf-8?B?d3E3WXlhemZEZ1poeVpReU5mQXJkdWd0aXgrclUxbDhzaFNSTHVkdjU4bmdQ?=
 =?utf-8?B?MFVZZW5jcHhwekNEYlB3dWhzdXNWTHJlbXdiSFlTSndRZHVWMmNsRVVZUDhR?=
 =?utf-8?B?WmtjL1NRcGxrNHNrRzBiWkMwSjVkeXlyZFUyR2Y5eXBOR01nS2lOdUtUcnFW?=
 =?utf-8?B?RUViTUhETXc0OVI1WVFZODB6MXFWOWVBRmk1MEwrUVhwVGp4NDRaaENFVWVN?=
 =?utf-8?B?d1c0TDBjM1Z6c3loejV6RDNCZENpWGg5TCtNUmpWbUIvTStnaEI5RmxQNHRO?=
 =?utf-8?B?THpWa1A4K3JkeDdLU3RvUkV4aUN5ZHNteGttRlhhMCtFVlczbW1JMUVnMVBH?=
 =?utf-8?B?U2gwS21hTkdiNXpYVW54a2hKQ2dLbUZScmJ3UUkvZWlSdFFDdk4xdElVZFA5?=
 =?utf-8?B?OW43dnZJUWhtYi95NEFqVmh1NElDYlBEbVl2eTRJQUtnMDF2VXR1NUVWVzFo?=
 =?utf-8?B?b2NFZ1JCSmFSTmZUUVQ2UmVSUThBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6AC4F5F77CDA64087B3D61DCE0477D0@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 211e076d-180f-44d8-91bb-08d9dd524712
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2022 02:52:49.8310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sw47eFRPLh0NG1oVGIguIwCAD85yie5DuY/pDZmBQherqHLGHzD9pYBGjycmTsINAb3waPPsPqus0gEsMaktPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3408
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10234
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201220012
X-Proofpoint-ORIG-GUID: KU8YEGwbFbfRNleEEnD5WJOpvr-ZSrnG
X-Proofpoint-GUID: KU8YEGwbFbfRNleEEnD5WJOpvr-ZSrnG
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 John Johnson <john.g.johnson@oracle.com>, qemu-devel <qemu-devel@nongnu.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSmFuIDIxLCAyMDIyLCBhdCA3OjMzIFBNLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8ZjRidWdAYW1zYXQub3JnPiB3cm90ZToNCj4gDQo+IEN1cnJlbnRseSAicWVtdS9lcnJvci1y
ZXBvcnQuaCIgaXMgaW1wbGljaXRseSBpbmNsdWRlZCwgaG93ZXZlcg0KPiBpZiBoZWFkZXJzIGlu
IGluY2x1ZGUvIGdldCByZWZhY3RvcmVkLCB3ZSBnZXQ6DQo+IA0KPiAgaHcvcmVtb3RlL3Byb3h5
LW1lbW9yeS1saXN0ZW5lci5jOiBJbiBmdW5jdGlvbiDigJhwcm94eV9tZW1vcnlfbGlzdGVuZXJf
Y29tbWl04oCZOg0KPiAgaHcvcmVtb3RlL3Byb3h5LW1lbW9yeS1saXN0ZW5lci5jOjE4Mzo5OiBl
cnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYZXJyb3JfcmVwb3J04oCZ
OyBkaWQgeW91IG1lYW4g4oCYZXJyb3JfcmVwb3J0X2VycuKAmT8gWy1XZXJyb3I9aW1wbGljaXQt
ZnVuY3Rpb24tZGVjbGFyYXRpb25dDQo+ICAgIDE4MyB8ICAgICAgICAgZXJyb3JfcmVwb3J0KCJO
dW1iZXIgb2YgZmRzIGlzIG1vcmUgdGhhbiAlZCIsIFJFTU9URV9NQVhfRkRTKTsNCj4gICAgICAg
IHwgICAgICAgICBefn5+fn5+fn5+fn4NCj4gICAgICAgIHwgICAgICAgICBlcnJvcl9yZXBvcnRf
ZXJyDQo+IA0KPiBBZGQgdGhlIG1pc3NpbmcgInFlbXUvZXJyb3ItcmVwb3J0LmgiIGhlYWRlciB0
byBhdm9pZCB0aGF0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVk
w6kgPGY0YnVnQGFtc2F0Lm9yZz4NCg0KUmV2aWV3ZWQtYnk6IEphZ2FubmF0aGFuIFJhbWFuIDxq
YWcucmFtYW5Ab3JhY2xlLmNvbT4NCg0KPiAtLS0NCj4gaHcvcmVtb3RlL3Byb3h5LW1lbW9yeS1s
aXN0ZW5lci5jIHwgMSArDQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2h3L3JlbW90ZS9wcm94eS1tZW1vcnktbGlzdGVuZXIuYyBiL2h3L3JlbW90
ZS9wcm94eS1tZW1vcnktbGlzdGVuZXIuYw0KPiBpbmRleCA4ODJjOWI0ODU0Li4wZTg5M2YzMTg5
IDEwMDY0NA0KPiAtLS0gYS9ody9yZW1vdGUvcHJveHktbWVtb3J5LWxpc3RlbmVyLmMNCj4gKysr
IGIvaHcvcmVtb3RlL3Byb3h5LW1lbW9yeS1saXN0ZW5lci5jDQo+IEBAIC0xNiw2ICsxNiw3IEBA
DQo+ICNpbmNsdWRlICJleGVjL2NwdS1jb21tb24uaCINCj4gI2luY2x1ZGUgImV4ZWMvcmFtX2Fk
ZHIuaCINCj4gI2luY2x1ZGUgInFhcGkvZXJyb3IuaCINCj4gKyNpbmNsdWRlICJxZW11L2Vycm9y
LXJlcG9ydC5oIg0KPiAjaW5jbHVkZSAiaHcvcmVtb3RlL21wcWVtdS1saW5rLmgiDQo+ICNpbmNs
dWRlICJody9yZW1vdGUvcHJveHktbWVtb3J5LWxpc3RlbmVyLmgiDQo+IA0KPiAtLSANCj4gMi4z
NC4xDQo+IA0KDQo=

