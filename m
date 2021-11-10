Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D947B44C6A8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 19:14:27 +0100 (CET)
Received: from localhost ([::1]:35654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mks78-0003gF-IV
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 13:14:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1mks61-00030O-AG
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 13:13:17 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:53834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1mks5y-0003Mi-FQ
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 13:13:17 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AAI81ZA014454; 
 Wed, 10 Nov 2021 18:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=6Ay8mk1A+y9Ke0A3wQChqgBgzfqnre+fYondRPmj6ao=;
 b=Xk0RZXMVOyt+YWQjMsAD+G39MScT7SGAoayien+fKq65UTLtQOQdvlA14XWebcK+s+nE
 sc9TXTZIktP8yj0klCZm6FANUwCh3ClttJaJ5lq6V4myX5k0/bNfckIvM8qz8z9MutXl
 oT3tnNaUX+eZBcjep/XCC9+Ry7hfl7dQqphOOkmSg+amVXYExvS2MU5OyOCB1ucZqMlc
 JgMMMXEMmWL1G6uP8afqwO7K9zXez/CIZLlN5dSmUiDfZRU30pGVOpeEK73nZp1mpxx/
 af1LFVNIZhgIuYg07b5gB4Ycu2HwxQnlYXkFQUM7WTBDgU9Ssakvylvwjbhah2R8spjp Tw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c85nsd3j5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 18:13:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AAIAMZ8027931;
 Wed, 10 Nov 2021 18:12:55 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by aserp3020.oracle.com with ESMTP id 3c5hh5n3b2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 18:12:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhZ6btM0RdYUJNGE3JUSKQnS8SuZh0Zb+GEWesUy7WuVV4dbVpToYGmIGoUkFhqmzGoyV0Y+ywB9B3k4wqk4SHdPpWSBwcpf6VCiaAaTKvY23HfsiGObXdCZ/jwXwpkD2KobeE1RmhvN32ZlExEfBf4QTCYhEZGrna6+OSV9Ytb7E3eyvjgxQ0gNYhkwgZJJlAHnsWDUQAiY76+RBbeFt28Ur3EEIPP6sKjY8/wtUX8BFOHkaIE1M20UV2y6BT6Y1H4IvVIjpBSnvh9r05dm+dITHnx3VfZZyT2mBxbZjKYH6YzmIOBV/c2gewoT8TRk/k1MZ8trQDNosH0KIAroYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ay8mk1A+y9Ke0A3wQChqgBgzfqnre+fYondRPmj6ao=;
 b=b2+vhZMjRgKm0I/oEdlU1ZtMP/vSId4b5GxWdbavVa4xoHSX1tiEQOkSmeK3XZx9bfeUEc42RCxm8cVtpxQ34R7MXis+KqJp6o52GLbuLJXr5R1MmJLkdUs7oRUYZwe/K4ObmSG0gVih2rOn2y80S35ifbw7rVOWmVcRl+G+ThGNEm6o2CW4ZQtnevgVKP5Rpxz8TDLVvnsDrE33nc7HkJUymk9kQy8qeK4xUgWipPTgMmGF1nXxyFZj9O6E8eXksIPo/7IE4dztPY77TPJRUgyQSWLaV4OJD3LdNYL/Tqga9UlWDzTho4ZrxkuhO1PH77HGKA7l5bnNwJUzd/DSVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ay8mk1A+y9Ke0A3wQChqgBgzfqnre+fYondRPmj6ao=;
 b=avHoqxfMsXazhJu6dJ5CKS03r7AYAkYSw/MnR6DMP5n1eDL6WDs0wUHH16nOl5QYaFNOEooZkfk0/DL2VYyCNs8BwxuPi/V3I0nt27rQ+uIFus5jafUKovPpfQ6uOzI2QmGf1J4F4AQRt3vB0pK1SwR7uL7GtPp87J70yVT4wuw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2523.namprd10.prod.outlook.com (2603:10b6:5:b2::27) by
 DM6PR10MB3961.namprd10.prod.outlook.com (2603:10b6:5:1f6::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.17; Wed, 10 Nov 2021 18:12:53 +0000
Received: from DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::6491:6cd2:c4d5:c1b7]) by DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::6491:6cd2:c4d5:c1b7%3]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 18:12:53 +0000
Message-ID: <26a03074-1086-6fcf-5810-4f9c130d0342@oracle.com>
Date: Wed, 10 Nov 2021 13:12:49 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Failure of hot plugging secondary virtio_blk into q35 Windows 2019
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <57170d20-635b-95fd-171e-e84de0d2d84e@oracle.com>
 <31c8012c-234f-2bb8-7db2-f7fee7bd311f@oracle.com>
 <4be352af-f3fc-0ef3-1d97-cd3eafbbb98f@oracle.com>
 <alpine.DEB.2.22.394.2111091226350.133428@anisinha-lenovo>
 <YYpE8zhRR2WWFl+j@redhat.com>
 <CAARzgww63RpHB+40q5=qzy+V2ZoJs-FF1C2WAz8TL58r2dwJ7g@mail.gmail.com>
 <YYpZOeZkzOa5dB5+@redhat.com>
 <59be6397-57f8-cd0e-2762-0a3f8b9b4a05@oracle.com>
 <YYq+tc4dxqSAjRCR@redhat.com>
