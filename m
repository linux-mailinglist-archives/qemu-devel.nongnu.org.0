Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799CD6EB3E9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 23:50:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppydE-0001kn-KD; Fri, 21 Apr 2023 17:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1ppydB-0001jh-9R; Fri, 21 Apr 2023 17:49:25 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1ppyd8-00051E-UZ; Fri, 21 Apr 2023 17:49:24 -0400
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33LKWl3u007843; Fri, 21 Apr 2023 21:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=vtqE7sOq8SAzm4HOKtJviu9g6QfPaCzbhojnzxhSHDk=;
 b=wwpZuTGNZ9zbKUX79YH5+7Na8NAtTWoWZaPdALHkZZyzx1r+eGvGfpkTc3F6StfESbg9
 aecOYJOg+L0lFmcl37GlbMaRpbnv88L2IZ3hXN+OqXZtPiglLZF2E+2RabzYDG04ikBF
 kRN+NG4taQ7qswP5PtwLCTV7NpKOxk848/pXrKcz0SOooAOhLFVuMNpD/4rG/gG0essm
 7W4iBkLmYLZRONbFiDbKdo540AyP+2Amqld+uhVJMQ/elDx4+RYGg/z9ehvSmyz+f3if
 Ltwn+cMtxGho5H4gWTYt61CqBNDVJ1DJXc6zAYt/TsqO8EynG8hXx6h70sbnFYj2seb2 ug== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pykyd6cv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Apr 2023 21:49:18 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33LJm4BR037052; Fri, 21 Apr 2023 21:49:17 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3pyjcg6w37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Apr 2023 21:49:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSjyyfAemDylbmoMOWU4um0FISVtGdbZkz44w8pJMwq+rePuUDvBDb1efzcuYQ/C7y40lGau9wt6TeDXk4I3IkhOPgghPZ7oQ5ZEP2KjnoH4C4dP7r8Bfa3VKgc/i9EWU47DocTRz4MnzfiAk951b068ZZ+Eb3ZEMsTDvC+Dd7rgLV+PTcb9bSdLrUYmBo2tE+v8J+kfoXeo8trfOcRc8ChrmB+bjWYlm594ZUCTXTb30WdEBX5H9QfS7GmMxYCjnoL0990TRcPXENSdrkYdD4knxZ7wYzE25Bj8bVEHDy2Xla/vRgEnlfl4+MBNv8UX1fhPz6AY5MoiIs4CntIB5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtqE7sOq8SAzm4HOKtJviu9g6QfPaCzbhojnzxhSHDk=;
 b=SEVszxzIzC/AkhPViSc5ZStqlhTb+oKcMH+nmdAeqVyTMDVRTJzWOSTRMqNiSLbISZkrmEpzjdDvWS9TibVmmUBWrLaCD/t9JXzrNPC4YCxL2Cq1tWJvW22kSJUrw88qg38obqJipXl50wm7TiQ7tt2Qd4gfv0QVG83Iitq55HzRXsjqCZYCM0ozk2t0n4dL7FeMwsWiRIQEHtRP2O7o1eNxQRtHF/etP6kdeAno1rTQeW9lgojO7BB4oXUOf0M5J/2fvQrnJetU/HE2d9NFC0xHQFhZIhNXuzY3NZH4mfkd8xxXr8LKLhSQ2T2WpCh3sHVAlPc9KvxU7dR04PWB2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtqE7sOq8SAzm4HOKtJviu9g6QfPaCzbhojnzxhSHDk=;
 b=JStE3e69pRuC2ABNoQT3Byw7cuhJusdrGpeKVGb+6F5a9s0kKcMcJhFDpcOiiYLFnIp5OTExUWubIgg2gpweJM3i61qM4n743BFR85SViHRepE9dO5g8Il8+Wb/VaWtepjWoF7fgLACqlMrvO2wabD6SDI2rX468jEAlU//3D8M=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CH3PR10MB6857.namprd10.prod.outlook.com (2603:10b6:610:14a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 21:49:15 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac1a:bf88:bdbf:2573]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac1a:bf88:bdbf:2573%5]) with mapi id 15.20.6319.020; Fri, 21 Apr 2023
 21:49:15 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: shannon.zhaosl@gmail.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net
Cc: boris.ostrovsky@oracle.com, miguel.luis@oracle.com,
 eric.devolder@oracle.com
