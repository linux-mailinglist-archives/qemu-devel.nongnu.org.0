Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C0A314393
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:16:40 +0100 (CET)
Received: from localhost ([::1]:34022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Fln-0007BQ-DM
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:16:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1l9DcD-0000tn-4X
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:58:38 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:56650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1l9Dc5-0002mQ-03
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:58:36 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118KvE5e047006;
 Mon, 8 Feb 2021 20:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=fpbRO5Pj227pJ+mfHgzCx03xnvItbs0J4YmY3PU2Xt0=;
 b=DI3FZOwwhFfOqKGRz15TTeB7UaI4YVtj6cpVesSvE/IDWsB/xp31urr2i1S0yiv+pb0z
 0CGZ98E6cLY/79NvjHV5ae1Hj0lxFj3SruMbXPXc5g9unanW57PGib2xPhfWsTcJcxGo
 0mQYutF3rKSp8LQoYFku2UKjZ/K9ltm4b0Awd7xGalx+/crXn1Rgcyqonkg6OnpMfz82
 HlZtIg70TFcczJE3AxpiIIMhqdCO/O35H9P2GOI4Q3PZX18b/wXgfr56M41Fj1S9Jm8G
 D0iPmWpKqF8cD093RUv4T8yIxDc/rn35uyOgmyPSfAaC8WcfgdNMFxuSEdsCnS9wykKN Dg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 36hgmadg8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 20:58:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118K4uC5009231;
 Mon, 8 Feb 2021 20:58:25 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by userp3030.oracle.com with ESMTP id 36j51v5s12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 20:58:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4bF3WhmS8unFZwGeIJizG1KQzUdWNCxabq3y3rsecLFOOW0GARcEfzWHimf3RpblHdNYb7BbahlKWdW9/vU5FvFhePyu4SlxXrFGFXllrIE4rRCghU82yjn/k9+m45F7t69ozwhTEWZzQHI2A3nWiAy3Y2JHvfeautQQho4SIA1T+XDaBcgn1QDumPmlFRQ+Vaa5+ZKNnA2jFkRBkdZDJ10mItTCMgkmx9zIg9luEPReSN5SOE5cIM5pAyqsm1x6hEeLBM/VnPBx2YxsRFZha1I9DbOCJO8IXXWN2vHlRBo/p8I2U93L0SGzFj0HXwdrcpFUiwQ7if2nJq/XLHqdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpbRO5Pj227pJ+mfHgzCx03xnvItbs0J4YmY3PU2Xt0=;
 b=YkrmfH3tSRJuic6VAVY7RdbdGxPt7chZ7vEHAdbHy/TlYrJfIS8dLW7FlK2Vmvz2pc2mIPxgX9if1cde7xuEljBqVJ4awcKKcl86t9LYg+MGMs5g5JDR7EhwLjc1XBXvzdx588nQRLUOzkKSGuXCXmjSJMfyQig7E3V/cKZ0OIClqvzvVcewN1hhyNH324ycXzA9Puq0gCpEl83ZJyO2MzVpB6c+e3DBW24kdeedP0APWfN52t4gQS+7aN5RlblJzrLGArnSc8RW/HW0juxB5nl9SYd4p3qhRgp2LYwo1UBl/uSnDsrnYiG5IzFvtVzOI8FMf7S7I+eKVwjbFLlD6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpbRO5Pj227pJ+mfHgzCx03xnvItbs0J4YmY3PU2Xt0=;
 b=YbgTnvvn1eQWZP8eS3dV8adtcaK+2d53D8Ycb82QQfeU5YOR2qr1qABFGuqQH8yS6ef+CwwDhd3BlORUgGAF29lPrctoxLfGraQeHHc5TT726sKzMGmIJu9O/jSwZdc0TXUCv8AyAa9Q7CS+QToopXFHqq5H43Z/kV8Ajn7LRC4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1599.namprd10.prod.outlook.com (2603:10b6:300:28::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 20:58:22 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::1193:5eb7:7993:85a2]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::1193:5eb7:7993:85a2%7]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 20:58:22 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: mst@redhat.com, imammedo@redhat.com, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH v2 7/7] ACPI ERST: bios-tables-test.c step 5
