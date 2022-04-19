Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962ED507D42
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 01:43:43 +0200 (CEST)
Received: from localhost ([::1]:49992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngxVW-0001gt-Ae
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 19:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngxTx-0000xl-4d
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 19:42:05 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:38838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngxTs-0003dZ-Tv
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 19:42:02 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23JIc9h3024754; 
 Tue, 19 Apr 2022 20:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=knAUhec0MZfs+BQEeOok0aa3RG+yTNRzFlP3XMvR1zE=;
 b=CRCSyTi6/yP2FzN5lkfWAEOpdYK0HRBwpQEs6/E0YHphVpRpnYxYF1OvqMCyOzfFB+39
 pVpkvRBiSCeVdwDjRwGlNrqPA/2xntKnr6BgM02TjKxbwjTuY848EWeMARLgYu0naSeT
 hh5eXNO3snmIVrecuxMj+2g7b19PazTjhiKIv/eNgNrIlgBwUhU5ePp17YG3o3dEdBT9
 DYsMhB+7uqjiy185wQo8kbs9b0NK/S13Ux8hoVPLMutXZgOP3UQJvifl2zOWK/PQ/FpA
 4GsVQ3FdhIGA5ZIYXZGvr1GDr+hWXo4bXGyMvX50jMgoZTvbYjUtZElX/ZTrLLN4rFUl +g== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffnp9f2aa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:44:50 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23JKZj7P034072; Tue, 19 Apr 2022 20:44:49 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3ffm830cbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:44:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSHHCIjgbB0y7ldR7BzIDtiPIbKtYAQts4Vw5gp4+zxpIaS321+0yisXDJdatRgBGSimvEuFdbfP4IzrQg71vjMBYbY3wrnYZv6QlUCY9rWUeZeG9QLDs7AOU+oC1GxIB4w0Fbe5m9//vb309fcq7ln9SlP08wVZdQL1HiDVApJSKlzJCMa/gbeNl7OqoSLMHDQZazqumIt+7ijEDNlL0xlBz52OXSEaORlA9OrPC4xxCaSQATz2arwbT3WL/RR22wMN63qJo785NrPRIqzlqVKh+4ile7DvVQmynooJ/+VpshOHVarrAfLOML2512GgusF27JWrZtWsyG3cKq9+sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knAUhec0MZfs+BQEeOok0aa3RG+yTNRzFlP3XMvR1zE=;
 b=WQqJIB2BPyMdtkAMrypddGQZ383mI4Q5b2H/FL+SffpARy1kuEb7A7lY9i2rhGM+2kw/hSt16OKz2sKs9g3B2BzUJ+a/UNMC5/9FZBU0tXqV/Rd5o3AW+AqMSCEVNk2WyjBpatjNXGCDayGLkN98zcgBRGuw93ugkzJpQqP1tTD1g3vDf3rsYVNgodBcBgo1TVH8aHgJBQmzYVMG6rZHk8LIhzI71VCfMzjCTiorZY2UskN/gKYCiD/JNxjeV3kG60uLtR6l0dY7QNj6kI56vrSa3frkjjmznxKjwVzYw6gXrKzASIKsmiZw+DPHxBtfMbHW9Z5jixM887OG3BBWfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knAUhec0MZfs+BQEeOok0aa3RG+yTNRzFlP3XMvR1zE=;
 b=IO6BjxS/+I5k8k6zuKi4blg1Kqv6WiuZ2mNYtkQmAKtg7L9xlG3hNxL03TukRpunRNuop3OUFQM78+dyQraqYvGKcP99PyN9bzg5hUbvba8f/IqD82RJRzUL0Anw7lDoZM3BrJ7jb9MY7J0qBYqe/ecIselql2apkaOKOvCJo9M=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB1998.namprd10.prod.outlook.com (2603:10b6:300:10c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 20:44:47 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac%4]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 20:44:47 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 04/17] remote/machine: add vfio-user property
