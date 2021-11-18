Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B117455FAF
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 16:37:57 +0100 (CET)
Received: from localhost ([::1]:43754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnjU4-0005oz-7V
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 10:37:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mnjQi-0001qW-Fj
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 10:34:28 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:28302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mnjQf-0006sc-TK
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 10:34:28 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AIEl7VY020982; 
 Thu, 18 Nov 2021 15:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=/vYfHqv3qrPbq9Tj0VVnuCloVktp6Vjvjg4K2nTCYpg=;
 b=0zHyIgwzn9URTsrTXjPY5B5sTiefAkQiNyLzMb19UdA2Xuo22qu13MqwN+OCTSHDIUdP
 cFoVvaTwg34EjTtdWa8N3eMWgKCdi/3e5vR4wLBVwQHS1NHk7XlH5894UmHjMMEm4bWq
 LHndSOSK2rCA/Z2FLLrvX9S20FzGUb6fdE9x4DgaXzOVijDW8IqdF3nT1HpZBzrA9w/0
 YRF1OyI10Ukq2HP6+rixV5gJSicaHQk7laxKIEmojzN7k8/CS/RKIUA5k8HmLxhjWKsH
 jO+rLWxpPQIVEFgrFIl4cWIoXSC86Le1CMtDClvJQR3eDvtF+DAXSZLLmK0difUNQuU/ ng== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cd4qyq5gs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 15:34:14 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AIFVU5i122947;
 Thu, 18 Nov 2021 15:33:07 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by userp3020.oracle.com with ESMTP id 3caq4w76j3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 15:33:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqODD158ENsyEGdWua3ARJvLQZxkB6hZSk5ZmysruNn/M/qSnwI/EBtD7hjt3g2RK8aoEPbtPRcyvMWCP18o0Bo4nXAm6Z5kgbenEjdYwBYiAu00f8Xhn3JsjcRBf8FMQuKOmDhQLmlEye1NMS8bhRno4cIGD0e2Jpp68180VKkMN2af0uEzG4PHhR5ULn2GZs5nLSkErZif8yLocPzMPJughJeeayh5g7I9rIEkUFmv8s1qsIr/5231vA4udoZCTlqKj4s9PRWnRNWzmfiUIicc6C/M+q1+8gn2QWHtmgMEiNuRjZhHvHNNRuPqmy8BZ+aDefEYPLZxrni0totjyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vYfHqv3qrPbq9Tj0VVnuCloVktp6Vjvjg4K2nTCYpg=;
 b=ZKV0czHLT+mC7iNM4KkXAT5mVrt0BJiN5+n5omH0RbhWEZfJjGS8y31vAmm4bPUvbJaAL38n1BRNniTHKEyVb0mHdrkd/t7l+krMUd4z4eHPBsUfp8xZTOBprhtgWnops9BsX/Tt8WwyLm8j3sf9kEvUljOA/uCzMKvXj4OKKmX5+BIydQtNkPfRDxzV86beCeoi0CEdtvgs5dlskn71N4qVdmmmiIUXx7GzCiTpBA5bA3vVwX2M3UQnON29nwHpeBuO98PJBO8hTCeDJeX5U2CXd640BJ8wT5lFSq9W4LVm6cUEIFad6VVsjbm+HYunFWKaU8MM4rSb52QJmvh2+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vYfHqv3qrPbq9Tj0VVnuCloVktp6Vjvjg4K2nTCYpg=;
 b=joMg2QZZZCFk5AeRjmP9aqnUqsQp67EkBlKatj0tUQadm1h7NdqolhsRdCAAGxQHVg9LvhF93PE54Yltz1WVVPyXi3jHWDRjoJvI9A9HuqVm34eYKNJnVwkTzZR4GugxAL88q7/0PuRExh7LpaUH8ROErH7z0jWtwvljbGfkWUA=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by BLAPR10MB5204.namprd10.prod.outlook.com (2603:10b6:208:328::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 15:33:04 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::9418:7fcf:86ec:e0f4]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::9418:7fcf:86ec:e0f4%7]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 15:33:04 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH-for-6.2? v2 0/5] docs/devel/style: Improve rST rendering
In-Reply-To: <20211118145716.4116731-1-philmd@redhat.com>
References: <20211118145716.4116731-1-philmd@redhat.com>
Date: Thu, 18 Nov 2021 15:32:58 +0000
Message-ID: <m2r1bd8onp.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB6PR0202CA0011.eurprd02.prod.outlook.com
 (2603:10a6:4:29::21) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
