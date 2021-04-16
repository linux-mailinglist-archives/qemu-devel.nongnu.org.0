Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757DF361E74
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 13:10:49 +0200 (CEST)
Received: from localhost ([::1]:58886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXMN6-0003My-ID
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 07:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lXMLe-0002e8-H2
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 07:09:18 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:43516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lXMLb-0004yi-T4
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 07:09:17 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13GB5sNb012321;
 Fri, 16 Apr 2021 11:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=tkqqxZlbqiQXkrMsJnrawlWcHJ68MeOBApzQu8mEza0=;
 b=bi+KSbw6pblbzAZx//kQAqXoFDLFj/cg6D0FEk8bwINO+lhKF5odq0gbWG/BK8M3bFez
 NEWPgYN70pcYP1NPP5iYabpIezUJojllxuXE/xQzG3rf/Xj2eKFjXOcRaIpdsIverqCP
 SMsoYYDJfqQlfbeS4hmb/gErEpbEkEFhY9e04rpljvVEkux+7raSuTnOVxVnytFbkoHs
 IKuKVLfRf9WDIJqh7XU33quJ8XiBI1PP+pLf4nOmG7cQBUSTcqCJjSxkl0IqyOnBWlZc
 /Cao9Y+uyq2Hcd0jkJx5EFGCaZ1PCZjWhExrDuyV2QbpVldVhv9XqdqO5zCvmA8bn5am 0Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 37u4nnrrms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 11:09:11 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13GB5qFv093186;
 Fri, 16 Apr 2021 11:09:10 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by aserp3020.oracle.com with ESMTP id 37unx4bxme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 11:09:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QoURR04OgQMtg4xor305Qf/k3S4pJIzSns4/FNSr5ysEW/zvUVU+OYZ1LE0+DH5MFUr895i+S85cx7keK9cMiNYpmFlkiG0IJYkhe6o+aYae87HvmMO6TGApUtn+n4BQOomsy2/W7CNyYQD4sJznVjRI5h5d1OGM5pIfnGpjgHImDha01PKRDCBKXR91KW6/NPS138PXHc1YG+oHqKNGJT/Vfq1ROdt9yyyGfyWu95RrHU0GztEw0z2ts02FrRlJkhL0mLJvBzuWFOIu5mb5QslGATjj4y/vXdKTSblUpVS5s2sPgylMoohd9nl+S4FaraSf2rKZqEzvHpY1DsL+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkqqxZlbqiQXkrMsJnrawlWcHJ68MeOBApzQu8mEza0=;
 b=MRDdDsFR2kWg8fMP0u9Xtmfjt7oeBLQahfR+p2ViZHLi7LThf/naCc73N8DR1vZVv3/0MbeStHBGfKSwc+DownqjWSUOtvvMu0ChY6OUxIGWfnZz9YSJMKh4vMO4XEm57ZtBXkiwQjUsmd/Z84jJorMqJrqzsfsOstcsx7Bs5ZJgCaruOijXRu9mdm3QTCvdsM+8rUo5oF/Phcpmc/d9LcF28qykBDf3IfUgIlsV+XRX1xPpvxiZVNmhVt9etjGOBDyzYxhG8iC4lM6PxqSC00IF9c+RU5YSDZRRa2nC1PjAlOvBkh1X65CTIKKZrrXf9qE9kSoBaI3PnKqo7mRUSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkqqxZlbqiQXkrMsJnrawlWcHJ68MeOBApzQu8mEza0=;
 b=FXkkonLgtXU+jO4aG96fibqkVn5E219vUBLCoD8XU2dAZGe8RT08aWr8PU0Cr9IkSXbUCtXigVBuMadCTI59F3/D5+KBTyvYV+9Qj6fRB6yuSHyV/t/BblVwpQcOMbWRJiDZl0loZcmmnuhaTH7icU/WzcIHtaOHG+XWpYwlzCA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2857.namprd10.prod.outlook.com (2603:10b6:5:64::25) by
 DS7PR10MB4927.namprd10.prod.outlook.com (2603:10b6:5:3a2::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16; Fri, 16 Apr 2021 11:09:09 +0000
Received: from DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::fca8:448b:525f:7873]) by DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::fca8:448b:525f:7873%7]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 11:09:09 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH-for-6.0?] configure: Improve error message with
 specified meson path is not found