Subject: [PATCH v3 2/3] ACPI: i386: bump MADT to revision 5
Date: Fri, 21 Apr 2023 17:49:00 -0400
Message-Id: <20230421214901.2053-3-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230421214901.2053-1-eric.devolder@oracle.com>
References: <20230421214901.2053-1-eric.devolder@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0044.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::19) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CH3PR10MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: 2179ab9f-8102-4dc4-f561-08db42b24006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: su0uTL6KiCAJ6WGX1zCq/mxn6Ys/JJULCFaBWZB8WZGI58eCBvEB4HEhiJg2g8AD1v1YBdnj2xN+AOSJZwvjr0adoCZ9zdDXexhQicdDJx8SK+izXQNCh/hUmi8dd1b8tAzppbWZxRQ7qAhCI1DU4qYvN88ZV21Xw+TMJeQHk+p3J94ZbFdRl5gEQeHGVd25mocpWbOCC1LMLYqkbFqvY+NW+4Fkv/l9dofpPw0Ps60Qxhm6rum3hZcpVV9xPtCNHpIGA/Fxx5oXhsQPe7E/iNYC7TuBmePCLMT1Uwz+ofvo8sqNP2AABb9aN/oJDcnoeeshE2vAFWnaKkpJw85xauk3Pxm8mXtM01YdpiuaOnK11ZGBMMGDxUY5ZBCiJkVD0t7E7zY7VU8FDBvHkl/Y3Oszbs8DRDGqcg5okIfNp11ftlVkvNDVaXoODfjfj1EgVLEonM7gYV150XfZG92EBc034UTY9/hzF/0hiGxgUkT1MXuiFNZ6CCWB+sBKO6B2ETbMH7vZxynLp5PMqL/1TVxCNjJx/aq/HixdyFKnPqOS2Fp8v5VXGHKAWNqrYw5qVHXV4hJV3CWnEnAvcL1fN32hz1schK4QIEqFMi7nwgU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199021)(36756003)(86362001)(478600001)(41300700001)(921005)(8676002)(38100700002)(5660300002)(8936002)(2906002)(7416002)(4326008)(316002)(66476007)(66556008)(1076003)(6506007)(6512007)(83380400001)(66946007)(84970400001)(26005)(186003)(966005)(107886003)(6666004)(6486002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjZ4Ym1lS2gwVTRNakdRU1EwUFRJWVlaWHhIdFh0SVkzVjljNWdTakswZk9w?=
 =?utf-8?B?NVpzL0VBSWRtOTRWQVcvenJXc1BkN00yMnBQaTZsdVlVOEQ0VU9lWlI5RHZ3?=
 =?utf-8?B?cUhIL0hlZDlNcUpKMmdTNEtrMUZ4aHV4bW5rOUVpSEpFUERoOURHQ0VBZUtZ?=
 =?utf-8?B?SWQvdHNXd0hQS3dhSlZMS29wYWdxRlNlNGZtSU9vem13eUxxVisyd25BVk13?=
 =?utf-8?B?ejNzT3MxNmdJMlNmWFZSaDBrQnA1TWNVVzVkRXA3K3VlTEtJRnlVcUhqb1Bu?=
 =?utf-8?B?SmpnelhySnNuYjYzMUJJbC90QzFxL1RidmZ0RGJCNDcwZkhIWjdzUDRUZ1Vv?=
 =?utf-8?B?bVlXV2wzRlF5VkUwNGF4b3I5K2QwcHBOeGh1VHZ2MStPU292by9zeVgvcWlC?=
 =?utf-8?B?clJXc3h6Z1NlY2JUTFRxclVMeWNVQ3Q4YnU3MUthRWhkb2RvYkFRSUkwSDcv?=
 =?utf-8?B?NkgzVkFFVUp3SVZYTEFobVFWSlRkUC9XWExxN3l4Y214Yk02ZnJVYVNlc3Zz?=
 =?utf-8?B?UTdoTnhQRlZCcFoyYWJRNjJ5TEZPRncwVlFaalRJbFUzQ2NjNnpxcVQrbnJr?=
 =?utf-8?B?bEVYVloxY3FZUDZHZHV5SzFGUGpUVXFuc1R2QTJ1VDZCYW5iTUgxNjJVS0t2?=
 =?utf-8?B?RmtEczVHKzRFSStxazRIK0xxVVZTNUhuaXVTbjUzTVowMVZEaWFzWk9OK1My?=
 =?utf-8?B?VmxPVHUxMXpGTmFUMnZCRjVFYTJxMFpTamd1YnBHeXFIN01KYzJQZ2NNODZP?=
 =?utf-8?B?MVBwR2xvdFA1bWhvQkViKzRDc2REanJxME5BeFV4Wk05aFlKRVVGYnZWSUQr?=
 =?utf-8?B?K09KcGZOZzBEWGlJMVR1b2RMd2ZXb3E2WTF3VTlCU2NlTkVHa1dQQ2l4dHZ4?=
 =?utf-8?B?dlh4RGoyRmdFNHpuVWl3dUpLVU9EV3JzUGtibzFzNTJ5WVNWelcyODJwK0Zs?=
 =?utf-8?B?VjZnenN2RytEWUNISncxVlQ3L2kxZTZFaTQxTXJvQzRqbVpHdW9RWTIweEhn?=
 =?utf-8?B?R3EvRzkrQVlsa3hwcDUxejNBbU1BZktSenI0bXZwYTV3M3ZqZHU2V1YzeXlT?=
 =?utf-8?B?QytQQi82RWc3YzN0NE9SM2tLQkZ1ZGtyUVFJUWN5VVJvdHpVZUt1UVJNdUls?=
 =?utf-8?B?SVU4V3kyNE0yUEhMdzk1R2p1Yjh5bUZ6TGhaQ3BsdjQ1WmhrMnFhMy95WTJY?=
 =?utf-8?B?ejBLMCtycS9qV0FVYVZ3YnFsZTNaS0NWTEdRMCtYd2ZjbkZZVzU5Y0s1cWdv?=
 =?utf-8?B?eWZGMWRTWG5JeDA2VDVISXFrNC9zSDBlRDBuSVJLV1pxd1gwK1VJZS9BQzY2?=
 =?utf-8?B?dE11S3JyWUNnbXh1TWZDanJTM2xYMEp2YlQwSzFiSW1vZlhISjR6RzM2OU1O?=
 =?utf-8?B?NHBGbEJqNGhZanlFc05CTGM5U0lCeHRKa3RWOFBKYWdiVjVUWnkzSUQ3ZG5S?=
 =?utf-8?B?SEluam1pd3dXZVQveHozWEhJWjA0Um9XeGZxV0xXc0RMdFhiK0VlYzZ1RnVX?=
 =?utf-8?B?YTVjdDZmZXpBWXZsNkhZTWk1SVd5dEFteWhrS2JnQUZyKy9rU1RDcUdwYWR0?=
 =?utf-8?B?aEEyY2NZM0FVbW93MFFtWThSVHlHMXJJNGlPSzk1UHY2Vks4QlNicU9YR0pI?=
 =?utf-8?B?VENySFBMTTF5NGdxUy9iN0h2dTBRdFlWSWNVMHY5cW93Y0l6cjZkMit3N1ZN?=
 =?utf-8?B?RXlPUjE5UWRaemxic0phTlBwVlU0YlZDcWZESEJBWWQ3eTAxdDQ2S2M5Qlpv?=
 =?utf-8?B?aWd0VHkxQUJibUcvdlQ4cUIyM29lRytsSlh0MjdhcnlCTUE0ZUY1RTVSTkVH?=
 =?utf-8?B?R2p2UkpieFUwSG41Wkt2V3E2T2FuWHdNZmQyMW9DMXNBSHJmVWdmRkE1NlAy?=
 =?utf-8?B?K0J1UitBYkgyQVhDSlhXRmFhY3prQW5vSUtZbGhSVzBjclE4NjhGbHR2Y0l3?=
 =?utf-8?B?eE5wNlo0VlNFa1B2cjE5ckdWSVVPdXI1UEpSdDFnTGd1akEybm5RdExET0x0?=
 =?utf-8?B?SGp0M1Rqdkdxd2pjYnJ4VlpvdCt4MjFBam9CdG1GeFU0V3Vjc3o3ZXprSVd0?=
 =?utf-8?B?TWRROHk3VjEzUGR6MlpsSjlyWXAxT1R3am84U1gvc0xQeHBQdVZuSG5USTJ0?=
 =?utf-8?B?eWdkVDNsd2pGNkRlejBpUkcramVvdU9ZTDBVNHQ3RkFYTmI4Q1d2aStUTENF?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 3cmH4LWlbp0dmxK2w6Zyy7wT8hrscmTwUqOY6N1iTLO9Dmth+c8scp4YlGpY0IBy0XWZOrB4xzs3i5ycsoVvZlWA4TkwKf6aGnh+67x2+y2rnftL9fUt2/udp42vt4N5hIdwnA++j1dnhdsCYMDJpGBlrSBw7wP7PAVCwjCt5AbZnn5AT0EM9GKTYOqDRl943Txack/vgO/+s7N6P89//5qweoQzRrX+LS8MGJJu5G5xxFFhLUfmxuXqIDoBrdzecIewDhVHQwxEWJZ3/c8ap6OePROI9llJ4aKC4CMGAd9HWhHI19rroCCiLqIOCXPjhpdz3WDKvONNaz5sk0vqqwZLWrKSa5PAwOWzbnUEcDndFGnM5lzx+tfT7GNjwszkNIqXP2I+DZnnzJkpbrNq38VMbCR+B0uISLVh7OXuP2r9r/MYM2HhW+THtlbnL3CCxrNxFJWkPGl8ffDpCqHELZeIAGyaCY0dCZG5xe9+WHqGoHYHFpKeoJRTWmYel20tK1zkzKhDlEAibuBuEFSWJqyR80Er4/llcMw/r3+JluEx+41Hdzyn38sqlJRns7tqToBZJ6w5qQXgGZxusacgSongQ87PZ/7ZY9FhBe1thQpdVzTlr4RhJVxF9ESEFYIDjIbvgRF1NFCfqSK4tS9YnvZUO4HlZTkpm+9zaOHSrXHr9gebD+XaWLaQzj+nL/z3FzEKcPsDhEy+x39eLUEn5QlQjcKV+UX+JdlC3HlsTiHLb+laG7L15XFZJ4a854biMmtcD3EK7oQUUEToBeqyh5nYceNybcGo8DMbfhRN1V4HbEOz1aH7++WbwIc/3f6BF0fMmCBYsdWEuvcDawJpPKmqLh1G9gHF2/EZPX2hbeJM/SAM3aRK1fHa4FgUCg1iPWjGBwk+4KRfGkS37CAl3w==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2179ab9f-8102-4dc4-f561-08db42b24006
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 21:49:15.0928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I7qCApug3zS0Navtb5r4K4LEjT+wLPSF23Kg+Sr6rJRcYR0pDwV21BO3J6OXMrluSwnYe97eq6Gt8f0Lt+BHoAqrc4fp1FN46QcDn7xfo+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6857
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_08,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304210190
X-Proofpoint-GUID: splD1stq0dEHORdpwTex4CRxiyOJEV6u
X-Proofpoint-ORIG-GUID: splD1stq0dEHORdpwTex4CRxiyOJEV6u
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
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

Currently i386 QEMU generates MADT revision 3, and reports
MADT revision 1. ACPI 6.3 introduces MADT revision 5.

For MADT revision 4, that introduces ARM GIC structures, which do
not apply to i386.

For MADT revision 5, the Local APIC flags introduces the Online
Capable bitfield.

Making MADT generate and report revision 5 will solve problems with
CPU hotplug (the Online Capable flag indicates hotpluggable CPUs).

Link: https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@ora
cle.com/T/#t
Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/i386/acpi-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index 52e5c1439a..5a5e73c399 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -39,7 +39,7 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
     uint32_t apic_id = apic_ids->cpus[uid].arch_id;
     /* Flags – Local APIC Flags */
     uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
-                     1 /* Enabled */ : 0;
+                     1 /* Enabled */ : 2 /* Online Capable */;
 
     /* ACPI spec says that LAPIC entry for non present
      * CPU may be omitted from MADT or it must be marked
@@ -102,7 +102,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
     MachineClass *mc = MACHINE_GET_CLASS(x86ms);
     const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
     AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
-    AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
+    AcpiTable table = { .sig = "APIC", .rev = 5, .oem_id = oem_id,
                         .oem_table_id = oem_table_id };
 
     acpi_table_begin(&table, table_data);
-- 
2.31.1


