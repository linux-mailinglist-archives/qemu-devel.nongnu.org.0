Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35715455988
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 12:00:12 +0100 (CET)
Received: from localhost ([::1]:60460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnf9H-0008Ks-9p
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 06:00:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mnf7t-0007ex-9f
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 05:58:45 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:64666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mnf7p-0000O0-KI
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 05:58:44 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AIAcwPW000708; 
 Thu, 18 Nov 2021 10:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=2QbDNJ9FLnH4nvL9EKK11RIkwGv4xdn1Sme2qfbtN1A=;
 b=l9UmnjAN5CC0e+cAkY0jnkcynmrgOReizfb40r0hi3IznOzwtTXugdBJ5EUIbYrYdzZ+
 vgD5eoPxewVqzTkwXIh6ObnnjBXIZwtDTt8tUU3nYOB2L/4ONH3EBmmfwujpv/m3Nj1s
 qD1byyzpBcXYOY9VL2KVTzyP530xknzZ0UMNSyfM+GwoKcDISger+LnnrExWQfwXRTXj
 tXtKHwGQ7Ycn/Yvu1qfXvqjSyQ9+PhwerpSAOA2KxB4cAoPNBJYHD8xRogNKVMFMTveH
 0LA1zZFYgTs8Oe2cripShcKI5jQNFn7dsK+V0k5GkZalNWoadV0MqeKyhtk8KQtnmo7u zw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cd205espe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 10:58:38 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AIAukZr104060;
 Thu, 18 Nov 2021 10:58:37 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by aserp3020.oracle.com with ESMTP id 3ca568d4yv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 10:58:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1pPVCC3OlqoWAUf6hw6Zl64b0IXq7ua6fH2igsiF9XmtByP3xmEJAj1eZhKK9rc4aws5R/7Iwu/aZA8ShItQ/ddQaOd/6/Uf7wxofEZJGAXMNVY2YuYGrtpMeD+KpA8UMGqZDJtMh6sI6BOIFlRJcV7vJXXJdOe1OMzR3jw6GKKmJQMIC6pLXVqwWhWLoqP3/WzdsHrA/winHdshCl+tlGimaZypLnLwH+mvOOLDBUVACALEfwEVJ3q1ao+5+FpIXNgMHlNq/Km7gT3vCn0ocpgJm6/ZG9NJ6b7aI7HuL3zsAqKGmt5FfktFtvtvM5sJyKL3A70Cq2PoEJq7XyH1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QbDNJ9FLnH4nvL9EKK11RIkwGv4xdn1Sme2qfbtN1A=;
 b=jXZT44L5Q8EeQbzhrQbA/fwSjOUAhbX1+dgrv0/sV9hqfgQyarC9BW8ydtzDvdDxpp4QjHXCCs8Umml8LhYT7Z/Sa3Zzl0r4B42GVmyms+OBVPeyzitcp+zfauTJO6cmt/oot+YDE9hd+cnkml4cZR6PULhW+mnrqBmgY2s5gqvW7XSRQJreL/nhWG+kePd8Fe9tf78d0E6yLeh6z9HOq25JiJy9mvqWpDbrlxRGCqMwyG9DDtt8r+oHJwW9JpmEUqaPC+yaqcedpwWIZ9uzhpNaN/ivYkaceaV5ihWjkItFGGSgWcpqpfJ6fOvFy853MF1HDN+AtERHVy/xskd9ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QbDNJ9FLnH4nvL9EKK11RIkwGv4xdn1Sme2qfbtN1A=;
 b=rR7BjInL6FbYsC2xVOW13xV4oI9xwwJPxnOLVsVdFnura4pOXDX7X1pNCPWoMqbneBfK/MbTck5xo0l3Z4g3jkG4c2k1uG3/MJsvHupc1hQEbPk573IqsMo7GQEdB582kWAt2ESCdUdYe/wx7p/VnFFX+7LJMGEGAUBwPuT1K+I=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by MN2PR10MB4223.namprd10.prod.outlook.com (2603:10b6:208:1dd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 10:58:35 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::9418:7fcf:86ec:e0f4]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::9418:7fcf:86ec:e0f4%7]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 10:58:35 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH-for-6.2? 1/3] docs/devel/style: Improve GLib functions
 rST rendering
In-Reply-To: <20211116151317.2691125-2-philmd@redhat.com>
References: <20211116151317.2691125-1-philmd@redhat.com>
 <20211116151317.2691125-2-philmd@redhat.com>
Date: Thu, 18 Nov 2021 10:58:29 +0000
Message-ID: <m2h7c9n31m.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB6P193CA0022.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::32)
 To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
Received: from oracle.com (46.7.162.180) by
 DB6P193CA0022.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 10:58:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0eff8f70-b5a3-4781-dcf9-08d9aa825e3f
