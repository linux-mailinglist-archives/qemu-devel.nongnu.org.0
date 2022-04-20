Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1A5509159
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:22:49 +0200 (CEST)
Received: from localhost ([::1]:33506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGqe-0001fC-Pv
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nhGgR-0008KW-MM
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:12:15 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:41314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nhGgO-000478-I2
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:12:15 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23KI3evo024789; 
 Wed, 20 Apr 2022 20:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=HwwnXb8dJ72MK6fvvPt53KUI7/Xp1HeXZmkwnufSzE4=;
 b=hVK77Hqp9oaFTbbaoRywHAyOQc8Q18GqKXVFyr42arCg9IPlCDD7gW7Y2b8LKnJWf8id
 xTmZcpxsNAsQ/pMOpoz8AvjEj9ci82NPPAUuDtru8R4gU0KC7oSCJfcUSlIN5Vqltful
 FAj4tiZH4ykA0ShVjmvVX890w3CB81mN+CpfC1lolQIodZS3zs3IL3rkhIfYfSJxdz+R
 KfkjrNH+Wuy8m0znaHJFbyPSWIYaCTn6qDDao9xplRDzAZ1fJZS3g2zQBo2tCHfBdxvf
 Wa8T7hZ83bHBFzc0+6CGM/JXX5iNwuqHyzE9QjEypaTTole1kgnaQKuB/xa0WlSPMhje Ew== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffnp9hxyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Apr 2022 20:12:04 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23KKAkkB028909; Wed, 20 Apr 2022 20:11:57 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2043.outbound.protection.outlook.com [104.47.73.43])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3ffm8872xr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Apr 2022 20:11:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THjH0YVQQ3zQ/oniyEnfFd4J8woN80k3nndhfBzEGQgqjkgFvg3yiKfFP8bjna6xKkKb+NF8PIL2Rpt/6PHvr34/77PovvaF8UZ3LJBKCR+1a63kUqcQRyyWqkvgv9dC+ntZD0Pue/48tfDcUUsxPnhe2zxClz0P6CEGXwfSd5kaAR1WtM/a7L+GT+brV+4pLxy6Nu7Sg+kVcv4j9/4c6navc1mF/jQQY/YIrjxUgVXYegplFA1JjF+gR9+3Z+c10lVz20ise+aUobctiam4t5hQ5qz+1kZ+IMaMv/VsmNa7klLI06lYIbANDhlwOiE0cxZV09i5Pp67RTJHCfkmUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwwnXb8dJ72MK6fvvPt53KUI7/Xp1HeXZmkwnufSzE4=;
 b=I+vYl3ml6zUtL7B8q+Q4FqfLyiYucQ6z/VexHngBPq2yIP65vpPgDnxxnilmYbgb9fbg1kS5gYwFRlTqKbiqOFE/SYPyyQxB49m9FvhL7EkuWmdSUSw31aas4D3x+Qnz6SgKAFWsWCJwF8pw23cb0O03beDEJ0l27qEexCNkwM+Aib4cx7jeCClVZBlzlqa/as/VQ3BjQLAle4VAqotzmvphl7/amel0bs6P5YZkqTM0g+RYKOreC9TYskosDddi/7vn9Nl/XaeajiRT6bq0zu9B7YBP3skCEYhjE2JwWnNF/8zMxzbQTf0MALYOnZj/grkJNf7lRhrNMaqHyT1nDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwwnXb8dJ72MK6fvvPt53KUI7/Xp1HeXZmkwnufSzE4=;
 b=o4HqQNK1V7CgFrfvP0eI9hLmnI24d/yDi+oLXedCf4Tvwgsb0il3OqSx+zwFnJWRXJtw1nyC4VDGA3lzDnJJSz8yA2XgUpgKiXrtO1JEqir6ALOEkg/iXmNsMVz5WtCO6IHaiXwHVl5Y60CRBS0Cbo4TBRblsHGMjtOkVNLM+BA=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by PH0PR10MB5644.namprd10.prod.outlook.com (2603:10b6:510:fb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 20:11:51 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d17f:a2a4:ca0c:cb49]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d17f:a2a4:ca0c:cb49%4]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 20:11:51 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/5] i386/pc: Fix creation of >= 1010G guests on AMD
 systems with IOMMU
