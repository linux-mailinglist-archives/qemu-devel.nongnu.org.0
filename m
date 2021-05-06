Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243663755FD
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 16:57:21 +0200 (CEST)
Received: from localhost ([::1]:52624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lefRI-0005cm-5F
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 10:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lefPS-0003xi-EQ
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:55:26 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:32994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lefPQ-0003aC-10
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:55:26 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 146EeDWD026484;
 Thu, 6 May 2021 14:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Big0zZDJssBRP+wKcXiBymnlx1zuQRuktKD4Sb8+4OA=;
 b=q/SArUFevQlkBcDZpTbwnW5zeqyhs7y03SwfHSUWy1UZKp9b5cb32XyygOHPv39+DCDd
 2B24VkX2oG4pg5EXarnjB6lYLDNiR8JFk1s2FuPbaxH0yDwFiZrlmBKKXOsWeEQHH60k
 9FFej4XGFdgxs8+yPxAE9dLL+rvUqv1VTZ6DtdNfvO7cjAgAwIg/eOZafclxV5m9TWLj
 m97BRRWI5+IsnsHMab3DFAFJRMWu75XMBjw5Kd/azW+nwIwS6XQdW/6r2IbMZBla0Oep
 oC1EZ8aF8P4bJXZjI/s15ONXxydFi5cAbVpCs7RiEioDR9Dc1ET+48pCuhLww/cCFsqa nw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 38bemjn8wp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 May 2021 14:55:04 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 146EfKLn093411;
 Thu, 6 May 2021 14:55:04 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2173.outbound.protection.outlook.com [104.47.73.173])
 by userp3030.oracle.com with ESMTP id 38bebveysn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 May 2021 14:55:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CaQMMUI39rO7YpMg//FDO+wdh406EB8bjmGpDwzne/rfpQeT7s7fdaRRl14zlfTS5RKQIsa17+MpOmRb93LP8ecPiBp8IlOtTv5Sfyb0c+QAjqYJNEgeHALWGXkRLdJLQq+e499KAMpJnfwNcKIX4YZFRhgUpWrDyChp6oRnF0YpUNwRbfoZwCOguDsqkY0UxEDJBrTmkH57jQLgIcwrjL5/WqRBEbUVzaWXDVNnXnmhLw4vYj1gJWjRrvQJl3x+j8RTrSe5uD2diDVTgefbOdI2c0T5wcAQikzMYFEYK7fxeh+xfLwXEOKc6WuRerH9ftTIdvUzsc9vzmQt4/h+Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Big0zZDJssBRP+wKcXiBymnlx1zuQRuktKD4Sb8+4OA=;
 b=CM04qUYWLdb0s0d8f/mNdc6yO7dsV0hElX1TmKRZTAnxFJnotD0E0aZO4A/kTzCWO0QwUjIl9MK/Fhg71UFEQpjov8zbU79PYdBGO0fxlsz855sA+/4obWJ0bGBsjkPGHPCuczFM6V4d0OsotKuTkn27g1P33j3wWoJZZCDy3BzSTwdz4lwvWf3WOa0Dwdhvqsf8Hcbye5+ouXTzUZmEiyLvI2T44iQnz+6kgxL0AL56sOu5e6yy/hFvf9H5rccrWDamKl1ikQusH3GfsThXNU4iopls6lfdNbpM05V/L2iEvgn1WJJp6T3hVr53EVjxcPWtR8lZR59w5Gcvbujc9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Big0zZDJssBRP+wKcXiBymnlx1zuQRuktKD4Sb8+4OA=;
 b=eX5cJpe3ovzqjbnWaTw+pOnqyFHot5Z4y+6ScLKGY37yHCbKMmlSk23PWMwbUf5QySLSEFjCK8IKuWzUXGF4kGOFkH2jHojLMsMoFHG0xfVkn1zVZUKyjeQkQ0ZjwXAz275VPks3EHQl/fr/YbAVeAWkeSpcl3AJnTG+59ysvTs=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4126.namprd10.prod.outlook.com (2603:10b6:208:15f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Thu, 6 May
 2021 14:55:00 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508:17b9:6da6:5246]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508:17b9:6da6:5246%6]) with mapi id 15.20.4108.027; Thu, 6 May 2021
 14:55:00 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v21 09/20] multi-process: define MPQemuMsg format and
 transmission functions
Thread-Topic: [PATCH v21 09/20] multi-process: define MPQemuMsg format and
 transmission functions
