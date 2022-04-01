Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B63E4EE71D
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 06:19:54 +0200 (CEST)
Received: from localhost ([::1]:42888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na8lM-00080l-TM
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 00:19:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1na8k1-0007Kf-0s
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 00:18:29 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:41358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1na8jx-0006MD-KW
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 00:18:28 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22VNcYZZ027068; 
 Fri, 1 Apr 2022 04:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=8aLisZLJVFtS3aznscVrBXNhy2bZfmcln4yxn+7NVoo=;
 b=KBNpzaenYvZ0ThzQ6EvpSLZDCWv3pFbjBfIwUaGbLsdXcQwnJQ7S9xginW3LYK9FJbJr
 vJYiaRZd7aDBQrkz144Tx3D4pWBI/0zeu5oz2dIgxosaBVD4DjkRTtV3f1RWQXs0sBQ/
 5j2mNN5vzkgDHvaH8mpJ8w5Nqb+ydDeI+jhWlRqiErzZ2fDXkmdCUfC3BELzIcwcuGG+
 RSWqsb+mhUMirFcqA6Z9JX0ed/g3vaXFaU29UWuBfZKjKlEZ7X16Crskx1nrGMkC/ov5
 Qn4VRQpviXA8BuEC/WZH7xg2WkcJY7jkdPKuLmwXIHBWr/fics51zr94zgW/EmGcH74B iw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1s8cwmxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 04:18:21 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2314HPID025427; Fri, 1 Apr 2022 04:18:20 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3f1s95n18s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 04:18:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwEn2k8j5OnRyAMg6FwqQX3qWPSn7539A/gc+Ce7WZuWwROWmvZKSrfzCH2JknHGJj4InOU7HusVqKFq/pAiH9V5UBu1IlSiPUfq2Y/Sm4JOB6bBJh6cXjQhDha4qiXRKL8dKjFd6Wa4jBUd92mHOGP2cU+oJKGddeNoWyYO4LkeUeygWcYDkd9iTcTnvLY++Zkq9xthgrpKADdZ4GW8AAfx5w3jeIZYnGeWhitedQdEFTDaN90b9riUiXLPC4YY+i+YDbhm0wjqJhJxW0naQSb8eicVmEAtCzBxO1xccJ/wsCy4PuLD7y/5tZMCXEiVAZ6agDsVHzVco0L85fbOQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8aLisZLJVFtS3aznscVrBXNhy2bZfmcln4yxn+7NVoo=;
 b=YK3ZGTvKwaOxwaYnnB66KeZni+0jPALS/kMNUluJ/VuhrbKm01vlOBIrZuS+eLmUoDc4r8XENI88K3sN7MQFUU89U7A8mnnKjH+1+nt34tgUXOJSeCUzQ4LxJ5/fyG2zZv228DvPkrVRYaHaIntMQl/Bo8HyNjpiwDlrEQOdqOV93gfRzuRwUvTnsb/QzXGHP+I0AQ+Gv3wWYazaT8MLuuBceRgO/9TlKL8NhvykeY9J/zWXB04K8Gt9Sm2G5UsRCp/S1wHPzPuBNYpcUSRXkBHGsGKtcgtsW6u5trHAww8PNnKh3qUo1KdZBySP4au3EGg68TOPOPqWo9cEbxHeBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8aLisZLJVFtS3aznscVrBXNhy2bZfmcln4yxn+7NVoo=;
 b=PvrPFjCNJAFGP9sQRB6jQ9EShw02+B+C3JYIQ33B9oB4KE2IWTGmr6pg58pO0Z39ww/7IT7ILYUn7PZ8kos6Vck5GRc7JfT7FPRrK0pbiREq5GAMUrB7zBqisre9boRD1wen74WR20Alk8ROVgMR+z86e9ampJ9c2IwXmeUh5mc=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by SJ0PR10MB5439.namprd10.prod.outlook.com (2603:10b6:a03:303::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.18; Fri, 1 Apr
 2022 04:18:18 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::9d4f:2df4:8bd8:f468]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::9d4f:2df4:8bd8:f468%3]) with mapi id 15.20.5123.023; Fri, 1 Apr 2022
 04:18:18 +0000
