Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551A9449FFD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 01:52:27 +0100 (CET)
Received: from localhost ([::1]:35334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkFNC-0003W7-8z
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 19:52:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAc-0005et-IO
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:27 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:39382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAW-00046d-W6
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:25 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A90AULj025572
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=K12TEb/vvk4gViAjps6lfvJZSgQ/yKCB2OvT6YdnazU=;
 b=KOkgNxx7Bh/wHlsdIqnluZpSkxYzjh8Na9oH73lQVczj2bXCWt5ip0dAEOHGG2L8pzM4
 684TSTXL4titjaC6JM6aEx/kuzZ4fmXH7UeXQcrvAX/lXpNHYs4hRh2jIFfnFirWzJio
 eoIbECRN5pSTepJJrdyUf0LV/aphf+eM291F/A93JtMzMQbAGQ1wsmqXu4pW8h02z8V4
 sjUAG7MZ5bh7FogVCbdDIayCgGfZziqiO2GKFw17hf0m2GZMnOma0/qxJVOrEF7fSv+t
 56aiIuKPkcIjEpZC69zFVGpCsNW3fIeMrRriWlEgsJPTYw4mNJDySxBr5eHAg6xQwRP9 uQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6t7077j8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:18 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A90ZLN3129193
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:17 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by userp3030.oracle.com with ESMTP id 3c5etuvb6n-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lesQHX5Kv6Iqmk2Oz8X2gSC32gjHMQdwtKc4KGc2GImYlt/tkLWmhwDSEq415ZPnPKk9yzQvYmocHAaIVAR5ADvFb8LdfBGRuvOH3p70Tprf7Df2kmSn8vSxewJFuL6tDgW+ztkoPn54JHX07nTT4NZwCrE9Tjlz9KnA+3RKyi0EBfCPqspjfRA7YXnhYgjxRHGwxOqpKPfkhCYyeUFJR2s9vZXXFbXciGca+mKpGEQxdlfK40RvvCGXpwzmGQOqRagCWoog7wQyyGdhSSej1wmp92ofBhnYz2SaiBf4AKo9pSLdJzGLXyChQ+AjNkMFMbjaJ5pyH0l1x/SC30QgdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K12TEb/vvk4gViAjps6lfvJZSgQ/yKCB2OvT6YdnazU=;
 b=dgnUtqiFsiqfVlptw78C4uYXCIYERsNfWhv34wc92YxYV0gdGoUy4rU2i2UB6OKFtu3NXSo09llze15Q+b/pzYXp+RGPwmV6HEFqNKEhPjlSiaXnR6HFAnnObQO6WKBFv1ScmQ4zguAFfbuOMmX4p3yRTXvMqnHuc3HB1yg/WQvaKyptCvrFBIfDRGwuTSVKDcsrP8A6lAE5DwSdyZeKqbec0RbdtiKE6IqqBXyt99EGx9kwT142VRyxhxaO61IdRujlx108v4kb78AK7luHDhXGWU3hbuLcR+FjIBG3m9B4uHbn2zqriOgeMQlMYQhfukYCk6D8yAFPAHCpJ4cOqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K12TEb/vvk4gViAjps6lfvJZSgQ/yKCB2OvT6YdnazU=;
 b=GYvhDN3brPLA5UX4u/62Kwr+9UQKOMrX0MmW+FWw3BZGnFtGLNCkCqmAtU9VOCvnFiU6dHd3lE91B2vtEdXENG8h+8hTnnwzTYDyKG7BxQ2u4YxmogafuhWiw0mxXbMdiijPZwcDixw2CAY9gZ1efTW2rieSDV19dWdVtbZ6CXY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB4068.namprd10.prod.outlook.com (2603:10b6:a03:1b2::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 00:39:14 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093%7]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 00:39:12 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 07/19] vfio-user: connect vfio proxy to remote server
Date: Mon,  8 Nov 2021 16:46:35 -0800
Message-Id: <69d83c41ca7fe9b010f73dc15fe6a7783fce5620.1636057885.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1636057885.git.john.g.johnson@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To SJ0PR10MB4686.namprd10.prod.outlook.com
 (2603:10b6:a03:2d7::23)
