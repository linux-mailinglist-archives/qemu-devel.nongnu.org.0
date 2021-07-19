Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1233CCDE9
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:30:00 +0200 (CEST)
Received: from localhost ([::1]:57390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Mmt-0006lM-S9
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlD-00042x-6a
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:15 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:28452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlA-0002EF-4H
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:14 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J6GLnv029074; Mon, 19 Jul 2021 06:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=IdpYrI33Psaru+b+HcRdQyutB3piV2brraP7gYI/c8A=;
 b=wBLWP6sbzDIDpL/5xRKKU0fRNdTuk5WST6lAt1ZN6UHR80dGu7ZvTk3laW7IU14F9P5j
 bA9pGErx89BnXMjelPiXTzfuEBNdv4KX+8F5ZKjJMtscs08tdCKBtjvSeIf1vw9IDeqO
 9537hY7z8Diwu+Z+vpKV0bCz/sv8LKZPO15vqO1E/kF0y8LtEt6IP+7G2AZWtPSYe3Bh
 Hqjuv9sJWGti0GZaF0wGvqU+ZDrcFBXTBUr3B6BK87Y80zuDsqeGz1jrPaXjoCQhmDiw
 SJiiLRWFPT668ix7vNzOb9h8Ujy46Eq8ynd9YsP1lPt8Ah28nOJzsIxeM0vsi+9vvlIF 3w== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=IdpYrI33Psaru+b+HcRdQyutB3piV2brraP7gYI/c8A=;
 b=B5GnfZIu7dntNZRWGAjPbDvBd4XgYF3ekCqpYAWJsi1ChSft/DIXq8vU3UH007Fz0tCj
 8o6V5k08EL+ILTaqPVdm5o2F0Y3eAus9y7VmaabdhYC5SYaur4Qiw4/5GvtA1zOLxECQ
 m8AiHY6FeqqU/sKRbyy4wUhuMTdsPVoH8Q9qRrgawLsrutRGLg9Jz/6PhJYp8XSVNlkh
 OCxp8XHfKjZeKf7NE/Rb34aPxvpEa++D21E+K4d3P+tiyYaMbS0Rjzq4Hb1lRWPeGqkH
 ccNHFKDqxjUIeKygHULdPgcRIiX1DlJNcg5OKfgZSdP1n4uIfGFmFnPYICpv6BCJMm3R lw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vpkwrnj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J6G9T1086873;
 Mon, 19 Jul 2021 06:28:07 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by userp3020.oracle.com with ESMTP id 39v8ys1vt5-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbCWHEizAxx/LjNCCizf6FAWLXloCswE1FrM0ZX5ncxABQiHPysMRRODBDKeCYmYzpw/5bhPLZaBvGMdhSSrYIdmY8Vfa/146i6NfgiTHGMK9tOW7KbFsVHaNI0pcxbuZSosVslHwT1YtBw6qjgjWsn/CjEfToM6WR9HnCpoHbw8DJh1hVCbD+/kNbMPZ8HXGjNDOES1dVa9AV3rz0q8/TFnr38mrpcYykyTN8WSen1gf7fbtAOuddw9s6BlcsQKADf8O/EF1e2JPZAvMLX3nwdyAf6NmUymb713qev0+QsvPLPB+IDJv8s6OCmHO953SJsjIrnPkbuOZTnjwjavhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdpYrI33Psaru+b+HcRdQyutB3piV2brraP7gYI/c8A=;
 b=Z21D0x9BN/QL4pUyPxSE1we4WifPYrjRv/lN91pOFxnvaYrI6VjF+A64gPgZxXI97ehe/9aUt4NF03o6A2/KA57eAQdWtOdScwlonxahMNhgZjVfrz+hSvZvcIhsyqJ109LpEkoi/c6+rxnJ1Sxx2d6z84U0/Ijr2Ao6E0hBuW7nKicNCeBPOB3UDuVdGNUDqcR48CZb/wn9ISV1xERKz86uFbeRBh5eUGzYNOv/LctPwPwl3AgiXKUlleQHF7Z74KKnHljq/U+vDfGMXTSnSzhWiwMSXzzxYXAiIxLc4C0ABQI7rGRmL4lJa/hZIVO019EDrU0WjgVHzVfD1QG4+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdpYrI33Psaru+b+HcRdQyutB3piV2brraP7gYI/c8A=;
 b=WA2ozn9kM9UHrzBXZHkmS1S+PjEjdRbQys43nCyuOA0OEwpLmVLGE6V3qfBv9BgEDlMutD+miuXipPZgDJGmz/CgQPoeIdtKEF05oJax8UD8mqMDlESXzch6r+kEuEx3o740T6SHrTuveM81GgiFg2tSwbv/IXuetlBc2hLl+ds=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4814.namprd10.prod.outlook.com (2603:10b6:a03:2d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 06:28:05 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:28:05 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 03/19] vfio-user: define VFIO Proxy and communication
 functions
Date: Sun, 18 Jul 2021 23:27:42 -0700
Message-Id: <cd9d5d6214d957db61120d9c3cbdc99e799a3baa.1626675354.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626675354.git.elena.ufimtseva@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:3c73:d99e:ec8c:2487) by
 BY5PR16CA0022.namprd16.prod.outlook.com (2603:10b6:a03:1a0::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 06:28:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ed30e42-8392-4291-959c-08d94a7e5e1f
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4814:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB48141DD6CA3043C8EAC922E98CE19@SJ0PR10MB4814.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 46a7oJGeWfv8faCHW79MOk7PUzOZviM4u4OlSptsWERiIRziOjBhTMEBqZkl1YH/W7O4PgiV52tElyYMZgwso1LMk1BRYlkaLS5cbnGXSBWcKoaZl7H0vPQpULn4UPVPHXw3ReKinZynzCB+YXpyNimINxBc9vlI2DwMb+iQOE9nT2++rD+P9NW/6DqX+4AptuQMSUCXpjfJrpBE3bZcqaUOvhLdWlkXv73Mt7SeAGn56gAYBeHZfTVhrPGsZyinwVvwHLTudpoao1/GA0WRXnIYKK4MitS1s9rvMUpCsG797NdPVXZyMYWYVkkGcJN9JNBl5kK6mMD4U1BEG5Hlcyfhjs3bBZHztT8JUBFMeFLXpgxuu6HBpDxKeG7c2Fe0s01Em+dFAm/K7FPt5qO+FXE/7XpVWSbDfDGs5QXYbePUkVUEfYdnzS/ikRgoYfyjF1cyJe/2wCYdUM6ZVlcshMUV2q1p7i/FNsg30PwVYftSs1q1N8eiFaF4nuCjjBrTyS/Gq8GgAz+y3akApjcHzWMmBrxpBkV1FjQmTd5dXdaCWgVDALwZqnzBodh9VCQtqADUgdSkIWLLDoBvpCmWrel2MuhlqKKx0S+GS1iqH9orAkCkF0PlgQ0PzJj+jM9/lehYWsL6SRyBpzmQfMyukg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(376002)(346002)(136003)(2906002)(30864003)(6486002)(5660300002)(316002)(6512007)(186003)(66476007)(44832011)(66556008)(2616005)(6506007)(38100700002)(6916009)(52116002)(6666004)(8936002)(86362001)(107886003)(8676002)(83380400001)(66946007)(478600001)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0FEb0N2c21oRndjOGxiRVZIZU5wWExJbi9zbnd3eWgyenpiQkRiZTlxVlJT?=
 =?utf-8?B?Z3c3V3hyY0k4RGVNT0tlYkJHVkswZUZVS1YxVEdOZ0pBeWJDYnQvdUVxWTB1?=
 =?utf-8?B?RnZseXI3cFFnZ0M5b3UrLytJN25scXdqazBoTTVLWHJhVDZ6dGkxMEJ1elc3?=
 =?utf-8?B?U083RjFNb0gzaG1mTE1TUzM1YjFrREY3NDErQkdKbXF3Mm50cEdjMnhXRlBL?=
 =?utf-8?B?bkFnTWVPZ1BvS1VpZXpTUjhhSXZYKytrSmFqeExtQUZucmNuSGh4aHRXZWJL?=
 =?utf-8?B?T25GQm14S3hRVWtDd1Z3V25RTHNTSlNCeFZIeUJtNnhUdVg4bmJtQ0dDNGtt?=
 =?utf-8?B?NEplelhBOEtyZjc1V2ZwNStzYnNBWW5nRWFid0t0Vkx5UFNwVDhrUmMrc1By?=
 =?utf-8?B?R1BlSVI5eVpsNFJxblNaRFVTeFBFbXVHeGplVnJoYWVjYjZ1blpMcjh0OUlP?=
 =?utf-8?B?SlgzY21lYVdUcVMwUERCUFFoNDM1c2xyM3BjU2MrdjloS2t4KzVSc04wSHFp?=
 =?utf-8?B?Z1RvM3VYSVJVRjI4VmF0bVB4dzFDamMyT1cvRWVlTzJNQ1ZnNnlacjhwTXNo?=
 =?utf-8?B?ckg1aW9Da29QWkRnQ0hKWUJlTExRSXBROGlNTS92Q0xzMGRlOFdLeG1BQmdJ?=
 =?utf-8?B?TTlNcWlTVzRCMHp6d3dzYVJ2d0VsY3JrQWY3QVRtT0pOZWFjdWVGM0NiRWdG?=
 =?utf-8?B?SmY0MjJDQ014RmI3STZScGFabHFTRnZEWlFrcEIxTVhPMkZ1dHlqSlB0b2Vx?=
 =?utf-8?B?K0xHREpoRWxOdWVBK0tibnpTZ3JJV0Nid2ROOEhuTHlyOHF2Uk9US05KT1Ux?=
 =?utf-8?B?VTlxakdNUDdwRk5HR3VBTDhqUDVaWjJObENnZ3U2ckRWRHZJZXFlSDdDOXJ3?=
 =?utf-8?B?a0d2VlZVVTU0SnJtcEZ5QU9HRnRCY0xkNnMzejVvMVp3YVl3NmpvZmhJV3dG?=
 =?utf-8?B?cHpWbUNxcmUvZ1J5RmhqSzA4ampteldIRGUrcXU4ak9KeUtRQ2xCdUwrSjlT?=
 =?utf-8?B?QzREMXYzMUJ2NWJzalhjMmVOeFowSWpXRFdiZWdYa29HUWtQVzczemQ4SWxt?=
 =?utf-8?B?VXIrYjZWa2p6c1E2bnFFbFQ0NW9BRmJndyticmkrVUpvZzVNcjZYd1JUWGNz?=
 =?utf-8?B?SkMvN2hiUnVxeXl0T0N1VWZDVHgxNWluUEI5TkRUTnJ6OTFCc2RRcmJLVXlj?=
 =?utf-8?B?clZvR09QTlBzRmdzV3VoZ3p2M0NVM0I2NXJ0UlhkWW1EOFhxK2NsMzVsNk5q?=
 =?utf-8?B?ZTB2VHF5NjJoMy9MbDVsdEJnSDF0aGJ1UzhtT2cyanhPczlnN3ovSHFZV3Z3?=
 =?utf-8?B?Z29vTXlKUHVlcy9BWmg2T0hqNTcvSkRHcXBTY25KaWR1azA0c1lXODBPTXFa?=
 =?utf-8?B?NDlJQXpkbjdkT0k1aFIxNGhoMFhSOXcwQmx4REZkdVJURlF0N29ZOEl3WTdr?=
 =?utf-8?B?VHRacjVTQ3Zuc2YxRzdrOHdaUmNwN0t2ZXAxaG9vUVBINm54Z014cjRmS3ZL?=
 =?utf-8?B?VTd5WGEyWFZCUnQ4VHY1SStXQUtqSjdvVmxxUW1XWXpXZVF3dzZUNk52QXhO?=
 =?utf-8?B?Y2NCMEtQSHFkaGJNZHU0QWVxRkRpTGtKVEJSU1pKMVN1MkN4aS8wcHJrWTFS?=
 =?utf-8?B?bDVFTWRJbzAxY2hXb3lZMnh2R0pqeXZYUm1tMUpvUDZLckl5MUpoWXphMkhh?=
 =?utf-8?B?dVpEajZMaGJNK0xQb1ZnNXh4MWxITWpKOUUvMzVIUDcvN2oxR294MzZCdUZ0?=
 =?utf-8?B?Wm91bWxMWlVNSnNOMXg1RmR1UE9iaU1EaktqeFZyekhRcXQwU2pvUU4xS3Na?=
 =?utf-8?B?bmdHdkZMMTNTZlI5MCs4eWx6Q1pWRkhzcldDV0N4US9oT1N0UDBOTkV0bHNr?=
 =?utf-8?Q?H2IdlEjuZphVD?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed30e42-8392-4291-959c-08d94a7e5e1f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:28:05.6018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+b+jz2jvGh26MYLDIF3TNI3K/rHiT1bEBPVIyc5LAecMIMHPqQvtTszLY70hwARnErcgaZxFrLGTriOuxq/Vtrm369gWCtSHkw76wjDhwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4814
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190035
X-Proofpoint-ORIG-GUID: 3uRxCo-L4u69AryTL53hSUigq3UWbk32
X-Proofpoint-GUID: 3uRxCo-L4u69AryTL53hSUigq3UWbk32
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.01,
 RCVD_IN_MSPIKE_L3=0.9, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John G Johnson <john.g.johnson@oracle.com>

Add user.c and user.h files for vfio-user with the basic
send and receive functions.

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user.h                | 120 ++++++++++++++
 include/hw/vfio/vfio-common.h |   2 +
 hw/vfio/user.c                | 286 ++++++++++++++++++++++++++++++++++
 MAINTAINERS                   |   4 +
 hw/vfio/meson.build           |   1 +
 5 files changed, 413 insertions(+)
 create mode 100644 hw/vfio/user.h
 create mode 100644 hw/vfio/user.c

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
new file mode 100644
index 0000000000..cdbc074579
--- /dev/null
+++ b/hw/vfio/user.h
@@ -0,0 +1,120 @@
+#ifndef VFIO_USER_H
+#define VFIO_USER_H
+
+/*
+ * vfio protocol over a UNIX socket.
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Each message has a standard header that describes the command
+ * being sent, which is almost always a VFIO ioctl().
+ *
+ * The header may be followed by command-specfic data, such as the
+ * region and offset info for read and write commands.
+ */
+
+/* commands */
+enum vfio_user_command {
+    VFIO_USER_VERSION                   = 1,
+    VFIO_USER_DMA_MAP                   = 2,
+    VFIO_USER_DMA_UNMAP                 = 3,
+    VFIO_USER_DEVICE_GET_INFO           = 4,
+    VFIO_USER_DEVICE_GET_REGION_INFO    = 5,
+    VFIO_USER_DEVICE_GET_REGION_IO_FDS  = 6,
+    VFIO_USER_DEVICE_GET_IRQ_INFO       = 7,
+    VFIO_USER_DEVICE_SET_IRQS           = 8,
+    VFIO_USER_REGION_READ               = 9,
+    VFIO_USER_REGION_WRITE              = 10,
+    VFIO_USER_DMA_READ                  = 11,
+    VFIO_USER_DMA_WRITE                 = 12,
+    VFIO_USER_DEVICE_RESET              = 13,
+    VFIO_USER_DIRTY_PAGES               = 14,
+    VFIO_USER_MAX,
+};
+
+/* flags */
+#define VFIO_USER_REQUEST       0x0
+#define VFIO_USER_REPLY         0x1
+#define VFIO_USER_TYPE          0xF
+
+#define VFIO_USER_NO_REPLY      0x10
+#define VFIO_USER_ERROR         0x20
+
+typedef struct vfio_user_hdr {
+    uint16_t id;
+    uint16_t command;
+    uint32_t size;
+    uint32_t flags;
+    uint32_t error_reply;
+} vfio_user_hdr_t;
+
+/*
+ * VFIO_USER_VERSION
+ */
+#define VFIO_USER_MAJOR_VER     0
+#define VFIO_USER_MINOR_VER     0
+
+struct vfio_user_version {
+    vfio_user_hdr_t hdr;
+    uint16_t major;
+    uint16_t minor;
+    char capabilities[];
+};
+
+#define VFIO_USER_DEF_MAX_FDS   8
+#define VFIO_USER_MAX_MAX_FDS   16
+
+#define VFIO_USER_DEF_MAX_XFER  (1024 * 1024)
+#define VFIO_USER_MAX_MAX_XFER  (64 * 1024 * 1024)
+
+typedef struct VFIOUserFDs {
+    int send_fds;
+    int recv_fds;
+    int *fds;
+} VFIOUserFDs;
+
+typedef struct VFIOUserReply {
+    QTAILQ_ENTRY(VFIOUserReply) next;
+    vfio_user_hdr_t *msg;
+    VFIOUserFDs *fds;
+    int rsize;
+    uint32_t id;
+    QemuCond cv;
+    uint8_t complete;
+} VFIOUserReply;
+
+enum proxy_state {
+    CONNECTED = 1,
+    RECV_ERROR = 2,
+    CLOSING = 3,
+    CLOSED = 4,
+};
+
+typedef struct VFIOProxy {
+    QLIST_ENTRY(VFIOProxy) next;
+    char *sockname;
+    struct QIOChannel *ioc;
+    int (*request)(void *opaque, char *buf, VFIOUserFDs *fds);
+    void *reqarg;
+    int flags;
+    QemuCond close_cv;
+
+    /*
+     * above only changed when iolock is held
+     * below are protected by per-proxy lock
+     */
+    QemuMutex lock;
+    QTAILQ_HEAD(, VFIOUserReply) free;
+    QTAILQ_HEAD(, VFIOUserReply) pending;
+    enum proxy_state state;
+    int close_wait;
+} VFIOProxy;
+
+#define VFIO_PROXY_CLIENT       0x1
+
+void vfio_user_recv(void *opaque);
+void vfio_user_send_reply(VFIOProxy *proxy, char *buf, int ret);
+#endif /* VFIO_USER_H */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 8af11b0a76..f43dc6e5d0 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -75,6 +75,7 @@ typedef struct VFIOAddressSpace {
 } VFIOAddressSpace;
 
 struct VFIOGroup;
