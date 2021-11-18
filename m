Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF2D45599E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 12:07:43 +0100 (CET)
Received: from localhost ([::1]:38386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnfGX-0004Qg-Me
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 06:07:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mnfDZ-0002wp-MK
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 06:04:37 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:10882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mnfDW-0001Ia-Pf
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 06:04:37 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AIAVW67025625; 
 Thu, 18 Nov 2021 11:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=CRCpa3wKTyIQw7gEX7S42Pc+DOzTlHl7m5QJ8YDQ/2U=;
 b=hAjLh7tuHHZ6odDR5gwzKvWaqB656s+gamkfwe9ek8kyUFhxRCZ5y5mhtjsZMf6aiLwa
 XzYXNAEc97B6YcIfhNIwMF4JQPxLvUqk5I9Qk9BRXK6exIUL+rM8dw4GfilLVlWIZXwo
 bl+hFBN6uylWnBLZv2Eym6diLJbrOEf3SC94D2Fyfg9Fivmdo2SYvpZi7YWD07GwbjfO
 BxyhWoDX3yZIkxQ8MxGE8nQ6PQ870FcBxh6ndPae5PdD1pLvtSu7o1g41Lkn2eBRDPza
 9DjDg6j0NFB9sNI2zzay4E5R5Pc0A3lNEwnO7t/wpZ5fssl1f3G4UHZyKF8OeXhvEx+6 Gw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cd1w86uwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 11:04:31 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AIB0K6m010096;
 Thu, 18 Nov 2021 11:04:30 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by userp3030.oracle.com with ESMTP id 3ca2g0anaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 11:04:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rs60QMlAL8Iow8vGd4Bu93KGVBf78WgDQXnO7/Fz4v1GL7dzzsXYTVGjLPk58kh5OAHn3wSMKz2zVO+PPuTXe2tyyi4uiBZ4txI+m7BIjkJCKjf+A8cg0qrYlZxv2WH/g7m19hueh0Shc63F9mtpdOv0AghNlf+nT3aeAJmOsIh7EY2VzIhoMLQXj6Bw8VhkxG5ARR+o1B8FhwX8gmpWIf5ZojywuDJ5NZcPJOPmV3WVPVpf035Zq9cxtSqbot+TYSnIQD/Nc9ZbcE8hqgBBdG2RZ9nsZje77AzbpY4RD2Kzhg0NwoFDQe5JmENUmKjfBDzm2EI6GeRI8sd2+ly91Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRCpa3wKTyIQw7gEX7S42Pc+DOzTlHl7m5QJ8YDQ/2U=;
 b=EdsPND7oLXcQPokuxu31XTb28OkUnwC/nirQumKGCZWRPBO+lfoN4Y/5rZFvG3Z5Mubrqe++dN8g6VWZPwYaKMTf6C2q3on8M5vWSW8sCmUhH1eoQExdXof1LrYt53PcFO6Ol/6jDkvQwdg9oZFgL7XFzh+jN8TdGdc0DTMcCjisfbuqkXYKnKLpH6e4YSOP1BIHG+aIqPAbI9S3ZJk9rFWfLTzwSWnM4isOhwGbuHwec8ZzClqoRg08GJtD/4zM0WdgT5kGi9RgNIoTQzUiosc2YtWSZufpnBya+cVrAN4SRXZF6Wg2cQvsANcGfQRoyO2GJVTQHE6ahPUc8uBcow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRCpa3wKTyIQw7gEX7S42Pc+DOzTlHl7m5QJ8YDQ/2U=;
 b=u6DQdNApQrZpDF0cWElBmO6Hp5v/9A9zYcp1EHlrnM6FwX5BtoUWeEcDfX7hvL+ocGK/XipafYEOIFcvfdiSlQ9dyYeIMS8aoeSMB0xeB5SBVgL892cQgqCT71OUETKeU8iehQsh/xi1WPNOPBLKfFzUodASXIOuQuNCfJdgFZ0=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by MN2PR10MB3903.namprd10.prod.outlook.com (2603:10b6:208:181::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 11:04:26 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::9418:7fcf:86ec:e0f4]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::9418:7fcf:86ec:e0f4%7]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 11:04:26 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH-for-6.2? 3/3] docs/devel/style: Improve types/qualifiers
 rST rendering