Date: Wed, 20 Apr 2022 21:11:33 +0100
Message-Id: <20220420201138.23854-1-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::10) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce8c4563-d244-430d-07cd-08da230a0183
X-MS-TrafficTypeDiagnostic: PH0PR10MB5644:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB564496EA85A1C8C6CCB2C1E1BBF59@PH0PR10MB5644.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9tr2mqr1kjR9+VLXE/ZnVjFkdxBfuT6omsUbFzejIo13Lq8nSVC+I026wNjaddcAFqxS6NIJeDyvJTkPJGjv44ySd4+xo9Z9sr+TnQPEStI95ART+aV5etVKEarVI7UNyihzNrdFPwC0GjpZwHyeBmdWl0UeFPMZ0/MDbpOIrr2ZYjQq/SFXZ972ql0C+uYsDHuvZCiwZouUJg8ERYjYSP9nl+NyUm2cFnFUlkQ7jd3xe60rYRxzQP+OW3OLL8GLOuKE2VEi+pkHCn/MfVXJUleCy7VaaaYIFsXtlJKcArRGA3Tw+BomH6OVp6K72P5mrQqirbscA3vfg1guuWj+a5yuSoE9xKLh0d11UbqhKobov6Lyxl43bE0A8252P/HBRcrcKJPmGvJNaahPIMR71qm+lWSb2UuJLcd/SL0zb7HxGhwSrS5KySYdiJWPpU56JMeJ0fxluUduVVcZP2v5gHmF1RmDCgPKqFsUImf9IxTovoqj6O3/RQEhgnNanz6/QbaPKzAH/UMnDbgc4ObZtqXJG/c6x1QE/o2x/CtAFx+BEJhvaCL0IkCgEVjHNSzjg+5fKG2e8pEqwM6YSanmhOVrC/bJ4fyj5+WCTw/dlWAQVP4R/uJpwdNj3dZzK8UmfpLwzBNZaMRoWrNaog1lD6zQLOQoydjGeIHii0P4b3owX/2yO+HY9WDbZ5tMrze7W5FghPQmiAHXAqmsyJTF3rjjTiUScftuYhNj2BndENr7eLiKEmpApEUBusk+JGRp1ciEa/9EtaOU1w3PnK42Sr+TcM9EQ2xcnPJvOvlhUskA3X5RjUxs+n6Z07x6zqcsFWYONM4g8u4R7WOYHa3bZmMwFfzNrI3mwM1UBAHuYqg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(1076003)(186003)(107886003)(26005)(6512007)(2616005)(6506007)(83380400001)(52116002)(36756003)(6666004)(8936002)(38100700002)(2906002)(6916009)(54906003)(38350700002)(6486002)(966005)(5660300002)(508600001)(7416002)(66476007)(66556008)(66946007)(8676002)(4326008)(316002)(86362001)(103116003)(43620500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DpsbjW1iqzThgke3k0pDgpoMSTml+uYJtb0t7+AP0OnKjD/M6PHT4qFW6As+?=
 =?us-ascii?Q?aVQYi/DAKQB0ynN6swS1lV5CL4Hq6zHjk8VMY5IE58nELfB9Gr7FD5qwqxj5?=
 =?us-ascii?Q?b2AMR228TUMMpxAs2Aopbj26EIVmsfTetlQ5gPZZWEDAIZ6GTdyK7yDTg7x1?=
 =?us-ascii?Q?/EQhP3tjnvDdjFcNvVzZNT9tWFokKiUs5HUnCtoq4QGxHiH+CarRlEyPZp17?=
 =?us-ascii?Q?eUmiQnYs+FYoSRE5sGzhuzWe5stTuvlR9auyyIBiIkHLfAHVxRFkdnrAmSsm?=
 =?us-ascii?Q?DV325dJMwV7ax1k4w8e72G6CInThpYTdKzsN+Cff2PnpJ7JKRjRBXxnXA9Eh?=
 =?us-ascii?Q?1Slj6h7lKPOA2wBwxBlNfVSV4M9746mCNvkWy/IdCcmbCLgYIMPYMGmfPCt1?=
 =?us-ascii?Q?j1ClEVA5reYoyos9uQJ4QTw0YiDqCmCScs5fksCJZw1eLkuK7waVnbSmG8S2?=
 =?us-ascii?Q?vD8Z/yCm0zHmXsreU2GBu29fvNwHxItr2IQfstQUui/SokDSaPhnjW6r9nvQ?=
 =?us-ascii?Q?h/PvZu2+uFpLKgxL+aUViW7m10AhJho/vDMSmL5aY4gUmi0rXzha/6B+we2v?=
 =?us-ascii?Q?56dDPgGOLQiyi9PHzx3vzRpuPXnlUhVaZ/XE5TIjJTSXwCFDow6rXvqc2D2l?=
 =?us-ascii?Q?9zJYKY2+hRFZXSggWp+7dvbkJYZf++TsmNpKb7VOx7lu3HAB/eRg5TWF0rYB?=
 =?us-ascii?Q?ZM8EnQoeAewAd9OqVg7Uz2JqC6rrO4WXZgm7kE7cH/No+Seu2crn3WUuWbsh?=
 =?us-ascii?Q?/YpuapQb5KilVyNDD0VuN+wQLmeBhgBfJg1d7mTN8CvpEm6D5sEQx+AzYii2?=
 =?us-ascii?Q?TcidHh7ledQ2qs6xNw7XcQGl4HVbOdjMfsKloaplgFIQ+c8qwMVQNH32doVx?=
 =?us-ascii?Q?KCk0mjBUpgS8x4VjFhaoWiir6iUZthHRu0Xz5l5Xco+qdjARQ8lzJF5lJKdJ?=
 =?us-ascii?Q?L1Ob+/7vM+05gbiq+mw6hHPdIvkArvahqG5gnVrXen8Zo1nmZ+Ni9aGL6oTq?=
 =?us-ascii?Q?UsCqBTstHqJUgziRzgxTnoh/mvBVE/awqPafFkxQvIMS9bKg7yO+gkWqJ2wH?=
 =?us-ascii?Q?c6JHfHZCNlbHX3F2HBv2QSHhCPVbg50SIpQEH+Z43sm6HibbVUqSe6GuH1Qp?=
 =?us-ascii?Q?Hl39wh+CyPkdIHqjQZunKcB2ud2YOGrH6044aeHM17A+JkUydDO55TcR7Kgm?=
 =?us-ascii?Q?m3rt13Z5xQblN++/WbdDulqsZjCZ9Dp4/wR4goLcXj1KHBg307RoXwfUFxO/?=
 =?us-ascii?Q?cGQPZOVuwu0kGyvXufrXF8QbWs0vOYz0elbwh5TF11h4R8qpIVn+s0cw7Vw6?=
 =?us-ascii?Q?vSyeb3GGFI8g82HJ3s+NxS7zMBowr4indNt0mAzAlhHY1sioBLJeNw2dvQta?=
 =?us-ascii?Q?7FfraehNbn1n9IE0R7NHjOSr7j2AcC1LPhSxCDn8QUJRlUttRKxUTPbkyOhQ?=
 =?us-ascii?Q?CP4ifJaY4mqqVgIv8G83ta6cnNu33ScktQPoPu06nhtwXVjEFWFFhQ/hTlE8?=
 =?us-ascii?Q?d8gEdjsm2d5mt3GLd4Rew9gZdhnPcKdziLOnMMoAFmnofptpctijVW1zosRo?=
 =?us-ascii?Q?0ae3PhRU5jo0UAfvJrXArf3MpKCJqzBrwPP4oWGnUpeAFpMvp//aOWn93bxY?=
 =?us-ascii?Q?LxazG0ZpP27mToJW2Fq8dX3jH58Exutr+sEkdti/XkLk3yix3jKiDhhMX4n2?=
 =?us-ascii?Q?/+i7o9Hm33l4QMKh4SopDuWULLvKKtO1B1V74h+26G6IXnqwcfrAvtJbjhP9?=
 =?us-ascii?Q?r44Vk8zGCkve1IOVAV2PFAAepeMAG1o=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8c4563-d244-430d-07cd-08da230a0183
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 20:11:51.0543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MT5E+g0Y+MAt2UeUxxbYnJRfdrMOTjL8y1hfiDuDgPJww3eob9txnOWXN65mHp1teoKoD5uMtGnbJ28Y5xul67jtzX7ZQ8YkLfeIdAlDIKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5644
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-20_05:2022-04-20,
 2022-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204200119
X-Proofpoint-ORIG-GUID: XaY9MklMAcHispo9Rstwwwtqf3wWu5pk
X-Proofpoint-GUID: XaY9MklMAcHispo9Rstwwwtqf3wWu5pk
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Joao Martins <joao.m.martins@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v3[4] -> v4:
(changes in patch 4 and 5 only)
* Rebased to 7.1.0, hence move compat machine attribute to <= 7.0.0 versions
* Check guest vCPU vendor rather than host CPU vendor (Michael Tsirkin)
* Squash previous patch 5 into patch 4 to tie in the phys-bits check
  into the relocate-4g-start logic: We now error out if the phys-bits
  aren't enough on configurations that require above-4g ram relocation. (Michael Tsirkin)
* Make the error message more explicit when phys-bits isn't enough to also
  mention: "cannot avoid AMD HT range"
* Add comments inside x86_update_above_4g_mem_start() explaining the
  logic behind it. (Michael Tsirkin)
* Tested on old guests old guests with Linux 2.6.32/3.10/4.14.35/4.1 based kernels
  alongside Win2008/2K12/2K16/2K19 on configs spanning 1T and 2T (Michael Tsirkin)
  Validated -numa topologies too as well as making sure qtests observe no regressions;

Notes:

* the machine attribute that enables this new logic (see last patch)
is called ::enforce_valid_iova since the RFC. Let me know if folks think it
is poorly named, and whether something a bit more obvious is preferred
(e.g. ::amd_relocate_1t).

* @mst one of the comments you said was to add "host checks" in vdpa/vfio devices.
In discussion with Alex and you over the last version of the patches it seems
that we weren't keen on making this device-specific or behind any machine
property flags (besides machine-compat). Just to reiterate there, making sure we do
the above-4g relocation requiring properly sized phys-bits and AMD as vCPU
vendor (as this series) already ensures thtat this is going to be right for
offending configuration with VDPA/VFIO device that might be
configured/hotplugged. Unless you were thinking that somehow vfio/vdpa devices
start poking into machine-specific details when we fail to relocate due to the
lack of phys-bits? Otherwise Qemu, just doesn't have enough information to tell
what's a valid IOVA or not, in which case kernel vhost-iotlb/vhost-vdpa is the one
that needs fixing (as VFIO did in v5.4).

---

This series lets Qemu spawn i386 guests with >= 1010G with VFIO,
particularly when running on AMD systems with an IOMMU.

Since Linux v5.4, VFIO validates whether the IOVA in DMA_MAP ioctl is valid and it
will return -EINVAL on those cases. On x86, Intel hosts aren't particularly
affected by this extra validation. But AMD systems with IOMMU have a hole in
the 1TB boundary which is *reserved* for HyperTransport I/O addresses located
here: FD_0000_0000h - FF_FFFF_FFFFh. See IOMMU manual [1], specifically
section '2.1.2 IOMMU Logical Topology', Table 3 on what those addresses mean.

VFIO DMA_MAP calls in this IOVA address range fall through this check and hence return
 -EINVAL, consequently failing the creation the guests bigger than 1010G. Example
of the failure:

qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: VFIO_MAP_DMA: -22
qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: vfio 0000:41:10.1: 
	failed to setup container for group 258: memory listener initialization failed:
		Region pc.ram: vfio_dma_map(0x55ba53e7a9d0, 0x100000000, 0xff30000000, 0x7ed243e00000) = -22 (Invalid argument)

Prior to v5.4, we could map to these IOVAs *but* that's still not the right thing
to do and could trigger certain IOMMU events (e.g. INVALID_DEVICE_REQUEST), or
spurious guest VF failures from the resultant IOMMU target abort (see Errata 1155[2])
as documented on the links down below.

This small series tries to address that by dealing with this AMD-specific 1Tb hole,
but rather than dealing like the 4G hole, it instead relocates RAM above 4G
to be above the 1T if the maximum RAM range crosses the HT reserved range.
It is organized as following:

patch 1: Introduce a @above_4g_mem_start which defaults to 4 GiB as starting
         address of the 4G boundary

patches 2-3: Move pci-host qdev creation to be before pc_memory_init(),
	     to get accessing to pci_hole64_size. The actual pci-host
	     initialization is kept as is, only the qdev_new.

patch 4: Change @above_4g_mem_start to 1TiB /if we are on AMD and the max
possible address acrosses the HT region. Errors out if the phys-bits is too
low, which is only the case for >=1010G configurations or something that
crosses the HT region.

patch 5: Ensure valid IOVAs only on new machine types, but not older
ones (<= v7.0.0)

The 'consequence' of this approach is that we may need more than the default
phys-bits e.g. a guest with >1010G, will have most of its RAM after the 1TB
address, consequently needing 41 phys-bits as opposed to the default of 40
(TCG_PHYS_BITS). Today there's already a precedent to depend on the user to
pick the right value of phys-bits (regardless of this series), so we warn in
case phys-bits aren't enough. Finally, CMOS loosing its meaning of the above 4G
ram blocks, but it was mentioned over RFC that CMOS is only useful for very
old seabios. 

Additionally, the reserved region is added to E820 if the relocation is done.

Alternative options considered (in RFC[0]):

a) Dealing with the 1T hole like the 4G hole -- which also represents what
hardware closely does.