MIME-Version: 1.0
Received: from bruckner.us.oracle.com (73.71.20.66) by
 SJ0PR03CA0194.namprd03.prod.outlook.com (2603:10b6:a03:2ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 00:39:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ac0818b-d298-4178-18b1-08d9a319596b
X-MS-TrafficTypeDiagnostic: BY5PR10MB4068:
X-Microsoft-Antispam-PRVS: <BY5PR10MB4068FBEDB60AEC407F1E9728B6929@BY5PR10MB4068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:114;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C6SpMZS7cCfYa+C3dw9ahYi9vp22MWfF0pJg0S5UoiuEWNw/btNVpcPu2QCdj5StfjxlH+MkXzCd9jJ0hfpDcCVjdV30G9qREnW9nqg77uKQc2Xso0JRrGdOWGU9/P2Pl1On0P6wiv6NgL2iZ6erakyObcy3SNFAyKP9BFF4c43227Vi0ufI8tlskARmz7ToMpl0xVx22aGG+Sut5biobxh3XKnkXSywa2LkX90aMAGKta6cNZJulWLqnCibe+cdIbZQ364Gx2Wg9m77G0hZUNJHbx1q23A8qquNBXmITrgnVgzWU2z8V9Zte5XNhzxCkM9sGZd3sYWZ1ZLJ+oeEUBHENLHVjKmgJZcuUkoJw28+t0cgAs64tEaQXHXRAHvZMUVoRbbeu85GiFU7QV2zB0qq8EyuYTf9AX/skkNkUb1g0VCUAZQxYQ4XzmUEmZVvxctheIaFNfQExjTflVYq4BZscnHpEn/4/tv7RFsuuIwbKtVB8lA1WHUgFEmbS2Q0vTWYnBXE1tOmnfp/yCkxTJR25uSbgcZGXLjqrtPq71OCoaTeqKmGk7M+nkfqxr8ITGQPz2hslUJG8MdgZPipFr2wr/3r63sAxb7oT+ozlSzSOc/vcJFQpmMG6xGrw3pQYZR5sPbxred/5CR8s0vt3hbk6jKWPzW41Wn93XfOzfSsftO0cfyXH8GYHadD7U2A4cxjYekknW0QseJBvH34IQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(316002)(186003)(66556008)(508600001)(8936002)(8676002)(66946007)(6486002)(26005)(2906002)(6916009)(5660300002)(36756003)(7696005)(52116002)(86362001)(83380400001)(956004)(38100700002)(6666004)(2616005)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUpXK2tKSE41ZFgrNDA1ZHVVUDZXNkFIUjVEKzZuMk10SCtZczhTaGg3SUtL?=
 =?utf-8?B?cTlPc0J2NHU1SmNBTm5rRnJZSVdqU0ZVcmQ1bU10d0R5bUpjaXNMbzF3RFg4?=
 =?utf-8?B?TWNMMnBXZUxOSG0yWjVkTmNZc2w2alg3ai9odTJQU2k0MFd0TlNDNE1GdGcx?=
 =?utf-8?B?M00xc1ZLa2FkVVY1bUdSTCtldWY0N2dsc1prSmFGVVNwVisxZTVTQldqMDZi?=
 =?utf-8?B?eXpYUWN6NjBPZWo5NlFaOXhmdFl0T3kwOTJtNTEwcE5iOG1yNHdRdnVUdXZD?=
 =?utf-8?B?cFpudllDZWkwYS9xM0x4ZHBHaXAxWVlpVGh0NW1xSHdndjJOTFcvK2JKM0x4?=
 =?utf-8?B?ZTF0dkdLSEZ5MkNQRktSRXhLYzF2MnRGUGk2T1BsWGFzUVdUSXN2eUNyQ3hF?=
 =?utf-8?B?SmFJQWNBb3ZHNEIrRG9PWktKUnY5Qk5TcENXemN2MjZLWmR4d2p0TW1KRWRj?=
 =?utf-8?B?TDdZQVNYUzZ3dkk2bGxRdDBtN0pIN0s3RXNBaFZyM1dQcDdaV052UnR3enM4?=
 =?utf-8?B?S0d1ZFlvMGFnR0swUTMwcnBVbDlHT01LdmZFaW1Ba0JPRjFtbGdXWTc0aHA2?=
 =?utf-8?B?bFY5anhVM3FjSi9ud3NJdk8wMDBuSGdQZ0FEVkR2TlF6R3FYMDNPbm83Sm5V?=
 =?utf-8?B?Q24vM0NmOE9iNTA1U3FKeW9oQUlRNithdmROOThRT2NudEI0SkFBR1V0UTJ1?=
 =?utf-8?B?ZERPemh1cko0VWd5YWtkVTVWM0lENVIwUVplZkduSlliNDNNK3pVQ3Z0Rk04?=
 =?utf-8?B?T2YrN0svK3RXMkh1K0pvVWpiQjdEM0M1ZnZZb2JCM3piak9nT0xaU3ZQZHZa?=
 =?utf-8?B?U1NIa0pETzJWWjVKRXBndW93bjVqd2NWcnh1WXFvZWt2VUt5WjNmSUZTK3VC?=
 =?utf-8?B?blhqVDkyT2k3YzI1Zk4rdjBYd0FWWGF5TDVpYTg4ZmpoKzlnaDVBMmlMYkdD?=
 =?utf-8?B?NXBmV2F3a1ZWd3ZrMWN6N2hNK25WVFJZU05aKzJDNGJ1Nk1JM0tpaTdzWFF3?=
 =?utf-8?B?YVdZenZHbnEvMk9HUU55Ty9QK00vYnUyQy81ZEpNbitQVUIwcyszTGJQM01i?=
 =?utf-8?B?N0dwaW1Ya1g3RnBrd3ZRY2ZWU1VIT0tLUkg4czVGQXE4cWR2Vmh5SjBOaWsy?=
 =?utf-8?B?QTJMdDFnV1RVOU5QTVdKc05qQldGU2s5YmRrZ251VjY4dzVuU2tzMUNTWlBm?=
 =?utf-8?B?WWFIZjFMODNhWGxnQXFHcHlFeWhuUW5OYWoxM1NUNlRMaWxoWSttdWdubW85?=
 =?utf-8?B?SFdkbGhETTBjWUIrRGVKSll5RXpKSE5tQmhsQWdvcFIzQkxyZGk1UEZHd3Rp?=
 =?utf-8?B?VVppSWxLUGJZbGU5R0psZFBXV3NsWFlUV1pFUkwzaW5vL1dQLzBCckhocm9G?=
 =?utf-8?B?emwvajNUVVRtRk02aFdsL0hqc2hLVFNlbzVKVElqT3dadGc5Y0R1T0F3WWk4?=
 =?utf-8?B?d3pmUWJGcEx2ek81a05KTWREdzVkaU0wNnd6T0IrVkxOTk9YTlpoQzZXdnJh?=
 =?utf-8?B?QmFBSzVWenRQeDNWY2dqMTM5MlRrNFRPRUNRWFJ0QjlIVjZrY0kvaTQ0K2lj?=
 =?utf-8?B?SjVwcUNHMCs5UWxLelBWcnVwNnRYOHZxZVlSRGkrWXNRMDFkL2lkcVlZMzQv?=
 =?utf-8?B?ZWhwTUlRbENMbmVvdXEwZGVDUnl6VjlPRGFSYm9jRVBJVnZkeFdqeGRWS3l0?=
 =?utf-8?B?dnNvYU5wY3g3Q2lSbklvSTF4UEtUcTg0dEpJSnlEYVFSNzFYMVR3azZ1QkIw?=
 =?utf-8?B?WW5aNjd5aGFEbmJSTkJZWTdZZC81MTRYMlFrcTJXTmZPbkFZL1ZhRTVHTStI?=
 =?utf-8?B?amMzblFlcko2QmFwbnlSRm5qVmx1T1Y4RHRmb3JSaHNnT0pycm5VMHg2dTNt?=
 =?utf-8?B?TENReHlVaGRMKzRDU2cwaUI3NFlFclEzUENCS084azdjandCbXZQM3VaNk5B?=
 =?utf-8?B?Y0tSc25MU0l2S3NmUGNrcGU0RWx5YVZISk5KY3czYTNtODJ5ZUp1cFZ5bWZG?=
 =?utf-8?B?MHRaUk1uT2V1bUFhS3ptYWRiY0pGbityWi9aRnhyNFNZUkk1QlRXSVJ2MHVy?=
 =?utf-8?B?bUp0Vk1KaFJXV3U2ZFlMNHRiTXFTU0hUTnI4OVQ2d1hQK1ZyWHRiMXREVXgz?=
 =?utf-8?B?R09UQTlJUCtjSHJQbVBKNjZqWlg5aE1lV2NNT1dKbmtHZnBrWlRleWpWNHpF?=
 =?utf-8?B?VzlmM2hnTHROMzZSUVJmVmRpaTRHd2VtZnJVTFpXNHBrbWhtMy84dzFaSnh5?=
 =?utf-8?B?d2hYZ1FIbFZ1RlBnMGFQYWkyWlB3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac0818b-d298-4178-18b1-08d9a319596b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 00:39:12.0461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Gs8gd5YD3GYU8/Sn+PVSYo4YXn53/dJbBVNbxaLAZrw/1ZOZt7csLQLweTJR1H2p/H/1kd6MOJgkDevG0dXiBX2OJ6F8syva5Qgh0o9yzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4068
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090001
X-Proofpoint-GUID: gof2oRfWR-sQiv78-1JqdardyCfb0fSW
X-Proofpoint-ORIG-GUID: gof2oRfWR-sQiv78-1JqdardyCfb0fSW
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user.h                |  78 +++++++++++++++++++
 include/hw/vfio/vfio-common.h |   2 +
 hw/vfio/pci.c                 |  20 +++++
 hw/vfio/user.c                | 170 ++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                   |   4 +
 hw/vfio/meson.build           |   1 +
 6 files changed, 275 insertions(+)
 create mode 100644 hw/vfio/user.h
 create mode 100644 hw/vfio/user.c

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
new file mode 100644
index 0000000..301ef6a
--- /dev/null
+++ b/hw/vfio/user.h
@@ -0,0 +1,78 @@
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
+ */
+
+typedef struct {
+    int send_fds;
+    int recv_fds;
+    int *fds;
+} VFIOUserFDs;
+
+enum msg_type {
+    VFIO_MSG_NONE,
+    VFIO_MSG_ASYNC,
+    VFIO_MSG_WAIT,
+    VFIO_MSG_NOWAIT,
+    VFIO_MSG_REQ,
+};
+
+typedef struct VFIOUserMsg {
+    QTAILQ_ENTRY(VFIOUserMsg) next;
+    VFIOUserFDs *fds;
+    uint32_t rsize;
+    uint32_t id;
+    QemuCond cv;
+    bool complete;
+    enum msg_type type;
+} VFIOUserMsg;
+
+
+enum proxy_state {
+    VFIO_PROXY_CONNECTED = 1,
+    VFIO_PROXY_ERROR = 2,
+    VFIO_PROXY_CLOSING = 3,
+    VFIO_PROXY_CLOSED = 4,
+};
+
+typedef QTAILQ_HEAD(VFIOUserMsgQ, VFIOUserMsg) VFIOUserMsgQ;
+
+typedef struct VFIOProxy {
+    QLIST_ENTRY(VFIOProxy) next;
+    char *sockname;
+    struct QIOChannel *ioc;
+    void (*request)(void *opaque, VFIOUserMsg *msg);
+    void *req_arg;
+    int flags;
+    QemuCond close_cv;
+    AioContext *ctx;
+    QEMUBH *req_bh;
+
+    /*
+     * above only changed when BQL is held
+     * below are protected by per-proxy lock
+     */
+    QemuMutex lock;
+    VFIOUserMsgQ free;
+    VFIOUserMsgQ pending;
+    VFIOUserMsgQ incoming;
+    VFIOUserMsgQ outgoing;
+    VFIOUserMsg *last_nowait;
+    enum proxy_state state;
+} VFIOProxy;
+
+/* VFIOProxy flags */
+#define VFIO_PROXY_CLIENT       0x1
+
+VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
+void vfio_user_disconnect(VFIOProxy *proxy);
+
+#endif /* VFIO_USER_H */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index c0dbbfb..224dbf8 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -76,6 +76,7 @@ typedef struct VFIOAddressSpace {
 
 struct VFIOGroup;
 typedef struct VFIOContIO VFIOContIO;
+typedef struct VFIOProxy VFIOProxy;
 
 typedef struct VFIOContainer {
     VFIOAddressSpace *space;
@@ -150,6 +151,7 @@ typedef struct VFIODevice {
     Error *migration_blocker;
     OnOffAuto pre_copy_dirty_page_tracking;
     struct vfio_region_info **regions;
+    VFIOProxy *proxy;
 } VFIODevice;
 
 struct VFIODeviceOps {
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index fa3e028..ebfabb1 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -43,6 +43,7 @@
 #include "qapi/error.h"
 #include "migration/blocker.h"
 #include "migration/qemu-file.h"
+#include "hw/vfio/user.h"
 
 #define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
 
@@ -3476,6 +3477,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     VFIOUserPCIDevice *udev = VFIO_USER_PCI(pdev);
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIODevice *vbasedev = &vdev->vbasedev;
+    SocketAddress addr;
+    VFIOProxy *proxy;
+    Error *err = NULL;
 
     /*
      * TODO: make option parser understand SocketAddress
@@ -3488,6 +3492,16 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         return;
     }
 
+    memset(&addr, 0, sizeof(addr));
+    addr.type = SOCKET_ADDRESS_TYPE_UNIX;
+    addr.u.q_unix.path = udev->sock_name;
+    proxy = vfio_user_connect_dev(&addr, &err);
+    if (!proxy) {
+        error_setg(errp, "Remote proxy not found");
+        return;
+    }
+    vbasedev->proxy = proxy;
+
     vbasedev->name = g_strdup_printf("VFIO user <%s>", udev->sock_name);
     vbasedev->dev = DEVICE(vdev);
     vbasedev->fd = -1;
@@ -3500,6 +3514,12 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
 
 static void vfio_user_instance_finalize(Object *obj)
 {
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
+    VFIODevice *vbasedev = &vdev->vbasedev;
+
+    vfio_put_device(vdev);
+
+    vfio_user_disconnect(vbasedev->proxy);
 }
 
 static Property vfio_user_pci_dev_properties[] = {
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
new file mode 100644
index 0000000..92d4e03
--- /dev/null
+++ b/hw/vfio/user.c
@@ -0,0 +1,170 @@
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
+#include "io/channel-socket.h"
+#include "io/channel-util.h"
+#include "sysemu/iothread.h"
+#include "user.h"
+
+static IOThread *vfio_user_iothread;
+static void vfio_user_shutdown(VFIOProxy *proxy);
+
+
+/*
+ * Functions called by main, CPU, or iothread threads
+ */
+
+static void vfio_user_shutdown(VFIOProxy *proxy)
+{
+    qio_channel_shutdown(proxy->ioc, QIO_CHANNEL_SHUTDOWN_READ, NULL);
+    qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx, NULL, NULL, NULL);
+}
+
+
+/*
+ * Functions only called by iothread
+ */
+
+static void vfio_user_cb(void *opaque)
+{
+    VFIOProxy *proxy = opaque;
+
+    QEMU_LOCK_GUARD(&proxy->lock);
+
+    proxy->state = VFIO_PROXY_CLOSED;
+    qemu_cond_signal(&proxy->close_cv);
+}
+
+
+/*
+ * Functions called by main or CPU threads
+ */
+
+static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
+    QLIST_HEAD_INITIALIZER(vfio_user_sockets);
+
+VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp)
+{
+    VFIOProxy *proxy;
+    QIOChannelSocket *sioc;
+    QIOChannel *ioc;
+    char *sockname;
+
+    if (addr->type != SOCKET_ADDRESS_TYPE_UNIX) {
+        error_setg(errp, "vfio_user_connect - bad address family");
+        return NULL;
+    }
+    sockname = addr->u.q_unix.path;
+
+    sioc = qio_channel_socket_new();
+    ioc = QIO_CHANNEL(sioc);
+    if (qio_channel_socket_connect_sync(sioc, addr, errp)) {
+        object_unref(OBJECT(ioc));
+        return NULL;
+    }
+    qio_channel_set_blocking(ioc, false, NULL);
+
+    proxy = g_malloc0(sizeof(VFIOProxy));
+    proxy->sockname = g_strdup_printf("unix:%s", sockname);
+    proxy->ioc = ioc;
+    proxy->flags = VFIO_PROXY_CLIENT;
+    proxy->state = VFIO_PROXY_CONNECTED;
+
+    qemu_mutex_init(&proxy->lock);
+    qemu_cond_init(&proxy->close_cv);
+
+    if (vfio_user_iothread == NULL) {
+        vfio_user_iothread = iothread_create("VFIO user", errp);
+    }
+
+    proxy->ctx = iothread_get_aio_context(vfio_user_iothread);
+
+    QTAILQ_INIT(&proxy->outgoing);
+    QTAILQ_INIT(&proxy->incoming);
+    QTAILQ_INIT(&proxy->free);
+    QTAILQ_INIT(&proxy->pending);
+    QLIST_INSERT_HEAD(&vfio_user_sockets, proxy, next);
+
+    return proxy;
+}
+
+void vfio_user_disconnect(VFIOProxy *proxy)
+{
+    VFIOUserMsg *r1, *r2;
+
+    qemu_mutex_lock(&proxy->lock);
+
+    /* our side is quitting */
+    if (proxy->state == VFIO_PROXY_CONNECTED) {
+        vfio_user_shutdown(proxy);
+        if (!QTAILQ_EMPTY(&proxy->pending)) {
+            error_printf("vfio_user_disconnect: outstanding requests\n");
+        }
+    }
+    object_unref(OBJECT(proxy->ioc));
+    proxy->ioc = NULL;
+
+    proxy->state = VFIO_PROXY_CLOSING;
+    QTAILQ_FOREACH_SAFE(r1, &proxy->outgoing, next, r2) {
+        qemu_cond_destroy(&r1->cv);
+        QTAILQ_REMOVE(&proxy->pending, r1, next);
+        g_free(r1);
+    }
+    QTAILQ_FOREACH_SAFE(r1, &proxy->incoming, next, r2) {
+        qemu_cond_destroy(&r1->cv);
+        QTAILQ_REMOVE(&proxy->pending, r1, next);
+        g_free(r1);
+    }
+    QTAILQ_FOREACH_SAFE(r1, &proxy->pending, next, r2) {
+        qemu_cond_destroy(&r1->cv);
+        QTAILQ_REMOVE(&proxy->pending, r1, next);
+        g_free(r1);
+    }
+    QTAILQ_FOREACH_SAFE(r1, &proxy->free, next, r2) {
+        qemu_cond_destroy(&r1->cv);
+        QTAILQ_REMOVE(&proxy->free, r1, next);
+        g_free(r1);
+    }
+
+    /*
+     * Make sure the iothread isn't blocking anywhere
+     * with a ref to this proxy by waiting for a BH
+     * handler to run after the proxy fd handlers were
+     * deleted above.
+     */
+    aio_bh_schedule_oneshot(proxy->ctx, vfio_user_cb, proxy);
+    qemu_cond_wait(&proxy->close_cv, &proxy->lock);
+
+    /* we now hold the only ref to proxy */
+    qemu_mutex_unlock(&proxy->lock);
+    qemu_cond_destroy(&proxy->close_cv);
+    qemu_mutex_destroy(&proxy->lock);
+
+    QLIST_REMOVE(proxy, next);
+    if (QLIST_EMPTY(&vfio_user_sockets)) {
+        iothread_destroy(vfio_user_iothread);
+        vfio_user_iothread = NULL;
+    }
+
+    g_free(proxy->sockname);
+    g_free(proxy);
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index d838b9e..f429bab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1882,8 +1882,12 @@ L: qemu-s390x@nongnu.org
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
index da9af29..2f86f72 100644
--- a/hw/vfio/meson.build
+++ b/hw/vfio/meson.build
@@ -9,6 +9,7 @@ vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
   'pci-quirks.c',
   'pci.c',
 ))
+vfio_ss.add(when: 'CONFIG_VFIO_USER', if_true: files('user.c'))
 vfio_ss.add(when: 'CONFIG_VFIO_CCW', if_true: files('ccw.c'))
 vfio_ss.add(when: 'CONFIG_VFIO_PLATFORM', if_true: files('platform.c'))
 vfio_ss.add(when: 'CONFIG_VFIO_XGMAC', if_true: files('calxeda-xgmac.c'))
-- 
1.8.3.1