Date: Tue, 19 Apr 2022 16:44:09 -0400
Message-Id: <fa30c35a146771d8deb7a58471416b26656b167a.1650379269.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1650379269.git.jag.raman@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:40::42) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c85e9ae-833c-46fb-cb3d-08da224570e5
X-MS-TrafficTypeDiagnostic: MWHPR10MB1998:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB199804C13A7688B35C783AE690F29@MWHPR10MB1998.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zokPnVF8Y0zWdZUzv157JI7n1gAgj/1ZBm6TDnuZ63v1u7XlTlc+6aLi4OYtDIvOduzZOyUCP7u10hf6Rvvx/nDliCrorpEz8El0Kg7RDs9xOB7+/HsDJ2hudL7KwCE9GKmQVrExl9kGg8xPiCwxxPJHFse9I0CCXRQffNvBC53yWEAzftuTnOWabilTV7T7wFncGJfCI6lEwF7uX3rMPfc2jp+3acLb7EldaBcfmEvOJKG/T8WrpoQ23FLAEqW0M0sDxnkwRD1pXTvrl9cF26ilZ/uS1fIccoKeLOIDbEx38dflCNSSEAQshfLu7kZIFlUD1KYvZFNOfGoZSo12/cpci969teHmBR0kHwN6y6tx8QtSoMZs1m4eL8u+KQ6TgPg19HgB1MZ6DobC/IF46nW7Z6NU4Wn1BCBcSeqsS0mD2gd7+5EHJbayrSwUxKENgcYu3ljkraCq9395mKAPPPJFviqdAkHTWJvsZW1WJUkflQArgZ+PQFrlQYv+KJY9+tmdAApw32mQgDXaLHuUVgjs+QPzVe4wIS5VeSmvmbd6vgfPp7v0MUR+PiNYuh6FzODu0JHLQKX3qXtfE6Si2gfR1VkMpp195cjcAHmpbD1RcMvx68+/fbYtdQiSImULt4XX8DztK7PQUbqTGxUcFdXDsPINdhFT/NlUFxpzRcEMboxdxaF0oOnkWCGkVHwWn+x27dydjK4lkiEwe+cKIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(4326008)(66946007)(66556008)(38100700002)(66476007)(8936002)(7416002)(5660300002)(8676002)(38350700002)(2906002)(52116002)(107886003)(508600001)(2616005)(186003)(36756003)(26005)(316002)(6916009)(6506007)(6512007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WAOsJE+3wFVpn2old55B8hRyyiXKZzL23rjqH35kldm5CDPqqElVV3IcMkAI?=
 =?us-ascii?Q?X5jrlyaJKFIgTgq96GjTSy+xPagrJ04cE8o/Ag1Fdlz2c5189p6ETP4uj4Zg?=
 =?us-ascii?Q?49afb7eEvyGgpcX1UkB40L21wjLWVQbrNZH9pkjZKVzTnDagL7qSEJNnBCly?=
 =?us-ascii?Q?l1a/C+5cMKfvAAzJh9iHvaib2CB6R+4JxDuMiHqbZottByw1DS+s528HpR8l?=
 =?us-ascii?Q?BQe5eDMXaVlBmmEiwIbFMyUqGvyZUFASwSXFKSS1mkl9oUjM01XE8Uum6Qat?=
 =?us-ascii?Q?s2zkEEVgXs0+bJ+45dKUxjw57CUnp9xa+hx3WV/njxOI0utCY9ZhGVeCu5zw?=
 =?us-ascii?Q?ggyeRA+3rx8wzlTs5eb/oUUJK6OIihwTmt54CIAYDN6L7EDKeXafoN39LOio?=
 =?us-ascii?Q?nagy+UpdvdW0qqx70+Ofax4cZYm0LYXxpiWh223jaxfYhBXjc0i30dH91XqU?=
 =?us-ascii?Q?785H+BytRt6EgELwtGvdmbrUH2VRqQKJfChsQpd/kkZxOYGBVRmJ3ICN5E7Y?=
 =?us-ascii?Q?XQ7WvENToWnahA700KlXne+yf3BKe90I68lx4QgDZoXnISdBe/JD3eLDWxCc?=
 =?us-ascii?Q?4Om9KZxRo8mQYX0Ww65103k9Wc/x5lsKNADkU+cub5Z9lwxNubtt3T02Bq1o?=
 =?us-ascii?Q?0eKr3ofjEtKoBCgaFInudwFLpea1NldiesLBYPWgmXjV0IwHk9SofTvLhQXn?=
 =?us-ascii?Q?VOxtB1TlMw88qh9oU8yQI2hTIA+2mSVCHU3kTaP8riS7M2mGDUTnIOxNerBu?=
 =?us-ascii?Q?CP9ha4uBqx120JmcJA2bnMihXGNnB0+fT4l2rKgmgQ0xJMKFGWglfQQvEFif?=
 =?us-ascii?Q?5qe2xwbhH6zwMaMxHx/zqprT0g/evZ8fn1VXoeAY6xa+Vqw5iGfWq8Zdgdx9?=
 =?us-ascii?Q?/+/coIHJTSIB5PHRUqr/vBcRrzr99Fw7VRKXiT/SObe37YN6g4+QX7uR1LQg?=
 =?us-ascii?Q?24zgz8w9arkG86aQSRF5oMmMH8oOn8PykKqghqCSNIzt3SmhYZV9MIq+8e2s?=
 =?us-ascii?Q?94bfUtKVf1yulpytQkt9gmwHuz7HQrgUNYuWznUG+6Tz4wVRtny9nff06TNR?=
 =?us-ascii?Q?7GVgFv2ydkoWB2KaLFYvj6h8Sxn5/5zjEK5+MNxjhSED92vggpY4bgYQqxOJ?=
 =?us-ascii?Q?gW4h6ZHmaU2A0Qg3JQ6dnnM0JnVDkV1JYKumwsOyZkBxQbcc4D4V1S9eogm8?=
 =?us-ascii?Q?o1/hgkUnP5/YxYgUcxOWgYOTMnGY/RY9fMOzC2CRx4+/O4FWJ7lfsHLlm9Z1?=
 =?us-ascii?Q?PLr3HB4QzgW7QJXmWxct/E0/7aLGV2Cvp059HTLTgge2FhLC6KJlADVz5/bq?=
 =?us-ascii?Q?5O40X6MGUPqZl/PSYHrOiCordfeCeiDBHYMJsOhPkyBFB9Jh4+PYxg97j1vi?=
 =?us-ascii?Q?JpM1SRC4XBSAZbKncgNeeZUg/3TVA00KF+eGd7IbODFHeuNscvqv9OQ9oWnT?=
 =?us-ascii?Q?dRQg56xQHmYfuNj67ICI7DxKlL6iHtJ0fk445INIqTXvfnW2B4vV5a4AbjqS?=
 =?us-ascii?Q?87suUK0Hr2+En3aQRg01yGnGEU/8ZeqPGJeC0ZwxGxncU/62XTPpZNZR63GK?=
 =?us-ascii?Q?DYqcXVQkAlPjSlO3Em85Ko/eS9fIAN/kSyqM7oogqfoqfaBDvWA6GP9BrDhV?=
 =?us-ascii?Q?loAuqgW7vCjG61v0BQ+ot65kwpnH//44V+Kz4OAH0MyqHpumUUiH0hPEED0Z?=
 =?us-ascii?Q?xffsyJutZynA8DL9WPZ0/3jDzzf6FR8A4ICnSfLzKnkb0z6LHDYp5GqA4bwC?=
 =?us-ascii?Q?ioTwAGMD3A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c85e9ae-833c-46fb-cb3d-08da224570e5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 20:44:47.0573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56bKNKXZDOh3gL0KV+mior/caEexqQbuUqvAqxAlW+qA/rfJF/vXqwcND2xHX39bTVB5HwZdHqqEzSDyfV/nOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1998
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-19_07:2022-04-15,
 2022-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204190115
X-Proofpoint-ORIG-GUID: g_8GOgvUYYevOl1WS1RVIAcxVFK5GG_M
X-Proofpoint-GUID: g_8GOgvUYYevOl1WS1RVIAcxVFK5GG_M
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, thanos.makatos@nutanix.com, kanth.ghatraju@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 jag.raman@oracle.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add vfio-user to x-remote machine. It is a boolean, which indicates if
the machine supports vfio-user protocol. The machine configures the bus
differently vfio-user and multiprocess protocols, so this property
informs it on how to configure the bus.

This property should be short lived. Once vfio-user fully replaces
multiprocess, this property could be removed.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/machine.h |  2 ++
 hw/remote/machine.c         | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
index 2a2a33c4b2..8d0fa98d33 100644
--- a/include/hw/remote/machine.h
+++ b/include/hw/remote/machine.h
@@ -22,6 +22,8 @@ struct RemoteMachineState {
 
     RemotePCIHost *host;
     RemoteIOHubState iohub;
+
+    bool vfio_user;
 };
 
 /* Used to pass to co-routine device and ioc. */
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 0c5bd4f923..a9a75e170f 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -59,6 +59,25 @@ static void remote_machine_init(MachineState *machine)
     qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
 }
 
+static bool remote_machine_get_vfio_user(Object *obj, Error **errp)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    return s->vfio_user;
+}
+
+static void remote_machine_set_vfio_user(Object *obj, bool value, Error **errp)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    if (phase_check(PHASE_MACHINE_CREATED)) {
+        error_setg(errp, "Error enabling vfio-user - machine already created");
+        return;
+    }
+
+    s->vfio_user = value;
+}
+
 static void remote_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -68,6 +87,10 @@ static void remote_machine_class_init(ObjectClass *oc, void *data)
     mc->desc = "Experimental remote machine";
 
     hc->unplug = qdev_simple_device_unplug_cb;
+
+    object_class_property_add_bool(oc, "vfio-user",
+                                   remote_machine_get_vfio_user,
+                                   remote_machine_set_vfio_user);
 }
 
 static const TypeInfo remote_machine = {
-- 
2.20.1