Message-ID: <f7542e52-6f1a-f964-4e27-361cf752a6fc@oracle.com>
Date: Thu, 31 Mar 2022 21:18:13 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 7/7] vhost-vdpa: backend feature should set only once
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>,
 Eugenio Perez Martin <eperezma@redhat.com>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-8-git-send-email-si-wei.liu@oracle.com>
 <CAJaqyWdF55nKD05C54OOvM5-mmsCG7FMixKLguPGNR4Ostqnmw@mail.gmail.com>
 <f8ace3a3-8f86-841e-c056-271528d5ba9c@oracle.com>
 <CAJaqyWfb5=bEQGiGHamwqgBAvQf2FKEr8SwgVsa1LM2N-v48oQ@mail.gmail.com>
 <9a7c92a6-4551-48a7-6569-d3bc9d227fe2@redhat.com>
 <CAJaqyWfusKtDiTYuJBidwZGzpq3mQrOyaQOk2WNiiNPgxffgcQ@mail.gmail.com>
 <CACGkMEsk_1rUFBrpBK7QZrT-ye4xbdUA1y1ewL279sY4SzUtUw@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEsk_1rUFBrpBK7QZrT-ye4xbdUA1y1ewL279sY4SzUtUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::14) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45631a02-45cb-4f53-61c2-08da1396a674
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5439:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB54395EAB930DDA5669293510B1E09@SJ0PR10MB5439.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: So3QmNUpxP/EdGyUJPUEB0uikIuDMsznHZ52KVWws2oga77oN2w8J6u5gtzjJ2jEFl2M98I7a+9OQGL276OEZUCxiGpBoTpW2R6Hx3YaMWqABwypOVRkDAS2kkIJZUa1rG7e3P1xk+Hc9wOQePze+QFFaoJPdLxe7HNjLUDvGI94hzMJfaZcAkLCL2jfksyty05BreET89+HHS1MrHeIn4wL6S0TyU9SK/D4YVsN33WNkUOUH8OhPHRe3TYmjCuhmg2bJWVILdGZX4sBaqwpJmevJTSe+nk4jx5GyosfzuE/1ZCthXvqJc5Rk3c2Ih17+JQnAYnvKi/b+Ks4n1FKj5hCuxf5KmWqOuklAEIZa2gRmmXhxe2zQuciFoMnrvozA1IwEZGB+SYFg7/REytbgP0jKaNmlfo/9Td/ARiZnE5TXukWEslinL1UneWF0aKhUaHSjTLywz1E7C5nTEVOWUNMqez94siGgpRa+8RkzcV8OlNbXhiz77UEmfiAJcjqfD+eYbb9cYpQSHLoG4lF7uw5bmXCz8mhHCBx+eKCvNJ9B6B9c1Vy2PE8+diBa0AgSxVrVfQa20LzMNntfXqMy9XyF+HsCDOqsPS4VXo1ueGcxeN9qYd15gK60Sm6TAX//lkqEZyn1gZlAswqC505KZoJPwWxT7rkrnB64G2jI1DdVOKsetf9HmHSpMKK8JseNCB8+Fr77+UyHMi7/zyYLutxOMLKPlG4rdPAmGCvkoU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(2616005)(26005)(110136005)(54906003)(186003)(316002)(6512007)(36916002)(6506007)(6486002)(66574015)(6666004)(86362001)(31696002)(508600001)(8936002)(2906002)(5660300002)(83380400001)(53546011)(36756003)(66476007)(31686004)(66556008)(66946007)(8676002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STliUHRBLzVtY2xaOGJVS1o4YkVaY2ZCeWw4OUloS1RQY2lIU0ZxRGRZTDFF?=
 =?utf-8?B?aFgvUHl3VFZobjRHcFA2UlhZSUtNMlpURjJxTG9aQnJNN2lxWmVrejhqV2d4?=
 =?utf-8?B?cHJ4RDNwaDBISXlobjQzSksrTml3Q2w1VzBNQ0ZFQjNvd2xESzMvSk1QSmpD?=
 =?utf-8?B?ems0ZHdWZFlIYkVzd0drV2RtbTNyZmVlQ3ltS2ZkQWpLSHNOYmdmTHlyT1J0?=
 =?utf-8?B?WVhaK01UNWtlVzJyVUtRaU02aWlaMjVTTVBWblpuTW1OakZvbnphd3RlY1JY?=
 =?utf-8?B?d210blhCd2lSNUV4YmxEMG9iN0RkejkzUGtzUm5CeUtxVktORldkY2o0V3Bt?=
 =?utf-8?B?dEVlcTljRU0rUEMxdGRRQVhRU3B4bE03YXUzc0pyVmREQXZjN0I5VzJ3dnVp?=
 =?utf-8?B?ZGZSenNhMElMMDQrM2Jla0tqQXVrUEsrN1hrYUVzbjlMdXQ0TzZSa1JnSlB1?=
 =?utf-8?B?NitpNXE0MnVicnpBWHJHTG9zTUpDU2RBT1lWaHlFRTdFQzFVZDR4WThYSzVq?=
 =?utf-8?B?ZzRTWklDZWUzK1NrdmpzK1lsYXhuMmZKZm9lb09EVW9QNDdpRVBJclVPaDNx?=
 =?utf-8?B?ak41b2tKcDNqQ3dmQ01kY2dyM0hQU2NML003alN5OVdEb0hwNWt3QkZjbTRM?=
 =?utf-8?B?bHlTUFhnckZIa2huQzRJcXU0TS9hSUk4dTFNQk5Xb0h1cmhlMUpZaURXQU9O?=
 =?utf-8?B?Umk4dFk1Tzd5ZTNJRXcwd05Jdml5S1BoY0RWYnBBaWQ4SDJtY1lyc2NYbEd0?=
 =?utf-8?B?Q3A3d0h5WG4wNkh5WUY1bENEQVpkTFFoUnFVSnFleC9JMytjTCtML2djMnpa?=
 =?utf-8?B?MUVtWnkxanl1eGRoSVkwV3pWdWVSbnpjWFViQ3RUODFEcXJjUnF6R2JqS2Fr?=
 =?utf-8?B?b0hPUXRla0RLMTBWN2ZwNWJlTngycm4zaFBaQzVJekIwWkUxK2ZnNVVCRlpu?=
 =?utf-8?B?VVEwQXVlRnMyUEloSVJyLy9GN3REU2NNNTlNUndxeHNzeEdabGR6R2RLQWE5?=
 =?utf-8?B?N0VhRklCZHVjeUkrVFlkRElqbG9LZGJ0SEE2N0ZXMDlQRFpIOTV2WEtpV09a?=
 =?utf-8?B?ZHZWUzBiRGlPbnY5MUhCcnBaR1lxeEU4NFQxekJBbCtnNTNHUjlsWDd2SklW?=
 =?utf-8?B?dDJDTkJ2eW1hT2VkNzByeVdBK05VcU52OS9jSllYeWRzWTVmc1RUQ3ZWb1Bo?=
 =?utf-8?B?bFVTaUluQnVFUHpVQjJ4UmZ0QmdtNzU3OHRsSlpSa1RLbXgyVGc4TVk2UWRO?=
 =?utf-8?B?VjJXejRKVUJWZUticHFJMGM5d1gyTXdCTXZ3R1Mrb2ZDdXdLSm5rQlk0bVly?=
 =?utf-8?B?S2ZFWjY2R2lDVGdkcHZlbVkxbHJUQnF0UExzdjdQT1JUdktjaWE5bXo1NHdH?=
 =?utf-8?B?RkpOYVY3NVhIMXZ4OE4wZVFTcFZ3WkhmVUU0K1htV0pmNGlYeFYvUDBTWERN?=
 =?utf-8?B?UFlva1IzM2lxUm55ck01bHNJNStQVk1CcEVRMmlJclVkamxVNUR1S3Y3QXRq?=
 =?utf-8?B?NElaRmxmSnBGcngrODZHVVE4bWY1Z2l3LzRSaXNpSDIwWWRnY21UUThad1Fz?=
 =?utf-8?B?T09JUzhiRWJjcXd2V2k1VDMzUHBLbDR6R0Npd1NWK0VPbjVmSTlUMU9lR2JE?=
 =?utf-8?B?Sk5sMERaaVpqMVAxcjNFb1pieUhtZ29WV0FpV1YyclZmMmlZUFkxU0pxSWFn?=
 =?utf-8?B?V1diaDByb2t6NGFRVUhRenVQYWRJVFJzUUdJS0NxTmVZWXpVREs5WFk4eE9z?=
 =?utf-8?B?Z0FZQUFiSXNETWI4Nnlua0VHUHFLYUcwZExOTklBalA0d1ZXZmdZRy9WZnp1?=
 =?utf-8?B?dGpuZ1BUeEszNk9RTlZiL1owVnZHbi9KQ2ZzZGpZTW5BelVQOHMrRHRzaTEr?=
 =?utf-8?B?OGc1eW80L1JKYk1uTUpUQTl0ZTlFaml6UzNpTXRDSHpsQVRWK2VHaFFlZkFY?=
 =?utf-8?B?b2ZRM1pEN1BWQkVVazEyOTkvTXluaCtER2MzYnhodUhHbEt1L1FYTnpuQW9D?=
 =?utf-8?B?b2FhVmZjYmdyYXBTMjA1WS81MkxsbngreUw1V1RDOVMwbzZkaFlKQUpqS1BF?=
 =?utf-8?B?aDBGd1V4QXFJMlNUei9EVDhMbG93MzgrRkw5OTB5U2JTOVBRaEJncnNhaXBZ?=
 =?utf-8?B?bzB0azlVRXJrRTZzR1JQbWJ0aDdaNFZqOHpiMEc1S2VqVzM1bVFOM3B6TW5r?=
 =?utf-8?B?MEg4Q3lGeVBlUlovYno4N2ZGOHpJT09ZaEMwSklSdUU3ZC9SSUJzYUVNL3c3?=
 =?utf-8?B?cEt4a3hvc1pPWGUyWlFyNlh2SWtZZTZtS2REWG5OTlBsZ2dvZGhhcThOWG44?=
 =?utf-8?B?QVhVek1MYmxqRTg2UUttaUtZcVN5QlFBeXhnREtpUm1lUGg3M1J2Zz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45631a02-45cb-4f53-61c2-08da1396a674
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 04:18:18.6888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DT1u5aoMMGi5JP1Rjryq+wmb5t8rS3f0BgOiARtjn0FvSwr8pnlY93zfm4CuHXUkr9aJ/c3tgjl00EcRoiL0UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5439
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-03-31_06:2022-03-30,
 2022-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204010018
