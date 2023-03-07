Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B276ADBB1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:22:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUS9-0006lR-9G; Tue, 07 Mar 2023 05:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZURx-0006bf-TA
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:21:42 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZURv-0003KT-Bq
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:21:41 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32783kqA010503; Tue, 7 Mar 2023 10:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=NBXrHy87vyJAh3iho41s9sO2FdY9QU7r0L85XwzoqIg=;
 b=HhOiCtxl/U1juZrTTc30d7De+QY0gczyDYVssVRAptMYs9NTUtF1QhzxW+IWYs1Y1U/v
 Suk0DzEZSs9Fmy3lKbU/8kfXMvQlfZjGM351OOt75Y3y3ULgF6nskwhtYvAtxi5a9Lsh
 rb4X2r5IXFokOuX4Zyuf/WgKynaDvsqP+w9PcziEPBw3DpB2H3K2svZ0NCaUYwiGMbk8
 KtEXkyHaxg/byCvY8yM8P3ZrhUN5TmbzzCIaWCVgeSgNsslNbimQR7HDiv3l0KiQdfUk
 PRRv0nG3pf+CPeQmX8Ezp/613tn8p35d8GTugqMXp8OzQ8ekHhUzIwC9eZtozWotRVcy Dg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p4180w4dp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 10:21:37 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3279kSHl027227; Tue, 7 Mar 2023 10:21:37 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u1et744-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 10:21:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kR4jCXoDqTGw401L/E/7q+ivO10VW6uIb3scmHzxhgSdLmKp1KeDdpvMx7omK/54kHd6VvGg2miK5MUXx/p0kOeP5dQKXajELkAF31BML7DaCseod/l5duwXxRp7uLVod1XVMrPt65VJVStyB08D3Io7HUWoBGmA4DwguS0X7YVrujGdSO2yb8Dt86jtd1ZgCWk+GL7LYSOEoXlJQINSC3eLJ0CyfcB/RuvuNloRW02pxy51/ocF3o1qpI4ctQQ/vuzA7gXgfzbIKUjnERpTL5aq8HbJOsCAd+i1aJlXZEwii3vyCpL0fescu3hf/Ld72BI2aXR8p72YhNUIkYrOWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBXrHy87vyJAh3iho41s9sO2FdY9QU7r0L85XwzoqIg=;
 b=U0PSffJSYqgLv8iuNRR5UWMA01Fz8xDQDzKQuszzogBqMaULaoACFJy+618eNe6z6tpDBDpGaZcmuJSSjmJ5SLLKDAAZbQhxe8ZMcfRD0ZCYZUe5dhCCL4adfk+J+FLijjxr/fd0mpC1Sp55CB5UX7hvmrAhrxaPZelqQX8dWORuRnU6EnUmtTAs9rmL0KocJUf5Q51wf3b1Je20Qbd//7JRyXWz7BrnBcWY01ogEe8y7IGgSVip7dEtkUr6vIUiOFKhy9UOmMcNDbG9U4MlXMK16j0dfyCdg4EKeiJfgbe+596nMrqdwp0b4xt9RAaHrrunMGRF/8+52bqUzlE0yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBXrHy87vyJAh3iho41s9sO2FdY9QU7r0L85XwzoqIg=;
 b=xpXawUbpKJ8EpK7TdzNh1OAGBpNzlkcl5B/JvB1Pk7bQ1rhocjlrMwW8ac9zj+jpLT+wDbwuxKgG6MUDBT1NY4Nqa98/HEhLk0N7SuFtBVzDmSP76ARi+2dg2h/9bSxAoif23p5Aepb7xZMnHl/qgkGnEnxAJzFQk0zHWpEj6jA=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CY8PR10MB6515.namprd10.prod.outlook.com (2603:10b6:930:5d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Tue, 7 Mar
 2023 10:21:34 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 10:21:34 +0000
Message-ID: <af2abf4b-aa80-7a9f-e30d-83542ceb2a56@oracle.com>
Date: Tue, 7 Mar 2023 10:21:28 +0000
Subject: Re: [PATCH v4 06/14] vfio/common: Consolidate skip/invalid section
 into helper
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
 <20230307020258.58215-7-joao.m.martins@oracle.com>
 <8ef23f46-a5c7-2723-42e3-6f5efa7f993d@nvidia.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <8ef23f46-a5c7-2723-42e3-6f5efa7f993d@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0180.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::24) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|CY8PR10MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c62b18f-577d-41b5-29af-08db1ef5ba67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3+mHuWsMifVTOWUMsiEEUP76ofFKtRusirgW4IaZUo9l3lCn6cHi0OCHSTt7Hs/ArIVKfxCLmL1p5CjduXoXUNgdEBIcBHu4388vQDYjNZ7pXBKizThBP3Gf52tkQXGjzCi7hcY5tp/t+NFvDvsh8irbs2mg4enbuc4H3Vfpuy3FmesfFEu6WOpFalqYtBMDZ94URV7ARRmlEbU8dIzzODZTFPo/z1IiZaxuJUhYiuj6CmqC/EyEPDrh6ozoZm5FuZusZfECmuKPJFwPGG86p+asWKBFm31+h6y4yJnY/XfO2YWPJlB6xKVKleQFcUOWLOtuiLz48E34CDQrT0dNKSJ8JRW1ZVOfGyztVhrUzY57RfFChRUP8skR4cQlaGfhOYTGDE4+MvLr5v+kcCXr2VrtShbxg5/NE/nS2lNO76/nE+W1jm3O+KvcbL6chwuBAGXm0tF/0Bt9Hs13eOePO0RWsuqGxR6ThCR+NBUtmARGtvpYpsn7oB6t2Oh7yUo6oAMpefqy3Z7nXIUGeFv/bmNh8iyM0e8lJdkQuW9iYUppPh10WWsNyqMths5sP/HEwnUXbZKJueVHkcEI5Fd0yty+SzTEEfoeZ/mk6bKkecDLGpfNgWXxZklXEOUcojL9WEbVd9stbNaHYH+3Cw6qwBfks7NPomrrOsV+ulTqoVuRRxAf0o9CU4WCQoejCURdaFwP+FVizxOL9RTFwVfl5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199018)(38100700002)(36756003)(86362001)(31696002)(4326008)(66476007)(2906002)(8936002)(41300700001)(8676002)(5660300002)(66946007)(66556008)(26005)(478600001)(66574015)(2616005)(83380400001)(54906003)(6486002)(316002)(186003)(6666004)(6512007)(6506007)(53546011)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEY3ZkM2M2ZWWWpXWndlZmZ1M3Vyd2YrTExCYXM0TmJzYzlHSFU5Z0VHY04z?=
 =?utf-8?B?enJYZk5nUUozaHhPdEJ2eTA5WEtaVHBqYWRyU3dkM0MyVVdHQW1Pb3NDTmQ0?=
 =?utf-8?B?dVROdFNnZStSS0JDVm94RHN6aVNYODdGSWhqQ29Cc3I5ZDdSU1ZaVlNRYmxR?=
 =?utf-8?B?TnBwNDdsclM5U3NRalhRcW5mdG1yZkpZQk5YNGJDOHhGTnpDUXkvRWpLYkVJ?=
 =?utf-8?B?LzFSUzVkb0JPcVl5dGxCYlFBQ3RWNStwUEIzcjF0WEowMU1xYURtd2JPa2M4?=
 =?utf-8?B?V1NGblRIdDRDSVVsS1c0YklweUVZQ3dUbnJRZVVyT3RxMWwzY0FEQlMzS09F?=
 =?utf-8?B?QldPbWJhUmJqSzd3aGFxTFlSZHFrMkIwSThvN2wwNXNvR0dZQm5sVWQwL3NM?=
 =?utf-8?B?TXMrNmsrenc0K3YxNW5Bb2pqV1EyVWpzRWl4ZkduS1pxam1hUmtJcjRhS084?=
 =?utf-8?B?ODUvaW5XYlREL2RjSFZld1RsWUhuTTE1UW1ESGc5SlV0cllldzNHazBFNGxt?=
 =?utf-8?B?RDd1ZUpOVmhiazY4WW9mbUNrZG92RnpSV0p6Y25LRWlXOUhlZUpUSGU4SHpi?=
 =?utf-8?B?VkpoR1NzaWV4V0hsOEVyL1dCVU9iRVdsOGx1TWxGOFdTOTVrWFJOS0ZZaHNz?=
 =?utf-8?B?enhLOURjbUYySlc3c0tBako4emtWcDZOYWU5V0R5U2RacENjejBQbW9VaG9I?=
 =?utf-8?B?UW95Z2txVEt4OHduSGd4ZFN1Z3hhZVJyZXowNkNhaTgza2NKaFJuRDJ3S3o5?=
 =?utf-8?B?eEdwVTlIc05hTzFRdHVJb0xodzB3eUdERHBiSzVYYmdMdWJ2SGx1dlZSQUJW?=
 =?utf-8?B?SGRkY0dLUWl1OTFLa25zTTg5V0dzNTl6M0NhQkhrMU5BVU5BWi9nWk81WXBV?=
 =?utf-8?B?OU0yY01HaTgwL0xnUEJ6b2JBLyt0c0xXWWlYc0dPZWM0eFdTZzE2RzZCVUhl?=
 =?utf-8?B?SVpJWlJpWGx6dmtMSmkrQVkreGN4UEptNThrZzhWSFZSMHhYaW9sMnJnQWRl?=
 =?utf-8?B?T21vZGJzWjROME5RNzBQN1lMdnlrWi8wOEVoY0FSSG53d215QUE2aE1GV0Yx?=
 =?utf-8?B?WE9QRmw3aWNXTTBtUVdtS2theE5JSVIrOFhzc00wSWtWU043emJ3T3UwRXVC?=
 =?utf-8?B?SGp1Q0tWRHdQTXRMb1MwN0FNK2JQbUlxSGVkKytHb3NrcDRMYlAwcmU0WjlH?=
 =?utf-8?B?S2RJejZ4OWhtN1JLVVBkWi9GZXJRUDhhM2dKNVVoQ01WRGtzcmdTd1pPTVJC?=
 =?utf-8?B?QlBOY0tXeU84K2o4RmJOUzdOT2FjWjRuc0lGUmh1R0JxcWZVRUMybVIxWjl5?=
 =?utf-8?B?Z01qT2cwU2RXdHp6cXBqa2pwdkxFQnVhWXdIbml3VjBqWWpoQ2VoTUVZalFZ?=
 =?utf-8?B?dTZ5UmdaS0pKTHhjQkl1dmJWdW5ZU3IwQWg4VzlPcENMMG8vVmlDUUxadnNI?=
 =?utf-8?B?QkFkQnpoaTZybkRvVkFPUkxaNXRPSzFqQkFqVngrSG1aQXA4dndPeGl1d1Bv?=
 =?utf-8?B?Y2xTZjU3VlhBQWdVanJha09VNERXbFREWklQbk5oTCs5VWVtQnJhVXFHVkVv?=
 =?utf-8?B?MnZubVJDWTg3dFpkdmV2U2trMytOZmNPOXlEZmNVREN1N1dGN2t2Y2dCdHBt?=
 =?utf-8?B?cDBpMG9PU29mVVA3bHJZVlF2KzVZa3ZYSHJVM1FLWG9wdlB3VXM0Rk42VUpN?=
 =?utf-8?B?VkZqVS93Vy84eUhpM1pPSmNyRXRjTkNubFM5VVl2Q2d2SkFienNFTU1oRTZD?=
 =?utf-8?B?ZFdGd1JKd05hMmdRNnlhU21QZjg4NDNPbGRXT1h4c1lwUDZWczVmQWxUU29X?=
 =?utf-8?B?L0VkMktQMGRYSUgwTXQzeGI3UklzUVlibStrR3ZzMDJ3TzlmVkVMbkNUZkgy?=
 =?utf-8?B?bW9wK21MZmdwYkRldzlUQXFsdVV1NGN6K3BJU0JCTzErcEVKazc5M2twN05N?=
 =?utf-8?B?M2F6NVVheUdCeW9URnErM1hzaldyRkVBaXNHYlRrOWJQaFN1RVA3NXhqVlE2?=
 =?utf-8?B?WkZNWFp3Q2l1dE8rUFNkYm1ZaTNuZVZDL0hKNTNVSHFqMTFrTENkd2Rnd3pl?=
 =?utf-8?B?YnFKV0pTMis4cS9uQjEyVUJqdE9sNHN5c2RIUG00T0xPWmJySWpVZExnQ1A4?=
 =?utf-8?B?d3RyemNnNExXNTROV1ZCdDNjNldWMG1wcHdKTzBTWktyV01qb3l1eWNDd1pW?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: DxsuZyiC7sd+9lmpS2CrJxZkEUqYAl1bzPdir7axZwTOVHgyvweoGRBd421ZVKKbv7oztg4H9hAiP8nCVizUhcL35xBpuTdWyTBvkXz9nIs6uW/71M3gnN1lOruW40e+LWQQNhBbcOJh8Flh3z6xWtKiovAfbvdtX9qQaaDcqW+IpnIQNWXYqvSnX0VgU6NJc2EHDHjLu0D036Df3P/+1v2FcPLPkwi8AcOuvYloed4yB5mDrQLXIMVrVzMqVGNOYhKYfcgZuADo5PesDmZ7tH14KJHKEnFN8fwqVOBNAF/G6sruXhsp+virIQEzAdbn47sLA4nz3ceY0IC7P6YzjiTbPbbuPcgqsm/GUHON9cXdF2FG6gGh5HI54bNf88wcsR3Cm7NWFkGTzWiwGIyiQmax/2VTPxvE8/tzS4r0CeakqP2fSxfEaHEDQD03uSLfonrvapW4ESXIq27XKEEqnnb3pO5k/ga59NghRW4biJORNIElZJtQLZGhd3aOW6U4wuLYHyzxIYAP3YQgPJyflUtWaXfwPFKpAZrRWNW/Xa2CCYKgDPHOfKxvBzqs5HHS5BiUrTT4YuOHzHEZ6iV5JfN52GlJ2G8tjuR7/zJM05DiK5PptGBkffsQmLyuemAWzu7lA2wUEmc5AwYfi2cwId41wapfU545bWp5ZRKJMYW2VXfFca1SRU5nrLujprPidLLnrcDbRQC4tpb3FsznSgG0FA2IeRl1j0E+nsWgBw618iqbqxl/qa5rkZb2YrhErTNrAJIvt4zlkdJ5CoIn1FfOtagZErsmMISKgPMsvNhz5kdWMVIy/VkUms8GJke6
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c62b18f-577d-41b5-29af-08db1ef5ba67
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 10:21:34.7763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjEqNFrS2Cwvk7crj6a4+BLiJgSPHuApJIdeyHmHgKERoDdaevxBRBAGgKJfJUzl3Yfv5RkqeEx/BG6x5OkEVWvvKmmqBa03qShAEz9JIX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6515
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_04,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=957 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070093
X-Proofpoint-ORIG-GUID: oyp4OUhaU4XTafcyvVcf9TxQJLcOaEMr
X-Proofpoint-GUID: oyp4OUhaU4XTafcyvVcf9TxQJLcOaEMr
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 07/03/2023 09:13, Avihai Horon wrote:
> On 07/03/2023 4:02, Joao Martins wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> The checks are replicated against region_add and region_del
>> and will be soon added in another memory listener dedicated
>> for dirty tracking.
>>
>> Move these into a new helper for avoid duplication.
>>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> Reviewed-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   hw/vfio/common.c | 52 +++++++++++++++++++-----------------------------
>>   1 file changed, 21 insertions(+), 31 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 99acb998eb14..54b4a4fc7daf 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -933,23 +933,14 @@ static bool
>> vfio_known_safe_misalignment(MemoryRegionSection *section)
>>       return true;
>>   }
>>
>> -static void vfio_listener_region_add(MemoryListener *listener,
>> -                                     MemoryRegionSection *section)
>> +static bool vfio_listener_valid_section(MemoryRegionSection *section)
>>   {
>> -    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>> -    hwaddr iova, end;
>> -    Int128 llend, llsize;
>> -    void *vaddr;
>> -    int ret;
>> -    VFIOHostDMAWindow *hostwin;
>> -    Error *err = NULL;
>> -
>>       if (vfio_listener_skipped_section(section)) {
>>           trace_vfio_listener_region_add_skip(
>>                   section->offset_within_address_space,
>>                   section->offset_within_address_space +
>>                   int128_get64(int128_sub(section->size, int128_one())));
> 
> The original code uses two different traces depending on add or del --
> trace_vfio_listener_region_{add,del}_skip.
> Should we combine the two traces into a single trace? If the distinction is
> important then maybe pass a flag or the caller name to indicate whether it's
> add, del or dirty tracking update?
> 
I should say that the way I distinct both of them is because there's a
dma_tracking_update new tracepoint where you can tell it's from. And there's a
region_add/del tracepoints. So despite the name we won't get confused IMHO

> But other than that:
> 
> Reviewed-by: Avihai Horon <avihaih@nvidia.com>
> Thanks!

> Thanks.
> 
>> -        return;
>> +        return false;
>>       }
>>
>>       if (unlikely((section->offset_within_address_space &
>> @@ -964,6 +955,24 @@ static void vfio_listener_region_add(MemoryListener
>> *listener,
>>                            section->offset_within_region,
>>                            qemu_real_host_page_size());
>>           }
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +static void vfio_listener_region_add(MemoryListener *listener,
>> +                                     MemoryRegionSection *section)
>> +{
>> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>> +    hwaddr iova, end;
>> +    Int128 llend, llsize;
>> +    void *vaddr;
>> +    int ret;
>> +    VFIOHostDMAWindow *hostwin;
>> +    Error *err = NULL;
>> +
>> +    if (!vfio_listener_valid_section(section)) {
>>           return;
>>       }
>>
>> @@ -1182,26 +1191,7 @@ static void vfio_listener_region_del(MemoryListener
>> *listener,
>>       int ret;
>>       bool try_unmap = true;
>>
>> -    if (vfio_listener_skipped_section(section)) {
>> -        trace_vfio_listener_region_del_skip(
>> -                section->offset_within_address_space,
>> -                section->offset_within_address_space +
>> -                int128_get64(int128_sub(section->size, int128_one())));
>> -        return;
>> -    }
>> -
>> -    if (unlikely((section->offset_within_address_space &
>> -                  ~qemu_real_host_page_mask()) !=
>> -                 (section->offset_within_region &
>> ~qemu_real_host_page_mask()))) {
>> -        if (!vfio_known_safe_misalignment(section)) {
>> -            error_report("%s received unaligned region %s iova=0x%"PRIx64
>> -                         " offset_within_region=0x%"PRIx64
>> -                         " qemu_real_host_page_size=0x%"PRIxPTR,
>> -                         __func__, memory_region_name(section->mr),
>> -                         section->offset_within_address_space,
>> -                         section->offset_within_region,
>> -                         qemu_real_host_page_size());
>> -        }
>> +    if (!vfio_listener_valid_section(section)) {
>>           return;
>>       }
>>
>> -- 
>> 2.17.2
>>

