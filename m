Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1247475C07
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:44:09 +0100 (CET)
Received: from localhost ([::1]:54454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWRs-0006y9-MP
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:44:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWKm-0006uY-68
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:48 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:38468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWKj-000090-TC
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:47 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFEWhpQ023135; 
 Wed, 15 Dec 2021 15:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=7Nm+AnbH7D0QdDWIFxF9ZgOS5s4qHtaae24twTaC60o=;
 b=iGwNlTYwqDzSQ/j7aJh8O0hc/7a83+HLznYXXBwE+O4W+BxlDdiS3cgVHCvmwu+rL1r5
 HtQuinX5TN/Mq9QoIAxmKBgUzubXf3fFT2eunRbagxaEb3qdUSE0xH9P/LBDTnQebIBO
 pNQaHscdc80d64m3R360rEXXmDU7QSgdsCBgx3eEvqKqYxGLPCmSQRWLwvJfVWolRM8D
 tx3VrFdaKOU82HPPYJ+g1+CBOCPpgqo3WEby0w2gyW04OmdZuMUXsAZcc82iRtxbzRTd
 qT2hs2/BiCfy7Weq5pDch/5+C2UWa8ZSQdB0l7AE7DOkIu1apbyxoQ1Y7jfCxAYbqWYA tw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx3py779m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:42 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFU80J165507;
 Wed, 15 Dec 2021 15:36:41 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by aserp3030.oracle.com with ESMTP id 3cyju8gt9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FcvYR+klSMB8Juyv/NgA1cv6DiYKkT4uyyotaKI18XeqnMqNPPuy30Cv096vhEzqzfJNRuW2ZXWoeF8xvKDvVZuyvMT9KaraejfODVT2Tidb4n660yT+CO+DihdX/zAZgLRgHLWY7BgSQ3Ed7QEMs26qU0VXIHLf8HS46e0AoiejZufVDBZQdC+0A1ju7X+CsojUoj5bOc9gbn7839x/eGycpgUjo0mbhwJx11rW6tab+C5Ni6u5k987GN2Mu4O7CSWIwmeWz2LR/YSh/QGTAO+dHBU+MTe0OcShoWWPliCmc9QLagXVo2AEfcW/f8kgSdz0qg3ksnmF5lhG8CU8Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Nm+AnbH7D0QdDWIFxF9ZgOS5s4qHtaae24twTaC60o=;
 b=VVcNgTYl0xcjNAoF6K12TkXKPMniElw9S7Z4n9ZRA5IxeH0Yedh9vbCroi3N6LLGo2HZKkOSbpvAziYREHlUHcKe2qbUFBxTFgRzxlB0LeN2GFZf9v0RHu88RUQ00qyuRg7eFTbUwo3LPDq7lu9KWA2mEyrpPG3JH6di3bSUUiY4zx4vv4Mv+uM1QwZ9Gqs+ita0iK5ZMPOq6sKGoBjfhDl+P26Bdsw9q1GHSaGnqiajqRD60emxBm+jNpuIJfo+C6eDSA2S/qvAyunQ4UUehhf4qAzWggYV/XA7Wb10mor2YZL0o+Qk/7D/G46kdG6rPLfjBxvimfUWFTVZOtZW9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Nm+AnbH7D0QdDWIFxF9ZgOS5s4qHtaae24twTaC60o=;
 b=AFWPxLILC6ywOWx0ospZYr88inG9E2OEU0NzgcnltwVQtoKOfuvIJXys+7A94wdGwfKtu/voF+7RpEnmQEDPIEqjFYWjVEvDaLXEu+48ZEdpq8TT6JyqZPjMMRBEzFF0+0UE2juJ8WgxQLHu50PFVR/h+lTsIFISHBDPaRMYRkc=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4094.namprd10.prod.outlook.com (2603:10b6:208:11e::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 15:35:59 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:35:59 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/14] vfio-user: define vfio-user-server object
Date: Wed, 15 Dec 2021 10:35:28 -0500
Message-Id: <22b0d82a54d53043323bda2ae0b409fb54cbf007.1639549843.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1639549843.git.jag.raman@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::46) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b220cca9-c8d4-48ab-1440-08d9bfe097ca
X-MS-TrafficTypeDiagnostic: MN2PR10MB4094:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB4094F44AD364B7715B1270C890769@MN2PR10MB4094.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:457;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CAE8osozZP4vlzaoJNT3PwQ9kPIwFiU8Xy+RDMXpuAOOeKG7xaJ0W/oGXcZHPmfsTVMvHbCCz1EABJSSGZL6IRp39LUd2L9aGvSnb4Aty6rMMF89SwCZ76Tm6KtIuf6hD+wtkx9P32qRhcF3xM9eA1ssJmx/feSxqt2OVYybFbezj6z+mF29aK+Uzw/GTo1yZWOil0SfEs1EK4BcLs6teb3l7Q/UqzadNIwf8doPiJZCfu9i2VIP6zB3eY/Vuks1b44p5Iu3Jd+9fevUuOAzVxhthKktzvWbnqg8adhOksPwTA1ue9GCSthKxC+HcFVv0ziLXtymt4KpAcv5kvHXhQ8fR2N3bz0obHr2TtedCOTIFam/4tSJk0QzcUOGN8D2hS9DTVLhY9nZ9Mu1xvPAy/xzvOF+zthddGKYXc9mOeL9FQtTNhYMPahP/UGea64ebnl/7QuQwogznonTG6GTni+4u0sfBlQbZ5Rn1jONCyjQujuZGMdKzKPNo/839z3NJHPr2UrdYbpA4nyp2PdCaf9SsW8O9XCnWWFLuK7GD2A+ko7BuKtOvALjbuYiK1f8XtOqOBYNLk3myu7zjFBYGLjvO2klBeGCLhXYGBrop4RfJfqaZpmHDCaeZIIRnM969EQu6W5VVIVXRp/dnZjOvDB2mj1uu6SF4Tx4eRt8PMNRSTFGNf0Kp5qRxuiNqibFE247WPGg8lYNF59WP/MmWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(6666004)(52116002)(4326008)(2616005)(6506007)(86362001)(8936002)(6512007)(5660300002)(6486002)(26005)(2906002)(38350700002)(6916009)(38100700002)(316002)(186003)(107886003)(66946007)(83380400001)(8676002)(66476007)(508600001)(36756003)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzYxK3BYNE5hNFZ1eU5Qa3RCdGlLc2gxTHIvN3U1c3NQSk1GdjJTNFdmVjZi?=
 =?utf-8?B?cFRmTVk4RU9laUhsclhrOWV2Y0YyWld6QzlkM085UUFCU1YveGZ5SEJhS3Uy?=
 =?utf-8?B?ekdNT2grV3BpMHp1MnhsMm1Iai81ZkdteFBZbHErakRRMkp5RlJrVVhtTklo?=
 =?utf-8?B?b0JYbUd3UDBUOHZ5bkppaXFHUDhELzE3L2VoQWQrOUhCamdscnZrbTh1MnFE?=
 =?utf-8?B?bm5vNG02MTVZZzFmY3BnT2lMOGREVUp2T2QzcTIxY29tZ0tuVWc4aWNNeHdh?=
 =?utf-8?B?cjV6Q3Jsa3dFZGFGTXdqSmZsU0puc2M5NG5FWmhlNXIraDhla2JWZGRIMGFM?=
 =?utf-8?B?Y3M1a1d6RFp3cXlJV1BmM29sQnZzUlVxZ2d1SytWSitKQlEzbStjbyt3dFBG?=
 =?utf-8?B?dHJzZlRYZERYMHFIV0VodXo4VG55VFcwTjlTeUlpcVZPRXRDRE11bDZTV05U?=
 =?utf-8?B?RFhtSGs2TEo1T0dUL3JjbEhEQ09hYXFWbGd1NlpYaGhFWTZxSXZ5RUMxc1VV?=
 =?utf-8?B?bkdPY0dzTGM3d3BUbHVlbW9GOTlaS2RtVXRZZTF1RUxrS1loMS9rRTdpV2ZT?=
 =?utf-8?B?czVQZXZJYmtSZWlNb003MVF4N2lBVjFqZ0hxVDhjVGtHZTlxZ2RacVpmUUMz?=
 =?utf-8?B?YnRHQjJHaGtPbGwzY0Qvcm1qdnJDMERsaU9PZjhuQnRWbUZEKzlKNDhJSFAr?=
 =?utf-8?B?cVBYeWJIRWgzd05xZkp2TFlKQ2RDV0ZFZG1RVHJPbS9OejRvOFNQSWpPeDQz?=
 =?utf-8?B?UkFEb0szSnNwbEpIdEY5VHhpMWwwZkpxNEVxNWxjUkZaUC9TKzBGejdFb0M2?=
 =?utf-8?B?bTFpQm4zWHE0cUxwdWFNU2MyZGs1ZlhXWVVoN1FKbGNoN0gyd3lMVVVYK0NT?=
 =?utf-8?B?N3BNK2xWN0x4azlWclAvMCtnRU5jWXdEcGVqMnlEaFI0VGJjL0tHT2FDUDYz?=
 =?utf-8?B?cSsvRWR1eVFmbDd1ODR0emQ2UXI1WE9rbitKRGNVKzNYbGNkcmNyWlVVQ3Y1?=
 =?utf-8?B?R0NZNDZoem5laFJYNHJZZTlIM2N4eHdSNEpVK2ltUTJ6SWU2U0R4WU1ObU1t?=
 =?utf-8?B?d201WDFEOTd3VDdVZzRuemQ4RGZNZXRQc05LZTBVL2l5RTlSdUwwNzZBTk8z?=
 =?utf-8?B?RVhBOTdIeGw5RWNLNWhEcm1WWUgvMHZmeFdBZEMyOHpaeTZ0ejBkQ0Fob1ZI?=
 =?utf-8?B?eWRycW8rd2U1aDNyZUxPMWVtTEtzZjQ0Qzh0TUQxQkZpU1N6WTliMElBbGlp?=
 =?utf-8?B?dXowMGRmaFFqaXh0Yks2SmthWEEvamR1KzBsM1c3RjZRRGZCeGl1ZjhuODBI?=
 =?utf-8?B?WmtSNDNNTkV3eEQxODhFU3VnbmZpc21FK3JEcFdwL3ZDTXpBRXQ1S2hvcHVU?=
 =?utf-8?B?d1hwdUlDYStkdktiTU9uRnNsLzQwUy9Bb0IrY3BVNkNISFRJZ0d3eEQrZ1NG?=
 =?utf-8?B?TkcyTlpNelk5Q3g4UlZseHduMGZkVVNETzNYWldxS0RqUllwQUlRTEtJM28x?=
 =?utf-8?B?dmc5TVRuRzZzZWYrZlBFbVZNNW1XeEhFNjUvWTc4QUwyN3pqSmQ0UnNzc21x?=
 =?utf-8?B?bGdQeXpYbDhEVUt4K1BQNXlicEtFYUgyOUFVUjV0a1VFL0ZqRDAzSytKaFl1?=
 =?utf-8?B?TkJCMlpqSWVuSGhEZmQ4ZXU3VkxvMmdDSUJiU0tyUHJGRU5RbnZvZ0RVSFdT?=
 =?utf-8?B?clpPczFkWm1OR04wdHVOUTVQU3pmcW1CZ0RKQUhVRDJRbmdGNWlOWEJZOWxp?=
 =?utf-8?B?NHZkNnNRbWVyS0E3WHVmY1RFNW9VaVc3UlBkS2FyejVqWmphWC9RMTRJU0I4?=
 =?utf-8?B?c2dDMVNmWkNBNG9LYmJvdGtFaDhZWXU5OXVLZWRFb25vdTRkb2RhekNwd2pB?=
 =?utf-8?B?RWMxWUM1NjlLTDZXMGFzY2o1UTdvZDFDNVpjTHVqUXVKR3c5Tml5OVJqclZY?=
 =?utf-8?B?ZE8rWXBVNFR4WkZaYXZCOHRncHowK2V2cWM3aHlURXIvRlhDUUdzZGRrRTFV?=
 =?utf-8?B?Y0V6c3NHejE1ZWdGODhuaUtPNStrVC9ndkZ1bzVlK2xiK2tNY2llYTZDVmd1?=
 =?utf-8?B?Uk9jZEplaGY4cEFtS2dhYjF1Zy9MU08wSFgwTWdXSmR4NTZXY3VJS1FNZzFu?=
 =?utf-8?B?U2dYMnJCRHRiUnkwdTd5UFF5YW5XQ2NxTTE1dDdwYUR4Nm9nOGU5Y1FZT29y?=
 =?utf-8?Q?wM95N5W4/VssNU9QR6gCNDU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b220cca9-c8d4-48ab-1440-08d9bfe097ca
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:35:59.1693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RKvVtZh83didiSLZrGCqrMnvsEByHDSDoo1ZcJ0XZYypRiWe9EDudXgdxAiyH46Qj4GDILkVMnpkAxui3HHvVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4094
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150088
X-Proofpoint-ORIG-GUID: qmL5ASD4Kx8DfKm9JeaXwwzJskykAoid
X-Proofpoint-GUID: qmL5ASD4Kx8DfKm9JeaXwwzJskykAoid
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, bleal@redhat.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, philmd@redhat.com, wainersm@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define vfio-user object which is remote process server for QEMU. Setup
object initialization functions and properties necessary to instantiate
the object

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 qapi/qom.json             |  20 ++++-
 hw/remote/vfio-user-obj.c | 175 ++++++++++++++++++++++++++++++++++++++
 MAINTAINERS               |   1 +
 hw/remote/meson.build     |   1 +
 hw/remote/trace-events    |   3 +
 5 files changed, 198 insertions(+), 2 deletions(-)
 create mode 100644 hw/remote/vfio-user-obj.c

