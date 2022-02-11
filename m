Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 975ED4B1A34
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 01:13:12 +0100 (CET)
Received: from localhost ([::1]:34528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIJYl-0006LY-76
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 19:13:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nIJWZ-0005ZF-9X
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 19:10:55 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:19226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nIJWW-0006Hs-5m
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 19:10:54 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21ALJB2K027666; 
 Fri, 11 Feb 2022 00:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=yIYGmKNCGD74Pk9pTL7AbslIPC19z0qgvLgltKt8L04=;
 b=wjZgivCsLyg5W+iB8W+y55rPpGOpRWJVCPD7jfZoc0HfObGZ0YTbbyko1605cmggoSAS
 tYqNcyOE8pRllMfyjRwDArgRd/Z5pYe+5VqliHZN8+aA2KgP/XFo8vFZGfCNb2NIF4IG
 2Y7Dtrs3CMbhRTdYiSWUy817Z4iAuBVN3k11xzeFXlo3SQQzJSFmf8mNLgcqFckualYo
 ng4j5yQ8aeUBtvvC84tcTv6DMWEgyEOd5Z4HTBpj9W4REC6XOdYTjNjsSWfs2B5Nxk4L
 SnA2RRph5BUQKCPvzlcsCnkrn/6jiUoUwkSoFl53qxHq069rQ4dAGybkcsCsTWtFVZ4W uQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e3hdt1qr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Feb 2022 00:10:39 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21ANpfGg065325;
 Fri, 11 Feb 2022 00:10:38 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by aserp3020.oracle.com with ESMTP id 3e1h2b99fh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Feb 2022 00:10:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DwcmMCU6cqQFYShLNcbcsGVQYfmlqWxDdqH7Iz8PFpmsYnKJb/lOsRm8pkXRxDv+01faoZcULb9LQXgDi1BPow8xosgvTmcE77m+PoflSIrqNjR17nS8pHOQQMAoPw1l69gIepYnbjc+QBtQa7f5TFG0CPCal1W3sLNib50T3xmFUAeWXCBQXLKt5py7AFgckNIc3EbNFdZkarbBb2xcwcFanTZYElXVGMADiWR4sHI5f6qh7MnW1T2Lced+q5CLXw6xeXSKg4myheg63qSzaK7p4OnefcxYukH2pEAT0v1bQ1KY4d1gCan6UGguh0pPerupTg7SjsEdcwnIvel8ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIYGmKNCGD74Pk9pTL7AbslIPC19z0qgvLgltKt8L04=;
 b=nLHNCUXkM5XTlVs0JTs9QgDrZz9QyUzX4ZaQ322nZLY+42VOoTw++DDgPvfkRB4OAqPyJxSx/tD3876p4CD5fqj43d2lvHQ/W+lRs1SY3j/sacgGQJDKH/2dlGhtdLShrEIr4Js8LVCHjgfCwQbDdpKxA6R9lhTSuDgk1RQfEbLIg5kH5gplOI/oGiRuYO5b2unpcKiUruukCWBo6G1XrCpwRVggQexMJsWYQecIPd3kMxu9WO7a6Kftx2RJUwkfHNjxMVH7ZA0pjzIt1JG6Wc/flSl6Db7/UdnYMoLDtU16aLWdJ1Fs4QUrCmX7Ed3JPu/74NIirnkqC0DMSp9JiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIYGmKNCGD74Pk9pTL7AbslIPC19z0qgvLgltKt8L04=;
 b=tJyUoBP93LpvLWodjV59LZAbyfLOCPmx3YMJt6NGk2J8W8IFAw0HaodyvzoTnU5t+UXhb4Hs/xKOoju6IX9d5yo52+IBsvZbpF50kuc4g8Rmt20q1OYa5MBrfreKVOwI7/WcU5XMhbIMb5oEXtSvftACMtaOOL97G1EwlYFvS8Q=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB1919.namprd10.prod.outlook.com (2603:10b6:300:10a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Fri, 11 Feb
 2022 00:10:36 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::58f2:8ac5:3d12:5afe]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::58f2:8ac5:3d12:5afe%5]) with mapi id 15.20.4951.018; Fri, 11 Feb 2022
 00:10:35 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Thread-Topic: [PATCH v5 03/18] pci: isolated address space for PCI bus
