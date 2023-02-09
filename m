Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CF3690C17
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 15:42:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ883-0007ec-Ig; Thu, 09 Feb 2023 09:42:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pQ87b-0007Yi-DG
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:41:59 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pQ87Y-00087J-OV
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:41:59 -0500
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319BO60X014329; Thu, 9 Feb 2023 14:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=Ttl039w0CfbPlq4A95wK+EKB0b3aMil0bEpEMeuVhc4=;
 b=aieM/Z9C8ESzsXq3HUMQq+EeqwmXXfh6rUVbT/sevXZR+QSCkHq6tkFt21ITJB/Ll3Vn
 txeOJtLkLhgRGghFn4vxocNMneC0X3Nz77lm7el9N8gwDKucrhe+h4vDlXSPxSw70Mgi
 OG6hKaKU1JfyjLiQulPA1/vGU7AwrotEWNUrikYV3ktmE/ziRaDu6p7f2VljUAhrm0DQ
 5+qmZl6k+Qrp6cz8H3sg8bPYUN98jdgwxdVqvKYBbQEsb+/rTmn4nxPIs2YyxLhhfHWb
 GQUskj4gaquFMWqtJ5A9Bf+nljwfMnjDsx3kdWBPlBTnNbxzNRuIEGUQXUXpP2wFekAi 0g== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhfdcjwus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Feb 2023 14:41:52 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 319DnD7I036007; Thu, 9 Feb 2023 14:41:51 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdtf6whv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Feb 2023 14:41:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xp7nDuFwn17ofvFWR+jpsSznRlHURV+LDW/Oy6ojRYCNx/kFvHl+3zQpfk4dg5Wdo2fUQI1ULBhN9ZeQ5PRE/8JTByy7JGAUSOd0Hkw71q4ITw55JVy7cp3RQ9mb/6/mxRLynK45m0k2sMZacsm6gJNJHoxiUkBZFMn1YZcv/+qt5gNer7j2BtfCifbJXdZPguApSofNEz9XKrIQ3UO2xQACDt0VcYJowMCJc8XyIfnsVWCt12YJhgMzvSbLEP2cyhxwYT+Izh1We+eqZj7ZAo/xAgRCnKnk0JXbd3pruqML+i/EkePITmbNFSA7X3BGfJNLDeZyPCCpOSS+U73wnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ttl039w0CfbPlq4A95wK+EKB0b3aMil0bEpEMeuVhc4=;
 b=AdzIMJV/eqj9nI8Kb2QTtB7tnEjhE9pUF/yoUmniCVjzopc+5ATdiLU1Dox0VuE+MtKjY2PE+j4rSG+Q2WXLZOHfIeYkboM6y5Mkl9kbqH8d9kgaSmjf5ov6Vz9CRawDh6zk28iWQQ7z+P1mWm9sI7+WAr5nN6wuofRd+rXLmYPPqh+fM60yLrutg62pemzzxopoDfZdGk0K1PqS9Voi400COtlLUpWkHNsfNDsnyXtahtBF7Cef5m2iEI276IZzSYX/8RnYDCdpKHzU3i8TMsNBh6NScz3ZoXx6mdL6WLauoUjQgZzYU89NwGNSLBk9iwEIYADYicvUSQhd/mvWAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ttl039w0CfbPlq4A95wK+EKB0b3aMil0bEpEMeuVhc4=;
 b=XrZ9q6O8CsBS54IVBnG40iBDaNVO1wetSIkQcLVdCemZysBomy2jOJdTOQ+NcPVFSEn0bQASaZ4VLlKb0U5x+6fpUTCGij6ZLGv8HWXVcqfOouTF3Gasa45TE9cS0Xk88tetm+BphTXiSSOdDWpFY8CyygUf2O851FOxFhdRUAo=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by IA1PR10MB6170.namprd10.prod.outlook.com (2603:10b6:208:3a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.7; Thu, 9 Feb
 2023 14:41:50 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c%8]) with mapi id 15.20.6086.019; Thu, 9 Feb 2023
 14:41:49 +0000
Message-ID: <d25846e4-13fd-c683-b5e1-1660f4470d35@oracle.com>
Date: Thu, 9 Feb 2023 09:41:46 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V2 1/4] qapi: strList_from_string
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
References: <1675795727-235010-1-git-send-email-steven.sistare@oracle.com>
 <1675795727-235010-2-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CLFMUDvaOq2QXCKpb8Zj4PRr-tKV1q9L8m2EfgORPLj7A@mail.gmail.com>
 <32f34f74-213d-7107-907d-dda0a509878e@oracle.com> <87h6vwnstx.fsf@linaro.org>
 <87cz6j6tt0.fsf@pond.sub.org>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <87cz6j6tt0.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR2101CA0007.namprd21.prod.outlook.com
 (2603:10b6:805:106::17) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|IA1PR10MB6170:EE_
