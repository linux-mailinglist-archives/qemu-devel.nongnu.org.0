Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 216C1518670
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:19:12 +0200 (CEST)
Received: from localhost ([::1]:45706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltMs-0001bI-LH
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltL6-0007fy-Go
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:20 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:59628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltL3-0001Kz-UG
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:19 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243B5TcL030007;
 Tue, 3 May 2022 14:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=fMLHVNHsLYh2Gqth8fKpSXEjLhYxRijH6pjydBF9020=;
 b=w7Q2Cm4etnBjLds103RxIU20f1pz7AjSUp97bwDrmaqvflnvKFilt2txdNJfF1m8nfT4
 CGj1Mq2H/xJGT/zadLs58H9oq5eiDY9/3Lo+Uszo8buhnzTGGuNOQ1Y0dGiGm8b7LoLd
 sr4k/CT+8DcxBpVN24c7VDm+aAzW7+bVnpga8F5uhKAzO2EoKC6D3VSkOiRw2lZCrZHL
 Xw0n2XHaTVDa/vUcQi/IyB592qrLenR0FlrV0kFaqwxY57ZUIvRHDOGa3ZkJOT5UnadI
 OcLX0nYpvXm0I4XMv+P7gpR/0TY3t/91aCS8OLOop561HAw9EN3UhB5ptIc/HH1E4E1G zw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruq0dtn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:07 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 243EGRY8001638; Tue, 3 May 2022 14:17:06 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fruj91js4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sv26rqJcGJnaKd8tGI2iw1IoRzDwebbPujnUPtxLlj9iZAMgGNI+XxNCtHDAQXah2bzIPmVsDtvyGynKDc2eeza6Zz8YBUT33emFaZQ6EfgP6E/3RC6GbciZnvVqwaIVXhLY+dw9qCTi1yIP0pL+yQ1kNqcEuXFRU+qozjNzlGOJdtXkSwX5hX3OAn5w7OZjeB14abnEc65oC2HTXHqDRApezL9Bw8uaDLhnii/e9hG4MdIpkYSTWSjMl6L5+nypu0+M/u9BjRxQgUMPmtJVyTiWJy5MMr7DPZpNNtC56Rq0xAQ4fmO+SLn/f3cegJZrKkF0parfqJLWAnMzx2oHkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMLHVNHsLYh2Gqth8fKpSXEjLhYxRijH6pjydBF9020=;
 b=DOhJzW9zHFwbdvIOEG+XcyEsQ/OMEuC9bPula+rW18oGiQqUl8Lp6l2uOkFdsiCQwKaKa3ttqruTNMpypeLrICk87/Z+a+yUR0OE7nV9gUCf+AXMap66XIQZsrx+qh6eeLwjoXMSr29D/PkrYxfDqzOfqCJquJE32wH7FU40mogO4LAtR51qNPe7Fc6ED6jhGzkYO6YTvD5f4Jc22Caxb9nRNNLrAn1tjXwVY12bbeKwY28p7xSJE8eQFpf1c0CMOVqKCI399Nx57C3zlRKASPXuUqzWGeWl2oM6MkYzk6OywZ3WQ/ofIEsukDoWidU4KfkVyVee2Ji4VIKu0+UgQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMLHVNHsLYh2Gqth8fKpSXEjLhYxRijH6pjydBF9020=;
 b=fwYztugSnkQMmCgHFWrTs7CgHkmfAdVThrljnWlenzTFjItrZ7eT6tXu0IrO02Jq3Em1Po8fU6bRumQzaQ2wphMpmjwDiOT/A2B0ZFpouCD1QOdhPzEb9ygWYUPOgBGZG5KivM/Ofvv8WOo4d6zLhms5gNRLXjndNKNSq0QBsLY=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BYAPR10MB2600.namprd10.prod.outlook.com (2603:10b6:a02:aa::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:17:03 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 14:17:03 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v9 00/17] vfio-user server in QEMU
Date: Tue,  3 May 2022 10:16:41 -0400
Message-Id: <cover.1651586203.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR11CA0005.namprd11.prod.outlook.com
 (2603:10b6:806:6e::10) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87630acd-5bd8-4887-e209-08da2d0f98bb
X-MS-TrafficTypeDiagnostic: BYAPR10MB2600:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB260079D385DB073CF63B7E5790C09@BYAPR10MB2600.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gpeuL7Lo2c1m5wuR9yZ+Lsr2wPfFVd1d+0YK/WAVtzXCiWK9qihqtCM/Qx+buttQmlJa0M+Li7TY/ZVmGdMvgLcyj4IC3pCKsSSs/LCVEce73hlIR1eUZLGiqvLuRh1BO17IYSmjqLo2flE+l6eEwNCFnJWUdwb6NU/yk9dXbRTDxixFGYnFx8Q28dMqy7WwSYouJR1uK714iEkdTMNSmNZn8VOa379ZfnF8ZGEWOkyab1me3PUg3RNFvsAX9sF7j8S8eHZYkJHFoUzHNIsEk94av06z+LZnLQBsXk1cRQGh9pG4Rzefgt06oA2hA75wRwnCypjoYXeewlVg0CdMtGK/x04VtX8ZitiXDmeWD2BEBHMdeJWvqlpZbSaRHmi6yejxi+GjkgKwaS2ALNXEX+hGPeLY/mTooHA7P5Nl7RqbLGChMdiMd90Mf6GXPnrtiIplRjjDylnzppOFkO3S9X3PNPYvGxdyEHy5PX94KsOjzQXquP6AjxyQH9c5+jBiCHJ6/w8RSWttGMdDpc0S2/YV+Iw+giLdUHTn1VOgdbsKhilSmw0oMaG8U6niT5Wuc3x1hQUbRoKxRcMggmBeNi2XKHIelwtvk7wa7vJk3yl1PCGesi/xNBNbbD9XAbNg/Zi4tx1t2v/6mQbrOCPxhwXMyRRRu84EWDNe3M4JnrhwuM4K4ZPhmgfrDpUMtlykGo1KkMkUsPU1dYHkWwnakw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6916009)(38100700002)(316002)(36756003)(38350700002)(83380400001)(52116002)(66476007)(6666004)(8676002)(5660300002)(66946007)(508600001)(186003)(66556008)(4326008)(7416002)(2906002)(6486002)(86362001)(6512007)(26005)(8936002)(107886003)(2616005)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEFRN1VFdkc0aFFrcUtHV3RMUlBtaDl1TXlSN3ZHdDR4eVJxSHMzTnZCS1dU?=
 =?utf-8?B?NGpDMkE3a1N4WmtmVUU2WVAvMEdUem9KeDJySThmVDlDdjVjNm1jbjgrYzQ1?=
 =?utf-8?B?NWdzbWpYVjh6TlFjc2d0cng2aXNOcDVqMy95TStORWtHa0JnRndwaTJERW01?=
 =?utf-8?B?V3lBNDJEd29JTnI1cldsYVZ1TThFeUxYajI4VTF0STl3VEVhZmUveG5FOGFn?=
 =?utf-8?B?MndqaFdnNkM3aHA3UHFyWjR1SEdweVNyazJpZFYwVnRwS0hVWmpNYnBxZFB4?=
 =?utf-8?B?dkdoTVdGWExZQk9QcUk2NkR0Sk0yNUdmUk1tUnlRVjNVSTBtWFM1WnBrTFlI?=
 =?utf-8?B?WjYxZUJCSHNtaHZ5SlFjZzQxTXNKTFNlZVBkKzFBbS8yNllLSXVGZGlFajNP?=
 =?utf-8?B?ZStYTDBodWYvNCtqUnBNWE1HNE42ZTRLWFg3NFJkUDVVOTBmZHcyTXVQY0xU?=
 =?utf-8?B?VnFqdDBheklwNFR6WEV4VGpPT2IwdjJEUFU5V1FidzFiMklqY1ZMbG1FeTlk?=
 =?utf-8?B?WlJsZ25pM21ONHI0VnRkbVFmQ1VacjlCMHprWURYNUN2aEpSYmVMNEdvU2dK?=
 =?utf-8?B?RmcrTjZ5VnllZWRsK2dKQXgwb0ttOU9SQnZXbVR0bTZETi9tR3N3NE5sMVlw?=
 =?utf-8?B?dTV2Nm5HZmkxaU14Tjd2Vk9xTmY1RW8xODlCU1Z6NXgyVmc4Y2VYMnNmNUtN?=
 =?utf-8?B?c0Y3SndNQ0Z5U0QxbGowc2xuWGxHYXhHcU1sVU5wV2YwNDZReFExQjR5Z2p4?=
 =?utf-8?B?RUFTMTMxandrU0lTUU9DeWlLZnBPSVJBMktyTmovMTFlY002TUJrOHA1Y211?=
 =?utf-8?B?cjl0d0xYOVM3ZGYweVdhN2t4d2szc3k5M3h4M29sTytBZzVoSHl2UW5hSVRp?=
 =?utf-8?B?NzRpQkw4NS9CdFY2c0piZ3FRU1NtZVJWTlAwT2IyS3p5UEFMdUFCa2t5eFpq?=
 =?utf-8?B?dWpLTXNQVWRSNkF2dk5HK1JKRFdwSHBrUkZzTmJKRVZtNmdXNGJJdGxuTFdZ?=
 =?utf-8?B?RXlzMDhlamZIdzZqV3RhYlpwQ09ZZnJkZmh0L2s3M1hjbE1OM1FEa24yNFFs?=
 =?utf-8?B?d0pVajFvSmRXMVVUQS9Ca1JIZVBKTkVRRGgyVkRzdVVKeVhKaFVmL0V0V1Jr?=
 =?utf-8?B?OWxQSHFpNGVTUzN5T3VvclNFbmxWVGJheUpCMDE1WFpiR09STENnZ24vbzlZ?=
 =?utf-8?B?UE51QUJlWTV6dm1qbVVISjNrUEVJam9CVjJ4djE0TWxiRFkwSkVCb3I0dldU?=
 =?utf-8?B?NXFDdFlpVEdTMCtzdVZJeE93M0huMlBVTWI5a25zTlV5cHNHSEczaGpwTEEw?=
 =?utf-8?B?OG9DUzVlV1dneGhTNWF5MnFnMXVlbTcrNk9VU3lheHdKbm5kNWRra0ZYdDRm?=
 =?utf-8?B?YVFDTkdqbDVZc2ZFNHBsV0VoSFBrYTZHY0pCbDg5YmdLUmtGVW13dlVSV0Q1?=
 =?utf-8?B?RkJ2cHRxQVQ5Q29vMzBZRnFmVC93anM2cnE2WWNBNFZqRWFTQXVoMnFGZWJu?=
 =?utf-8?B?MHcyTktVMlZWUFhONUNmMWFaaTFoR0JCQTZmZWR2S2trRnNGNHBaWWtMelov?=
 =?utf-8?B?eWZSNW5Ha2g1VG9Ja3N6UlZibXE3dDYyeGFSNlhHUmVKclNjbkNsOE02QnBE?=
 =?utf-8?B?bU9tazFHMWFXVDdSSysyVHNBWDZnN01sSEE1eGNwdmFGSnZKUy9TNERqT1FX?=
 =?utf-8?B?Zi9zRFRoUnpTSUlmUUw3ZmZ5dTVINXdMcXlzbHVYZ3czTVgycWFrd2VIZFNn?=
 =?utf-8?B?cWFMaGN2TDd5YkljVzcrTEZyRjV0RUZsaVdKZGF0Szl2WlJLNGFvaEd0bWhZ?=
 =?utf-8?B?Sm1UWFpDN2ozeFovVUF5b1lRVGtQTXd3aW1Mc1MrSjdKODFVMDRTbkJYUWlx?=
 =?utf-8?B?NWtpYVljdlJOMXdITEpmN2p5Mm41b0FpMFovU29zOGlVUm4rMmpyamFwZ1JN?=
 =?utf-8?B?bGdOSkI4RkJuWENIYnhtUWlCcXNqNVNQTnJtV0FvQ0tXR3BVL2VkUkE1UC9C?=
 =?utf-8?B?MVdDdk81UWc3MHNMcU1mRElVc29JT1p6eXpjQldxM3V5QXdRMHc0eld5WmN0?=
 =?utf-8?B?a01LYkJxVzlNMzFzRVNlWlAzZkNFRHlHTEtxZWxKS2JSMzFPeFNZaVVzV1VX?=
 =?utf-8?B?MVpic2VPVUxSN3EyUEdRQlY3TmpDWTBodVVraUc0Q0FwaCtWRXQzOW5GSGFC?=
 =?utf-8?B?akoxQ0hZM0ZubHc3ck0xTmxPdzFhL21JckJLdGplL3F5VVRVTm9WTEM5bTZT?=
 =?utf-8?B?NWZKL21MM1RLVnNNN3JQSjZWbkZodW9YZGtYQzA5S3Y2UkhXaE05cGJiaWsv?=
 =?utf-8?B?aE5DTGtMeFUrRXRBN3Y0cDdZTzRzeU5yU1Z3amlvZzdKRFk0ZnJwdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87630acd-5bd8-4887-e209-08da2d0f98bb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:17:03.8430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WivdKYiH54iEHQjayxVdGfC/Ue+qZla4isbBFFZnRc0q8rpvhtFWblsBSJaDnjPmu26zgnrtimdcO4xl39zMpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2600
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-03_05:2022-05-02,
 2022-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 mlxlogscore=911 mlxscore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205030103
