Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD4C47B20F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:25:31 +0100 (CET)
Received: from localhost ([::1]:55596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzMPh-0004YH-Fa
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:25:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mzKdJ-0007CS-5h
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:31:26 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:22654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mzKdC-00043l-Hx
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:31:23 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BK7U729031943; 
 Mon, 20 Dec 2021 08:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=5giPKrXkxDw3AT7NGkghpbUqCEepUnI7i2tCWQApas4=;
 b=nM+GKIcLkSfQT/15P/ZENguqSRyomxmb0osntgnpO6YsvqvWWMLeVF3kwLl3AiWB3TGw
 nG80TZrkxNQFXVrvaZpKFhwf0JHPDmN99rVZlaWIbSwI6pcK4TTzazZ/mqhTonn++xmp
 hD2MXdb/kOYPJOL5TI448EAhnbLKiAT1dHdAKyo5HZst6Z3aZGnCJbLSiX7x7h0QBuqK
 raCopgCXobD+U7USp5lnh8eBNhrn5wVrRY3SR3tTabsT9Ne/wE+gn7GIS3ePVAQOJDkC
 5PIdB1okV4c6agixsXRH7riYhbkIwerW7+MBjyxOZ7INs6rZQjzn8ehlEgp4SyxVTj+3 Bw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d186stp6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 08:02:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BK7uqSa046498;
 Mon, 20 Dec 2021 08:02:06 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by aserp3020.oracle.com with ESMTP id 3d17f296e3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 08:02:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RV3LS8ZFo6JekQjIpIynoiNKvnXg3UL8GENHqAbEcX9yNn21pdUTaoa/R77S06BUJNQqUHbddhRGv4qqHwoC5T/0+JZghdMjwqdjNhVmO1YkLJlwd/Vp1+t7O7xRnvSA5Eo++Nq7ySd1DLvhgi3me5QesNf6ZrCztnkZHmwbEp2MUmtKwklAzZeGUkSYn+JUu+aYztdxUECNH1HExQJSl52ryqJzdjjc72FPiTZlmLaNE6T+q4Gye/UhAV28L839IK5Y8+An4ZQ0phy91MBMc3I4BiaA/q9OmXJoY7B76GbY4Cq73E77u8mzaXVvolA4oNhq4gMZ+LYfhQKHLKtVfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5giPKrXkxDw3AT7NGkghpbUqCEepUnI7i2tCWQApas4=;
 b=TjYWCIdkUCVACyOthPamgLnCgbvsE0EQR4ACVCxpefDxIoy27QdhI3dXYVgifZP2iJ4osDKEoTN7rSHSrsvH9enwuKXB2MQRdyDCSlK0kgIqrionfYbHHSUws0ubcg+B6ZDpk7qo63utEs7f+UyllbdKWgxmUaMDkEU2J/JJDVXLj+G6Z6hy+y8rO7Yj9VLjWS9cl6WDrkgX/UIrvJcGrSQD0LkvUq/RuisjCGT+0DlfndI8RoG+KwpgK1WkFdJaeWGVn0YcYK+MGyq5uZ0JGI/EN1FZxIM/EcOLWH0doOcRLmvaTp8tTHVwg1Pb2ZrEgS0R2AkFf4riAi/g5VYaFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5giPKrXkxDw3AT7NGkghpbUqCEepUnI7i2tCWQApas4=;
 b=U0GPxyYlt8m1B69il8fJFLYH4BvW8FzHjXzBXweyWErvPVwbJKIsK84De6zXIm6nJRaBaPKnud/07eUZRRA0sAii8YFzonUyXJZs6D73QWTSLvVXPSEVlYGVmkDbdNuechvlS0Rrl3smS88zYQdLP2+7cJIrUtSXHDNmvrbaXa0=
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM6PR10MB2956.namprd10.prod.outlook.com (2603:10b6:5:69::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.20; Mon, 20 Dec
 2021 08:02:04 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::c517:d737:a012:1a0e]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::c517:d737:a012:1a0e%6]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 08:02:04 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC 1/2] migration: Introduce ram_transferred_add()
References: <20211216123420.1328937-1-david.edmondson@oracle.com>
 <20211216123420.1328937-2-david.edmondson@oracle.com>
 <1ecaa8aa-3b5c-ed91-3326-78376e4fe995@redhat.com>
Date: Mon, 20 Dec 2021 08:01:58 +0000
In-Reply-To: <1ecaa8aa-3b5c-ed91-3326-78376e4fe995@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 17 Dec 2021 20:09:12
 +0100")