X-Proofpoint-GUID: qDAuSjA_bhAH7WICEcsRyyvQ3XCkbtCJ
X-Proofpoint-ORIG-GUID: qDAuSjA_bhAH7WICEcsRyyvQ3XCkbtCJ
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Eli Cohen <eli@mellanox.com>, qemu-level <qemu-devel@nongnu.org>,
 Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/31/2022 7:39 PM, Jason Wang wrote:
> On Thu, Mar 31, 2022 at 5:20 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
>> On Thu, Mar 31, 2022 at 10:54 AM Jason Wang <jasowang@redhat.com> wrote:
>>>
>>> 在 2022/3/31 下午4:02, Eugenio Perez Martin 写道:
>>>> On Thu, Mar 31, 2022 at 1:03 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>>>
>>>>> On 3/30/2022 12:01 PM, Eugenio Perez Martin wrote:
>>>>>> On Wed, Mar 30, 2022 at 8:33 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>>>>> The vhost_vdpa_one_time_request() branch in
>>>>>>> vhost_vdpa_set_backend_cap() incorrectly sends down
>>>>>>> iotls on vhost_dev with non-zero index. This may
>>>>>>> end up with multiple VHOST_SET_BACKEND_FEATURES
>>>>>>> ioctl calls sent down on the vhost-vdpa fd that is
>>>>>>> shared between all these vhost_dev's.
>>>>>>>
>>>>>> Not only that. This means that qemu thinks the device supports iotlb
>>>>>> batching as long as the device does not have cvq. If vdpa does not
>>>>>> support batching, it will return an error later with no possibility of
>>>>>> doing it ok.
>>>>> I think the implicit assumption here is that the caller should back off
>>>>> to where it was if it comes to error i.e. once the first
>>>>> vhost_dev_set_features call gets an error, vhost_dev_start() will fail
>>>>> straight.
>>>> Sorry, I don't follow you here, and maybe my message was not clear enough.
>>>>
>>>> What I meant is that your patch fixes another problem not stated in
>>>> the message: it is not possible to initialize a net vdpa device that
>>>> does not have cvq and does not support iotlb batches without it. Qemu
>>>> will assume that the device supports batching, so the write of
>>>> VHOST_IOTLB_BATCH_BEGIN will fail. I didn't test what happens next but
>>>> it probably cannot continue.
>>>
>>> So you mean we actually didn't call VHOST_SET_BACKEND_CAP in this case.
>>> Fortunately, kernel didn't check the backend cap when accepting batching
>>> hints.
>>>
>>> We are probably fine?
>>>
>> We're fine as long as the vdpa driver in the kernel effectively
>> supports batching. If not, qemu will try to batch, and it will fail.
>>
>> It was introduced in v5.9, so qemu has not supported kernel <5.9 since
>> we introduced multiqueue support (I didn't test). Unless we apply this
>> patch. That's the reason it should be marked as fixed and backported
>> to stable IMO.
> Ok, so it looks to me we have more issues.
>
> In vhost_vdpa_set_backend_cap() we fail when
> VHOST_VDPA_GET_BACKEND_FEATURES fails. This breaks the older kernel
> since that ioctl is introduced in
>
> 653055b9acd4 ("vhost-vdpa: support get/set backend features")
Yep, the GET/SET_BACKEND ioctl pair got introduced together in this 
exact commit.
>
> We should:
>
> 1) make it work by not failing the vhost_vdpa_set_backend_cap() and
> assuming MSG_V2.
This issue is orthogonal with my fix, which was pre-existing before the 
multiqueue support. I believe there should be another separate patch to 
fix QEMU for pre-GET/SET_BACKEND kernel.

