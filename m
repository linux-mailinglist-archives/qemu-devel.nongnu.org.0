Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B85A85333E4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 01:26:41 +0200 (CEST)
Received: from localhost ([::1]:55648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdvA-0002Xw-Aw
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 19:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1ntdsX-0001ol-JA
 for qemu-devel@nongnu.org; Tue, 24 May 2022 19:23:53 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:44036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1ntdsT-0002DJ-Cc
 for qemu-devel@nongnu.org; Tue, 24 May 2022 19:23:51 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OJT7Vt018618;
 Tue, 24 May 2022 23:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : references : cc : from : to : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=mSbn3OTDBypFDGQDpKrrdBNOgswFwfsjaQ2DqRermEk=;
 b=AU7eleC0ni2ROE9K7Il0YrwOraFS4IFe4lEV7kZDkR3AsVLyDRDOyu3MjqEPbch8FJyv
 5uU9EQMJBgE7S8B77bICyFSqxwhEO4Eqg2ZyzPzxZefgGbh11WNyNuSsnu2FhD9ne4B1
 ewW4lhXfVo8neZnWeqr4C0rTfzPGUjKFj7Oj1sgDaGBOHKfxVYEV3JRKUx2UhsKrLlQl
 /78AIA3wpytLRRNaMF2NlVO1c+/Na98LbkxFX2d/ZlaHibNh8rV3qc5e7lcUolDMBsWU
 fIGzcT6u2Nbm4WHIn3dHFeFlAnUk9VTLYEMpsobFw/oslN2Zs0ffwa+gKzDjmYrKCdBW dA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g93tc0q4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 23:23:43 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24ONLR3r009770; Tue, 24 May 2022 23:23:43 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3g93wpy56m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 23:23:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tf1f01N6mpANDJdVX2+dixMi+XVk3eTRrtBwhZCi0QN0GXEaiAl5jlRmOEcIxP36h3RZdym/RwPBNrreO8LEXLjDHs0YJKxrpI8tY5WbknCZj88qnGxzHJz1Y+HrZmJq/1rhOp9EugswLD3gm1dRD7bA5VUIY5RqM/lZRAi11E8dywn1d2Oebh6GCUfVAYFNhYTu7S3+EK3ZnPhbN4/mLv+UB4/9tQLvExMGw+wRCkeUDVmEeC8WwfH37vwLdxcC8GozC4KuDW6/UmkCANGl5iZou2UVwstadiqKu0tP4jqq2gfQCm6ZB5J7549bEji5QyZphpzg+JGseXxga1foMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSbn3OTDBypFDGQDpKrrdBNOgswFwfsjaQ2DqRermEk=;
 b=SZ63gRl7JXisNXPs+NWCt31THnjwFX54UrYSce+rju8BB59vzKnxwc3LucrJtHlFhehN8JFE1UPyrCz8rQSmi+jFdjxwrjghBtIY79Q4N5LRq+P51Y9nGJZwVVYb9Odt14bqkhIhAojShYgxG4qkj5neaZbwQzAQCSimLw8wWLydWMRBZvUcmuLx0PGmnmuRYc4U7Fiw2MbGYxlgxkR7jIMRjW8twSMrrmpwHbzb8JwARbz9D20dhyKEFQeLiOvyt9sU9ojty7usj1nOQzZp8n6u7gxt5D257EvoMpz7tztcunYllbOfOZaFaho8y90ScrbHip4sgPIwlVUEY/gH+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSbn3OTDBypFDGQDpKrrdBNOgswFwfsjaQ2DqRermEk=;
 b=IZ1wWaNDhZKnhL56Dyiv6vUD/Vxes5mN4FleUMLTpq718VKDDa2K806w6ReW69vvVhg9N2K50JUdrLwSsc2DTT2LWPBRcSE2rANjGcu8lgiYkkflNbUE1qCOUC+0N1BVUqqqJC9GIG7kFvLeQw/uLL6ieATODR7NQdXyFr5y/Qw=
Received: from SA1PR10MB5866.namprd10.prod.outlook.com (2603:10b6:806:22b::19)
 by BYAPR10MB3095.namprd10.prod.outlook.com (2603:10b6:a03:157::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Tue, 24 May
 2022 23:23:41 +0000
Received: from SA1PR10MB5866.namprd10.prod.outlook.com
 ([fe80::e1b0:13b9:de93:cc66]) by SA1PR10MB5866.namprd10.prod.outlook.com
 ([fe80::e1b0:13b9:de93:cc66%6]) with mapi id 15.20.5293.013; Tue, 24 May 2022
 23:23:40 +0000
Message-ID: <eba71ba0-1a38-0878-46a0-b10886d4447a@oracle.com>
Date: Tue, 24 May 2022 19:23:38 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/2] i386: fixup number of logical CPUs when
 host-cache-info=on
Content-Language: en-US
References: <20220524151020.2541698-1-imammedo@redhat.com>
 <20220524171949.47508d9b@redhat.com>
 <e4df1ba6-1a11-21e8-e344-f5e24fa49ce8@amd.com>
Cc: Joao Martins <joao.m.martins@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Organization: Oracle Corporation
To: babu.moger@amd.com
In-Reply-To: <e4df1ba6-1a11-21e8-e344-f5e24fa49ce8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN6PR2001CA0031.namprd20.prod.outlook.com
 (2603:10b6:405:16::17) To SA1PR10MB5866.namprd10.prod.outlook.com
 (2603:10b6:806:22b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4c6d055-96b3-4d5c-c6eb-08da3ddc6ffc
X-MS-TrafficTypeDiagnostic: BYAPR10MB3095:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB30953902CBE58FC908EA3E21C7D79@BYAPR10MB3095.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o2MHJQMaOCUlnAr3j7GM4mHpHP5noIcGGrYygj30A8pbnqfCfrhLineAanqZH4PaACq29dupioz/pwxJYEoupp+eqX/RShDXMhRIwUezMx9slsqXkpMAcrdEzFGnY9/noaURXrmx+M4PGs1RdwtgfXvT00c6lKlVGKlybRTYnN9H5WMeAmY0mfKPYsPqkllNxkLkoGUc/LQnz7tcrNwV52GJLePAlAWvI4jm+BFGQw5osL/8VjDtpNH6s4ioV22TdcgJ7cHvZ6DGBLvOCIbB5cfz0qTFL4n2ArLtpA0dEKbQDeumfH1C3i1Bg3vPtPQ2C46CJyBRSJn33WwqSMvQMTsR8YhEb4uW+Dd56OHZMTnumZNBuIgCemnqWzufW7DWuy/JFNx8cqg8tszF4VYFusmZsQqPlrJYuhwhrb8S3pIPRptsk0cnveJbaIoyCPEzgwPCwO0SeOKGr1DUEjV6rv89jJ3eagGvv+Yliz91dSxMGwyKYgV8HPmlyysRjZroS44vLCU/WgQQ/stkrf6uYeXwHhQYfy/sOrEx0+wTg1mWKwu658wXb0xAwC2mhtIWijAnN2dSiX2tlAt1aNK0v5DN6TFl5ZIZ8Rsx44Y5wWMuDZhg8fdmCNyZ9KLB2l2J5m7pk5Dh9OzlURo1RwsdlobMFa+cOBXYQXzKWJlkvj++JW9f+62I5/TotmvtDvt11oVKPhXLm9AM1lVRA/CXqO5nbeHFBjnGZ2rnpSxaBxc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5866.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(83380400001)(5660300002)(66476007)(36916002)(6512007)(508600001)(316002)(26005)(2906002)(31696002)(186003)(53546011)(86362001)(2616005)(8676002)(66946007)(66556008)(36756003)(31686004)(4326008)(38100700002)(54906003)(6916009)(6506007)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEV3cCs4azEyRHNScGN1RldUcDNlQ1FxbVpUcmhJZEY0em9rbFlmM21EK1lP?=
 =?utf-8?B?Q1crNkg2Q0xDcGhPaFJtWEEvdkdpSjcxNTUrN1F6VTN0WUhDR0szT1ZncDd0?=
 =?utf-8?B?cUNsakRtd0tROGlqSHQwM3h0djYyNVBObkpaSFpSdk5lb0Q5ZldTRVBwUmV3?=
 =?utf-8?B?eWM1cEVEK29GeW41RG95ODVMb1pDa1lWMHFZT0hWSHdnWDFVenBtY1EvMmFX?=
 =?utf-8?B?aXBKcllmR1NxbmFQZjcwbnFwQ0RIbUphNW1LWDBXa2RxQTFYemh0TklpSW83?=
 =?utf-8?B?Nm5WVTZUTk5MRHNIQ2djNlV0QUlQMGVZY0JsQ0hnZkx2Q1pVZDBISkN6SEwz?=
 =?utf-8?B?Q0ZVZjU2UWhMbmJNSE9nR2J3T2R6di9Gakk1dXd3OHQ2MExuOVRrek5kTVJo?=
 =?utf-8?B?YnVHa0F6UVB2NXR4RlMxVkxqWStDUFZhS21uZEc3dGtpOXcxMUdmTmI5a0ZM?=
 =?utf-8?B?dzdoaTlzSENkQXkrNTNmaFVIdjkzOWFQV1JRUmVHTUpxZGcrZmExV1gxOGEz?=
 =?utf-8?B?bGxsSlQ1b3BiV0JYMU16TVJGbklWc0RaN0xUUlcyN29hUGxVb05HTzhFQitK?=
 =?utf-8?B?RE1KVG14SUhPaGcvanVZc3lIcTlmVzR3bU83LzJhQWtUWFNPVWtxZk13S25N?=
 =?utf-8?B?b3piMFZOcEZQSjFJQkRvMmdxQkVDZ1UzMHpPSEJ6ell5WFRkNjB3Mnhua1N3?=
 =?utf-8?B?VzNVOEdIUGRHcUdUNlVuYksvTEJkNjFWK3l4TkZaNTZEVDZuekRYZ2xWNXZC?=
 =?utf-8?B?aGZKNVcyZzFGNURyOXZzMmZWN2E4aVJTWUFYRmppdzhXeGp2ZDdkdjc5aFBR?=
 =?utf-8?B?dGgxQUFUNG5seTB2bS82M1JJNkZUMWJjV0RZUThXZDBMWmd3QW9HUUhlVnBv?=
 =?utf-8?B?a1oxRytEaVlkU3JOWXpKVFJzVTZ5UGkzZHo4UUt6NFNMek5pYUdZNHR3eFBL?=
 =?utf-8?B?bmFqem9DQ0d6cWM5cTFYMENidkRpREJXVkxyc3RPMEhpdm5mZEs2eWUxeXpi?=
 =?utf-8?B?OEFCd0txeUM4eXlUbGxDcTloVWFXYit1ZTFOT2J5WGNuallmdVUrTjlBVVZo?=
 =?utf-8?B?S01vS09jVityQWxyYWZzNXM2S2lQOEh1Vy9xVWNqSGhKY1BrM3ZabEdxNzF3?=
 =?utf-8?B?Q2FrbkEyb3NRck91dHZ4c0NtSURIMFJEUDcya2Zwbk9qNE9MR2NDQzAzeVFS?=
 =?utf-8?B?bS9yU0lFbHJ5ZnZpL3pVV2ZZbzNRM3k0d0g1VUdnbVZpa040KzNuZVF4TEda?=
 =?utf-8?B?Ky9YS2NrRjRpZkM0eUNCTm1Celo5NFM0YVlGclVBemM2U21jdVU0OENrb2Nk?=
 =?utf-8?B?TlBBbUd0OWRGVnlRdHF1T0R0WkwzcXRmbGs0bDZvbjBYanRBTlUyZ01rMFF4?=
 =?utf-8?B?aUExeUdHS21nNWxYQ2VmS2I4bTdBZjNxdnNMWVZMaFRKVTJkZ2FXOGd0OVlr?=
 =?utf-8?B?OXpiWUM1c081bjY2UkhHVzFldzFSMWNOdHFVc1hCd3RnZUlYaEpQOVBNaGl6?=
 =?utf-8?B?ekkwOGVFMDd5d2tNUHJ5NzRqUzlzUXg4cHNDa1JlV3FreGVhMnpQc1RyeHpJ?=
 =?utf-8?B?OVkwZGc1aCs1UEJHa3ZhY2xwcmtiWE8xM2VkNE9YbUtvQVpxeG01N28xTThC?=
 =?utf-8?B?MC9nWTFWcU9Bbk5PY3M0TGFNSXoyQ016VXhtV1gyNEh2Q1lWbmdkMzYzcU5t?=
 =?utf-8?B?d0l4cmo2ZFkzSWJYRkFibm1wYjN5NzJCaWZkd0VmaU5LbGFCYWJOZjRKU2kr?=
 =?utf-8?B?OEZRR0RRVm1KMHZOZEFxQk95SU5rY1YyQ09La3Baa0RiVG9OM0pJSm91M3dQ?=
 =?utf-8?B?Ykp1cC94QzBLV0VBcElZZGY4c0hhVlRacEhkMkVwdmlXakswWXV1cGlOMzBt?=
 =?utf-8?B?U1dnS2JjN2k4am5YcWdha2o3U2IzTWd2TytiWWQvelgvZ01HWGNzOUVMZi9M?=
 =?utf-8?B?Q0tuVkIyc21yWUppR3ZsVXJoZzFHSVU4VDNQSXl2ZFo5ZkQzRk9ibG41Sksv?=
 =?utf-8?B?dUV4WkxjNWJrQS9ZNHlsdnRqSmpnS0hYeVQzOEFBRHAxMUVndnl5N21pSWhu?=
 =?utf-8?B?S0ZBWFdJc1k0akxockRQcVZpSjUwbnZKYVRNV1B5L1pMK3RNdk11RXQ4Wng0?=
 =?utf-8?B?WjNNWExWK1ZRVEFBdVhIV0wxVGVHNklpRktWd2NJWUo5bTJUbEpKMUFLa2N1?=
 =?utf-8?B?WC9EODBlOHZEZTZ5Wjl5a1ZCRzF2cE9JNkRiSzVZM25JTzlFR3docFl3d04r?=
 =?utf-8?B?ZGNPZ1lTWTZEcWZaZGxJQTg0MVFEK0NRMEM5cVBqVXNNc2c0V083M1VuRlJF?=
 =?utf-8?B?YWhhbjlHVldIN05PR1hidlBBdEJtd3c4Nyt4SDlqUkN5TDVXbSs1S1dKenNv?=
 =?utf-8?Q?7OYZXL+cT4vUi3CeSVYWHMoOQT5CLuINj2W7K?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c6d055-96b3-4d5c-c6eb-08da3ddc6ffc
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5866.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 23:23:40.8835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGy1X8Kax60Wb+k57F1iDoN70YJim5HJvmbYaGlHNy9+41WVuq8FuOfH/+yVmzUKPQwtblaWXGfQS8q9mAZJVtw4uutJB77XOUHekojOHR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3095
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-24_09:2022-05-23,
 2022-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205240115
X-Proofpoint-ORIG-GUID: 4NRY_wl8EQrzH5mpKaXftZvMfiPfwbXu
X-Proofpoint-GUID: 4NRY_wl8EQrzH5mpKaXftZvMfiPfwbXu
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=alejandro.j.jimenez@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/24/2022 3:48 PM, Moger, Babu wrote:
> 
> On 5/24/22 10:19, Igor Mammedov wrote:
>> On Tue, 24 May 2022 11:10:18 -0400
>> Igor Mammedov <imammedo@redhat.com> wrote:
>>
>> CCing AMD folks as that might be of interest to them
> 
> I am trying to recreate the bug on my AMD system here.. Seeing this message..
> 
> qemu-system-x86_64: -numa node,nodeid=0,memdev=ram-node0: memdev=ram-node0
> is ambiguous
> 
> Here is my command line..
> 
> #qemu-system-x86_64 -name rhel8 -m 4096 -hda vdisk.qcow2 -enable-kvm -net
> nic  -nographic -machine q35,accel=kvm -cpu
> host,host-cache-info=on,l3-cache=off -smp
> 20,sockets=2,dies=1,cores=10,threads=1 -numa
> node,nodeid=0,memdev=ram-node0 -numa node,nodeid=1,memdev=ram-node1 -numa
> cpu,socket-id=0,node-id=0 -numa cpu,socket-id=1,node-id=1
> 
> Am I missing something?
Hi Babu,

Hopefully this will help you reproduce the issue if you are testing on 
Milan/Genoa. Joao (CC'd) pointed out this warning to me late last year, 
while I was working on patches for encoding the topology CPUID leaf in 
different Zen platforms.

What I found from my experiments on Milan, is that the warning will 
appear whenever the NUMA topology requested in QEMU cmdline assigns a 
number of CPUs to each node that is smaller than the default # of CPUs 
sharing a LLC on the host platform. In short, on a Milan host where we 
have 16 CPUs sharing a CCX:

# cat /sys/devices/system/cpu/cpu0/cache/index3/shared_cpu_list
0-7,128-135

If a guest is launched with the following arguments:

-cpu host,+topoext \
-smp cpus=64,cores=32,threads=2,sockets=1 \
-numa node,nodeid=0,cpus=0-7 -numa node,nodeid=1,cpus=8-15 \
-numa node,nodeid=2,cpus=16-23 -numa node,nodeid=3,cpus=24-31 \
-numa node,nodeid=4,cpus=32-39 -numa node,nodeid=5,cpus=40-47 \
-numa node,nodeid=6,cpus=48-55 -numa node,nodeid=7,cpus=56-63 \

it assigns 8 cpus to each NUMA node, causing the error above to be 
displayed.

Note that ultimately the guest topology is built based on the NUMA 
information, so the LLC domains on the guest only end up spanning a 
single NUMA node. e.g.:

# cat /sys/devices/system/cpu/cpu0/cache/index3/shared_cpu_list
0-7

Hope that helps,
Alejandro
> 
> 
>>
>>> Igor Mammedov (2):
>>>    x86: cpu: make sure number of addressable IDs for processor cores
>>>      meets the spec
>>>    x86: cpu: fixup number of addressable IDs for logical processors
>>>      sharing cache
>>>
>>>   target/i386/cpu.c | 20 ++++++++++++++++----
>>>   1 file changed, 16 insertions(+), 4 deletions(-)
>>>