X-MS-Office365-Filtering-Correlation-Id: c5969f41-3e5c-494a-a302-08db0aabc6ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MrnEs3M+tJiUG+3YQr6OKSdPqRMCjOFJ2eRLvLvdmLr1H4S0qw1z7ob9Fnt6nkpy2Kx/d0V51Ul9seS9wg9TUJQod2jIDSIQPIb2lL+tPpXjVCsAm+l4IIMt2/1vqiOwo206887AHVdtBQ8aphh+mTcHKkXPPdDc9vxI6yNdvNZ07mcdFVMyGc3ct3w6uUsDVjVhpwDZ7CVgCWpOWH0gRfphEWEJ5NEnViIfkFcHBG3lBZmBHLchk7NYVlS3TSDZlAbQi+fkpBJXMSAhos0WeGLB57ILPk937Z7GSXNVm3l1hh9x7OwuH8517ym+f8v3ib+liu7eOJ+x7VD9B3WYQQ4J9SONXbcGpP5TWz/ooINMmASgzWSmoeFpt8Qw2nzFgPJR298iVjV2bWoig4a48YpZrJsE3IAvWIsH8QrIPnGiS5CYHUCej/Y1dKjWVVzGyLX4AbKxLUxk80Qq9oaQZ7SBjl8g3sAM7EvaPAMIuYpLKrZetIOV3vFRm0nTanVRr91YTXVFGym/uVI+bmh9qGgxQPTWObmiP/9dvtG+BBRxeLzirD+qfRhZEVQ3v7xHbWf5aSym7EmLScgfRi/YTwc4/MzsETBRVc7FapwPTrVc7EABJA8tEFNPAbyAMJw6YnbZhV0oxUDPZbGYngXmv6b0/dKB02hrGWClXKJS+2CCUrSlaE+bOkq3THeCv56jGgQ8A4Zn5FiH0lHWpinQKXJH8bKiq48oAtqVi//d85/K7fOCZtagwUM3hMznpGutwWtO7B/ivD75jI6qOr3VbYdoAhg6dUpUTvC2+yeV4z6xmwPVgBkWzx7EHU1oNk1f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(396003)(136003)(39860400002)(376002)(451199018)(53546011)(6486002)(966005)(26005)(478600001)(186003)(6512007)(36916002)(31686004)(2616005)(6506007)(6666004)(110136005)(83380400001)(316002)(66574015)(54906003)(66946007)(66476007)(8676002)(66556008)(38100700002)(4326008)(8936002)(2906002)(36756003)(44832011)(41300700001)(86362001)(31696002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDVJVUF5K0g0cDhwVXB5aXN3dEtncVN3N0krL0l2N2ZJLzlJMENnbkZkcmNl?=
 =?utf-8?B?SkNSaE40dVVrK3E2c00zLzF2WXg2WDkyRlpmY2tUQTlpcGJ0Y2ZidmRrZTBT?=
 =?utf-8?B?ZHVBanZML3VvMlhFcHdQMllPTzMwSlJMUWJxM1ZUVHpMOE9EQmt3N3ZpbHlq?=
 =?utf-8?B?eVoxK1hkRjJ4VHBpNXB6bXVsaWV2b2dwcE9OdFZua1VUeE5kclFUR0VKbzhM?=
 =?utf-8?B?Vy9XSHdiN1RYMW1EcE9DaDA5b1QreldLYzE5aGtGQUUrSTNGeHVmTUlXTjVl?=
 =?utf-8?B?Rk1DNW1hNDlBMHV2UzZoaTd6SEkyUTMvQzJQVmJ5VWZnVXg0TGtDTytObVAv?=
 =?utf-8?B?eVFQOWNXRzM1WjFDRHZoWTN0eFFka1BSVjhPTDRXSDNwSjV6UU5OUVBvdkc4?=
 =?utf-8?B?VTl3bHR5djFDSEVXdDdzUnhaWFVKTGdkSDkyaVVWNUZsWm9NZXhKZm82aWdu?=
 =?utf-8?B?dW9EajR5NjdxbkFydHowc1Yyayt6aEhrWlNWdXdMV1JnUUgxOUR5WDNkWU1F?=
 =?utf-8?B?d2lNQlB6YksyWmJYK25ZTXRYcEQ5L2p2cXk3ZmJoV3Z3RmQxYjZ0dEw1YnhG?=
 =?utf-8?B?b3NSd0JYSVdoeVE1dFNUY3VMbW5DUnlGOFN2bEkxTEk1WkQ2UXBiNC9kY3FB?=
 =?utf-8?B?eFZpeVYrT1I3RnJVK2NNd3VON2xEdStvbVU2MjVES3dqcFRSeklCaWFOdGVP?=
 =?utf-8?B?QWhjZHFJYm5QZ1JxMVpxQU9neUJaRzdmQ0lpb2V4dzVRRDlkcW5jYklrd2E1?=
 =?utf-8?B?MSt0TjMyb0xBTkJ5aG5lQytxQ3pmenZUclFFZGZ0ZUQzWmpJUzh1bEZveEJ2?=
 =?utf-8?B?UE41TzJ3MFd4WEthRUgzalBXV2Ewd3RYWDV2WjZjMC9EeXQ1emI5aEttVVFt?=
 =?utf-8?B?dktReC81RDJvd29NT3dZbFQ1TzJWNWg0a3dGSDFJQ050MTNCaTRNZGdxUU8w?=
 =?utf-8?B?SGp3WnJVRzFyOGJuN2o0aERnenZHQWRKZ1plcDJhRWVXRHNBZWJhdXRjS1F1?=
 =?utf-8?B?b0tlYnRjWnlXNS9GWnJNczFnMDR1NmhnOGp1cFNGd3BUYzZJRzZNbVdhbU5a?=
 =?utf-8?B?bWN4UHNSazhYWW16NlAzS0pPakJVK0tRRnVsRHdPb3lVQkV2UlJUMlAwV0h1?=
 =?utf-8?B?czRnSDhCK3UzSktSazBka29vSkVaZzlpNXpBdlVCTk5TRklVM3hHanZRQmpa?=
 =?utf-8?B?UDZPNUJ2WU1EOUxIMFNsUElIaVl4YUlpaWVRY2R3TlRrei9SUlovL2lRdnk3?=
 =?utf-8?B?ZXF0YXJHekozSkhOSnd3T3F0MVRxZjAwYlRSWkFmM3ozcnl5OUI5OWNPdzFS?=
 =?utf-8?B?UGJUUmVNSFRlU3RuQVlnemR2NU42RFphT2RSOHhIMmV0K1ZkS09welRpN090?=
 =?utf-8?B?YTdpMDNEUXBvQkxGR0g5RitVeExKYUV3OEdoTXRBc0I0cU9GL2xUcGMwcnJt?=
 =?utf-8?B?elBvNy9uaXFhcGxxd2NnalZwWXg1eVFuKzNrRjg0M3hnTGJIbjRFMXFOTUR6?=
 =?utf-8?B?TWd1SlpSeG5CNkp3czZsZExZN2l2SUdFbEo1aGJpbklHdFZGeGY3ZTErU2tK?=
 =?utf-8?B?Mk05OExvTzM4dW1UQXFFOWFwVldIR1RBS0xsbmlRTU5kUUYzV05TNmdmam5n?=
 =?utf-8?B?NUhxK28weTJ6S2IweWVCMVdPRnBGOFhnaTZaejA3QWdSc0hUZjRKUkdMeUtR?=
 =?utf-8?B?ZUpSbUFwZTF2NU5SOFpyV05DQ3J0TFFGNS9kR2JnMjdsQTMwZkU2alhtUFl3?=
 =?utf-8?B?SDNObVZzMWdHaFFWNlUwOEZnYnZFZW4yMWRHck81c1dXTWJqTHkycitjci9M?=
 =?utf-8?B?RXZpcjRQb21heE5VdXFDTCt4NU5sZ3ZqSGhhVHI0NHZBODBWVFBSaXE5VUlM?=
 =?utf-8?B?SG5FNUk1RUZvWENWQVJDYXVRQ0hNZXpVemViV0xESVl4aE5nQUlSbSt6dkpi?=
 =?utf-8?B?QXZUUFY2Y3gvWXRNMVROK3h1UjZxQXZRdmJ6TGhKaG1vNm9xcldScTlOSHpL?=
 =?utf-8?B?MlhoT1ErWnYwWDFmeW1pSUFWZzdrMW1YOFFUUmRydi9Ib1ZvZVRUUkJDNXBF?=
 =?utf-8?B?NlkyQmQ3T1JpZVk1UUJpd2pIYTF3SjJxdlNjeUJieXJndUx2NC8yTUxhaXc0?=
 =?utf-8?B?MkZpUGM4bE4wOWtTNlBmVkZMUkV2K3BndVJzMndOa09QSlRRUG0rdGxIVXN5?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: oqJ5fTmeU97FysE4CX+ElF/OOCv73Jb+sBKKRXoNmp3hrB0g+osH24KenpbVHz+GFFns7EYpQ2cuqgYtEzgfFU8m8UksW+pJfsRYFczwiRQgXAKTCV5qcGai8ym10nKWUIKS1m8pzwlsgInu3Iy1R/VSSjUnV4XxRsRxevsoYMMKV9NVOEzA3dhHTIytRk9kEl4bHT+xEL3Fkpvj5jIqg8eQjFalDbPoSvyTDGOo/09VbPvqON6hQmEifA1H1QEPhHtZfgCgZSy2QClOhkbtXZ9Jro94klw79yOVbe8QKG1gm4ucFEZZhjt7sZkWczQT606OhwsTx36QfyNO4mC/W0/PS1LoPRqoA5AwijLvkKgt9Mn3BXy3TMLa9Pt9gXtSfh6lHvdiMH1OC0UX9SCAxszJY26WkN7wzA9siBd/pZb1X7rPaizu/AtHqV/VckhnAhAGBguLwQa4aseGIEDrwkfXs/l33wN95YdBJiem6CGU9jXxtmdLxzVKQ86hwwLz1kyMY8SRlD5FQyq01HOFUtOIuNtQ5DZkbjTnCkWBxHEF3vK04TWezfnFHJJ9eegmSAdO4S0IjYU/MJk2RTo2KB7MBbBFo8jyEcSskE7kwkl3Vn5QpQeTl3dlxbT+H3x8BjMUYoz9fBM901DyFP17ZdUjA0IOuQGIu8hSXDp1Ty+WPsB4++vfprO755gOBOLmsJtndVTAx5urvWMX+WV6Btz4S5JLdRxoVH63TY0gYJXyVhA4mUJ9pSg49KBSYKu2hBEGG1H+rgK/Euj8vvnCmDk292xhkv7US8udAaX/gEdWgxRFqlpvdp1kuBUdJtU1iR2OxTa7H6MdQI9dfMQ93whkESFli99j08k0V5r8b7w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5969f41-3e5c-494a-a302-08db0aabc6ff
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 14:41:49.8478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfdFQpYaAHUui4Q5QH/ASo2Xf5gUmar/ZDbsT9lriIgjVPWL2dDa5DSXTpHr2Qe7Y0ZcstmSZqioUKtdKhmThYBHRLkIYNUlOBMdEIAJ9cA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6170
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_10,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 adultscore=0
 malwarescore=0 mlxscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302090139
