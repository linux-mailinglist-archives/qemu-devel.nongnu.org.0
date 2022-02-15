Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82434B744B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 19:20:06 +0100 (CET)
Received: from localhost ([::1]:33698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK2Qn-0002df-Es
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 13:20:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nK2ND-0008Nf-Qo
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:16:24 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:41254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nK2NA-0003cC-Gz
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:16:23 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FH3njV012238; 
 Tue, 15 Feb 2022 18:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=xeJRgtuIOoDaOLiCtjJgQsYNeiqEzwZ+qZHS+7DEJQc=;
 b=MY1a0aNFo+6XjkQVY6EJDxCcFtizvyBGcvngxv1dajQ/JUfa05a09JMXY/XEgvzamky7
 WUaKKchonaJ2iyxNzQimG0xOuP9DleGTqYgW1ujlVdcL96QD9LtH76RW2d0jq6oQxoug
 MMBl6aKwU0duHnR8kOI/cvEvMAJa8UICLvKI5aR6QinYfr+5/5bZvbPBCngYN4bk0sMV
 BVu2p0udpT1ihzHT9OdzOv3Koy8E2JVh7sa+U7QKyZLjitS12k2IEEwr9Ay6sa4o5/8P
 mAwmj+7dh9AdwUpQjdQcjbBehrmxUWd+ugdsrFsmP32Lr9A1yq4+x8leyRRRNMr8FAWl rQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e884r9wmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 18:16:13 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21FIBBLS086405;
 Tue, 15 Feb 2022 18:16:11 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by userp3030.oracle.com with ESMTP id 3e620xfku5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 18:16:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsKMwlDHdZUEqYfbAhg4MnPSaL69pItlRxRTYoaTLxHcTnzHwiA4KICnl2uqyk+c+fcqAY3ncQ3vZiC7Hg0IeTlONKCoi6KBk/Bmuz9YS4e0yAg++BECY+H3KWqJ5YN8BIBCXgz5XtfuQJHMBSQQrWf0tCzexhHJf33eMDPJhfR6zkH40P9JfAVCZA+K5+lHGTru7ShRSAlBa9twDW/bDgLqrsqtaSnlB821WQY36jqsMaiBuBoc0Lo21HIC8M4a5vcRlPvKk7jzaDZCmUpTk888WSuFmqwdrahSSjb29pHnNGnLJHRyPgRBiyB+zBh8zzVyd8jEIOufoXfqrwbkMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xeJRgtuIOoDaOLiCtjJgQsYNeiqEzwZ+qZHS+7DEJQc=;
 b=TM4HRZ2uQ0AUI+k31nkoKILHFBqLHpedEGeRXq5ZIrrbxJWzl/4g1f1Eui/anF8xxFkgA1LhQAXn95NXHrmclXUrYtgtSonW4GYuRQYJBo5OkNvmR8WfaDDz6F6MZ7vnsNsdSxMhCBtduaF/J8odntGCcveuOS1f6K7zwYaT2uWDvjk7IviS+jQWsW5Tjb9IcMwwQQK/ihP6JfF7nDkH/erHDwsvJmwm7Dv2aUALOIcL1foW7bv1MfykEZW00mHXPl3DhacSr+oyx5Xdz1b2pEcAOWpnbw7MuPLxAOmg8rzhywoU3RrerCS4RjqL0AK7MqHVlFzrjD0p2f6cezvw8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeJRgtuIOoDaOLiCtjJgQsYNeiqEzwZ+qZHS+7DEJQc=;
 b=gMK57lK/HKQye5wWruSsPboL93D+ULyj0xTku7nLMbjXsTXFtNjMS2JzQo7cQeuDDjWF9WtxYUYt+76MiOEy25gH0uxAXuXXZ1eJTEb82YAMza07LPvDpMbtF6n4yIC2o3n1x7pozbaggpsBs6fqz1Ou0gfKLJ1vicZeWiu3hj0=
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by DM6PR10MB3963.namprd10.prod.outlook.com (2603:10b6:5:1f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Tue, 15 Feb
 2022 18:16:08 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81%3]) with mapi id 15.20.4995.015; Tue, 15 Feb 2022
 18:16:08 +0000
