Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E05532E83
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 18:04:41 +0200 (CEST)
Received: from localhost ([::1]:49164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntX1U-000507-En
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 12:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWV9-00086Q-N2
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:15 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:23432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWV6-0003QS-C1
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:14 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OFHHId019083;
 Tue, 24 May 2022 15:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=qe8AyEZeDbIRcOJOCNoa0AywoGhC9qnxLKj+tpWkUrk=;
 b=mF4euonFXhNF1F46kLlD0oAidYuMbNj9sAsVo0vFKYpaMJu4o23qKgV9NvdOfh8EfIS6
 +hE1Qyn9gokE9QTzpNC8ZurepPQZrcVS/UOrwOaudw148s89sBOTc4TiNLldXkasUIpk
 QqtgCH7Ibia2vJdcnYOBRUZ6fLEC+7jgSmbmySuxDmJ472Su1c0T7VVjDFy+PJ/ulqtC
 r0XYZYIR3nK+9+yLiveuwF1QafbmoHrBiW5ATPWVqAmbCH8i5vtrTZmGdycIc27eYCFi
 LXdiOm9Gg4iz3tanSUBpbG3awvRz1v5zHXrC1gzoV2ccgvxge3zXakL9XGskhsF4/Qa6 nQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6pp06sb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:30:59 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24OFQNej015857; Tue, 24 May 2022 15:30:58 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2040.outbound.protection.outlook.com [104.47.74.40])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3g6ph2rhy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:30:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFv5rvZh2d2qRO2y/dRvJj5br55sTQcZKEX97lhVxDVZYyj+6/1HKFsxuFpbr24HdyfS3hDnK2E/mmZgGZ8d0tl0UCbhm7Sls4tmwtjtM0b6jryZkqNd2Z+Hx9INASnTlmNUn/xNIloJRoP50JSELYm+109xXcxLG/3BmygT2ai5cDKiGevK0Azq1eOm35aG9MDCar/fIs2JiHBPHQZILz/FF/Jtkc/6ZK8nMwY45rPoUMpqdpiGSoHhM2ct9J0t/2SPp0ZYjt7FGLeHoeC7a7H6BlQXGU04ub8KV5ujIrebVf+JT5jO+PagywHcD1yoqBjZVkNcydlLimFAC7+NVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qe8AyEZeDbIRcOJOCNoa0AywoGhC9qnxLKj+tpWkUrk=;
 b=h8oHAwV6PD9Fa+RsHb9Qw62GpBdAqDqkoU64SGyH2zeYlSFDnYu+/UQCG8ogv4AxV+AYaJ2oszF+Pcjv+2TPS7ABWGXmJfN1TFw94dCGqyhW3MnneCldMY2FfO2BqWuxaqRsrX+uBZOsnAD6DK7YGE2DDnnUpEv0Za01TIGw5nbA+SJ9AaiAqkOFRCgmIJfNsb35xzlAVi5KOF++FNDdB2ppZtbF4cmNboH40pMgZcdGxicxliNwnEOFE96b4NACROFRN+MGvZroiKpBkKtIc2dLDI0/ocmSidv4CGmFbPqSRFIV0NvAg6tfVEC9PlMecBJ/8uJaEGEKgNmhIe02ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qe8AyEZeDbIRcOJOCNoa0AywoGhC9qnxLKj+tpWkUrk=;
 b=hQM78QFYNSN8+++dl9fjPxb5ej94JBhL452+bXUpNt1ydnY1bHyuhnYkCffp5iavqV2Wg44BWvVN+NvM9V+367U3sxLN2Dp6PMEQeUlhig3R91HDY9fkBVofKUrcXsxECoZz0u7B5n7rGQ9ORu91cfbW/UV+F8JXsqcgdi7bOos=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3117.namprd10.prod.outlook.com (2603:10b6:208:12f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 15:30:56 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 15:30:55 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v10 05/14] vfio-user: define vfio-user-server object