Thread-Index: AQHYDX1z2h/nyOzV1UqlYAx4HMB2U6xrCcSAgAD94YCACBLhAIAAtVOAgABH8QCAAK30AIAAEm2AgAC9D4CAANfhgIAAx9cAgAUr2oCAASDzgIAAYuuAgABkcYCAABdUAIAAKLiAgABI+gCADDeJgIAAhFKAgADwjACAAA9BAIAADs6A
Date: Fri, 11 Feb 2022 00:10:35 +0000
Message-ID: <7BAE753C-1E59-4BA4-860C-614FA5F3A408@oracle.com>
References: <20220127142253.21ab0025.alex.williamson@redhat.com>
 <YfO00O4sT2UgaW31@stefanha-x1.localdomain>
 <20220131091623.6739464e.alex.williamson@redhat.com>
 <Yfj9u26F6/RdlhoB@stefanha-x1.localdomain>
 <20220201082437.7dd940eb.alex.williamson@redhat.com>
 <9BD98DD7-CC28-49E1-8150-BDECF0324FFA@oracle.com>
 <20220201154736.576e2a7e.alex.williamson@redhat.com>
 <BA348811-5C6D-4F9F-AC3C-824AC1681F1D@oracle.com>
 <20220201223432.4f58518f.alex.williamson@redhat.com>
 <69BE660C-C527-459B-A392-F5546A0BEB5B@oracle.com>
 <20220210022543-mutt-send-email-mst@kernel.org>
 <9E989878-326F-4E72-85DD-34D1CB72F0F8@oracle.com>
 <20220210161734.18f36e8b.alex.williamson@redhat.com>
