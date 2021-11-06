Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB26447020
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 20:29:54 +0100 (CET)
Received: from localhost ([::1]:33574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjRNx-0002EU-0g
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 15:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maciej.szmigiero@oracle.com>)
 id 1mjRMY-0001NE-2a; Sat, 06 Nov 2021 15:28:26 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:22392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maciej.szmigiero@oracle.com>)
 id 1mjRMV-0003U0-GU; Sat, 06 Nov 2021 15:28:25 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A6Dg8ih008966; 
 Sat, 6 Nov 2021 19:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ES+CAjBSNZyst1adqeGl2TUXlZAehX8BNVPXcuDHnNM=;
 b=mQ9n1f2bhavKZ5fFCF3VuYAOrpB2+wj8f75xgrgsM63GqhFYa11bOzSJ4ro/S1ChskuW
 4jNh5Z7yVx1HrPrC4Q5agxM9YRjiV1rZ7t59c0tfNRIw5gEn5kBr3lQq6gKS16sHxMmc
 qJCeAvjP6GA1NF8zM6Cm8zz37cRnsbSCJqbX6RKYLQ6Zkv4u+OiEjVRvBJP6si8W6cIZ
 borgA73AuTopP+4eq2+E6yRes6+/AGvuNTesBzWZTWa4cOr4DcsoOIo8TXzPJll2nDhq
 OUZqZwnI72KmvrVFW3LMvJPOzYsYivFY2N7ByVGXuEvQLenIXVZKIxgdjrlkYKDWyknl 0A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c5hassfbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 06 Nov 2021 19:28:17 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A6JBruL028017;
 Sat, 6 Nov 2021 19:28:17 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by aserp3030.oracle.com with ESMTP id 3c5frasnes-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 06 Nov 2021 19:28:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/sotjZJJYljYbbj1IQNwNgV+51ZKRLrFwPRWAdcGMhfwHLN88PchKgUXCKXs7R4DgKzBNR8ZJsUNELxSqEF5hDz6UYf8OonZRAnoqjcl6l3iyO9WYOohvT2ePDHNc5OdKmP6qaNyfOijNdQZAMeB3g+ZxBmeOy9HjAdPtoSPkvh/VszwSbz8owqMA0yAmMXVJ77niZrjgA/MLvRCErCUWtr+GAoAmRu52PDqEWmcLVapVZxVw0uweD/5H6XGV9pag2qPcLcY916VHZreqeWvAAIEaitV76hkQT9CkPqy/KV91T73iKusjLSEAUHR/3GYxNdFYv+xnduPDpVLmIxIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ES+CAjBSNZyst1adqeGl2TUXlZAehX8BNVPXcuDHnNM=;
 b=m62Gwolhigv/XKyiW69PwLjqiLXYXPHDQLNPKwy9eowSSbSOlL8AVXWrkRaXa3/9M7nUPSbsThtBxOnjgovNqbehdREV49WIYECX/9u3PbbZvlCtNcA8b9vGAbv/jeS48z6jt9KWwl+M6Gz0koWHj7t9jI6j77ASM7GF+UXe7PfsrOOj5UxaePZiG4MSmoxgal3yiOMtN1wSPTvziQzQADqgNCF6WRkurCU9+gm6kN01qdLpv5E93LGO7rDgrsLPnt198NCXyiU5qug1MACU+S+rpMs1k4ETJYwauWkaJhHIL1DYT0Acf76efa7QgJquUYTKYN8qHAkvK1toJqOdfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ES+CAjBSNZyst1adqeGl2TUXlZAehX8BNVPXcuDHnNM=;
 b=d9pFGzd1Bw2AOLb7tRSc7RVf4Pxqe4awPJ/M/Lwfc3ZaczHa15AX4tFLj0WUuDAZzk+zC/8qjraQbQRGu25MAyU+MVtju3jzC0uUVlfrltufOfWYzS1mkzDdTkn8D9YjpaKyjHYzgufMU02kmdbsTfh4X+2wcwCDvwrfOKNESPY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by CH0PR10MB5193.namprd10.prod.outlook.com (2603:10b6:610:c4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Sat, 6 Nov
 2021 19:28:15 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::74b8:818d:18e5:e6c6]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::74b8:818d:18e5:e6c6%6]) with mapi id 15.20.4669.015; Sat, 6 Nov 2021
 19:28:15 +0000