Date: Tue, 24 May 2022 11:30:24 -0400
Message-Id: <4908eb950f336421d900b64727dda2ba230aa2fa.1653404595.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1653404595.git.jag.raman@oracle.com>
References: <cover.1653404595.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::17) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 838ea086-acd9-4aa2-e5f0-08da3d9a64bc
X-MS-TrafficTypeDiagnostic: MN2PR10MB3117:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB3117D95683D3D439B0EB493590D79@MN2PR10MB3117.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k8gNjXnUgESp4DpeqvbW/HaJglGYFG2an4i9tlYwCMyzntzN1S7svK+Kwm+VEdaZZcu6VwA9xfISKGGPxO629dBrh+kVUVw3LSCmk9VRYyBpLK6aRZo49WG2sCdoAKvyVIys38l8Fv19bLolbRI2asZjvCBEksJJUS8WjQ0aEcDAn2FonihggyeZyXeSkCLcb/pJgeoMbp9eJKpIcAnyDPP0n21AS4aBFekfxD7gj1r8JTY1n6wQ6He0qEU+fnLmhKMfiIKRDElpLX8y0fSyjLGmSAQ3qMuWDzCTJwmI0BzuUOyBF8NOq2geWwDJLtaGQcbr6TxU4qH7ajZ4qZC8DCFX1OPy0KQH4S7s032GFY36dveYGPci2rkv2ALQhRp6zHmb/gId4+1U9nwn1J08/h+2XMFhf9awUqlsLINtwK0+z/L7v/1qQ3Il1O/fsOxogpm+FCh1lyAqrpEqZx8t8+J3pUOiyvxBUIoizPdFSVNHUoqlExAY24plQLYnWfb6PZDi3GqHPcm+rzOVaHHvmd4GAc+DYzdOeAIilDJ8Sf3E0PfAJwSH+p/Pt9Z94Q9WKB0rRo8Z0gMtTCJPj4Ku4g8ru+9WmkpDoo7dciTlbMFOYtAQAPyQINNE9eAaHw6ow8dqJ0FvrS1PN/fR8zk2ZX251xYAkMUfn+lHiBCnAjOpaVSfN06KXiDSY511RNWUrQwDkTb7kISaYuczioYFhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(66556008)(38350700002)(5660300002)(38100700002)(7416002)(30864003)(86362001)(508600001)(36756003)(4326008)(66946007)(2616005)(6486002)(186003)(6666004)(66476007)(83380400001)(107886003)(8676002)(6506007)(26005)(52116002)(316002)(6916009)(8936002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3JQVE51QXJyQUJod29mTE1Qa0R1UDViSmVNMnJWYXZrdkN0SW9RWDlsdWxt?=
 =?utf-8?B?TldKcXFObktGV0c3QXAxeUdOT3dpdndneTB6VWNVN2RMbllaaFRyNjRJQ0xC?=
 =?utf-8?B?V3AwNldrRGZjM3EzYjlXK2VaKzg0VGd4c1c4VDdtRHBhZUtKb2tWMDBIK1JD?=
 =?utf-8?B?SFg3Q1FFaW1INGFJRm02bGdhWEJUSEIxRk5yMnRIUkN6QnJTNUNFTXBBQ2pu?=
 =?utf-8?B?REw0Y2RPMFQ4Zjd5dUpSM0tKRnlON3lNTUpEc0tRN1NRVWxQTHJkS1hObFZN?=
 =?utf-8?B?TVNXdEVtbmVZWVZ2bE5WRG1iYnI3MEMrZUJpYk5weW1BNU5mdUhPZHVXOVpI?=
 =?utf-8?B?UGxCa2k2WjgwdDVqSEJqT2hQMThJS3dUblh5V2piajBld1pEd041U1dsak9K?=
 =?utf-8?B?Tk90NElyenMwMDRvSk0vdHNSclM1S1FTMVUwWGdocmNjblBjcnZRQTRidFJh?=
 =?utf-8?B?VG9MaXJTdTh2R2tKd2dlS2E4bEs1YlVSMkE2TVAzemd4dGx3MmI2UFZobitk?=
 =?utf-8?B?QS9JL1lOYkNJekg2d3JrVHBPSXROV2IxWHQxVzI5cVJhTVpRUmJCUy9NVzJ3?=
 =?utf-8?B?NGIreERWL1dKSW9uTWFqY0NmaW9nWkJwRzMwdjNtSTRTVGplaFJJZy85VUJM?=
 =?utf-8?B?OUErWTc1MGRnUUlDRnJ5WHg0NXkxcStLem92WGZ0bGZTNit4UnZhVlMzQXNx?=
 =?utf-8?B?a3d0bmtKeHhxVVFUd3ZKUlJYOWNUVnRzY0tiMFlZdFlsSWZMQUplanRzWEpv?=
 =?utf-8?B?czEzdDR0NkJyeS9Qd1dwZ01UL2dkVm1pOTFyMlk0Zm53cEMvTndTUGRISzBQ?=
 =?utf-8?B?L1Jwc2FHUU0zVDFiMWpNekRBblhYNUNzOC9PUm1qbFZLQzRJTVlZN0FRdVp1?=
 =?utf-8?B?czBTdDhyTkJlc1RlQnZwWkYwZVRLcWlZUS9lbmlZSzJnNURZbDNkZHFKUkRw?=
 =?utf-8?B?NFROSzQrcHo3cHhQajFiQ2htaHMraDFiNEk2dWxxcGFJcHVSK2xzblRBbmoz?=
 =?utf-8?B?S0JGQ1JRR09rM0NYbHRHQU1jbFFOZmI1QnBQckhKb1RZSkp2Z2JhN3cxN2cw?=
 =?utf-8?B?RXZHQ0krN29NY3BOOXFOVFZOSWV4NEs3ajNlSklYYkZJMmdhMURGNTFDejV4?=
 =?utf-8?B?ZWE0WWx0T0hsU1ZpZVJLN3UxZ0p6VGhicll2Tm1TVVc4Z2lXMFNyK2g4a1VC?=
 =?utf-8?B?dC9QbFF5VGwzbzJldDhyTjJTZURYQ09XdWRKU0lnMk5RL0xwMmdOMEJtUnZS?=
 =?utf-8?B?elVibThNbXM2RmlWT0JQVEJoNkY1eGNUblZHWXhBWHVmdm01ZWFvK2JDZFc3?=
 =?utf-8?B?MURoM3czNmJIblBJcW5GSHdTNjVQVXI4TVpCMWM0NDkzZTk3QnlHY3kxbHlk?=
 =?utf-8?B?K2ZQclhJME5lL0FFYzltTkJ3VWd5YkJqOEJickppSnpWMytmdzR2TEU0WE5j?=
 =?utf-8?B?Z0M1cDBKUVhsUTFNYXJ5bTVFRTUwamc3enZzNmhwblB3OUZuYUoxYkw2bXda?=
 =?utf-8?B?SVppRzlTb2liSWV6Y0E2QnhTaGpaZWFXSGFmWnNsSmQwS1l5OGwvVmJxNklo?=
 =?utf-8?B?TCtVczM3cmsyR2ZiUnp0TlljbksyMFovK2JCdFNkVlZ4UExpdWdxN09kU3ZX?=
 =?utf-8?B?OFZuckNqa2t6YWVmcUFKazBsVnJ4ZzQrWG9wSzFSTU9vNTNpd1IyMjBXQlBJ?=
 =?utf-8?B?RWQvQkhrVkIyYTB4MDRwQ1VobGJFdm50SDJvMXc4ejQ1K09RbTRYQjBpN1lM?=
 =?utf-8?B?SzkyRWRBdXNTdnNPZllJWXJxVVF0dGZaYmxIS0g3NHM4L2JSQUFPdkxwMXFS?=
 =?utf-8?B?Z3NPbEFKK3M1clZDUFlqMFdsMmh5MWVXY0VXSEVQQzBFTU9zZUkvRWdySmJr?=
 =?utf-8?B?VnZXUnRVYWRZUUEyRW1WRW1PV1puOVZOeHVqTmxRakVRZGh6MVgwZnJnNEZx?=
 =?utf-8?B?L0Q0SlA4VTRpV1h0VTQ2eEQ1cERMdDJJMjI3amJVVzVsaVBOeTlWeklZQ0lw?=
 =?utf-8?B?aDhVTVRSTU1wbm16TjJEdHdsa3djbTNMWHBmWFdlblZLbzlpaU9GclYxOEJz?=
 =?utf-8?B?K0I0ai9tRWprWU5mRFo5aXgxdzIwUXo5VWZhNlBQV3ZoeUJDbkNrMHNpYk8x?=
 =?utf-8?B?Ynp4ZlppVzVVTnhGaGRKRFcwTnBlNDdDaHJaSVp4NnI0ZERic3hoM0tDWUFi?=
 =?utf-8?B?VysxQjV0WWhtYU5XUE80WWhKbGg1Mjg2SEQyM2RpanRVbFRCdFd6aWFUamND?=
 =?utf-8?B?KzNJeTBVSXpmUFY2dDNGOW1kRWE2dUdNL0k2SHJPM2ZoOUt4ZWR1UEtmeWZw?=
 =?utf-8?B?NlNzNWc2NWU0U0FYeHh3RzlkSUlQRGxlaVUyOS9kQjFrc3FXdjB6dz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 838ea086-acd9-4aa2-e5f0-08da3d9a64bc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 15:30:55.5236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HdbJNSBS+xjXzyox8lzgG1NsAkLLwF7/ucMFGBOGvxQv2wi+tXnZlIBt2JrJM0pjIt7jwgS9afzuWfQE4Ay+RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3117
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-24_05:2022-05-23,
 2022-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205240079
X-Proofpoint-ORIG-GUID: rGHYwFVQ4ehySEUdvzg5ILuoo8m7g7US
X-Proofpoint-GUID: rGHYwFVQ4ehySEUdvzg5ILuoo8m7g7US
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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

Define vfio-user object which is remote process server for QEMU. Setup
object initialization functions and properties necessary to instantiate
the object

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qapi/qom.json               |  20 +++-
 include/hw/remote/machine.h |   2 +
 hw/remote/machine.c         |  27 +++++
 hw/remote/vfio-user-obj.c   | 210 ++++++++++++++++++++++++++++++++++++
 MAINTAINERS                 |   1 +
 hw/remote/meson.build       |   1 +
 hw/remote/trace-events      |   3 +
 7 files changed, 262 insertions(+), 2 deletions(-)
 create mode 100644 hw/remote/vfio-user-obj.c

diff --git a/qapi/qom.json b/qapi/qom.json
index 6a653c6636..80dd419b39 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -734,6 +734,20 @@
 { 'struct': 'RemoteObjectProperties',
   'data': { 'fd': 'str', 'devid': 'str' } }
 
+##
+# @VfioUserServerProperties:
+#
+# Properties for x-vfio-user-server objects.
+#
+# @socket: socket to be used by the libvfio-user library
+#
+# @device: the ID of the device to be emulated at the server
+#
+# Since: 7.1
+##
+{ 'struct': 'VfioUserServerProperties',
+  'data': { 'socket': 'SocketAddress', 'device': 'str' } }
+
 ##
 # @RngProperties:
 #
@@ -874,7 +888,8 @@
     'tls-creds-psk',
     'tls-creds-x509',
     'tls-cipher-suites',
-    { 'name': 'x-remote-object', 'features': [ 'unstable' ] }
+    { 'name': 'x-remote-object', 'features': [ 'unstable' ] },
+    { 'name': 'x-vfio-user-server', 'features': [ 'unstable' ] }
   ] }
 
 ##