In-Reply-To: <20220210161734.18f36e8b.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 847c91e1-f300-425e-e04a-08d9ecf2ed21
x-ms-traffictypediagnostic: MWHPR10MB1919:EE_
x-microsoft-antispam-prvs: <MWHPR10MB1919DB60D3AA6A3A546E8A3E90309@MWHPR10MB1919.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6calRIyTsW+n91Qn6rWc/qjIBZQ60Ew3dHUHfS8JAf6oCV06dpmRXAWC8Vp82p3I02HNS1206spvdTLnDS7WH3eTE2gilHnbLmOf3U8QfDq14oQe9QupR0bhKpgR80COSmYQFVe037S9OdLAYeJG8ipgmPWnKJu/AX//Rk7P/1juh/RBENMyie7LLBnqD7CEzvOTc6lqCnEL48heAkAJY39x3+wTm5AISgahdMjwZbwIiZQIEfVWEHzOft/5oVAnRvhPwNjRb+kMo0eIgnWldyC3lI2GlByQIZxqFTmQfW3Hl4X+rF9Uzz/+/YGq6AmVW3UpX431wi0L4PFvv5KwMUZmVv0SdtJh9dw+tDnnFosIVmvNRHTesPuXK14z+vqlnTnawDr2misFl9QITijeVe8r5QHIcMOSFAVFLNi0fU2RaRCCf56jIHOwgbcsKoZ30l2ueVe8GUyDsX4ekkUwd9KmxAfHtOAdYkOYkelZXfWZ/yvBl0gXtUrpNHuooaRPAKs4B7MWtiyCx/nYfoevj5WCJTaTL68IaP75OxNiFo6hiA3YAW8m5dcaAilFBpU0CWLDETYfYf/C6EwyqCw5yX+oG9YceL92iCkPfcWik4Z+uAHyw8o+lSZQp4iUptdCTp46gn28o6ej9j3uIbKVuAUjlyuRb9/a24h36YMVsH+lRRRBg3KzTYlsZsk3AhMA8ak7tkVw5l18RbtnMXB6qLGFPzRvOD65U7eX6QIw5EJbR3h/y6Y1OTXlKpsgdaVe
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(54906003)(83380400001)(508600001)(91956017)(6486002)(6506007)(6512007)(53546011)(71200400001)(33656002)(6916009)(186003)(66556008)(66446008)(316002)(4326008)(38070700005)(76116006)(122000001)(38100700002)(86362001)(7416002)(66946007)(5660300002)(8676002)(8936002)(2616005)(64756008)(2906002)(36756003)(44832011)(66476007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0l4Q0dORUc5WFdxVVRiRURjNWlhMENzNHVkMWJqRTNsWk5yUlROWDF1UEZT?=
 =?utf-8?B?Z3BLVThSUUhESXhaTHk4L3dUcXdYYjc2Y09jSHNMS2pYclhoRmxPN3VrNjIv?=
 =?utf-8?B?ZXFRTWt6OW1pd29tZDN2elBKS1hxTk9KMWVtRVRDL0RIZm5vT3d0K2F3L0ZS?=
 =?utf-8?B?ZEE4TmRHaW8yelBpMm9Mb0tDRno2b0E0WDVGVVZrNmtCV1Jwc1Q1dkFaSlZO?=
 =?utf-8?B?YmdjejV2NWRDNjBjazZTU3d5OWsxZ1ZVVjV3T2UxL2hLOVAreWJMQlBPUXlW?=
 =?utf-8?B?QkJKVEpOQXFmSkp4MmlNVDVXa2hZSmI4OTlRcTQ0c3RtVWdpbFNGajQzYnd1?=
 =?utf-8?B?cXNTWGZSWXhUd3dTdlloTTJiMVZoTmNOTC9GM3lpRVlVZWlIZTR2T3kzK1pC?=
 =?utf-8?B?SDMwajlMTjl4d1VGMFBXbjNDNWErNHYvZVR4bGhiaHlQdzFPVy9vOTNLcFVp?=
 =?utf-8?B?dk9raXpHdFFNcm8vOW1hZzBXOVYvZVRLRzN4V24yZ2hwOUw0WFlwVDZCTzFG?=
 =?utf-8?B?UjdYaWkxckdRQTVHMmR6WXRQc3oxVVdBRUtBVHUzT0xQdHpqM292Y2t4OCs1?=
 =?utf-8?B?UXVrd2NCWnYzbllNcnRDTE5LVGZ2UHlodmkxKzE4N20vV0diZjAzdXI1T3NU?=
 =?utf-8?B?TFZodk93YXFiSUVQWUd6NmFoV1lnTzJGc0pVTVh4Y2xXUjcvRmt2cDN4RUtO?=
 =?utf-8?B?aThRNHkvdllKdFBDcm1Tay9nZTdTRzZQM0tpaDRBcDcrVXNoNnExaTI2UFp6?=
 =?utf-8?B?Ykcyd0NyRHZKdzRVMGtkTFg4MU5pZCs3RXZ4RllOYTcxK3NqN2VlSUVEeDF2?=
 =?utf-8?B?ejg5OU03SHVVRUE3c3V5THIrNDdGOUJ5bTVIcjFmZTRjbkU5SzAxbTZiU2VF?=
 =?utf-8?B?MVV6YjFZTWlNV2RsSHpWd1YvWmRVMTBXWTMvbnZ1dGVPQnVRcjJhTEdKMGlS?=
 =?utf-8?B?TU02S0RnSnBaZjNIVHVOaWZncnovbG1hSSs5VzZONnlvMjJMVVhqZEFvMEpw?=
 =?utf-8?B?NS9iSkwyNWRRWUlWR3hkRUEyQmRoS3NGcXU5NEgxYitSVzNaWFA4RWVoYVFY?=
 =?utf-8?B?NFROUUtJZHRkVnYwSTNsUVlIRE5ndFFqOTkzUTh1cXhKR1RFNUExcWhtL0JI?=
 =?utf-8?B?cUhkMU9MVE1ZUlcrTnpwN3dJTCs1c2hlSUVHMHBWY3EvMi9XaEZZakhWbVNi?=
 =?utf-8?B?K2hkbVo2VjBYelBoZ0pSNDdWakVsMXhjeE5xaDZseExGVTQvSUY0NmdMODdh?=
 =?utf-8?B?U1VxczlqYjJjcDhpdXpCcXRONHkyaVRrYzlXUFhTMWtOUDl0bm5JVHhJN1hU?=
 =?utf-8?B?ZVNXRzNsQ0cxK0UzZGNxa2c2ZWxVcmlnY2gwRGtsN2VrakI0QkRrazNieDhQ?=
 =?utf-8?B?M21LUVlhaGtYVG1DS2t4ZFMrN05jT1BIREREZ2hpZndTTWJjNU5haFBzTEJR?=
 =?utf-8?B?Vk9CbjJ6b1V3Q1NPaHdvKy93NDM4ZW94WWtRQzBRcUZjaHppbHpnS01pUVJB?=
 =?utf-8?B?RE00b2hFd1ppMGtabVE4SENEc3Vac0tFVlZvaldVK2dwVUNFSE5LYmhVYVdz?=
 =?utf-8?B?TENlcFpNUEZobmVjekNrOTVtb0xyMVgvR0VCV09UcHVHUGtEaVZIZll1OVVu?=
 =?utf-8?B?cy85NG5xVm1xOVlDVnZMOWIyYkM2OVRiL2tnZVNzRmJydTRLbEtybTFBN2Jq?=
 =?utf-8?B?cVBmcmRVS2ZUQ0REWGVOUDIrdUdzaGdEWWhNSTd1ci80WU01UmhlYlFFZ09a?=
 =?utf-8?B?Z2J0RVlHSkQvN0FiUDQ1UmFIN0hOcFpjdXhrajdMZFRObUgvajNjRVg4Yjl5?=
 =?utf-8?B?YTNHei9meFI3aG9FK1h6dnJ3clVrbVFLVjRtOUFqZzFLd1Vzc2dlWmd4VTZw?=
 =?utf-8?B?QnBIdzdNQ0hlMituYjNTQXkrSDQ4VGJ5bWplQzlRaHlneUdVVVFwcERrdHNH?=
 =?utf-8?B?RXh6MXhYSzZwRitnYmFDQ2x3bzQzR0pNMWErdVlNRENzZE5DOHNKeDgrNk5x?=
 =?utf-8?B?djd2NFpXVkdaSG1adEhmVXpPLzVlVlhHOVJzcGVsSWpMa0pSQzNFclZ6cmZp?=
 =?utf-8?B?YUxzQ05obElaOUlwWWlpaE1uYnJYWTNnQzJ6NmlnZCtwdnh4K1JOUlJVUkpx?=
 =?utf-8?B?RkgyUXRBenR5dTVJSU1ZTldxazR3Z25tZzU2RHdhZGhzRENMMXA0WmhOTjU1?=
 =?utf-8?B?dWFjeGh5RE54d1RDM0FYSklRSzN3YVp5ajJQUEFITGF1WnlEZDhuVUJvOWNP?=
 =?utf-8?B?Yy8rWWFxZnVMbmI3UzhiZk8wczR3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8EFE547D5E42BF40A32DE7C41AE2257A@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 847c91e1-f300-425e-e04a-08d9ecf2ed21
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 00:10:35.3203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oYUB6RA1h/YrOBW4t6jX3Y3cjFR1MlZeLg6WMAA6H1PbdJ2QR3u40UyLCh9FEuI4cwnn9V/nQhWKYBxoPrYbXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1919
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10254
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202100123
X-Proofpoint-GUID: TDR1wzGTy3_Ji5QCsFkE8QpgDpMNPf6E
X-Proofpoint-ORIG-GUID: TDR1wzGTy3_Ji5QCsFkE8QpgDpMNPf6E
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
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Eric Blake <eblake@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDEwLCAyMDIyLCBhdCA2OjE3IFBNLCBBbGV4IFdpbGxpYW1zb24gPGFsZXgu
d2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIFRodSwgMTAgRmViIDIwMjIg
MjI6MjM6MDEgKzAwMDANCj4gSmFnIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNvbT4gd3JvdGU6
DQo+IA0KPj4+IE9uIEZlYiAxMCwgMjAyMiwgYXQgMzowMiBBTSwgTWljaGFlbCBTLiBUc2lya2lu
IDxtc3RAcmVkaGF0LmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gVGh1LCBGZWIgMTAsIDIwMjIg
YXQgMTI6MDg6MjdBTSArMDAwMCwgSmFnIFJhbWFuIHdyb3RlOiAgDQo+Pj4+IA0KPj4+PiBUaGFu
a3MgZm9yIHRoZSBleHBsYW5hdGlvbiwgQWxleC4gVGhhbmtzIHRvIGV2ZXJ5b25lIGVsc2UgaW4g
dGhlIHRocmVhZCB3aG8NCj4+Pj4gaGVscGVkIHRvIGNsYXJpZnkgdGhpcyBwcm9ibGVtLg0KPj4+
PiANCj4+Pj4gV2UgaGF2ZSBpbXBsZW1lbnRlZCB0aGUgbWVtb3J5IGlzb2xhdGlvbiBiYXNlZCBv
biB0aGUgZGlzY3Vzc2lvbiBpbiB0aGUNCj4+Pj4gdGhyZWFkLiBXZSB3aWxsIHNlbmQgdGhlIHBh
dGNoZXMgb3V0IHNob3J0bHkuDQo+Pj4+IA0KPj4+PiBEZXZpY2VzIHN1Y2ggYXMg4oCcbmFtZSIg
YW5kIOKAnGUxMDAw4oCdIHdvcmtlZCBmaW5lLiBCdXQgSeKAmWQgbGlrZSB0byBub3RlIHRoYXQN
Cj4+Pj4gdGhlIExTSSBkZXZpY2UgKFRZUEVfTFNJNTNDODk1QSkgaGFkIHNvbWUgcHJvYmxlbXMg
LSBpdCBkb2VzbuKAmXQgc2VlbQ0KPj4+PiB0byBiZSBJT01NVSBhd2FyZS4gSW4gTFNJ4oCZcyBj
YXNlLCB0aGUga2VybmVsIGRyaXZlciBpcyBhc2tpbmcgdGhlIGRldmljZSB0bw0KPj4+PiByZWFk
IGluc3RydWN0aW9ucyBmcm9tIHRoZSBDUFUgVkEgKGxzaV9leGVjdXRlX3NjcmlwdCgpIC0+IHJl
YWRfZHdvcmQoKSksDQo+Pj4+IHdoaWNoIGlzIGZvcmJpZGRlbiB3aGVuIElPTU1VIGlzIGVuYWJs
ZWQuIFNwZWNpZmljYWxseSwgdGhlIGRyaXZlciBpcyBhc2tpbmcNCj4+Pj4gdGhlIGRldmljZSB0
byBhY2Nlc3Mgb3RoZXIgQkFSIHJlZ2lvbnMgYnkgdXNpbmcgdGhlIEJBUiBhZGRyZXNzIHByb2dy
YW1tZWQNCj4+Pj4gaW4gdGhlIFBDSSBjb25maWcgc3BhY2UuIFRoaXMgaGFwcGVucyBldmVuIHdp
dGhvdXQgdmZpby11c2VyIHBhdGNoZXMuIEZvciBleGFtcGxlLA0KPj4+PiB3ZSBjb3VsZCBlbmFi
bGUgSU9NTVUgdXNpbmcg4oCcLWRldmljZSBpbnRlbC1pb21tdeKAnSBRRU1VIG9wdGlvbiBhbmQg
YWxzbw0KPj4+PiBhZGRpbmcgdGhlIGZvbGxvd2luZyB0byB0aGUga2VybmVsIGNvbW1hbmQtbGlu
ZTog4oCcaW50ZWxfaW9tbXU9b24gaW9tbXU9bm9wdOKAnS4NCj4+Pj4gSW4gdGhpcyBjYXNlLCB3
ZSBjb3VsZCBzZWUgYW4gSU9NTVUgZmF1bHQuICANCj4+PiANCj4+PiBTbywgZGV2aWNlIGFjY2Vz
c2luZyBpdHMgb3duIEJBUiBpcyBkaWZmZXJlbnQuIEJhc2ljYWxseSwgdGhlc2UNCj4+PiB0cmFu
c2FjdGlvbnMgbmV2ZXIgZ28gb24gdGhlIGJ1cyBhdCBhbGwsIG5ldmVyIG1pbmQgZ2V0IHRvIHRo
ZSBJT01NVS4gIA0KPj4gDQo+PiBIaSBNaWNoYWVsLA0KPj4gDQo+PiBJbiBMU0kgY2FzZSwgSSBk
aWQgbm90aWNlIHRoYXQgaXQgd2VudCB0byB0aGUgSU9NTVUuIFRoZSBkZXZpY2UgaXMgcmVhZGlu
ZyB0aGUgQkFSDQo+PiBhZGRyZXNzIGFzIGlmIGl0IHdhcyBhIERNQSBhZGRyZXNzLg0KPj4gDQo+
Pj4gSSB0aGluayBpdCdzIGp1c3QgdXNlZCBhcyBhIGhhbmRsZSB0byBhZGRyZXNzIGludGVybmFs
IGRldmljZSBtZW1vcnkuDQo+Pj4gVGhpcyBraW5kIG9mIHRyaWNrIGlzIG5vdCB1bml2ZXJzYWws
IGJ1dCBub3QgdGVycmlibHkgdW51c3VhbC4NCj4+PiANCj4+PiANCj4+Pj4gVW5mb3J0dW5hdGVs
eSwgd2Ugc3RhcnRlZCBvZmYgb3VyIHByb2plY3Qgd2l0aCB0aGUgTFNJIGRldmljZS4gU28gdGhh
dCBsZWFkIHRvIGFsbCB0aGUNCj4+Pj4gY29uZnVzaW9uIGFib3V0IHdoYXQgaXMgZXhwZWN0ZWQg
YXQgdGhlIHNlcnZlciBlbmQgaW4tdGVybXMgb2YNCj4+Pj4gdmVjdG9yaW5nL2FkZHJlc3MtdHJh
bnNsYXRpb24uIEl0IGdhdmUgYW4gaW1wcmVzc2lvbiBhcyBpZiB0aGUgcmVxdWVzdCB3YXMgc3Rp
bGwgb24NCj4+Pj4gdGhlIENQVSBzaWRlIG9mIHRoZSBQQ0kgcm9vdCBjb21wbGV4LCBidXQgdGhl
IGFjdHVhbCBwcm9ibGVtIHdhcyB3aXRoIHRoZQ0KPj4+PiBkZXZpY2UgZHJpdmVyIGl0c2VsZi4N
Cj4+Pj4gDQo+Pj4+IEnigJltIHdvbmRlcmluZyBob3cgdG8gZGVhbCB3aXRoIHRoaXMgcHJvYmxl
bS4gV291bGQgaXQgYmUgT0sgaWYgd2UgbWFwcGVkIHRoZQ0KPj4+PiBkZXZpY2XigJlzIEJBUiBp
bnRvIHRoZSBJT1ZBLCBhdCB0aGUgc2FtZSBDUFUgVkEgcHJvZ3JhbW1lZCBpbiB0aGUgQkFSIHJl
Z2lzdGVycz8NCj4+Pj4gVGhpcyB3b3VsZCBoZWxwIGRldmljZXMgc3VjaCBhcyBMU0kgdG8gY2ly
Y3VtdmVudCB0aGlzIHByb2JsZW0uIE9uZSBwcm9ibGVtDQo+Pj4+IHdpdGggdGhpcyBhcHByb2Fj
aCBpcyB0aGF0IGl0IGhhcyB0aGUgcG90ZW50aWFsIHRvIGNvbGxpZGUgd2l0aCBhbm90aGVyIGxl
Z2l0aW1hdGUNCj4+Pj4gSU9WQSBhZGRyZXNzLiBLaW5kbHkgc2hhcmUgeW91ciB0aG91Z2h0IG9u
IHRoaXMuDQo+Pj4+IA0KPj4+PiBUaGFuayB5b3UhICANCj4+PiANCj4+PiBJIGFtIG5vdCAxMDAl
IHN1cmUgd2hhdCBkbyB5b3UgcGxhbiB0byBkbyBidXQgaXQgc291bmRzIGZpbmUgc2luY2UgZXZl
bg0KPj4+IGlmIGl0IGNvbGxpZGVzLCB3aXRoIHRyYWRpdGlvbmFsIFBDSSBkZXZpY2UgbXVzdCBu
ZXZlciBpbml0aWF0ZSBjeWNsZXMgIA0KPj4gDQo+PiBPSyBzb3VuZHMgZ29vZCwgSeKAmWxsIGNy
ZWF0ZSBhIG1hcHBpbmcgb2YgdGhlIGRldmljZSBCQVJzIGluIHRoZSBJT1ZBLg0KPiANCj4gSSBk
b24ndCB0aGluayB0aGlzIGlzIGNvcnJlY3QuICBMb29rIGZvciBpbnN0YW5jZSBhdCBBQ1BJIF9U
UkEgc3VwcG9ydA0KPiB3aGVyZSBhIHN5c3RlbSBjYW4gc3BlY2lmeSBhIHRyYW5zbGF0aW9uIG9m
ZnNldCBzdWNoIHRoYXQsIGZvciBleGFtcGxlLA0KPiBhIENQVSBhY2Nlc3MgdG8gYSBkZXZpY2Ug
aXMgcmVxdWlyZWQgdG8gYWRkIHRoZSBwcm92aWRlZCBvZmZzZXQgdG8gdGhlDQo+IGJ1cyBhZGRy
ZXNzIG9mIHRoZSBkZXZpY2UuICBBIHN5c3RlbSB1c2luZyB0aGlzIGNvdWxkIGhhdmUgbXVsdGlw
bGUNCj4gcm9vdCBicmlkZ2VzLCB3aGVyZSBlYWNoIGlzIGdpdmVuIHRoZSBzYW1lLCBvdmVybGFw
cGluZyBNTUlPIGFwZXJ0dXJlLg0KPiBGcm9tIHRoZSBwcm9jZXNzb3IgcGVyc3BlY3RpdmUsIGVh
Y2ggTU1JTyByYW5nZSBpcyB1bmlxdWUgYW5kIHBvc3NpYmx5DQo+IG5vbmUgb2YgdGhvc2UgZGV2
aWNlcyBoYXZlIGEgemVybyBfVFJBLCB0aGVyZSBjb3VsZCBiZSBzeXN0ZW0gbWVtb3J5IGF0DQo+
IHRoZSBlcXVpdmFsZW50IGZsYXQgbWVtb3J5IGFkZHJlc3MuDQo+IA0KPiBTbyBpZiB0aGUgdHJh
bnNhY3Rpb24gYWN0dWFsbHkgaGl0cyB0aGlzIGJ1cywgd2hpY2ggSSB0aGluayBpcyB3aGF0DQo+
IG1ha2luZyB1c2Ugb2YgdGhlIGRldmljZSBBZGRyZXNzU3BhY2UgaW1wbGllcywgSSBkb24ndCB0
aGluayBpdCBjYW4NCj4gYXNzdW1lIHRoYXQgaXQncyBzaW1wbHkgcmVmbGVjdGVkIGJhY2sgYXQg
aXRzZWxmLiAgQ29udmVudGlvbmFsIFBDSSBhbmQNCj4gUENJIEV4cHJlc3MgbWF5IGJlIHNvZnR3
YXJlIGNvbXBhdGlibGUsIGJ1dCB0aGVyZSdzIGEgcmVhc29uIHdlIGRvbid0DQo+IHNlZSBJT01N
VXMgdGhhdCBwcm92aWRlIGJvdGggdHJhbnNsYXRpb24gYW5kIGlzb2xhdGlvbiBpbiBjb252ZW50
aW9uYWwNCj4gdG9wb2xvZ2llcy4NCj4gDQo+IElzIHRoaXMgbW9yZSBhIGJ1ZyBpbiB0aGUgTFNJ
IGRldmljZSBlbXVsYXRpb24gbW9kZWw/ICBGb3IgaW5zdGFuY2UgaW4NCj4gdmZpby1wY2ksIGlm
IEkgd2FudCB0byBhY2Nlc3MgYW4gb2Zmc2V0IGludG8gYSBCQVIgZnJvbSB3aXRoaW4gUUVNVSwg
SQ0KPiBkb24ndCBjYXJlIHdoYXQgYWRkcmVzcyBpcyBwcm9ncmFtbWVkIGludG8gdGhhdCBCQVIs
IEkgcGVyZm9ybSBhbg0KPiBhY2Nlc3MgcmVsYXRpdmUgdG8gdGhlIHZmaW8gZmlsZSBkZXNjcmlw
dG9yIHJlZ2lvbiByZXByZXNlbnRpbmcgdGhhdA0KPiBCQVIgc3BhY2UuICBJJ2QgZXhwZWN0IHRo
YXQgYW55IHZpYWJsZSBkZXZpY2UgZW11bGF0aW9uIG1vZGVsIGRvZXMgdGhlDQo+IHNhbWUsIGFu
IGFjY2VzcyB0byBkZXZpY2UgbWVtb3J5IHVzZXMgYW4gb2Zmc2V0IGZyb20gYW4gaW50ZXJuYWwN
Cj4gcmVzb3VyY2UsIGlycmVzcGVjdGl2ZSBvZiB0aGUgQkFSIGFkZHJlc3MuDQo+IA0KPiBJdCB3
b3VsZCBzZWVtIHN0cmFuZ2UgaWYgdGhlIGRyaXZlciBpcyBhY3R1YWxseSBwcm9ncmFtbWluZyB0
aGUgZGV2aWNlDQo+IHRvIERNQSB0byBpdHNlbGYgYW5kIGlmIHRoYXQncyBhY3R1YWxseSBoYXBw
ZW5pbmcsIEknZCB3b25kZXIgaWYgdGhpcw0KDQpJdCBkb2VzIGxvb2sgbGlrZSB0aGUgZHJpdmVy
IGlzIGFjdHVhbGx5IHByb2dyYW1taW5nIHRoZSBkZXZpY2UgdG8gRE1BIHRvIGl0c2VsZi4NCg0K
VGhlIGRyaXZlciBmaXJzdCBwcm9ncmFtcyB0aGUgRFNQIChETUEgU2NyaXB0cyBQb2ludGVyKSBy
ZWdpc3RlciB3aXRoIHRoZSBCQVINCmFkZHJlc3MuIEl0IGRvZXMgc28gYnkgcGVyZm9ybWluZyBh
IHNlcmllcyBvZiBNTUlPIHdyaXRlcyAobHNpX21taW9fd3JpdGUoKSkNCnRvIG9mZnNldHMgMHgy
QyAtIDB4MkYuIEltbWVkaWF0ZWx5IGFmdGVyIHByb2dyYW1taW5nIHRoaXMgcmVnaXN0ZXIsIHRo
ZSBkZXZpY2UNCmZldGNoZXMgc29tZSBpbnN0cnVjdGlvbnMgbG9jYXRlZCBhdCB0aGUgcHJvZ3Jh
bW1lZCBhZGRyZXNzLg0KDQpUaGFuayB5b3UhDQotLQ0KSmFnDQoNCj4gZHJpdmVyIGlzIGFjdHVh
bGx5IGNvbXBhdGlibGUgd2l0aCBhbiBJT01NVSBvbiBiYXJlIG1ldGFsLg0KPiANCj4+PiB3aXRo
aW4gdGhlaXIgb3duIEJBUiByYW5nZSwgYW5kIFBDSWUgaXMgc29mdHdhcmUtY29tcGF0aWJsZSB3
aXRoIFBDSS4gU28NCj4+PiBkZXZpY2VzIHdvbid0IGJlIGFibGUgdG8gYWNjZXNzIHRoaXMgSU9W
QSBldmVuIGlmIGl0IHdhcyBwcm9ncmFtbWVkIGluDQo+Pj4gdGhlIElPTU1VLg0KPj4+IA0KPj4+
IEFzIHdhcyBtZW50aW9uZWQgZWxzZXdoZXJlIG9uIHRoaXMgdGhyZWFkLCBkZXZpY2VzIGFjY2Vz
c2luZyBlYWNoDQo+Pj4gb3RoZXIncyBCQVIgaXMgYSBkaWZmZXJlbnQgbWF0dGVyLg0KPj4+IA0K
Pj4+IEkgZG8gbm90IHJlbWVtYmVyIHdoaWNoIHJ1bGVzIGFwcGx5IHRvIG11bHRpcGxlIGZ1bmN0
aW9ucyBvZiBhDQo+Pj4gbXVsdGktZnVuY3Rpb24gZGV2aWNlIHRob3VnaC4gSSB0aGluayBpbiBh
IHRyYWRpdGlvbmFsIFBDSQ0KPj4+IHRoZXkgd2lsbCBuZXZlciBnbyBvdXQgb24gdGhlIGJ1cywg
YnV0IHdpdGggZS5nLiBTUklPViB0aGV5DQo+Pj4gd291bGQgcHJvYmFibHkgZG8gZ28gb3V0PyBB
bGV4LCBhbnkgaWRlYT8NCj4gDQo+IFRoaXMgZmFsbHMgdW5kZXIgaW1wbGVtZW50YXRpb24gc3Bl
Y2lmaWMgYmVoYXZpb3IgaW4gdGhlIHNwZWMsIElJUkMuDQo+IFRoaXMgaXMgYWN0dWFsbHkgd2h5
IElPTU1VIGdyb3VwaW5nIHJlcXVpcmVzIEFDUyBzdXBwb3J0IG9uDQo+IG11bHRpLWZ1bmN0aW9u
IGRldmljZXMgdG8gY2xhcmlmeSB0aGUgYmVoYXZpb3Igb2YgcDJwIGJldHdlZW4gZnVuY3Rpb25z
DQo+IGluIHRoZSBzYW1lIHNsb3QuICBUaGFua3MsDQo+IA0KPiBBbGV4DQo+IA0KDQo=

