Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D880B6E6A3D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:54:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pooZj-0004eP-8j; Tue, 18 Apr 2023 12:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pooZd-0004do-QI; Tue, 18 Apr 2023 12:52:57 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pooZb-0007Jb-2s; Tue, 18 Apr 2023 12:52:57 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33IExOx4015476; Tue, 18 Apr 2023 16:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=TDSPTZar6OmG5jW4KqING/gHYI9+cW7ayakS+3Vpox0=;
 b=lJc8oFFhYf1VR/QI9BjddZEjGH9tqqEPuVTvH1UrBEX7kkBxmrkL3DCmqRsMhZtP0FVC
 WSR0Iwf8Lt8kB3mFq7rw+lPf7Lvh1nvHdCmxGk1PHplJWBUYe0QNCBTwapaTWT7VeCXz
 fzdf+7K1U2O4JBHkZxufUlYgYxgCCyioHDZ+xTrpg2lfvp+hdHek9dNs3YcKIWPFAm65
 peVm3HB/Dg6pqNKiwYH0jkngEUnLPpO7VvgA+vXzr5DgvCpHiayt4vEJlRCUER0desSm
 qDth/xzEYNeGrmhXrjBssC6OfmTFcnVKT79yYv/5qkHOiEaMqIZtBj5TQPoF/OpxbUXE 9g== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pyjh1p94e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Apr 2023 16:52:49 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33IFW71G011054; Tue, 18 Apr 2023 16:52:48 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3pyjc5aq9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Apr 2023 16:52:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sk9qgKj8S53hRMim2ogNERS1PQovARYSMjPQXQiYJcHyE8yfMlOCrwYJGJGEe4A0WDavT8J8zuXpK+iZdYQMXnnH9Ea97e9l1e0aYRqYNtJdRmHZ437HMnqf/iNrFXSMvyHE5sHHl9fJnVDPlA0UXb8o8aIUfOTRivLRbq10CAf1BtsGcGXbOUq2lYM+jI0qQGKQYVBjCUWtEnKZ0VL2x7C3qWOPbeJ5TwrrTywsAQn6ZmYPb/h7IgyXY1Dfpajk/L2BbpEnz4NVe2a2UFbFAhFeba2SfjaA2cDMWZk7ariMKYJCTjffHpGEUjGlRFjEitq1yyTBMqc2oUGTxGiWgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDSPTZar6OmG5jW4KqING/gHYI9+cW7ayakS+3Vpox0=;
 b=knE6TCzw5ANDzPrnQjo14Sli+ih2Y8b1ZV0Qn8/HjKsCRMAifMNXo3H4h4K+hTAdh8OcNLWSurcZ5LiNDIAc80cFxD36fd0UVPNs7RLiGkKHBys5KSMH9DW4TlNFnYlLHA8FIEqdGX3l4b7P+CrnJwi2JY3/vq5Pa0kL3/zbe9vg0RIhvXkyiu17bf6jq3Okiaz6MqUpJ2i8H0sAbGDIdQfygLxQDBQelf9Mp3RemLwnmbqcDNspQg3r+6AKl8Hpc1ShMegWUcW/8p0RG1WmZXQAv7HataOCma48A/ei2oIRFBTnkienBIU1ZmNSlLJwyTdcj4WYmtuQA4eutTeT1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDSPTZar6OmG5jW4KqING/gHYI9+cW7ayakS+3Vpox0=;
 b=vWM+6u3IYs7RlaTFOQKZrYddg0RWJ0rZ3L4OPt+yc4dP/DySUuBm5LYKz64pY6l7ol4Tpb5gDcWtrC8l4qhKeL0+TS1IiMGGiUHJjrpzxHNzxALFR41x8PRzr/hwZ16KUZq+89vR7Ya00OutqUBhKAMYAB4nto5B8sVurytZWJE=
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by DM6PR10MB4298.namprd10.prod.outlook.com (2603:10b6:5:21f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Tue, 18 Apr
 2023 16:52:45 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::ad42:b11a:662:9466]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::ad42:b11a:662:9466%6]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 16:52:45 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: shannon.zhaosl@gmail.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net
Cc: boris.ostrovsky@oracle.com, eric.devolder@oracle.com
Subject: [PATCH v2 4/4] ACPI: bios-tables-test.c step 5 (updated expected
 table binaries)
Date: Tue, 18 Apr 2023 12:52:19 -0400
Message-Id: <20230418165219.2036-5-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230418165219.2036-1-eric.devolder@oracle.com>
References: <20230418165219.2036-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0272.namprd03.prod.outlook.com
 (2603:10b6:5:3ad::7) To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4542:EE_|DM6PR10MB4298:EE_