In-Reply-To: <20211116151317.2691125-4-philmd@redhat.com>
References: <20211116151317.2691125-1-philmd@redhat.com>
 <20211116151317.2691125-4-philmd@redhat.com>
Date: Thu, 18 Nov 2021 11:04:21 +0000
Message-ID: <m2ee7dn2ru.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB8PR06CA0065.eurprd06.prod.outlook.com
 (2603:10a6:10:120::39) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
Received: from oracle.com (46.7.162.180) by
 DB8PR06CA0065.eurprd06.prod.outlook.com (2603:10a6:10:120::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22 via Frontend Transport; Thu, 18 Nov 2021 11:04:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d676d210-cb20-4023-cd11-08d9aa832f9f
X-MS-TrafficTypeDiagnostic: MN2PR10MB3903:
X-Microsoft-Antispam-PRVS: <MN2PR10MB390347FB73E7A1AD3AEF0D32F49B9@MN2PR10MB3903.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W9Opn7alyxvSxscJ7Kh2JO5Rb85MHU70nyutysXfBd1u6KgzTO6IsKwGEaME4XSpHsBy/EGMf3kc/gGKiKEVdfJvxJYmUrQzUXzKvGf2p1Gpe9NNG0CXgYbzV9J1FFg/M91XI1Btyoxfgy6EeRqeVNrDYpneFZerl4wwghGJQkITDG3Ffal9m9XMK5pp1IXLFjB75Sf3cJNPS6YeLp+6EOjz1lRPjw9H2xNVY2jtkI1TvJunJJurb/Tw6eIUKNGfus7fdPsMCfjsm0q85EQ1ZIPwHT2XOLxptZLsH3oJU5Bi/JI+lJXd7E90knGLeG8wSCp4jc+IayHrN813Q6fbcyHnJz4sLs3nbFanHkhaYYLKo+3D8TxS68JJ1cr1HzvdXDYYkT5DfEPXY9+G/C0tzbHXMoVSQvKZPjvdPpZZJMUR4ZqyK4rdt4kq6a/wiqj8Qg+I4xn/z+GUgYleRN1y9wP8FCruYD0cbS6GbYc1UOL3CdRX6LmoMwNlks38w19kBNHEf3fDZ1U4/Kb1G4uVbOZm39Ecje3EEhqjJ+dFQPwJCcoilIdXqcBlDWd6aFl2ZXmrXKL0Gnr0LieCMxP+qGhS3v/kLhzd4u8voklJj8a9bMcVDflpZMCkGT6srEtd77qdAwQnqF9q+mJzDaLZQzTmWHJ//OmV/G3bUn5Cd4Q46xfOu0C+Kpp4KtTdDZkM64ZBNMgroRH6dCAj1qeE7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2616005)(5660300002)(66556008)(956004)(83380400001)(316002)(66476007)(66946007)(44832011)(2906002)(508600001)(8936002)(8886007)(36756003)(4326008)(4001150100001)(186003)(52116002)(7696005)(8676002)(26005)(54906003)(6666004)(55016002)(38100700002)(38350700002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG1mc0ZFdGNvTlQyRy8wV1JXSlFacWdjUmlrcXRVazhxQkVuQitBUnNucUxT?=
 =?utf-8?B?V3VnQjZtZXJSNFU3Z3VvNWFMQ01leTlyNU1kbFFLYU9kMGZnNVhtS2dIRENw?=
 =?utf-8?B?SGRiVlIraXgzUWlEVmtla3N0TVJzK2RnRGJTckNTd2tLaisyTXIyWldjOFNz?=
 =?utf-8?B?aHZmNU81OEpWNzFvdFFjOFJKQzVjRjY1TElwdzh0eXY5TkhLenlsdEFiQk1x?=
 =?utf-8?B?VmZ3RjhySGo5cFZzOFBJNENuRFZkV3RibzlUdWdtRVkzekt1ZmtGRS9YRDlP?=
 =?utf-8?B?QnhqOWp0RWFRTmhNR25FWHl6YS9tTVFxdVVUOFRrTWZwQitRWURyUjF3TXZU?=
 =?utf-8?B?RFhHR1ZwZDRwNGtjK3FQeVZWdDRvVUVnY0pXeTB1VlVKaEZ0NTY1NDBJVEZv?=
 =?utf-8?B?U3ZIRUM1Szd1bnBneHBYbWFVMmZPNVNxYUY3SFkzNmt4MVYzNUVFSGlpblpj?=
 =?utf-8?B?azVMQWhlRzFxSU5OS2JNa0U4M1VvMFQzSWhxczI0UkRTd2RWeHVrR1NBbUhy?=
 =?utf-8?B?UjFESVZpTjNpOG5DNzMzWmpOYlpsTFBFSng3Q0lpTzdLRUlKK2UzdnNIZ0pS?=
 =?utf-8?B?SHN1Nm8xTmpXZjhYcFRKRlAzYXJGVzNKR2FXeS9nUDVFbVJNdEE0WDA1SHFo?=
 =?utf-8?B?dnBXMzRUd1NXSldTTnRkMFV2bmNaclVGZkZSSm9YcmxoSUdHNTNEOGgwMHpC?=
 =?utf-8?B?TVZiZ3hPcGN6VFAxVEVYZVRMeVRjd0h5eUlhQkdlalZoeHNyS0JVa1pDZ2g4?=
 =?utf-8?B?Tk01YVV4RXFBSHNuVFg2TjdzeFhjazlmNkI5a0t4T1FZQXpnKzh6MGd3Z21x?=
 =?utf-8?B?M3hlNnlabzdKWWFZTmx1NWlPR2ZISHduNW5vOWJQZU9EY0E1bkhOZGUyUGdO?=
 =?utf-8?B?aUlLc0pUQVJwZ2x0MXJxVERyVkxmNVZpZW43RFJLQzV3cG9VWHF1MjdmRGho?=
 =?utf-8?B?dWJuV0NmUC9iM2xxYUVtUVlmNzBGMFJHY1RjaEo5cDZxcHNyZWhkVE5zdERH?=
 =?utf-8?B?NDkyTjBGcDYrY25wL2hmeFRHY3pWUENBbXR0anRCY2JYWm9hMjJ0SDgrNXFG?=
 =?utf-8?B?MHNwSCswNXRRT3dCNFJCY3JqWnF4cnVIQU85NGFSMy83NnozMUN6SU1QUWJQ?=
 =?utf-8?B?Z3JQMEtodDlFT1owQTQ4YjdHUjdZcEs5U1E0VTZxWTJrbkZ3MnRaTkREVnA2?=
 =?utf-8?B?RWxSSklVS0xIV29qU2tyODNIcEdycnRibTJySkxBYUN0cnNIUDRsV0pMVlB1?=
 =?utf-8?B?UGZzZHR2T2lINE9hZitBN0JhZWhsZGpkTWdTZ0lncXBUcmFkUEVVZ1F6YmQy?=
 =?utf-8?B?d3QwbERGdkFNdTZQVm96azJzVjRwNjlBM3ZRc1h4NmRxZm5iMW1QVzN0STl4?=
 =?utf-8?B?eUhaRGovZDBKRG1PMzBLTXJEVXFlV3JxUjh1UGJ2M0NGcXgvV1M2QncwdElZ?=
 =?utf-8?B?V1JrWTRBRktRbTJhV0Z1N0lrbnVxaitsVmtLcFd3aThxcFQ4U2hrUFpoVURs?=
 =?utf-8?B?TWpTYndwUEZlcUVVUE1iRk5Ob1I0MHBmOXh4QzdQZVkzV2tHTjhoQ2psczI3?=
 =?utf-8?B?UTlqWHI2akg3TDM4TlJtU2crMGRBRXlaV25MYjJVc2ZDMmZLNjI4Y2l5UzVp?=
 =?utf-8?B?b0lyTVBZZk0rU0JGOHJHRjAxQWNYQ1RJMktTcE5GQWd2RkJ5MUJITmNXVThr?=
 =?utf-8?B?K0NJZWtncnNBZUdUaGk3M1JwbWFTMEpjdm9NR3BDMnhZUHY2cEdDYXFVWDNQ?=
 =?utf-8?B?dGtYUTV1MDJIZkppYzhmbDZ3TXVCQm1FMmFLNW8xbVhhNEhKTzd3a2ZvVll0?=
 =?utf-8?B?YWVzbmpvOWFIZjdOMlFOUXdaanBFT25LZGJwbHhHb3FtZmlvbTFlNTNyZ2Ft?=
 =?utf-8?B?S1BxNlJzVmZ3TFNReWN2MWdDTEZJVE1QUXBZVEE5aFk3U0RvaTg5czFiU1Jv?=
 =?utf-8?B?eEpJaXcya2NXWG5HNXc0MzVseXcrZmJ0WUxGRWIvV2JRNzBWMXFGTUlxTS9N?=
 =?utf-8?B?OGg5bW5veEZ6YUpyb0o4K0t3TmRReVlhSUtzajM3MGRWUXpJZ2p6UlJ0N1VK?=
 =?utf-8?B?UTdFSWhibnVXeFhtVlRLZVp4VENzblN2bStoNDZtZ1hnSmdoMVZJbUh5aWxX?=
 =?utf-8?B?Y29lKzBmalYvcU1LZkFvUHRyT1pVazdqNkF1L1l5VXIzY1hUMGhuS0NRYlJi?=
 =?utf-8?Q?knQ+1Mg+MqXv8753uTq3f+8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d676d210-cb20-4023-cd11-08d9aa832f9f
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 11:04:26.8245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ie8o7p0YzCGddPm0u50BwHE92CpA6oDWwtZ1DLhMhRpb2ajKXcXhy/nLjVXCjANUM4VmLf96fPoUvXkxl+Ww4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3903
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10171
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111180065
X-Proofpoint-GUID: tT5NDllmlaiWx9eSOuZQcfl0WnczxK3Y
X-Proofpoint-ORIG-GUID: tT5NDllmlaiWx9eSOuZQcfl0WnczxK3Y
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

A couple here too w.r.t. function/macros...

On Tuesday, 2021-11-16 at 16:13:17 +01, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  docs/devel/style.rst | 111 ++++++++++++++++++++++---------------------
>  1 file changed, 56 insertions(+), 55 deletions(-)
>
> diff --git a/docs/devel/style.rst b/docs/devel/style.rst
> index 21f0f213193..f9f063ed8cb 100644
> --- a/docs/devel/style.rst
> +++ b/docs/devel/style.rst
> @@ -111,7 +111,7 @@ Variables are lower_case_with_underscores; easy to ty=
pe and read.  Structured
>  type names are in CamelCase; harder to type but standing out.  Enum type
>  names and function type names should also be in CamelCase.  Scalar type
>  names are lower_case_with_underscores_ending_with_a_t, like the POSIX
> -uint64_t and family.  Note that this last convention contradicts POSIX
> +``uint64_t`` and family.  Note that this last convention contradicts POS=
IX
>  and is therefore likely to be changed.
> =20
>  Variable Naming Conventions
> @@ -195,9 +195,9 @@ blocks) are generally not allowed; declarations shoul=
d be at the beginning
>  of blocks.
> =20
>  Every now and then, an exception is made for declarations inside a
> -#ifdef or #ifndef block: if the code looks nicer, such declarations can
> +``#ifdef`` or ``#ifndef`` block: if the code looks nicer, such declarati=
ons can
>  be placed at the top of the block even if there are statements above.
> -On the other hand, however, it's often best to move that #ifdef/#ifndef
> +On the other hand, however, it's often best to move that ``#ifdef/#ifnde=
f``
>  block to a separate function altogether.
> =20
>  Conditional statements
> @@ -220,13 +220,13 @@ even when the constant is on the right.
>  Comment style
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -We use traditional C-style /``*`` ``*``/ comments and avoid // comments.
> +We use traditional C-style ``/*`` ``*/`` comments and avoid ``//`` comme=
nts.
> =20
> -Rationale: The // form is valid in C99, so this is purely a matter of
> +Rationale: The ``//`` form is valid in C99, so this is purely a matter o=
f
>  consistency of style. The checkpatch script will warn you about this.
> =20
>  Multiline comment blocks should have a row of stars on the left,
> -and the initial /``*`` and terminating ``*``/ both on their own lines:
> +and the initial ``/*`` and terminating ``*/`` both on their own lines:
> =20
>  .. code-block:: c
> =20
> @@ -290,57 +290,57 @@ a few useful guidelines here.
>  Scalars
>  -------
> =20
> -If you're using "int" or "long", odds are good that there's a better typ=
e.
> -If a variable is counting something, it should be declared with an
> -unsigned type.
> +If you're using '``int``' or '``long``', odds are good that there's a be=
tter
> +type.  If a variable is counting something, it should be declared with a=
n
> +*unsigned* type.
> =20
> -If it's host memory-size related, size_t should be a good choice (use
> -ssize_t only if required). Guest RAM memory offsets must use ram_addr_t,
> +If it's host memory-size related, ``size_t`` should be a good choice (us=
e
> +``ssize_t`` only if required). Guest RAM memory offsets must use ``ram_a=
ddr_t``,
>  but only for RAM, it may not cover whole guest address space.
> =20
> -If it's file-size related, use off_t.
> -If it's file-offset related (i.e., signed), use off_t.
> -If it's just counting small numbers use "unsigned int";
> +If it's file-size related, use ``off_t``.
> +If it's file-offset related (i.e., signed), use ``off_t``.
> +If it's just counting small numbers use '``unsigned int``';
>  (on all but oddball embedded systems, you can assume that that
>  type is at least four bytes wide).
> =20
>  In the event that you require a specific width, use a standard type
> -like int32_t, uint32_t, uint64_t, etc.  The specific types are
> +like ``int32_t``, ``uint32_t``, ``uint64_t``, etc.  The specific types a=
re
>  mandatory for VMState fields.
> =20
> -Don't use Linux kernel internal types like u32, __u32 or __le32.
> +Don't use Linux kernel internal types like ``u32``, ``__u32`` or ``__le3=
2``.
> =20
> -Use hwaddr for guest physical addresses except pcibus_t
> -for PCI addresses.  In addition, ram_addr_t is a QEMU internal address
> +Use ``hwaddr`` for guest physical addresses except ``pcibus_t``
> +for PCI addresses.  In addition, ``ram_addr_t`` is a QEMU internal addre=
ss
>  space that maps guest RAM physical addresses into an intermediate
>  address space that can map to host virtual address spaces.  Generally
> -speaking, the size of guest memory can always fit into ram_addr_t but
> +speaking, the size of guest memory can always fit into ``ram_addr_t`` bu=
t
>  it would not be correct to store an actual guest physical address in a
> -ram_addr_t.
> +``ram_addr_t``.
> =20
>  For CPU virtual addresses there are several possible types.
> -vaddr is the best type to use to hold a CPU virtual address in
> +``vaddr`` is the best type to use to hold a CPU virtual address in
>  target-independent code. It is guaranteed to be large enough to hold a
>  virtual address for any target, and it does not change size from target
>  to target. It is always unsigned.
> -target_ulong is a type the size of a virtual address on the CPU; this me=
ans
> +``target_ulong`` is a type the size of a virtual address on the CPU; thi=
s means
>  it may be 32 or 64 bits depending on which target is being built. It sho=
uld
>  therefore be used only in target-specific code, and in some
>  performance-critical built-per-target core code such as the TLB code.
> -There is also a signed version, target_long.
> -abi_ulong is for the ``*``-user targets, and represents a type the size =
of
> -'void ``*``' in that target's ABI. (This may not be the same as the size=
 of a