From: "Annie.li" <annie.li@oracle.com>
In-Reply-To: <YYq+tc4dxqSAjRCR@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::33) To DM6PR10MB2523.namprd10.prod.outlook.com
 (2603:10b6:5:b2::27)
MIME-Version: 1.0
Received: from [10.39.212.241] (138.3.201.49) by
 BY3PR03CA0028.namprd03.prod.outlook.com (2603:10b6:a03:39a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 10 Nov 2021 18:12:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75a97f82-a956-4086-8c42-08d9a475b68f
X-MS-TrafficTypeDiagnostic: DM6PR10MB3961:
X-Microsoft-Antispam-PRVS: <DM6PR10MB39618D7520E84A3EA2731871E5939@DM6PR10MB3961.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uPXhs4azODbvrG3FnBHTDC8GFExE3dD4mgNKad9j+bQZzDQLOFq6LnSmD4nwygZxUqUc+PLVnoEbaq8BTn0G/p1zFi+x+TsgjT3hNeF0kiC6mlzprS3Mk6NeFQDdnpV6WYTJvzrgyZh32LQKERb+aVRj7VWipVSLAFDOW5eXzbsx29yHb7yLaORoKpNaS0UXUs8QRq8cxVlpIW0C+ekelITlyJQOQPyJgoLSYZh630w3FYfxg2cCKF4ReVSrDzbxEhGivdGi9cobmDh/e8ClzPGHqPjYZ3Cf6COdU/uhMGQ5dT8ZqjWxmvAJ0NGHI+LVvgU+t1+21kvcGGJ7jd9GHoIsbGTPR9+D9kotmqo2nxInXPToZRIY7m4wBzJoe+aEwjfSuy9Mjz1eKjWNo4JJfdXTeJc6zrWun+4rmRoyWGAwLywh4X2ol+mxnBfnfN76wmKuwQtQmu9YWzF9XoHEexhfH6ZpjQqeR1rRcPUWp92Mh2KmAAIrMuVQ/YmaMLqdnYANPf1ApLICP+WLxtBGSGPsg/u+KEKujrn9OBU3RQuZYxXZ0WmJ7Hv/o2XCX+vzXVDNdjMZFlKPjhe6WfwhIKk4YgrGEkJJieM5CefWao02UFNny5Zdt8unhJHuefGA7dorZdPfBmf29d+S+Fqgh9jUyvkQbagdnvAdXOURHDZPY6r/kLO7njkWQimLNuit004cVfvUgzCreAwlpCETvamXXuFCFttcDY+7FOgDwqBXvIWbDVnstfWVYP0mztSINIUbol788KsI1n+sTTgZPX8zQ/mKH2OdRY8gXtoVL3aR4ciNRhu5f9Bp22ZO2bJw8E1V/7GWDpUnGH4dRGSLlN7mj+aR+322klEVVf2RwpU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2523.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(6486002)(8676002)(4326008)(2906002)(508600001)(83380400001)(26005)(6916009)(8936002)(316002)(186003)(31696002)(5660300002)(66556008)(66476007)(86362001)(38100700002)(53546011)(2616005)(66946007)(31686004)(16576012)(966005)(54906003)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlFrbXBpaC9NUDQ2c21NWFp5ZHhtUk1RZlZ3T2FsME9HenhFZjAxSzhCY29u?=
 =?utf-8?B?M1pxWkVRQVI0cUtLQlpqeCs1eURyRDB6K0NzT0Z3S1lXem5Jc2t4ajFZekx4?=
 =?utf-8?B?dS9Ock80djdNVjIxRSsvTFZ3WWp1MzNXWXV3TVVKQ3hyTFJZOHAxRUJnc21r?=
 =?utf-8?B?MlpVSEQwbnBtdS9Xek1OQ2Y1UE8yWnQzNHIzUlg3QjRrVmFGa09ZL0lWYmNv?=
 =?utf-8?B?RUZpVXR5VmYweGRpeE8rMVBFUlBWVWhGd05zaDJvNU5hbm5tWXhuMHJDN2w1?=
 =?utf-8?B?akQ2Z3ZyOFFkYU1sMHdkcWtHOHRHL0FBUE1SYldHaWxVbnRiQmpLWHowYnk3?=
 =?utf-8?B?VHdLblpVWVZ2R3ZmMFg1Z2YxRWlkVnluM213V1YxMUY3cEZhUkNDK2E0cm8y?=
 =?utf-8?B?VWFLU3NHOHNrM3loSmZ6TldseWV1djVmK3dRc0hNcFhOT25jemljbmxkZGZl?=
 =?utf-8?B?aWw2akF1WVVqNG9OMlU0WFAzYk9tajhCTzdMVWo4MDNzZjFJZHVWNmZHcVdB?=
 =?utf-8?B?T2ljTXRmWXZvSVFETDdqRDM4b1JlbXZXczlObFF6UTBmUnIyWm9iZWtiVTR6?=
 =?utf-8?B?VGVrQXJMMDY2NnlsM1UzdjlBdVQvNmpYak4wQWpnMkhWRVpSYkJEc2o0NFp1?=
 =?utf-8?B?aGJRKzdFcnJNajJ2aE9kZWxwKzdCclFSTjZLcnFoR2hmRDhUTEVQVDFHVW1h?=
 =?utf-8?B?WUNvcGdpclAvcksxN2poanFoZ3NGSGVVOHhOZjNDbnNseDBsZkxmYno3Vno1?=
 =?utf-8?B?bDZZdzgxQ09FYWpldi9QUUx0NEZjc2pCeTNVbEhmSWtXZ0x6VmRCM2JJT05Z?=
 =?utf-8?B?VUIvK3AzaDQvWU8zWlVtQ1ZqemtIeTB4RGp5MW9TcG5TaFMrVmIvalZyK29r?=
 =?utf-8?B?ZS8rYWZqaWdqTW55M0tDQUhueTNZUTREbmlNRFdpanQ0THAzUFMwSUxwZGZQ?=
 =?utf-8?B?VzJUZFdLVnNPUlVOWVRBd1BYZmgxcEROTThDVktnaGFRQmwrVkVoNmw2ZFkv?=
 =?utf-8?B?TFJQM1ZjY01pZ1pZcEVVbFo5RGtDT05TektwYUN4TmwvV2ZnelFYNmszR0tX?=
 =?utf-8?B?aE5qZU1ucFdlOHljZnlGeS9oUDhNU1dFZ09NM1hJdmlUdWd2dXlUV3hGbDZ1?=
 =?utf-8?B?czdLUHpBR01jVlhyeDZDallPYkhramo1MmdiVkpWdU5MWGVXSnkyY1ZRbFJ3?=
 =?utf-8?B?aEN0NGRyUjBiN0FQelQvN2E5RENqZVdUZHhMdGJFTDNxRzJwL1MwS2NXUXl3?=
 =?utf-8?B?bkhDd2k5Yno3TGpTMWI3c3kwVkxWM29Obzg2UmNheWFFdFhkaHRSVDl2NXE0?=
 =?utf-8?B?RmJQV01kUVhOWWpHZFFTNURGVUVjRmVUa2FVMHdWSU5Nc2JLaGhsWm1ERmsv?=
 =?utf-8?B?N3MwNTlML0NPVys3Y3N0SDdFd3l5WkdnZnROWmVITUJUUEh0cG0zQjl2NG5C?=
 =?utf-8?B?WUJxWXlyNG1xbndJTmJYdWh3WWl0QzdBWmprUzNyVzVObmNCVmFSZCswMEE1?=
 =?utf-8?B?eEhoSnlzUlk1czVxRDlVbTBSem1xZDRJZElCelBLelhWU1JFRTFZL1VCTFBV?=
 =?utf-8?B?alkxMFdpeGRNZHZ4V1I1eEoraFlMMG5WTWtEMldxRUlEUmhqcEo1ZCswQVh1?=
 =?utf-8?B?TUExZ2g1cmdPZndhY1dHQmRsTDRWNFVhMnh2SGt1cnpkRXNNM1BmWW12UDdL?=
 =?utf-8?B?RHpLd1FuZkFEYk9WWTNqem9PUDNsRWc5N05kbVYvQW5xeXY2NGRZejJ6VExH?=
 =?utf-8?B?YnQycWF5RVVLMDZjenVBM3RFSWVQYk9rZk5NcGtlNHlKa3NYM0NPbU1WZFZX?=
 =?utf-8?B?TmF3YlkyMkdwNEdJeGFPRVkva3l2R0Z5SlMzcjVXcXRhelFhZ2lwNkR2aCsv?=
 =?utf-8?B?eFo0ZGlQZmw0Nzc5Q2JFNEFVdmkyRlhqdEdOVTF3eXVYS1g4QjRVTHdKZmR1?=
 =?utf-8?B?aHpuSC9rbGFqNHdRSy9vYk5qcTZTamU0REFtZHArbWhMZVU3ank4V2krZFg2?=
 =?utf-8?B?c05xckNVelNNcVlvUm9wbkRXc2UxSGhOanhxak11TFhzRFpIb003aTF2aVBU?=
 =?utf-8?B?eGR0OTNJL0RBQmc3dXp2ZE5aNHRCSWJKMERVYlM0bHowdkY2djYwcW8zWVRu?=
 =?utf-8?B?ajhEOS9ub2xRclV0MVNpU0E3bUZUaUFscndiNWdyN2twMHNlZm1wdXhNV01x?=
 =?utf-8?Q?XNXZFAj3El38HifmFN5p5MQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a97f82-a956-4086-8c42-08d9a475b68f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2523.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 18:12:53.2384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0EIhls/pHNZMffdCvZ6oHQoAY5SC3cpumK2WS6znEXuzag5YA5rmK/1vYpX2tt4bwoZHUIUxzOGqvHpfOYFOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3961
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10164
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111100091
X-Proofpoint-GUID: pp-mRw_XTX8z-4s_XL8tamrXqKgg5m6Y
X-Proofpoint-ORIG-GUID: pp-mRw_XTX8z-4s_XL8tamrXqKgg5m6Y
Received-SPF: pass client-ip=205.220.165.32; envelope-from=annie.li@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Ani Sinha <ani@anisinha.ca>, "imammedo@redhat.com" <imammedo@redhat.com>,
 jusual@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/9/2021 1:32 PM, Daniel P. Berrangé wrote:
> On Tue, Nov 09, 2021 at 12:01:30PM -0500, Annie.li wrote:
>> On 11/9/2021 6:19 AM, Daniel P. Berrangé wrote:
>>> On Tue, Nov 09, 2021 at 04:40:10PM +0530, Ani Sinha wrote:
>>>> On Tue, Nov 9, 2021 at 3:23 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>>> On Tue, Nov 09, 2021 at 12:41:39PM +0530, Ani Sinha wrote:
>>>>>> +gerd
>>>>>>
>>>>>> On Mon, 8 Nov 2021, Annie.li wrote:
>>>>>>
>>>>>>> Update:
>>>>>>>
>>>>>>> I've tested q35 guest w/o OVMF, the APCI PCI hot-plugging works well in q35
>>>>>>> guest. Seems this issue only happens in q35 guest w/ OVMF.
>>>>>>>
>>>>>>> Looks that there is already a bug filed against this hotplug issue in q35
>>>>>>> guest w/ OVMF,
>>>>>>>
>>>>>>> https://urldefense.com/v3/__https://bugzilla.redhat.com/show_bug.cgi?id=2004829__;!!ACWV5N9M2RV99hQ!bCogoVXfTRaTu03Bg6dQ8NrSINSha4iSSLuZJerOTVdIdWnu1msYwJ8E_c_jRg$
>>>>>>>
>>>>>>> In this bug, it is recommended to add "-global
>>>>>>> ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off \" on qemu command for 6.1.
>>>>>>> However, with this option for 6.1(PCIe native hotplug), there still are kinds
>>>>>>> of issues. For example, one of them is the deleted virtio_blk device still
>>>>>>> shows in the Device Manager in Windows q35 guest, the operation of re-scanning
>>>>>>> new hardware takes forever there. This means both PCIe native hotplug and ACPI
>>>>>>> hotplug all have issues in q35 guests.
>>>>>> This is sad.
>>>>>>
>>>>>>> Per comments in this bug, changes in both OVMF and QEMU are necessary to
>>>>>>> support ACPI hot plug in q35 guest. The fixes may likely be available in QEMU
>>>>>>> 6.2.0.
>>>>>> So we are in soft code freeze for 6.2:
>>>>>> https://urldefense.com/v3/__https://wiki.qemu.org/Planning/6.2__;!!ACWV5N9M2RV99hQ!bCogoVXfTRaTu03Bg6dQ8NrSINSha4iSSLuZJerOTVdIdWnu1msYwJ_pKO8AzA$
>>>>>>
>>>>>> I am curious about Gerd's comment #10:
>>>>>> "The 6.2 rebase should make hotplug work
>>>>>> again with the default configuration."
>>>>>>
>>>>>> Sadly I have not seen any public discussion on what we want to do
>>>>>> for the issues with acpi hotplug for bridges in q35.
>>>>> I've raised one of the problems a week ago and there's a promised
>>>>> fix
>>>>>
>>>>>    https://urldefense.com/v3/__https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg00558.html__;!!ACWV5N9M2RV99hQ!bCogoVXfTRaTu03Bg6dQ8NrSINSha4iSSLuZJerOTVdIdWnu1msYwJ-np8GcUA$
>>>> So https://urldefense.com/v3/__https://gitlab.com/qemu-project/qemu/-/issues/641__;!!ACWV5N9M2RV99hQ!bCogoVXfTRaTu03Bg6dQ8NrSINSha4iSSLuZJerOTVdIdWnu1msYwJ86xk2gtg$  is the same as
>>>> https://urldefense.com/v3/__https://bugzilla.redhat.com/show_bug.cgi?id=2006409__;!!ACWV5N9M2RV99hQ!bCogoVXfTRaTu03Bg6dQ8NrSINSha4iSSLuZJerOTVdIdWnu1msYwJ9crT9JKw$
>>>>
>>>> isn't it?
>>> Yes, one upstream, one downstream.
>> Thanks for the info.
>>
>> So q35 guests with either OVMF or SeaBIOS have different ACPI hotplug issues
>> in QEMU 6.1.
>>
>> As Ani mentioned earlier, QEMU 6.2 is in soft code freeze.
>> Today(Nov 9) is the date of hard feature freeze.
>>
>> I suppose this means the fix for the issue with SeaBIOS or the feature to
>> cooperate
>> with the coming change in OVMF won't happen in 6.2?
> Patches are allowed if they're bug fixes. If a change requires coordination
> with an OVMF change too though, I think that's going to be difficult to
> justify.
>
> Our fallback option is to revert to native hotplug out of the box for
> QEMU machine types in 6.2

Nod.

Just make sure we are all on the same page...

It seems that reverting back to PCIe native hotplug for 6.2 is being 
discussed
in bug2004829(https://bugzilla.redhat.com/show_bug.cgi?id=2004829).

If these PCIe native patches posted by Gerd Hoffmann in bug 2007129 can
fix the various PCIe hotplug/unplug issues, that will be great!

At least, we have been seeing PCIe virtio-blk/virtio-nic unplugging issues,
PCIe VFIO hotplugging issue with PCIe native hotplug. Anyway, I'll run tests
a bit with these patches from my side.

Thanks

Annie