X-MS-Office365-Filtering-Correlation-Id: 36676633-d5a7-4c4c-50cb-08db402d5514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v4TAyydeDO2vKe3136n6nBwA81Gjo/IFAFbAvpjRBL7P4IqjIooPncWcof5hzSm4fyaWVFncjmsK9SOt0YpVSiav3Nrj+wxsp6xls/FozbewwYNPVljROHEJdGenHCOhk4/Dn2VNtbdoQUcJy8hh5ekY5uuoARv7SevC30UdsgMJFr/NKhIEn1bmdExVRbBL8PKtpFYRt++ScqA9XgbayovXJVpK6rVWJGGKYJ8EriOv2I057ZEHoZReFz2+SL1PhwbNOVg9wE07G8fmesEKhQin3bS8V3IBZ8T2PmLfno1WPfMA/VY3DODFC57PhhDj2FwDiR6D3WuIXp4LcaC6dwIw23cyo7kE6anLJ4wyuUECcBgGjcuUUsJ89Hykw5v9Ey2XsnWfLz2Of/ZiaUm0ZUG2TDMhnV9pzRsDM5Zb3QPFexvtIn5oPtLYexz/PG2k0j3hYHvDIGaJfFnoMmCNzgtVM0bAMGJT9no/twYZFWBBz5RobKdYtWEszUrcxRhWrbb5DjxLhHB/OrACff5OJ7Mr6fBRLi6143BJuj3ai/QE/2um70mSW2SCsPXzKWP/io7ZYb5CpgYcFsbhXb4RqcFDj14uUHCIwXKS1SRaDIc1pwrdQClsDOjXJURwZrra3gPPb+yOrHP9HUTlq7lMRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(366004)(376002)(396003)(39860400002)(451199021)(4326008)(316002)(66946007)(66556008)(66476007)(36756003)(186003)(6506007)(1076003)(26005)(107886003)(6512007)(38100700002)(2616005)(83380400001)(5660300002)(41300700001)(8676002)(8936002)(478600001)(6486002)(6666004)(2906002)(86362001)(921005)(7416002)(30864003)(505234007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DZiPNoy7j69WLm/hbuKbuok03dVrT7tcdRlZBOo0wD8uNMrdDQCmWJJbnVp+?=
 =?us-ascii?Q?z8bHpbnxyTCWSbRXOIQaweYnxO0jfXSmbrTTN9O4Advd1J0a5x5sNmNoFmN7?=
 =?us-ascii?Q?Zg4CCr533hpVDx04JsCF4tI7+xCmnKp32Ieaminhgswum/+9sC3FBSn7GxXH?=
 =?us-ascii?Q?1mZE6KiK4LO3icZOlukCiBgstJx0SUWHyATqkvNVmTCa0Ug59QWg2+jpXMvT?=
 =?us-ascii?Q?UDA1oIb57uYpDQXDvFgBcHtPPk5SmDVs3M3YJvNPuiysdsMmLlW0YMZLgj+d?=
 =?us-ascii?Q?1d1+8qEA4odnvCD9wkFIkmmYjc1XEfJCR8nhmjgPrzVV3HmyMp4yo62BdPjM?=
 =?us-ascii?Q?BVILGg2Nvv4BHRpHZx/Yu5UVufOEPDS3dXuTbMYaraDESXpV9dhc5bAFyqn/?=
 =?us-ascii?Q?GLGZ88h3SHtNH6vpXA6NUdZQR7i5lpioGO50iK8Z/H9I+eVQMvw5j4yNwpDE?=
 =?us-ascii?Q?0HWRJzeNbuZLdMCiC27SIXNoyRySf1u6JPp5ZkG0oH/51ktisfRQVUcfWZeF?=
 =?us-ascii?Q?aN9W9b/wAvTNgkMYJ8swJvOy1vgWYvtLyua86CtQmZyK6m3INkeY1TybiwGF?=
 =?us-ascii?Q?UaVH3q0cgNl3fNl1e7Xg8SSufIkUf8hhsgnAECTsjGvF9qXea9s1xw8Yi4TA?=
 =?us-ascii?Q?dMdU61eHkRJHAex/n91WCGz8eBSxvNfcPrlVRcZ1nk0SZ1SRKjGZ4MMc0WLP?=
 =?us-ascii?Q?AJR3x1gEXLOwIuUds0GoPf7SRKD5CxXw9ksbfnIP5xGRDHSIqwYwZzsxAaQc?=
 =?us-ascii?Q?z8hVVghVWzsitbLEEoVM3GkGKKoYntfFZ4TG7dTZ2K+C0narr7Z0BMsPDhpe?=
 =?us-ascii?Q?iHLuvYzZIRvs6/N6H69ZyAlhXhSl9vH3lA412/GBsg011JFMfdZQGn8b3ecC?=
 =?us-ascii?Q?j5LA3ocFVeWnRqR1enAsXLfyAOACGZOADSTlvvc80LnixzBZHhlgloUdRZqr?=
 =?us-ascii?Q?HFlpq4e44ToGTzw2WIO9rGxhKjuscarP6LL75ME/zyWap8LBe4CQuywx1gnu?=
 =?us-ascii?Q?hHAtF7Da4h8iorlk79HF0xgW+wBQ3AA4CWe74R+0m6ncTRmqsgvY89bbN7Ns?=
 =?us-ascii?Q?Fc8OzHpjjwp1JBwq42ifOJZfmlWB/tuD9remFI30p7b0w47Wt30vHdqPQwTd?=
 =?us-ascii?Q?N/IKV/XI3opo71HBlXGdROc2csi9awYz0EBNTqTcHEywR9n5h7naS0vL3GqY?=
 =?us-ascii?Q?oiRBT5QwvTc+z0uDzvKcPyEMmug5prtqr78n9g4U21S0ZDNRS8z6W+cLdj31?=
 =?us-ascii?Q?B0cQ4Eijrz++OVES+m8NoefVJB7732/humKUgSNRmQamupbrbEG+Vsv8D1cx?=
 =?us-ascii?Q?/9nOz0unAE4TscApl8K49bKjSWaMP5s7nBZfEecMUjEABzdzIoqRG+6yLR9l?=
 =?us-ascii?Q?Rx5neHKJmEW+MeRCW9QbQYHRU0F4hqscO6oT6B8Jh7kLxuo6UzCQQQAclNEi?=
 =?us-ascii?Q?ToOnFFD/ignfo5AxicYLQWsL+f0iRL/bIPoTIXX56QerjMoI5zNxYOfXK5mw?=
 =?us-ascii?Q?7r6YTP2MKvVxruLcpEvhTuf8u+irsl8zdCXeh7GwG8PJ6hj47Rxx81MMahtW?=
 =?us-ascii?Q?cLQ9o5k1450e5PZ6DL2fj3n5tnXpNav5ebBdDbNY8pzq5sw7iiPo9TBPlMLC?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: R9sX+oD8b9tBKGSWJ42Ho8pSXuZRFd1m0bcxxDUsvDHCtjsVRBuQkw4IrhH/rNEsS2Vzgj/BOVyrLsgBGNx88XwIPBdFo2H1btM/MnVeQMU0L/U1dW5197x6HqWnIusztftZJvk0iHyK/puoaoZHksRIOSy5nTADFAkqh7GSsiA+g+fkHhBdUz2hrIh0aXhPX/PQvxYO6VllGKwg55IifytjI935XpkE96/oBZewJDjsc6ElvSp7KmbCEhpWOHWlQe4nY6BhsTtorFJJbcKv3gbEX+oV62/VUYF/+EA7dgH80YqJYs/tNWl9jeYRgfLq/EPQjq7SYUVLk3dzF4d2hL+JhJvwnvH1BZEKPgWnuJydRrAB1wV+AtDvvod8ethTezkinXVWSFhWodKXxfTWUVaPH9oaia7HOmcZfZb4hkjjgCxXa7AHGS4fZQxlSXSR2Vtmw6HHfIFNhbA/2jOOPu8H+nguR6a8p/REjYf+ke1KiVEEfAvFa7iKvDYorZFgfRFNt8MOZdNkzc9kj2mSpMOO3hjUMD+GBXDhmyokPXMZAmjLYImankP1SiAPnRWzx7Ypv5SlDiT1q6ogyddxTqOZJi0qtexo972siZFZe3rp13GgjhaBf04TR58KgSGIlRNeKnEcouWcDWy2B3eFNxD+NTJfhZ/2JOGAtEp6ukxNkLC8yPpww9BnWYhyrU6K6PaB6HeF3SZfRG0+jjHLw2pwZdZ3aGM8e2oHuNb3xQ9Ww8RAjLbUX0CMp2B19Xe3gDSEUdEYePqDLAnmFilgD131oa3OrWvtu7rB8ZJJAAImQes1bYsJNHTZbqaOImD1lHEQgepEMlCjewRTcA7VJD31aR7qgkz2lFaGlef5pdTqr6cK9UR4kmhrUVqC572KG9B7EpuZg+aX1zrUGQl7kg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36676633-d5a7-4c4c-50cb-08db402d5514
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 16:52:45.1794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jsukLJLEgSgIakjYurbmwm4hZ6U9ZkSl/GoCcz1fVNOzOLHm7dHDwLcyZ18mUgb1sdsL+dYYk72DvPprkpWpXjsFm7tJt2HlCr15H336n1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4298
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_12,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304180141
X-Proofpoint-GUID: LD2nrSnJYvrrjMB4AZuz1p5xsCiUds-z
X-Proofpoint-ORIG-GUID: LD2nrSnJYvrrjMB4AZuz1p5xsCiUds-z
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Following the guidelines in tests/qtest/bios-tables-test.c, this
is step 6.

For the cpuhp test case, it is started with:
 -smp 2,cores=3,sockets=2,maxcpus=6

So two of six CPUs are present, leaving 4 hot-pluggable CPUs. This
is what the disassembly diff below shows (two entries with Enabled=1
and the new Online Capable bit 0, and four entries with Enabled=0 and
Online Capable bit 1).

 --- /tmp/asl-NP2E31.dsl	2023-04-18 10:46:26.483612104 -0400
 +++ /tmp/asl-C03E31.dsl	2023-04-18 10:46:26.481612093 -0400
 @@ -1,89 +1,89 @@
  /*
   * Intel ACPI Component Architecture
   * AML/ASL+ Disassembler version 20230331 (64-bit version)
   * Copyright (c) 2000 - 2023 Intel Corporation
   *
 - * Disassembly of tests/data/acpi/pc/APIC.cphp, Tue Apr 18 10:46:26 2023
 + * Disassembly of /tmp/aml-6A5E31, Tue Apr 18 10:46:26 2023
   *
   * ACPI Data Table [APIC]
   *
   * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
   */

  [000h 0000 004h]                   Signature : "APIC"    [Multiple APIC Description Table (MADT)]
  [004h 0004 004h]                Table Length : 000000A0
 -[008h 0008 001h]                    Revision : 01
 -[009h 0009 001h]                    Checksum : 18
 +[008h 0008 001h]                    Revision : 05
 +[009h 0009 001h]                    Checksum : 0C
  [00Ah 0010 006h]                      Oem ID : "BOCHS "
  [010h 0016 008h]                Oem Table ID : "BXPC    "
  [018h 0024 004h]                Oem Revision : 00000001
  [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
  [020h 0032 004h]       Asl Compiler Revision : 00000001

  [024h 0036 004h]          Local Apic Address : FEE00000
  [028h 0040 004h]       Flags (decoded below) : 00000001
                           PC-AT Compatibility : 1

  [02Ch 0044 001h]               Subtable Type : 00 [Processor Local APIC]
  [02Dh 0045 001h]                      Length : 08
  [02Eh 0046 001h]                Processor ID : 00
  [02Fh 0047 001h]               Local Apic ID : 00
  [030h 0048 004h]       Flags (decoded below) : 00000001
                             Processor Enabled : 1
                        Runtime Online Capable : 0

  [034h 0052 001h]               Subtable Type : 00 [Processor Local APIC]
  [035h 0053 001h]                      Length : 08
  [036h 0054 001h]                Processor ID : 01
  [037h 0055 001h]               Local Apic ID : 01
  [038h 0056 004h]       Flags (decoded below) : 00000001
                             Processor Enabled : 1
                        Runtime Online Capable : 0

  [03Ch 0060 001h]               Subtable Type : 00 [Processor Local APIC]
  [03Dh 0061 001h]                      Length : 08
  [03Eh 0062 001h]                Processor ID : 02
  [03Fh 0063 001h]               Local Apic ID : 02
 -[040h 0064 004h]       Flags (decoded below) : 00000000
 +[040h 0064 004h]       Flags (decoded below) : 00000002
                             Processor Enabled : 0
 -                      Runtime Online Capable : 0
 +                      Runtime Online Capable : 1

  [044h 0068 001h]               Subtable Type : 00 [Processor Local APIC]
  [045h 0069 001h]                      Length : 08
  [046h 0070 001h]                Processor ID : 03
  [047h 0071 001h]               Local Apic ID : 04
 -[048h 0072 004h]       Flags (decoded below) : 00000000
 +[048h 0072 004h]       Flags (decoded below) : 00000002
                             Processor Enabled : 0
 -                      Runtime Online Capable : 0
 +                      Runtime Online Capable : 1

  [04Ch 0076 001h]               Subtable Type : 00 [Processor Local APIC]
  [04Dh 0077 001h]                      Length : 08
  [04Eh 0078 001h]                Processor ID : 04
  [04Fh 0079 001h]               Local Apic ID : 05
 -[050h 0080 004h]       Flags (decoded below) : 00000000
 +[050h 0080 004h]       Flags (decoded below) : 00000002
                             Processor Enabled : 0
 -                      Runtime Online Capable : 0
 +                      Runtime Online Capable : 1

  [054h 0084 001h]               Subtable Type : 00 [Processor Local APIC]
  [055h 0085 001h]                      Length : 08
  [056h 0086 001h]                Processor ID : 05
  [057h 0087 001h]               Local Apic ID : 06
 -[058h 0088 004h]       Flags (decoded below) : 00000000
 +[058h 0088 004h]       Flags (decoded below) : 00000002
                             Processor Enabled : 0
 -                      Runtime Online Capable : 0
 +                      Runtime Online Capable : 1

  [05Ch 0092 001h]               Subtable Type : 01 [I/O APIC]
  [05Dh 0093 001h]                      Length : 0C
  [05Eh 0094 001h]                 I/O Apic ID : 00
  [05Fh 0095 001h]                    Reserved : 00
  [060h 0096 004h]                     Address : FEC00000
  [064h 0100 004h]                   Interrupt : 00000000

  [068h 0104 001h]               Subtable Type : 02 [Interrupt Source Override]
  [069h 0105 001h]                      Length : 0A
  [06Ah 0106 001h]                         Bus : 00
  [06Bh 0107 001h]                      Source : 00
  [06Ch 0108 004h]                   Interrupt : 00000002
  [070h 0112 002h]       Flags (decoded below) : 0000
                                      Polarity : 0
                                  Trigger Mode : 0
 @@ -121,26 +121,26 @@
  [093h 0147 001h]                      Source : 0B
  [094h 0148 004h]                   Interrupt : 0000000B
  [098h 0152 002h]       Flags (decoded below) : 000D
                                      Polarity : 1
                                  Trigger Mode : 3

  [09Ah 0154 001h]               Subtable Type : 04 [Local APIC NMI]
  [09Bh 0155 001h]                      Length : 06
  [09Ch 0156 001h]                Processor ID : FF
  [09Dh 0157 002h]       Flags (decoded below) : 0000
                                      Polarity : 0
                                  Trigger Mode : 0
  [09Fh 0159 001h]        Interrupt Input LINT : 01

  Raw Table Data: Length 160 (0xA0)

 -    0000: 41 50 49 43 A0 00 00 00 01 18 42 4F 43 48 53 20  // APIC......BOCHS
 +    0000: 41 50 49 43 A0 00 00 00 05 0C 42 4F 43 48 53 20  // APIC......BOCHS
      0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
      0020: 01 00 00 00 00 00 E0 FE 01 00 00 00 00 08 00 00  // ................
      0030: 01 00 00 00 00 08 01 01 01 00 00 00 00 08 02 02  // ................
 -    0040: 00 00 00 00 00 08 03 04 00 00 00 00 00 08 04 05  // ................
 -    0050: 00 00 00 00 00 08 05 06 00 00 00 00 01 0C 00 00  // ................
 +    0040: 02 00 00 00 00 08 03 04 02 00 00 00 00 08 04 05  // ................
 +    0050: 02 00 00 00 00 08 05 06 02 00 00 00 01 0C 00 00  // ................
      0060: 00 00 C0 FE 00 00 00 00 02 0A 00 00 02 00 00 00  // ................
      0070: 00 00 02 0A 00 05 05 00 00 00 0D 00 02 0A 00 09  // ................
      0080: 09 00 00 00 0D 00 02 0A 00 0A 0A 00 00 00 0D 00  // ................
      0090: 02 0A 00 0B 0B 00 00 00 0D 00 04 06 FF 00 00 01  // ................
 **

The i386 diff below shows the change of MADT revision to 5.

 --- /tmp/asl-STSA31.dsl	2023-04-18 10:44:37.544026591 -0400
 +++ /tmp/asl-HEUA31.dsl	2023-04-18 10:44:37.542026578 -0400
 @@ -1,32 +1,32 @@
  /*
   * Intel ACPI Component Architecture
   * AML/ASL+ Disassembler version 20230331 (64-bit version)
   * Copyright (c) 2000 - 2023 Intel Corporation
   *
 - * Disassembly of tests/data/acpi/pc/APIC, Tue Apr 18 10:44:37 2023
 + * Disassembly of /tmp/aml-64TA31, Tue Apr 18 10:44:37 2023
   *
   * ACPI Data Table [APIC]
   *
   * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
   */

  [000h 0000 004h]                   Signature : "APIC"    [Multiple APIC Description Table (MADT)]
  [004h 0004 004h]                Table Length : 00000078
 -[008h 0008 001h]                    Revision : 01
 -[009h 0009 001h]                    Checksum : 8A
 +[008h 0008 001h]                    Revision : 05
 +[009h 0009 001h]                    Checksum : 86
  [00Ah 0010 006h]                      Oem ID : "BOCHS "
  [010h 0016 008h]                Oem Table ID : "BXPC    "
  [018h 0024 004h]                Oem Revision : 00000001
  [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
  [020h 0032 004h]       Asl Compiler Revision : 00000001

  [024h 0036 004h]          Local Apic Address : FEE00000
  [028h 0040 004h]       Flags (decoded below) : 00000001
                           PC-AT Compatibility : 1

  [02Ch 0044 001h]               Subtable Type : 00 [Processor Local APIC]
  [02Dh 0045 001h]                      Length : 08
  [02Eh 0046 001h]                Processor ID : 00
  [02Fh 0047 001h]               Local Apic ID : 00
  [030h 0048 004h]       Flags (decoded below) : 00000001
                             Processor Enabled : 1
 @@ -81,24 +81,24 @@
  [06Bh 0107 001h]                      Source : 0B
  [06Ch 0108 004h]                   Interrupt : 0000000B
  [070h 0112 002h]       Flags (decoded below) : 000D
                                      Polarity : 1
                                  Trigger Mode : 3

  [072h 0114 001h]               Subtable Type : 04 [Local APIC NMI]
  [073h 0115 001h]                      Length : 06
  [074h 0116 001h]                Processor ID : FF
  [075h 0117 002h]       Flags (decoded below) : 0000
                                      Polarity : 0
                                  Trigger Mode : 0
  [077h 0119 001h]        Interrupt Input LINT : 01

  Raw Table Data: Length 120 (0x78)

 -    0000: 41 50 49 43 78 00 00 00 01 8A 42 4F 43 48 53 20  // APICx.....BOCHS
 +    0000: 41 50 49 43 78 00 00 00 05 86 42 4F 43 48 53 20  // APICx.....BOCHS
      0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
      0020: 01 00 00 00 00 00 E0 FE 01 00 00 00 00 08 00 00  // ................
      0030: 01 00 00 00 01 0C 00 00 00 00 C0 FE 00 00 00 00  // ................
      0040: 02 0A 00 00 02 00 00 00 00 00 02 0A 00 05 05 00  // ................
      0050: 00 00 0D 00 02 0A 00 09 09 00 00 00 0D 00 02 0A  // ................
      0060: 00 0A 0A 00 00 00 0D 00 02 0A 00 0B 0B 00 00 00  // ................
      0070: 0D 00 04 06 FF 00 00 01                          // ........

The diff below show ARM MADT revision change to 5.

 --- /tmp/asl-O2P921.dsl	2023-04-18 10:41:56.560930849 -0400
 +++ /tmp/asl-XJR921.dsl	2023-04-18 10:41:56.558930836 -0400
 @@ -1,32 +1,32 @@
  /*
   * Intel ACPI Component Architecture
   * AML/ASL+ Disassembler version 20230331 (64-bit version)
   * Copyright (c) 2000 - 2023 Intel Corporation
   *
 - * Disassembly of tests/data/acpi/virt/APIC, Tue Apr 18 10:41:56 2023
 + * Disassembly of /tmp/aml-ACR921, Tue Apr 18 10:41:56 2023
   *
   * ACPI Data Table [APIC]
   *
   * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
   */

  [000h 0000 004h]                   Signature : "APIC"    [Multiple APIC Description Table (MADT)]
  [004h 0004 004h]                Table Length : 000000AC
 -[008h 0008 001h]                    Revision : 04
 -[009h 0009 001h]                    Checksum : 47
 +[008h 0008 001h]                    Revision : 05
 +[009h 0009 001h]                    Checksum : 46
  [00Ah 0010 006h]                      Oem ID : "BOCHS "
  [010h 0016 008h]                Oem Table ID : "BXPC    "
  [018h 0024 004h]                Oem Revision : 00000001
  [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
  [020h 0032 004h]       Asl Compiler Revision : 00000001

  [024h 0036 004h]          Local Apic Address : 00000000
  [028h 0040 004h]       Flags (decoded below) : 00000000
                           PC-AT Compatibility : 0

  [02Ch 0044 001h]               Subtable Type : 0C [Generic Interrupt Distributor]
  [02Dh 0045 001h]                      Length : 18
  [02Eh 0046 002h]                    Reserved : 0000
  [030h 0048 004h]       Local GIC Hardware ID : 00000000
  [034h 0052 008h]                Base Address : 0000000008000000
  [03Ch 0060 004h]              Interrupt Base : 00000000
 @@ -55,27 +55,27 @@
  [091h 0145 001h]                    Reserved : 00
  [092h 0146 002h]      SPE Overflow Interrupt : 0000
  [094h 0148 002h]              TRBE Interrupt : 180D

  [094h 0148 001h]               Subtable Type : 0D [Generic MSI Frame]
  [095h 0149 001h]                      Length : 18
  [096h 0150 002h]                    Reserved : 0000
  [098h 0152 004h]                MSI Frame ID : 00000000
  [09Ch 0156 008h]                Base Address : 0000000008020000
  [0A4h 0164 004h]       Flags (decoded below) : 00000001
                                    Select SPI : 1
  [0A8h 0168 002h]                   SPI Count : 0040
  [0AAh 0170 002h]                    SPI Base : 0050

  Raw Table Data: Length 172 (0xAC)

 -    0000: 41 50 49 43 AC 00 00 00 04 47 42 4F 43 48 53 20  // APIC.....GBOCHS
 +    0000: 41 50 49 43 AC 00 00 00 05 46 42 4F 43 48 53 20  // APIC.....FBOCHS
      0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
      0020: 01 00 00 00 00 00 00 00 00 00 00 00 0C 18 00 00  // ................
      0030: 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00 00  // ................
      0040: 02 00 00 00 0B 50 00 00 00 00 00 00 00 00 00 00  // .....P..........
      0050: 01 00 00 00 00 00 00 00 17 00 00 00 00 00 00 00  // ................
      0060: 00 00 00 00 00 00 01 08 00 00 00 00 00 00 04 08  // ................
      0070: 00 00 00 00 00 00 03 08 00 00 00 00 00 00 00 00  // ................
      0080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
      0090: 00 00 00 00 0D 18 00 00 00 00 00 00 00 00 02 08  // ................
      00A0: 00 00 00 00 01 00 00 00 40 00 50 00              // ........@.P.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 tests/data/acpi/microvm/APIC                  | Bin 70 -> 70 bytes
 tests/data/acpi/microvm/APIC.ioapic2          | Bin 82 -> 82 bytes
 tests/data/acpi/microvm/APIC.pcie             | Bin 110 -> 110 bytes
 tests/data/acpi/pc/APIC                       | Bin 120 -> 120 bytes
 tests/data/acpi/pc/APIC.acpihmat              | Bin 128 -> 128 bytes
 tests/data/acpi/pc/APIC.cphp                  | Bin 160 -> 160 bytes
 tests/data/acpi/pc/APIC.dimmpxm               | Bin 144 -> 144 bytes
 tests/data/acpi/q35/APIC                      | Bin 120 -> 120 bytes
 tests/data/acpi/q35/APIC.acpihmat             | Bin 128 -> 128 bytes
 tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 144 -> 144 bytes
 tests/data/acpi/q35/APIC.core-count2          | Bin 2478 -> 2478 bytes
 tests/data/acpi/q35/APIC.cphp                 | Bin 160 -> 160 bytes
 tests/data/acpi/q35/APIC.dimmpxm              | Bin 144 -> 144 bytes
 tests/data/acpi/q35/APIC.xapic                | Bin 2686 -> 2686 bytes
 tests/data/acpi/virt/APIC                     | Bin 172 -> 172 bytes
 tests/data/acpi/virt/APIC.acpihmatvirt        | Bin 412 -> 412 bytes
 tests/data/acpi/virt/APIC.topology            | Bin 732 -> 732 bytes
 tests/qtest/bios-tables-test-allowed-diff.h   |   4 ----
 18 files changed, 4 deletions(-)

diff --git a/tests/data/acpi/microvm/APIC b/tests/data/acpi/microvm/APIC
index 68dbd44a7e35a356083f086df60f70e424c4249f..e1c72bd3e60e46acc2c8b3de14f5992946cd55a3 100644
GIT binary patch
delta 16
XcmZ>B<8ln}barE4U|=nn$Ylcn95w?+

delta 16
XcmZ>B<8ln}barE4U|=kn$Ylcn95Mq&

diff --git a/tests/data/acpi/microvm/APIC.ioapic2 b/tests/data/acpi/microvm/APIC.ioapic2
index 3063c52cd3e9bbed29c06031b375900f4a49b9e0..7c4f1b61d6c37f893d0d46be44a00e3f54a27a75 100644
GIT binary patch
delta 16
XcmWFv;&Ke|bPi%*U|_AE$mIb59$o{5

delta 16
XcmWFv;&Ke|bPi%*U|?*X$mIb59$Ev1

diff --git a/tests/data/acpi/microvm/APIC.pcie b/tests/data/acpi/microvm/APIC.pcie
index 4e8f6ed8d6a866429fc17aecdeafc3fb5ef65fa3..23956151765cae221853d92448a619d5576119b5 100644
GIT binary patch
delta 16
Xcmd1H<8ln}bk1X7U|_A7$dv*BBEAFe

delta 16
Xcmd1H<8ln}bk1X7U|_77$dv*BBDw?a

diff --git a/tests/data/acpi/pc/APIC b/tests/data/acpi/pc/APIC
index 208331db53b7dd5c6205cce0e95427636b86dd64..48bdab41959d7895b01491c6136d7403df284f98 100644
GIT binary patch
delta 16
Xcmb=Z;BpM`bgp1vU|?;V$dv~GB#;Co

delta 16
Xcmb=Z;BpM`bgp1vU|{T;$dv~GB#Z<k

diff --git a/tests/data/acpi/pc/APIC.acpihmat b/tests/data/acpi/pc/APIC.acpihmat
index 812c4603f2701494f6bb761570323158a20d4043..57d15150f781504090c8be19fe063836a66ccdc1 100644
GIT binary patch
delta 18
ZcmZo*Y+&Sa4DfVrU|?WiEuP3#1^_261Tz2t

delta 18
ZcmZo*Y+&Sa4DfVrU|?WiET70#1^_221Tz2t

diff --git a/tests/data/acpi/pc/APIC.cphp b/tests/data/acpi/pc/APIC.cphp
index 65cc4f4a9aa2676140a6525cdac1e838274b1e07..8451b99c3065f76214023a88ef955de0efc75c60 100644
GIT binary patch
delta 47
scmZ3$xPXz%F~HM#0RsaAE6+qOGf5^Oi-Cig1wym1LTFYtriqd60Hq=YaR2}S

delta 47
scmZ3$xPXz%F~HM#0RsaAqr^lmGf5zWfq{dW1wym1LTFYthKZ5x0Hvk{aR2}S

diff --git a/tests/data/acpi/pc/APIC.dimmpxm b/tests/data/acpi/pc/APIC.dimmpxm
index d904d4a70ddecbb79a83a267af8e26f925e9f4c6..824a279eb7d4134554cb447808bab5a174657272 100644
GIT binary patch
delta 18
ZcmbQhIDwJNF~HM#0s{jBtNTQ*HUKF;1V;b>

delta 18
ZcmbQhIDwJNF~HM#0s{jBqxVFvHUKF)1V;b>

diff --git a/tests/data/acpi/q35/APIC b/tests/data/acpi/q35/APIC
index 208331db53b7dd5c6205cce0e95427636b86dd64..48bdab41959d7895b01491c6136d7403df284f98 100644
GIT binary patch
delta 16
Xcmb=Z;BpM`bgp1vU|?;V$dv~GB#;Co

delta 16
Xcmb=Z;BpM`bgp1vU|{T;$dv~GB#Z<k

diff --git a/tests/data/acpi/q35/APIC.acpihmat b/tests/data/acpi/q35/APIC.acpihmat
index 812c4603f2701494f6bb761570323158a20d4043..57d15150f781504090c8be19fe063836a66ccdc1 100644
GIT binary patch
delta 18
ZcmZo*Y+&Sa4DfVrU|?WiEuP3#1^_261Tz2t

delta 18
ZcmZo*Y+&Sa4DfVrU|?WiET70#1^_221Tz2t

diff --git a/tests/data/acpi/q35/APIC.acpihmat-noinitiator b/tests/data/acpi/q35/APIC.acpihmat-noinitiator
index d904d4a70ddecbb79a83a267af8e26f925e9f4c6..824a279eb7d4134554cb447808bab5a174657272 100644
GIT binary patch
delta 18
ZcmbQhIDwJNF~HM#0s{jBtNTQ*HUKF;1V;b>

delta 18
ZcmbQhIDwJNF~HM#0s{jBqxVFvHUKF)1V;b>

diff --git a/tests/data/acpi/q35/APIC.core-count2 b/tests/data/acpi/q35/APIC.core-count2
index a255082ef5bc39f0d92d3e372b91f09dd6d0d9a1..5b9093a60ee95608cca9560daa7fc07cf7703466 100644
GIT binary patch
delta 19
acmZ1{yiS<QF~HM#9VY_=>zR#QOE>{I`~{i-

delta 19
acmZ1{yiS<QF~HM#9VY_=<Ase}OE>{I_yw8(

diff --git a/tests/data/acpi/q35/APIC.cphp b/tests/data/acpi/q35/APIC.cphp
index 65cc4f4a9aa2676140a6525cdac1e838274b1e07..8451b99c3065f76214023a88ef955de0efc75c60 100644
GIT binary patch
delta 47
scmZ3$xPXz%F~HM#0RsaAE6+qOGf5^Oi-Cig1wym1LTFYtriqd60Hq=YaR2}S

delta 47
scmZ3$xPXz%F~HM#0RsaAqr^lmGf5zWfq{dW1wym1LTFYthKZ5x0Hvk{aR2}S

diff --git a/tests/data/acpi/q35/APIC.dimmpxm b/tests/data/acpi/q35/APIC.dimmpxm
index d904d4a70ddecbb79a83a267af8e26f925e9f4c6..824a279eb7d4134554cb447808bab5a174657272 100644
GIT binary patch
delta 18
ZcmbQhIDwJNF~HM#0s{jBtNTQ*HUKF;1V;b>

delta 18
ZcmbQhIDwJNF~HM#0s{jBqxVFvHUKF)1V;b>

diff --git a/tests/data/acpi/q35/APIC.xapic b/tests/data/acpi/q35/APIC.xapic
index c1969c35aa12b61d25e0134bbb8d2187ba42d663..9cc1db8e078fa3d23d1ab836fea70881a745bb07 100644
GIT binary patch
literal 2686
zcmXxmQ+ym<7=ZEFO*UD?c2e7RlP!`eX;Y-OZKt+v+qP2McB<62(r?~8=Q|hkf1mT4
znVXr56B!p{Pqb>9DJ3e_9vvSMl@Mo-(3e5eG?_(BOHNJGtZ8U47-idRG@^q8Iy$1s
zgicQA?2KkJS}bU_qRoabF6iotZf@xAjvgN9>4{!m=<SU@KIrR<etzihj{yM~7>GeZ
z7#xftAs8BpVPO~^ju8=<E*+*%j~Oyx#*COL6K2kgS+Zc(te7nuX3vf}a$wG!m@60N
z&W(BUVBWl#FCXU5j|B=~!Gc(*5Ed?sMT%h2qFAgL7B7w^N?^&7SgI73E{$c%VA--5
z8HrI*Xt!gza#+4RR;Yj#D`Ips#>8NyN?5rvR;hwjt75fk7#oXmaag@N)~JE;@mRAa
z)~bcIYh#@{n2>;V>telnSie3tXn+kHVxvabxG^?qf=!!Zvu4=5IksqlEn8x%R@k~V
zwrPWH+hV(R*uFh>=ztwNVy8~nxifa@f?c~}w{F<IJND>-J$quWUf8=g_UVIt`(nR-
z*uOsx7=Qx@Vqzi=8ia!f<B%aZbSMrRhQo*Bh!Hq)B#s(|qetVIF*tTCjvI&L$K!+v
zIB_CQnuL=l<CG~lbt+DqhSR6xj2Sp{CeE6LvuER+IXHJN&YOqx=i`C}xNspZT7-)i
z<B}z~bSW-dhRc`ZiWRtWC9Yb9t5@TiHMn*yu3Lxe*W-o_xN#$H+Ju`o<CZPBbt`V$
zhTFH}jvcsjC+^yXyLaQBJ-Bx-?%Rj^_v3*Bc<>+|I)q6{c=#|LIf6%z;<00R{5YOC
zfhSMmsZ)6RG@dzwXV2ofb9nwdUbui4FXE+3c=<A3xq?@(;<amd{W{*bfj4jBty_5e
zHr}~|ckkl8dwBmoK6ro+A7XMcK6-?YALElJ`1C10dxj|~`20D(c!4ip;;UEq`Zd0J
zgKyvByLb5hJ%0FrA3x%!Px$#We))o5zv8!V`29Qn_<=uv;;&!$`#1jigMa^GYN}}Q
z(6oQLGK<o35J<a6SK6Rjls2jsr5#j@(vGS{X_IPE+DWx2?W|gqHmeq;EviLnt7=i&
zrdpJCQ7uZlsurc)REyH?szqrJ)uObgYEjxtwJ7baT9o!tElT^U7Nz}Ei_-q8Md<+5
zqI95YQ94MqC>^X?lnzlXN{6ZzrNdN<(&4H_gNy$CwWL(J8uhbd+J7LE$)xYN%4D(p
WKUwt~*t6NvCaeDRKYi&h(*6VF!XOX;

literal 2686
zcmXZeQ+OOv7=Yo~aI?wAcAeU0vPDuQZHm;k?bNny+g57ZPHkIh=b!JKoA-S43@*-G
z{Lu+<wq%Q@nWAFiZLx`wF-ZxwNPU?!O_RN-X{l+3X8k@%vx&=QJ3C3uY;TVa4(RBJ
zPEP3TjAs1}`ZBw?phf?(w5uz+xuMmH?(XQ}fu5e|<%Qnf=;MRFzUb$N{{9#cfPsM+
z6okRS7!rb^p%@m1;o%q&fsv7zE*+*%j~Oyx#*COL6K2kgS+ZbM6lTqe*|K5w?3g15
z=FEw?a$)Y=m?sbB&5QZ+VgCGBpa2#uh=mGa;lfy?2o^1h#fo9^;#i^tmMn>-N@3~J
zSf&g{M`KJ3+H6?1ES4*W<;!D*3K$!UadB9&B37z|l`CVFDp<8D#>Znq0#>Vr)vIG-
zBG#yZHEUw6T3EX_CM98=I#{<Z)~kp0>tllk*svisYJ`m&W0NM>v?(@ghRvH}ix$|j
zCAMmXty^Q8HrTc;wrhv&+hd0g*s&va>V%y;W0x-2wJUb(hTXekj~>{wC-&-vy?bMy
zKG?S}_UniJ`{RHCn4F9Q2jZYXICwA)8G=KH;;>;jd^nC6fg?xas8Kk2G>#dAW5?pS
zaX5ZFPMClbC*q_@IC(NonSxWN;<RZveLBvVfiq{~tXVjFHqM!YbLZl`c{qPQE?9sI
z7viEtxOg!xS%OQK;<9D9d^xUIfh$+ys#UmpHLh8MYuDnsb+~>#ZrFeuH{zyExOp>f
z*@9cQ;<jzLeLL>hfjf8Nu3fl$H}2Vkd-vkLeYk%=9yovp4`NCR9y)}F595&|c=RY9
zJBG)P<B1b^@+6)*g{M#BnKO9yES@`u=g;GX3wZG&Ub=*rFXNRfc=ak?yN1`V<Bc15
z^CsT9g|~0xojZ8<F5bI`_wVC_2bh|Q4<F*ANBH<LK6!#qpW?G;`20D(c!4ip;;UEq
z`Zd0JgKyvByLb5hJ%0FrA3x%!Px$#We))o5zv8!V`29Qn_<=uv;;&!$`#1jigMa^G
zTAJwMscHX=3n<MXfYNFrFqF14@qj38uUeFLP%TP3surc4REyHiszqtDYEjxnwJ2>-
zElRtp7Ny-(i_%urqO`keQQAYbDDA0Ql=f0BN_(porF~S3(!Q!iX+PDXw7+UmIzY83
z9jIEA4pJ>j2dfsPLsW~>p{hmcFx8@TxN1>4LbYgele0}R{tY{ee%8iO>pNrYvugUz
Y81RgpG2$6JW5}~=7X9ge`jQv^2Net*5C8xG

diff --git a/tests/data/acpi/virt/APIC b/tests/data/acpi/virt/APIC
index 179d274770a23209b949c90a929525e22368568b..318cdea179b244639417efe4fe1acb2a79879e7a 100644
GIT binary patch
delta 18
ZcmZ3(xQ3C-F~HM#4FdxMtJ_4bMF1`e1hxPG

delta 18
ZcmZ3(xQ3C-F~HM#4FdxMi~B^bMF1`d1hxPG

diff --git a/tests/data/acpi/virt/APIC.acpihmatvirt b/tests/data/acpi/virt/APIC.acpihmatvirt
index 68200204c6f8f2706c9896dbbccc5ecbec130d26..a066df3651f9e832546d47b2a0bc8475f830bdc1 100644
GIT binary patch
delta 19
acmbQkJcpUfF~HM#4kH5tYu84uNsIt7;soFT

delta 19
acmbQkJcpUfF~HM#4kH5tOZP^uNsIt7;RN6S

diff --git a/tests/data/acpi/virt/APIC.topology b/tests/data/acpi/virt/APIC.topology
index 3a6ac525e7faeaec025fa6b3fc01dc67110e1296..7f10e34f6ba5af0a5c05acf0ac95f3d0b83e8339 100644
GIT binary patch
delta 19
acmcb^dWV(EF~HOL4if_d>+X$QmzV%QB?cD&

delta 19
acmcb^dWV(EF~HOL4if_d%btx~mzV%QBnB4%

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 1e5e354ecf..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/APIC",
-"tests/data/acpi/q35/APIC",
-"tests/data/acpi/microvm/APIC",
-"tests/data/acpi/virt/APIC",
-- 
2.31.1


