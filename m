Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E22A4942A8
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 22:54:42 +0100 (CET)
Received: from localhost ([::1]:43374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAIuf-0000Xf-Kf
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 16:54:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIjJ-0007wL-Ca
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:42:58 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:12718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIjG-0007L9-00
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:42:55 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JJOXZ0031213; 
 Wed, 19 Jan 2022 21:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=pexGzxQuc+ozqqKuPRogMatRC6nfcMCb6cGBoa+pXa8=;
 b=SJJsN8nZDee4Jk5H+il85xkbzOTufu53br2rS3uVKT4y5y5XkzQ06NmIVrfjuGnYaAyU
 l/H9BvNVra5pK+t8X36NtCjZW4I29IJ65FvvND2ZvuT+ojTfwEsatVT6EdApZ1ixajmn
 enmFtBD8L8WcWjurZfKmTrB1N7Lrv07DzT4nK2xmfHLD+/YLB4TunUFRvfSOBUEsX0Pa
 3naeofb+QH18cYifRCbdKBqvoUKfQ80b0GYNFvnei12Cr9QHTbAYxoBLG5hs1Oks5E4u
 tD5QirUwYkkP3jFtP24V8xzqtFG3Pw4nIHWlBtcRM6o5uAbi/bkn+3L+E/QWWqqbBYdp kg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc4vpgpf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:51 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JLavnT147279;
 Wed, 19 Jan 2022 21:42:51 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2172.outbound.protection.outlook.com [104.47.73.172])
 by aserp3030.oracle.com with ESMTP id 3dkmaeb6t2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qmq4qGyfzENGglj7QghlXel6gyurliwBN1a8lb3rojfpMfbH2dPoTTzaaxfqqEZ+1zYwu1DFPZifIgU3kBkjB3SIdTcKS644fS62TjDV8rA0o9RPqDFKFpPxU04LCajGyg4BJBkIXUP/nhaTdufnlQ+IHxQ3Yk5TeeoBmM39NgmkouJOjhi55GuqU1n07AaLnazVF0efB4NAZI/Yj9GzgZ5EOnB78eJnYJPTbIK6OmL9k0GkRqE2pWNtRDIkKlNzQSSzQIqJEsI7EngIk2gv39783m2i8DOlXc+ABVuiGRuzYKS9+vE0zQyBXh9/Wb3WeifU/rEqst3AZTyOglcKlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pexGzxQuc+ozqqKuPRogMatRC6nfcMCb6cGBoa+pXa8=;
 b=Pp8RzmMZU6YO0xu6WAWD2YQLEJ2aCnEkknYIJBl3A/Q/EDJtrPZJw15w/8GARJaa2mz4+yPVPlFDL/r7fMqt8CvuaxychR6WFU4VaWt549/tLe2GSQHe6/vA1zRswt/D4xhZyrP3/W2JKn84hS9SC4JbCl0/p/lAFib3Rry0lqMEiuUz/mqI5+iQg20lLG6tVIDfopvPn4C4yrZdQO87gcgznBH+O4cDM69yz83RGDlbGYoEgugtOuEYzpqQt1lbS431onP/EeJ7+cMq4clslkTcq8oimuEi/vRdlY+wIYsFmgb4e1gtzTw0vU3cHwA/y/6A5kKNwVicUhRlCKJtVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pexGzxQuc+ozqqKuPRogMatRC6nfcMCb6cGBoa+pXa8=;
 b=GNR5FdsesrtkWq2iO1qTldu40YdJz/Ds0Dd3OLOAfyphFM5hTAGRAKpVnxowgwn1PJefKfrbJj4mQKtBrvf6hKby3iLu4reXW2urrfZ14X57gYk6pQ7PpP/MtCcocejxw67A2z7OWXH/ivbqP4+MBP8k+nA30khpGvUxdHWwaNg=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SA1PR10MB5887.namprd10.prod.outlook.com (2603:10b6:806:22b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 21:42:48 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 21:42:48 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/18] vfio-user: define vfio-user-server object