> 2) check the batching support in vhost_vdpa_listener_begin_batch()
> instead of trying to set VHOST_IOTLB_BATCH_BEGIN uncondtionally
This is non-issue since VHOST_BACKEND_F_IOTLB_BATCH is already validated 
in the caller vhost_vdpa_iotlb_batch_begin_once().

-Siwei
>
> Thanks
>
>> Thanks!
>>
>>> Thanks
>>>
>>>
>>>> In that regard, this commit needs to be marked as "Fixes: ...", either
>>>> ("a5bd058 vhost-vdpa: batch updating IOTLB mappings") or maybe better
>>>> ("4d191cf vhost-vdpa: classify one time request"). We have a
>>>> regression if we introduce both, or the second one and the support of
>>>> any other backend feature.
>>>>
>>>>> Noted that the VHOST_SET_BACKEND_FEATURES ioctl is not per-vq
>>>>> and it doesn't even need to. There seems to me no possibility for it to
>>>>> fail in a way as thought here. The capture is that IOTLB batching is at
>>>>> least a vdpa device level backend feature, if not per-kernel. Same as
>>>>> IOTLB_MSG_V2.
>>>>>
>>>> At this moment it is per-kernel, yes. With your patch there is no need
>>>> to fail because of the lack of _F_IOTLB_BATCH, the code should handle
>>>> this case ok.
>>>>
>>>> But if VHOST_GET_BACKEND_FEATURES returns no support for
>>>> VHOST_BACKEND_F_IOTLB_MSG_V2, the qemu code will happily send v2
>>>> messages anyway. This has nothing to do with the patch, I'm just
>>>> noting it here.
>>>>
>>>> In that case, maybe it is better to return something like -ENOTSUP?
>>>>
>>>> Thanks!
>>>>
>>>>> -Siwei
>>>>>
>>>>>>     Some open questions:
>>>>>>
>>>>>> Should we make the vdpa driver return error as long as a feature is
>>>>>> used but not set by qemu, or let it as undefined? I guess we have to
>>>>>> keep the batching at least without checking so the kernel supports old
>>>>>> versions of qemu.
>>>>>>
>>>>>> On the other hand, should we return an error if IOTLB_MSG_V2 is not
>>>>>> supported here? We're basically assuming it in other functions.
>>>>>>
>>>>>>> To fix it, send down ioctl only once via the first
>>>>>>> vhost_dev with index 0. Toggle the polarity of the
>>>>>>> vhost_vdpa_one_time_request() test would do the trick.
>>>>>>>
>>>>>>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>>>>>> Acked-by: Eugenio Pérez <eperezma@redhat.com>
>>>>>>
>>>>>>> ---
>>>>>>>     hw/virtio/vhost-vdpa.c | 2 +-
>>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>>>>> index c5ed7a3..27ea706 100644
>>>>>>> --- a/hw/virtio/vhost-vdpa.c
>>>>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>>>>> @@ -665,7 +665,7 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
>>>>>>>
>>>>>>>         features &= f;
>>>>>>>
>>>>>>> -    if (vhost_vdpa_one_time_request(dev)) {
>>>>>>> +    if (!vhost_vdpa_one_time_request(dev)) {
>>>>>>>             r = vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features);
>>>>>>>             if (r) {
>>>>>>>                 return -EFAULT;
>>>>>>> --
>>>>>>> 1.8.3.1
>>>>>>>


