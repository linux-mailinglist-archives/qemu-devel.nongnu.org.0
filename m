Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D736E6A38
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:53:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pooZZ-0004bV-2Q; Tue, 18 Apr 2023 12:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pooZS-0004aK-I1; Tue, 18 Apr 2023 12:52:46 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pooZQ-0007Fj-Sh; Tue, 18 Apr 2023 12:52:46 -0400
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33IExGB2023627; Tue, 18 Apr 2023 16:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=mtDqxJOaTmAxa/h/LWFvucA4bK+TBae3LNVBR6PCqOw=;
 b=NlV5W3nF2SRuI66SWQllgCitMh1SolvTtRLVtq3cIJrG975jwxA+vQvLrUWvxMAX67SJ
 HGDMRqkNhVr5Y6hopzH3Y+YRAiIZ08TOYv2OVw+bXovsHtuqlrvDreq69U0X2vrgJx5L
 DDZ+iDLAjXelEzdj+Y542z3yrKpCZwOCEL1nZjQQfqO3NdTzsBY9vcjvAQ9mGtcFZp1Y
 cpltrshjH+PkIA1QsYi9cweQ0o5CQH0gEhy3QrWA89aediVTqHoQg1YKDpI2ODm0EC+t
 Bt1aD81p6YjDwTBiC0HKMBOx5zu9ukH9GqXZ4wVgG+o8Z9k++ivBIpn2Lrfi30gIVD2M wA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pyjuc69qe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Apr 2023 16:52:39 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33IFWPP7026405; Tue, 18 Apr 2023 16:52:37 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3pyjcc2u6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Apr 2023 16:52:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnjXqPTZNQ12fYjhvVOxGpecUwN2PMZiIFtWAbmJnbEUjgrccRksUbD5Kwm4PCENm3eIzoaRgbh8w6aI9rvDlKHRMKS3hh/29Y6cEKXTjlLhKdCDDxmtzoyNhG/7MOp06Lf0f6ZS+MQoreHVHpYUHqbmrFP204cf9l9gYwU6IB6JUPF5e5RfUXrSPNjfhwZwPOk4t7ZDdR7oyKTxcpBQhILuLjMAD1KkJmD0jW8GjrwOWU0ozxFEc7SJF/0m2rP6kbWgvtu5IQ9VdfoOfhS9HMZcfXc0ImZHjYj3ACXv/JVDE1tFV1d1gdWsWhPoeH6poPrX5WSqPE6MsgOhYFf01Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtDqxJOaTmAxa/h/LWFvucA4bK+TBae3LNVBR6PCqOw=;
 b=Vd6YuqsIN7KhX1B9rVXfeNwFmTMR4uIf9X46LkkC4cRgn6RElZE77LgCiWTaFT6jxaJ1xQuab8fWBeglAEbAbiNQbIhg0vx3QUhXfyjouU6S0uXX3tOK48yfO6aoGKm9YYH8zjd63rGNCYfF1duMl/l1c9qXDKOzCLc+5RBMQjDS2wKQ8riqHHSGN9PpEm76gC45lu4zqnW2Q50VBjdGnlpi2QP+6hhi8ZsyVFpCXilwdZI9Ozi5dmogELCvrv5qDCPX8+AAT6Z2QNt/rHXrhBarTW8JEhMnR314fo1steRS0WGmugkP+AAHMxVuBLVw/3khG5LR30l9fm+qsQpwvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtDqxJOaTmAxa/h/LWFvucA4bK+TBae3LNVBR6PCqOw=;
 b=AlemJDSgm8tyXlSvX5/fkgbjsXsL7yxw/FrADdC4h8G5ZmzoBMSanw7rhIvQnC5ZYKNa7lgFD1KxI8+gYNiXmJ7I//gGTf2Znjn29/3K+3mb2LNTB2x8kwkYhlvKddpjHbkU+aY0vMwVjddJ4qPQhC2vufrCjHoYet3VBrzqAes=
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by DM6PR10MB4298.namprd10.prod.outlook.com (2603:10b6:5:21f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Tue, 18 Apr
 2023 16:52:35 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::ad42:b11a:662:9466]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::ad42:b11a:662:9466%6]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 16:52:35 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: shannon.zhaosl@gmail.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net
Cc: boris.ostrovsky@oracle.com, eric.devolder@oracle.com
Subject: [PATCH v2 1/4] ACPI: bios-tables-test.c step 2 (allowed-diff entries)
Date: Tue, 18 Apr 2023 12:52:16 -0400
Message-Id: <20230418165219.2036-2-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230418165219.2036-1-eric.devolder@oracle.com>
References: <20230418165219.2036-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR08CA0052.namprd08.prod.outlook.com
 (2603:10b6:5:1e0::26) To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4542:EE_|DM6PR10MB4298:EE_