Thanks,
	Joao

Older Changelog,

RFCv2[3] -> v3[4]:

* Add missing brackets in single line statement, in patch 5 (David)
* Change ranges printf to use PRIx64, in patch 5 (David)
* Move the check to after changing above_4g_mem_start, in patch 5 (David)
* Make the check generic and move it to pc_memory_init rather being specific
to AMD, as the check is useful to capture invalid phys-bits
configs (patch 5, Igor).
* Fix comment as 'Start address of the initial RAM above 4G' in patch 1 (Igor)
* Consider pci_hole64_size in patch 4 (Igor)
* To consider pci_hole64_size in max used addr we need to get it from pci-host,
so introduce two new patches (2 and 3) which move only the qdev_new("i440fx") or
qdev_new("q35") to be before pc_memory_init().
* Consider sgx_epc.size in max used address, in patch 4 (Igor)
* Rename relocate_4g() to x86_update_above_4g_mem_start() (Igor)
* Keep warn_report() in patch 5, as erroring out will break a few x86_64 qtests
due to pci_hole64 accounting surprass phys-bits possible maxphysaddr.

RFC[0] -> RFCv2[3]:

* At Igor's suggestion in one of the patches I reworked the series enterily,
and more or less as he was thinking it is far simpler to relocate the
ram-above-4g to be at 1TiB where applicable. The changeset is 3x simpler,
and less intrusive. (patch 1 & 2)
* Check phys-bits is big enough prior to relocating (new patch 3)
* Remove the machine property, and it's only internal and set by new machine
version (Igor, patch 4).
* Clarify whether it's GPA or HPA as a more clear meaning (Igor, patch 2)
* Add IOMMU SDM in the commit message (Igor, patch 2)