Thread-Index: AQHW9l5X5AclsqE9t02Cd+PSaf6KFarXGwmAgAAHzIA=
Date: Thu, 6 May 2021 14:55:00 +0000
Message-ID: <5AFC417B-F681-4E88-A587-9A6EB65AE684@oracle.com>
References: <cover.1611938319.git.jag.raman@oracle.com>
 <56ca8bcf95195b2b195b08f6b9565b6d7410bce5.1611938319.git.jag.raman@oracle.com>
 <7433948d-02bb-625f-b6b6-9421b1d7c05b@redhat.com>
In-Reply-To: <7433948d-02bb-625f-b6b6-9421b1d7c05b@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [2601:18c:d07f:b000:2dbc:7eee:3380:9050]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4da941d-114f-4ff8-15cc-08d9109eec69
x-ms-traffictypediagnostic: MN2PR10MB4126:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR10MB41264B427B1A905ECD37D36590589@MN2PR10MB4126.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 16uMDVIW6/4BAIXfZczGRKQL0quoIgAn87Aqeoa6pdRpzvkdcJ9xdeEbEuSeKUF9ljvxsB7Ucbs7CoajtoyfVugjqLIKPJsWUYhBOwQQ1lSiFIEfAKZ1LMYZh3BiqNSR67Lt8eixCB/MngmbTRWFeyEBECjYSyRgkSm7DIjyucgPx6hjRbfis5Hopx+0DBKq7oJJzazvkHg9rgdqI7tFWrO3ppD+tPDOZWcjd6yhsMCLEFmsHgxEKpcXo477FEunKce1Ka7sXz9xv2sHI3C8Q+G9J1P4042AXeX3xGm9ja7xi+WE8U+NC8sfYEpixqwLCRnVsFsVzB/V9mbjXcTqghsIAQH3qpk0CaAIxRb5bC7JlRDslgP+i2l3JF7vtKpvBLwhVQtXwPkBiDoFXnMvbuJzZMAdOmS0HJ0GIHe0gQXI30AcBV8Ebpntej77weFNu7/qV9e/tslVymq9w4242759qMB3i6Alz6d6IMdhf6BmCOyl+njLJtc5xVlqY952Gh1UuEHo8gegK3Wlh/Z/iSHNe0kunDyHkMrnC2uSfeP6nci3sLBo10mItQRkBbuLG8K+pWJtr8w24f/4P22HhUbfLsU94w3wcq3WA3mizEhspw0UxXb3XQ76qquEI5q1laJLbwwPsjuB0YIOcw/Yy+TZG/fYxDmBjgLjB9AdOsGELXwxBHyDxY8nQ8KjoOp4O6UzXV0WU/juvqjDgLx2UruTfHn3V4mna46SF+D3M0w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(376002)(136003)(346002)(366004)(6486002)(91956017)(66946007)(64756008)(8936002)(66556008)(76116006)(66446008)(66476007)(83380400001)(316002)(6916009)(71200400001)(966005)(2616005)(33656002)(478600001)(8676002)(53546011)(6506007)(54906003)(186003)(44832011)(38100700002)(122000001)(2906002)(86362001)(5660300002)(4326008)(7416002)(6512007)(36756003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?hB0eI2N1+JS17ebi0T2YPs9kSGjy+dTVHvVYinU9NZGzsQGFpSMGgBEioju8?=
 =?us-ascii?Q?ydlj5Y8LVC+Ed0teQbb1stnz5ww8No1Whju+3nnxQl8JIiBW0uvcOUYrg7I9?=
 =?us-ascii?Q?r1uQCyFKv4FTK4GjGW7yTGPoyWiZkRBKdB2Uqcqie4TnMQo/BsUTM9WWbxbT?=
 =?us-ascii?Q?UirO2j5jydoRwnQSHQ1X2dVK4PX8PgYLhYTaP0zWG+NLJjNFsq0ZkxZiqq3r?=
 =?us-ascii?Q?ahi0/KQsra18Ud5GhxqIGWXhrMI74pgnepGSVpSQ7dMy4+c5njXEdQHOzQa6?=
 =?us-ascii?Q?JTYfDxILZXEZdphSXMbSSouVrT3DoBuz0EoG+mAiAwCxO/sOFt/K7cONyaSv?=
 =?us-ascii?Q?wFAZKHDyD0AE5kTFcf+CASjKPKCJiUlN0vNbVMkQe/LLw24xXepAqugZzcrq?=
 =?us-ascii?Q?nziE6uVs0bcUsadzM5krkbsYjFCCywZWEO0y8DinCIb7aw5pqJqaWyn6ElMR?=
 =?us-ascii?Q?1zIFKENKLG83iH9fquu9WqdoKf6RGu+iOIfbmV8BP8UytAYwmJpL4tU+qp4d?=
 =?us-ascii?Q?nmHeUNDnlVwIW42IDZbai/SEVOKl80LtbmzzEkdB7yxLW1rEnhb95wxzQX1g?=
 =?us-ascii?Q?HBT4YpUJYmuBs1mNVR6eDeFRWUHwfe6ReADtyckpVbn1BwpLKxxPuj6Qn5Sw?=
 =?us-ascii?Q?14fEGhyyS08Lvqe4lOaPEjn/cZj5ujC0m/B3wfyTrkXwSSd4zHl9fqtEw/oT?=
 =?us-ascii?Q?XiCBa5SZE7hPHxzRWSCFJXvxc88kDCg7IXfvo2nudKrjN7cHQVzUVTmPUDMy?=
 =?us-ascii?Q?EYVFvqnKOnw2F97wxz0yy1TzTOpVjV2jCXSPjsQYdYIN1dgJ+vRf6yRizT7H?=
 =?us-ascii?Q?q+CUxEHSSBcVtkTS1TlN+NIDTKe5rFE++A6mBnO2Iw5Tnpcu9vCAyfbcIsLe?=
 =?us-ascii?Q?c/BKJALmDr1hqCBv5noF5nl9FGphheItFh1d/fd7ctUm064wFsifIl8B33or?=
 =?us-ascii?Q?Ai0Jdvrg2WMeGLG6VJRXhn9fpbE/Y0mA8CiegO1nZoEHc+4e291It1TxcjiQ?=
 =?us-ascii?Q?6L6AAptje7hyCc4TdFpFbhpjhdxzf9kZdSD2h2DjpY1YyhxunEusn05nT3oo?=
 =?us-ascii?Q?PkiFHoxPmbrh/kqBYGXndpllYiMl0O6XSfp1GYmFoKlnJAtgz1vyhA51AVlR?=
 =?us-ascii?Q?GPqw2+We+T2qQezNrpTdUnqO0wgwTD4H8sFDYan4v7jWpFoltLCgPnb5SfPE?=
 =?us-ascii?Q?OxINgzdLZEa2DDoeR4yhF3Un5QqWEfUs/qPbthhkC3/D0x7RUFhj7Ha8bnvs?=
 =?us-ascii?Q?sYheU2xcVv9uF0O9nZuGCsG8kCsifV25Vfj0gNIUNnOBQwqd2TBtS9zXxwGB?=
 =?us-ascii?Q?jJY/o3pw4fIrx1fh7C5BNgpNoSF87m6npXqCg3yHV431CSEloudUeUPGixZA?=
 =?us-ascii?Q?HFG55xeI4BajXXIeZNP7GKYn+aR7?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E5328F54A651224483D084AC8948C296@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4da941d-114f-4ff8-15cc-08d9109eec69
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2021 14:55:00.5183 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g8P2cTf5omZnC7wl9cuQbj6pnO4zJhjftzJDeEs4ew/gcYEGfh1t3sEt7KHc6djD2wb6bLdgzsAEvDMkUXGa2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4126
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105060107
X-Proofpoint-ORIG-GUID: q_kHTz0959y0a0m0nNYCZNzFTTOpzNrd
X-Proofpoint-GUID: q_kHTz0959y0a0m0nNYCZNzFTTOpzNrd
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 mlxscore=0 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105060107
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John Johnson <john.g.johnson@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "kwolf@redhat.com" <kwolf@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "ross.lagerwall@citrix.com" <ross.lagerwall@citrix.com>,
 "marcandre.lureau@gmail.com" <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On May 6, 2021, at 10:27 AM, Thomas Huth <thuth@redhat.com> wrote:
>=20
> On 29/01/2021 17.46, Jagannathan Raman wrote:
>> From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>> Defines MPQemuMsg, which is the message that is sent to the remote
>> process. This message is sent over QIOChannel and is used to
>> command the remote process to perform various tasks.
>> Define transmission functions used by proxy and by remote.
>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
> [...]
>> diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
>> new file mode 100644
>> index 0000000..b3d380e
>> --- /dev/null
>> +++ b/hw/remote/mpqemu-link.c
> [...]
>> +bool mpqemu_msg_valid(MPQemuMsg *msg)
>> +{
>> +    if (msg->cmd >=3D MPQEMU_CMD_MAX && msg->cmd < 0) {
>> +        return false;
>> +    }
>=20
> Hi!
>=20
> A bug in this code has been reported on Launchpad:
>=20
> https://bugs.launchpad.net/qemu/+bug/1926995
>=20
> Could someone please send a patch for this issue?

Thank you for sharing it, Thomas!

Will jump on it right away.

--
Jag

>=20
> Thanks,
>  Thomas
>=20