X-MS-TrafficTypeDiagnostic: MN2PR10MB4223:
X-Microsoft-Antispam-PRVS: <MN2PR10MB42237EC6D76B6423AF3BA790F49B9@MN2PR10MB4223.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pLvqLsfW6LUK+yckPch7onWLILgi2C9EuwNsdNL7HvMQGZfjWjpFLHlEfve7x53SaVuqrxXoqv8i9/dS7SFpPpr6zc+J9tk6/mgB2wHM/STP0STgJVx3lVNPIvqMlpcqVa6ve/10a2eDg2ZS9CCtblart6E8gb58mgtnE2Vfo+5wHLU4N5ejE31ZVYJ77MLQaC7Ggwg4hbC6cIDjzyXoCdjbE0VACuEwwZegYKzdVysvEypGDDP8nb56wz5cUsY5gkEL6UHFTsPi1oHHYayeYptddz4EA+GniYQJXLnwRns8bOe9dbg+eo7+ty865BCXTuj6vnpeGSCLuqoWTFg6IHiu/hrVoUXdHTHkaTRNfGlr74v38UjZ34l9Y/gurCi3J3mkqmHaIRC67K1CnBZoDCF1htvzvOuG8+4Sgyhvt2ArmtCxkRF/6AeQfsEQ1iT/xekGBRXvPjKjDOxBWSsS3vEAj661ZI4G/Lgt+dSg11kgn41ePDqtioIvq7T8O5IrZfMp/NxpGYzvoWeDwjEwgnN0R5JYawiH19hcQtDlzWNZ2tC7vQFLPz8DpV9h8wVsSwa7Ouog9ZeYkDG16gl0Loj2agfu5d0WledPsINI1alWvKmIKUEo5gWCyp6B+uoT1jiAmXvdjX3/z0WbzexkiAPbcB6XlxajClUFF5uSjpx5EyVsPPS6P13TWK5Gb8P1vAaYyExoJi4LYJMdBS+eoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(52116002)(66556008)(4001150100001)(4326008)(7696005)(8936002)(83380400001)(55016002)(86362001)(956004)(2616005)(5660300002)(44832011)(66476007)(26005)(38350700002)(2906002)(36756003)(186003)(8886007)(508600001)(6666004)(66946007)(38100700002)(54906003)(316002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVd4RlpuK1ozVms3b3YwRXp2Y04zdVFkOC8zZW9sKzlEa2hrT05NTEhQbUZU?=
 =?utf-8?B?bDNDL2VjcUk1UGROU2NrdnVmaXZYRzY3K3o4UTVnOGRTR0dqTFBHRE00SGNO?=
 =?utf-8?B?T2xoRFZkaVY3WHhZTys4YUQwWU5UZzFqcmNYaVNHc0txa3dHRExLR0N5bFhQ?=
 =?utf-8?B?ZGVCTkpTM0laOHY5UWNTMzd0aFV2QlVyMTRKRmQ2N0t5aUhCM3RzSEtLY0xw?=
 =?utf-8?B?YUFFTVdJSk5JQmlmY2ozL09Fd2VuRElrdVJtRHFtQUNEc3BhYWlHNm5JRmJy?=
 =?utf-8?B?MzNrK1RxZkhvYVhXSUphUVpvd2ErRE9tdW9Lc0JhVjRZb1pnZzFPSFJKZ1h0?=
 =?utf-8?B?T2dnM285WEJlZ3ZtcFNhR2pnMnRPQUxqd00wcytVMnZFTGMrNzl4WnVyWlFC?=
 =?utf-8?B?NFBOVlhLMXRGNElteVh5cVVuMGFOanF4K0o5NUx4bGFUcFdhOHJCcVd5OFV5?=
 =?utf-8?B?aDRmL29wcmpTUTh2M2kwUTFyOE81VmwzU1EveTU0SVF2aTZVdDdrVnFwaXg3?=
 =?utf-8?B?YTlnRkx4VEtPL2xuZWZXV1FxUGFIZVFlYllDNi9icXRBd0Vwc2ZCc0dpejUv?=
 =?utf-8?B?QVd1eFRkUldONUIzdnllNEZNc1JCTVJpTGxIM3pnZzFlWW9DTTdjRHlRSWc5?=
 =?utf-8?B?SVArTUsvemFRUDZmMjc5bDhTclBpakZxSHBzcDlZbWI4VjZjYTh6aVFnSmZS?=
 =?utf-8?B?eERGaXoxWU43TWs4b1RXbVNXbUplNjVQUWw2WXFMSHJva3dEeGFsb3ArUXZW?=
 =?utf-8?B?akZCdDdrSGNGRFRCRDlNdXRvS3NsYUFNdDNpNU1vMjg0Yzk5ZFNPMG5Ealgy?=
 =?utf-8?B?TjZxZUVLYytJU1NIcFk5azdxZllsd1Babkc4VEUxTnJvT3JLa2VGSFpJbkU4?=
 =?utf-8?B?MmNKOGJraVdPRjBpTTA5c0pnUDRvNEhtSkYxTDhJaDBmSTlOeWt0ZFN6N1Jz?=
 =?utf-8?B?Z3FJTW9mUk9zVzI1OWZBcjYvODViR1JrajdtZWh6SlF6Mm13Y3RJVGZEVmU3?=
 =?utf-8?B?NTA4TXpxNDdKVVl1ODRwUVFpQVBRME4vb2lqQzlVbTljelpkNmxPbFJwY1h6?=
 =?utf-8?B?cXN4L09mRTBwV3JqYWQyTC9HU3M5QVUrTVBvUVhyNS9PcnZWViswcGc3Ty8y?=
 =?utf-8?B?UnIxSjZDVUZIbDVyTVlxZXBqVFYwTlp5NGJ3c1QrTzVQZFJEeUhOSDlKTDZy?=
 =?utf-8?B?a0ljallOdFRLR0g5VVR1ckRDYTBMUVIvbWdmYUhFUU5LaW1ldkg2MURWTlNo?=
 =?utf-8?B?SXVXSklxUGlFWmtBN2Fub2dpWWdrb1Vvc3FBSFE2T3F6dzdEbldPZXNOcUtN?=
 =?utf-8?B?MXJ1cXNadDIveHphNk8zYVFFdjJXVTZJTVZjUlpiV094MU1TUmNlVzFZSXdk?=
 =?utf-8?B?T1ZMYXFaRGpTa1QrQzVKN3VYRURRaSt1WjRhQVl4Qm1ZYm93aTQwZ25HS2dm?=
 =?utf-8?B?QllEbUJWNWxDeXZIM1Azd3JSZkJmOSs2M0EwUWI3VVczQWc1bzRCZ3dDMk9x?=
 =?utf-8?B?M1JJc0VWNGZ0SFpmU0lKZCtSUTdhZHFTRi8wQzJnOHdLMSsxbkVhWHB2WTZT?=
 =?utf-8?B?MllSczI4QXBoWVJRZzZuOUIwaHpHUDFGd3JmOHI2SnUzaXAzeVlCNitpZFFR?=
 =?utf-8?B?MmpORUI5Q3lGUGFHSnJVRUNsS3dPVmZ6NTZEWkxFRDJjdHhaVk56YVE4Uzc4?=
 =?utf-8?B?ZXJUb1dJbnJSVzRvU2l0MVRhWjNjTGMxa0tpOXVVZ1NEM0R1ZVptKzZZRlh5?=
 =?utf-8?B?TG1ZQThYV213VE91K1g5YlkxQjNNNzc4MVgzbDFwcllpNXgxVVU4eThLVzgz?=
 =?utf-8?B?Q0RRQUJwSWRvZEN5SjRmQUNKYVlpbVdLekdLQ1NJN2VwNTdBTlQvb3BoVEVk?=
 =?utf-8?B?dnprc1Z1TDI0L2wxcU1aVDlMdDhtRnAvNndyNDltTllQa2EvOE1kVHo4NW4x?=
 =?utf-8?B?N01HelFZUURtUjZhdEU1Qkh5VFVReFk4aU1ZZUlOYTQ5UExUdzd1NmRYQTdG?=
 =?utf-8?B?dmVVakNENEVYUlVMZURJaTYrdm40c1ozd05pK2xWNnFySFNjREFNQ3V0SDQx?=
 =?utf-8?B?Q0lBajNEV1dzS0d6Y2pCUTh6YUJjbnpka1M2WlprbTJsMEFPZjlqOUtEQ0RI?=
 =?utf-8?B?T3Y3eTFjcUpkU3dTb0Z4Z0hhUllHUWc1aU9nMEJuNUhjYkpWSVZrckFGTVo0?=
 =?utf-8?Q?wq/qN382eu9VyiVtODYenjc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eff8f70-b5a3-4781-dcf9-08d9aa825e3f
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:58:35.6964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0GJcCexutm1bYh8Z8UvddOt/xycg16zfjhvWA3UiNBWMOWbijY6z6IKhUrvsIpeXvvL8XQntOFNwPVop+WiuAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4223
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10171
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111180064
X-Proofpoint-ORIG-GUID: zRV0QLXSrWv3BVFHyNudWCFGHcanaFQ5
X-Proofpoint-GUID: zRV0QLXSrWv3BVFHyNudWCFGHcanaFQ5
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

There are some inconsistencies in the use of '()' when referring to
functions or macros below...

On Tuesday, 2021-11-16 at 16:13:15 +01, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  docs/devel/style.rst | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/docs/devel/style.rst b/docs/devel/style.rst
> index 260e3263fa0..415a6b9d700 100644
> --- a/docs/devel/style.rst
> +++ b/docs/devel/style.rst
> @@ -413,13 +413,14 @@ multiple exist paths you can also improve the reada=
bility of the code
>  by using ``g_autofree`` and related annotations. See :ref:`autofree-ref`
>  for more details.
> =20
> -Calling ``g_malloc`` with a zero size is valid and will return NULL.
> +Calling ``g_malloc`` with a zero size is valid and will return ``NULL``.
>

g_malloc() ?

> =20
>  Prefer ``g_new(T, n)`` instead of ``g_malloc(sizeof(T) * n)`` for the fo=
llowing
>  reasons:
> =20
> -* It catches multiplication overflowing size_t;
> -* It returns T ``*`` instead of void ``*``, letting compiler catch more =
type errors.
> +* It catches multiplication overflowing ``size_t``;
> +* It returns ``T *`` instead of ``void *``, letting compiler catch more =
type
> +  errors.
> =20
>  Declarations like
> =20
> @@ -444,14 +445,14 @@ use this similar function when possible, but note i=
ts different signature:
> =20
>      void pstrcpy(char *dest, int dest_buf_size, const char *src)
> =20
> -Don't use strcat because it can't check for buffer overflows, but:
> +Don't use ``strcat`` because it can't check for buffer overflows, but:
>

strcat() ?

> =20
>  .. code-block:: c
> =20
>      char *pstrcat(char *buf, int buf_size, const char *s)
> =20
> -The same limitation exists with sprintf and vsprintf, so use snprintf an=
d
> -vsnprintf.
> +The same limitation exists with ``sprintf`` and ``vsprintf``, so use

sprintf() and vsprintf()?

> +``snprintf`` and ``vsnprintf``.
>

snprintf() and vsnprintf()?

> =20
>  QEMU provides other useful string functions:
> =20
> @@ -464,8 +465,8 @@ QEMU provides other useful string functions:
>  There are also replacement character processing macros for isxyz and tox=
yz,
>  so instead of e.g. isalnum you should use qemu_isalnum.
>

Should this be isalnum() and qemu_isalnum()?

> =20
> -Because of the memory management rules, you must use g_strdup/g_strndup
> -instead of plain strdup/strndup.
> +Because of the memory management rules, you must use ``g_strdup/g_strndu=
p``
>

Wonder should this be ``g_strdup()``/``g_strndup()``

> +instead of plain ``strdup/strndup``.
>

And ``strdup()``/``strndup()``

> =20
>  Printf-style functions
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> @@ -524,10 +525,10 @@ automatic cleanup:
> =20
>  Most notably:
> =20
> -* g_autofree - will invoke g_free() on the variable going out of scope
> +* ``g_autofree`` - will invoke ``g_free()`` on the variable going out of=
 scope
>

g_autofree() ?

> =20
> -* g_autoptr - for structs / objects, will invoke the cleanup func create=
d
> -  by a previous use of G_DEFINE_AUTOPTR_CLEANUP_FUNC. This is
> +* ``g_autoptr`` - for structs / objects, will invoke the cleanup func cr=
eated
>

g_autoptr() ?

> +  by a previous use of ``G_DEFINE_AUTOPTR_CLEANUP_FUNC``. This is
>    supported for most GLib data types and GObjects
> =20
>  For example, instead of
> @@ -551,7 +552,7 @@ For example, instead of
>          return ret;
>      }
> =20
> -Using g_autofree/g_autoptr enables the code to be written as:
> +Using ``g_autofree/g_autoptr`` enables the code to be written as:
>

``g_autofree()``/``g_autoptr()`` ?

> =20
>  .. code-block:: c
> =20
> @@ -569,13 +570,13 @@ Using g_autofree/g_autoptr enables the code to be w=
ritten as:
>  While this generally results in simpler, less leak-prone code, there
>  are still some caveats to beware of
> =20
> -* Variables declared with g_auto* MUST always be initialized,
> +* Variables declared with ``g_auto*`` MUST always be initialized,
>

g_auto*() ?

>    otherwise the cleanup function will use uninitialized stack memory
> =20
> -* If a variable declared with g_auto* holds a value which must
> +* If a variable declared with ``g_auto*`` holds a value which must
>

g_auto*() ?

>    live beyond the life of the function, that value must be saved
>    and the original variable NULL'd out. This can be simpler using
> -  g_steal_pointer
> +  ``g_steal_pointer``
>

g_steal_pointer() ?

Thanks,

Darren.