Date: Mon,  8 Feb 2021 15:57:59 -0500
Message-Id: <1612817879-21511-8-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
References: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.23]
X-ClientProxiedBy: BYAPR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:40::37) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.200.23) by
 BYAPR04CA0024.namprd04.prod.outlook.com (2603:10b6:a03:40::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.21 via Frontend Transport; Mon, 8 Feb 2021 20:58:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 961f7cda-26cc-4921-4111-08d8cc74455f
X-MS-TrafficTypeDiagnostic: MWHPR10MB1599:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB15997BB86B40E8F4154DB794978F9@MWHPR10MB1599.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wJ007RpxZOTQ+GQxCMgTVCIyLnVSRAM7l2ZB4aNUOXR/rN9guaFIeFpQLzM8YGdFGIHQ7OnhkA2F6NGs8FxfrrM05YsfJOzlfALDHMfat9KiRNidbHmM3E4UPoLitESe4Ag8vWc3cDkeiIDjUvW7P7FicLcOUnHOXP0atyD6jGY3vm0IAW5X3Mc9zzKl+mUwRIf1RB1Zwa74S+9O6/fQGpxs0J2bs3d/WSfM6uEq5j70C4RcKNdAys5CiR+EutZ5tenAAQKuFXG5AkNSkh3FdnMc63oEj+UrvEjjRtghIkFb9SZT2OTUHTJ8ZePjARq+42eq9dxCvYYCT+IUQDOe7P/t4V9RjMS3aIEkIkHbenetKGuySH4HWDQZ/5HePts53RoD2gl7wHcqgQVsEpFb0WNFTwD0Xe9op2+6065Z5jz1+NNW5eQzUDsI9kYrb041Se9+XcRbmLyHaYj2aqI+mq7KCZjxlg4bmOfuhfYEThVF3Jvj4p5w1bScbm1d7nL1qUEiHlJ3r47KeYZ6ECr7tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(396003)(346002)(39860400002)(6666004)(4326008)(316002)(2616005)(52116002)(186003)(86362001)(36756003)(16526019)(956004)(5660300002)(478600001)(66476007)(83380400001)(107886003)(8936002)(26005)(66556008)(8676002)(66946007)(6486002)(2906002)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?v5negZB11iU30RL2gjqM3CviZaxQrgI1ctEqlci1RVhe+nzTXo7zPUxURXJc?=
 =?us-ascii?Q?+UcDR2c//H+4eLW1gVdugCjh61bK+HkhUafKDd51nD9v7PKf7f6GaidtPP4e?=
 =?us-ascii?Q?x0MFRpkBwwDm0q5uKwU7EUO0jLaBg28IRn53b84MTIbd34BN55h6ACdbDBRN?=
 =?us-ascii?Q?++UiMJqlmSdDDsDUXLjalnm+LO6/7udTfaL5CNtGz5gWDyezOXZ3uGGHSTUB?=
 =?us-ascii?Q?gZHHy9Aj/ELOQBcIWnEGtXttub4byXTrZTGyfiGTKWe8vSMhNTC20vN6yutm?=
 =?us-ascii?Q?GLHieowfLAzU8gZOm+QboU1+iLfv2uleCvUtJSgLSRwn3QE+coWu2Uh1M5no?=
 =?us-ascii?Q?BmBIgbVV6vS5lbgWWo5tKm4p59kCjemYFZhd6aVyZff0HfNEDm4JdnJkzVdH?=
 =?us-ascii?Q?L1tI7iQQoqCJC4UjXztxbxKc1NuhjAD45TuJmK5xW/iYIH1R0JmQ4FyedtDk?=
 =?us-ascii?Q?LsTzqVYee0v2inap7JFyS4cR7psi/Lg7brmpPJEP5wDK2hziT5DSXBRntYXg?=
 =?us-ascii?Q?pgMNu1mhjNntC8x/XEUIHizXVe7H7NlvfTEd/DYudwi+Chj0nO4E3kyrWdB5?=
 =?us-ascii?Q?DlIq4228tUzvp2QJMHDb5YP4W+f7KmQZE16+pqoU0suBBRzh/g4OXHzwdu97?=
 =?us-ascii?Q?olw6iX/wvwQm84vTrQyBhCkJgnO5jBYAr2PO3D0UOHwAYd1JZ3Cdtam1zCQJ?=
 =?us-ascii?Q?VntVO35Gke3dNHofdi6yvMvP0uy8EzHWxyw5lsWvcETMtttgpnPpLLwikGD3?=
 =?us-ascii?Q?JXMkCzr6idGlTmL1HR5jM0uRPIH01wGpnRyT2R7hVZsPzi48gO8og4tCPgl3?=
 =?us-ascii?Q?wmxobkE1dBqHVOSnDDj4PS212oea6MttWAbZ7pgFpKi+igM4hheQ90wr2x1r?=
 =?us-ascii?Q?lYa3tg/gxFmkAdyAFS9lvDijT88VtnizA2ebLZmoVNH/p6zxYlk4baKQpZAJ?=
 =?us-ascii?Q?Rd8+eNePes8YG925sDUoySsGyFa3L7NqZ2bAgGW/pdIhthzuKp1DqXGO4+st?=
 =?us-ascii?Q?dnSAJvgU5Pw/L8WkIPi1L8r+8DkHPLTUOHntfYPC2lQYKxWP9UcEVNniCBs0?=
 =?us-ascii?Q?Kz+A1nZK9oIWB3aTU78gcQPdet3stFRY/IsGNhsqJkuu/kx8eKJZAYAi2rGR?=
 =?us-ascii?Q?RHZ0IjsUaGL6TlisLqAhh4IZbu+0LYpeH2rX/Mye7Zom6w7Gldy7+pwsK57i?=
 =?us-ascii?Q?mDPIsgL3MO8bi9LxM6yOkmaLrflYXQvxiunDNh9bXUbcOi4LLupt3YSt/W6e?=
 =?us-ascii?Q?hQGuLtr4Je1d1hatzC9bj+ZR6PQkce8bYCBwv8Hv2AzLhy90Bf9JawNOwhEf?=
 =?us-ascii?Q?aKcxWPxZDISbDde3VP+rtia+?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 961f7cda-26cc-4921-4111-08d8cc74455f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 20:58:22.7099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfoYPNRVBMYT5k5FRwFIBGJR0z2ZDMggwAQhi1CcX7EZT8SUGEJKzoTa3MAqNaF9HDukcXTo1g00RPzlYCQGbg1A6S+gELRKlLTiCkKPkqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1599
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102080119
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102080119
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=eric.devolder@oracle.com; helo=aserp2130.oracle.com
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
Cc: boris.ostrovsky@oracle.com, kwilk@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change is step 5 of bios-tables-test.c. This change is the result
of the output of rebuild-expected-aml.sh.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 tests/data/acpi/pc/ERST                     | Bin 0 -> 976 bytes
 tests/data/acpi/q35/ERST                    | Bin 0 -> 976 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 3 files changed, 4 deletions(-)

diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..fcfec715478919a40b23aa20fe90b5dc74114f58 100644
GIT binary patch
literal 976
zcmaKqSq_3Q6h+HC4;wIH2`<4vNc_`?A1=;C>4wDK(pSli@Dhg0>1lbC@iyIGfl{8=
zUxxG4^^fZ?>Svx(3ir4k^?^Fzq{pfb=l2IuYPL5Xarh|VK5>7+jt9gMQR0UX^!h2U
zKhI`JNPcMSpC4H+{&Ry%e-ZJR=8u`9;nn+b{|WgC`6jP?i(UUI`6>A(pHwLQIbVMt
zREF=j$7%kI=Ff@e%#r`Szg`=tAiuyvU9!I=@p8eASHvsk$UFVj<k#ezyy0VLLw-ZP
a$vgeG<hSITys<v^uazI#{{Q0JY19|)NQVIc

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..fcfec715478919a40b23aa20fe90b5dc74114f58 100644
GIT binary patch
literal 976
zcmaKqSq_3Q6h+HC4;wIH2`<4vNc_`?A1=;C>4wDK(pSli@Dhg0>1lbC@iyIGfl{8=
zUxxG4^^fZ?>Svx(3ir4k^?^Fzq{pfb=l2IuYPL5Xarh|VK5>7+jt9gMQR0UX^!h2U
zKhI`JNPcMSpC4H+{&Ry%e-ZJR=8u`9;nn+b{|WgC`6jP?i(UUI`6>A(pHwLQIbVMt
zREF=j$7%kI=Ff@e%#r`Szg`=tAiuyvU9!I=@p8eASHvsk$UFVj<k#ezyy0VLLw-ZP
a$vgeG<hSITys<v^uazI#{{Q0JY19|)NQVIc

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index e004c71..dfb8523 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/ERST",
-"tests/data/acpi/q35/ERST",
-"tests/data/acpi/microvm/ERST",
-
-- 
1.8.3.1


