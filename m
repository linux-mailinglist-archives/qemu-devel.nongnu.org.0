Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A65433FD2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 22:32:25 +0200 (CEST)
Received: from localhost ([::1]:42184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcvma-0004Yt-BY
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 16:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1mcvjb-0003AG-Az
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 16:29:19 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:30624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1mcvjW-00083u-Oy
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 16:29:19 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19JKKARC029622; 
 Tue, 19 Oct 2021 20:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=d03ss51Rf+AphWSRs0WAM26F9Tk3zb37FdAqTM8OGgQ=;
 b=WRarpLAP37XK8EtSvnnYaOdxQWStZckJWPw0e/V53AdCCxwiJgVnCKSvQaT+bcNll4PH
 zoIid19aVKrSl1H+U5JZA7Yhh3AWPkegDjYxkbI3rnZRSlwSoqWp5nNrdvtrnugTsBmT
 5yhWablDsr8zfgyC2hFLzb4l1qS8uFko7X8GRExy20TvDc2+0wAzOPKHRIWSszdnAsIe
 vFniqhx1VmHVizpenVLldSOQrb05zfu2tHi6q+pCpDRbQrFj6VkFb43O9KuitnDpsCfq
 zGRNGaggLmqiDDUsuRkVC48oIAPbJoP9/aaiI9bigmtU7U5cl6IHX64kTFgb63dHnlMW mg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bsrefd1yk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 20:29:10 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19JKGn0T182179;
 Tue, 19 Oct 2021 20:29:10 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by aserp3030.oracle.com with ESMTP id 3bqmsfc8vm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 20:29:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awnTgbWIHyuvBhoJn4+SgfCWChESwsRIA76drV/306JnDVQuwSKdq5+7rhHFXmFtHgCz9qoJ+ieLnva+9GvameYK9LRfwDL72ezZLeFFy+CI8VWHMTAn1W7AO9OGSovsl+CHg72kq1W340i1xv4OJfqrWhNj8HUCBNYrQ7Hf9nWG/WocWTzD6yyQDF+hrme1K2ZvpZC3No6o40CQA/+lxZnpqbD6wNM5uqtDhHoc0nkaX4LEQtCIa8QISI81X66tW3LVK6l//bPE4g1m8rK4n0lDI0F40VES6ALjIBkhNMUpDsAsncxE2ifoVkxLGrJC5i2svcH58C8cDFf8k9Exfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d03ss51Rf+AphWSRs0WAM26F9Tk3zb37FdAqTM8OGgQ=;
 b=NNPky5sUdcngETi+1FdKpic+A/DrG1VZlHo3VYmXEoSbdX3iQ5fB2LuSn000M8zmGATPz8JT1wXCo1wHlraPOVcoAhimbYeV46G0BPUdm0b9qX0NSbBKOBpkiaR5TqfTcJgUQ5ywe9bg5j6ht2wbekqp63arX4stwOlvnnq+x7WG5iKwMz+aNZIw3ArjXroK0H9aypfWoS1ACwEk81UjQYN4iMR1x3ygx8gtnIHyk5J6qllVy58t+FbCDYIZPvH5GlnUD7mMQj0sh7Q7KRFgjX/WzIfgn9aV/iYXPnVrw9yDa5lCSKr/AAljwQDy1wzkjsc7/ZMeJlGOrehepb29ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d03ss51Rf+AphWSRs0WAM26F9Tk3zb37FdAqTM8OGgQ=;
 b=CxNQTKPZy5BkFKfax3pvRtQDY0BZ1AEVEWZ4Yda4OyvTX+StYG/kFJWh8G3sCB62X9mgy3B6XANd30t/+RNZSTXh/HCfEepZQs+MOkk9OzCSA1QhsFBVsWER3V7QDv8r7RZG0t46Dst+1XEgvr8J9yDKKLHEzAkYA9LBAX4UodY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SN6PR10MB2448.namprd10.prod.outlook.com (2603:10b6:805:41::18)
 by SA2PR10MB4681.namprd10.prod.outlook.com (2603:10b6:806:fb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 20:29:08 +0000
Received: from SN6PR10MB2448.namprd10.prod.outlook.com
 ([fe80::2c40:de5b:9f20:4604]) by SN6PR10MB2448.namprd10.prod.outlook.com
 ([fe80::2c40:de5b:9f20:4604%5]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 20:29:08 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Support fd-based KVM stats
Date: Tue, 19 Oct 2021 15:29:02 -0500
Message-Id: <20211019202904.4857-1-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.26.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::31) To SN6PR10MB2448.namprd10.prod.outlook.com
 (2603:10b6:805:41::18)
MIME-Version: 1.0
Received: from linux-1.us.oracle.com (137.254.7.181) by
 SN7P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.15 via Frontend Transport; Tue, 19 Oct 2021 20:29:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dd2935c-533d-4f4e-a796-08d9933f1a34
X-MS-TrafficTypeDiagnostic: SA2PR10MB4681:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR10MB46814604E628000207599EE1F9BD9@SA2PR10MB4681.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1GbLydIgn81AN80PUQBP8ladFIDzdyu1X5SKyiBkL1sQpMcYtsyR/0xaWXAosIPPaNIBEsQY0Q/o0y3Dq00KRoilxON8KrYxdp0qfyD84dWYmbhq23LOKOZ7sJuN1o2cWz0JIZoHUGfwDxrjLHmTf1ak0TukmxqrfjlosBjk25fhHoDsp3EX4DYsQGJlqAJ4CVao17wo4p3mz+HHkhfQWp2CvG7N9XCqyKfB2fzVSnv4JJprC5YxWu0HX6jzLkrc1yGY/gfK+LOhUnyTLgzsyK3zXgYigFQoc7MofdPKXRQ1hp0UBDGzQZRTFJTPd6kpW4OcYFupuXqGqmbSEMbWz0xydzg37AhDiMpz3aetmyNcMF6ie1dT2OQJA3NOMU8alvUqVxE+P97VmqNzgLFszfQpoyLwniugjJNyt22Z6OhpntDGOAZSF1EhoNxg0HhHOWSh/4ArJCq2Go7y2Wv8oDka5XK66e1bW7ek7e0kIS0EMJlqKHUU4HMRNTDiIHrR/fWp8BD3uabtcpc7hhejeSSL5Oq2UDyC6CYmLPScGVGefvHJa+9EQl7r5CVpN1Ud8POvTt4ATFRw9SKJIWxi/gT/qY8qpIoITVlBVHno0Lx+sb2O7HT6CK/FI4V+mm6mEJ4ycnCCWrfw/O9k21U3vrZuRewS6fgHZH2YFfQcMU15uo50USvjW5Z6JoycQfUaf44IdIyN58olkwfaJvcSuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB2448.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6916009)(86362001)(316002)(4744005)(8936002)(52116002)(7696005)(956004)(66946007)(6666004)(186003)(6486002)(66476007)(2906002)(38350700002)(26005)(44832011)(5660300002)(2616005)(4326008)(508600001)(36756003)(66556008)(107886003)(1076003)(38100700002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a0Ve215kz0fH04/kNgVV9MuYVO4bx1WVAcVBMISAMRccwGlRevnNmMXMKsKk?=
 =?us-ascii?Q?4YJWzBwO8vBG0NWclFYUgHDNWWOAJ1UUihSL0iSZaOnrufYpOH2mfX1E3suq?=
 =?us-ascii?Q?lli9GqULPvdmrvCPg2kQ6bYjW4//N+qEl5hwdjedbLv9Pg7sN0lVqu3oLGlE?=
 =?us-ascii?Q?JuG0meJfP/DALE29wq5g9Hwk5JsPlvNO90nCvOpoOBninMV2/cJuPqvg8/yd?=
 =?us-ascii?Q?26K84uiB/xtR22vpcAvo7d/K3Jc62j2Af4gDz2pwmS9oF1ObsVhAXp30oeFH?=
 =?us-ascii?Q?9mr9Vb69vjmhd6edmt5b5UBF5jv34iucFCEHBuNTZ8qUIWMoTQ8HNSYjG56Y?=
 =?us-ascii?Q?Dq0bxZms3JemiIQBKrINS0rL0F0qvUhJIE4kvgJRKPWkh48EvIk/jNvaLnbw?=
 =?us-ascii?Q?12H3BXEV46vDPrMkok4Eumo5MS3JeWkQXY47LDRDeQzOAgUGu2XUDD2gpuka?=
 =?us-ascii?Q?xxmMh++hCTdOv8YU68bs3PYJxQkH9vJbxyL+nwkD8fx/DnFURwnY+Am8NcAM?=
 =?us-ascii?Q?o3b9KGE3yqmm8POEdftxIAT+8RvupJOEZ3Aev064aW3hhRk0rQLU+Ck12r9R?=
 =?us-ascii?Q?+YSB5zcO50S+rVpqAqGE4M+0ou3HiNLubXBaXU8v4Snifsthux4DvUSwzPgz?=
 =?us-ascii?Q?7R+aUK5eorfwAj9jR4SBuqiuPf3aSInNhNtVZ0Qi5sj9jjVUMo90oda9PsJ4?=
 =?us-ascii?Q?oFQDktlDLwsy1UisxUBRRYeQ9sqDuJqz/UfDb7cLdfBA41SX6IzUFDaYqt1H?=
 =?us-ascii?Q?Fv1no/nCZOPdAokePncMjPZ2+CkgqBKPXtgHA30IYtSCLDLTMifFp7gsdjlL?=
 =?us-ascii?Q?jFgTJnLZoh2UxiQrGYRpI52mGm2ulpz9XG4HxhQnm8bqMs6g18VUsuwiwhyk?=
 =?us-ascii?Q?vIaqfi9J1frKbhbjq9Jb8XHsYvceaKqdPm9JRP45z/TXmnx+TyQ1V6jn8is/?=
 =?us-ascii?Q?lZzlZkFqXp2OLBzpkcf73HXrw9EArDNLfGC7AwmT/obRUgYrpkYT5gGafcEQ?=
 =?us-ascii?Q?vREgni+WOjv0mvTFaLz8nc3ckCcozEw9S30QJPpAAdL/yz36FDtf142RmiI3?=
 =?us-ascii?Q?HEWDUxfU+eH3TCgIvrPhnVsCKncWfOJJgautTnctWf/2pnGt+HRVm30d2IBJ?=
 =?us-ascii?Q?ZvIxys2GN26Xpe5MnrXV9TjdSUZNZn1qpn90elguvw3NWIoI+U4w+7VJIAtW?=
 =?us-ascii?Q?sW0CgZAEEPPoqdlJoLmpY50AIrsk6yORFkQ+KyJwjQoiYR7Yvctkt1+dJIc0?=
 =?us-ascii?Q?7CThopB4bzl6LD5ipMoeC1bz8mMcbOzpMUI7ZWz3GCFoyB+xhFyoT8RRC5//?=
 =?us-ascii?Q?cF9esj6nBA11uEHMTniQWgHK?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd2935c-533d-4f4e-a796-08d9933f1a34
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2448.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 20:29:08.3205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UB3rnHXz9uo5hVkZXpqzb8MGsUiP4KogYI3Ky9Q2MXlEbM6ZEE6bZVkWwI2KE1YG7Raj+VrMrVU1fm51KQtAEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4681
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10142
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 malwarescore=0
 phishscore=0 mlxlogscore=928 bulkscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110190117
X-Proofpoint-GUID: VK22AwGEieg8lglCPy8jzanGVIdhs1SY
X-Proofpoint-ORIG-GUID: VK22AwGEieg8lglCPy8jzanGVIdhs1SY
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset adds QEMU support for querying fd-based KVM stats. The kernel
support is provided by:

cb082bfab59a ("KVM: stats: Add fd-based API to read binary stats data")

Patch 1 adds QMP support; patch 2 adds HMP support.

Mark Kanda (2):
  qmp: Support fd-based KVM stats query
  hmp: Support fd-based KVM stats query

 accel/kvm/kvm-all.c   | 246 ++++++++++++++++++++++++++++++++++++++++++
 hmp-commands-info.hx  |  13 +++
 include/monitor/hmp.h |   1 +
 monitor/hmp-cmds.c    |  52 +++++++++
 qapi/misc.json        |  73 +++++++++++++
 5 files changed, 385 insertions(+)

-- 
2.26.2