In-Reply-To: <20210416102559.213649-1-philmd@redhat.com>
References: <20210416102559.213649-1-philmd@redhat.com>
Date: Fri, 16 Apr 2021 12:09:03 +0100
Message-ID: <m2v98mjxkg.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [79.97.215.145]
X-ClientProxiedBy: DB6PR0202CA0017.eurprd02.prod.outlook.com
 (2603:10a6:4:29::27) To DM6PR10MB2857.namprd10.prod.outlook.com
 (2603:10b6:5:64::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (79.97.215.145) by
 DB6PR0202CA0017.eurprd02.prod.outlook.com (2603:10a6:4:29::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 11:09:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d04d1fc-32d2-4c9a-c072-08d900c80e89
X-MS-TrafficTypeDiagnostic: DS7PR10MB4927:
X-Microsoft-Antispam-PRVS: <DS7PR10MB49279112D037365C7F640E07F44C9@DS7PR10MB4927.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Jc5/DtwWCgzlhqJVhXQEkTvgOlvTi/BVOQeoBAb+4epzpuIl+6QatZJo2wnJHT6Y/DyiO7i1uZjla51ODsU/Tm/We3MW4O1dW1lwPTvoT4wG3Jktl9Or0Hxh6EKB6zVFllXLLeRSPwDZCk7EXddQuJWq6H0HJbKlwa+gOgM3DshmMAS3ZK4xTwVBelY/TdyG+wct2zRhSVkF0ovXLm2tG2hBzqAtKj3sshfpPKIzrwiE1SPdefWSDRSLcZWxIT+xRBN5Umd2NaPQ0Cd1GskN1CPg8Z6V05msJj/Hr3RFQUcYT78RfK48HNr5OUsWUL2d5jmexh9I6UGLpquRwbriG8zye9tZCl2iO8DGEi5hANJNx0+EDIXLosjJkrUASPYqZPeG0zYtraG6PAc8mtO2bdsHamFpWNw7SbHJPVej+los0TE46laePu2K5yr7+de8fmkVPpR/GdSNirMSmbFMtJf8M3ckXVGaT6NehG+qjgVTE1M26laLdpAHsDwBi3zrf4oaEBsCwHFew3m4f1kwuareQRBttv84FZcnq4HIy+R+svEhYclEqy96xzeUaU/slkvScAskekGlUbTcoPTT5fmOBC28rH02lw5d3sQx8/h+2jOduQqoba/w8wOORCF+qQjIkrGyYx5xPVjkProsqrpCBI5fGWDKHI5qxL7Xnkst16p6qjCatiIbpqgIMQ7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2857.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(346002)(396003)(376002)(39860400002)(6666004)(2616005)(36756003)(956004)(7696005)(316002)(8886007)(66946007)(66556008)(66476007)(55016002)(83380400001)(186003)(16526019)(5660300002)(478600001)(44832011)(2906002)(8676002)(86362001)(15650500001)(38100700002)(54906003)(8936002)(38350700002)(4326008)(26005)(52116002)(226483002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cmxQb25nZThFbmxkNWNLNWVkRDFnblFNYUNUTEQ1VVFtZVM1eUcwSTk3dFM0?=
 =?utf-8?B?VktvdWo5TUZzNUVPS05zTnlxL2s0UzlyOGRkL2RpQVBsa0F4VEZaWU5UQkJs?=
 =?utf-8?B?Wk1uY1FEQ0dRQW9Hc0doZ0NOR0JycFhybGF4YWs0RklGZFBrZWhKT2NFMXFV?=
 =?utf-8?B?ZHd0OHI0WWo5VzJuY0tkY2htZG1BV2pDTldvODlFR3pmM0IxSXI2S29KL2t6?=
 =?utf-8?B?SSttVExVekZzL3lHZEtISWRVKzBLb1M1L1l3QzNldUJsalR3WWJINVROT1FY?=
 =?utf-8?B?U1lFc2svejNvQUVrNjlUZm03S1lYRlU2VWJzMHJyN1BweGI4SHFrTVBlakJV?=
 =?utf-8?B?dlRpdjJSUWhhU2lnYy9TQXQ0NkpLd0poakF3SDduN1ZRMDZ3YUJQMjN5QXNw?=
 =?utf-8?B?S21aL3FiK2dtVHRySDUydXordERRUEo5Ulljci9taHZJZDk4TEJqNUxIUlBN?=
 =?utf-8?B?S1NPSTJhRzlzemlDOW1JTlR5QW1pK3RaRzNRL1BvR1VldS90Mk11VGh1WCtz?=
 =?utf-8?B?MTcvaFROY0NZZVY2dW1Ddnd2UU15NHRLdlp2aEQrbEpMQ0FDREFpT0pyR0Fm?=
 =?utf-8?B?VnhJSWh4NVQrZW81anUyYnJVUGtITEM1N09LcDRwdDVMK2FBTlRrWWpzT0ly?=
 =?utf-8?B?MGtUNHhGVTYyQ1NML3lpdEJtYWhCQjYxRHUxN2pxSUM0U2VESHRIUFgydGU4?=
 =?utf-8?B?V09LWGdBd0NQR2k3L24yM2ZnL1J3dUUvRUtMN016RFRIK3V2cEh0TlRCbDY3?=
 =?utf-8?B?Y0JqTGhjQWtXekNJaVJVYnU3akMvSnVsRmtHek1rOEtKdXZOUGFYbWZrbWJS?=
 =?utf-8?B?U1hGZnp2TTlydjJHN1lBZ3MxcXNQVitlK0ZPWWgzRENQSFJ5emVkMER6T0o4?=
 =?utf-8?B?YlhNbmpJM1gwRGFHemkyU2lEeXNJK216RFJIdmVnK3RhSjNBVE9PamFBazdZ?=
 =?utf-8?B?L2ZuNGExSThBYlpBZVQzSm5ucDZjcmVzTFNzR0ZIbGxrcmsybGNrMmo5U04r?=
 =?utf-8?B?blg0Vzg4WWE2RjBUanJnamd1V1NiOEhsV3E5MHBVWld4aFBNeU5KaWE0YkVi?=
 =?utf-8?B?MElYOHp0VU5jWEF6ZVBKMEFiUVlBUHBSSmVNQWlRRHlJVjNHSDNKa3gxZjVB?=
 =?utf-8?B?NzNFc2FlS0NoekQyVXVsUWN2aWhtRE1RYWZSVXhVQVRKL1BpeXJBNmNlZ1Va?=
 =?utf-8?B?ZXdaSW5kbkZsK2tGeFhBOHplalhBVkNHLytUUU1PeGFsM296bmkzQWI0aHlK?=
 =?utf-8?B?NWM5NSt5NXJIVDVCSUFNL3NqSGRLdzEycFcyV3hibmY5QXFoY25RamlXM1lj?=
 =?utf-8?B?NWtnV1NZRW5CbkZXbWczTFh4b25od3M3eW1qZ0tIOW9pTUNiSVBlN2JLL0tR?=
 =?utf-8?B?OVFmdzk5ejE2QkY2MytkQXROTEdNTzJZbzBMUVlmT2t1eVd2NXhrV01JM1Zu?=
 =?utf-8?B?NHZMUkg0RUNJNzYwdXJza1BmOENOSHllWldQdVl2aExjdmpsNDR1aUFzeDdy?=
 =?utf-8?B?REx6eGlpYysxWnF1SUlqRTdwWWkzYXc3aWxSbjlnaGNTVE5UL1F3T1VGZCsr?=
 =?utf-8?B?M0dUMEM2SUdqcEEzb21TZmJ1dWpFSGxRNFJ1alMxVTNTUCt4dG5SSXF3MmVS?=
 =?utf-8?B?Z2loVnAvdzNjUnI3MVp2d0l0UExSaVhUMzVkS1c3dW55UGkyL29saWk3dW42?=
 =?utf-8?B?eG81R0RUNS9pZTgvTTcrN3VhLzgzKzJ4R1pYNmFQamFHSE9OWDAzNEpHV3R6?=
 =?utf-8?Q?1JBlS0f/ftnc56Cv60QLnHIonLOGR1MtyG2H8Bm?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d04d1fc-32d2-4c9a-c072-08d900c80e89
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2857.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 11:09:08.9422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qhUNn+Cu/62Uqg3c2jFoYKVi/YH0duLt5+QHZkbmt0VNr0yE0YPUmrkf4ZWV9cGQOfHgM0nuASMtKd1ib+AdEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4927
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9955
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 mlxscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104160083
X-Proofpoint-ORIG-GUID: pXiDtUx86P_OGo1i_g67bie3tSYY7CJE
X-Proofpoint-GUID: pXiDtUx86P_OGo1i_g67bie3tSYY7CJE
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9955
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104160083
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=darren.kenny@oracle.com; helo=userp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Friday, 2021-04-16 at 12:25:59 +02, Philippe Mathieu-Daud=C3=A9 wrote:
> When building on a system where meson isn't available,
> but installed manually as user pip package, we get:
>
>   $ ../configure --meson=3D~/.local/bin/meson
>   qemu/configure: line 6387: --version: command not found
>   You are attempting to run "setup" which requires administrative
>   privileges, but more information is needed in order to do so.
>   Authenticating as "root"
>   Password:
>
> Improve the error message to something less scary:
>
>   $ ../configure --meson=3D~/.local/bin/meson
>   ERROR: Meson not found.  Use --meson=3D/path/to/meson (absolute path)
>
> Actually in this case the fix is to use $HOME, not unexpanded ~:
>
>   $ ../configure --meson=3D$HOME/.local/bin/meson
>   The Meson build system
>   Version: 0.56.99
>   ...
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Interesting that some shells don't expand the tilde (~), when some will
in this case - but either way this message is a lot clearer.

Thanks,

Darren.

> ---
>  configure | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index 4f374b48890..088a82e3d86 100755
> --- a/configure
> +++ b/configure
> @@ -1987,7 +1987,12 @@ case "$meson" in
>      git | internal)
>          meson=3D"$python ${source_path}/meson/meson.py"
>          ;;
> -    *) meson=3D$(command -v "$meson") ;;
> +    *)
> +        meson=3D$(command -v "$meson")
> +        if test -z "$meson"; then
> +            error_exit "Meson not found.  Use --meson=3D/path/to/meson (=
absolute path)"
> +        fi
> +        ;;
>  esac
> =20
>  # Probe for ninja
> --=20
> 2.26.3

