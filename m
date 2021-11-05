Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCB14460FB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 10:00:04 +0100 (CET)
Received: from localhost ([::1]:41864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miv4s-00016I-P2
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 05:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1miv3j-0000GV-RR; Fri, 05 Nov 2021 04:58:51 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:32322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1miv3h-0008DG-19; Fri, 05 Nov 2021 04:58:51 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A58loxt032448; 
 Fri, 5 Nov 2021 08:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=rSNEFyC/IuPW0nONnFJfK2CkarDGL30Yt1l3Qx35F1o=;
 b=h2uCEeSMHTkYzv2awaM/aSvoWieQNwBMHtkwm6P17jNHPBh6Eq332q5a2HxSdxgcSvYS
 dBiwWFMwmSpJPqz1QMgJyAkWqasd7+56CX6vIfPebWNIoQr5ASiTrQ/L3ofIVLu/jGl2
 z3WnTzhgyBKimT0hwYBUl1NRO6Mo1RGS4oYvh+hWnjH+/eaSmsylLZipdW1iiVUh/YpU
 ZmuLBhCYFezxo5OeOMbAimXAWQhnfJV0LAOAc39ef2DSFbd6BT8bnojkuXBbVMEdSA4U
 scPyI26sEJ1SDkFDqJa0Ofx4AM60ZYx6g5STSfK4+sq5TL4NbZkyX0feojLrtyPBOT0W lg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c4t7q1f0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Nov 2021 08:58:29 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A58tlHT096922;
 Fri, 5 Nov 2021 08:58:13 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by aserp3030.oracle.com with ESMTP id 3c4t5ndmf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Nov 2021 08:58:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xf0LNNh54+jf4D42tzc7j8pB8SdUJsAcRenz01vaW52WiRSBbN5mPV/rdcgOv+kZWU3fc3Xtc4qTa6f1i1JYEvaMbBQRJT+NEenm48t3fodXUUSh2befsLhm0EQkACjFlsl71fe0PaV1gXEqEQU9scWlp9m/QwmVhmf4xfFW1hWV+GLzQGY7opFH3uLCtmOYVhz2ij0wYCo9Fqf4XL5BDReSfDm2xZlj1XDo0dYXTjo2sKLDoziVd1zjdecNmjZ/DwJOfzTK3RHGtHXDhMlcsBNjbWYPOaBHyosAlkSeAvaZPxqNAzdSjkr3iE8HMfxPkIII+vff0c+VJAvLi5pTxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSNEFyC/IuPW0nONnFJfK2CkarDGL30Yt1l3Qx35F1o=;
 b=lICEdLsta8pahln76nP+foCzG0VmuQsUyXsIa4lzF3yR+niLR4EsdBQj8lV786XWUe41pfikC+AyLiV1SfhjZqjWY9nXFaavY5HH3xa5qR5SOPDV45GLnJMLG+wcGYu//2MuCJ0geAF1SXXu9rMb0UU5NmHr1xK09FEW18QZ+QS42j9TDs2gIA+Z90qq1UnF8TWmOO6WN5lSG4MN0ZiiGElObG9Aln0koHzhy3VB4GPApCei0LpciJ1+A6Frz1v0Bg2SUXT+72VmXA0Y/44l6qFLCYN13Ze1J8zNLYJ4aojhtkBEZIlv9yL9QVA48dXoEtV97ZFlken5U+EEwIpNlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSNEFyC/IuPW0nONnFJfK2CkarDGL30Yt1l3Qx35F1o=;
 b=FkMpZmYeUiIpNvIvxABbmwEhevQ9C/mn0wfPM/q6ZmuO8AW3pgFEGQEMyeuL6joevni5Li40QlAXscJR9k01MSpYtu09e2GD3xsOaS2VkY4oB9tjpKPhdhMDYlh8tskf0+i/4Hj6CAOIm6qZhsHFjWjvFoE7J48oOcIuh02CKcc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from SA2PR10MB4667.namprd10.prod.outlook.com (2603:10b6:806:111::21)
 by SN4PR10MB5640.namprd10.prod.outlook.com (2603:10b6:806:20b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Fri, 5 Nov
 2021 08:58:11 +0000
Received: from SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::6092:9e8:aa36:f263]) by SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::6092:9e8:aa36:f263%7]) with mapi id 15.20.4669.011; Fri, 5 Nov 2021
 08:58:11 +0000