X-Proofpoint-ORIG-GUID: g2pVTBvdHt4XullzptAJ0p08rfrQJ2W5
X-Proofpoint-GUID: g2pVTBvdHt4XullzptAJ0p08rfrQJ2W5
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

Hi,

This is v9 of the server side changes to enable vfio-user in QEMU.

Thank you very much for reviewing the last revision of this series!

We've made the following changes in this revision:

[PATCH v9 02/17] qdev: unplug blocker for devices
  - updated commit message with more details

[PATCH v9 06/17] vfio-user: build library
  - updated commit message with license information

[PATCH v9 07/17] vfio-user: define vfio-user-server object
  - fixed type with libvfio-user library name in comments for
    VfioUserServerProperties

[PATCH v9 10/17] vfio-user: run vfio-user context
  - added the QOM patchs of the PCI device and server to
    VFU_CLIENT_HANGUP event

[PATCH v9 12/17] vfio-user: IOMMU support for remote device
  - added comments to describe the design of the remote machine's IOMMU

[PATCH v9 14/17] vfio-user: handle PCI BAR accesses
  - unref memory region during early exit in vfu_object_bar_rw()

Jagannathan Raman (17):
  tests/avocado: Specify target VM argument to helper routines
  qdev: unplug blocker for devices
  remote/machine: add HotplugHandler for remote machine
  remote/machine: add vfio-user property
  configure: require cmake 3.19 or newer
  vfio-user: build library
  vfio-user: define vfio-user-server object
  vfio-user: instantiate vfio-user context
  vfio-user: find and init PCI device
  vfio-user: run vfio-user context
  vfio-user: handle PCI config space accesses
  vfio-user: IOMMU support for remote device
  vfio-user: handle DMA mappings
  vfio-user: handle PCI BAR accesses
  vfio-user: handle device interrupts
  vfio-user: handle reset of remote device
  vfio-user: avocado tests for vfio-user

 configure                                  |  36 +-
 meson.build                                |  44 +-
 qapi/misc.json                             |  30 +
 qapi/qom.json                              |  20 +-
 include/exec/memory.h                      |   3 +
 include/hw/pci/pci.h                       |  13 +
 include/hw/qdev-core.h                     |  29 +
 include/hw/remote/iommu.h                  |  40 +
 include/hw/remote/machine.h                |   4 +
 include/hw/remote/vfio-user-obj.h          |   6 +
 hw/core/qdev.c                             |  24 +
 hw/pci/msi.c                               |  16 +-
 hw/pci/msix.c                              |  10 +-
 hw/pci/pci.c                               |  13 +
 hw/remote/iommu.c                          | 131 +++
 hw/remote/machine.c                        |  88 +-
 hw/remote/vfio-user-obj.c                  | 898 +++++++++++++++++++++
 softmmu/physmem.c                          |   4 +-
 softmmu/qdev-monitor.c                     |   4 +
 stubs/vfio-user-obj.c                      |   6 +
 tests/qtest/fuzz/generic_fuzz.c            |   9 +-
 .gitlab-ci.d/buildtest.yml                 |   2 +
 .gitmodules                                |   3 +
 Kconfig.host                               |   4 +
 MAINTAINERS                                |   6 +
 hw/remote/Kconfig                          |   4 +
 hw/remote/meson.build                      |   4 +
 hw/remote/trace-events                     |  11 +
 meson_options.txt                          |   3 +
 stubs/meson.build                          |   1 +
 subprojects/libvfio-user                   |   1 +
 tests/avocado/avocado_qemu/__init__.py     |  14 +-
 tests/avocado/vfio-user.py                 | 164 ++++
 tests/docker/dockerfiles/centos8.docker    |   2 +
 tests/docker/dockerfiles/ubuntu2004.docker |   2 +
 35 files changed, 1625 insertions(+), 24 deletions(-)
 create mode 100644 include/hw/remote/iommu.h
 create mode 100644 include/hw/remote/vfio-user-obj.h
 create mode 100644 hw/remote/iommu.c
 create mode 100644 hw/remote/vfio-user-obj.c
 create mode 100644 stubs/vfio-user-obj.c
 create mode 160000 subprojects/libvfio-user
 create mode 100644 tests/avocado/vfio-user.py

-- 
2.20.1


