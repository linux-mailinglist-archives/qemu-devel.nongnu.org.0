Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1EE4AD3AE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 09:42:32 +0100 (CET)
Received: from localhost ([::1]:49588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHM50-0002Fo-JU
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 03:42:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nHKpp-0001tB-DQ
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:22:45 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:43644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nHKpk-0001vL-Su
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:22:45 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2183uMge026751; 
 Tue, 8 Feb 2022 07:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=3qOq5mZ4G71cNTPBvjnfP3oyZPu1Ssv9WF0WuWKLEmA=;
 b=mTRC50PVSj/USLDTe7B7OwNeSq2PB3BFa2+Iqq6VFWmVu1fPt+bjkwTQC0Vqkhk9B950
 5IyBfgCo1LGN3RmdtLixNdtH0jF8xFmx/azRHcLfsU9NUmXehLYxjMOj19x3s6rH4TMO
 3Ay47RoqrXhFT/e8jXTk3x/N4mO6+nmaTiNyv2DVH5+33Br7DiWAFgNmsaNQRIAqdqAE
 HbVUa5XmBeriEV6h0gicg6aBLGqs/bFiR+ip4zVQn3GUdox+NrBRRaOQfuznYndUyp1H
 tjED0vM9xnc9BO6sp8Kr4fLe0DwFRtpeUWfEjEkPpAS4P+U9YvLVK5KVIArFG0tzdD0j ig== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e3h28ge7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Feb 2022 07:22:36 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 2187BlYq093365;
 Tue, 8 Feb 2022 07:22:35 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by userp3030.oracle.com with ESMTP id 3e1ebykknc-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Feb 2022 07:22:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmmICvMtG2uWkvt/ksH1S7D6nT/zODY5FYt+KJiZMfDEGzpwn4ftbL79CfvbFVt2cTeb+MYcFX4K2WunYTN6rp3iLkYiklwuuMPihcMNqLY4EH0phVQrcAgJC9xUlV3Ol0/94CYbjmAV9EvEEsk8HiC29tk5dQ5TavaNG3jQH1U9TKxZhnHAoV5uQJRTIRPEik9++QaExE3O/7ZMWSDFCAn2KO7J5sBGLAoIIhcWd81naXZy5+wiCI+eKNz8u0/QsfygwyQJL7vNFe+euUzMCul/IGZbQl7QUnHJPtGLctUf3G0ZsdXENMLe3y5tZ9KKXAYDF5mMuGZrvYpQpjSxBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qOq5mZ4G71cNTPBvjnfP3oyZPu1Ssv9WF0WuWKLEmA=;
 b=LD8UyV8ola9MhL3Nyoi7rooM8rcKGIBRi6XuhbxJBj/9647Cf8V/wYg6P9Kd20fRMcSp80UkCfdcxapLDShBjoSC95d9SFT27hmClwKMuOa7cew2GaYe1HoNeqmsmuqgXxXlVN7zTBKb/9ayLqjSZNsw9gwuLrtKYXgqSpzZwH0ewxR+wcPgQrLxj/yr/Un+/BD4lXc/oEBU8qdEfe/Vhv3rH478caF1KWQ72UHIxMWa8pEZvD2fQbbST3BVraKkVnid/MBNAfUcxO5CEY/nEr68QDB7zWPJ6J3X95xiDHuG45VtTULNoDZkWtyJQEPm0uqA++TKn95WizPMGG1RJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qOq5mZ4G71cNTPBvjnfP3oyZPu1Ssv9WF0WuWKLEmA=;
 b=kCG7nJkHsTJXrYZRQmhIAyqQ9/Je8CFiAM2eHDrfZeOggj2/nwn/7G4Qsg4H0+Z2zuEhATUnnyLVdb2EXoyAmBO+j+7LPSMCVRQS0U8EaPfZTdhKMIJ0O5MmVRatMeiePwtPh365Eyx1rI2ZIvDpqnnOyq7qkVrumV53ENnG6CM=
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SN4PR10MB5608.namprd10.prod.outlook.com (2603:10b6:806:20b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 07:22:31 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 07:22:31 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC 2/8] multiprocess: place RemoteObject definition in a header file
Date: Mon,  7 Feb 2022 23:22:16 -0800
Message-Id: <fca11aa6a4c2718a1f55c50f56e84aabbcf6563a.1644302411.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644302411.git.elena.ufimtseva@oracle.com>
References: <cover.1644302411.git.elena.ufimtseva@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR16CA0006.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::19) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ca95996-5a02-4ce4-c328-08d9ead3c4ed
X-MS-TrafficTypeDiagnostic: SN4PR10MB5608:EE_
X-Microsoft-Antispam-PRVS: <SN4PR10MB5608C556A8C0ECACE90E83F98C2D9@SN4PR10MB5608.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kNU5Jhhl2/ZiQrNF+96T+47oI/nj7fB227SDSz82ljLj7HSFoKTtvj9Lctb1l4G9ZOgd6/hKXKRcBK7y3IF9wbhjTXiuqJN//bD5r02IM3YVJ0xP6QgUNU0rowmQC59z4KbZ1RUkXOfvdkU/2h0n4wDx9x5FrXp96UmhoiOXaH036lOzlvYK7Z42egN/Mh+4Zg48W0mGAsiQiTdoEC6U7IPtICZeOl9PYNDrskdzSjQm22xJ0SvBUJbonNMPkIByJYGEJXc4pyeKtT+YVKWisjlW9vr5prP+8PDTySjVHEoM9Ss230NMzWzfd93+BmX9/lsmY+KpDY7eB4DAVZ4Dpkega86fMN7IpE5ex0/jwtpvrDVBvGDCRzgDFx6MXV9IYudoYXceWK3DlcbXBBCSfW/lQVfS/Egqp6LNZk27G90eVEvXxhsq+S4OBlsYqAwwKoydYn2hd/G8IOU0kpj9DwEpQnOhbx/lwfIsH3KH0WBWFDp3MKM2kcHpi0jV8I+AMQcH5zlLJ/lAuK+5PoVeFJSAbnuEURGPeUfPH1GFo5Nv2CP/biXYmiRtZj92igGC8PIR5VzKapyheN/IWGwuMVnutDd/VL590LJBBkds/g8xo3yxiI2EYglAKrTbGI9erXWIR73ljIkEEmkzqAgQCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(36756003)(83380400001)(186003)(38100700002)(86362001)(5660300002)(7416002)(2616005)(6486002)(44832011)(508600001)(6666004)(8676002)(4326008)(52116002)(2906002)(66946007)(66476007)(6506007)(66556008)(6916009)(316002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnE2WVVSMjU3WVlLZnFQMGNNT1hmMm5WejEySlRaR0lzWGVXdFlySDRQY2w1?=
 =?utf-8?B?eGEraVJNb1RNTWNGNm1VK0lKYWxka1RTVENnb3J5elJXNmszRENqdHBib1lM?=
 =?utf-8?B?bG1LY3ovWUZ4YjVmVUJHaG9FR2pqeGJoVnlQUFFNSStReFpDdHd0bVoweWdt?=
 =?utf-8?B?Q05wd0pNVGx6cHdydEtKQVlkMnRyZVhpVjQxTzB2U3B6dHV5OTlwVFhzN01T?=
 =?utf-8?B?M1ZDVm5QdTdpRzloanllWlh1a2I3M0VwN1dWa3d2YW1mUFlFajREcVJMeWlr?=
 =?utf-8?B?Zkp0NkRGamFXb2dGUXVMNVQzR2xEWW9selhLVzRoU0VmTTU5NHdtTk9qd3Qz?=
 =?utf-8?B?bEpwVTlPVytGQThtaW5pa2p4c05yb2ZnbUpoNk9Da0FOa0RFMUZFanFCUVZY?=
 =?utf-8?B?QkUrNDJIeDRKaEdXb3ZqajJ3VmlKNVFkMGxkWFllTWpNeklkQitYKzh5Tmtx?=
 =?utf-8?B?S0Jpd0pncjVnTkY1b3NycHRZN1FFRy9tTW4rNkY4RXcwK1pjbi8zczNZUEFW?=
 =?utf-8?B?QUxmOTVGcU10SlhnQnYyRzJaR0tXTWJtVSs1NUx3QlVYdnZXUTZnZDNmRWt0?=
 =?utf-8?B?OU9PdDhKQmx2Qm1WcDR6blAzWlJGWnEvOEV3WDlzQVIyQnJVSnA5WVhMZHNC?=
 =?utf-8?B?VTZ5SWl6MU1iTGxPTWtKR2VaNnhlYzZiUlRjUFpINmc3VU1SKytoN01Vd05C?=
 =?utf-8?B?MjRNTGpLQ3ZmMW5YeEF0aGVQYitYYUdQUTZSTUFrT0o1dkFEb1B0SU5xQlpw?=
 =?utf-8?B?OGJEalBURGxML3ovOGEwWWtuWWc2cTQ2ckIweEdINFNxREVIbS90ZitJekQy?=
 =?utf-8?B?ZFpEQXFSaVpyendWRVRJNXB4cW9BSFp1bTFXMlgzQXVZTDZBR0FTOW5qdlh0?=
 =?utf-8?B?aDcrUHFBUm1zVnhnRy8ybzlIQkV5ZXhEcHZ3cW5DSnFJcWt4SVdHQkhQbnRK?=
 =?utf-8?B?eHBwZUJMMG5yWTc4empPelZkZmhvaFZ3U3EvSWh6UVNKZk1jcENEVUYzajhT?=
 =?utf-8?B?OFZ2SlVTTVpmdWRFKy9NdGp5R25YNDF3VStKWitwRytwL3RWR2tmREFrRmRS?=
 =?utf-8?B?SXRwRDd2TlA0c1lIdzRGa002TkFuMzRHS1ljQzcyeEtJeWgvSVJVbTBPUHdY?=
 =?utf-8?B?cC9sdDA2QW5SeEtYS1prOXdWSkFGYU1rbFJ0dFVhV3diTWxrcWNLaVBqVjB1?=
 =?utf-8?B?QnIxMEp4TWhnUldEajNtNUZiVUg3MUpZUjVObXh1WVFzQ25kbnlWYTYzSTl3?=
 =?utf-8?B?ZURiSUE5bFdDd0lPalBIamFaUnZjMGJhbUJaMHBvMmRpeFNDbXRIOFNDMFVX?=
 =?utf-8?B?a1U1dENrNWc0STVpWlhQV3Q1YWlpRG9RdGx1OStCZ2J4WFIrNk5jK1JiOEl1?=
 =?utf-8?B?M0R2bXBWK09WYXVsWE8zdExnZk5XWVNxOGZUKzBkd2NYTzBJcVlRQ2EwS2Jx?=
 =?utf-8?B?UmZINHZzVFpIUXRCV1VVY3pBV0hlMnRvbUdUenN3Umk4aUMwVWNjMWY1bm96?=
 =?utf-8?B?MWw4R2RMS0M5TUlXODdLUldPQ2dGRkJFWlVTRXI5NHBGakY3dTRPLyt1ZlpY?=
 =?utf-8?B?WGVDbXc2RFVUaHhQaWYwNTdTaHlFeEN6Snl0VzlWaHQ3UW8wR25ZMEZrR2kw?=
 =?utf-8?B?aWl0c2thZlI1ZGlzYUtpeHpDM2x1YUdJWHlkSnJHZXI5V081YWQ1NlNGNkNm?=
 =?utf-8?B?cVpRSHExMlhvZE9FaWt3eU5ybG5iR3dKN3M2SUs2ZEVSTzJNL2RZVjBtY3B5?=
 =?utf-8?B?eWJvQ2hxMkZQRHZURzlzd25qYmQ0QkdzNEFoOXNhWEZjeGVudVl2UVJvcnQ5?=
 =?utf-8?B?TzRQcWFlK0lkcHdpdkRxRkFCMFJBZzN5V0FFcXNLaHd5VWlZcHVlbDAvZjQ3?=
 =?utf-8?B?MThXVGdOdWVrbEpTT0FOT2VKcmsvM1ZzQUdXUHRYN2dwV1MzSHV0Q3lFUFFZ?=
 =?utf-8?B?NzAwZnA0NGI3UkE5UXV0N3lvb3k5Q3k1dktuU292ZGR4UFM0dEpoRE1EOGc1?=
 =?utf-8?B?YkZsMHZXeFZJOHBXNk5wZjdKa3ZUU21ndXdZS1hKSVhFQTE3V1ZvTy84TEVk?=
 =?utf-8?B?VEtRMTd6UW5WYkFlRDN5bnVOUnpBWGJyallZSDdVRURlR2gydDhRVHpXTWRk?=
 =?utf-8?B?Sy9VYU5UZG1zMnJ3Y3NGMFdwdmxMdTVhZ29vUXRLYmUzYlo1VTNCaE9LR1Nz?=
 =?utf-8?B?QXdVZ3ljTzFQdTJ0MzZ6R2UvNC9JMUs3TnlzN0Y1Y3FwSVB2UWs2bTRzQjNz?=
 =?utf-8?B?RUlwRTdhdEkvdFlMTkkxcWVrMWJ6Wk1oeXorTDIvcm5xWWJQQk8xZkI3SUYz?=
 =?utf-8?B?SzlNSDNmaWZHQnp0ci9MSjhuN29ydk1uRGNHUXVaTUFXMDE0RHJGdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca95996-5a02-4ce4-c328-08d9ead3c4ed
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 07:22:31.3801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAn/39647rI2e1nXB3zLfCMauT+SFFcEb01G6ANkVPDQsNrK+bj8dGlE76emioryhVI3o98Q9iVfu4L/3AnXJT6uOOpvMJhbJiVsRTIr1N0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5608
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10251
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202080038
X-Proofpoint-ORIG-GUID: iAR7BhY1oItpOOkCoLga7cDiHCdTmGNi
X-Proofpoint-GUID: iAR7BhY1oItpOOkCoLga7cDiHCdTmGNi
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, john.g.johnson@oracle.com, cohuck@redhat.com,
 jag.raman@oracle.com, john.levon@nutanix.com, eblake@redhat.com,
 david@redhat.com, armbru@redhat.com, peterx@redhat.com, mst@redhat.com,
 berrange@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will be needed later. No functional changes.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