@@ -938,7 +953,8 @@
       'tls-creds-psk':              'TlsCredsPskProperties',
       'tls-creds-x509':             'TlsCredsX509Properties',
       'tls-cipher-suites':          'TlsCredsProperties',
-      'x-remote-object':            'RemoteObjectProperties'
+      'x-remote-object':            'RemoteObjectProperties',
+      'x-vfio-user-server':         'VfioUserServerProperties'
   } }
 
 ##
diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
index 8d0fa98d33..ac32fda387 100644
--- a/include/hw/remote/machine.h
+++ b/include/hw/remote/machine.h
@@ -24,6 +24,8 @@ struct RemoteMachineState {
     RemoteIOHubState iohub;
 
     bool vfio_user;
+
+    bool auto_shutdown;
 };
 
 /* Used to pass to co-routine device and ioc. */
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 9f3cdc55c3..4d008ed721 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -77,6 +77,28 @@ static void remote_machine_set_vfio_user(Object *obj, bool value, Error **errp)
     s->vfio_user = value;
 }
 
+static bool remote_machine_get_auto_shutdown(Object *obj, Error **errp)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    return s->auto_shutdown;
+}
+
+static void remote_machine_set_auto_shutdown(Object *obj, bool value,
+                                             Error **errp)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    s->auto_shutdown = value;
+}
+
+static void remote_machine_instance_init(Object *obj)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    s->auto_shutdown = true;
+}
+
 static void remote_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -90,12 +112,17 @@ static void remote_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_add_bool(oc, "vfio-user",
                                    remote_machine_get_vfio_user,
                                    remote_machine_set_vfio_user);