X-Proofpoint-GUID: DG1HgR6nwO6pG5x36iEgd6gX_j_SwEOs
X-Proofpoint-ORIG-GUID: DG1HgR6nwO6pG5x36iEgd6gX_j_SwEOs
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/9/2023 5:02 AM, Markus Armbruster wrote:
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
>> Steven Sistare <steven.sistare@oracle.com> writes:
>>
>>> On 2/8/2023 1:43 AM, Marc-André Lureau wrote:
>>>> Hi
>>>>
>>>> On Tue, Feb 7, 2023 at 10:50 PM Steve Sistare <steven.sistare@oracle.com> wrote:
>>>>>
>>>>> Generalize hmp_split_at_comma() to take any delimiter character, rename
>>>>> as strList_from_string(), and move it to qapi/util.c.
>>>>>
>>>>> No functional change.
>>>>
>>>> The g_strsplit() version was a bit simpler, but if you want to
>>>> optimize it a bit for 1 char delimiter only, ok.
>>>>
>>>> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>
>>> Yes, and it saves a malloc+free for the array.  Small stuff, but I
>>> thought it worth a few lines of code.  Thanks for the speedy review!
>>
>> But is the HMP path that performance critical? Otherwise I'd favour
>> consistent use of the glib APIs because its one less thing to get wrong.
> 
> The patch reverts my recent commit 0d79271b570 "hmp: Rewrite
> strlist_from_comma_list() as hmp_split_at_comma()", with a different
> function name and place, and an additional parameter.
> 
> There is no explanation for the revert.
> 
> An intentional revert without even mentioning it would be uncourteous.
> I don't think this is the case here.  I figure you wrote this patch
> before you saw my commit, then rebased, keeping the old code.  A simple
> rebase mistake, easy enough to correct.

Hi Markus, I am sorry, I intended no slight.  I will document your commit
in this commit message.  And in response to Alex' comment, I will use your
version as the basis of the new function.

For more context, this patch has been part of my larger series for live update,
and I am submitting this separately to reduce the size of that series and make
forward progress:
    https://lore.kernel.org/qemu-devel/1658851843-236870-1-git-send-email-steven.sistare@oracle.com/

In that series, strList_from_string is used to parse a space-separated list of args
in an HMP command, and pass them to the new qemu binary.
    https://lore.kernel.org/qemu-devel/1658851843-236870-16-git-send-email-steven.sistare@oracle.com/

I moved and renamed the generalized function because I thought it might be useful
to others in the future, along with the other functions in this 'string list functions'
patch series.  But if you disagree, I can minimally modify hmp_split_at_comma() in its 
current location.

- Steve