Date: Wed, 19 Jan 2022 16:41:58 -0500
Message-Id: <eb699639ce12bcf4b57c5877cf95515fbb31176c.1642626515.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1642626515.git.jag.raman@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 905af95a-a405-4544-afcd-08d9db94a2dc
X-MS-TrafficTypeDiagnostic: SA1PR10MB5887:EE_
X-Microsoft-Antispam-PRVS: <SA1PR10MB5887E6548547050F72918E2C90599@SA1PR10MB5887.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:457;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nwD3yjVQt7WmxdPLNGVQVEovA4n6goUPF2HL6CJuH6TgySY65JqNCgxBJiNeL4QbXfFjAjErTcq6koLCZL4EG8thOAKn4CTjCX2U6OFWAH3+rgOSDrTm+xwWHM49GJWJ5ZkEFDBiTJ/7sXS2OYvzgvjJwRJI1MJFAyhRJRhmV/UlwfjcBN4YKAG0E+rOQ7zRzCRKJ5G5RjUuWP4kbn8ow6wknTYRApNeLgOcOb4pFbHYpLXzrJTW+q1ME9Q5Ps53RiD8spL/M41JY37158yeoPNWBtv/+s8tp96IvVAqy8RUM3+GrJnnF2mmVgFSUEYOzAzAAuHXrKLTMJXVO1Us/IamuNgdbLvWx95VzzxQbzZO42t4fenJOtycF9ZwWmcCerF1v5nrXNs2WjobkTV4bjZ4XwwP2kk+DdvMqj4wnM2VpABDbnJJyuQbVi/s5cEpCmNINRE/O6WMHbW1qKT8o7xPvwT+fwfHkhne6+ED+sQTjCR4iz/BDTrSyChxdh8ZXl1axCNwM2KFTndY9nyxnjrzGEmUHt6DNQTOCpX906AnKmwhI5DTTmyCYFIsI74mrb7NHP8pJrsFaaZGnOAE6hGzUJyZFqb4ehmaOaJ1B8C3pdMh5j7MqnCvkV9SAQxLPn73YRcVbagleSkd6B/BPxa9oN3pYYwYNijXyjrPtbQfNCEqNISr+wEQh3qb/CU4wfkcmK06fj4RdrFyMCD69g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(186003)(6666004)(6916009)(508600001)(66946007)(66556008)(26005)(7416002)(4326008)(66476007)(86362001)(107886003)(8936002)(38100700002)(38350700002)(8676002)(36756003)(83380400001)(6486002)(2616005)(6512007)(2906002)(6506007)(316002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDQvK2ljR1BEWWJZWDlzZFIrVVRJeFBmZEFEMnJkMlI3NW83cnhUTU5pRVV4?=
 =?utf-8?B?dURia3hZaStLRTJkZ0dkNktXdmJtY1dia045RDY1a1NuU1I0ZndLQkZWV3RV?=
 =?utf-8?B?VDN2ZEI5dWNZZVVVS2djZXI2ZG16blMwZFlrR2JyeVhSMzlwUWZNTnN3WFd0?=
 =?utf-8?B?WVA0cW1FTy9tL0RMQzV1QnhIQThVbEcrUHY2Z0daZjN6M210WE1OczNmc3Fw?=
 =?utf-8?B?emw5WFNMSFFnMVdnT3d3NzYxbzFaS0FlZnNUekE0QnlZTjJiaFpxS1Y0MHN1?=
 =?utf-8?B?aFYweTFMbktUaWN1alpzWWFzdElTNkVjb2x3SUw5bnV6MUVsQ28zdGxib2Ja?=
 =?utf-8?B?YjFMM3BhUU1FZVNFZVU3VDg0LzdZeC9xTXByZ08rNHRnaDVuRmhpbmMvTnl0?=
 =?utf-8?B?VCt1dC94ZjBrSkpPYmtEVEpZeko5aytmN0RHZHluMkVBcTRFV2hPY2RRdng1?=
 =?utf-8?B?SXhNc05tcUhJRTZQUXFKTzhaczJ4YWgwUUlxS2hsZktTbkcvV0oyMllyNWdL?=
 =?utf-8?B?aVNiWGxqTUdHeHVNdnhkR0lvM1RXTldSdDBKeDdCeGxRRnZXTVBuN1g2bFhD?=
 =?utf-8?B?Nlk2K2VQYW5UK2UxNU5TbnRxdVE4TGNIemRuOGZWdmQwclBtQUFIbkdKRVNF?=
 =?utf-8?B?c2ZYVTd4aGQ1V01pUVlmYkxpU3lDTnU3aXY3VlVmUTE2RTZISE1BS0IwWlVQ?=
 =?utf-8?B?Zk5rTTdVQkdac3pWUDNzVkkvUDFFWDF0d0xBTWZYT3p2eXdFU3k0NkNSc0tO?=
 =?utf-8?B?MlNhQjZTaERFN0N5dlU2MUo5VHVLQUFPQ1U0c0FPY1JGMHYvVjlPV3JoT0dj?=
 =?utf-8?B?RjVJTXFHK2tZS1I4ZzVtTGw0VCtMWDdiMmZDOW5CZDVGVUdycmlGSldKYlVw?=
 =?utf-8?B?L3pYYkFsajQ3WE9zRlpwYWNVY2tKOXRKdSt1QTZvdzdNVDRBenVtRlN5Y080?=
 =?utf-8?B?WVhVcHVvcks3ZlFqamtON2dnZlozOGNWNmJrV29jZXM1dXlUT2JGeC80T3h1?=
 =?utf-8?B?MlZKRk5GSzZlMU9LZzI5M2ZyZGsyY2ZTMzJSSkl2YlNrRVVXZExTVDdybW9p?=
 =?utf-8?B?c05ZUEhwNXp5Rm5wWTZBZ2NtNHRqTjk0aENFWkNkQjdST1ZVdm0zcWpnWS9k?=
 =?utf-8?B?WTNYMWlLU0FBSG9kOEpjcHpMV1VndVg2cVJUbVE3Uk9mQU1SZXMrZ2JZS1Zz?=
 =?utf-8?B?cVdUdVBtcEhPM0E3b3hiOStLMnE3U0ZJcFVXblg2L1NKTnY2SDFkSEJaS0Zs?=
 =?utf-8?B?cUNGNklCUXhHbzhLUTFtR1FnOHJOdHlhZEtsVHF0Q0tSZmlaMWJXSXV0b1R3?=
 =?utf-8?B?ZGEvYUg2VnlQRXU1bThVVUVieUx1cWhUd3kyNXpJUHArTXpmZ25FTENJbHRn?=
 =?utf-8?B?QnFxSGMweGl0MTB5c2taekZ3MTdFcGxQL2JiQjRZRERCak52aExjL3JZb05Y?=
 =?utf-8?B?djdLRmxNQWhWdFN3UHVLWkY1QkwvL1RqV0hhZXU3dC9NYjBmc2lsUkk0WEpG?=
 =?utf-8?B?TEtiTlcveG9KWVZXQkFaUytReGVXZm1FNGErclB3TFBRZzBJMXpNV1F4YkNP?=
 =?utf-8?B?eWZZUUlpWGVHRTBhYnIwMmVZZDZ5Z3pqTmFFQUNTUlVDVlNnSDVlbEM2NU9V?=
 =?utf-8?B?N3VtVkxQQVBENnhaRU1odWgwdWhIWnptV1NhMlN0dHo5MzlxeHJzb2xqWjhW?=
 =?utf-8?B?Y3JNSi9iZzV0THYvNDlNem1kQUc1RUN0N0Z4V09xUlpSa3pVQ0dBTVdoNGdz?=
 =?utf-8?B?eGxEOHhvaGRTbTg2R1IwK0R3Um1GUTNTVGUycGMxaUFKUEpuSndua0NLUnlm?=
 =?utf-8?B?ZzhuNHRnNEROU3RUK0JMV0hQbmIySTY5OXFZT251UVRwQk9Odks2WmFWZUJj?=
 =?utf-8?B?emxaTU1Vb0VrbDE1WEtpMEE0QUJrd09pWXVOQ1N2ZjNLSnE5cjQrZjJSNzNI?=
 =?utf-8?B?dEFUak1OVzhmZnpPZzBhRTRrVkVwZ3FiK2FaNlZ3RCs3NU5jZ0c2czNQMlRL?=
 =?utf-8?B?K0FyckVHYzZOYU9nUlZ1ejNvR1RjNFRoNGd5TkR0NUFpem1JeDNFQ1VHU3M4?=
 =?utf-8?B?eXNCUWZvSUR0MVpuQXFuR0ZVVDhielFXMkJmbWRUcmFGNnFNcS9tVkdrY2U2?=
 =?utf-8?B?VGZlOWtURUJqVjZlSTdWRlp6U2JhSjZJaGd0RW5XTWRiYTJGQzNPN2g1MnRT?=
 =?utf-8?Q?NqWwr4vE0cd3DDVGTo+8EDc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 905af95a-a405-4544-afcd-08d9db94a2dc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 21:42:48.5212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFDR6nNZ28+2BIq83kaSPaPpgUsWSuhvOnMoYl4Dm7EM0EpM+96yRpIaAuwzHtbOWcIyQ6p6kLD3a6ggbzY0Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5887
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201190117
X-Proofpoint-GUID: Z5EnNbozWiNA5VRglmXtz4l-u7hEbV17
X-Proofpoint-ORIG-GUID: Z5EnNbozWiNA5VRglmXtz4l-u7hEbV17
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 marcandre.lureau@gmail.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 pbonzini@redhat.com, jag.raman@oracle.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define vfio-user object which is remote process server for QEMU. Setup
object initialization functions and properties necessary to instantiate
the object

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 qapi/qom.json             |  20 +++-
 hw/remote/vfio-user-obj.c | 194 ++++++++++++++++++++++++++++++++++++++
 MAINTAINERS               |   1 +
 hw/remote/meson.build     |   1 +
 hw/remote/trace-events    |   3 +
 5 files changed, 217 insertions(+), 2 deletions(-)
 create mode 100644 hw/remote/vfio-user-obj.c

diff --git a/qapi/qom.json b/qapi/qom.json
index eeb5395ff3..ff266e4732 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -703,6 +703,20 @@
 { 'struct': 'RemoteObjectProperties',
   'data': { 'fd': 'str', 'devid': 'str' } }
 
+##
+# @VfioUserServerProperties:
+#
+# Properties for x-vfio-user-server objects.
+#
+# @socket: socket to be used by the libvfiouser library
+#
+# @device: the id of the device to be emulated at the server
+#
+# Since: 6.3
+##
+{ 'struct': 'VfioUserServerProperties',
+  'data': { 'socket': 'SocketAddress', 'device': 'str' } }
+
 ##
 # @RngProperties:
 #
@@ -842,7 +856,8 @@
     'tls-creds-psk',
     'tls-creds-x509',
     'tls-cipher-suites',
-    { 'name': 'x-remote-object', 'features': [ 'unstable' ] }
+    { 'name': 'x-remote-object', 'features': [ 'unstable' ] },
+    { 'name': 'x-vfio-user-server', 'features': [ 'unstable' ] }
   ] }
 
 ##