---
 include/hw/remote/remote.h | 28 ++++++++++++++++++++++++++++
 hw/remote/remote-obj.c     | 16 +---------------
 MAINTAINERS                |  1 +
 3 files changed, 30 insertions(+), 15 deletions(-)
 create mode 100644 include/hw/remote/remote.h

diff --git a/include/hw/remote/remote.h b/include/hw/remote/remote.h
new file mode 100644
index 0000000000..a2d23178b9
--- /dev/null
+++ b/include/hw/remote/remote.h
@@ -0,0 +1,28 @@
+/*
+ * RemoteObject header.
+ *
+ * Copyright © 2018, 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+#ifndef REMOTE_H
+#define REMOTE_H
+
+struct RemoteObject {
+    /* private */
+    Object parent;
+
+    Notifier machine_done;
+
+    int32_t fd;
+    char *devid;
+
+    QIOChannel *ioc;
+
+    DeviceState *dev;
+    DeviceListener listener;
+};
+
+#endif
diff --git a/hw/remote/remote-obj.c b/hw/remote/remote-obj.c
index 4f21254219..f0da696662 100644
--- a/hw/remote/remote-obj.c
+++ b/hw/remote/remote-obj.c
@@ -23,6 +23,7 @@
 #include "hw/pci/pci.h"
 #include "qemu/sockets.h"
 #include "monitor/monitor.h"
+#include "hw/remote/remote.h"
 
 #define TYPE_REMOTE_OBJECT "x-remote-object"
 OBJECT_DECLARE_TYPE(RemoteObject, RemoteObjectClass, REMOTE_OBJECT)
@@ -34,21 +35,6 @@ struct RemoteObjectClass {
     unsigned int max_devs;
 };
 
-struct RemoteObject {
-    /* private */
-    Object parent;
-
-    Notifier machine_done;
-
-    int32_t fd;
-    char *devid;
-
-    QIOChannel *ioc;
-
-    DeviceState *dev;
-    DeviceListener listener;
-};
-
 static void remote_object_set_fd(Object *obj, const char *str, Error **errp)
 {
     RemoteObject *o = REMOTE_OBJECT(obj);
diff --git a/MAINTAINERS b/MAINTAINERS
index 7543eb4d59..3c60a29760 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3453,6 +3453,7 @@ F: hw/remote/proxy-memory-listener.c
 F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
+F: include/hw/remote/remote.h
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
-- 
2.25.1


