Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C52830E3C1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 21:06:25 +0100 (CET)
Received: from localhost ([::1]:47748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7OPw-0005zr-3k
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 15:06:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1l7OMC-0004cZ-PW
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 15:02:33 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:40484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1l7OM9-0001em-SY
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 15:02:31 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 113Jsk5k124804;
 Wed, 3 Feb 2021 20:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=7dV0koNZwvdsBqxf6TiL97valGE8cU4AHRtXaOtc3ic=;
 b=XcMx/5YSuC8AWzf5QkTdFM3eA+dMSZIqMMEqs4YSDcx0jqtJ/07rM8/60YHHJwxs58Yb
 OlRozsBxyZLhG49f0DeMm4llLhEOLvp9DshthPVeRhkgYs+b9aeLplpbSTd9PECi9vXs
 DmDzdmr7fa7v7QmwMbp9H+2rsoWDATjX6SsPETp288VtMPcc5lDgwVqt7tDMUyI2LGS7
 +U+VPPWpPvCnlqzxqd0VovoxzE0xy5Cdbq7W2h5jTAKXEIon/WVe9i6fyOAy4/LAGCkH
 Lwr1dELQCFL96iU2upn10f3Do0Lo815I8Jtd8ltoTmT7+q0AZyn8ldaJWiliB4csyOSA GA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 36cvyb24ct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Feb 2021 20:02:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 113JuHRZ179808;
 Wed, 3 Feb 2021 20:02:14 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by userp3020.oracle.com with ESMTP id 36dh7u2m5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Feb 2021 20:02:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YccPtZE+8YkhH2dCitZh6RACeXw5V28qOsadSFKpJjIPLXozFJEdOBgt9FLLVAx9ATmkARzv9tv7vIHZ4lqhevSSAgU0p1F8c3bdKZS9OcCIxEjdNKarGbcTwlLf3nlww9MwpqxmIGZY7FPs5YGBZtoavBs1ijxxE9APAqHZaOLedapc9VFszYm0vxJ4Rakm25PhExVMdFpdO/yNT0sAqVeFDn9NLVMmjLxeREyWOLECun5LODfLn9XsTTLq7egR7IltLdPOv9w3jV1RFo15ZtQccspUyF+0GxEGMzIP7Of+UltXV4pCMTPChtZQiTiZtTi3IT+2P/Mf4iKGw7nopw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dV0koNZwvdsBqxf6TiL97valGE8cU4AHRtXaOtc3ic=;
 b=eJ9YvhjjH5nHVMpUbPts9z2Y6yqUJwdaBYFJPHtObiCFKOD3S5QqHu64qi/YITCnKT9vFJVbwZobFF98yExqess1rjVF7uU4VW0BzvE6joefsZfXAHRApqosl7zYL9zxFljuFFk36oJEbuVnMoTkcYdm7FATbTIhGuWh9MtvnnjpA/p+NBXExHUz45Nw7aJp0NPazgYzOL6H8lkwovadpRd2DMNsmzQ3BgjyKcDO5ZxDUsc5Z12pl79qdYc+Qc0zChH76Du1wpVQM61nOFRaT6kzS09IXRk5ggCJtiZaqoJsvVbFGFgdDgGKV/ES9kRhR5qs4DZdjEV60fGDbADrSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dV0koNZwvdsBqxf6TiL97valGE8cU4AHRtXaOtc3ic=;
 b=phwCes13nagDgbcLNeLq8yl7YlsapWWJ5s5XZrgU4HnBUrM0BSjARNpVEd8xTZACvPIV79r5LX/Jfz7eMZOEtYzAPqLJTpTU6TIdr27w+YvFV8wg7OeGXrANVq6ZB3dMFEZknwNQO/1T2nH3onK2iZQQ0FoRTNp8ujRIRv4M1XU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3915.namprd10.prod.outlook.com (2603:10b6:5:1fc::13)
 by DS7PR10MB5087.namprd10.prod.outlook.com (2603:10b6:5:3b0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Wed, 3 Feb
 2021 20:02:12 +0000
Received: from DM6PR10MB3915.namprd10.prod.outlook.com
 ([fe80::1ddb:2411:2a04:de71]) by DM6PR10MB3915.namprd10.prod.outlook.com
 ([fe80::1ddb:2411:2a04:de71%3]) with mapi id 15.20.3805.027; Wed, 3 Feb 2021
 20:02:12 +0000
Date: Wed, 3 Feb 2021 12:02:05 -0800
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v21 00/20] Initial support for multi-process Qemu
Message-ID: <20210203200205.GA29182@flaka>
References: <cover.1611938319.git.jag.raman@oracle.com>
 <20210203161150.GA241524@stefanha-x1.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203161150.GA241524@stefanha-x1.localdomain>
X-Originating-IP: [2606:b400:8301:1010::16aa]
X-ClientProxiedBy: CH2PR17CA0021.namprd17.prod.outlook.com
 (2603:10b6:610:53::31) To DM6PR10MB3915.namprd10.prod.outlook.com
 (2603:10b6:5:1fc::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from flaka (2606:b400:8301:1010::16aa) by
 CH2PR17CA0021.namprd17.prod.outlook.com (2603:10b6:610:53::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17 via Frontend Transport; Wed, 3 Feb 2021 20:02:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2aab1616-0e57-4c10-d103-08d8c87e9804
X-MS-TrafficTypeDiagnostic: DS7PR10MB5087:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR10MB5087A07A29BB02BA8AB7C88D8CB49@DS7PR10MB5087.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3dA3bh62Gvd0LmNT8chv6a12OCil7E1M7/yztZVrxUj6PouUhA9dn60qbiUbpkTwrDYlDPthxsj14pzkePe6w1GK6mW2iDyjymFVjf4phzS7Kf2TUBK7XaS4k3LORZ3KrE5Brm7Z2i9JbPHb2KJkn0ZdN1+AysDig5k0qPT/UafLkTT18ibA3pnhC4f9E9RZZ92XnwYUP77zecADBJ9C29v9eUMbsWP6DFy/g5D3WNstObIMNVVBAZ8KnRJyUpUpCCRP84K0bKnUDyBAVaWsdMJMDHPHoCZOm/VePTq8oV/vHg/ePWgAfqMfEZBPyR1INjrELcWDJ44ISabmAoUkkOj4P9sr3kIQhQxVMxL9PB+q2nXHSYKE8vf7pODO/hyHsJuHiLY/ZRfXodw88xf2z6U8it/sRAvyfIh/eKdECLdJBxtINhhe0c2qcu+6IDYRBUuLrIJjefskJ2wbf3+LbpBSSaDnbMDY+fNsRlfwq+9CnWd0WY6DgT/pLfDedXq1P0Mk9YCP8z9iIEReed78t5NF7JsFjYpbvXj3WinvqVMBn7TpsUbIuSv4iihX6Y+ctk207qtL0FCEH/fVS4rzrAtgdlQu/zyfRpbi1iRgRrM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3915.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(396003)(136003)(39860400002)(346002)(33716001)(966005)(66556008)(478600001)(86362001)(4744005)(83380400001)(66946007)(4326008)(6916009)(5660300002)(2906002)(16526019)(186003)(66476007)(44832011)(8936002)(6496006)(55016002)(9686003)(1076003)(52116002)(33656002)(7416002)(8676002)(6666004)(9576002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qDu1Xt+VXPz9tN/wL5Hio3H0KeT8rzxczxOeVNfoZxZRxv2XSSZtEr48qCIq?=
 =?us-ascii?Q?7Eo4Uc/WvFC/mNZ60ogqdytvJP7zriH8YTtuTJ0Ueyydo6gkJPaWGzvOeh6w?=
 =?us-ascii?Q?m62diguXDpjW1FtCAqHaePsOHyz2oNxvtmk2+q0ykrpKC1LlO9bReK/WGIJG?=
 =?us-ascii?Q?QzgVLRd8ceMRYSKthGLP3olIPzFpw9eo7nVJjn5GBquu+jx1NvRXNQu+7znv?=
 =?us-ascii?Q?vFkujlE04OozeZK39iRSurRtflm7XxQ4zjtMBCIQHicx/a7cSoMI6BNga9pn?=
 =?us-ascii?Q?hd5tYxug/9DOXBNBBb4/q/Qyb/fLOm9KFmN6qDGtPfpENEk76gJ/PRfUXFl2?=
 =?us-ascii?Q?6y+ESSqng1ti7kkz7rXTtoiTAtqbcIitPjVejijBZMxzycLIZAJ3HwZh3dE7?=
 =?us-ascii?Q?oozPKfrGFsuLYb767UfobHbtmXEk/EhJLAsK8cabzhXLcgzSQ9HTYvLDMBnT?=
 =?us-ascii?Q?Dz1F+d4jcSS/yD/UrhpvwqtR63ysJh3NzDej2VRbzfKFq5mno0OW1i6ie6l5?=
 =?us-ascii?Q?UVz6mXn+1QFZtJNUkbzFP3ad+R8942baiRN9gQd7XmtW96yL9xBDrZKNgsFb?=
 =?us-ascii?Q?8AGsyhwim6VvOHOB8wPpil/J6KFoubtcHv92KqKOSV4qoMTw94sJdAlf6zhV?=
 =?us-ascii?Q?ibiVGtggjFF/dT3xT/0svFm5An8P8laHlsiOT3KCBLXruHBF/LT7sZvPppID?=
 =?us-ascii?Q?jLiL/ZqNTpm8+3vKdx6oE6vA21jVBJy+zDtIbMY6m8aMGDnoXsyZo8pxQT9U?=
 =?us-ascii?Q?YaTORrEYtSSrZlH1ijYLQlEHl2mTXkk3kQr1E6NHgVeqg4cmG9tXzMotF7AA?=
 =?us-ascii?Q?pQapPs6sRKhOJChf8OQu+mOnPPPosM/qT7r+dU2/KJAzA2U6v3EpKqmN/A/i?=
 =?us-ascii?Q?r/yQqKQX8O2fSKcT1Dcel3ZBNdFqyN3Ib9L2k6h0AF4zepoSqcX0jiFjsdSR?=
 =?us-ascii?Q?QEvawrYIiOJINpowfaX+4QhS14GAljmOxfGxAPL5KQLqvpRa0dcWD+LQEiSH?=
 =?us-ascii?Q?1OGp0BSR5o4EeNP2RDVGRp4x4CeaPvi2h1KO19iHY5CeY58ibL1DnHnJfDSh?=
 =?us-ascii?Q?CQVNHJ1fLw3Qhm0EfrPWmrNN8cfihueowu7HpCqJM9Krf4JNZME=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aab1616-0e57-4c10-d103-08d8c87e9804
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3915.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 20:02:11.9979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6njZoHvdPFGHQj8AJh/a6SxSlPguhYCq5q98CxnSn4zXl5Mr5IqJNROCPMPeuyVYc7lq2T4q6u29ePSQxNAZw50cZZqaT21HJoYuqBHQaFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5087
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9884
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102030117
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9884
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102030117
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=elena.ufimtseva@oracle.com; helo=aserp2130.oracle.com
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
Cc: fam@euphon.net, john.g.johnson@oracle.com, swapnil.ingle@nutanix.com,
 mst@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 Jagannathan Raman <jag.raman@oracle.com>, quintela@redhat.com,
 armbru@redhat.com, kanth.ghatraju@oracle.com, felipe@nutanix.com,
 thuth@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 dgilbert@redhat.com, alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 04:11:50PM +0000, Stefan Hajnoczi wrote:
> On Fri, Jan 29, 2021 at 11:46:01AM -0500, Jagannathan Raman wrote:
> > This is the v21 of the patchset. This version has the following changes:
> 
> The docs/multi-process.rst file caused Sphinx to fail with "document
> isn't included in any toctree". I moved it into the system emulator
> documentation to resolve this. The new path is
> docs/system/multi-process.rst.
>

Hi Stefan

Ah, we did not --enable-docs and .travis.yml also disables them.
Will include into the tests we do for submission.
 
> Thanks, applied to my block tree:
> https://gitlab.com/stefanha/qemu/commits/block
>

Thank you Stefan!

Elena 
> Stefan