X-MS-Office365-Filtering-Correlation-Id: ce190ad5-bd0f-4154-bda2-08db402d4efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8SCL3bq/zU62HgPk3GP/9w/ILt5J0QwuIASjiVKuUzC/LCS7r8xbHmSVAfokfqJC5YDZ2ABw/nE9NvMnhAwWvzDLxJ8HBvuKtmgSqp+aqRWWkpe8euJ/6iSpK3e1L85oMhwLaqd0OqWb0BdWKQe0cUnBLWB+uL+ef3d3wBT/M51D/dePDpMlkYtTKQ+1cE2Efntj3d/7FtgTVJRk2guga9oKVWoHOAKclU5UXiUVeQF7zre92DsYmrpQOIN9MInklbpA7PAMGBVHWLC+1ZFfUf3l+yHO32ndKrdPLK5OhtD5xKn7WNRfN74sv4FjKC6/gAVGkGP2OkhqJqG7UPqXbQ4foxk+a3Dvmodr83GrVUG86mdOL+S+dOKoRww7Hi2oKsTkl6hZIbPqae0PAbSrWI8ch6G7oYvVRVN+55DKhe+4pcwWJd2W0Vu2stqRaO6wb0WEI3wRgfDV3wocsLoOJWbcaheNd1WZ6YYmWnHkEtJGfjUhCCDqlfXGum+DE9CjM0i7MAud3cU6v/GPQvUCecKM4bYTFy4Wsm6UWqkNT2A8t+KqRwlJxV4JPEoXaB35HYiem6WHxgiC2TfMOtoonnObXMjEeCOpDY0q2gGvaWE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(366004)(376002)(396003)(39860400002)(451199021)(4326008)(316002)(66946007)(66556008)(66476007)(36756003)(186003)(6506007)(1076003)(26005)(107886003)(6512007)(38100700002)(2616005)(5660300002)(41300700001)(8676002)(8936002)(478600001)(6486002)(6666004)(2906002)(86362001)(921005)(4744005)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/jGISxVhGtdtbv5nVfxm4ur/V+IVl4vPVRL49btmxtAaT7nAaLJ29B3n/PsH?=
 =?us-ascii?Q?I3/4iqoeNw/Ja+bkYId8xukaZ16i81Fl/GVRT4nKQ2b8vw0hyClPZLoYSpNT?=
 =?us-ascii?Q?b1jfRCf8zMejNbINxVfAOW+6NTECwO/eV7GQ/PZcgjiYup/pqj56oDe2kgxW?=
 =?us-ascii?Q?5s3CeJ7arEW3P24zikwVuVH2IPse7T2ubxVNUMu3tJvxXnY2oZZJI+FmpJhT?=
 =?us-ascii?Q?JhFEEieePAJPMYiyJEuBQMkj9j4EbLPyIUWyTnFmQ+rHJdxzXkUt2VtIWlAE?=
 =?us-ascii?Q?I1pnNKt1ONAS7y7piisHB5o6B92ahLGZ8aR64i4dGGBzXlVTrmTGENQulwYz?=
 =?us-ascii?Q?1PVho+dOVbNlKWPuEbwz8MrpVvXxg9xz3NrjkZ2znkiH2ATBnT4MzvVWhz/g?=
 =?us-ascii?Q?Ai9cE9A+bwfPl9/xJgZpULy2iwQmMssHzPgTkPWCiGh1g9yejtELwOzcs9mC?=
 =?us-ascii?Q?snfCksImuGKB++tAsG/eEfUofheWwudS7iuhwmTlu21ipfFjWOFYpRd/iJfZ?=
 =?us-ascii?Q?wdfJKu25dqggB9wrRvXnEpmce/TdyBF01GfWQopO4IhUuUCzAcOL460xRTeq?=
 =?us-ascii?Q?ZwHrHULu6U28ao/Ab0TAyvcmu+ciqmj5F5h9NU1MGWSm9K29Ldh/FVyUeifP?=
 =?us-ascii?Q?yIc3puKO8/q+uDeVogY81D8BnLKdKHLtWbxL/9FNVIXy3sbX+F1AtPGWgBIP?=
 =?us-ascii?Q?Pt18PoQXlMqOG2coRy9/mmidEJSqDG+ejhU9vDhCQxPG0WOrKuIun6Y22JVN?=
 =?us-ascii?Q?YO1Vxutamsm2Fr9e2JnBsLrbW7SPuYr1GXLHv82XG6eDkCwkPzUznHJGc9we?=
 =?us-ascii?Q?b7qE9dSKjersNGTHB0egavlV3ZXluR1J1Nv87Uh5YYqU+MsPrRqCGBAgHOVN?=
 =?us-ascii?Q?TsElB/vaqnU/IXmu5Wbx4/siynhGqVKV5hQtMMairst5B+EnXzInuMGbop1W?=
 =?us-ascii?Q?1nZAYU0z/01OoHoHJn9sD8G7VZI4LgTvXG++aILl21iPzsDqqJUswLX2RTVc?=
 =?us-ascii?Q?VqGkELPEW26UL961QtYIhgyhc0HYydsjn7KmHAd79jiA6qUYvZiGB7MGKo7q?=
 =?us-ascii?Q?kF+Vz6x6hsqQKDfJfIONk815/eOJCtIUD5Pdtnt4QGdGzdKr+ROLMk6D4Iq2?=
 =?us-ascii?Q?+Z/avKRQis+57opISQWEtC59Az5HtTBeMgEOvlwF82M1CHgmgxHreXdINdeB?=
 =?us-ascii?Q?l45DMZTtKhPE+PuLvvyKYHCCtKd0caTxIkmJSAWQ16+Sct9/rjpdquxgwfbF?=
 =?us-ascii?Q?vMOSLlWjMIN5++fdiiG41clEEB7UbfwCH2XAy4fW1KlT0WRwNYNMZZTnnyPw?=
 =?us-ascii?Q?VRlx7ZgRz88DRkm/PfjKEZ/FmwcY77LtoaEB9J+oQvmOH90P2s0IsgcV5lfo?=
 =?us-ascii?Q?LasgcKjTo6G2Uek5lcGNM5W/9zETXqgPNqRuP8iR87J8Pzx+NzL+8rBY47Lo?=
 =?us-ascii?Q?ZZ3C3JPrvqYntqOBXYTKMpoE4+AHRVf9CiwcGF09fd1c79bmnneB3U40VOz7?=
 =?us-ascii?Q?05zoPxmlc3lKUTlM0R2oW/vK7WeJgUnZiPryU1eqp7czkFWazvn3QhyZk53V?=
 =?us-ascii?Q?WnQv+PNZzch2r9fkhdrHYy1roYCyJt/nKWFGXvR09rXBfaqsNOdrpXceT1OB?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: PaxBECVNYGCrRpuKdUQ5FAjgrzqNeBPPwhD5Fe3zZaZ+U6FOmIcHLcqbdP7yizg16gguKc8FZ/69JAXM4dBUDwjCpwm2GS8iYvXMe3QD9Nhh6aZSwLMUqC27laAB6yY5bH9kWrBX2DkXMdTFyOxYrmAqf4nD3P1+IGU3OoJ7X2yL+ZObkkBexV1pJkuqczhpQmpcxl3iZ8ed+1ZKJpTB6Jp2+EGJ0cpKV0SGHhhrJhcSgzD6iEv7U6yzeYnqaFXr5mEhmypD7XKysD+q5RQTreekkJDolXSMcukKLehU7VotbE77BmtnhvCrdqJkzNpnDGciEXbKdpLsbAbCwGsUKzbup72LjluLUrmYTjKp7xZ8tdpiVuAgCbslhieLi3eQbyJ9l5Nsiue591YzpbIRsZKBG/vvHc/n28zA/saAE1hi4hgfe8IQ2oGpokBFnyPUfcjB1u8NEi+Wo34G57Ye5mwX8OFOXmxDzmRjIF2+kb+jYz287WEk0dfFFO5XeJBS/MKGfr5n4XkqD6UQjjziidNTRZF0tdg66TnMZov5yY4o5qPM+DARIb/+JRolY25s534++zN1sAC7lLy4rdgzNF0DFXqRjt277q44USQAEiJptHeYJRZbceTV4zF/2TCuDyTZFbVAGbJQyYeArHvRrospdMLdaf0eIOe1DVbRQRiBH+vI++kt3C/2AOqja0sAr77Rn4sIOY4xqFyKOD8ixcVIkqI4eFGjK6OjN6b/Uj1dGuuvuf+HF+lFJm4zF+LV8a5ZzjemOif7ZgyQt32sA9jUrWjzrsjoci9daDPNwZpT/Ttlbuobv5sVedKeIZidc3knW8pgO3GshfqJWTyYCFe6bR39rl7jxvZrPhmwXiXfX7pAA8z93TfgFbUVSOYc0NNcI+qdq0VwwE+NnNqITg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce190ad5-bd0f-4154-bda2-08db402d4efc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 16:52:35.1178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HkMJI16lQhKC4ttuKpKPwlmjygAXiM5k3DJ20iKQup+VwrSQw6mVIxWguFpCx2PRsf6D3d/F5W1lucP/gsSLPGKBGjqAONNXhoOkajhyGsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4298
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_12,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304180141
X-Proofpoint-GUID: P8duh4lBJuXgjfznZAcTAU-KpwcLm9Ih
X-Proofpoint-ORIG-GUID: P8duh4lBJuXgjfznZAcTAU-KpwcLm9Ih
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
change sets-up bios-tables-test-allowed-diff.h to exclude the
imminent changes to the APIC tables, per step 2.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..1e5e354ecf 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/APIC",
+"tests/data/acpi/q35/APIC",
+"tests/data/acpi/microvm/APIC",
+"tests/data/acpi/virt/APIC",
-- 
2.31.1