+typedef struct VFIOProxy VFIOProxy;
 
 typedef struct VFIOContainer {
     VFIOAddressSpace *space;
@@ -143,6 +144,7 @@ typedef struct VFIODevice {
     VFIOMigration *migration;
     Error *migration_blocker;
     OnOffAuto pre_copy_dirty_page_tracking;
+    VFIOProxy *proxy;
 } VFIODevice;
 
 struct VFIODeviceOps {
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
new file mode 100644
index 0000000000..021d5540e0
--- /dev/null
+++ b/hw/vfio/user.c
@@ -0,0 +1,286 @@
+/*
+ * vfio protocol over a UNIX socket.
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include <linux/vfio.h>
+#include <sys/ioctl.h>
+
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "qemu/main-loop.h"
+#include "hw/hw.h"
+#include "hw/vfio/vfio-common.h"
+#include "hw/vfio/vfio.h"
+#include "qemu/sockets.h"
+#include "io/channel.h"
+#include "io/channel-util.h"
+#include "sysemu/iothread.h"
+#include "user.h"
+
+static uint64_t max_xfer_size = VFIO_USER_DEF_MAX_XFER;
+static IOThread *vfio_user_iothread;
+static void vfio_user_send_locked(VFIOProxy *proxy, vfio_user_hdr_t *msg,
+                                  VFIOUserFDs *fds);
+static void vfio_user_send(VFIOProxy *proxy, vfio_user_hdr_t *msg,
+                           VFIOUserFDs *fds);
+static void vfio_user_shutdown(VFIOProxy *proxy);
+
+static void vfio_user_shutdown(VFIOProxy *proxy)
+{
+    qio_channel_shutdown(proxy->ioc, QIO_CHANNEL_SHUTDOWN_READ, NULL);
+    qio_channel_set_aio_fd_handler(proxy->ioc,
+                                   iothread_get_aio_context(vfio_user_iothread),
+                                   NULL, NULL, NULL);
+}
+
+void vfio_user_send_reply(VFIOProxy *proxy, char *buf, int ret)
+{
+    vfio_user_hdr_t *hdr = (vfio_user_hdr_t *)buf;
+
+    /*
+     * convert header to associated reply
+     * positive ret is reply size, negative is error code
+     */
+    hdr->flags = VFIO_USER_REPLY;
+    if (ret > 0) {
+        hdr->size = ret;
+    } else if (ret < 0) {
+        hdr->flags |= VFIO_USER_ERROR;
+        hdr->error_reply = -ret;
+        hdr->size = sizeof(*hdr);
+    }
+    vfio_user_send(proxy, hdr, NULL);
+}
+
+void vfio_user_recv(void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOProxy *proxy = vbasedev->proxy;
+    VFIOUserReply *reply = NULL;
+    g_autofree int *fdp = NULL;
+    VFIOUserFDs reqfds = { 0, 0, fdp };
+    vfio_user_hdr_t msg;
+    struct iovec iov = {
+        .iov_base = &msg,
+        .iov_len = sizeof(msg),
+    };
+    int isreply, i, ret;
+    size_t msgleft, numfds = 0;
+    char *data = NULL;
+    g_autofree char *buf = NULL;
+    Error *local_err = NULL;
+
+    qemu_mutex_lock(&proxy->lock);
+    if (proxy->state == CLOSING) {
+        qemu_mutex_unlock(&proxy->lock);
+        return;
+    }
+
+    ret = qio_channel_readv_full(proxy->ioc, &iov, 1, &fdp, &numfds,
+                                 &local_err);
+    if (ret <= 0) {
+        /* read error or other side closed connection */
+        error_setg_errno(&local_err, errno, "vfio_user_recv read error");
+        goto fatal;
+    }
+
+    if (ret < sizeof(msg)) {
+        error_setg(&local_err, "vfio_user_recv short read of header");
+        goto err;
+    }
+
+    /*
+     * For replies, find the matching pending request
+     */
+    switch (msg.flags & VFIO_USER_TYPE) {
+    case VFIO_USER_REQUEST:
+        isreply = 0;
+        break;
+    case VFIO_USER_REPLY:
+        isreply = 1;
+        break;
+    default:
+        error_setg(&local_err, "vfio_user_recv unknown message type");
+        goto err;
+    }
+
+    if (isreply) {
+        QTAILQ_FOREACH(reply, &proxy->pending, next) {
+            if (msg.id == reply->id) {
+                break;
+            }
+        }
+        if (reply == NULL) {
+            error_setg(&local_err, "vfio_user_recv unexpected reply");
+            goto err;
+        }
+        QTAILQ_REMOVE(&proxy->pending, reply, next);
+
+        /*
+         * Process any received FDs
+         */
+        if (numfds != 0) {
+            if (reply->fds == NULL || reply->fds->recv_fds < numfds) {
+                error_setg(&local_err, "vfio_user_recv unexpected FDs");
+                goto err;
+            }
+            reply->fds->recv_fds = numfds;
+            memcpy(reply->fds->fds, fdp, numfds * sizeof(int));
+        }
+
+    } else {
+        /*
+         * The client doesn't expect any FDs in requests, but
+         * they will be expected on the server
+         */
+        if (numfds != 0 && (proxy->flags & VFIO_PROXY_CLIENT)) {
+            error_setg(&local_err, "vfio_user_recv fd in client reply");
+            goto err;
+        }
+        reqfds.recv_fds = numfds;
+    }
+
+    /*
+     * put the whole message into a single buffer
+     */
+    msgleft = msg.size - sizeof(msg);
+    if (isreply) {
+        if (msg.size > reply->rsize) {
+            error_setg(&local_err,
+                       "vfio_user_recv reply larger than recv buffer");
+            goto fatal;
+        }
+        *reply->msg = msg;
+        data = (char *)reply->msg + sizeof(msg);
+    } else {
+        if (msg.size > max_xfer_size) {
+            error_setg(&local_err, "vfio_user_recv request larger than max");
+            goto fatal;
+        }
+        buf = g_malloc0(msg.size);
+        memcpy(buf, &msg, sizeof(msg));
+        data = buf + sizeof(msg);
+    }
+
+    if (msgleft != 0) {
+        ret = qio_channel_read(proxy->ioc, data, msgleft, &local_err);
+        if (ret < 0) {
+            goto fatal;
+        }
+        if (ret != msgleft) {
+            error_setg(&local_err, "vfio_user_recv short read of msg body");
+            goto err;
+        }
+    }
+
+    /*
+     * Replies signal a waiter, requests get processed by vfio code
+     * that may assume the iothread lock is held.
+     */
+    qemu_mutex_unlock(&proxy->lock);
+    if (isreply) {
+        reply->complete = 1;
+        qemu_cond_signal(&reply->cv);
+    } else {
+        qemu_mutex_lock_iothread();
+        /*
+         * make sure proxy wasn't closed while we waited
+         * checking without holding the proxy lock is safe
+         * since state is only set to CLOSING when iolock is held
+         */
+        if (proxy->state != CLOSING) {
+            ret = proxy->request(proxy->reqarg, buf, &reqfds);
+            if (ret < 0 && !(msg.flags & VFIO_USER_NO_REPLY)) {
+                vfio_user_send_reply(proxy, buf, ret);
+            }
+        }
+        qemu_mutex_unlock_iothread();
+    }
+
+    return;
+ fatal:
+    vfio_user_shutdown(proxy);
+    proxy->state = RECV_ERROR;
+
+ err:
+    qemu_mutex_unlock(&proxy->lock);
+    for (i = 0; i < numfds; i++) {
+        close(fdp[i]);
+    }
+    if (reply != NULL) {
+        /* force an error to keep sending thread from hanging */
+        reply->msg->flags |= VFIO_USER_ERROR;
+        reply->msg->error_reply = EINVAL;
+        reply->complete = 1;
+        qemu_cond_signal(&reply->cv);
+    }
+    error_report_err(local_err);
+}
+
+static void vfio_user_send_locked(VFIOProxy *proxy, vfio_user_hdr_t *msg,
+                                  VFIOUserFDs *fds)
+{
+    struct iovec iov = {
+        .iov_base = msg,
+        .iov_len = msg->size,
+    };
+    size_t numfds = 0;
+    int msgleft, ret, *fdp = NULL;
+    char *buf;
+    Error *local_err = NULL;
+
+    if (proxy->state != CONNECTED) {
+        msg->flags |= VFIO_USER_ERROR;
+        msg->error_reply = ECONNRESET;
+        return;
+    }
+
+    if (fds != NULL && fds->send_fds != 0) {
+        numfds = fds->send_fds;
+        fdp = fds->fds;
+    }
+    ret = qio_channel_writev_full(proxy->ioc, &iov, 1, fdp, numfds, &local_err);
+    if (ret < 0) {
+        goto err;
+    }
+    if (ret == msg->size) {
+        return;
+    }
+
+    buf = iov.iov_base + ret;
+    msgleft = iov.iov_len - ret;
+    do {
+        ret = qio_channel_write(proxy->ioc, buf, msgleft, &local_err);
+        if (ret < 0) {
+            goto err;
+        }
+        buf += ret, msgleft -= ret;
+    } while (msgleft != 0);
+    return;
+
+ err:
+    error_report_err(local_err);
+}
+
+static void vfio_user_send(VFIOProxy *proxy, vfio_user_hdr_t *msg,
+                           VFIOUserFDs *fds)
+{
+    bool iolock = qemu_mutex_iothread_locked();
+
+    if (iolock) {
+        qemu_mutex_unlock_iothread();
+    }
+    qemu_mutex_lock(&proxy->lock);
+    vfio_user_send_locked(proxy, msg, fds);
+    qemu_mutex_unlock(&proxy->lock);
+    if (iolock) {
+        qemu_mutex_lock_iothread();
+    }
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 12d69f3a45..aa4df6c418 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1883,8 +1883,12 @@ L: qemu-s390x@nongnu.org
 vfio-user
 M: John G Johnson <john.g.johnson@oracle.com>
 M: Thanos Makatos <thanos.makatos@nutanix.com>
+M: Elena Ufimtseva <elena.ufimtseva@oracle.com>
+M: Jagannathan Raman <jag.raman@oracle.com>
 S: Supported
 F: docs/devel/vfio-user.rst
+F: hw/vfio/user.c
+F: hw/vfio/user.h
 
 vhost
 M: Michael S. Tsirkin <mst@redhat.com>
diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
index da9af297a0..739b30be73 100644
--- a/hw/vfio/meson.build
+++ b/hw/vfio/meson.build
@@ -8,6 +8,7 @@ vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
   'display.c',
   'pci-quirks.c',
   'pci.c',
+  'user.c',
 ))
 vfio_ss.add(when: 'CONFIG_VFIO_CCW', if_true: files('ccw.c'))
 vfio_ss.add(when: 'CONFIG_VFIO_PLATFORM', if_true: files('platform.c'))
-- 
2.25.1


