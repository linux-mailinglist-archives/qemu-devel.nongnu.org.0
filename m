Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6907C3A48C2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 20:37:35 +0200 (CEST)
Received: from localhost ([::1]:40582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrm2A-0005wo-GE
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 14:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lrlwl-0006d0-Ts
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:32:00 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:12136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lrlwg-0007iF-O3
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:31:59 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15BILjXr026773; Fri, 11 Jun 2021 18:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=VHZgB9/JCcXHC00Els2OxK+syRNbbpXiV/qIe4aV4Uw=;
 b=GdN39JCtyu8KbBy4JIosKfTWwrPHJ+yt3fUuFkwPRNuq/PP8BwxM4gXJQ2Jy0TcwYaCe
 tdMdj4FpkbyrBVrPJzdXmEf0rqx11utnyXB50EMBun+0y8w6UIatrO+4haAw46GZNl+a
 y9Gel2AKKMouhVihj9Vhck8tIZqh0onbv/mLOOLM24Fos5xkQUxd6yjPnzWhrZktTC97
 GxsrTJGMseMBLJTRfmA+h+YbmAgyUJUiHocqgzVB/z3v1Vui3ouc7ZWp5kkabGfk5OiX
 /PD5fpEPuhWwifo9dFi3aNnPYAsExokMy1z5p6YNBS2T07QVwekkidypyFphASK/2L4h oQ== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 393y0x08ms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 18:31:53 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15BIUw7p163567;
 Fri, 11 Jun 2021 18:31:52 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by userp3020.oracle.com with ESMTP id 390k1u5ava-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 18:31:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BliL1cvT02YQ7l4V4Kdou4kb7Gi6yV6E4AmcKgEC9dcmsdi9q5VLpsfZE2NRRw2McKf1p0EwleN5YhWgrE+QxzWgNKlYuHStQ9dhCHxJIvbW6UHrl44tEVeRHgbgt0U6lONIlrCpn4St/dzIZkPBRaUBHMJVpf99zRm79OuXLJqmqGWff5LAMLWDYCH5U2JNxwp8k18j76ZRyE2eRRlmhiu9LVad8lq+4PIutQG8m3/vXBG0l0lHfR9K+ZDy2GXZZhxY9JgXcw002Dq9lP1pOQ46RIii+QtcXuCbr62HjEtFK5hr1IL8tv/JXNXxz3olNmBbWY9youykGzEhbQeOng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHZgB9/JCcXHC00Els2OxK+syRNbbpXiV/qIe4aV4Uw=;
 b=IHLhFJKmkXO9q7Kb0GrGjdPsuxEkXh6f9AX7e5pi54hrCaDnKKmqeR4IqVs/l0RHicP/8cvcdBg2rrN8wirlOnLFaFSiBkZNUpLVbvQABJ1O72zvawSs6raNjRJI74XJ0UqCxh1tWyIxKXzEt5D8iWaeqF/AP0C2RE7lfYCJoepBWFe1ca6I+Dd6c8FDazlR1M4ynrJJvBdWQ5hitf6f0d6QMeyA9HhLkj8CLVNCag+P85PhRqH7hZuXIeS75hrlIUDyiURde7mN3VXaLfZl/C9SM/XREKhzyL0izXvMt5QMRRTFPaVciCLLQOIvsWVlnP1mWdQcEThK6imlc/faLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHZgB9/JCcXHC00Els2OxK+syRNbbpXiV/qIe4aV4Uw=;
 b=sySgtWsYG9xyFQIiGOQV2ApPu9gVfZ+zpyItHpptrU5eYkGirMLS9EnGxDNKGJKJrcNDA1ux/2oBL1VmdtN2QFKdPK/K0V7VG8+LVZ2kY+TC91G5Egg4eYty+tipAS2W0Zk83d40K2dijNqQuhgr75bZuH0OwVVlNB+yrDX0gHk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5457.namprd10.prod.outlook.com (2603:10b6:303:13f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Fri, 11 Jun
 2021 18:31:51 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%7]) with mapi id 15.20.4219.024; Fri, 11 Jun 2021
 18:31:51 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/6] ACPI ERST: step 6 of bios-tables-test.c
