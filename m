Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2BB44D4F1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 11:21:03 +0100 (CET)
Received: from localhost ([::1]:35734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml7CY-0002I0-PH
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 05:21:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1ml7Aq-0001Tu-JT; Thu, 11 Nov 2021 05:19:16 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:41818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1ml7Ao-00037m-3L; Thu, 11 Nov 2021 05:19:16 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AB9fL2H010764; 
 Thu, 11 Nov 2021 10:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=EDR9mevCCTi/OrFAJfd9Ga7Il0O8Y0yYwOOb//exUQY=;
 b=nojTbhdFX6rO61NLCTHjW38KAybHVIisLoa6tvvH0mUY4TJ6BRZD9C7c4niuJxMirvKq
 AZXBxaz5J7GFUjOXz4tTnZMfTo2fFSnZ2+XNpDkcliXuDYJWjiejG1GOvKjYxwzzMpOE
 JNXr1UpRzkMguXb8JmRxcXR/aZukJeBRvQR/tOmbCshVNtfZyV1EKRB2ggx9Gmyw/niw
 Gi9QvppPgqzM8T4bW7zP8cF9u/6bNt+NkBVOQ8C4Encg/rNCjrobiV7pgbUEyNaX5yBD
 Cutm46DdiUdVsz/FS3PbGmeSQ4YmbDwEGOTLyNrKWlu/4lJlQrR7qNxtmpBTlaFVoFvU dg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c7yq7jsmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Nov 2021 10:18:58 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1ABABb9Y101951;
 Thu, 11 Nov 2021 10:18:56 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by userp3030.oracle.com with ESMTP id 3c842dn13u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Nov 2021 10:18:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7luiem0+V74SDMv4xxIihnYhxumXMmvigcuQdCsHz0tGNyaXkh4EEP32WL4EjTax/Hl6lf4m7V/G69+T/Py7In3mJsZLuZqmDszfOcgobOzRiuZ2RJsD9rd8u0HoefXPahQnAouKcX423C7kJFmEKVf+uW9OM2P2eP2V/R9IEWq5OqluzbnwwjrusP2wkmj5G2W+1E6WsqEu7+X/yXom1lJAPaSxc4KSFQtYF0x0SNydglvflIQNdCahkMnFKX3H1S+dLD7s9Jq6L/VETBXWATCmE5phv7Db1VqvStBbxaXHkcbfeCFjq8/uyucfOX59cnxE4kczyftwfeJQ4LADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDR9mevCCTi/OrFAJfd9Ga7Il0O8Y0yYwOOb//exUQY=;
 b=WqF1RT4AdxMGhjqubm8NfAsids0PzhkXOsB5eTvprRiL8zCuLX/RaxeriFbXI8M1FT+w8vh527JoqwyHW1etgJq7NNWdYWKw1NYSNpmefI9QFs9Lv6DiV0dzyt/Qd1DDxye/2zTMV7XrLxQSg7Q1VXzKj8LeRuoWHClGoCR2nph6fbdwbkWToTkRyEfu2jGIFN/ULanXIos7BrLIlh1z6ruJ/cJ8MMrMTmm7WvGOPc7Sszyel6UFC8pAdMumQLWcZyyWhL58vq7tGfY051ehZa9sC0NLLciHa/6U9GS6HJYpcIlB8WWL55736MbKHRObUBZjhtmv1p1qb3G6oBml3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDR9mevCCTi/OrFAJfd9Ga7Il0O8Y0yYwOOb//exUQY=;
 b=h0tjy9tXOvvECSMS4VhUGsNNaqNiqqT7k7b+zyWO4f+TiSs3WW2deRyPRLkoL3Nhwgnx83xLBoPHgUMNrF0teS+yTUgOVM7rkFD0FTIRO2fB33igjIcYDzdiQGL/B3m6FOQXXG4K+MVJpUHQ99zQgV+hikK2WVvt2wnWtrGu07I=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH7PR10MB5747.namprd10.prod.outlook.com (2603:10b6:510:127::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Thu, 11 Nov
 2021 10:18:53 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4669.016; Thu, 11 Nov 2021
 10:18:53 +0000
Content-Type: multipart/alternative;
 boundary="------------d3Os0ZJIiPbVZETHSMfdHyfJ"
Message-ID: <4bfacace-2cb4-9df9-8990-dce3a9a2d9ba@oracle.com>
Date: Thu, 11 Nov 2021 05:18:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 7/8] qmp: add QMP command x-query-virtio-queue-element
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
References: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
 <1636539792-20967-8-git-send-email-jonah.palmer@oracle.com>
 <87a6icw227.fsf@dusky.pond.sub.org>
From: Jonah Palmer <jonah.palmer@oracle.com>
In-Reply-To: <87a6icw227.fsf@dusky.pond.sub.org>
X-ClientProxiedBy: SA9PR11CA0005.namprd11.prod.outlook.com
 (2603:10b6:806:6e::10) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from [10.39.203.104] (209.17.40.41) by
 SA9PR11CA0005.namprd11.prod.outlook.com (2603:10b6:806:6e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.16 via Frontend Transport; Thu, 11 Nov 2021 10:18:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f516e6eb-73d9-4f19-adc0-08d9a4fca9a7
X-MS-TrafficTypeDiagnostic: PH7PR10MB5747:
X-Microsoft-Antispam-PRVS: <PH7PR10MB5747C9A32311584F9D415E38E8949@PH7PR10MB5747.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LYYDXKP4LOIAL1qSJISvP7FcxQdooY9ak0E2ov/AcmkAus4Hm/5kGH6buYIHwow7tLG0Dj4heMyWKVlc2gKagydyLiXgFGaI5ZONVvWJ9iZc6bLGYpdameRu6eeQVQ8yHVMBRC0O9Nm7H7Akzf/aY+C2R5VQRLr3UNrxaAsK9xfwj3L6vAkQSaPPfHhkB8PAKlq9vE+zZsz3e5XXlCiDrRufgKWAHYzxkFHmFUSeV2a3l36XfZkxgDA8bDbyCW/BGgA147LdJd7R4kIQ6oVQypkv4bUVvvHWcw335Fwyp43/Ng2HoUGmLeTrHTNOAtMLVC7CnXCx5UsQGcauXdQXaQNzT1J4JtyuEeko0fs9EaW27rZhAzaVMGa+3aOw999eC6bAc/b5iV+FaS8mK5O90cRlQjBvScvXlj1oXkCZ4bV8qaVsyfumOBoneOVU9eV9CdwrntB3OHtpSGm15CKupj/TgjtJ/1QRRwet3k+OSU5fMZwhv99n9NMtfjqVjvZzZfklPugy1cMLOjRE/HufVvapjXGGaR2sCKGAR2Vcncmb1lIkk26n3jJxDoLdcr2uQwiLaWssyZZEWruGhZyR2Cprxj3PHq37bkofAIslPhNoS0w69T6e4DwwtUEplsmF8Tm/yghxkdAD/I5mWtGJ0hHuE6K+n7BIJK7svHRYYdH1qG4bl5Pc4eI25TReBL80TflamueQaXVU/Pa98hhrqBZkHmELPLfKpB5wG2595me/bMuUQBz7ocLTmPGnoImn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(16576012)(4326008)(7416002)(26005)(44832011)(5660300002)(38100700002)(8936002)(508600001)(33964004)(8676002)(36756003)(86362001)(66476007)(66946007)(31686004)(2906002)(31696002)(6486002)(186003)(66556008)(6916009)(53546011)(2616005)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHd1cFlMV3QvQURQS1ZBVXZiZndWWTFDaWVZWW5ZLzNFR3RFU0JyTEp1THpq?=
 =?utf-8?B?YkIrZU5iRHVhanpkdEE2MXA4aHNtTSs1L2xNMHBmdTM4Qk5TaXJRVVVNM0NH?=
 =?utf-8?B?T3FVcU1ETHgyQU43cjNuU1A0KzZLVzk4RlRPaUxOR2dnTHNmUDJ6Ykx1djF0?=
 =?utf-8?B?TnZGT254dWp5blRjK0lwbWVZb09jTXlWMlhLcENkMUREUkdsYjhVbzJiQW10?=
 =?utf-8?B?bFRvenh6VjRickdCTkdzTlpJMTgraXFnNkJONThOZ3ExZDg4ZVoxaG9Db1Zn?=
 =?utf-8?B?UHkzalhRVnlQSUZoampYVk5aVUh4clFkd2ppUUI0VGxMamZaRXFLZWR4NDkr?=
 =?utf-8?B?WEFtYnNWeWcrWXBpa0lDYVE2akpXZEEzUWZCS3lQcG84L002SWIzMnhlZGZQ?=
 =?utf-8?B?YzVHTlVhRE9VTmFma3lGZngrUjdZL2VMNmw1OVJlb1Uyb3BLQ0t0OUhMZjRh?=
 =?utf-8?B?REx6MFo0bm0wR1o2ZERhVTRxMFF3MkxFL3g0Y2tQODQ0amgzT1NCTXlRNm1h?=
 =?utf-8?B?QXNhV3BIdG9JY1JhM0tLblFoeTF3cjNPZ1ExQ2YrbFlYNU5KeEdqTzBmMG5C?=
 =?utf-8?B?YVQrWXdDc2UzdkE5a2tOS3hudEdQSUpwa0w5VllVV205eEpFQ3Z3eDJGN3Z4?=
 =?utf-8?B?S0t2bTNrOVZOd1FYK25DZjEzcU1kTkhxYTdUd1ViSnBtdnI0NlpiNmtmMzhN?=
 =?utf-8?B?Z0lyWlJPWDBjdUVHRUNWU3RJeG10ZjNySlhHb1lwUEpxRTFWT1djRHBRU09t?=
 =?utf-8?B?K2o1bEN0cGttM0xkMERaNFJpVVduYjQ4NUFnbEZDMXpUUEJCTUUzdkk4SXE2?=
 =?utf-8?B?dER0UXFmSVpXYVpycDZUd2swMVlYenlUTUljaWJqQkxVUm9HMGF0QUVRcjZp?=
 =?utf-8?B?OHFTaG9paG9ubkdxV1NxZENEVjFISytVN1JQZ3VDVEtLd2tyY2RIaUMybTNS?=
 =?utf-8?B?UEVZV3Rmd0IxdUJYSm8rT0d0TEJjZ29zbDRRZXhKNkZxVUZHTkN4VVREYmNP?=
 =?utf-8?B?L1R5M096eXMySXFZMXZVbFQ5T2Z1SW9zR3B3RnlQaUxSSk5XUTVKazFxOWNv?=
 =?utf-8?B?ajk1eGZ2SUpiQlEyVFE5RXdhRW5CZ0ZBMUpDcDg1bVAzYWpvVWs0Zkt4dklW?=
 =?utf-8?B?VHlvaUs4WkpPTGpVMDhVTTlMcDg0MTRVN1ArT2NKbk1RTXc1UTY0YUtkQjFX?=
 =?utf-8?B?NWVBNjBNUjFZdzRqOTc2RWdkNDMrMTBSNDV3UHg4M3N0QWJnZEtaejRaOXRl?=
 =?utf-8?B?MTI1cWxiWllkMFYxVVJtUGo2cDlieFBFb2g3dis1SXVyQjk4Z296WmhVeEdX?=
 =?utf-8?B?NWFndTlVa3lCdzYyWHdaeXRGalRhU01ZNmNJLzkrYlBUT042VW13dC9RVFdy?=
 =?utf-8?B?U09kUVhFMld5bnNCQk9ZQys5RmRva2ZMYWtrcGVqNnFEdm80VVFPRkZldDdz?=
 =?utf-8?B?TXB0NnVqK0w4V3VUQVdpVzN2ZUpBb0FnMzNBOUJVV2oyT205VDlxK3Z2aFR4?=
 =?utf-8?B?MzhFT21NNkRuVDY1aDV5cEdUQW5OaEg2MGZGUkdQZW9kT1ZLNTRDaERqem5N?=
 =?utf-8?B?b0haKzduZ3JOTUJQanFhYWI4Nm9NZGU3dDF0czRFRmVuYjVTK3c0QlVvMVBY?=
 =?utf-8?B?TFdJbWUvaUVwdi9HTWYzeGVZd2lRbTZKSmswVGJ6VHJQV3ZxR3ZtNVUvZHVJ?=
 =?utf-8?B?RFRRMGgzRnZVZ2NXV0tGeHBWODk3MWVVTHJ2dzQ1Q0VkUzFVcnRiRGE1c0tz?=
 =?utf-8?B?OHBEd3hDOTBOTUo3M0NJQ2h0aUUyZkhIWTJGOEp3ZEU0YVJzdEo5MkJEaHJP?=
 =?utf-8?B?bXNjYkxDZXpZV21nL0syblZNNjJrUFdjRW8vMFM0c3NNbVZVNVZJM0hDZjMw?=
 =?utf-8?B?dWdnaVdPaldLeldzR1Exc2xHbWpjRTJHNDE5Z1d3V1VCT0UwNVBWNkJWU1l0?=
 =?utf-8?B?TXZHZG5qMFVFQjhOUmtFdTJBVFNEbDhpdmtybGhoRkkzRnllejY3bTZsaHRa?=
 =?utf-8?B?bnc3VWsrOVhrQXM0akd4OERwRHpEWk1NV3VqekZKWHVSTWNqUTR4alNuODNz?=
 =?utf-8?B?Q3gzY2g5SlhsaHFVYUdINFcrWTl0TmQ4Uk9hYWRBK01rR0RCcklseCtNQXVG?=
 =?utf-8?B?Z0RmOFB6eEhEblM3ZERpa09abFhsR1JrSUlGOWlwcmh1SjNUTVdpYkxUb2VH?=
 =?utf-8?Q?gKSspsbDCy+zsj5ou8uiIY4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f516e6eb-73d9-4f19-adc0-08d9a4fca9a7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 10:18:53.6679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5LqAZ1pusyTE+I4cTuvSwaLhHwb1OB4v91vwIeVngTSi8whjIivcC6js752bVC40rHIn5C7RzyNnHcXttwTSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5747
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10164
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111110061
X-Proofpoint-GUID: KC2ihLsWEx7BP6VM4OEk69CqxpPO-Fe4
X-Proofpoint-ORIG-GUID: KC2ihLsWEx7BP6VM4OEk69CqxpPO-Fe4
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 eblake@redhat.com, qemu-block@nongnu.org, david@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------d3Os0ZJIiPbVZETHSMfdHyfJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/10/21 08:52, Markus Armbruster wrote:
> Jonah Palmer<jonah.palmer@oracle.com>  writes:
>
>> From: Laurent Vivier<lvivier@redhat.com>
>>
>> This new command shows the information of a VirtQueue element.
>>
>> Signed-off-by: Jonah Palmer<jonah.palmer@oracle.com>
> [...]
>
>> diff --git a/qapi/virtio.json b/qapi/virtio.json
>> index 0f65044..c57fbc5 100644
>> --- a/qapi/virtio.json
>> +++ b/qapi/virtio.json
>> @@ -1061,3 +1061,180 @@
>>   { 'command': 'x-query-virtio-vhost-queue-status',
>>     'data': { 'path': 'str', 'queue': 'uint16' },
>>     'returns': 'VirtVhostQueueStatus', 'features': [ 'unstable' ] }
>> +
>> +##
>> +# @VirtioRingDescFlags:
>> +#
>> +# An enumeration of the virtio ring descriptor flags
>> +#
>> +# Since: 6.3
>> +#
>> +##
>> +
>> +{ 'enum': 'VirtioRingDescFlags',
>> +  'data': [ 'next', 'write', 'indirect', 'avail', 'used' ]
>> +}
>> +
>> +##
>> +# @VirtioRingDesc:
>> +#
>> +# Information regarding the VRing descriptor area
>> +#
>> +# @addr: guest physical address of the descriptor data
>> +#
>> +# @len: length of the descriptor data
>> +#
>> +# @flags: list of descriptor flags
>> +#
>> +# Since: 6.3
>> +#
>> +##
>> +
>> +{ 'struct': 'VirtioRingDesc',
>> +  'data': { 'addr': 'uint64',
>> +            'len': 'uint32',
>> +            'flags': [ 'VirtioRingDescFlags' ] } }
>> +
>> +##
>> +# @VirtioRingAvail:
>> +#
>> +# Information regarding the avail VRing (also known as the driver
>> +# area)
>> +#
>> +# @flags: VRingAvail flags
>> +#
>> +# @idx: VRingAvail index
>> +#
>> +# @ring: VRingAvail ring[] entry at provided index
>> +#
>> +# Since: 6.3
>> +#
>> +##
>> +
>> +{ 'struct': 'VirtioRingAvail',
>> +  'data': { 'flags': 'uint16',
>> +            'idx': 'uint16',
>> +            'ring': 'uint16' } }
>> +
>> +##
>> +# @VirtioRingUsed:
>> +#
>> +# Information regarding the used VRing (also known as the device
>> +# area)
>> +#
>> +# @flags: VRingUsed flags
>> +#
>> +# @idx: VRingUsed index
>> +#
>> +# Since: 6.3
>> +#
>> +##
>> +
>> +{ 'struct': 'VirtioRingUsed',
>> +  'data': { 'flags': 'uint16',
>> +            'idx': 'uint16' } }
>> +
>> +##
>> +# @VirtioQueueElement:
>> +#
>> +# Information regarding a VirtQueue VirtQueueElement including
>> +# descriptor, driver, and device areas
>> +#
>> +# @device-name: name of the VirtIODevice which this VirtQueue belongs
>> +#               to (for reference)
>> +#
>> +# @index: index of the element in the queue
>> +#
>> +# @ndescs: number of descriptors
>> +#
>> +# @descs: list of the descriptors
> Can @ndescs ever be not equal to the length of @descs?
>
> If no, it's redundant.

I don't believe so, no. Should I just remove @ndescs then?


Jonah

>> +#
>> +# @avail: VRingAvail info
>> +#
>> +# @used: VRingUsed info
>> +#
>> +# Since: 6.3
>> +#
>> +##
>> +
>> +{ 'struct': 'VirtioQueueElement',
>> +  'data': { 'device-name': 'str',
>> +            'index': 'uint32',
>> +            'ndescs': 'uint32',
>> +            'descs': [ 'VirtioRingDesc' ],
>> +            'avail': 'VirtioRingAvail',
>> +            'used': 'VirtioRingUsed' } }
>> +
>> +##
>> +# @x-query-virtio-queue-element:
>> +#
>> +# Return the information about a VirtQueue VirtQueueElement (by
>> +# default looks at the head of the queue)
>> +#
>> +# @path: VirtIODevice canonical QOM path
>> +#
>> +# @queue: VirtQueue index to examine
>> +#
>> +# @index: the index in the queue, by default head
>> +#
>> +# Features:
>> +# @unstable: This command is meant for debugging.
>> +#
>> +# Returns: VirtioQueueElement information
>> +#
>> +# Since: 6.3
>> +#
>> +# Examples:
>> +#
>> +# 1. Introspect on virtio-net virtqueue 0 at index 5
>> +#
>> +# -> { "execute": "x-query-virtio-queue-element",
>> +#      "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend",
>> +#                     "queue": 0,
>> +#                     "index": 5 }
>> +#    }
>> +# <- { "return": {
>> +#         "index": 5,
>> +#         "ndescs": 1,
>> +#         "device-name": "virtio-net",
>> +#         "descs": [ { "flags": ["write"], "len": 1536, "addr": 5257305600 } ],
>> +#         "avail": { "idx": 256, "flags": 0, "ring": 5 },
>> +#         "used": { "idx": 13, "flags": 0 } }
>> +#    }
>> +#
>> +# 2. Introspect on virtio-crypto virtqueue 1 at head
>> +#
>> +# -> { "execute": "x-query-virtio-queue-element",
>> +#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend",
>> +#                     "queue": 1 }
>> +#    }
>> +# <- { "return": {
>> +#         "index": 0,
>> +#         "ndescs": 1,
>> +#         "device-name": "virtio-crypto",
>> +#         "descs": [ { "flags": [], "len": 0, "addr": 8080268923184214134 } ],
>> +#         "avail": { "idx": 280, "flags": 0, "ring": 0 },
>> +#         "used": { "idx": 280, "flags": 0 } }
>> +#    }
>> +#
>> +# 3. Introspect on virtio-scsi virtqueue 2 at head
>> +#
>> +# -> { "execute": "x-query-virtio-queue-element",
>> +#      "arguments": { "path": "/machine/peripheral-anon/device[2]/virtio-backend",
>> +#                     "queue": 2 }
>> +#    }
>> +# <- { "return": {
>> +#         "index": 19,
>> +#         "ndescs": 1,
>> +#         "device-name": "virtio-scsi",
>> +#         "descs": [ { "flags": ["used", "indirect", "write"], "len": 4099327944,
>> +#                      "addr": 12055409292258155293 } ],
>> +#         "avail": { "idx": 1147, "flags": 0, "ring": 19 },
>> +#         "used": { "idx": 1147, "flags": 0 } }
>> +#    }
>> +#
>> +##
>> +
>> +{ 'command': 'x-query-virtio-queue-element',
>> +  'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
>> +  'returns': 'VirtioQueueElement', 'features': [ 'unstable' ] }
--------------d3Os0ZJIiPbVZETHSMfdHyfJ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/10/21 08:52, Markus Armbruster
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87a6icw227.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>

This new command shows the information of a VirtQueue element.

Signed-off-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
[...]

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/qapi/virtio.json b/qapi/virtio.json
index 0f65044..c57fbc5 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -1061,3 +1061,180 @@
 { 'command': 'x-query-virtio-vhost-queue-status',
   'data': { 'path': 'str', 'queue': 'uint16' },
   'returns': 'VirtVhostQueueStatus', 'features': [ 'unstable' ] }
+
+##
+# @VirtioRingDescFlags:
+#
+# An enumeration of the virtio ring descriptor flags
+#
+# Since: 6.3
+#
+##
+
+{ 'enum': 'VirtioRingDescFlags',
+  'data': [ 'next', 'write', 'indirect', 'avail', 'used' ]
+}
+
+##
+# @VirtioRingDesc:
+#
+# Information regarding the VRing descriptor area
+#
+# @addr: guest physical address of the descriptor data
+#
+# @len: length of the descriptor data
+#
+# @flags: list of descriptor flags
+#
+# Since: 6.3
+#
+##
+
+{ 'struct': 'VirtioRingDesc',
+  'data': { 'addr': 'uint64',
+            'len': 'uint32',
+            'flags': [ 'VirtioRingDescFlags' ] } }
+
+##
+# @VirtioRingAvail:
+#
+# Information regarding the avail VRing (also known as the driver
+# area)
+#
+# @flags: VRingAvail flags
+#
+# @idx: VRingAvail index
+#
+# @ring: VRingAvail ring[] entry at provided index
+#
+# Since: 6.3
+#
+##
+
+{ 'struct': 'VirtioRingAvail',
+  'data': { 'flags': 'uint16',
+            'idx': 'uint16',
+            'ring': 'uint16' } }
+
+##
+# @VirtioRingUsed:
+#
+# Information regarding the used VRing (also known as the device
+# area)
+#
+# @flags: VRingUsed flags
+#
+# @idx: VRingUsed index
+#
+# Since: 6.3
+#
+##
+
+{ 'struct': 'VirtioRingUsed',
+  'data': { 'flags': 'uint16',
+            'idx': 'uint16' } }
+
+##
+# @VirtioQueueElement:
+#
+# Information regarding a VirtQueue VirtQueueElement including
+# descriptor, driver, and device areas
+#
+# @device-name: name of the VirtIODevice which this VirtQueue belongs
+#               to (for reference)
+#
+# @index: index of the element in the queue
+#
+# @ndescs: number of descriptors
+#
+# @descs: list of the descriptors
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Can @ndescs ever be not equal to the length of @descs?

If no, it's redundant.
</pre>
    </blockquote>
    <pre>I don't believe so, no. Should I just remove @ndescs then?


Jonah
</pre>
    <blockquote type="cite" cite="mid:87a6icw227.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#
+# @avail: VRingAvail info
+#
+# @used: VRingUsed info
+#
+# Since: 6.3
+#
+##
+
+{ 'struct': 'VirtioQueueElement',
+  'data': { 'device-name': 'str',
+            'index': 'uint32',
+            'ndescs': 'uint32',
+            'descs': [ 'VirtioRingDesc' ],
+            'avail': 'VirtioRingAvail',
+            'used': 'VirtioRingUsed' } }
+
+##
+# @x-query-virtio-queue-element:
+#
+# Return the information about a VirtQueue VirtQueueElement (by
+# default looks at the head of the queue)
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: VirtQueue index to examine
+#
+# @index: the index in the queue, by default head
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtioQueueElement information
+#
+# Since: 6.3
+#
+# Examples:
+#
+# 1. Introspect on virtio-net virtqueue 0 at index 5
+#
+# -&gt; { &quot;execute&quot;: &quot;x-query-virtio-queue-element&quot;,
+#      &quot;arguments&quot;: { &quot;path&quot;: &quot;/machine/peripheral-anon/device[1]/virtio-backend&quot;,
+#                     &quot;queue&quot;: 0,
+#                     &quot;index&quot;: 5 }
+#    }
+# &lt;- { &quot;return&quot;: {
+#         &quot;index&quot;: 5,
+#         &quot;ndescs&quot;: 1,
+#         &quot;device-name&quot;: &quot;virtio-net&quot;,
+#         &quot;descs&quot;: [ { &quot;flags&quot;: [&quot;write&quot;], &quot;len&quot;: 1536, &quot;addr&quot;: 5257305600 } ],
+#         &quot;avail&quot;: { &quot;idx&quot;: 256, &quot;flags&quot;: 0, &quot;ring&quot;: 5 },
+#         &quot;used&quot;: { &quot;idx&quot;: 13, &quot;flags&quot;: 0 } }
+#    }
+#
+# 2. Introspect on virtio-crypto virtqueue 1 at head
+#
+# -&gt; { &quot;execute&quot;: &quot;x-query-virtio-queue-element&quot;,
+#      &quot;arguments&quot;: { &quot;path&quot;: &quot;/machine/peripheral/crypto0/virtio-backend&quot;,
+#                     &quot;queue&quot;: 1 }
+#    }
+# &lt;- { &quot;return&quot;: {
+#         &quot;index&quot;: 0,
+#         &quot;ndescs&quot;: 1,
+#         &quot;device-name&quot;: &quot;virtio-crypto&quot;,
+#         &quot;descs&quot;: [ { &quot;flags&quot;: [], &quot;len&quot;: 0, &quot;addr&quot;: 8080268923184214134 } ],
+#         &quot;avail&quot;: { &quot;idx&quot;: 280, &quot;flags&quot;: 0, &quot;ring&quot;: 0 },
+#         &quot;used&quot;: { &quot;idx&quot;: 280, &quot;flags&quot;: 0 } }
+#    }
+#
+# 3. Introspect on virtio-scsi virtqueue 2 at head
+#
+# -&gt; { &quot;execute&quot;: &quot;x-query-virtio-queue-element&quot;,
+#      &quot;arguments&quot;: { &quot;path&quot;: &quot;/machine/peripheral-anon/device[2]/virtio-backend&quot;,
+#                     &quot;queue&quot;: 2 }
+#    }
+# &lt;- { &quot;return&quot;: {
+#         &quot;index&quot;: 19,
+#         &quot;ndescs&quot;: 1,
+#         &quot;device-name&quot;: &quot;virtio-scsi&quot;,
+#         &quot;descs&quot;: [ { &quot;flags&quot;: [&quot;used&quot;, &quot;indirect&quot;, &quot;write&quot;], &quot;len&quot;: 4099327944,
+#                      &quot;addr&quot;: 12055409292258155293 } ],
+#         &quot;avail&quot;: { &quot;idx&quot;: 1147, &quot;flags&quot;: 0, &quot;ring&quot;: 19 },
+#         &quot;used&quot;: { &quot;idx&quot;: 1147, &quot;flags&quot;: 0 } }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-queue-element',
+  'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
+  'returns': 'VirtioQueueElement', 'features': [ 'unstable' ] }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>
--------------d3Os0ZJIiPbVZETHSMfdHyfJ--