+
+    object_class_property_add_bool(oc, "auto-shutdown",
+                                   remote_machine_get_auto_shutdown,
+                                   remote_machine_set_auto_shutdown);
 }
 
 static const TypeInfo remote_machine = {
     .name = TYPE_REMOTE_MACHINE,
     .parent = TYPE_MACHINE,
     .instance_size = sizeof(RemoteMachineState),
+    .instance_init = remote_machine_instance_init,
     .class_init = remote_machine_class_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_HOTPLUG_HANDLER },
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
new file mode 100644
index 0000000000..bc49adcc27
--- /dev/null
+++ b/hw/remote/vfio-user-obj.c
@@ -0,0 +1,210 @@
+/**
+ * QEMU vfio-user-server server object
+ *
+ * Copyright © 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL-v2, version 2 or later.
+ *
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+/**
+ * Usage: add options:
+ *     -machine x-remote,vfio-user=on,auto-shutdown=on
+ *     -device <PCI-device>,id=<pci-dev-id>
+ *     -object x-vfio-user-server,id=<id>,type=unix,path=<socket-path>,
+ *             device=<pci-dev-id>
+ *
+ * Note that x-vfio-user-server object must be used with x-remote machine only.
+ * This server could only support PCI devices for now.
+ *
+ * type - SocketAddress type - presently "unix" alone is supported. Required
+ *        option
+ *
+ * path - named unix socket, it will be created by the server. It is
+ *        a required option
+ *
+ * device - id of a device on the server, a required option. PCI devices
+ *          alone are supported presently.
+ */
+
+#include "qemu/osdep.h"
+
+#include "qom/object.h"
+#include "qom/object_interfaces.h"
+#include "qemu/error-report.h"
+#include "trace.h"
+#include "sysemu/runstate.h"
+#include "hw/boards.h"
+#include "hw/remote/machine.h"
+#include "qapi/error.h"
+#include "qapi/qapi-visit-sockets.h"
+
+#define TYPE_VFU_OBJECT "x-vfio-user-server"
+OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
+
+/**
+ * VFU_OBJECT_ERROR - reports an error message. If auto_shutdown
+ * is set, it aborts the machine on error. Otherwise, it logs an
+ * error message without aborting.
+ */
+#define VFU_OBJECT_ERROR(o, fmt, ...)                                     \
+    {                                                                     \
+        if (vfu_object_auto_shutdown()) {                                 \
+            error_setg(&error_abort, (fmt), ## __VA_ARGS__);              \
+        } else {                                                          \
+            error_report((fmt), ## __VA_ARGS__);                          \
+        }                                                                 \
+    }                                                                     \
+
+struct VfuObjectClass {
+    ObjectClass parent_class;
+
+    unsigned int nr_devs;
+};
+
+struct VfuObject {
+    /* private */
+    Object parent;
+
+    SocketAddress *socket;
+
+    char *device;
+
+    Error *err;
+};
+
+static bool vfu_object_auto_shutdown(void)
+{
+    bool auto_shutdown = true;
+    Error *local_err = NULL;
+
+    if (!current_machine) {
+        return auto_shutdown;
+    }
+
+    auto_shutdown = object_property_get_bool(OBJECT(current_machine),
+                                             "auto-shutdown",
+                                             &local_err);
+
+    /*
+     * local_err would be set if no such property exists - safe to ignore.
+     * Unlikely scenario as auto-shutdown is always defined for
+     * TYPE_REMOTE_MACHINE, and  TYPE_VFU_OBJECT only works with
+     * TYPE_REMOTE_MACHINE
+     */
+    if (local_err) {
+        auto_shutdown = true;
+        error_free(local_err);
+    }
+
+    return auto_shutdown;
+}
+
+static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    VfuObject *o = VFU_OBJECT(obj);
+
+    qapi_free_SocketAddress(o->socket);
+
+    o->socket = NULL;
+
+    visit_type_SocketAddress(v, name, &o->socket, errp);
+
+    if (o->socket->type != SOCKET_ADDRESS_TYPE_UNIX) {
+        error_setg(errp, "vfu: Unsupported socket type - %s",
+                   SocketAddressType_str(o->socket->type));
+        qapi_free_SocketAddress(o->socket);
+        o->socket = NULL;
+        return;
+    }
+
+    trace_vfu_prop("socket", o->socket->u.q_unix.path);
+}
+
+static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
+{
+    VfuObject *o = VFU_OBJECT(obj);
+
+    g_free(o->device);
+
+    o->device = g_strdup(str);
+
+    trace_vfu_prop("device", str);
+}
+
+static void vfu_object_init(Object *obj)
+{
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(obj);
+    VfuObject *o = VFU_OBJECT(obj);
+
+    k->nr_devs++;
+
+    if (!object_dynamic_cast(OBJECT(current_machine), TYPE_REMOTE_MACHINE)) {
+        error_setg(&o->err, "vfu: %s only compatible with %s machine",
+                   TYPE_VFU_OBJECT, TYPE_REMOTE_MACHINE);
+        return;
+    }
+}
+
+static void vfu_object_finalize(Object *obj)
+{
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(obj);
+    VfuObject *o = VFU_OBJECT(obj);
+
+    k->nr_devs--;
+
+    qapi_free_SocketAddress(o->socket);
+
+    o->socket = NULL;
+
+    g_free(o->device);
+
+    o->device = NULL;
+
+    if (!k->nr_devs && vfu_object_auto_shutdown()) {
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    }
+}
+
+static void vfu_object_class_init(ObjectClass *klass, void *data)
+{
+    VfuObjectClass *k = VFU_OBJECT_CLASS(klass);
+
+    k->nr_devs = 0;
+
+    object_class_property_add(klass, "socket", "SocketAddress", NULL,
+                              vfu_object_set_socket, NULL, NULL);
+    object_class_property_set_description(klass, "socket",
+                                          "SocketAddress "
+                                          "(ex: type=unix,path=/tmp/sock). "
+                                          "Only UNIX is presently supported");
+    object_class_property_add_str(klass, "device", NULL,
+                                  vfu_object_set_device);
+    object_class_property_set_description(klass, "device",
+                                          "device ID - only PCI devices "
+                                          "are presently supported");
+}
+
+static const TypeInfo vfu_object_info = {
+    .name = TYPE_VFU_OBJECT,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(VfuObject),
+    .instance_init = vfu_object_init,
+    .instance_finalize = vfu_object_finalize,
+    .class_size = sizeof(VfuObjectClass),
+    .class_init = vfu_object_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void vfu_register_types(void)
+{
+    type_register_static(&vfu_object_info);
+}
+
+type_init(vfu_register_types);
diff --git a/MAINTAINERS b/MAINTAINERS
index c92d87daac..8121671228 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3603,6 +3603,7 @@ F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
+F: hw/remote/vfio-user-obj.c
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 7da83350c8..0eb5a0f375 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
+remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: files('vfio-user-obj.c'))
 
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: libvfio_user_dep)
 
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 0b23974f90..7da12f0d96 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -2,3 +2,6 @@
 
 mpqemu_send_io_error(int cmd, int size, int nfds) "send command %d size %d, %d file descriptors to remote process"
 mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d, %d file descriptors to remote process"
+
+# vfio-user-obj.c
+vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
-- 
2.20.1