Date: Fri, 11 Jun 2021 14:31:23 -0400
Message-Id: <1623436283-20213-7-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1623436283-20213-1-git-send-email-eric.devolder@oracle.com>
References: <1623436283-20213-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.201.23]
X-ClientProxiedBy: SA9PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:806:24::12) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SA9PR13CA0097.namprd13.prod.outlook.com (2603:10b6:806:24::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Fri, 11 Jun 2021 18:31:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd858114-7611-4537-6d88-08d92d072de5
X-MS-TrafficTypeDiagnostic: CO6PR10MB5457:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB54570609795C8BB928894EA697349@CO6PR10MB5457.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZSKYw6mGDcnpG9Uf4Itv9H3vUoThrez/MWrIhi1iV3Tk5D5mEYXJGpPF5iTZ2s/H/98BSS4itNXAcYDb19cL/CgCJmoE53p9sSKWZt8f+w+ihPBmwrbKg2WIu7rDWbpSLd7qV8DDKlqBvHPm1v/NFYkNW5fhV7M96E11ZE/4CGnUjvtQU53VAQZ0nY4j/4xNOBTfupZRH6a6/rkAyVwsmrPlWrNz/ZqlyEGnhNh60gryxyIkdHoyloNM/CkTLYFAC4eaCjPJ8uN6hedHLUlraP4fHcYOyEi7xsVqE+lYnxddCRjX88YSp5xV6WNvNIhGOY95edjNLuDIwAtPv6lcYmmLeSR2BUmmac1doppei4MDi0OU7ua16cdsQfw0jm5zG1R/fukaBGCS6xrkbYn+SYuKSf8RZ8H3sOQXnilSroOkCXLs476xNiD1rt3ihtOOWOdclsE900WtfVCnAG5tf2bLPF/cBpqkkHp1iijh4txjKrbSG6bjzBRK/nPyMf+LlUU0HwbOPSXQBwN5FUTOAf6r7QhmhX6Pn1H72DjWiYG6GeMRDEYIGBHkbsMbrcKG6ZJUDpz7WSOZNaWCrn5FNRSQqruSjKOQ7M9F8L17EbSfKU/FDN1go1IqlaAEHmm50J8sHnchMdu7e0UnjqiYlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(136003)(366004)(39860400002)(83380400001)(7696005)(8936002)(26005)(36756003)(52116002)(6666004)(66556008)(186003)(6486002)(478600001)(66476007)(4326008)(66946007)(316002)(5660300002)(86362001)(16526019)(2616005)(2906002)(6916009)(38350700002)(956004)(8676002)(38100700002)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u8sTkJoZkenJwDZxbGZbzYi3l/eHffWd5OmPDnfhYA2k+gKaVRXsDlDxEnqO?=
 =?us-ascii?Q?P968SvynUOXiJTsRXZB5RkZ9I31drbViyDo2ENY3zqHQnqEn+t7HKAMrpQGf?=
 =?us-ascii?Q?6uUVkkTI6AAoOFPupCG0WS3WvU9Ty8LPjnm0nYYXnJ0hE91SSSUQs05L6UL5?=
 =?us-ascii?Q?J1h6V8+ANn/d3tiD/GqIYhisJxvtSmmQfThzigc/IwwuCb3Kndunp7U+gNjS?=
 =?us-ascii?Q?5bw6Eo5G/0Z8TELq6CrnII0XMJ7S1tzzasp+EYcUkEHyHW6yMOfXHOwBCy73?=
 =?us-ascii?Q?+Q/FrCrS98sap22Dza6WvRT81g6Dg1Id3zKC4YtR4lo8IOjiHA4HjMRqAsED?=
 =?us-ascii?Q?X8yDSGhC27LFI+Y3+mYFFlMa73s7I2tMTGOkH2FOkyj/lg5ydkZpE3Tbc/pU?=
 =?us-ascii?Q?fwI/SPQ129foC3+L0+HThA+ByY5KBJUycb/X6nRXbSfAHQWv0CrSeG7IYs7U?=
 =?us-ascii?Q?P47MDBetrFWKINrANJ9VdoC1QqEfeu3wZgOYHVN1/m6YXkUaDq7W7jIoFjpa?=
 =?us-ascii?Q?2DYvZna8SjeqsWeEEBha1SexZ2PADzO6bam81idOz2oz4SIUlCNm96ojMykH?=
 =?us-ascii?Q?ULW5cyWKVeSfWwXF3zgWS7aF5oDXFXTMFwoIx4h5ERKbG90GAOhX2Vo9rRZ2?=
 =?us-ascii?Q?/d6Xmr+LcJMOLRIPoA5yz2+bY+azVAwYC7SrH3zofJS4FYefhyLmcvdPMQrs?=
 =?us-ascii?Q?HBoeFRbhTGdzx87c6x7eS3OZai7Q6e3vM3IYlPZ7FH5/OKkOXj1uBP4vWuHy?=
 =?us-ascii?Q?ppx/eng7td19LLpo8oYfm6sHW3PqmfqaW9dl30K7McH9FBVsBEdk5Hyu+RDD?=
 =?us-ascii?Q?EyLL2tedbViUqJbxFewtYxgrdnGo7GFv2pr4k7FursML6TKaoFwajrQ0xVjP?=
 =?us-ascii?Q?fwOc5j3gV+q/w1GmdAGRK6hS3YZW+pawWVj51oM8QAG8R9ct9cjdGtNUM+H8?=
 =?us-ascii?Q?h+XOp7PdDv91zkCWaNQbyHyP+K9GAJTFD/oZUTvBzuzANObJLtqTZjnSnIbZ?=
 =?us-ascii?Q?6T+7tYR9C6DFDsv4xxKvaBx08zmVfSwFZYJKNsGlWNFZVmqM616FySjK2Hx3?=
 =?us-ascii?Q?rc+dSVxDqbZM5RoAC80f1o5IYC8V4Z45BMCsevTwQq0zLxypJ69p8UJAotP6?=
 =?us-ascii?Q?6d4RMOKzAfdV2kbEzvl3G+r3Jb9X3RZqnkAcX9/vsrbcOJAV2mlJIjRN/TEc?=
 =?us-ascii?Q?gfAoTEdVR7QQj9s4bJoekcECfpH/jU1R3JwATotOTl+NjbpK2KDg7is2ayj7?=
 =?us-ascii?Q?1a7eKrI4vIU3NMoSZjPQTqo+PGqWsmDu2L5983F/A8rvQQ6/GueuBF7GwsUC?=
 =?us-ascii?Q?4ii5JmgnUb/a4mg8sxCuS1KT?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd858114-7611-4537-6d88-08d92d072de5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 18:31:50.9519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dj+KjxuXkrj/2ktvRDIzi2LOj9dvhMp7YVX5FchL0Jzrez7zHz/zthNZix0W4r7XTUfhXHdq1re6nzPcXRAOOX0+3io5fxpBkJGgD6JdOfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5457
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10012
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106110115
X-Proofpoint-GUID: vnRcd-RkYG3eySHR9N5s27tJbkEEdPrW
X-Proofpoint-ORIG-GUID: vnRcd-RkYG3eySHR9N5s27tJbkEEdPrW
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 pbonzini@redhat.com, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Following the guidelines in tests/qtest/bios-tables-test.c, this
is step 6, the re-generated ACPI tables binary blobs.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 tests/data/acpi/pc/ERST                     | Bin 0 -> 976 bytes
 tests/data/acpi/q35/ERST                    | Bin 0 -> 976 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 3 files changed, 4 deletions(-)

diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..7236018951f9d111d8cacaa93ee07a8dc3294f18 100644
GIT binary patch
literal 976
zcmaKqSq_3Q6h#Y^dE9^rOK=GWV&b1h{BUvZ#VzQD#NN_}<VJW2!{zj}Jj(Gp++KlF
z-m^RRr=jicm%cUSDW!0a>)srw9ZqJfYH@yl5T!<U;}M6C67CcCCp`0jI3h}X4Z*CR
z@cQFuhiLM(wSRu-xcHA1F8zhXBbq;Aj)oWS$Nk6T$K>0*@ExA}PsmTmxA~y7^f&wF
z`=C;Mzb#Jlr!;>?JY$ah@BPi%Ksot29-5N<Er=Hro_R^UWRASiUqyaJzRfE>hSucQ
c<lDT_e?xvlzRfG^WB(fYq22#4zMDpU0r#ed0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..7236018951f9d111d8cacaa93ee07a8dc3294f18 100644
GIT binary patch
literal 976
zcmaKqSq_3Q6h#Y^dE9^rOK=GWV&b1h{BUvZ#VzQD#NN_}<VJW2!{zj}Jj(Gp++KlF
z-m^RRr=jicm%cUSDW!0a>)srw9ZqJfYH@yl5T!<U;}M6C67CcCCp`0jI3h}X4Z*CR
z@cQFuhiLM(wSRu-xcHA1F8zhXBbq;Aj)oWS$Nk6T$K>0*@ExA}PsmTmxA~y7^f&wF
z`=C;Mzb#Jlr!;>?JY$ah@BPi%Ksot29-5N<Er=Hro_R^UWRASiUqyaJzRfE>hSucQ
c<lDT_e?xvlzRfG^WB(fYq22#4zMDpU0r#ed0RR91

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