[0] https://lore.kernel.org/qemu-devel/20210622154905.30858-1-joao.m.martins@oracle.com/
[1] https://www.amd.com/system/files/TechDocs/48882_IOMMU.pdf
[2] https://developer.amd.com/wp-content/resources/56323-PUB_0.78.pdf
[3] https://lore.kernel.org/qemu-devel/20220207202422.31582-1-joao.m.martins@oracle.com/T/#u
[4] https://lore.kernel.org/all/20220223184455.9057-1-joao.m.martins@oracle.com/

Joao Martins (5):
  hw/i386: add 4g boundary start to X86MachineState
  i386/pc: create pci-host qdev prior to pc_memory_init()
  i386/pc: pass pci_hole64_size to pc_memory_init()
  i386/pc: relocate 4g start to 1T where applicable
  i386/pc: restrict AMD only enforcing of valid IOVAs to new machine
    type

 hw/i386/acpi-build.c         |   2 +-
 hw/i386/pc.c                 | 126 +++++++++++++++++++++++++++++++++--
 hw/i386/pc_piix.c            |  12 +++-
 hw/i386/pc_q35.c             |  14 +++-
 hw/i386/sgx.c                |   2 +-
 hw/i386/x86.c                |   1 +
 hw/pci-host/i440fx.c         |  10 ++-
 include/hw/i386/pc.h         |   4 +-
 include/hw/i386/x86.h        |   3 +
 include/hw/pci-host/i440fx.h |   3 +-
 10 files changed, 161 insertions(+), 16 deletions(-)

-- 
2.17.2


