Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4837651C686
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:48:20 +0200 (CEST)
Received: from localhost ([::1]:58596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfaN-0001wf-2k
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf17-0006RT-9O
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:53 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:42112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf14-0002BE-NO
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:52 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245FpPqU018740
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=FI82FyLXktXy7PM6lhmnfBxg/3NJzJFAJAbCJS+eLng=;
 b=KxOWFUw22GT+RG7YQAVGCzqEeq/Q0aiON+C/TKEnw6Lqpcwz1LspsGsu3SKshUkPwcJf
 Agwj9Ul+Bna8IA42/L7XcSBiHVft1vVz5GaSNxikD4TDRRQwLN2s5gJ3LnYjKuxd2Ulf
 Sm57SAEAJJptrzpFx9xmnabKbxgRW2Xc2k/KcwZJrA70FleEffDKrkNWow1iPmKLvSeS
 jvegALK62yya4gAccfFs9NOnJOuc+jbXd9+VW9j5Qawvw2odM2WtSD7s/HDnoQtmrtVd
 CpL4KA7UZDiafpfnpSmNJ35qn+HBtB3ZvGMzJC2qNw1L+kg6UXfGJMIYbA8mWI5m+FlX rg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frwntc3k9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:18 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H0sqI013487
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:17 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fruj4xq8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUcA552xTbBT/wuP9b0byOBiqKF93T0Yy0QbwcuciDuzDkdxEcuSqwvPt3A8SnRxDyy9b/hanCuupKDCWvn7L3U7WlArnUWvL32fEIcqqqzM7l4ImylbSUN7Xd5hjpr6YfHrytj67ig+8USWOpBbtt7t1nehntsB2H5o4DYOHWOeQBebKcKneKdfLZBNcbBkCejyli5YijODBon27FJ5pAmR/ZljXQNGewo5mx6ob5MmxndSx5rwnFeRMtZYytYi4f9/MmyxXZnDqJt55khnPfrox50Z8MGxK21uE1Q2u9wCu42M5ZYEHj4PLF7LXhRWR+o1PI7fcXLgSwk7jAYu7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FI82FyLXktXy7PM6lhmnfBxg/3NJzJFAJAbCJS+eLng=;
 b=bPEdOOUHciY7iTjLlJjAivFERQXUrRILn6f1yQcj03EXcOf6MMiVep9ADB5/5R4FJG3g8G9tOpA+bzs5vhsRmdNrjx/K+3nQ5Vovc6l/UsHg7ENgIiW0u9hpEKTIitF4PlD+lbIzVxuJRP3lW7FuKJJinrYNnNjHbOgTQRSWqcyi05LZc2sCDxu8+hopQjZcHioQRuGBakHS5vp5juovusbf64C6p/5PpMuQFVntPHZSX694n6Ya4NgZFYwo1BEzok5c7PORo5oPpXHA8V7UQ1fnKvyoHZy3+eW2Iaae/0dooOfsed9filAnAjBWWTrlOKw8WdEwdsRLU4lAPFLFvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FI82FyLXktXy7PM6lhmnfBxg/3NJzJFAJAbCJS+eLng=;
 b=OLtCq/DSPoidx2HFyDPcOKaa0gaL1Nqqt0GMwfxlG2D8WYxbB/S8O73M/GtXY54pKr5cyxDL8/Kpcw7EtDOpTXFrrk5BylufjhqGP9mvwP58+zvpfYzNpPS8uNWPL6MbFGNZ37FPhKK6/TU9s8KAsBS/1W8hmfyU2b/9CXv9iig=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by DM5PR10MB1867.namprd10.prod.outlook.com (2603:10b6:3:10b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 17:11:15 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:11:15 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 00/23] vfio-user client
Date: Thu,  5 May 2022 10:19:43 -0700
Message-Id: <cover.1651641788.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 479ebd53-9870-4247-3c55-08da2eba4315
X-MS-TrafficTypeDiagnostic: DM5PR10MB1867:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB18679A613D004DB07536FB8EB6C29@DM5PR10MB1867.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uoL4o+SH6gbXa3VrSgc1XkMPWl0ww0yKThK2br0kCtdsak9sY6WlGNUOnqTK/qa5+/Lnwi+Iy03L3N68C3/6z443fksY3uctwYtP91W6KaqWAwyRD8QWLITp2HWUpvnJhcgfFpAQHzVzYP6sWx2PGObuIS60sur1DsplnTCZcySf5jpm6y3Ka1xXPEZPfZBFenGukOrhEfLNharTEzVIcS4xYcnMAbA5uw1khYv5uYvrpM8Y7+WAVGgMpBJDmRz8hzXti++sxuEa8qubCwI6Q8VZxpAkBS4/8+LUYJy0hUeGYZ7jknoXPFTL7mjgBysOC9A99YRN7a0ydqEzrABpgJUkBMuFQLDh0kR2PutiAOpfyaz3IMcG7HE/96oau0QxpEXP8WGqryDN0EOEiG4VCdRUppphcfxsva0Ua3ACDZH7ozJ6eLL0DvwYrVbPjd2/FRixICMeA7Niau3h+JPUYVMc87vDXQym7lzsWSuHb5Gq/zuNxf/gatX0cDihf9itx+4OOz0n714zzHAV7rXkUDePSLmsuwuuuhRSyeBf4KDiB5IPT/X2mcsi4NvnqyB6CPSMC2mul6aP1WylY4yIrbDTkDpivk1+0tERSsdWUAWzg3OyTY3AD7FSVrx6mtqJ6GpToqRSqvl973vPOH4CMTw4ymsLCxXbBL6nRJqiPyUQFOvKAY9jelkum8kuqYvSalOKow003OEFEEjVzwEerQLYIpR7xxgmYeVGlikOOrbykWfbs/U1Kax9kBjjSS6lb+aG4z0nVLKKrYAvpSD3lw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6666004)(8676002)(66556008)(66946007)(66476007)(8936002)(38100700002)(38350700002)(5660300002)(86362001)(508600001)(6486002)(316002)(6506007)(186003)(83380400001)(36756003)(2616005)(2906002)(26005)(6512007)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PHK3ZGmwlr7x8ouo0WvfoH3pieuZ5aQadU0aTIzRhS/b1C03Q0GKilw5M8y2?=
 =?us-ascii?Q?YLcw/JDJcHQGMg1rywMFe0UrzTvDMMNovi4IqS/JfW/oAQVrxj84hO259BU5?=
 =?us-ascii?Q?j+RDi8hRapwGykJ3GtNO4AwdlIDWeZbGhGH2reU5BVYlYMy672MVD3k18XVq?=
 =?us-ascii?Q?OmSst1+Arcfcvp37RmL5klq742ktWeWJP6fiJUl25klAtzhT9miwlxaKROvn?=
 =?us-ascii?Q?wjzv/8D4EXRU0HreRtBLREkVmxdFaVBHcZpXbEbw+8u4F9F95+zaXAN3FjPP?=
 =?us-ascii?Q?YAi9Q0cCT/M6wvcAd3PI7vS6XOhx39qkipx5FHPrH2Yb6DpS35tM1WjzxYaN?=
 =?us-ascii?Q?DamXrmb9+3Uu9eN7CgErHZ9Q6An1r9WAwIl/utNL3DuEZLkVlx7rdwZaEeIH?=
 =?us-ascii?Q?mQDe0HjF4kcr55Vt0NPw0Sy6dOHSuoABDsOQ5RCBR4nnDQmAeLDfJsQkzYY6?=
 =?us-ascii?Q?JgCqZ1h+GbZh2J4DCRtEVtfC5AtqaygTJpmBos5/Qk1XVYEYIZR3NZeVbXLj?=
 =?us-ascii?Q?oBGdYNcbqby3nKYHiRZNRH0pV7KF2KehBz7OYs9FIbFtUeTzC9lDr5R8Cvgy?=
 =?us-ascii?Q?sH093l4oYZkbaqrT2l+Ad9Fy/W4TLrT4Urcf6hsJMC+VMTFFS5kBiJB4le6L?=
 =?us-ascii?Q?QAlpH1+fouDETyklsPd+f4On1Yu2x/hyTAh/VlnqTqr/8CQBoSAsn6JEiEmc?=
 =?us-ascii?Q?Y0HtvGTYDgYNrnAxus4autvyeN/qiOmgcX8eCkn6bQUigZ7BcRKkuV37F/EK?=
 =?us-ascii?Q?K0eOSqXpiCdZP/pMegipAuyedynv3W5wkKdbVmAazEEbwUuQYtv+wIUBnHK0?=
 =?us-ascii?Q?eKDb8Tt1HIJeN0cU04dMs/phR56uuL/cq8OTxD08ObCFI54C+hqTPa2ymCe9?=
 =?us-ascii?Q?eTYOchVSPPh7snR2PPnOwspFDD3L3OR6+E+Kvr0TPohVoR2rM0tg0QZKgOeH?=
 =?us-ascii?Q?qQwkveKDW3AHUkoO6d84iNuVWcKpzdyYLjMRNr2Fx8AUsxRAwQFTGVPkSFuO?=
 =?us-ascii?Q?+Bgx5Dr+eVDF5brJgFKdzSnzaj9sDAipc2JGoxsdHsEv4QxmIoQkzyFJosPV?=
 =?us-ascii?Q?8vVjpjb3aKmZ79UtYI6QVGwp36+8w1pe7paXv6A++PFa+gCXLx5KOpa4ZsBa?=
 =?us-ascii?Q?+e/xICVYlyWYNCZfa1rI7Bc80QkHu3GFA9kFnNLXmAGLW0Wu3EyzCYvfwkLQ?=
 =?us-ascii?Q?XjWF1R5dT3jZbRKk58rsf0pZ5J98UrYmsLSM2rxWAcMO2/aooO7Fz1fN3Pm7?=
 =?us-ascii?Q?UCGuDQeq0C3V5iTYN96BakQ4UvDXU2AYO0WNrdBVsciC9Wa79AIsxFbsQj9c?=
 =?us-ascii?Q?cEgfs/EwTAVr0UuShFZEBJRB3xDc6veoLfWycf+fFof1wDZM7nY9ryp6heK2?=
 =?us-ascii?Q?iaHHwg6doXa6puF34geNwf11kbU5iRL6SCQawbuu5rtk9tF1rII14RKMqtJx?=
 =?us-ascii?Q?7BdpYCf2Dc7VbDHJYiSldqbjPwMH+Gbo/B5MRd7n4nmr/HItwQmIX/R3H42f?=
 =?us-ascii?Q?X4WOwWhg9IPtlyooPOI+yMR+FO9ECPH8/m/RbmX2JUI2qzuraVbmXe7sANrN?=
 =?us-ascii?Q?A1s0RY5WtQ/NfknBUCqvn2dvRGBMlMNnpHbyniOpf2jN5sUlZOjYtdPNjmY8?=
 =?us-ascii?Q?e9FXdpqJBekg8HQG36SpeGsr8ik3hMcopBv1GBSTAc+1//qeS0fGlRsM7Zzi?=
 =?us-ascii?Q?WCXyBH3Ds0l06UCECCnQEBuaOnmmGsvwtNrMl99OC58Gf2mHB1cOv3Z9MgXY?=
 =?us-ascii?Q?5JZSz+yg5M1YvFeam9H4tQhZWOMiotc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 479ebd53-9870-4247-3c55-08da2eba4315
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:15.1856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYSSrz0JvNXjgteiAl7btBtHGkRvKdmfDU65gfn/28Q6lUCgvLcv4V0KUwpnLBCHrLp8BsHq/5Y2thpUBQDH8y7NEs/00vYBiUhLwtYx2Ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1867
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050118
X-Proofpoint-ORIG-GUID: 2ZFzVza0b4-D-2IUMKxINvKzUeKSLVze
X-Proofpoint-GUID: 2ZFzVza0b4-D-2IUMKxINvKzUeKSLVze
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This is the 5th revision of the vfio-user client implementation.

