Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FF046B4EE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 08:58:26 +0100 (CET)
Received: from localhost ([::1]:37500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muVMn-000250-DA
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 02:58:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1muVEe-0005jr-DP
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:50:01 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:23588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1muVEb-0005kM-K7
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:50:00 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B74gT1X019276; 
 Tue, 7 Dec 2021 07:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=aljP4ZCRkV21kJeQc1Iy4hEy1bKEJ12sjpSN3//9pgE=;
 b=rjkW1y+I9XbERsWhDefMykdREoIfABTMPleIKSlXcjwtiEXhmSfFP5jEGMKaGJVmNya4
 ZZdncWJ07m5OrnlEIYALV63jnDBG62h/MRrwRkwbhf6XQTatQpTTAp7/PFxPjaOoNEDk
 EiXJ1e3Sm3F2CjacqZ9LqibpNI6BIZUzGJSWWBUplVOCSgP+qaQgqGiIe4LnlHfp/ZWW
 tIExnQYdWJLJgEr4XmtRjXYUQgtSiZ1m/XGyUp9zaYK3plh5AUnPoOnEfsxjoQbXyhkm
 bnbVJ+9MboSPgpHTKvD6io5+Or9PqfyR1FDGbTzdGuitWk0Bh7oflRoqxHLL2B6IiR4v IQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csbbqmwjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 07:49:56 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B77fDbq179279;
 Tue, 7 Dec 2021 07:49:55 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by aserp3030.oracle.com with ESMTP id 3csc4swyge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 07:49:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AquEwBqucfytFFin6PDWKPv4uL/smQ+bqVZ4d9w+rwJSwWGrLyycQxW02eY3IaNM1TGmGOxEcRjs7fWn9GdpR7AEDbSEe53rqyeULP418rM50xy0oDzn0crfqRVjQxlhwx9GJvg1U5CH1ncI31BXHuEJLX98483SPtd3KjtRg2TOy74dhL3RDvfGQ5o7lhL29hC4xuVTT6e9NJ7UTxxHmMuhEyG28xvSuh9CnR9W7rHHK/d3gaYL/bbZXdBbjDd+zv6gp17rh2jyzL5nrieekDqhtfXIRdhj1jG/aovRjBV9pIWwo3/lTXq8tFsCqyQOY9Sb7trSH4/09/0FhJpwdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aljP4ZCRkV21kJeQc1Iy4hEy1bKEJ12sjpSN3//9pgE=;
 b=hCft8OVVU049e5HUFnhGLRs57BmuITU7vpTvQCLCljttXt2q8tg8ZVbTtL7QTT0dFzaXEqElZBiTMvFV52TXHsivWuwBfCPP/XhAZcTTI9zIsTulLkExmoChHrjl/4wXB1y9UG+cmFlNJE7pdak5Of65IHxXCJvA0LKLrBbd7TsDY2iiz6GkVyDv3AyaBe26rmTvR03DC92sSQEoTYVpcHdIhGoPtmXBy3nQUKM9KMR6Wuei6411wKBdc2LNko33UZUBnT2BnZ7X7od1QOaIfA5UShH0rzI//lsE6koDDBss8u8XRH9dXIfY6Ozucj7ieFbDj0BWleJuupjspjHIHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aljP4ZCRkV21kJeQc1Iy4hEy1bKEJ12sjpSN3//9pgE=;
 b=oUcsb2szxwTF7NbwrSOyzRs+An+XD8hJ3tIbuUOoxj1dfafqI46RAZjy1IlyAqy91wh1PDGQGyzjnL7yjm24oFLDPeBpWDeoF1U3dJQwuQskdqDQg4rdnFv9cYxmkTkzAAdFoSCcgcO10z95Y08IEJ9/ADjjt64Gz/eEd3zIQYU=
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB4225.namprd10.prod.outlook.com (2603:10b6:a03:20f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Tue, 7 Dec
 2021 07:49:54 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::3c06:36a6:bab9:fffd]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::3c06:36a6:bab9:fffd%2]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 07:49:54 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC v3 08/19] vfio-user: define socket receive functions
Thread-Topic: [RFC v3 08/19] vfio-user: define socket receive functions
Thread-Index: AQHX0botfXJSKWIxOUydtKEgBlNLKawLif4AgBtQl4A=
Date: Tue, 7 Dec 2021 07:49:54 +0000
Message-ID: <972D9E97-5372-47CA-818C-97CC48F07204@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
 <bddfd99bea5d80a7bc4bb57290256b530aabb896.1636057885.git.john.g.johnson@oracle.com>
 <20211119154226.0750c3d6.alex.williamson@redhat.com>