Content-Type: multipart/alternative;
 boundary="------------4331eUH1CeT4Goc1Vxe90NpJ"
Message-ID: <3e8d3872-b662-ed76-73b3-85b4b9270a2e@oracle.com>
Date: Fri, 5 Nov 2021 04:58:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 0/8] hmp, qmp: Add commands to introspect virtio devices
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
 <YXk+JvPuOglFoerz@redhat.com> <87bl2z5ahj.fsf@dusky.pond.sub.org>
From: Jonah Palmer <jonah.palmer@oracle.com>
In-Reply-To: <87bl2z5ahj.fsf@dusky.pond.sub.org>
X-ClientProxiedBy: SA0PR11CA0115.namprd11.prod.outlook.com
 (2603:10b6:806:d1::30) To SA2PR10MB4667.namprd10.prod.outlook.com
 (2603:10b6:806:111::21)
MIME-Version: 1.0
Received: from [10.39.215.155] (209.17.40.45) by
 SA0PR11CA0115.namprd11.prod.outlook.com (2603:10b6:806:d1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Fri, 5 Nov 2021 08:58:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9184ce8-64ef-4117-2ea0-08d9a03a64d3
X-MS-TrafficTypeDiagnostic: SN4PR10MB5640:
X-Microsoft-Antispam-PRVS: <SN4PR10MB5640A83AE53765335E0D5683E88E9@SN4PR10MB5640.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8A9i3F1ZSqmJIKTVx0YRvSLZqY9w5TBS9Fl2MxzouRb2z+g5heziQGpNHcKSPVelHRAAopOVE1RQLUrASbYJP+058DvbsUaKwxUSm4zqDKGL+50qAn8iu2sCM0maugWxuVGuE+jqBKuZtk6QsY4IZT9SH51eagwu2JWT2X4DcO1cl6Z+ewJGMt5dFNxJpS8uYMPIndNtZYvNjuyEe70caRBNS02yK1q80v86Dv/JiFoAS/7caXU6lzG/RJOojMibcOSdK3pEUThKLoRIGcjLmjWsDguKiOfIgGtaRh+S9Dfg1ZEzfgpvm/47G7Zg/BJjimUXY40hun+AEn12r8+696iCC7ESich37D7H/lSa6fSu6rLmJU7ysi88gMFrfnjaAfgvMX75cNrZf8lbAandnwu3VYJXlgJLP6VIZrh8WYB5Koc6fbgUfwI7jmCsHvon/41cVYgG8jQ43g4QBj/5wcHVN/+x4zYhNZZhpAuTZEe/3uWAtUKgIocTrk/cwpUx4xPrJIGM9U/Qo6IfBxCx+/Jje8zSYwACAQ2INMxtVDfrWFvI9Xdk/m+tQNi0VhAKajBBkAFNZa8ArygWGHBAAdLISrRmbGK8cQP+yUi0v2ljMnAXOyUhmJR1r2yM7qfGD3rnveETP5TjHW/0HX6VBLXT9TC23KfmKdlMXF+R2LgKRzIUn3/hVCSleP9OXb0TQsBTTPMyN8j3bFPGc9iHjCAuZ8mbuSyICRx+7YLTyg0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4667.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(44832011)(4326008)(2616005)(956004)(8676002)(110136005)(8936002)(6486002)(16576012)(2906002)(31686004)(33964004)(7416002)(316002)(186003)(26005)(508600001)(53546011)(66556008)(86362001)(66946007)(66476007)(5660300002)(36756003)(38100700002)(31696002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N25CQ21HQm01c1djNVM0dWJhb3UrOFM0Tnh1ZkhybmdmK2RBKzFEZEtCZklB?=
 =?utf-8?B?d2M1UHk5U1ZCdXA3YVhKcENJdWc4Nnd0RTczZURvVTBkeTVwRWFycFN0TDYv?=
 =?utf-8?B?L3lTd3BhcDI0SStnb3ZDdEhOVEF6WUdHMjdEaDY0b2VyNU9oSVlGVTk3aHNl?=
 =?utf-8?B?Z0RvUWNLOGkwSWMydGZIeHFhZFZLbHprYngrRWsrSkZvYy9QRFk5VWhucWRz?=
 =?utf-8?B?ZGhvQld0ODJINy9NcmVsdXRjbXl4eG9CdHdyOHhUT1hNdmVTTS9oZzFDa0ov?=
 =?utf-8?B?SGk2TzI3UzNHRUZIa3VsY0hqa0RoNW9GSFVqT0s4L255K1NBU01mb1RDUkJj?=
 =?utf-8?B?TlROWFNVRTh0ZmJyVGdZY011c2k3QzJ0d3RwOFlKL0NpSndXWlQrb0RWazBC?=
 =?utf-8?B?cUNWNTRuYTlSK0w2N2NkQnA4ZUpBanFvYWM1OVE2V1FXNFdyaDAwbHcyZEFx?=
 =?utf-8?B?SHQ5Y0VMRUpIVlc4OXJpNU5nUTBxaHBGUnFjeHBLMnhVVHhOL3ZKQm42aFpQ?=
 =?utf-8?B?V3poV0lqcEdNM0ZHcDVQbjFVWG1FR3NkS3NLcnZpUTFGeGs5djVaQ0RBb0NP?=
 =?utf-8?B?Wm9NejRMbkZid2hQSVZxeFFOZ2pVVlZnb3NnMFNkSmdNOHlDWjVCUyt4cjdn?=
 =?utf-8?B?YXIzN1F6elVSSGQwM1JCd3Y5Y2k2Y2lQNzB1SmVQOTVNZ3hrZHZvVFRRVGZM?=
 =?utf-8?B?NlJXbFQxR2F0TkZWT1pBZy9EekJuTXR3VHQ5OUF4TjlIdURHbFBFMEVjcW9B?=
 =?utf-8?B?ZDFvSStKa0ttcVZnOVVmU0pYSVQ4bEdRTGNsb2ptNlBQbytUN0xlUGRXSVRR?=
 =?utf-8?B?ZU9WdmQ2a1NreC9EN0c0NGdTU0grbmJmdzRlWjRCWGFyNmtmampvMkhTakJo?=
 =?utf-8?B?S0IwaWtuNUZQaCsyazdhZElPRkxmdzFJWi9LL0I2RzBvUW1wU0RyMGpiWWxT?=
 =?utf-8?B?alFDdGp4UmhHMEZTbmdWOWJPM0tUTVZsTXB6UWw1WkZDSEdvek1GaUpnSDJC?=
 =?utf-8?B?QWV5TVVUUzh0QUlWL1RobzMzbnN1Y1hTa2VGK2hnRGZ0Q0d2YU8wNTNYazll?=
 =?utf-8?B?azJsL3NlU1ZaeU9nR2tjZm5hbmtnYThkMnBsY1FvbStKb3I5ZmxxOXFNRnJL?=
 =?utf-8?B?M3FCWGJPYndlT0M5b1JkcHVCcHpzcU5lLytZbjNQZ200M3JYSXAwWkR5L0FM?=
 =?utf-8?B?di96MTdUd2tKK0pwUUtQSk1GTnR4UUhGZzloNkNicHk2NklTVjRDNlYwRjBT?=
 =?utf-8?B?eVFqK3A1YnJZSXcvMjZqdFV3ZDQzam02SW1uYW5aTE8rMzBSQTdmYllLdGo1?=
 =?utf-8?B?U1JmcWxLY1prNW43R0lJMTBDa1hiV2xRemV1eHhERFI2QVF4bzJUTjYzOGdt?=
 =?utf-8?B?S3dTMENxUDByNlFGMDQya2tkMVZJQSt0ZnZjaXdnNDM4Mjc2MkdTbVluMkVK?=
 =?utf-8?B?TlZkTHkraEFNcDcvNUhQTG9FR3NoNmlvVEt6ekpTT1RnU3A4L1NodFhJSDBw?=
 =?utf-8?B?YmNzcm9RVG1YRHpNTC96eUJtWDFkTjFnVHRzQ3lpUTNCaUdJem9iQnhQdnQ5?=
 =?utf-8?B?b3lmTjJ1bGU4ejNEUGw1MUgweDRic3Y1QUROc3IzVzlEZ3RWSWt1ZnhkdXNH?=
 =?utf-8?B?V3VRT2pXV1RaTmhWREFqNzQ3N3MzNmFyV0hlQ0kyVXRqRmh6T3IwUW9UZlJt?=
 =?utf-8?B?N1N1cERJdThoamZMOUt2aDR2ME90Y1lGdXVBdU9ja01COFQwR2tmQm4yTUJU?=
 =?utf-8?B?ZVVFdmkwbWhhQWJyNmlFKzJ2WlZ0N01JL2diSjJhVGpYOG9UdVNPWm1xV3I0?=
 =?utf-8?B?Y1hHcXZ0QUYvVXFDc1N0TmJqUzdOV0IweXc0K0Q1R3l3OHlFWldsTHc0aTdB?=
 =?utf-8?B?aEVpTU8vRXZ2RGgzYzVHRkE5b2tNZSt3RmJrYWxmUTFyZXhFNGx2d0Jmakhi?=
 =?utf-8?B?WE80V0lrSE85citldEtOMUZHMTRzckRrbktjeVFIQkRLczJtd1QwRUQwenRQ?=
 =?utf-8?B?K0YzOTgzQmZlNHRJOEI1TVZidS9yVzE5VlV0OUpKSnZDSTJWb0Y2ZFA4K2hz?=
 =?utf-8?B?ZTVWbnM4YStZd2JuSjVZTkVuNWx2M2trNEtIMzlRTDNFU0s0YnFBYVVOcXAr?=
 =?utf-8?B?d2ZrclpzbGVsZFI2OGxrM1ZUTXVxaWFDck1aNWxkVEdIbDR1NDdzTFVMY3Ev?=
 =?utf-8?Q?mwmLNVF3uP9rC49AujkrHFA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9184ce8-64ef-4117-2ea0-08d9a03a64d3
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4667.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 08:58:11.1188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzhHC2Q+IV1YogkrCJbY8veqjCZAANxuWHp75o7+DQ4JGnbzSdyd/64lxjFwweGMAK3V23kKxdvBr7IqIi+j1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5640
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10158
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111050052
X-Proofpoint-GUID: fbYrBc3lWOYFgrU7lmEyKdoaP-Bx3cb1
X-Proofpoint-ORIG-GUID: fbYrBc3lWOYFgrU7lmEyKdoaP-Bx3cb1
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7,
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

--------------4331eUH1CeT4Goc1Vxe90NpJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/5/21 03:26, Markus Armbruster wrote:
> Daniel P. Berrangé<berrange@redhat.com>  writes:
>
>> On Wed, Oct 27, 2021 at 07:41:41AM -0400, Jonah Palmer wrote:
>>> This series introduces new QMP/HMP commands to dump the status of a
>>> virtio device at different levels.
>>>
>>> [Jonah: Rebasing previous patchset from Oct. 5 (v7). Original patches
>>>   are from Laurent Vivier from May 2020.
>>>
>>>   Rebase from v7 to v8 includes an additional assert to make sure
>>>   we're not returning NULL in virtio_id_to_name(). Rebase also
>>>   includes minor additions/edits to qapi/virtio.json.]
>>>
>>> 1. Main command
>>>
>>> HMP Only:
>>>
>>>      virtio [subcommand]
>>>
>>>      Example:
>>>
>>>          List all sub-commands:
>>>
>>>          (qemu) virtio
>>>          virtio query  -- List all available virtio devices
>>>          virtio status path -- Display status of a given virtio device
>>>          virtio queue-status path queue -- Display status of a given virtio queue
>>>          virtio vhost-queue-status path queue -- Display status of a given vhost queue
>>>          virtio queue-element path queue [index] -- Display element of a given virtio queue
>> I don't see a compelling reason why these are setup as sub-commands
>> under a new "virtio" top level. This HMP approach and the QMP 'x-debug-query'
>> naming just feels needlessly different from the current QEMU practices.
>>
>> IMHO they should just be "info" subcommands for HMP. ie
>>
>>           info virtio  -- List all available virtio devices
>>           info virtio-status path -- Display status of a given virtio device
>>           info virtio-queue-status path queue -- Display status of a given virtio queue
>>           info virtio-vhost-queue-status path queue -- Display status of a given vhost queue
>>           info virtio-queue-element path queue [index] -- Display element of a given virtio queue
> I agree with Dan (but I'm not the maintainer).

I do like this format a bit better than Dave's recommendation. Feels a bit
more intuitive to understand what the commands should be doing, but I'm
not sure if this is just because I'm new to these things.

I'd like to format it like above if that's okay.

>
>> While the corresponding QMP commands ought to be
>>
>>           x-query-virtio
>>           x-query-virtio-status
>>           x-query-virtio-queue-status
>>           x-query-virtio-vhost-queue-status
>>           x-query-virtio-queue-element
> I agree with Dan (and I am the maintainer).
>
> The x- is not strictly required anymore (see commit a3c45b3e62 'qapi:
> New special feature flag "unstable"').  I lean towards keeping it here,
> because we don't plan to stabilize these commands.

Ok! I'll keep the 'x-' in and change them to the above.

Thank you for the comments!!

Jonah

--------------4331eUH1CeT4Goc1Vxe90NpJ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/5/21 03:26, Markus Armbruster
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87bl2z5ahj.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">Daniel P. Berrangé <a class="moz-txt-link-rfc2396E" href="mailto:berrange@redhat.com">&lt;berrange@redhat.com&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Wed, Oct 27, 2021 at 07:41:41AM -0400, Jonah Palmer wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">This series introduces new QMP/HMP commands to dump the status of a
virtio device at different levels.

[Jonah: Rebasing previous patchset from Oct. 5 (v7). Original patches
 are from Laurent Vivier from May 2020.

 Rebase from v7 to v8 includes an additional assert to make sure
 we're not returning NULL in virtio_id_to_name(). Rebase also
 includes minor additions/edits to qapi/virtio.json.]

1. Main command

HMP Only:

    virtio [subcommand]

    Example:

        List all sub-commands:

        (qemu) virtio
        virtio query  -- List all available virtio devices
        virtio status path -- Display status of a given virtio device
        virtio queue-status path queue -- Display status of a given virtio queue
        virtio vhost-queue-status path queue -- Display status of a given vhost queue
        virtio queue-element path queue [index] -- Display element of a given virtio queue
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I don't see a compelling reason why these are setup as sub-commands
under a new &quot;virtio&quot; top level. This HMP approach and the QMP 'x-debug-query'
naming just feels needlessly different from the current QEMU practices.

IMHO they should just be &quot;info&quot; subcommands for HMP. ie

         info virtio  -- List all available virtio devices
         info virtio-status path -- Display status of a given virtio device
         info virtio-queue-status path queue -- Display status of a given virtio queue
         info virtio-vhost-queue-status path queue -- Display status of a given vhost queue
         info virtio-queue-element path queue [index] -- Display element of a given virtio queue
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I agree with Dan (but I'm not the maintainer).</pre>
    </blockquote>
    <pre>I do like this format a bit better than Dave's recommendation. Feels a bit
more intuitive to understand what the commands should be doing, but I'm
not sure if this is just because I'm new to these things.

I'd like to format it like above if that's okay.
</pre>
    <blockquote type="cite" cite="mid:87bl2z5ahj.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">While the corresponding QMP commands ought to be

         x-query-virtio
         x-query-virtio-status
         x-query-virtio-queue-status
         x-query-virtio-vhost-queue-status
         x-query-virtio-queue-element
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I agree with Dan (and I am the maintainer).

The x- is not strictly required anymore (see commit a3c45b3e62 'qapi:
New special feature flag &quot;unstable&quot;').  I lean towards keeping it here,
because we don't plan to stabilize these commands.
</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">Ok! I'll keep the 'x-' in and change them to the above.

Thank you for the comments!!

Jonah
</pre>
  </body>
</html>
--------------4331eUH1CeT4Goc1Vxe90NpJ--