Date: Tue, 15 Feb 2022 10:16:04 -0800
From: Elena <elena.ufimtseva@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC 0/8] ioregionfd introduction
Message-ID: <20220215181604.GA33858@nuker>
References: <cover.1644302411.git.elena.ufimtseva@oracle.com>
 <YgpsrdhBKfhbXPnG@stefanha-x1.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgpsrdhBKfhbXPnG@stefanha-x1.localdomain>
X-ClientProxiedBy: BYAPR11CA0077.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::18) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 516ccce5-7959-436b-8d10-08d9f0af3cf2
X-MS-TrafficTypeDiagnostic: DM6PR10MB3963:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3963FF9F7D8AC9FDE8E32F7B8C349@DM6PR10MB3963.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nCDnzi9JLQghZBhW5GNz1TdVqTk1KKrgAf/dXfLmXq6M0iP3YpnFJlTAYEpFYYqdItMoGM78nPkQcpP1YpXtQfj0BUtukm3i+UTxCwVEypEkIe9JGx11X4yZ7Zm/as8X+VrxKR3wcJRI8dEGP68ti+o39fIc2nbXRcYidaVkwbnAyOuVVtbDIkGyAH5AsKzXNN/Fncfz0DwxI/4Vp2A6ClegdtnBt07jbcJJ2OphitJEvGlSyBOVnzNWORtUNZ3FTy35BmE7WBQm8Ufs7I5AAFbCk45mALj/o9VECVOnvMZFSYaeU31GLzaGB9M4lY2M/hcZYaOQhsUV9uyT9tBE+mhKy2hgbTg3lTbVhaBcqiVo7AZQddzfbeUCoddpO+RFUUgClySIwTt8bTh8qNzqClhjPRCjLRapJ6URGieSkOkrKiywh9vnQ+wHqGa8zy9cHWvhlXwOUYyLPsVjHyGdfP/F/BogaKSkATY8xGWRBidr1jvFbVlxWo+YO3UClJNKH7S0n7EqDbrQmpHQNT3LI3tuX7OvrCz5CXzeUHitw5naS1I1lizEE9/C1SW9n1S3BiRKbFwa0z/nSG7aPBtDyqcdzI5Zk9/+orskID6QZwIvC3zGB1uUzk+ssgusUVZKmxQbsisVgwXpaxRPdD6sNQWygkjzLyag+vzEwB2oyQ+2TKC3bdCE5HoaE+0lfrFWpOohArNQPHJV7bPyrnn5nHvk4W7uA7atZOe3pNwMTeAiAIyW3jrvj4fMpXBH9OPQ5fILLhCwci0gM/mSBlAk1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(186003)(966005)(508600001)(6506007)(66476007)(6512007)(66946007)(7416002)(4326008)(8676002)(33656002)(66556008)(6486002)(6916009)(2906002)(316002)(9686003)(86362001)(1076003)(83380400001)(5660300002)(33716001)(38100700002)(6666004)(52116002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CQoaQCPPVKVZl7lTogHPu3DNjf4m0x9vk9lNs6AoAwm8Qzlvi/kZNAe3fiPj?=
 =?us-ascii?Q?UoxF879iwBNlyH+Zho+7MrCRMaAAIkeiPLuX+lM6+nwietCS/8VrA0NINIKi?=
 =?us-ascii?Q?P6q8lQKXFj8M3hd3XV2zgTs6AdbHoyTCJv60lafIRQcep5W94EsKqE1ybs2W?=
 =?us-ascii?Q?+h3VQRL16gk+3PmJXUSC1sgdff/mRR6CAs80a3QNLOHuNzpiNK1m3ZFu2jzq?=
 =?us-ascii?Q?gw2F01fe57BBNS8TagLS97XghUUULv/k5pD3YDBWjVER9xYTKfyx4rbZahdy?=
 =?us-ascii?Q?e33sTTgsMICAPFHdN2T3A5AyaZLbY22nA9QYVSMG2q7Jbi4Jf3BkTNcjtLRc?=
 =?us-ascii?Q?YH+vEx82kptOZF9mW7cUqyuDN4lHFPNGWYnIv0kC96RbBJ4swp3b8HSZQtR9?=
 =?us-ascii?Q?KWBtJNNNcaryP3ri44y9iZ13hyIPJGBhDMKYpPJglb+qyvX5UQ3y6BqsX7P7?=
 =?us-ascii?Q?g7FQvRLZSXVRkbxN3RT8N2Qbm+Fdpmh8lV6KSwHmhjxDImfQ4S5kNGMHcYEf?=
 =?us-ascii?Q?9OjcdXqfSADkbvBtc2dwU59OCavSIThP206d02c6X7zkaernEP/t+Odg7TpZ?=
 =?us-ascii?Q?KelF3Aze7zluw/ChQuv3yPPGW701vYJEBezukqe7WeTHwl+KxTeK9PzhGfzL?=
 =?us-ascii?Q?GCCszbedCCiwtCdPReXisI67HczBAXo1wIs0/JdP46qjvdJYUrFArTlvawMr?=
 =?us-ascii?Q?LntzlB1bpo5Mha+M56Kk9AK7donW7A8H8uK2LDVWA6ifGSqTxaKqoLEj9Bob?=
 =?us-ascii?Q?gr0GCRW3c1AVgj5veZQDvEgv6Ts3cazkSlfw/EgSEaZicriFy3wiLwgeEvDn?=
 =?us-ascii?Q?eGMPfXTgDg6XlJjehP4+A14cFN1TbA7vnAlBVkhcKR6YKlxVN8lYv+mdPhLy?=
 =?us-ascii?Q?CanoMqt57KO3kwE0Y6j8f3VVJTMFqOB/39jBOxi23QiTNZ2GpQxRUtNd7kiK?=
 =?us-ascii?Q?/iTrCd3PDqD7DsqyYuyTfVJgT3H8M603KhyovIrtinHrFbQWD30OvIkHKYRE?=
 =?us-ascii?Q?6xgmMcAHD7FMpvaCMiPKn59G9MwyDVvfkPGj7dyMH2WR8vyIXaOce7Iu6LBF?=
 =?us-ascii?Q?E+4oPUmPjN9SDRWOkwZHDiadPbrVG4QzULvar8p+OC2PX84b5sZMumapvo2h?=
 =?us-ascii?Q?fbCnK+P7ohzZS43dMLSr9+ZGT904rOeiMbacVhUApqP54BmNxfoTgcgosZ84?=
 =?us-ascii?Q?b832Jd3lvZ715vCE3oKCsNc8WZGE9Res6T9OfEGz/+/qeP9HTyvCe4ESXnxG?=
 =?us-ascii?Q?Zao9dikuSydi6ylx0j0n3v4wFvTQcr6GSxFC5Mgu53ktmUAvjwK1eRXvESIT?=
 =?us-ascii?Q?xh1gEdNiunM/fGqd8qcLt3R+t4poi79hScAn2CnD0qtK2YjvmQa+H6+/Gt41?=
 =?us-ascii?Q?qAuVfohyRwp3fdqi+jdeKG7ZDUmSS7rV3ZisLi96qi/ZoOYiHIOxNOWpVLnz?=
 =?us-ascii?Q?4NCqCHd/2+9cAJ+33zRd7zas6fzp03JgLELS8SLTY0MyO681lbdl5Bgm/Yuc?=
 =?us-ascii?Q?1LWRw1oOJG30F8SUBPo+QopsI1t48xNCoqObqpo6Vz/vn1iZZ9E3F8JRbpiz?=
 =?us-ascii?Q?r87cRjJzxgPBFb3weLrY5Pg4VnohCIJhjdI+tHOSXUL8UCi6AX2+W8zRt/Lw?=
 =?us-ascii?Q?Yk7qC0lZjYBpCmVEgCB/xCMpa1lLRVy8CMpWmswKjxEjY4kDRu3S1q86yt1O?=
 =?us-ascii?Q?BlkjKaIfL3awTGq1Z8PQGxHVaDRGMEft1CDJgeH1uH7muuHg86He0yUzDJMe?=
 =?us-ascii?Q?5awCe+nIsQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 516ccce5-7959-436b-8d10-08d9f0af3cf2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 18:16:08.5232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W54FmwkK+lknNr8ISCPBkf8c0RNX0PuEGwSmhq6ANRQQtenmy+80ZLasK3zmnPBUI0RXOGVM1y9s+UPjH3ieinCzJfoVnKw2/F4m3L+7V5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3963
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10259
 signatures=675924
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150106
X-Proofpoint-GUID: D1wKueK-FUqw7f8PCIlPjFuME2mB-YRo
X-Proofpoint-ORIG-GUID: D1wKueK-FUqw7f8PCIlPjFuME2mB-YRo
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, john.g.johnson@oracle.com, cohuck@redhat.com,
 jag.raman@oracle.com, john.levon@nutanix.com, eblake@redhat.com,
 david@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com, armbru@redhat.com,
 mst@redhat.com, berrange@redhat.com, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 02:52:29PM +0000, Stefan Hajnoczi wrote:
> On Mon, Feb 07, 2022 at 11:22:14PM -0800, Elena Ufimtseva wrote:
> > This patchset is an RFC version for the ioregionfd implementation
> > in QEMU. The kernel patches are to be posted with some fixes as a v4.
> > 
> > For this implementation version 3 of the posted kernel patches was user:
> > https://lore.kernel.org/kvm/cover.1613828726.git.eafanasova@gmail.com/
> > 
> > The future version will include support for vfio/libvfio-user.
> > Please refer to the design discussion here proposed by Stefan:
> > https://lore.kernel.org/all/YXpb1f3KicZxj1oj@stefanha-x1.localdomain/T/
> > 
> > The vfio-user version needed some bug-fixing and it was decided to send
> > this for multiprocess first.
> > 
> > The ioregionfd is configured currently trough the command line and each
> > ioregionfd represent an object. This allow for easy parsing and does
> > not require device/remote object command line option modifications.
> > 
> > The following command line can be used to specify ioregionfd:
> > <snip>
> >   '-object', 'x-remote-object,id=robj1,devid=lsi0,fd='+str(remote.fileno()),\
> >   '-object', 'ioregionfd-object,id=ioreg2,devid=lsi0,iofd='+str(iord.fileno())+',bar=1',\
> >   '-object', 'ioregionfd-object,id=ioreg3,devid=lsi0,iofd='+str(iord.fileno())+',bar=2',\
> 

Hi Stefan

Thank you for taking a look!

> Explicit configuration of ioregionfd-object is okay for early
> prototyping, but what is the plan for integrating this? I guess
> x-remote-object would query the remote device to find out which
> ioregionfds need to be registered and the user wouldn't need to specify
> ioregionfds on the command-line?

Yes, this can be done. For some reason I thought that user will be able
to configure the number/size of the regions to be configured as
ioregionfds. 

> 
> > </snip>
> > 
> > Proxy side of ioregionfd in this version uses only one file descriptor:
> > <snip>
> >   '-device', 'x-pci-proxy-dev,id=lsi0,fd='+str(proxy.fileno())+',ioregfd='+str(iowr.fileno()), \
> > </snip>
> 
> This raises the question of the ioregionfd file descriptor lifecycle. In
> the end I think it shouldn't be specified on the command-line. Instead
> the remote device should create it and pass it to QEMU over the
> mpqemu/remote fd?

Yes, this will be same as vfio-user does.
> 
> > 
> > This is done for RFC version and my though was that next version will
> > be for vfio-user, so I have not dedicated much effort to this command
> > line options.
> > 
> > The multiprocess messaging protocol was extended to support inquiries
> > by the proxy if device has any ioregionfds.
> > This RFC implements inquires by proxy about the type of BAR (ioregionfd
> > or not) and the type of it (memory/io).
> > 
> > Currently there are few limitations in this version of ioregionfd.
> >  - one ioregionfd per bar, only full bar size is supported;
> >  - one file descriptor per device for all of its ioregionfds;
> >  - each remote device runs fd handler for all its BARs in one IOThread;
> >  - proxy supports only one fd.
> > 
> > Some of these limitations will be dropped in the future version.
> > This RFC is to acquire the feedback/suggestions from the community
> > on the general approach.
> > 
> > The quick performance test was done for the remote lsi device with
> > ioregionfd and without for both mem BARs (1 and 2) with help
> > of the fio tool:
> > 
> > Random R/W:
> > 
> > 	             read IOPS	read BW     write IOPS   write BW
> > no ioregionfd	 889	    3559KiB/s   890          3561KiB/s
> > ioregionfd	     938	    3756KiB/s   939          3757KiB/s
> 
> This is extremely slow, even for random I/O. How does this compare to
> QEMU running the LSI device without multi-process mode?

These tests had the iodepth=256. I have changed this to 1 and tested
without multiprocess, with multiprocess and multiprocess with both mmio
regions as ioregionfds:

	                 read IOPS  read BW(KiB/s)  write IOPS   write BW (KiB/s)
no multiprocess             89	         358	       90	    360
multiprocess                138	         556	       139	    557
multiprocess ioregionfd	    174	         698	       173	    693

The fio config for randomrw:
[global]
bs=4K
iodepth=1
direct=0
ioengine=libaio
group_reporting
time_based
runtime=240
numjobs=1
name=raw-randreadwrite
rw=randrw
size=8G
[job1]
filename=/fio/randomrw

And QEMU command line for non-mutliprocess:

/usr/local/bin/qemu-system-x86_64  -name "OL7.4" -machine q35,accel=kvm -smp sockets=1,cores=2,threads=2 -m 2048 -hda /home/homedir/ol7u9boot.img -boot d -vnc :0 -chardev stdio,id=seabios -device isa-debugcon,iobase=0x402,chardev=seabios -device lsi53c895a,id=lsi1 -drive id=drive_image1,if=none,file=/home/homedir/10gb.qcow2 -device scsi-hd,id=drive1,drive=drive_image1,bus=lsi1.0,scsi-id=0

QEMU command line for multiprocess:

remote_cmd = [ PROC_QEMU,                                                      \
               '-machine', 'x-remote',                                         \
               '-device', 'lsi53c895a,id=lsi0',                                \
               '-drive', 'id=drive_image1,file=/home/homedir/10gb.qcow2',   \
               '-device', 'scsi-hd,id=drive2,drive=drive_image1,bus=lsi0.0,'   \
                              'scsi-id=0',                                     \
               '-nographic',                                                   \
               '-monitor', 'unix:/home/homedir/rem-sock,server,nowait',                \
               '-object', 'x-remote-object,id=robj1,devid=lsi0,fd='+str(remote.fileno()),\
               '-object', 'ioregionfd-object,id=ioreg2,devid=lsi0,iofd='+str(iord.fileno())+',bar=1,',\
               '-object', 'ioregionfd-object,id=ioreg3,devid=lsi0,iofd='+str(iord.fileno())+',bar=2',\
               ]
proxy_cmd = [ PROC_QEMU,                                           \
              '-D', '/tmp/qemu-debug-log', \
              '-name', 'OL7.4',                                                \
              '-machine', 'pc,accel=kvm',                                      \
              '-smp', 'sockets=1,cores=2,threads=2',                           \
              '-m', '2048',                                                    \
              '-object', 'memory-backend-memfd,id=sysmem-file,size=2G',        \
              '-numa', 'node,memdev=sysmem-file',                              \
              '-hda','/home/homedir/ol7u9boot.img',                      \
              '-boot', 'd',                                                    \
              '-vnc', ':0',                                                    \
              '-device', 'x-pci-proxy-dev,id=lsi0,fd='+str(proxy.fileno())+',ioregfd='+str(iowr.fileno()),               \
              '-monitor', 'unix:/home/homedir/qemu-sock,server,nowait',                \
              '-netdev','tap,id=mynet0,ifname=tap0,script=no,downscript=no', '-device','e1000,netdev=mynet0,mac=52:55:00:d1:55:01',\
            ]

Where for the test without ioregionfds, they are commented out.

I am doing more testing as I see some inconsistent results.

> 
> > Sequential Read and Sequential Write:
> > 
> >                  Sequential read		Sequential write	
> >                  read IOPS	read BW	    write IOPS	 write BW
> > 
> > no ioregionfd    367k	    1434MiB/s	76k	         297MiB/s
> > ioregionfd       374k	    1459MiB/s	77.3k	     302MiB/s
> 
> It's normal for read and write IOPS to differ, but the read IOPS are
> very high. I wonder if caching and read-ahead are hiding the LSI
> device's actual performance here.
> 
> What are the fio and QEMU command-lines?
> 
> In order to benchmark ioregionfd it's best to run a benchmark where the
> bottleneck is MMIO/PIO dispatch. Otherwise we're looking at some other
> bottleneck (e.g. physical disk I/O performance) and the MMIO/PIO
> dispatch cost doesn't affect IOPS significantly.
> 
> I suggest trying --blockdev null-co,size=64G,id=null0 as the disk
> instead of a file or host block device. The fio block size should be 4k
> to minimize the amount of time spent on I/O buffer contents and
> iodepth=1 because batching multiple requests with iodepth > 0 hides the
> MMIO/PIO dispatch bottleneck.

The queue depth in the tests above was 256, I will try that you have
suggested. The block size is 4k.

I am also looking at some other system issue that can interfere with
test, will be running test on the fresh install and with settings you
mentioned above.

Thank you!
> 
> Stefan