From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
Subject: Re: [PATCH v4 0/1] hw/hyperv/vmbus: Is it maintained?
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20211106134155.582312-1-philmd@redhat.com>
Message-ID: <e9c29f4d-d5d5-34aa-8311-7ad1fc05b7d6@oracle.com>
Date: Sat, 6 Nov 2021 20:28:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211106134155.582312-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR1001CA0034.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::47) To CH2PR10MB4008.namprd10.prod.outlook.com
 (2603:10b6:610:c::22)
MIME-Version: 1.0
Received: from [172.20.10.2] (37.248.221.202) by
 AM5PR1001CA0034.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Sat, 6 Nov 2021 19:28:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd0f89d8-653f-4fb6-a440-08d9a15b9430
X-MS-TrafficTypeDiagnostic: CH0PR10MB5193:
X-Microsoft-Antispam-PRVS: <CH0PR10MB5193B733014724C3A78D3EC7FF8F9@CH0PR10MB5193.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HcR6yHhJA8gdtiQ8R9fBWf3LG5311eTJfzjdMKcJJeRJHkixSYT5r0v9OalrgT7DXVqI7LcYGzZXBR0nfYKO8p+Q3YasBg7eOMY8yPkoBiXVdM/VJn1Vq7D3jSaKQwCkyFhYn99gpWlxtPz09lqhhXWsdJyFhfbd70CpueryUkEIVZ8ar5rDFltqgjC8oInR2cK81wbxGoHJPhC2MLHiAM1SUDpHn2Y37CBZ9FDUsIVKl6iwvO0TEc+5pmlOBqfC8w/jYO712ZMkZGz/m0F5DNqJMKGYC1vCOO64uVHVyF0WPnDJVc6dWTqsRVhDJXX+8DfPw++TUWzY0Zk5CVGMDY1vPcd6xPUgUmdnr1TfektbLON8AsN+CbdfHcsK+LSXXVmx1Ckv4OyEJE4IA3GB9JUzCcWiIFSX1AiqtqQjDe6rbaBvzFtNHBvRXUokOct2ztB41n/6e8DYgsizofZj4DttRtdqKAPbaX6P0fbCJGs+gEdVVNoXZj7IRYKWcrGJLq2Adns5zBKIgIzlotxoijWm88L3QGlZbuJs6MqDWSMZ6m7aDcpqQpUE4O3OddfVxHe8iQSBzRKzCzUaP6G2Y7iM6A5JOdGVB1JPTdq9xTQW8ElA4xhxSkQV82xjMq/F5IC60RYpjcFQuM+UvMGzrtxv44UySgyKWsQ0e1w58TESP6xCleKAlKveB6jVv/4oaXV9Teq7EU5TfCGDsVAo11ITCxdiZdRuVGoiv5XfP7nRwDoQaUmiQ3Q3Ptbl9c/wvqEtQ+Gnj0ohKZZJc44QUOh9j6U1iRAaACOJOuZj0YoE9IaFSTL5YoArjJDSVbHq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31686004)(5660300002)(6666004)(38100700002)(186003)(86362001)(36756003)(508600001)(53546011)(31696002)(2906002)(956004)(2616005)(66476007)(8936002)(966005)(8676002)(66946007)(54906003)(4326008)(66556008)(316002)(4744005)(26005)(6486002)(16576012)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUJvS3FVbDVVWml2MkZXeDRDT0R6Sjk5N3MvT0oyV2VOR0hneFk4N1RzSlRm?=
 =?utf-8?B?UXEvcXlWMUFqY3NYVk9Ic1A3R2c5VzcvT2d3QnBSTFhqOEZmVUV1MUg1SU9s?=
 =?utf-8?B?b25pZjFTaElheGJKZDlnMnpuOXdXMVVjd0VMMnRPWmVmNTBpZEJMMGhhWWp5?=
 =?utf-8?B?dVZzSUp5c2U2M1pGMkdubTZiR2tWcXRzc1BaaDA0NWE0Um9rb254ZGRRYzda?=
 =?utf-8?B?bmt6TWdCbHVnNHpTR0gybTFBT0tiTmR6ZDZlcWJySm9RVDZWb0NOK0ZLTG43?=
 =?utf-8?B?eXk2eEthQmRrRE1lSm9PN2s1dUw4dVRmakFRQjQ2WFM5ZmN0dHFXdW94Z0VK?=
 =?utf-8?B?K2FYL3kxdFc0Yk9OTUdIV2d1alBvcStYSVM2Z2FqYm8xTHlRQ3pYaC9scGlS?=
 =?utf-8?B?K3hSK1A1SGcwYXV4YXRjTDUyN1k2MXo2cXBXK3oxRmZPOE8xSmVGWGNzRW9T?=
 =?utf-8?B?WnJjRjJWbmNiYWtHU0dCMFU2RTZ6RnhUbHJqT3hGUTV2U0R1TmNtZGllakRk?=
 =?utf-8?B?SFFGZjFiSVgxNTcxL3doQ0VrSTB5cnd4Rzl1ZW1UWCtrUGlNWXQzSnA4N010?=
 =?utf-8?B?WklsQVRRMnBqbUFxMXlmbWZMRlpEQ245cW9pR0dGZ09sVCtuYlNTSHlvY0Zt?=
 =?utf-8?B?ZFNUVW0rNkxtVmZHVVBpa2UwWlpXS1ZMeVdaOWx2UTFSNmw0ektTVlVlWENy?=
 =?utf-8?B?azFQU1NnaElNdEZmc3YzRVIvdTlmL3ZvMGJ1T2w0TndmdGxlUFgyejBuMmVV?=
 =?utf-8?B?aXZkRmZkdXRFNUpkT2JNazJndkwyMitTbXB3WnRHTDBrK056L2k1Zkw5c1VN?=
 =?utf-8?B?S0RnK3hkTjU5bWNUcHFlTktJR1hna0xRcVBwK3dVbHJlSFk3WlpsSG1lTlNM?=
 =?utf-8?B?QVlKRVlkY251WmJ4UGxTcFJGeWtzK1RSMktYWlU1Q2d0YmpTOHhTUUtYd2Zj?=
 =?utf-8?B?dFdPMzhxbEtySjdnbWF4OGhQaFhycSttZVFWUGU0M0N6THlxZzVrcnhLUWcr?=
 =?utf-8?B?d1l5L0lIdzJnMlNvMEJUbG8wY0FTNlNFRkpSWGNFYWMrRlBIdzR6WWN5c3BH?=
 =?utf-8?B?cTZuL2EzdzFVamFZOWFnWnRBRDVOSTZ5ai9odFRpZzgxM2NQUTRoNjlvV3gx?=
 =?utf-8?B?NytHV2JUWjhwRTUzZHNRQnhQWU9rb2NCdzVOazJkVy9CT3lDb3BvK3ZNTDFp?=
 =?utf-8?B?ZzJjK0J3WExjZXh3TkVON0g4Nit4V3ZsYVNET2pabVFkb1JwZjl0dVpxRU1Z?=
 =?utf-8?B?S05uYzZ2RklrUG1US2NVYUk4OWFlQ2JXY1lpRHVMTjJUUSt3b1AxQU5namQz?=
 =?utf-8?B?Rmp3VVNUZFpKandwRURTM3ZibTlFd2s0UlZHVFR4K3dhd2pKYlVaaVB2aTFN?=
 =?utf-8?B?UGhVMGtSZEJSZ2I2R1A0SWxLNlhySGtMR1ZPNmN2azkvYWdrVWJVclgwZUEy?=
 =?utf-8?B?WWVDV0VoSkdlNWE4UWVUZFViWkdsQTJmY2ZIRlhkWXVGVjRwM1R6NHlGaFha?=
 =?utf-8?B?bU4xY1BQVUpHWmVRVzZRTmwxRDFHY0RWU3RVdGVRUFF2KzRGSHh0eVp5aVNQ?=
 =?utf-8?B?OGpUZnhuSCtBYzBnZlE2MEg3cGFNQm96UDROaURyTFRKUitzTVdtQmtHaUNt?=
 =?utf-8?B?bWpzZHFuOFdrMVRyOHNzc2tNRmh2dXp1ajZTQVdnVmJ6Y01kSUl3TkFuSmdJ?=
 =?utf-8?B?dktURzdNeE1sU1g2Q2Y1SzhtbDQvLzN1ZW5KV2d0RTFEYVdOWjBBK1EwMUwz?=
 =?utf-8?B?VWpZeTU2R3VtWHg2MndsbmRWT2c1SlkzRk94dmYrbWF1R0VDMVpMZk1qOXpO?=
 =?utf-8?B?RjJKdklRc21hdElBek5Uai9WOHdQUnE4TlZkQXZORy95eVdXTGVDQjhKVHVT?=
 =?utf-8?B?TjdtS01Sd3UrajBycEhmVko2cnJYS1lpT0hiVWdrRWFPRlJhOTR4R0Jwb0Vx?=
 =?utf-8?B?akU4bXdqM0RZUzBnSHJOR3dEaGkwV1VXTyttR29ibHF0NmwweURXbWliZVJS?=
 =?utf-8?B?emNhYnFScHdqaEswT3hPako1QXZoV05ZcEI3MGNWVWtoUmJQOWM0YjE5Zklw?=
 =?utf-8?B?Nk5FU2c4MUV5OFVUckNsV3V6bTkxUUh4K0FpSDQ0T1ByWW1jTUtIdTBoVzVP?=
 =?utf-8?B?WUVLMGk0WTE2U0lkd0VMaWcrMkI1TUFnM21OTHR3S0Y4aFl1d3ZtRHR2eDJX?=
 =?utf-8?B?RDNLcC9BcjFlQk9QTHUwcHd2dmpPUHpaZzh1UlpUS0duSnd6ZWtjRGMxVXdU?=
 =?utf-8?B?Q0tVek9rYnVzb2RVbzdmK0xqc05BPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0f89d8-653f-4fb6-a440-08d9a15b9430
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2021 19:28:15.2266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FkRkiZRQU0NkWOK+MTzv/RqCyTuZNDrMoDDm6W7+fHaU7HyFt19NbVCWrkIE0oRZnqd4H6b0gMfKzFEVzFlWN0jrSurtkt7xC7Pcum2+aY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5193
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10160
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=898
 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111060120
X-Proofpoint-ORIG-GUID: JeoWWBdzeyZunWPP04TJfsLFNAdMJk4Y
X-Proofpoint-GUID: JeoWWBdzeyZunWPP04TJfsLFNAdMJk4Y
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=maciej.szmigiero@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.407, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jon Doron <arilou@gmail.com>, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Roman Kagan <rkagan@virtuozzo.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.11.2021 14:41, Philippe Mathieu-Daudé wrote:
> This is the 4th time I send this patch. Is the VMBus infrastructure
> used / maintained? Should we deprecate & remove?
> 
>    $ ./scripts/get_maintainer.pl -f hw/hyperv/vmbus.c -f include/hw/hyperv/vmbus.h
>    get_maintainer.pl: No maintainers found

There's an email thread at [1] explaining the reasons for having VMBus
infrastructure last time such question was asked.

In short: mere presence of a working VMBus is needed for some high-speed
Windows debugging, also people are working on VMBus host device drivers.

Your patch makes sense to me, so for it:
Reviewed-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

Thanks,
Maciej

[1]: https://lore.kernel.org/qemu-devel/20201009193919.GF7303@habkost.net/T/#u