> +There is also a signed version, ``target_long``.
> +``abi_ulong`` is for the ``*-user`` targets, and represents a type the s=
ize of
> +'``void *``' in that target's ABI. (This may not be the same as the size=
 of a
>  full CPU virtual address in the case of target ABIs which use 32 bit poi=
nters
> -on 64 bit CPUs, like sparc32plus.) Definitions of structures that must m=
atch
> +on 64 bit CPUs, like *sparc32plus*.) Definitions of structures that must=
 match
>  the target's ABI must use this type for anything that on the target is d=
efined
> -to be an 'unsigned long' or a pointer type.
> -There is also a signed version, abi_long.
> +to be an '``unsigned long``' or a pointer type.
> +There is also a signed version, ``abi_long``.
> =20
>  Of course, take all of the above with a grain of salt.  If you're about
> -to use some system interface that requires a type like size_t, pid_t or
> -off_t, use matching types for any corresponding variables.
> +to use some system interface that requires a type like ``size_t``, ``pid=
_t`` or
> +``off_t``, use matching types for any corresponding variables.
> =20
> -Also, if you try to use e.g., "unsigned int" as a type, and that
> +Also, if you try to use e.g., '``unsigned int``' as a type, and that
>  conflicts with the signedness of a related variable, sometimes
>  it's best just to use the *wrong* type, if "pulling the thread"
>  and fixing all related variables would be too invasive.
> @@ -352,9 +352,9 @@ casts, then reconsider or ask for help.
>  Pointers
>  --------
> =20
> -Ensure that all of your pointers are "const-correct".
> +Ensure that all of your pointers are "``const``-correct".
>  Unless a pointer is used to modify the pointed-to storage,
> -give it the "const" attribute.  That way, the reader knows
> +give it the '``const``' attribute.  That way, the reader knows
>  up-front that this is a read-only pointer.  Perhaps more
>  importantly, if we're diligent about this, when you see a non-const
>  pointer, you're guaranteed that it is used to modify the storage
> @@ -363,7 +363,7 @@ it points to, or it is aliased to another pointer tha=
t is.
>  Typedefs
>  --------
> =20
> -Typedefs are used to eliminate the redundant 'struct' keyword, since typ=
e
> +Typedefs are used to eliminate the redundant '``struct``' keyword, since=
 type
>  names have a different style than other identifiers ("CamelCase" versus
>  "snake_case").  Each named struct type should have a CamelCase name and =
a
>  corresponding typedef.
> @@ -462,8 +462,8 @@ QEMU provides other useful string functions:
>      int stristart(const char *str, const char *val, const char **ptr)
>      int qemu_strnlen(const char *s, int max_len)
> =20
> -There are also replacement character processing macros for isxyz and tox=
yz,
> -so instead of e.g. isalnum you should use qemu_isalnum.
> +There are also replacement character processing macros for ``isxyz`` and
> +``toxyz``, so instead of e.g. ``isalnum`` you should use ``qemu_isalnum`=
`.
>

(Looks like a repeat of a change in patch 1, but possibly a different locat=
ion)

isalnum() and qemu_isalnum()?

Thanks,

Darren.