Message-ID: <cuna6gvn1qh.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P123CA0077.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::10) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b90b9d44-0b3d-4927-5a41-08d9c38f026c
X-MS-TrafficTypeDiagnostic: DM6PR10MB2956:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB29560BA0D3C08559453ABD77887B9@DM6PR10MB2956.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sHK561s0umX7VyKHfpsaz3oNQvyA2VyyaBXhaASRy/S/JaVlvypDeCHwHBSsyiU7uShQ8bbOwoj3tZz912vEmHYDc0WHC8hIaKYjcQcRPeU3fGp2FPN/4BDsyK04inNBP9eKHIDuie/1aAj7EfyVlMCzzWokGKQNwEzbMAoNusEoU4qcR2R0XD3QYGD2uFWEAwMkj/GJsdjyJV4Rvpdcn/ANeLBEjvSbfHSekJgbV/TfPLTt5jo4oaRoQtLrfh0vxxS8ceojJzkl9/gdm3AGzkZiRTN3Nax13sTbfrWJNexKV1tGVOzRHq/DGeGSSwGbbT7Gf7QPJzMlKb+n52EVGNOkFuuLyr0U6VtmriwLo/iYbkmlPjJa8Q8BnmAbs5d2PpGAT13TD/AWTagFx1UAaR/hRZDhhUSKg8Es4i7qElvirO4j5tocAXnPtD4ABzdlvznawZLQE0K1lPmsGVAzJIDuHGstSC3ffFYNw35QucB7otqQ9MNbI5GwDIOcTMUYPkyKFU5maHA7xxyQ61GkRxqocEdqHy3SxbzF5rfT7PvuthEUcOFU2m2Z0MZFna+7QCXmT8rOw6CbV6YjdRaLTPFWOxDSPsJXUUQB0wwK86nLXkwMLRiHUEpyhfkw5Tqqe5asjQ3hFZfQ1dUFdPXl8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4001150100001)(38100700002)(54906003)(2906002)(316002)(508600001)(5660300002)(44832011)(4744005)(6666004)(4326008)(8676002)(53546011)(6506007)(6512007)(36756003)(186003)(86362001)(6916009)(6486002)(8936002)(52116002)(66476007)(2616005)(66556008)(83380400001)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHBHVS8xY2tJZFpHWnU1YVlxSnNyZ21NWWhrNG9hcVlIUXdrbHV5bTk4c2Z0?=
 =?utf-8?B?ZmNpdEVoajR2TG52QUxtTFc5Zzg3T1Nxb0h3aXdxZTdmMXpsSklkOHJnend0?=
 =?utf-8?B?VkhpVUFEZlRTdllsRkQ4K3dHdkRoWGhMNk1YOGsxZDA3alFjeGVuU00rWWU2?=
 =?utf-8?B?N0pFeG12OW1NUjJGUFZicE1QYTNXQjBUSzY5RDRmOSs2RUUydERrT1RkN203?=
 =?utf-8?B?cWN2MGxNb0gyRUhqWndPWEZ5NGdSSWdEekxwOG1GZ3RrQU9JZVZoVzVDRjR0?=
 =?utf-8?B?UTdaVkZxVzNMOEFxdDA2SUl6YTJobkttbDJyN1NQaG5zNktMU2RxcWlQd1pu?=
 =?utf-8?B?b2tObEZGMmQ2UWJsRG15ZElOekM5ZHgxcDJrV08vUFNWZ01SM1QvTXFlZTU0?=
 =?utf-8?B?UEdxdk1UZ3dXUlo0MVpGRDIxQzc1U1JoeGY4VUJxZDVtMXU2cm52N0lYZ2Vl?=
 =?utf-8?B?ckp2ZkVxQ1NCNTdIdFdvQnE2L0p2R2lmQ2s0TDVTL3pjMjdoaXR0cTlCTHhY?=
 =?utf-8?B?NDhhZTBtOElxNnJzYVdveGV3UFF3dXU3Y0t1RytnNFdHNXI1NnBHdFlmNEdZ?=
 =?utf-8?B?Yk01WkZ0b09xMEVNQ0M4NFZjZDhXQXZST25qYmJOSWpjVGc3Wk1hcElMQzd2?=
 =?utf-8?B?RlhjNjNuRTJoN20vUUpFZTJvL3ZrY1BYeTIxQkRUV1ZvQ3d5Tit6alJOOTVE?=
 =?utf-8?B?NFU4by9UMlU5UjZsV2d4bzlWWWZtYkpUN3g5UVdNVXlUVi9nUEpqRDZnYlhE?=
 =?utf-8?B?cGFJYjVqSFpHV0dIcHlsbXVpM3dLZ1p5aGJHL01hRiswVjd4ZHBtaEc4VTM2?=
 =?utf-8?B?Mk5HMXJHazZEZURCK21UYytlNHpYam1id2hKZ01sd2N5OEFlRnZLbTFuM0Ev?=
 =?utf-8?B?ZGs0bDNOSE50ems0REQ5VmpwVldmWktzR3cxZFhRTllWaklKcXZmUHlDQU16?=
 =?utf-8?B?UUVsdlB0MWFEcFVxNE5QeXRtSkpnNU5JejVwajJSY2dGdUpHZWFmc0luUXpO?=
 =?utf-8?B?aHRlcWgyVG1qZ1gzTVkwM3JSQnplMFJQT3ZoazJZLzZJRFl3YTBkb293Qjd3?=
 =?utf-8?B?YzhaYVFLTy9PWHlUMmFOaVp4c2VZK004a0hkS3ROWnFPQVc1elUwZ2swQnZi?=
 =?utf-8?B?QmlNR0tkS2VDSnR3ODZPejkranltWDl2bTh2cm5qYnFyQXgzNGRxRzQ4Q3RP?=
 =?utf-8?B?Y2Vvc0dZYVRyVGVWb0VsekwzbUptVGNXT0plTkJxZzRodGlORVU3cmRua0hY?=
 =?utf-8?B?ZHkyNnRFeTRIQUtXclZpN1R0TE9JMGI0Q2Y1Lzhpb290UzEyalAydkx6ZUZ6?=
 =?utf-8?B?bTBkMkg4Y0QraTdPOG1ocGFSY3ptRGtEdjY2TUw5alpLV0IrV3IvK2JpY3U1?=
 =?utf-8?B?ejBCNzlnTGo5K3U3dGdEZnJZajN3dmgxRVhoYWpVcWh3TXJaazI0dmNZa0hl?=
 =?utf-8?B?czF5NUJnMHZxMDFyT0hvQkQyVEpqNVZ1SVR3M3BGVHV1V0x1eXZteE5UYUo0?=
 =?utf-8?B?dllvckl1aXA1VktCTm8yczBEZUFlVzU0U1d5ck4vNno0UHdvdm9RL3Fzc1JK?=
 =?utf-8?B?WCs5ay94NmlYUlpBYkNnV2VHQXpnUmUxUkRmaGYzc1JBUlhhVjRFM0h0eDQ0?=
 =?utf-8?B?T3dPRzlEdERMbnNtWlZTemJNRFIzSTRWL0wwU3JVdzlwUDFtYVhoQk1UcUFR?=
 =?utf-8?B?ZC9IZFVGZnlObjFvRFBhalM2eWN1REFhcSt5cU9tb3JHb0hPNlJJMU56dmJU?=
 =?utf-8?B?aS9JZ0ZRY2ZRT3VoZXAxQXhVQWdJazFJdEl1UnM0K29UVzM5MmRlVW1GaXU1?=
 =?utf-8?B?Z2pNSW5VNGc3MzZ1R1JlNnZoL2lXMmNOaXJOL3YyaTRQUS9MMHVSTDgxNnBo?=
 =?utf-8?B?MWlVNEVVWlVPV29YS0FCN1hFTHlsalJoV2R3ejgwbHRPWDk4dXR0MVlYYlJC?=
 =?utf-8?B?dVA0UXRJYkRHWWR6Ui9lZmlDSTZIRjBmb2ltWFlCM2NVaFV1TFFOb3Z3ZXNY?=
 =?utf-8?B?dFltSTNyT2ZtakswOTV5dFl4eU8yeEl1cm01N3QvV1JjTlM3bkVnVTVHZDU1?=
 =?utf-8?B?WVZpYU9FSEpqR2pNQW05ZGp0dU16TG1ORXBoZWFXdDl5SW1ZaUErWDNyTHp6?=
 =?utf-8?B?NU50d3RWc08ycDVyREUyWjl6d3FNQkpHc09XTlJxQVI5TjNpUmNTcTBSbGZm?=
 =?utf-8?B?THU3MUwwNSt5WjdmM1JOaFdpbEJoT25BejJWcUQxYjNrM2JodUVvbEQvSXlz?=
 =?utf-8?B?YjFUNGlqQ1Z6QTAwQU9wRlNGZW1sVzBrYnZWdTFJMGNaK0dvQUc5eEN2ZUQ0?=
 =?utf-8?Q?5zE5jhGoPGhGmKRoft?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b90b9d44-0b3d-4927-5a41-08d9c38f026c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 08:02:03.9659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 57jFb2mIePeJgVb03OG254kCM//id1sl4ll2/zAhDoo5NGYww7JOCzeNy3LS8MXZrwSuEQWNXsUeYgE0B298w7NceGyJyTcD2x3K6RX3e7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2956
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10203
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112200046
X-Proofpoint-GUID: AZK2xvdTv5BaCeANnLUSORgClj6kx12w
X-Proofpoint-ORIG-GUID: AZK2xvdTv5BaCeANnLUSORgClj6kx12w
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Friday, 2021-12-17 at 20:09:12 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> On 12/16/21 13:34, David Edmondson wrote:
>> ...and use it.
>>=20
>> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
>> ---
>>  migration/ram.c | 23 ++++++++++++++---------
>>  migration/ram.h |  1 +
>>  2 files changed, 15 insertions(+), 9 deletions(-)
>
>> diff --git a/migration/ram.h b/migration/ram.h
>> index c515396a9a..a5b2ffdc18 100644
>> --- a/migration/ram.h
>> +++ b/migration/ram.h
>> @@ -51,6 +51,7 @@ int xbzrle_cache_resize(uint64_t new_size, Error **err=
p);
>>  uint64_t ram_bytes_remaining(void);
>>  uint64_t ram_bytes_total(void);
>>  void mig_throttle_counter_reset(void);
>> +void ram_transferred_add(uint64_t bytes);
>
> Why make the method public? It seems an internal operation. Do you
> plan to use it elsewhere?

No such plan. Will fix in v2.

dme.
--=20
We wanna wait, but here we go again.