In-Reply-To: <20211119154226.0750c3d6.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e784ca14-bda8-48b0-e57d-08d9b9562827
x-ms-traffictypediagnostic: BY5PR10MB4225:EE_
x-microsoft-antispam-prvs: <BY5PR10MB4225D2A01673EF515A07DFEBB66E9@BY5PR10MB4225.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: unvmmRnnsiAgEWE5E+nn9pirdoAdsPyDPYC4tIvgWju0IXOkcWeNNBoyxRygcEGAD01HQw+XJFcYNQlJF9P1zbMw0POZkYkYTu9ZcTS8sGFQ4cQygaSzedr5yY/oZNQVnFC7bK+jVEi3+eHd2beD819ckx+3etbFrO/m7L9nXRhvOoq43eSd6KVQJeRhUdI7ix7OnW1AR4jCS6sy+KrtZYPlbeX43/50tqyIenRFa/JxssTX19wJBTlR14ZUkyodeEPf8SpLwnBgtnMIRfKAOJJCws+DYNE2kHYgKLwIvBwRzNePto/rqQ5gfGHp+UaC/8ewS8l8cN9pDNd2vz12GuWvRorNOirRMtUw/vm/cRix1lrgya1NfdiUoZO+tP5Vre+ePDGftmzjcWTkdk/vrhtbPzkp9I1PXSQLfxpm5B4BH+XyKJPsBC5Fs9MPKoRh77QenKp8bDIIkdOJbCfZjmOcMFvm6Uz6Z6sBiketsveaKOfpCHi8pXDe7Q/AOZkN4g4jbWRjRFgR5fRqhL+Qkzwt7WFJFM8bCuosszstoNcLB2Br0E0oqGaMGpLU/fRHn+tSdZpE943EL4Mz3NpA4ow0M0s6nJ49NCSrFz5IL/EIde/n1EB/IT5rCLRNrQGXi76tHjxQcHTLxEjGf9CfpEE6jmTN5fJNiRtXzEyugdqERfi8cuP/iYcJLmBT+5iwggYM0i3k7d1aSXUYFDpQ+U3sMgO95Clf4fFzb4t7hotsWKhh7sPiHC5eypRUZZOh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(71200400001)(6512007)(8676002)(66556008)(66476007)(64756008)(66946007)(316002)(33656002)(6916009)(66446008)(53546011)(6486002)(186003)(83380400001)(38100700002)(76116006)(5660300002)(2616005)(36756003)(4326008)(8936002)(26005)(122000001)(6506007)(508600001)(2906002)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MU4vdVNHeDQrbkdvdmxxek9HbDZTNWI2R3AxL214clBpdEo0NVptc2R5OUVi?=
 =?utf-8?B?eUZMdzNUaXFFSHVBamQzbGVkbDhmVGRtNURVUlBneG5MOVovYk55NHBGR1BL?=
 =?utf-8?B?eFFXM0RBMFVzSSsxZjNzanpxVUQyRS9mWlRheDhWOGpuOERrelhlN1Rrc3Fy?=
 =?utf-8?B?K3hoVkRnRDFvdVZOWUlSMVowY1crSHNyQWhtUXBCTTNGM2ppeEtOVFlBNU9X?=
 =?utf-8?B?bHdPS3pFbXZwWHFmRDNHdGEwZXRrQlUxNmhVcTlsNndFd241a3Urbkl3ZXpw?=
 =?utf-8?B?eEJ6VHFJRzlKSHhGdFFrUUZRU1dRR2M2T2tVdmxQY1JzRExMSEZUNVQybHp5?=
 =?utf-8?B?ZVN2Yno4bE5PYko2L08rQkVUWFJPaEc0ektPdktwY0YrMzBxRHgvSkpMZE1D?=
 =?utf-8?B?UjFnSjVBT3M0YjBhdUtrYUtOQkJ1SUVia0doQStoeWU2cWNQMWUrd1Z4V0g4?=
 =?utf-8?B?UkQ3T1NjQ2dIUnZ0ZUJTTEYzd00wZE5NdEFOclFZdEFYZG5vbkI0V3dTa0Nn?=
 =?utf-8?B?V0VjOFFSenNXZ3M0UlUzbGlsazJhaW5xd0Niam8yd1dXb1gvZ1JyWHY0YjV5?=
 =?utf-8?B?aVZPZjlLUXBtQ0Y2RWliajVYaDk0ZEkvRVlCc2lZSWoxeThDVENhUEQ2cUVY?=
 =?utf-8?B?U3JKeGtkb3QwN0JBUnRKbk5JSVptYzN0ZTBrZWRzOTI2RW9jaW1YRFI4aith?=
 =?utf-8?B?dzNEZFJWYXpBVGtDTlVieFVsQjg3RmRaSzhQWVZsL0krVXJQVmxweUQ1ZmdS?=
 =?utf-8?B?cW9lY0lJSVFJSTlCRzVMOTNZTnFEenhNV2YxWTlISi94NnlDQTNUK0syUXdw?=
 =?utf-8?B?djUxVEhvUW81c2JmdmptT05zelNNVUNmaytUZHJoZnhublo2VG1qQ1Z3VThx?=
 =?utf-8?B?dzVqNDdvTlBJZWlQc3lwYlVWRXhaTHZKV1JZcFdRMjI4Wmtqb3l1OG9sWjR2?=
 =?utf-8?B?K3VvQk5wVnBjUllTU0RtcjZkSCt2TVhVR3RpVjVXcGtoQ1ZqVDJKM1NXK3Fx?=
 =?utf-8?B?amVWVmRvZ1pEY0pHYnpkOXg4QlVHSjJVckg3WDdwMi93ZnhkTUdaeDVZUW9E?=
 =?utf-8?B?M3BoclNYNk45NE5lQi9PMmFSUG1VeHRIRTN1eDlBOC90Z1NZb28rOFhaMXlm?=
 =?utf-8?B?bWgvbGg5Znk4RnlNRFhnWm9laER5U3VoeVY4b2pQcWg5M3BnV0tEaEIwb214?=
 =?utf-8?B?MWN3WkhoL2oxYmFqQ1VTM1pTalUreWhVQ1Z3S3U2a05UWmVhUHRLTUFUODFh?=
 =?utf-8?B?ZE4ySFc5RUpYSHNtbEdyQUU1em1ZbkJ0VEV1R0ZVMHJ6TTgwVzFDTDVLdUZL?=
 =?utf-8?B?aWFxS1VpY1ZJOEYrbWtlakh5Z3lIQ1F4RmRlUVpxenNiNzFBYVluQk0zQjgw?=
 =?utf-8?B?MnVWTmZtRzAvN2pSWGdkN284U2g5bXEvTGk4SU9KeWlybWZSQnRpZGNQcjJ5?=
 =?utf-8?B?b2pxTk9HeTNjZzE4Tkd2ampsZnRZZW1aWkpSMTR6eEp4SHpEbGV1VVc4bTAz?=
 =?utf-8?B?eUhOSS85YmhtYnZvNG55b2pnQytYL0JJalh6RTdTRWZOejlSb2lmZjJwZDFH?=
 =?utf-8?B?cnd1U1g1Y2lnbUhMTnhINHc5RlpDMUZPL2RtWk1kNEtrWW5BRlhJclphd2Js?=
 =?utf-8?B?VVNvb2VjT21OWmg4Ykd5Snhnb01YTDlaZjlxSHdESXFjcFJKU2h2TTM0QVI0?=
 =?utf-8?B?SEQ4OXRlT2h5NTg5ejl4eGRMOUlrQzhybzZ5blFlS0JobXRrZWpRbVcrZ2kr?=
 =?utf-8?B?SWNGTHk0REg1ODM5WVI4dXJsalBPWjg0cEVTVXZ6Q3hjL3dtdHB4ejhXUGpR?=
 =?utf-8?B?UVM2a0JiVlpxNTg3eTJjZ1pmSlcwU3pKUDlxaHc5K2o2ZHhuWjRyend3dGdJ?=
 =?utf-8?B?WFNNbTlMNUFndHo0ekFGTHJ3YThvMlEzY0JoayswYmNLL0xvdWk0Y1ZreXlT?=
 =?utf-8?B?MlpDMXozekFwbHpJWUlvblZOR1B3T2U2QUdGY1lZNlBRblBCRGJXMjZzRGFy?=
 =?utf-8?B?TkZhcGpuazA4SlIrOVloMm1jZ1pzRXpmdFVBNVJtajJrdTZJTmVwWmJmd204?=
 =?utf-8?B?TGRMeUtZNEgyTkJUa1pjOFJFTC85azVzTVl4RllxZm9xNmxNMU9jSUFEZzlZ?=
 =?utf-8?B?dTRWekNlWmMzajZPWW9zc1hneEQvN1RiRTJqTEhWRlFockRWZ0RhaElhQm9a?=
 =?utf-8?B?VEZ6dDJTV3U3bTl6WmxHRG9WTHNVVEZNQVNRVVIwUFlZNW1SUnV4ZW5HeERE?=
 =?utf-8?Q?5IbFy4q5CDDD5N0CXnEpOiPeDsDbObRMVxC14n9tYk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9C806A676FD0F4789AC55EC69A21BF2@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e784ca14-bda8-48b0-e57d-08d9b9562827
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 07:49:54.0884 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YXfDlf7R0NV2QwjsShSM2MWUM680X1RDSDi/FBxNYfKNDAfhaxH1cCxCcgZ9d351CGkJgFKinIwMhaPwlo+0cujKklb/DfKr0mAvCT0J2Bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4225
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10190
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112070044
X-Proofpoint-GUID: sHi5N3zVwuQsxY6jMU6DZhHZ_ohpr2w-
X-Proofpoint-ORIG-GUID: sHi5N3zVwuQsxY6jMU6DZhHZ_ohpr2w-
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: QEMU Devel Mailing List <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTm92IDE5LCAyMDIxLCBhdCAyOjQyIFBNLCBBbGV4IFdpbGxpYW1zb24gPGFsZXgu
d2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgIDggTm92IDIwMjEg
MTY6NDY6MzYgLTA4MDANCj4gSm9obiBKb2huc29uIDxqb2huLmcuam9obnNvbkBvcmFjbGUuY29t
PiB3cm90ZToNCj4gDQo+PiBBZGQgaW5mcmFzdHJ1Y3R1cmUgbmVlZGVkIHRvIHJlY2VpdmUgaW5j
b21pbmcgbWVzc2FnZXMNCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogSm9obiBHIEpvaG5zb24gPGpv
aG4uZy5qb2huc29uQG9yYWNsZS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBFbGVuYSBVZmltdHNl
dmEgPGVsZW5hLnVmaW10c2V2YUBvcmFjbGUuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSmFnYW5u
YXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPg0KPj4gLS0tDQo+PiBody92ZmlvL3Bj
aS5oICAgICAgICAgICB8ICAgMiArLQ0KPj4gaHcvdmZpby91c2VyLXByb3RvY29sLmggfCAgNjIg
KysrKysrKysrDQo+PiBody92ZmlvL3VzZXIuaCAgICAgICAgICB8ICAgOSArLQ0KPj4gaHcvdmZp
by9wY2kuYyAgICAgICAgICAgfCAgMTIgKy0NCj4+IGh3L3ZmaW8vdXNlci5jICAgICAgICAgIHwg
MzI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4g
TUFJTlRBSU5FUlMgICAgICAgICAgICAgfCAgIDEgKw0KPj4gNiBmaWxlcyBjaGFuZ2VkLCA0MDkg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBody92
ZmlvL3VzZXItcHJvdG9jb2wuaA0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvaHcvdmZpby9wY2kuaCBi
L2h3L3ZmaW8vcGNpLmgNCj4+IGluZGV4IDA4YWM2NDcuLmVjOWYzNDUgMTAwNjQ0DQo+PiAtLS0g
YS9ody92ZmlvL3BjaS5oDQo+PiArKysgYi9ody92ZmlvL3BjaS5oDQo+PiBAQCAtMTkzLDcgKzE5
Myw3IEBAIE9CSkVDVF9ERUNMQVJFX1NJTVBMRV9UWVBFKFZGSU9Vc2VyUENJRGV2aWNlLCBWRklP
X1VTRVJfUENJKQ0KPj4gc3RydWN0IFZGSU9Vc2VyUENJRGV2aWNlIHsNCj4+ICAgICBWRklPUENJ
RGV2aWNlIGRldmljZTsNCj4+ICAgICBjaGFyICpzb2NrX25hbWU7DQo+PiAtICAgIGJvb2wgc2Vj
dXJlX2RtYTsgLyogZGlzYWJsZSBzaGFyZWQgbWVtIGZvciBETUEgKi8NCj4gDQo+IERvbid0IGlu
dHJvZHVjZSBpdCBpbnRvIHRoZSBzZXJpZXMgdG8gc3RhcnQgd2l0aCwgY29uZnVzaW5nIHRvIHJl
dmlldy4NCj4gDQoNCglvaw0KDQo+PiArICAgIGJvb2wgc2VuZF9xdWV1ZWQ7ICAgLyogYWxsIHNl
bmRzIGFyZSBxdWV1ZWQgKi8NCj4+IH07DQo+PiANCj4+IC8qIFVzZSB1aW4zMl90IGZvciB2ZW5k
b3IgJiBkZXZpY2Ugc28gUENJX0FOWV9JRCBleHBhbmRzIGFuZCBjYW5ub3QgbWF0Y2ggaHcgKi8N
Cj4+IGRpZmYgLS1naXQgYS9ody92ZmlvL3VzZXItcHJvdG9jb2wuaCBiL2h3L3ZmaW8vdXNlci1w
cm90b2NvbC5oDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMC4uMjcw
NjJjYg0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvaHcvdmZpby91c2VyLXByb3RvY29sLmgN
Cj4+IEBAIC0wLDAgKzEsNjIgQEANCj4+ICsjaWZuZGVmIFZGSU9fVVNFUl9QUk9UT0NPTF9IDQo+
PiArI2RlZmluZSBWRklPX1VTRVJfUFJPVE9DT0xfSA0KPj4gKw0KPj4gKy8qDQo+PiArICogdmZp
byBwcm90b2NvbCBvdmVyIGEgVU5JWCBzb2NrZXQuDQo+PiArICoNCj4+ICsgKiBDb3B5cmlnaHQg
wqkgMjAxOCwgMjAyMSBPcmFjbGUgYW5kL29yIGl0cyBhZmZpbGlhdGVzLg0KPj4gKyAqDQo+PiAr
ICogVGhpcyB3b3JrIGlzIGxpY2Vuc2VkIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdQTCwg
dmVyc2lvbiAyLiAgU2VlDQo+PiArICogdGhlIENPUFlJTkcgZmlsZSBpbiB0aGUgdG9wLWxldmVs
IGRpcmVjdG9yeS4NCj4+ICsgKg0KPj4gKyAqIEVhY2ggbWVzc2FnZSBoYXMgYSBzdGFuZGFyZCBo
ZWFkZXIgdGhhdCBkZXNjcmliZXMgdGhlIGNvbW1hbmQNCj4+ICsgKiBiZWluZyBzZW50LCB3aGlj
aCBpcyBhbG1vc3QgYWx3YXlzIGEgVkZJTyBpb2N0bCgpLg0KPj4gKyAqDQo+PiArICogVGhlIGhl
YWRlciBtYXkgYmUgZm9sbG93ZWQgYnkgY29tbWFuZC1zcGVjaWZpYyBkYXRhLCBzdWNoIGFzIHRo
ZQ0KPj4gKyAqIHJlZ2lvbiBhbmQgb2Zmc2V0IGluZm8gZm9yIHJlYWQgYW5kIHdyaXRlIGNvbW1h
bmRzLg0KPj4gKyAqLw0KPj4gKw0KPj4gK3R5cGVkZWYgc3RydWN0IHsNCj4+ICsgICAgdWludDE2
X3QgaWQ7DQo+PiArICAgIHVpbnQxNl90IGNvbW1hbmQ7DQo+PiArICAgIHVpbnQzMl90IHNpemU7
DQo+PiArICAgIHVpbnQzMl90IGZsYWdzOw0KPj4gKyAgICB1aW50MzJfdCBlcnJvcl9yZXBseTsN
Cj4+ICt9IFZGSU9Vc2VySGRyOw0KPj4gKw0KPiANCj4gQSBjb21tZW50IHJlZmVyZW5jaW5nIHRo
ZSBkb2Mgd291bGQgcHJvYmFibHkgYmUgYSBnb29kIGlkZWEgYWJvdXQgaGVyZS4NCj4gDQoNCglv
aw0KDQo+PiArLyogVkZJT1VzZXJIZHIgY29tbWFuZHMgKi8NCj4+ICtlbnVtIHZmaW9fdXNlcl9j
b21tYW5kIHsNCj4+ICsgICAgVkZJT19VU0VSX1ZFUlNJT04gICAgICAgICAgICAgICAgICAgPSAx
LA0KPj4gKyAgICBWRklPX1VTRVJfRE1BX01BUCAgICAgICAgICAgICAgICAgICA9IDIsDQo+PiAr
ICAgIFZGSU9fVVNFUl9ETUFfVU5NQVAgICAgICAgICAgICAgICAgID0gMywNCj4+ICsgICAgVkZJ
T19VU0VSX0RFVklDRV9HRVRfSU5GTyAgICAgICAgICAgPSA0LA0KPj4gKyAgICBWRklPX1VTRVJf
REVWSUNFX0dFVF9SRUdJT05fSU5GTyAgICA9IDUsDQo+PiArICAgIFZGSU9fVVNFUl9ERVZJQ0Vf
R0VUX1JFR0lPTl9JT19GRFMgID0gNiwNCj4+ICsgICAgVkZJT19VU0VSX0RFVklDRV9HRVRfSVJR
X0lORk8gICAgICAgPSA3LA0KPj4gKyAgICBWRklPX1VTRVJfREVWSUNFX1NFVF9JUlFTICAgICAg
ICAgICA9IDgsDQo+PiArICAgIFZGSU9fVVNFUl9SRUdJT05fUkVBRCAgICAgICAgICAgICAgID0g
OSwNCj4+ICsgICAgVkZJT19VU0VSX1JFR0lPTl9XUklURSAgICAgICAgICAgICAgPSAxMCwNCj4+
ICsgICAgVkZJT19VU0VSX0RNQV9SRUFEICAgICAgICAgICAgICAgICAgPSAxMSwNCj4+ICsgICAg
VkZJT19VU0VSX0RNQV9XUklURSAgICAgICAgICAgICAgICAgPSAxMiwNCj4+ICsgICAgVkZJT19V
U0VSX0RFVklDRV9SRVNFVCAgICAgICAgICAgICAgPSAxMywNCj4+ICsgICAgVkZJT19VU0VSX0RJ
UlRZX1BBR0VTICAgICAgICAgICAgICAgPSAxNCwNCj4+ICsgICAgVkZJT19VU0VSX01BWCwNCj4+
ICt9Ow0KPj4gKw0KPj4gKy8qIFZGSU9Vc2VySGRyIGZsYWdzICovDQo+PiArI2RlZmluZSBWRklP
X1VTRVJfUkVRVUVTVCAgICAgICAweDANCj4+ICsjZGVmaW5lIFZGSU9fVVNFUl9SRVBMWSAgICAg
ICAgIDB4MQ0KPj4gKyNkZWZpbmUgVkZJT19VU0VSX1RZUEUgICAgICAgICAgMHhGDQo+PiArDQo+
PiArI2RlZmluZSBWRklPX1VTRVJfTk9fUkVQTFkgICAgICAweDEwDQo+PiArI2RlZmluZSBWRklP
X1VTRVJfRVJST1IgICAgICAgICAweDIwDQo+PiArDQo+PiArDQo+PiArI2RlZmluZSBWRklPX1VT
RVJfREVGX01BWF9GRFMgICA4DQo+PiArI2RlZmluZSBWRklPX1VTRVJfTUFYX01BWF9GRFMgICAx
Ng0KPj4gKw0KPj4gKyNkZWZpbmUgVkZJT19VU0VSX0RFRl9NQVhfWEZFUiAgKDEwMjQgKiAxMDI0
KQ0KPj4gKyNkZWZpbmUgVkZJT19VU0VSX01BWF9NQVhfWEZFUiAgKDY0ICogMTAyNCAqIDEwMjQp
DQo+IA0KPiBUaGVzZSBhcmUgZXNzZW50aWFsbHkgbWFnaWMgbnVtYmVycywgc29tZSBkaXNjdXNz
aW9uIG9mIGhvdyB0aGVzZQ0KPiBsaW1pdHMgYXJlIGRlcml2ZWQgd291bGQgYmUgdXNlZnVsIGZv
ciBmdXR1cmUgY29udHJpYnV0b3JzLCBidXQgYWxzbw0KPiBvbmx5IERFVl9NQVhfWEZFUiBpcyB1
c2VkIGluIHRoaXMgcGF0Y2ggYW5kIGl0J3MgY29uZnVzaW5nIHdoeSB0aGUNCj4gbWFjcm8gaXNu
J3QgdXNlZCBkaXJlY3RseS4gIE1vc3Qgb2YgdGhlIGxvZ2ljIHN1cnJvdW5kaW5nIHRoZXNlIGlz
DQo+IGFkZGVkIGluIHRoZSBuZXh0IHBhdGNoLCBzbyBpdCBkb2Vzbid0IHJlYWxseSBtYWtlIHNl
bnNlIHRvIGFkZCB0aGVtDQo+IGhlcmUuICBUaGFua3MsDQo+IA0KDQoJb2sNCg0KCQkJCUpKDQoN
Cg0KDQo=