diff --git a/qapi/qom.json b/qapi/qom.json
index ccd1167808..6001a9b8f0 100644
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
+# Since: 6.2
+##
+{ 'struct': 'VfioUserServerProperties',
+  'data': { 'socket': 'SocketAddress', 'device': 'str' } }
+
 ##
 # @RngProperties:
 #
@@ -837,7 +851,8 @@
     'tls-creds-psk',
     'tls-creds-x509',
     'tls-cipher-suites',
-    { 'name': 'x-remote-object', 'features': [ 'unstable' ] }
+    { 'name': 'x-remote-object', 'features': [ 'unstable' ] },
+    { 'name': 'x-vfio-user-server', 'features': [ 'unstable' ] }
   ] }
 
 ##
@@ -900,7 +915,8 @@
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
index 0000000000..10296ef33c
--- /dev/null
+++ b/hw/remote/vfio-user-obj.c
@@ -0,0 +1,175 @@
+/**
+ * QEMU vfio-user-server server object
+ *
+ * Copyright © 2021 Oracle and/or its affiliates.
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
+struct VfuObjectClass {
+    ObjectClass parent_class;
+
+    unsigned int nr_devs;
+
+    bool daemon;
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
+                   o->socket->u.q_unix.path);
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
+    if (!k->nr_devs && !k->daemon) {
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
+    /* Later determine how to detect a daemon */
+    k->daemon = false;
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
index e0daf349ae..b5eb306662 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3465,6 +3465,7 @@ F: include/hw/remote/proxy-memory-listener.h
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