@@ -905,7 +920,8 @@
       'tls-creds-psk':              'TlsCredsPskProperties',
       'tls-creds-x509':             'TlsCredsX509Properties',
       'tls-cipher-suites':          'TlsCredsProperties',
-      'x-remote-object':            'RemoteObjectProperties'
+      'x-remote-object':            'RemoteObjectProperties',
+      'x-vfio-user-server':         'VfioUserServerProperties'
   } }
 
 ##
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
new file mode 100644
index 0000000000..80757b0029
--- /dev/null
+++ b/hw/remote/vfio-user-obj.c
@@ -0,0 +1,194 @@
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
+ *     -machine x-remote
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
+#include "qemu-common.h"
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
+ * is set, it abort the machine on error. Otherwise, it logs an
+ * error message without aborting.
+ */
+#define VFU_OBJECT_ERROR(o, fmt, ...)                         \
+    {                                                         \
+        VfuObjectClass *oc = VFU_OBJECT_GET_CLASS(OBJECT(o)); \
+                                                              \
+        if (oc->auto_shutdown) {                              \
+            error_setg(&error_abort, (fmt), ## __VA_ARGS__);  \
+        } else {                                              \
+            error_report((fmt), ## __VA_ARGS__);              \
+        }                                                     \
+    }                                                         \
+
+struct VfuObjectClass {
+    ObjectClass parent_class;
+
+    unsigned int nr_devs;
+
+    /*
+     * Can be set to shutdown automatically when all server object
+     * instances are destroyed
+     */
+    bool auto_shutdown;
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
+        qapi_free_SocketAddress(o->socket);
+        o->socket = NULL;
+        error_setg(errp, "vfu: Unsupported socket type - %s",
+                   SocketAddressType_str(o->socket->type));
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
+    if (!k->nr_devs && k->auto_shutdown) {
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
+    k->auto_shutdown = true;
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
index 8d7bebc74a..93bce3fa62 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3487,6 +3487,7 @@ F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
+F: hw/remote/vfio-user-obj.c
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index dfea6b533b..534ac5df79 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
+remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: files('vfio-user-obj.c'))
 
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: vfiouser)
 
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