First of all, thank you for your time reviewing the previous versions.

The vfio-user framework consists of 3 parts:
 1) The VFIO user protocol specification.
 2) A client - the VFIO device in QEMU that encapsulates VFIO messages
    and sends them to the server.
 3) A server - a remote process that emulates a device.

This patchset implements parts 1 and 2.

The libvfio-user project (https://github.com/nutanix/libvfio-user)
can be used by a remote process to handle the protocol to implement the third part.
We also have sent a patch series that implement a server using QEMU.


Contributors:

John G Johnson <john.g.johnson@oracle.com>
John Levon <john.levon@nutanix.com>
Thanos Makatos <thanos.makatos@nutanix.com>
Elena Ufimtseva <elena.ufimtseva@oracle.com>
Jagannathan Raman <jag.raman@oracle.com>


Changes from v4->v5:

  vfio-user: introduce vfio-user protocol specification
    Removed VFIO v1 migration support - it will be added back when v2 goes upstream
    Fixed typos

  vfio-user: add VFIO base abstract class
  vfio-user: add container IO ops vector
    No v5 specific changes

  vfio-user: add region cache
    Deleted spurious g_free() calls

  vfio-user: add device IO ops vector
  vfio-user: Define type vfio_user_pci_dev_info
  vfio-user: connect vfio proxy to remote server
    No v5 specific changes

  vfio-user: define socket receive functions
    Handle partial reads of server messages

  vfio-user: define socket send functions
    No v5 specific changes

  vfio-user: get device info
    Return an error if the device reply has an inordinate number of regions or IRQs

  vfio-user: get region info
  vfio-user: region read/write
  vfio-user: pci_user_realize PCI setup
  vfio-user: get and set IRQs
  vfio-user: proxy container connect/disconnect
  vfio-user: dma map/unmap operations
  vfio-user: secure DMA support
  vfio-user: dma read/write operations
  vfio-user: pci reset
    No v5 specific changes

Added to v5:

  vfio-user: forward msix BAR accesses to server
  vfio-user: add 'x-msg-timeout' option that specifies msg wait times
  vfio-user: add tracing to send/recv paths
  vfio-user: add dirty_bitmap stub until it support migration

Removed from v5:

  vfio-user: migration support
  Only set qemu file error if saving state if the file exists


Changes from v3->v4:

 vfio-user: introduce vfio-user protocol specification
   No v4 specific changess

 vfio-user: add VFIO base abstract class
   Put all properties except those specific to the ioctl() implementation in the base class 

 vfio-user: add container IO ops vector
   Move will_commit support to dma map/unmap patch below
   Use ternary return expression in IO ops vectors

 vfio-user: add region cache
   New patch with only region cache support
   Make vfio_get_region_info return region reference instead of a copy

 vfio-user: add device IO ops vector
   Move posted write support to region read/write patch below
   Move FD receiving code to get region info patch below
   Add VDEV_CONFIG_READ/WRITE macros to pci.c for convenient access to PCI config space
   Use ternary return expression in IO ops vectors

 vfio-user: Define type vfio_user_pci_dev_info
   Move secure DMA support to separate patch below
   Remove dummy function for vfio_hot_reset_multi ops vector
   Add vfio_user_instance_finalize code from connect proxy patch below

 vfio-user: connect vfio proxy to remote server
   Move vfio_user_instance_finalize code to define type patch above

 vfio-user: define socket receive functions
   Handle kernel splitting message from server into multiple read()s
   Fix incoming message queue handling in vfio_user_request()
   Move secure DMA support to separate patch below
   Move MAX_FDS and MAX_XFER defines to socket send patch below

 vfio-user: define socket send functions
   Free pending messages when the reply times out
   Add MAX_FDS and MAX_XFER defines from socket recv patch above
   Don't set error twice on a capabilities parsing error

 vfio-user: get device info
   Add vfio_get_all_regions() call
   Validate device info return values from server

 vfio-user: get region info
   Add FD receiving code from device IO ops patch above
   Add a generic FD to VFIORegion for mapping device regions
   Validate region info return values from server

 vfio-user: region read/write
   Add posted write support from device IO ops patch above
   Check region read/write count against max_xfer

 vfio-user: pci_user_realize PCI setup
    Refactor realize functions to use common setup functions

 vfio-user: get and set IRQs
   Validate irq return values from server

 vfio-user: proxy container connect/disconnect
   No v4 specific changes

 vfio-user: dma map/unmap operations
   Add wlll_commit support from container IO ops patch above
   Rename will_commit to async_ops to describe its operation better
   Pass memory region to dma_map op so only vfio-user needs to look up FD
   Free pending messages when the reply times out
   Move secure DMA support to separate patch below
   Set argz in dma_unmap message according to spec

 vfio-user: secure DMA support
   New patch consolidating all secure DMA support

 vfio-user: dma read/write operations
 vfio-user: pci reset
   No v4 specific changes

 vfio-user: migration support
   Move qemu file errors fix to its own patch below
   Set argz in get_dirty_bitmap message according to spec

 Only set qemu file error if saving state if the file exists
   New patch with just this fix found during vfio-user development

Removed from v4:

 Add validation ops vector
   Generic checking moved to the corresponding vfio-user function


Changes from v2->v3:

  vfio-user: introduce vfio-user protocol specification
    Spec specifies host endiannes instead of always LE
    Fixed grammar error

  vfio-user: add VFIO base abstract class
    Moved common vfio pci cli options to base class

  Add container IO ops vector
    Added ops vectors to decide to use ioctl() or socket implementation

  Add device IO ops vector
    Added ops vectors to decide to use ioctl() or socket implementation

  Add validation ops vector
    Added validation vector to check user replies

  vfio-user: Define type vfio_user_pci_dev_info
    Added separate VFIO_USER_PCI config element to control whether vfio-user is compiled
    Fix scalar spelling

  vfio-user: connect vfio proxy to remote server
    Made socket IO non-blocking
    Use g_strdup_printf to save socket name

  vfio-user: define socket receive functions
    Made socket IO non-blocking
    Process inbound commands in main loop thread to avoid BQL interactions with recv
    Added comment describing inbound command callback usage
    Use true/false instead of 1/0 for booleans

  vfio-user: define socket send functions
    Made socket IO non-blocking
    Added version string NULL termination check

  vfio-user: get device info
    Added ops vectors to decide to use ioctl() or socket implementation
    Added validation vector to check user replies

  vfio-user: get region info
    Added ops vectors to decide to use ioctl() or socket implementation
    Added validation vector to check user replies
    Remove merge bug that filled region cache twice

  vfio-user: region read/write
    Added ops vectors to decide to use ioctl() or socket implementation
    Added validation vector to check user replies
    Made posted write conditional on region not mapped

  vfio-user: pci_user_realize PCI setup
    Moved common vfio pci cli options to base class

  vfio-user: get and set IRQs
    Added ops vectors to decide to use ioctl() or socket implementation
    Added validation vector to check user replies
    Fixed %m usage when not using syscall

  vfio-user: proxy container connect/disconnect
    Added separate VFIO_USER_PCI config element to control whether vfio-user is compiled
    Use true/false instead of 1/0 for booleans

  vfio-user: dma map/unmap operations
    Added ops vectors to decide to use ioctl() or socket implementation
    Use BQL instead of iolock in comments
    Fixed %m usage when not using syscall

  vfio-user: dma read/write operations
    Added header checking before loading DMA message content
    Added error handling if DMA fails

  vfio-user: pci reset
    no r3-specific changes

  vfio-user: migration support
    generic fix: only set qemu file error if there is a file


 MAINTAINERS                    |   11 +
 docs/devel/index-internals.rst |    1 +
 docs/devel/vfio-user.rst       | 1453 +++++++++++++++++++++++++++++++++++
 hw/vfio/Kconfig                |   10 +
 hw/vfio/ccw.c                  |    5 -
 hw/vfio/common.c               |  477 ++++++++++--
 hw/vfio/igd.c                  |   23 +-
 hw/vfio/meson.build            |    1 +
 hw/vfio/migration.c            |    2 -
 hw/vfio/pci-quirks.c           |   19 +-
 hw/vfio/pci.c                  |  962 ++++++++++++++++++-----
 hw/vfio/pci.h                  |   29 +-
 hw/vfio/trace-events           |    5 +
 hw/vfio/user-protocol.h        |  203 +++++
 hw/vfio/user.c                 | 1648 ++++++++++++++++++++++++++++++++++++++++
 hw/vfio/user.h                 |   99 +++
 include/hw/vfio/vfio-common.h  |   73 ++
 17 files changed, 4701 insertions(+), 320 deletions(-)
 create mode 100644 docs/devel/vfio-user.rst
 create mode 100644 hw/vfio/user-protocol.h
 create mode 100644 hw/vfio/user.c
 create mode 100644 hw/vfio/user.h

-- 
1.8.3.1