Received: from oracle.com (46.7.162.180) by
 DB6PR0202CA0011.eurprd02.prod.outlook.com (2603:10a6:4:29::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22 via Frontend Transport; Thu, 18 Nov 2021 15:33:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c18f1726-63e4-4190-5e5a-08d9aaa8b64c
X-MS-TrafficTypeDiagnostic: BLAPR10MB5204:
X-Microsoft-Antispam-PRVS: <BLAPR10MB5204E8B786DB8FC0B724E4CCF49B9@BLAPR10MB5204.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4lHCF/is8JUUFSJtRV12CeP21qQk/eLCmUEFhmMEF77S5ZAoLB30/XKhtPNH68sUdp3e6Kxd5vSyvgQ3teHyVC0ca1orDIjyUxCDXZboPm8FmVdAcyaBDh5ljG+KaIrSfsPgcstKAyqC602i0UMWwIoMFW5/lQP+kZ0MF4GF72SzWgyhpkOTks6jlayU4FrjfUqQQFdoCMd7RLIef8TH6vKAg59pqEWz5PcmfhSMvIcRKVj0t/FntKVzHrEYuT9MxSILHvCDHL5Mmik9vuyI1MX8aNRcDUrqRglTqdnKS3fVGbKU11DdYl8ErAULaUN5JW8vU3zNZ9shLHdgpI7nvekGZ+RCge2RpnqWz4N89EFBO6h4yorO9VhinNl+/nZW9b35HIcolUXXp/3G44+C0Ao4KO2vZMhdfWEaE3jncTFd8sFBrwCe783OsuSjETa7l3d4tfZG1WbJsBkbN2APwBkCKeSFqWwI5jUjhh0ia/D4aWJCXNfKHlvW7GznDBu5NMC7TE66EJXXe6DkOZVb4B1XqcaxIo50KarPi/rcwL1XAWLF+Q7bbYuwsdDag7HylcYht38qGjggCVZcXradCCowny/ofPBjsz9q/2JqJN3ebLvVYC6D2qgmFx++kv/AYRo7XLrHfGHpjx7ENFXHtE8iGgXfL/yX+UmxNa3W1bJ4Y2QyS4LQInED4HSdS0t5UjCVYxNbIXMZxzgvVDxNcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(2616005)(38100700002)(956004)(4326008)(4744005)(508600001)(316002)(38350700002)(54906003)(86362001)(5660300002)(36756003)(44832011)(66476007)(66946007)(4001150100001)(8676002)(26005)(186003)(66556008)(55016002)(83380400001)(52116002)(7696005)(6666004)(8936002)(8886007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnNXSFRsNnZqVDc4Vjh2eDVlbTBTYUxqRXdHdU5pbjVWdzFlWEs4Z1lIV2FC?=
 =?utf-8?B?SFNmZXpTcms4Uk5jRUVSQTlMcU9hd2VkY1g0SlBSQ3J6OVlXSDd4Zk5tTHE2?=
 =?utf-8?B?VC85QmFKY0pncGlSLzBqdStaQUxLMUZ4eHc4UFVWQXhsZ2l1QURjaGJ4SEow?=
 =?utf-8?B?ZlZ1am1WZlAyNVdKNWhlLzROdUhyNm5NeWRXOHdqY0ZxMVNnazZ0L3lXSUxZ?=
 =?utf-8?B?M1lMbjJMcVRjSkI2TVU4eVhKakhQbWxlVnVoUEVxdFJuT2ZRVjRXTWpCVFdZ?=
 =?utf-8?B?OWx5Z21BaWFQQWhXY0Jra2p2TnVYWlc2ZVdqVy9pdkdFb1ZsTzNjS05MTVkz?=
 =?utf-8?B?cXFYRnhMOTd6aDllaThxYnRsK05OdExYaHdNZklxRGo0TlVJMDBtM3ZLS2RJ?=
 =?utf-8?B?SlV5Y2oyV29waVN3YnM2Rm9sdkJqc2I4U1BvckpCVXRWUlJUN2dxNDZLT3lB?=
 =?utf-8?B?TXdHMGxubmt5WUFkcElBUVhOV1ZwQ0d1TTFHeXhZZXNMdVZlKzFGVVYxL2pl?=
 =?utf-8?B?ZHhjVTBRTnpVOTcvQUhvQXlOdmk2SmNJc0lSVEJreE9PWWJEZER6WXgwVU9V?=
 =?utf-8?B?aUpCQnNQZktZQXYzbFJtRHprR2owWkpvbDhqMXZDTVY5aFR6blI1ZzFBVmx5?=
 =?utf-8?B?MnBaU0w3amVBdzhvbFNMY053S2RXY3ZwbHJyT0pxUkRrdGFPZndqSlZHYUFG?=
 =?utf-8?B?R2xLSEU1SmRPVWsvUFRnYnZIYU1Fb05TZ3BCOHZ6VHA3Si8xUnBxOHN6ZTNZ?=
 =?utf-8?B?Q2lKRDBheDhNeWowZFZlWHFqRVFaWDUwc3gxY01lbHBESmE5eTJYendCbC9O?=
 =?utf-8?B?Smw2d24yYlB0UzNWWEF2aytUNEV6bWNDbTc3NU8wUW1xYXdaS3pCR0V2S0NE?=
 =?utf-8?B?cmVtS01tZmdZZTJxTUhkWGpFdTlyZUhpckpvcHBndzFiT0RCY3hKeDFtdFl1?=
 =?utf-8?B?dGNibmNjZFo0QzlHVHR6enZWblhKdVBLelY1WktFeFdYNkRTVUNhSVdFYjVl?=
 =?utf-8?B?Wk9pYnZMYmF2K09jdlp1bVN3MHorMjVXYXNQN0xDakNQeGlpVXpDNHJHRzJY?=
 =?utf-8?B?Uk9qYnc0WHdUbWRpM2RGRWxlK0Fyc2c5TTJOSzREL2owUE9DbWpFNWltQUFq?=
 =?utf-8?B?czZjQ2poMzJ6RFFPRGtHdzl6NWlPSE5PVXBaeEpKd1oyMWFlTkNvcDU5MnZ3?=
 =?utf-8?B?ZXU5WE1LNE9BZHRDRXpodWZiSzJaMUZsTDFiQmpVYWRScktTbVl4YU1RZkRz?=
 =?utf-8?B?QVVDNnV2Um92UCtFbkpDejhqc3lPbHhmbDROZDV4Z3BVQ1gxTTFFWXlxcm0y?=
 =?utf-8?B?T1lGWjZDejRhamVpTXcyMVRqUi9Mbk55M0t4c0grYmNCNWluK1hMVllPYS9p?=
 =?utf-8?B?dG5EUXo2eVloVGxrcTFKcG05L2xiSVF1VTNyNTdNUTl0MzRRNXNXc0gwYm03?=
 =?utf-8?B?L0VlbVUxUWZFdlAza1hYZTZDRkpoODllOXRzMkJWZUp3eFRKYXpmRnlVTnZn?=
 =?utf-8?B?VVlCQXNoeFNVcjN0elI0a3d5UTlWdjNSSnRpMmZxZjVNbUVrWHdDMFROZkdK?=
 =?utf-8?B?R1RSd3BCdGp5ckdPNGZheHAxd0F3L0JmaU5mb3JybHNWKzNBRW5nbXpyNVFv?=
 =?utf-8?B?aUxjT3ZjZUVDN0NrdHkwOXk2c09QZEpqWXkydVZDMHJYWVduY1Q5cUZ0NE5Y?=
 =?utf-8?B?ZzBoaWMvaERFTHgyWkozQTA3V1pzMnlCeW9EVzdRV1BMUlZvQjRkTzE3TEs3?=
 =?utf-8?B?Q0tmemdlckdXNGwydXZ1bCtaSFk1bThZZ2JvUDVkWFV5WU9PVlhYNnNxNmZU?=
 =?utf-8?B?eDJiaDRML2NqY1MxOUw5VUxKUGdWa0NLOTlrd21ac3RLT25POWFyaStlSGlO?=
 =?utf-8?B?OXdoZjBsMG03aWZZbXU3ZHJVTHNzM0VMdTU5eVJEUWpyNzNRV01LeEhlVTJX?=
 =?utf-8?B?TUhRcXY4TmhKV3krY2ZsK2VxSWNHT2VBSEtiekZIZEhLMW9MRk5xdmxTYUs1?=
 =?utf-8?B?bnVxTlRHZ1h3aE1xODFIMFZoQlh1QUx2NkprSW8wN2dieGNKaWQ2TFdtbGxs?=
 =?utf-8?B?emszK3g3T1pFNkFFY0ZHQjJQalBxckpvZnFWb3E5VU5BcXZCc3ZubEk1a0lq?=
 =?utf-8?B?aWNRL0NZalBpQitqM252MlUvRkdOZHgwWm1uNGpxaHJ6eXlFTjAyU1pIQzBI?=
 =?utf-8?Q?b4DDCj+tSMxYz21Kzm4ChvQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c18f1726-63e4-4190-5e5a-08d9aaa8b64c
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 15:33:04.1432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRdF5iRYHRG0GdojkUB1d1zz7s5NJLuEwk6Jfi0LRFxcs3nfCGxZQaWxEVE6e42D1t+e1VR54QDqo84LDeOfSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5204
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10171
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=975 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111180086
X-Proofpoint-ORIG-GUID: 1__nvEPUQ0cYJxleBQ0gSp73IkxYlhfj
X-Proofpoint-GUID: 1__nvEPUQ0cYJxleBQ0gSp73IkxYlhfj
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looks good Philippe, thanks.

So for the series:

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

On Thursday, 2021-11-18 at 15:57:11 +01, Philippe Mathieu-Daud=C3=A9 wrote:
> Various changes in docs/devel/style.rst to improve its
> rST rendering (around C types/qualifiers/functions).
>
> Since v1:
> - Addressed Darren Kenny comments on function names
>
> Based-on: <20211118144317.4106651-1-philmd@redhat.com>
>
> Philippe Mathieu-Daud=C3=A9 (5):
>   docs/devel/style: Render C types as monospaced text
>   docs/devel/style: Improve Error** functions rST rendering
>   docs/devel/style: Improve string format rST rendering
>   docs/devel/style: Render C function names as monospaced text
>   docs/devel/style: Misc rST rendering improvements
>
>  docs/devel/style.rst | 222 ++++++++++++++++++++++---------------------
>  1 file changed, 113 insertions(+), 109 deletions(-)
>
> --=20
> 2.31.1

