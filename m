Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FB0650CAB
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 14:33:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7GFd-0004iU-1H; Mon, 19 Dec 2022 08:32:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1p7GFS-0004hd-1e
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:32:06 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1p7GFK-000633-8M
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:32:05 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJDEUol032330; Mon, 19 Dec 2022 13:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=p2y/BMebQ8tkJcTZVBOrR+j1ZfT+Ew97X8HpbLu4U4I=;
 b=XwwI5dbh0H2okcCbzUQeW4Tdm4NdfdZvr511KJuVuri82d7gdVT7lg/xspFYBc10R9yc
 RAbiDPHgDzNrvjrqnWKk32apTTG3i6grEVocgEfKSJPZ9PcVitQSbSC7MqSYAZoTHY3O
 oE/dWF8bO/farsWYirH+pv6ojBWlXwImcKKMhT3DhOrqfwG+njIjxHOrXSYHED1ijETT
 O41U8ZvGSzwByGcRzTZ0qn2ZBl3U9y9WjQ/AvKF/dABVJUtAuCtFxgHBEelHOOEiX21K
 q/cY0A31RQFeYprCd+3BPQt8/lP6eo1zVRtSaEnV630+dAkX+dq2B6krDrMpwy1fwPy/ JQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3mh6tn2twv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Dec 2022 13:31:48 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2BJBBBEw024752; Mon, 19 Dec 2022 13:31:47 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3mh479sv6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Dec 2022 13:31:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFSkNz+QVrkweZtNuFJ0Yuhg0TZbr/R50dEW9AVMxLzbWtc9sM826+UqiAExxnbZwuBvyt+t1xUGf/9NWGeSSLNiAz8jyBxbsCSMKTVKhRw3SewpvOu2PDZi96b3trId0cdXXhTDPM1SqAbv86UMZ/tIWMcbslvfogcukndJXzHM+yHCOBIzS/wkEugFVf57HQh4TJD3jORKjbSbOX2XU1xKkVdlQo2KVQZqmFb8vM8oiEVTHSwRU+K8ZSqm0x+b8xg+jr4+WHT5t6OX2YVLuttAgcNGY6563MbpeXB3uDOqLFkAXvz8HW4t7HgZk9FimOVTJJSYLl29Plm9mv6hXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2y/BMebQ8tkJcTZVBOrR+j1ZfT+Ew97X8HpbLu4U4I=;
 b=K58Mtfa0rznR0TKg2s5lQq88TkDWiUMsAn0WVrXQ86Sn+qyIVMAGhGZao5cRnStpvKNu2qNDcKjVkRvkblNi/FNiJ570Eut6f9ux5zweKpgKQ9ZxbfABlUjoycVyGx8wue1G51XkNtyAzRkautBmpBPj0ZrPPQ2QP6nmmdFc3pNuaInJ+YBqCXarGq0ahDGm+sFu8olAr+zTaiQcjLj2s65STwbRNXpYTfSvpwO2MUpvXYmpGqZSje5dSVdAY+Dg0ye21J51UJ7KAMr8FRRHD+MoLOl9TS8cYoOkYJeI5i+hvvAODUhgEUh9avj2b//QYiWQG1EGEf5OyvkwgXVlRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2y/BMebQ8tkJcTZVBOrR+j1ZfT+Ew97X8HpbLu4U4I=;
 b=Q9GH8YEZePallXyqS8ku/UYHArWQflS5cH5o5tHqT9LCHw/wTz0VIJydvefamGvHrVzB1JDSlC98MTWhCSd19zpxcBIM2Lf+dAOIQL8kk6DSZ6GEGAKUW+fxUnpLHoiEAN/eEnCQe3K0zxLh9lO1u+e8HwiNeYw0kP8ZwYMEk/U=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by CH2PR10MB4149.namprd10.prod.outlook.com (2603:10b6:610:a7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 13:31:42 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c449:15e4:b116:e06b]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c449:15e4:b116:e06b%8]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 13:31:42 +0000
Content-Type: multipart/alternative;
 boundary="------------d9NLnOXxQiMLiD5hcnPaVJkp"
Message-ID: <5698a91c-a181-a8a9-f19b-32ebe5ecb46d@oracle.com>
Date: Mon, 19 Dec 2022 08:31:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH-for-8.0 v2 6/6] hw/virtio: Extract QMP related code
 virtio-qmp.c
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>
References: <20221213111707.34921-1-philmd@linaro.org>
 <20221213111707.34921-7-philmd@linaro.org>
From: Jonah Palmer <jonah.palmer@oracle.com>
In-Reply-To: <20221213111707.34921-7-philmd@linaro.org>
X-ClientProxiedBy: BL0PR0102CA0047.prod.exchangelabs.com
 (2603:10b6:208:25::24) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4664:EE_|CH2PR10MB4149:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a754d7c-2da9-48e6-29d7-08dae1c55d7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jMpDmEnBxdu4JD6Px6hG3f0gF1GxvRPMTlu562YQfJ9c6AOn15wpShXKMdP/nx057WgkSzhbXeKyg7NsE0oY7FCxGdpv1gwJLZLlWRLOlvG46tbfsaZn4adzQt4jk5NU7XHSra2FORpqoF06dYBYnXU2uz6wyIOuf5+NUkVnyz+Fe0TSq1msD4I4pybWcOjfJsrdKKQ5HGnHX+DPCrPCUQEvXvs/k6MLjs0/AO2xAweQz9w9FiDtu23Vo9j48xVyvzx37yfx0X0hZdEJ3ddya/zW/vL+WFft894wl4xplKrYfKNSQNb6KkgTGvE5UVEhyo5+Bmp6sH6oCwY6W29sSEStxxiTMNnVtUwvuQzkvBEesjAsELBqcsvKhZCb4XS7QAfcJ/z+Jyfiy21NmQ7RjsiHnuTL/mQskvskr3zVEqXS2TSNFhsDte1DCH59SejC6U6Y99M1WFGVnBOguYSc2da2Lk3algdVLQEN/F/SD1Zf+DjfX5OTMu8kTCqsS3hH/4/qpBDK46mMXnDjWXWJewyDFEk6Zq7y1DEPbNjsoTot9SzUGGfRpkY3eSpv7dvfI0/kLfi+DZvb+mnvJqHv3t4LKq1uX7Tr2iNe2UaRv4MjsVXBrCY63EejOQQNW/ykoI9pvni7yQE+jo/FKwsQzCPYCpnKzRvszJmT4cy/437SRdvTuvx2Jy9Hvd6fJzwl7Y/qspb8XZjn8B2dnmd1pjnPRdf1rVZYGrXJ+R4fCcTtWgDxU/kSoIyw2S6t8GYg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199015)(83380400001)(38100700002)(66476007)(5660300002)(31696002)(8936002)(30864003)(86362001)(44832011)(66556008)(66946007)(8676002)(2906002)(41300700001)(4326008)(33964004)(6512007)(53546011)(6666004)(186003)(26005)(6506007)(54906003)(110136005)(2616005)(316002)(478600001)(6486002)(31686004)(36756003)(21314003)(45980500001)(43740500002)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1FHU2lPdGcvc3pXY3E0b0hKZFp1SzdUMGRPVXF3cHRPQ2lpSmxjZVhGNkNr?=
 =?utf-8?B?RCtwK2xoTURsbEp4cE80MXBvSHBBOFhFUklqNlFjUVZERWJIcnZ0UlhzNnYw?=
 =?utf-8?B?MUw2T1NaZ3Vhd3FRMEc0YjZaeGYzMSt5aGx4emIxU1NqNXc0WHl3SUhucFBz?=
 =?utf-8?B?Vjh4SklwNGo1d2FpVHo0eGVSbElUOFpYS2x4a1didEh2MmVpLzl3TW1TOUdP?=
 =?utf-8?B?VE11TjBRekdQQjJMWk8vNXRUZldQRS9tSWZMNTN5YUFMRno4VXRPVkdDUFpH?=
 =?utf-8?B?U0xMdlRqRytrNU5vRU5KN0lRLzZEb0JMKzI1NGNFR0tCbDFPN21WdnNYQWdF?=
 =?utf-8?B?bnhKVWdvSVU4SmROVnlEUmtheUl3THpxNlZUZk01dzg4VDNHRDlTK0IwNzJ1?=
 =?utf-8?B?cEc1dEQ0SDRINjNLemZCbFdPQVp6MVo5Syt4SzJtcTVIN1R4Zlh6Y0EyNm9v?=
 =?utf-8?B?b0hXeUhJVVhRdEt5MWYvVWJ0MCtFc3RKK3NOT3dKakVUTHdFU1B3bWNYZXNi?=
 =?utf-8?B?aUVKZEZnK0htVk1BbTArcU1rOTBSNy9vQnQvZVNmcDhKUGh1K3ZmNmxWajYw?=
 =?utf-8?B?dDVPUFpsVHV2Njc5andDa3E4emZuRjltZXVLcVcxT3ltdE1UeXJ5QlRJUERp?=
 =?utf-8?B?RDNqRjRxRmhwOXNCWXVhSkRzSzV4OE1McFhpN2RzWFVkR3hRbUhQTnJsQ2p4?=
 =?utf-8?B?QzBjN0xnQncyUHRjVDRvVloycXp4NlVxUU9PaEs5ZW55KytVYkhPcWdNQmsx?=
 =?utf-8?B?V3hVSEtOUmh6QkU0MWxrb3c0VVo5NStJRndqVlU5UDRFNFdERFhBUitMa3pz?=
 =?utf-8?B?dVBES3JvWHV6Q3pzMzdGQzhZbXNTQlA1K0czZ3ZVM2JwdFVDRDNjVEJzbE1H?=
 =?utf-8?B?SXlNaGc2Tzl6QmRzYnF1RzhiRGlLOTl2Yk5JS3JwYmxzcU9pb3BaV2xYYmRI?=
 =?utf-8?B?Y3FneTIydk1ZVXZFSXNnRTVULzNTWTFVeko1TURBdHpjZDNnRUtnUTFSS3JL?=
 =?utf-8?B?aWJITlhFdGNqK0ZqL3JMekVMT2g4QldhOThHOFFEQ05NUHh0WXlMdlJaZVlt?=
 =?utf-8?B?YUo2b0VYdEN1OUFwelNxbW8zcWpVYU9GVll3SUcyaWJOcmlGeUNLSWgyVDN6?=
 =?utf-8?B?dUQ2UHYwQWtURzZMTUplclhGNzJrNVF0T2FLODlxZVErV1FFSHZnQ1B4QnFR?=
 =?utf-8?B?UUNSVHR5OWh1eXU3cXZRVVZsdkJCcXhGeWw5NjQxRGRCS21zYzFoRDJveWE0?=
 =?utf-8?B?N21NRGZ5R3NVeUhwY29uRnFOTFV5RlhVaXphNWJjOHRldFFjLzB2c3JYLzBx?=
 =?utf-8?B?NHp6d3NnTWxGdHV5bndCLzE4OHpocVpLTjB1U3JPZWdBYjZlU0VVUVE2VHBK?=
 =?utf-8?B?YkVXOVVtSmg2WFFXdmI1OUdDS0FOOHFpM1ByLy8rK2tLMS9jQ2RGM3dDQVVV?=
 =?utf-8?B?NGNWUG5ZOERRLzA1REU2QktTNEVSYjhrTFZYZEY5S1hUUHowQ0Vkeno4VzZP?=
 =?utf-8?B?R2N1cjNBU1gyVldxZmkya1ZSaStBNThUaUQzVzB3aTdpUlhVTWlLV280cm16?=
 =?utf-8?B?R0FGNlAzd09HOGRDaU5IZDFsTkxuVERaV3dZa2pXbk84K3kzVjY2VTB5bGpp?=
 =?utf-8?B?dHVDWDBYb1FIekZVS2NWRFBhQkF0dEFTSHQ0LzNCcCtWQWhEeVRnNFFWMWVN?=
 =?utf-8?B?RmNTMmdHYlJlL2tBelZ4aU5aNTRXTnRqeVlieUNsWnZQYWZyZ25JNmhFVU1h?=
 =?utf-8?B?RE1JcENEUlVSVnppUWdjaThqWXVIZ2tWckQ4eExvNkFPUXVUeHBqVVZQNWhX?=
 =?utf-8?B?UmovdTBzS0pQQloxczhDSjRLeU15S2RBWnd6ancvT0VFVG1LeVNDSUZEZjJt?=
 =?utf-8?B?blczeFFWK2dDTFgwL3hCd0tTMWNRL1YyYm1vWVBqTWVTMlZIK0pvS1VFSFRk?=
 =?utf-8?B?R1BzWkc0THpXd2dyNENQcytyR2I2eGhydTlrTTBrTEJMSWNlRG5pdFhWTjRy?=
 =?utf-8?B?dXcxeDcveEFhY3BJK3plcGx1NUJuaXd4TnluNkpCRHc1N1BPQk9xVVBDNEpq?=
 =?utf-8?B?SVF1QnVEZmlKclFyVitSWnNCZGVKWXBrODUwU282YUFmVFBuczBnTTJIdHF6?=
 =?utf-8?B?SysvZHRBTWFMWGNHK2ZVMHo3Y2Qyb3pRYTd3WnQ3d2RZNURncG5pYWRLOTl6?=
 =?utf-8?B?eGc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a754d7c-2da9-48e6-29d7-08dae1c55d7c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 13:31:42.1446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zl6tz9f5Iw1UDr1M81kZK4CloEIqx+5Tm/rWDSwzNWvDND9xriSgwX2RFIrlzqgrPcEsn9vEzv4RCEhMHoQDmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4149
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190119
X-Proofpoint-ORIG-GUID: 69HKtjkof-s6Y8DP4anouMf-In0H4_OM
X-Proofpoint-GUID: 69HKtjkof-s6Y8DP4anouMf-In0H4_OM
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--------------d9NLnOXxQiMLiD5hcnPaVJkp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/13/22 06:17, Philippe Mathieu-Daudé wrote:
> The monitor decoders are the only functions using the CONFIG_xxx
> definitions declared in the target specific CONFIG_DEVICES header.
>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/virtio/meson.build  |   2 +-
>   hw/virtio/virtio-qmp.c | 659 +++++++++++++++++++++++++++++++++++++++++
>   hw/virtio/virtio-qmp.h |  20 ++
>   hw/virtio/virtio.c     | 635 +--------------------------------------
>   4 files changed, 682 insertions(+), 634 deletions(-)
>   create mode 100644 hw/virtio/virtio-qmp.c
>   create mode 100644 hw/virtio/virtio-qmp.h
>
> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> index 4a3b00d3bf..d506017760 100644
> --- a/hw/virtio/meson.build
> +++ b/hw/virtio/meson.build
> @@ -5,7 +5,7 @@ softmmu_virtio_ss.add(when: 'CONFIG_VIRTIO_MMIO', if_true: files('virtio-mmio.c'
>   
>   specific_virtio_ss = ss.source_set()
>   specific_virtio_ss.add(files('virtio.c'))
> -specific_virtio_ss.add(files('virtio-config-io.c'))
> +specific_virtio_ss.add(files('virtio-config-io.c', 'virtio-qmp.c'))
>   
>   if have_vhost
>     specific_virtio_ss.add(files('vhost.c', 'vhost-backend.c', 'vhost-iova-tree.c'))
> diff --git a/hw/virtio/virtio-qmp.c b/hw/virtio/virtio-qmp.c
> new file mode 100644
> index 0000000000..8e7282658f
> --- /dev/null
> +++ b/hw/virtio/virtio-qmp.c
> @@ -0,0 +1,659 @@
> +/*
> + * Virtio QMP helpers
> + *
> + * Copyright IBM, Corp. 2007
> + *
> + * Authors:
> + *  Anthony Liguori<aliguori@us.ibm.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/virtio/virtio.h"
> +#include "virtio-qmp.h"
> +
> +#include "standard-headers/linux/virtio_ids.h"
> +#include "standard-headers/linux/vhost_types.h"
> +#include "standard-headers/linux/virtio_blk.h"
> +#include "standard-headers/linux/virtio_console.h"
> +#include "standard-headers/linux/virtio_gpu.h"
> +#include "standard-headers/linux/virtio_net.h"
> +#include "standard-headers/linux/virtio_scsi.h"
> +#include "standard-headers/linux/virtio_i2c.h"
> +#include "standard-headers/linux/virtio_balloon.h"
> +#include "standard-headers/linux/virtio_iommu.h"
> +#include "standard-headers/linux/virtio_mem.h"
> +#include "standard-headers/linux/virtio_vsock.h"
> +
> +#include CONFIG_DEVICES
> +
> +#define FEATURE_ENTRY(name, desc) (qmp_virtio_feature_map_t) \
> +    { .virtio_bit = name, .feature_desc = desc }
> +
> +enum VhostUserProtocolFeature {
> +    VHOST_USER_PROTOCOL_F_MQ = 0,
> +    VHOST_USER_PROTOCOL_F_LOG_SHMFD = 1,
> +    VHOST_USER_PROTOCOL_F_RARP = 2,
> +    VHOST_USER_PROTOCOL_F_REPLY_ACK = 3,
> +    VHOST_USER_PROTOCOL_F_NET_MTU = 4,
> +    VHOST_USER_PROTOCOL_F_SLAVE_REQ = 5,
> +    VHOST_USER_PROTOCOL_F_CROSS_ENDIAN = 6,
> +    VHOST_USER_PROTOCOL_F_CRYPTO_SESSION = 7,
> +    VHOST_USER_PROTOCOL_F_PAGEFAULT = 8,
> +    VHOST_USER_PROTOCOL_F_CONFIG = 9,
> +    VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD = 10,
> +    VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
> +    VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
> +    VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
> +    VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS = 14,
> +    VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
> +    VHOST_USER_PROTOCOL_F_MAX
> +};
> +
> +/* Virtio transport features mapping */
> +static const qmp_virtio_feature_map_t virtio_transport_map[] = {
> +    /* Virtio device transport features */
> +#ifndef VIRTIO_CONFIG_NO_LEGACY
> +    FEATURE_ENTRY(VIRTIO_F_NOTIFY_ON_EMPTY, \
> +            "VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of avail. "
> +            "descs. on VQ"),
> +    FEATURE_ENTRY(VIRTIO_F_ANY_LAYOUT, \
> +            "VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts"),
> +#endif /* !VIRTIO_CONFIG_NO_LEGACY */
> +    FEATURE_ENTRY(VIRTIO_F_VERSION_1, \
> +            "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)"),
> +    FEATURE_ENTRY(VIRTIO_F_IOMMU_PLATFORM, \
> +            "VIRTIO_F_IOMMU_PLATFORM: Device can be used on IOMMU platform"),
> +    FEATURE_ENTRY(VIRTIO_F_RING_PACKED, \
> +            "VIRTIO_F_RING_PACKED: Device supports packed VQ layout"),
> +    FEATURE_ENTRY(VIRTIO_F_IN_ORDER, \
> +            "VIRTIO_F_IN_ORDER: Device uses buffers in same order as made "
> +            "available by driver"),
> +    FEATURE_ENTRY(VIRTIO_F_ORDER_PLATFORM, \
> +            "VIRTIO_F_ORDER_PLATFORM: Memory accesses ordered by platform"),
> +    FEATURE_ENTRY(VIRTIO_F_SR_IOV, \
> +            "VIRTIO_F_SR_IOV: Device supports single root I/O virtualization"),
> +    /* Virtio ring transport features */
> +    FEATURE_ENTRY(VIRTIO_RING_F_INDIRECT_DESC, \
> +            "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported"),
> +    FEATURE_ENTRY(VIRTIO_RING_F_EVENT_IDX, \
> +            "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled"),
> +    { -1, "" }
> +};
> +
> +/* Vhost-user protocol features mapping */
> +static const qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
> +    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_MQ, \
> +            "VHOST_USER_PROTOCOL_F_MQ: Multiqueue protocol supported"),
> +    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_LOG_SHMFD, \
> +            "VHOST_USER_PROTOCOL_F_LOG_SHMFD: Shared log memory fd supported"),
> +    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_RARP, \
> +            "VHOST_USER_PROTOCOL_F_RARP: Vhost-user back-end RARP broadcasting "
> +            "supported"),
> +    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_REPLY_ACK, \
> +            "VHOST_USER_PROTOCOL_F_REPLY_ACK: Requested operation status ack. "
> +            "supported"),
> +    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_NET_MTU, \
> +            "VHOST_USER_PROTOCOL_F_NET_MTU: Expose host MTU to guest supported"),
> +    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_SLAVE_REQ, \
> +            "VHOST_USER_PROTOCOL_F_SLAVE_REQ: Socket fd for back-end initiated "
> +            "requests supported"),
> +    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CROSS_ENDIAN, \
> +            "VHOST_USER_PROTOCOL_F_CROSS_ENDIAN: Endianness of VQs for legacy "
> +            "devices supported"),
> +    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CRYPTO_SESSION, \
> +            "VHOST_USER_PROTOCOL_F_CRYPTO_SESSION: Session creation for crypto "
> +            "operations supported"),
> +    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_PAGEFAULT, \
> +            "VHOST_USER_PROTOCOL_F_PAGEFAULT: Request servicing on userfaultfd "
> +            "for accessed pages supported"),
> +    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CONFIG, \
> +            "VHOST_USER_PROTOCOL_F_CONFIG: Vhost-user messaging for virtio "
> +            "device configuration space supported"),
> +    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD, \
> +            "VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD: Slave fd communication "
> +            "channel supported"),
> +    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_HOST_NOTIFIER, \
> +            "VHOST_USER_PROTOCOL_F_HOST_NOTIFIER: Host notifiers for specified "
> +            "VQs supported"),
> +    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD, \
> +            "VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD: Shared inflight I/O buffers "
> +            "supported"),
> +    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_RESET_DEVICE, \
> +            "VHOST_USER_PROTOCOL_F_RESET_DEVICE: Disabling all rings and "
> +            "resetting internal device state supported"),
> +    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS, \
> +            "VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS: In-band messaging "
> +            "supported"),
> +    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS, \
> +            "VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS: Configuration for "
> +            "memory slots supported"),
> +    { -1, "" }
> +};
> +
> +/* virtio device configuration statuses */
> +static const qmp_virtio_feature_map_t virtio_config_status_map[] = {
> +    FEATURE_ENTRY(VIRTIO_CONFIG_S_DRIVER_OK, \
> +            "VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready"),
> +    FEATURE_ENTRY(VIRTIO_CONFIG_S_FEATURES_OK, \
> +            "VIRTIO_CONFIG_S_FEATURES_OK: Feature negotiation complete"),
> +    FEATURE_ENTRY(VIRTIO_CONFIG_S_DRIVER, \
> +            "VIRTIO_CONFIG_S_DRIVER: Guest OS compatible with device"),
> +    FEATURE_ENTRY(VIRTIO_CONFIG_S_NEEDS_RESET, \
> +            "VIRTIO_CONFIG_S_NEEDS_RESET: Irrecoverable error, device needs "
> +            "reset"),
> +    FEATURE_ENTRY(VIRTIO_CONFIG_S_FAILED, \
> +            "VIRTIO_CONFIG_S_FAILED: Error in guest, device failed"),
> +    FEATURE_ENTRY(VIRTIO_CONFIG_S_ACKNOWLEDGE, \
> +            "VIRTIO_CONFIG_S_ACKNOWLEDGE: Valid virtio device found"),
> +    { -1, "" }
> +};
> +
> +/* virtio-blk features mapping */
> +#ifdef CONFIG_VIRTIO_BLK
> +static const qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
> +    FEATURE_ENTRY(VIRTIO_BLK_F_SIZE_MAX, \
> +            "VIRTIO_BLK_F_SIZE_MAX: Max segment size is size_max"),
> +    FEATURE_ENTRY(VIRTIO_BLK_F_SEG_MAX, \
> +            "VIRTIO_BLK_F_SEG_MAX: Max segments in a request is seg_max"),
> +    FEATURE_ENTRY(VIRTIO_BLK_F_GEOMETRY, \
> +            "VIRTIO_BLK_F_GEOMETRY: Legacy geometry available"),
> +    FEATURE_ENTRY(VIRTIO_BLK_F_RO, \
> +            "VIRTIO_BLK_F_RO: Device is read-only"),
> +    FEATURE_ENTRY(VIRTIO_BLK_F_BLK_SIZE, \
> +            "VIRTIO_BLK_F_BLK_SIZE: Block size of disk available"),
> +    FEATURE_ENTRY(VIRTIO_BLK_F_TOPOLOGY, \
> +            "VIRTIO_BLK_F_TOPOLOGY: Topology information available"),
> +    FEATURE_ENTRY(VIRTIO_BLK_F_MQ, \
> +            "VIRTIO_BLK_F_MQ: Multiqueue supported"),
> +    FEATURE_ENTRY(VIRTIO_BLK_F_DISCARD, \
> +            "VIRTIO_BLK_F_DISCARD: Discard command supported"),
> +    FEATURE_ENTRY(VIRTIO_BLK_F_WRITE_ZEROES, \
> +            "VIRTIO_BLK_F_WRITE_ZEROES: Write zeroes command supported"),
> +#ifndef VIRTIO_BLK_NO_LEGACY
> +    FEATURE_ENTRY(VIRTIO_BLK_F_BARRIER, \
> +            "VIRTIO_BLK_F_BARRIER: Request barriers supported"),
> +    FEATURE_ENTRY(VIRTIO_BLK_F_SCSI, \
> +            "VIRTIO_BLK_F_SCSI: SCSI packet commands supported"),
> +    FEATURE_ENTRY(VIRTIO_BLK_F_FLUSH, \
> +            "VIRTIO_BLK_F_FLUSH: Flush command supported"),
> +    FEATURE_ENTRY(VIRTIO_BLK_F_CONFIG_WCE, \
> +            "VIRTIO_BLK_F_CONFIG_WCE: Cache writeback and writethrough modes "
> +            "supported"),
> +#endif /* !VIRTIO_BLK_NO_LEGACY */
> +    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> +            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
> +    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> +            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
> +            "negotiation supported"),
> +    { -1, "" }
> +};
> +#endif
> +
> +/* virtio-serial features mapping */
> +#ifdef CONFIG_VIRTIO_SERIAL
> +static const qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
> +    FEATURE_ENTRY(VIRTIO_CONSOLE_F_SIZE, \
> +            "VIRTIO_CONSOLE_F_SIZE: Host providing console size"),
> +    FEATURE_ENTRY(VIRTIO_CONSOLE_F_MULTIPORT, \
> +            "VIRTIO_CONSOLE_F_MULTIPORT: Multiple ports for device supported"),
> +    FEATURE_ENTRY(VIRTIO_CONSOLE_F_EMERG_WRITE, \
> +            "VIRTIO_CONSOLE_F_EMERG_WRITE: Emergency write supported"),
> +    { -1, "" }
> +};
> +#endif
> +
> +/* virtio-gpu features mapping */
> +#ifdef CONFIG_VIRTIO_GPU
> +static const qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
> +    FEATURE_ENTRY(VIRTIO_GPU_F_VIRGL, \
> +            "VIRTIO_GPU_F_VIRGL: Virgl 3D mode supported"),
> +    FEATURE_ENTRY(VIRTIO_GPU_F_EDID, \
> +            "VIRTIO_GPU_F_EDID: EDID metadata supported"),
> +    FEATURE_ENTRY(VIRTIO_GPU_F_RESOURCE_UUID, \
> +            "VIRTIO_GPU_F_RESOURCE_UUID: Resource UUID assigning supported"),
> +    FEATURE_ENTRY(VIRTIO_GPU_F_RESOURCE_BLOB, \
> +            "VIRTIO_GPU_F_RESOURCE_BLOB: Size-based blob resources supported"),
> +    FEATURE_ENTRY(VIRTIO_GPU_F_CONTEXT_INIT, \
> +            "VIRTIO_GPU_F_CONTEXT_INIT: Context types and synchronization "
> +            "timelines supported"),
> +    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> +            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
> +    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> +            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
> +            "negotiation supported"),
> +    { -1, "" }
> +};
> +#endif
> +
> +/* virtio-input features mapping */
> +#ifdef CONFIG_VIRTIO_INPUT
> +static const qmp_virtio_feature_map_t virtio_input_feature_map[] = {
> +    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> +            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
> +    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> +            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
> +            "negotiation supported"),
> +    { -1, "" }
> +};
> +#endif
> +
> +/* virtio-net features mapping */
> +#ifdef CONFIG_VIRTIO_NET
> +static const qmp_virtio_feature_map_t virtio_net_feature_map[] = {
> +    FEATURE_ENTRY(VIRTIO_NET_F_CSUM, \
> +            "VIRTIO_NET_F_CSUM: Device handling packets with partial checksum "
> +            "supported"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_CSUM, \
> +            "VIRTIO_NET_F_GUEST_CSUM: Driver handling packets with partial "
> +            "checksum supported"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_GUEST_OFFLOADS, \
> +            "VIRTIO_NET_F_CTRL_GUEST_OFFLOADS: Control channel offloading "
> +            "reconfig. supported"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_MTU, \
> +            "VIRTIO_NET_F_MTU: Device max MTU reporting supported"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_MAC, \
> +            "VIRTIO_NET_F_MAC: Device has given MAC address"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_TSO4, \
> +            "VIRTIO_NET_F_GUEST_TSO4: Driver can receive TSOv4"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_TSO6, \
> +            "VIRTIO_NET_F_GUEST_TSO6: Driver can receive TSOv6"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_ECN, \
> +            "VIRTIO_NET_F_GUEST_ECN: Driver can receive TSO with ECN"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_UFO, \
> +            "VIRTIO_NET_F_GUEST_UFO: Driver can receive UFO"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_HOST_TSO4, \
> +            "VIRTIO_NET_F_HOST_TSO4: Device can receive TSOv4"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_HOST_TSO6, \
> +            "VIRTIO_NET_F_HOST_TSO6: Device can receive TSOv6"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_HOST_ECN, \
> +            "VIRTIO_NET_F_HOST_ECN: Device can receive TSO with ECN"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_HOST_UFO, \
> +            "VIRTIO_NET_F_HOST_UFO: Device can receive UFO"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_MRG_RXBUF, \
> +            "VIRTIO_NET_F_MRG_RXBUF: Driver can merge receive buffers"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_STATUS, \
> +            "VIRTIO_NET_F_STATUS: Configuration status field available"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_VQ, \
> +            "VIRTIO_NET_F_CTRL_VQ: Control channel available"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_RX, \
> +            "VIRTIO_NET_F_CTRL_RX: Control channel RX mode supported"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_VLAN, \
> +            "VIRTIO_NET_F_CTRL_VLAN: Control channel VLAN filtering supported"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_RX_EXTRA, \
> +            "VIRTIO_NET_F_CTRL_RX_EXTRA: Extra RX mode control supported"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_ANNOUNCE, \
> +            "VIRTIO_NET_F_GUEST_ANNOUNCE: Driver sending gratuitous packets "
> +            "supported"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_MQ, \
> +            "VIRTIO_NET_F_MQ: Multiqueue with automatic receive steering "
> +            "supported"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_MAC_ADDR, \
> +            "VIRTIO_NET_F_CTRL_MAC_ADDR: MAC address set through control "
> +            "channel"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_HASH_REPORT, \
> +            "VIRTIO_NET_F_HASH_REPORT: Hash reporting supported"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_RSS, \
> +            "VIRTIO_NET_F_RSS: RSS RX steering supported"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_RSC_EXT, \
> +            "VIRTIO_NET_F_RSC_EXT: Extended coalescing info supported"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_STANDBY, \
> +            "VIRTIO_NET_F_STANDBY: Device acting as standby for primary "
> +            "device with same MAC addr. supported"),
> +    FEATURE_ENTRY(VIRTIO_NET_F_SPEED_DUPLEX, \
> +            "VIRTIO_NET_F_SPEED_DUPLEX: Device set linkspeed and duplex"),
> +#ifndef VIRTIO_NET_NO_LEGACY
> +    FEATURE_ENTRY(VIRTIO_NET_F_GSO, \
> +            "VIRTIO_NET_F_GSO: Handling GSO-type packets supported"),
> +#endif /* !VIRTIO_NET_NO_LEGACY */
> +    FEATURE_ENTRY(VHOST_NET_F_VIRTIO_NET_HDR, \
> +            "VHOST_NET_F_VIRTIO_NET_HDR: Virtio-net headers for RX and TX "
> +            "packets supported"),
> +    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> +            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
> +    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> +            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
> +            "negotiation supported"),
> +    { -1, "" }
> +};
> +#endif
> +
> +/* virtio-scsi features mapping */
> +#ifdef CONFIG_VIRTIO_SCSI
> +static const qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
> +    FEATURE_ENTRY(VIRTIO_SCSI_F_INOUT, \
> +            "VIRTIO_SCSI_F_INOUT: Requests including read and writable data "
> +            "buffers suppoted"),
> +    FEATURE_ENTRY(VIRTIO_SCSI_F_HOTPLUG, \
> +            "VIRTIO_SCSI_F_HOTPLUG: Reporting and handling hot-plug events "
> +            "supported"),
> +    FEATURE_ENTRY(VIRTIO_SCSI_F_CHANGE, \
> +            "VIRTIO_SCSI_F_CHANGE: Reporting and handling LUN changes "
> +            "supported"),
> +    FEATURE_ENTRY(VIRTIO_SCSI_F_T10_PI, \
> +            "VIRTIO_SCSI_F_T10_PI: T10 info included in request header"),
> +    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> +            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
> +    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> +            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
> +            "negotiation supported"),
> +    { -1, "" }
> +};
> +#endif
> +
> +/* virtio/vhost-user-fs features mapping */
> +#ifdef CONFIG_VHOST_USER_FS
> +static const qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
> +    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> +            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
> +    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> +            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
> +            "negotiation supported"),
> +    { -1, "" }
> +};
> +#endif
> +
> +/* virtio/vhost-user-i2c features mapping */
> +#ifdef CONFIG_VIRTIO_I2C_ADAPTER
> +static const qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
> +    FEATURE_ENTRY(VIRTIO_I2C_F_ZERO_LENGTH_REQUEST, \
> +            "VIRTIO_I2C_F_ZERO_LEGNTH_REQUEST: Zero length requests supported"),
> +    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> +            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
> +    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> +            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
> +            "negotiation supported"),
> +    { -1, "" }
> +};
> +#endif
> +
> +/* virtio/vhost-vsock features mapping */
> +#ifdef CONFIG_VHOST_VSOCK
> +static const qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
> +    FEATURE_ENTRY(VIRTIO_VSOCK_F_SEQPACKET, \
> +            "VIRTIO_VSOCK_F_SEQPACKET: SOCK_SEQPACKET supported"),
> +    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> +            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
> +    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> +            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
> +            "negotiation supported"),
> +    { -1, "" }
> +};
> +#endif
> +
> +/* virtio-balloon features mapping */
> +#ifdef CONFIG_VIRTIO_BALLOON
> +static const qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
> +    FEATURE_ENTRY(VIRTIO_BALLOON_F_MUST_TELL_HOST, \
> +            "VIRTIO_BALLOON_F_MUST_TELL_HOST: Tell host before reclaiming "
> +            "pages"),
> +    FEATURE_ENTRY(VIRTIO_BALLOON_F_STATS_VQ, \
> +            "VIRTIO_BALLOON_F_STATS_VQ: Guest memory stats VQ available"),
> +    FEATURE_ENTRY(VIRTIO_BALLOON_F_DEFLATE_ON_OOM, \
> +            "VIRTIO_BALLOON_F_DEFLATE_ON_OOM: Deflate balloon when guest OOM"),
> +    FEATURE_ENTRY(VIRTIO_BALLOON_F_FREE_PAGE_HINT, \
> +            "VIRTIO_BALLOON_F_FREE_PAGE_HINT: VQ reporting free pages enabled"),
> +    FEATURE_ENTRY(VIRTIO_BALLOON_F_PAGE_POISON, \
> +            "VIRTIO_BALLOON_F_PAGE_POISON: Guest page poisoning enabled"),
> +    FEATURE_ENTRY(VIRTIO_BALLOON_F_REPORTING, \
> +            "VIRTIO_BALLOON_F_REPORTING: Page reporting VQ enabled"),
> +    { -1, "" }
> +};
> +#endif
> +
> +/* virtio-crypto features mapping */
> +#ifdef CONFIG_VIRTIO_CRYPTO
> +static const qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
> +    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> +            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
> +    { -1, "" }
> +};
> +#endif
> +
> +/* virtio-iommu features mapping */
> +#ifdef CONFIG_VIRTIO_IOMMU
> +static const qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
> +    FEATURE_ENTRY(VIRTIO_IOMMU_F_INPUT_RANGE, \
> +            "VIRTIO_IOMMU_F_INPUT_RANGE: Range of available virtual addrs. "
> +            "available"),
> +    FEATURE_ENTRY(VIRTIO_IOMMU_F_DOMAIN_RANGE, \
> +            "VIRTIO_IOMMU_F_DOMAIN_RANGE: Number of supported domains "
> +            "available"),
> +    FEATURE_ENTRY(VIRTIO_IOMMU_F_MAP_UNMAP, \
> +            "VIRTIO_IOMMU_F_MAP_UNMAP: Map and unmap requests available"),
> +    FEATURE_ENTRY(VIRTIO_IOMMU_F_BYPASS, \
> +            "VIRTIO_IOMMU_F_BYPASS: Endpoints not attached to domains are in "
> +            "bypass mode"),
> +    FEATURE_ENTRY(VIRTIO_IOMMU_F_PROBE, \
> +            "VIRTIO_IOMMU_F_PROBE: Probe requests available"),
> +    FEATURE_ENTRY(VIRTIO_IOMMU_F_MMIO, \
> +            "VIRTIO_IOMMU_F_MMIO: VIRTIO_IOMMU_MAP_F_MMIO flag available"),
> +    FEATURE_ENTRY(VIRTIO_IOMMU_F_BYPASS_CONFIG, \
> +            "VIRTIO_IOMMU_F_BYPASS_CONFIG: Bypass field of IOMMU config "
> +            "available"),
> +    { -1, "" }
> +};
> +#endif
> +
> +/* virtio-mem features mapping */
> +#ifdef CONFIG_VIRTIO_MEM
> +static const qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
> +#ifndef CONFIG_ACPI
> +    FEATURE_ENTRY(VIRTIO_MEM_F_ACPI_PXM, \
> +            "VIRTIO_MEM_F_ACPI_PXM: node_id is an ACPI PXM and is valid"),
> +#endif /* !CONFIG_ACPI */
> +    FEATURE_ENTRY(VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, \
> +            "VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE: Unplugged memory cannot be "
> +            "accessed"),
> +    { -1, "" }
> +};
> +#endif
> +
> +/* virtio-rng features mapping */
> +#ifdef CONFIG_VIRTIO_RNG
> +static const qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
> +    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> +            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
> +    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> +            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
> +            "negotiation supported"),
> +    { -1, "" }
> +};
> +#endif
> +
> +#define CONVERT_FEATURES(type, map, is_status, bitmap)   \
> +    ({                                                   \
> +        type *list = NULL;                               \
> +        type *node;                                      \
> +        for (i = 0; map[i].virtio_bit != -1; i++) {      \
> +            if (is_status) {                             \
> +                bit = map[i].virtio_bit;                 \
> +            }                                            \
> +            else {                                       \
> +                bit = 1ULL << map[i].virtio_bit;         \
> +            }                                            \
> +            if ((bitmap & bit) == 0) {                   \
> +                continue;                                \
> +            }                                            \
> +            node = g_new0(type, 1);                      \
> +            node->value = g_strdup(map[i].feature_desc); \
> +            node->next = list;                           \
> +            list = node;                                 \
> +            bitmap ^= bit;                               \
> +        }                                                \
> +        list;                                            \
> +    })
> +
> +VirtioDeviceStatus *qmp_decode_status(uint8_t bitmap)
> +{
> +    VirtioDeviceStatus *status;
> +    uint8_t bit;
> +    int i;
> +
> +    status = g_new0(VirtioDeviceStatus, 1);
> +    status->statuses = CONVERT_FEATURES(strList, virtio_config_status_map,
> +                                        1, bitmap);
> +    status->has_unknown_statuses = bitmap != 0;
> +    if (status->has_unknown_statuses) {
> +        status->unknown_statuses = bitmap;
> +    }
> +
> +    return status;
> +}
> +
> +VhostDeviceProtocols *qmp_decode_protocols(uint64_t bitmap)
> +{
> +    VhostDeviceProtocols *vhu_protocols;
> +    uint64_t bit;
> +    int i;
> +
> +    vhu_protocols = g_new0(VhostDeviceProtocols, 1);
> +    vhu_protocols->protocols =
> +                    CONVERT_FEATURES(strList,
> +                                     vhost_user_protocol_map, 0, bitmap);
> +    vhu_protocols->has_unknown_protocols = bitmap != 0;
> +    if (vhu_protocols->has_unknown_protocols) {
> +        vhu_protocols->unknown_protocols = bitmap;
> +    }
> +
> +    return vhu_protocols;
> +}
> +
> +VirtioDeviceFeatures *qmp_decode_features(uint16_t device_id, uint64_t bitmap)
> +{
> +    VirtioDeviceFeatures *features;
> +    uint64_t bit;
> +    int i;
> +
> +    features = g_new0(VirtioDeviceFeatures, 1);
> +    features->has_dev_features = true;
> +
> +    /* transport features */
> +    features->transports = CONVERT_FEATURES(strList, virtio_transport_map, 0,
> +                                            bitmap);
> +
> +    /* device features */
> +    switch (device_id) {
> +#ifdef CONFIG_VIRTIO_SERIAL
> +    case VIRTIO_ID_CONSOLE:
> +        features->dev_features =
> +            CONVERT_FEATURES(strList, virtio_serial_feature_map, 0, bitmap);
> +        break;
> +#endif
> +#ifdef CONFIG_VIRTIO_BLK
> +    case VIRTIO_ID_BLOCK:
> +        features->dev_features =
> +            CONVERT_FEATURES(strList, virtio_blk_feature_map, 0, bitmap);
> +        break;
> +#endif
> +#ifdef CONFIG_VIRTIO_GPU
> +    case VIRTIO_ID_GPU:
> +        features->dev_features =
> +            CONVERT_FEATURES(strList, virtio_gpu_feature_map, 0, bitmap);
> +        break;
> +#endif
> +#ifdef CONFIG_VIRTIO_NET
> +    case VIRTIO_ID_NET:
> +        features->dev_features =
> +            CONVERT_FEATURES(strList, virtio_net_feature_map, 0, bitmap);
> +        break;
> +#endif
> +#ifdef CONFIG_VIRTIO_SCSI
> +    case VIRTIO_ID_SCSI:
> +        features->dev_features =
> +            CONVERT_FEATURES(strList, virtio_scsi_feature_map, 0, bitmap);
> +        break;
> +#endif
> +#ifdef CONFIG_VIRTIO_BALLOON
> +    case VIRTIO_ID_BALLOON:
> +        features->dev_features =
> +            CONVERT_FEATURES(strList, virtio_balloon_feature_map, 0, bitmap);
> +        break;
> +#endif
> +#ifdef CONFIG_VIRTIO_IOMMU
> +    case VIRTIO_ID_IOMMU:
> +        features->dev_features =
> +            CONVERT_FEATURES(strList, virtio_iommu_feature_map, 0, bitmap);
> +        break;
> +#endif
> +#ifdef CONFIG_VIRTIO_INPUT
> +    case VIRTIO_ID_INPUT:
> +        features->dev_features =
> +            CONVERT_FEATURES(strList, virtio_input_feature_map, 0, bitmap);
> +        break;
> +#endif
> +#ifdef CONFIG_VHOST_USER_FS
> +    case VIRTIO_ID_FS:
> +        features->dev_features =
> +            CONVERT_FEATURES(strList, virtio_fs_feature_map, 0, bitmap);
> +        break;
> +#endif
> +#ifdef CONFIG_VHOST_VSOCK
> +    case VIRTIO_ID_VSOCK:
> +        features->dev_features =
> +            CONVERT_FEATURES(strList, virtio_vsock_feature_map, 0, bitmap);
> +        break;
> +#endif
> +#ifdef CONFIG_VIRTIO_CRYPTO
> +    case VIRTIO_ID_CRYPTO:
> +        features->dev_features =
> +            CONVERT_FEATURES(strList, virtio_crypto_feature_map, 0, bitmap);
> +        break;
> +#endif
> +#ifdef CONFIG_VIRTIO_MEM
> +    case VIRTIO_ID_MEM:
> +        features->dev_features =
> +            CONVERT_FEATURES(strList, virtio_mem_feature_map, 0, bitmap);
> +        break;
> +#endif
> +#ifdef CONFIG_VIRTIO_I2C_ADAPTER
> +    case VIRTIO_ID_I2C_ADAPTER:
> +        features->dev_features =
> +            CONVERT_FEATURES(strList, virtio_i2c_feature_map, 0, bitmap);
> +        break;
> +#endif
> +#ifdef CONFIG_VIRTIO_RNG
> +    case VIRTIO_ID_RNG:
> +        features->dev_features =
> +            CONVERT_FEATURES(strList, virtio_rng_feature_map, 0, bitmap);
> +        break;
> +#endif
> +    /* No features */
> +    case VIRTIO_ID_9P:
> +    case VIRTIO_ID_PMEM:
> +    case VIRTIO_ID_IOMEM:
> +    case VIRTIO_ID_RPMSG:
> +    case VIRTIO_ID_CLOCK:
> +    case VIRTIO_ID_MAC80211_WLAN:
> +    case VIRTIO_ID_MAC80211_HWSIM:
> +    case VIRTIO_ID_RPROC_SERIAL:
> +    case VIRTIO_ID_MEMORY_BALLOON:
> +    case VIRTIO_ID_CAIF:
> +    case VIRTIO_ID_SIGNAL_DIST:
> +    case VIRTIO_ID_PSTORE:
> +    case VIRTIO_ID_SOUND:
> +    case VIRTIO_ID_BT:
> +    case VIRTIO_ID_RPMB:
> +    case VIRTIO_ID_VIDEO_ENCODER:
> +    case VIRTIO_ID_VIDEO_DECODER:
> +    case VIRTIO_ID_SCMI:
> +    case VIRTIO_ID_NITRO_SEC_MOD:
> +    case VIRTIO_ID_WATCHDOG:
> +    case VIRTIO_ID_CAN:
> +    case VIRTIO_ID_DMABUF:
> +    case VIRTIO_ID_PARAM_SERV:
> +    case VIRTIO_ID_AUDIO_POLICY:
> +    case VIRTIO_ID_GPIO:
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    features->has_unknown_dev_features = bitmap != 0;
> +    if (features->has_unknown_dev_features) {
> +        features->unknown_dev_features = bitmap;
> +    }
> +
> +    return features;
> +}

I haven't tried this myself, but is there a reason why we're not also including
the 'qmp_decode_vring_desc_flags' function here?

> diff --git a/hw/virtio/virtio-qmp.h b/hw/virtio/virtio-qmp.h
> new file mode 100644
> index 0000000000..075fc27030
> --- /dev/null
> +++ b/hw/virtio/virtio-qmp.h
> @@ -0,0 +1,20 @@
> +/*
> + * Virtio QMP helpers
> + *
> + * Copyright IBM, Corp. 2007
> + *
> + * Authors:
> + *  Anthony Liguori<aliguori@us.ibm.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef HW_VIRTIO_QMP_H
> +#define HW_VIRTIO_QMP_H
> +
> +#include "qapi/qapi-types-virtio.h"
> +
> +VirtioDeviceStatus *qmp_decode_status(uint8_t bitmap);
> +VhostDeviceProtocols *qmp_decode_protocols(uint64_t bitmap);
> +VirtioDeviceFeatures *qmp_decode_features(uint16_t device_id, uint64_t bitmap);
> +
> +#endif
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 01d043b3c6..09b1a0e3d9 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -16,7 +16,6 @@
>   #include "qapi/qmp/qdict.h"
>   #include "qapi/qapi-commands-virtio.h"
>   #include "qapi/qapi-commands-qom.h"
> -#include "qapi/qapi-visit-virtio.h"
>   #include "qapi/qmp/qjson.h"
>   #include "trace.h"
>   #include "qemu/error-report.h"
> @@ -33,6 +32,8 @@
>   #include "hw/virtio/virtio-access.h"
>   #include "sysemu/dma.h"
>   #include "sysemu/runstate.h"
> +#include "virtio-qmp.h"
> +
>   #include "standard-headers/linux/virtio_ids.h"
>   #include "standard-headers/linux/vhost_types.h"
>   #include "standard-headers/linux/virtio_blk.h"
> @@ -45,7 +46,6 @@
>   #include "standard-headers/linux/virtio_iommu.h"
>   #include "standard-headers/linux/virtio_mem.h"
>   #include "standard-headers/linux/virtio_vsock.h"
> -#include CONFIG_DEVICES
>   
>   /* QAPI list of realized VirtIODevices */
>   static QTAILQ_HEAD(, VirtIODevice) virtio_list;
> @@ -55,440 +55,6 @@ static QTAILQ_HEAD(, VirtIODevice) virtio_list;
>    */
>   #define VHOST_USER_MAX_CONFIG_SIZE 256
>   
> -#define FEATURE_ENTRY(name, desc) (qmp_virtio_feature_map_t) \
> -    { .virtio_bit = name, .feature_desc = desc }
> -
> -enum VhostUserProtocolFeature {
> -    VHOST_USER_PROTOCOL_F_MQ = 0,
> -    VHOST_USER_PROTOCOL_F_LOG_SHMFD = 1,
> -    VHOST_USER_PROTOCOL_F_RARP = 2,
> -    VHOST_USER_PROTOCOL_F_REPLY_ACK = 3,
> -    VHOST_USER_PROTOCOL_F_NET_MTU = 4,
> -    VHOST_USER_PROTOCOL_F_SLAVE_REQ = 5,
> -    VHOST_USER_PROTOCOL_F_CROSS_ENDIAN = 6,
> -    VHOST_USER_PROTOCOL_F_CRYPTO_SESSION = 7,
> -    VHOST_USER_PROTOCOL_F_PAGEFAULT = 8,
> -    VHOST_USER_PROTOCOL_F_CONFIG = 9,
> -    VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD = 10,
> -    VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
> -    VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
> -    VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
> -    VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS = 14,
> -    VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
> -    VHOST_USER_PROTOCOL_F_MAX
> -};
> -
> -/* Virtio transport features mapping */
> -static const qmp_virtio_feature_map_t virtio_transport_map[] = {
> -    /* Virtio device transport features */
> -#ifndef VIRTIO_CONFIG_NO_LEGACY
> -    FEATURE_ENTRY(VIRTIO_F_NOTIFY_ON_EMPTY, \
> -            "VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of avail. "
> -            "descs. on VQ"),
> -    FEATURE_ENTRY(VIRTIO_F_ANY_LAYOUT, \
> -            "VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts"),
> -#endif /* !VIRTIO_CONFIG_NO_LEGACY */
> -    FEATURE_ENTRY(VIRTIO_F_VERSION_1, \
> -            "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)"),
> -    FEATURE_ENTRY(VIRTIO_F_IOMMU_PLATFORM, \
> -            "VIRTIO_F_IOMMU_PLATFORM: Device can be used on IOMMU platform"),
> -    FEATURE_ENTRY(VIRTIO_F_RING_PACKED, \
> -            "VIRTIO_F_RING_PACKED: Device supports packed VQ layout"),
> -    FEATURE_ENTRY(VIRTIO_F_IN_ORDER, \
> -            "VIRTIO_F_IN_ORDER: Device uses buffers in same order as made "
> -            "available by driver"),
> -    FEATURE_ENTRY(VIRTIO_F_ORDER_PLATFORM, \
> -            "VIRTIO_F_ORDER_PLATFORM: Memory accesses ordered by platform"),
> -    FEATURE_ENTRY(VIRTIO_F_SR_IOV, \
> -            "VIRTIO_F_SR_IOV: Device supports single root I/O virtualization"),
> -    /* Virtio ring transport features */
> -    FEATURE_ENTRY(VIRTIO_RING_F_INDIRECT_DESC, \
> -            "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported"),
> -    FEATURE_ENTRY(VIRTIO_RING_F_EVENT_IDX, \
> -            "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled"),
> -    { -1, "" }
> -};
> -
> -/* Vhost-user protocol features mapping */
> -static const qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
> -    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_MQ, \
> -            "VHOST_USER_PROTOCOL_F_MQ: Multiqueue protocol supported"),
> -    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_LOG_SHMFD, \
> -            "VHOST_USER_PROTOCOL_F_LOG_SHMFD: Shared log memory fd supported"),
> -    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_RARP, \
> -            "VHOST_USER_PROTOCOL_F_RARP: Vhost-user back-end RARP broadcasting "
> -            "supported"),
> -    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_REPLY_ACK, \
> -            "VHOST_USER_PROTOCOL_F_REPLY_ACK: Requested operation status ack. "
> -            "supported"),
> -    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_NET_MTU, \
> -            "VHOST_USER_PROTOCOL_F_NET_MTU: Expose host MTU to guest supported"),
> -    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_SLAVE_REQ, \
> -            "VHOST_USER_PROTOCOL_F_SLAVE_REQ: Socket fd for back-end initiated "
> -            "requests supported"),
> -    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CROSS_ENDIAN, \
> -            "VHOST_USER_PROTOCOL_F_CROSS_ENDIAN: Endianness of VQs for legacy "
> -            "devices supported"),
> -    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CRYPTO_SESSION, \
> -            "VHOST_USER_PROTOCOL_F_CRYPTO_SESSION: Session creation for crypto "
> -            "operations supported"),
> -    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_PAGEFAULT, \
> -            "VHOST_USER_PROTOCOL_F_PAGEFAULT: Request servicing on userfaultfd "
> -            "for accessed pages supported"),
> -    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CONFIG, \
> -            "VHOST_USER_PROTOCOL_F_CONFIG: Vhost-user messaging for virtio "
> -            "device configuration space supported"),
> -    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD, \
> -            "VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD: Slave fd communication "
> -            "channel supported"),
> -    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_HOST_NOTIFIER, \
> -            "VHOST_USER_PROTOCOL_F_HOST_NOTIFIER: Host notifiers for specified "
> -            "VQs supported"),
> -    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD, \
> -            "VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD: Shared inflight I/O buffers "
> -            "supported"),
> -    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_RESET_DEVICE, \
> -            "VHOST_USER_PROTOCOL_F_RESET_DEVICE: Disabling all rings and "
> -            "resetting internal device state supported"),
> -    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS, \
> -            "VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS: In-band messaging "
> -            "supported"),
> -    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS, \
> -            "VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS: Configuration for "
> -            "memory slots supported"),
> -    { -1, "" }
> -};
> -
> -/* virtio device configuration statuses */
> -static const qmp_virtio_feature_map_t virtio_config_status_map[] = {
> -    FEATURE_ENTRY(VIRTIO_CONFIG_S_DRIVER_OK, \
> -            "VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready"),
> -    FEATURE_ENTRY(VIRTIO_CONFIG_S_FEATURES_OK, \
> -            "VIRTIO_CONFIG_S_FEATURES_OK: Feature negotiation complete"),
> -    FEATURE_ENTRY(VIRTIO_CONFIG_S_DRIVER, \
> -            "VIRTIO_CONFIG_S_DRIVER: Guest OS compatible with device"),
> -    FEATURE_ENTRY(VIRTIO_CONFIG_S_NEEDS_RESET, \
> -            "VIRTIO_CONFIG_S_NEEDS_RESET: Irrecoverable error, device needs "
> -            "reset"),
> -    FEATURE_ENTRY(VIRTIO_CONFIG_S_FAILED, \
> -            "VIRTIO_CONFIG_S_FAILED: Error in guest, device failed"),
> -    FEATURE_ENTRY(VIRTIO_CONFIG_S_ACKNOWLEDGE, \
> -            "VIRTIO_CONFIG_S_ACKNOWLEDGE: Valid virtio device found"),
> -    { -1, "" }
> -};
> -
> -/* virtio-blk features mapping */
> -#ifdef CONFIG_VIRTIO_BLK
> -static const qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
> -    FEATURE_ENTRY(VIRTIO_BLK_F_SIZE_MAX, \
> -            "VIRTIO_BLK_F_SIZE_MAX: Max segment size is size_max"),
> -    FEATURE_ENTRY(VIRTIO_BLK_F_SEG_MAX, \
> -            "VIRTIO_BLK_F_SEG_MAX: Max segments in a request is seg_max"),
> -    FEATURE_ENTRY(VIRTIO_BLK_F_GEOMETRY, \
> -            "VIRTIO_BLK_F_GEOMETRY: Legacy geometry available"),
> -    FEATURE_ENTRY(VIRTIO_BLK_F_RO, \
> -            "VIRTIO_BLK_F_RO: Device is read-only"),
> -    FEATURE_ENTRY(VIRTIO_BLK_F_BLK_SIZE, \
> -            "VIRTIO_BLK_F_BLK_SIZE: Block size of disk available"),
> -    FEATURE_ENTRY(VIRTIO_BLK_F_TOPOLOGY, \
> -            "VIRTIO_BLK_F_TOPOLOGY: Topology information available"),
> -    FEATURE_ENTRY(VIRTIO_BLK_F_MQ, \
> -            "VIRTIO_BLK_F_MQ: Multiqueue supported"),
> -    FEATURE_ENTRY(VIRTIO_BLK_F_DISCARD, \
> -            "VIRTIO_BLK_F_DISCARD: Discard command supported"),
> -    FEATURE_ENTRY(VIRTIO_BLK_F_WRITE_ZEROES, \
> -            "VIRTIO_BLK_F_WRITE_ZEROES: Write zeroes command supported"),
> -#ifndef VIRTIO_BLK_NO_LEGACY
> -    FEATURE_ENTRY(VIRTIO_BLK_F_BARRIER, \
> -            "VIRTIO_BLK_F_BARRIER: Request barriers supported"),
> -    FEATURE_ENTRY(VIRTIO_BLK_F_SCSI, \
> -            "VIRTIO_BLK_F_SCSI: SCSI packet commands supported"),
> -    FEATURE_ENTRY(VIRTIO_BLK_F_FLUSH, \
> -            "VIRTIO_BLK_F_FLUSH: Flush command supported"),
> -    FEATURE_ENTRY(VIRTIO_BLK_F_CONFIG_WCE, \
> -            "VIRTIO_BLK_F_CONFIG_WCE: Cache writeback and writethrough modes "
> -            "supported"),
> -#endif /* !VIRTIO_BLK_NO_LEGACY */
> -    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> -            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
> -    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> -            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
> -            "negotiation supported"),
> -    { -1, "" }
> -};
> -#endif
> -
> -/* virtio-serial features mapping */
> -#ifdef CONFIG_VIRTIO_SERIAL
> -static const qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
> -    FEATURE_ENTRY(VIRTIO_CONSOLE_F_SIZE, \
> -            "VIRTIO_CONSOLE_F_SIZE: Host providing console size"),
> -    FEATURE_ENTRY(VIRTIO_CONSOLE_F_MULTIPORT, \
> -            "VIRTIO_CONSOLE_F_MULTIPORT: Multiple ports for device supported"),
> -    FEATURE_ENTRY(VIRTIO_CONSOLE_F_EMERG_WRITE, \
> -            "VIRTIO_CONSOLE_F_EMERG_WRITE: Emergency write supported"),
> -    { -1, "" }
> -};
> -#endif
> -
> -/* virtio-gpu features mapping */
> -#ifdef CONFIG_VIRTIO_GPU
> -static const qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
> -    FEATURE_ENTRY(VIRTIO_GPU_F_VIRGL, \
> -            "VIRTIO_GPU_F_VIRGL: Virgl 3D mode supported"),
> -    FEATURE_ENTRY(VIRTIO_GPU_F_EDID, \
> -            "VIRTIO_GPU_F_EDID: EDID metadata supported"),
> -    FEATURE_ENTRY(VIRTIO_GPU_F_RESOURCE_UUID, \
> -            "VIRTIO_GPU_F_RESOURCE_UUID: Resource UUID assigning supported"),
> -    FEATURE_ENTRY(VIRTIO_GPU_F_RESOURCE_BLOB, \
> -            "VIRTIO_GPU_F_RESOURCE_BLOB: Size-based blob resources supported"),
> -    FEATURE_ENTRY(VIRTIO_GPU_F_CONTEXT_INIT, \
> -            "VIRTIO_GPU_F_CONTEXT_INIT: Context types and synchronization "
> -            "timelines supported"),
> -    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> -            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
> -    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> -            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
> -            "negotiation supported"),
> -    { -1, "" }
> -};
> -#endif
> -
> -/* virtio-input features mapping */
> -#ifdef CONFIG_VIRTIO_INPUT
> -static const qmp_virtio_feature_map_t virtio_input_feature_map[] = {
> -    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> -            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
> -    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> -            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
> -            "negotiation supported"),
> -    { -1, "" }
> -};
> -#endif
> -
> -/* virtio-net features mapping */
> -#ifdef CONFIG_VIRTIO_NET
> -static const qmp_virtio_feature_map_t virtio_net_feature_map[] = {
> -    FEATURE_ENTRY(VIRTIO_NET_F_CSUM, \
> -            "VIRTIO_NET_F_CSUM: Device handling packets with partial checksum "
> -            "supported"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_CSUM, \
> -            "VIRTIO_NET_F_GUEST_CSUM: Driver handling packets with partial "
> -            "checksum supported"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_GUEST_OFFLOADS, \
> -            "VIRTIO_NET_F_CTRL_GUEST_OFFLOADS: Control channel offloading "
> -            "reconfig. supported"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_MTU, \
> -            "VIRTIO_NET_F_MTU: Device max MTU reporting supported"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_MAC, \
> -            "VIRTIO_NET_F_MAC: Device has given MAC address"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_TSO4, \
> -            "VIRTIO_NET_F_GUEST_TSO4: Driver can receive TSOv4"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_TSO6, \
> -            "VIRTIO_NET_F_GUEST_TSO6: Driver can receive TSOv6"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_ECN, \
> -            "VIRTIO_NET_F_GUEST_ECN: Driver can receive TSO with ECN"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_UFO, \
> -            "VIRTIO_NET_F_GUEST_UFO: Driver can receive UFO"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_HOST_TSO4, \
> -            "VIRTIO_NET_F_HOST_TSO4: Device can receive TSOv4"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_HOST_TSO6, \
> -            "VIRTIO_NET_F_HOST_TSO6: Device can receive TSOv6"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_HOST_ECN, \
> -            "VIRTIO_NET_F_HOST_ECN: Device can receive TSO with ECN"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_HOST_UFO, \
> -            "VIRTIO_NET_F_HOST_UFO: Device can receive UFO"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_MRG_RXBUF, \
> -            "VIRTIO_NET_F_MRG_RXBUF: Driver can merge receive buffers"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_STATUS, \
> -            "VIRTIO_NET_F_STATUS: Configuration status field available"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_VQ, \
> -            "VIRTIO_NET_F_CTRL_VQ: Control channel available"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_RX, \
> -            "VIRTIO_NET_F_CTRL_RX: Control channel RX mode supported"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_VLAN, \
> -            "VIRTIO_NET_F_CTRL_VLAN: Control channel VLAN filtering supported"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_RX_EXTRA, \
> -            "VIRTIO_NET_F_CTRL_RX_EXTRA: Extra RX mode control supported"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_ANNOUNCE, \
> -            "VIRTIO_NET_F_GUEST_ANNOUNCE: Driver sending gratuitous packets "
> -            "supported"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_MQ, \
> -            "VIRTIO_NET_F_MQ: Multiqueue with automatic receive steering "
> -            "supported"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_MAC_ADDR, \
> -            "VIRTIO_NET_F_CTRL_MAC_ADDR: MAC address set through control "
> -            "channel"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_HASH_REPORT, \
> -            "VIRTIO_NET_F_HASH_REPORT: Hash reporting supported"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_RSS, \
> -            "VIRTIO_NET_F_RSS: RSS RX steering supported"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_RSC_EXT, \
> -            "VIRTIO_NET_F_RSC_EXT: Extended coalescing info supported"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_STANDBY, \
> -            "VIRTIO_NET_F_STANDBY: Device acting as standby for primary "
> -            "device with same MAC addr. supported"),
> -    FEATURE_ENTRY(VIRTIO_NET_F_SPEED_DUPLEX, \
> -            "VIRTIO_NET_F_SPEED_DUPLEX: Device set linkspeed and duplex"),
> -#ifndef VIRTIO_NET_NO_LEGACY
> -    FEATURE_ENTRY(VIRTIO_NET_F_GSO, \
> -            "VIRTIO_NET_F_GSO: Handling GSO-type packets supported"),
> -#endif /* !VIRTIO_NET_NO_LEGACY */
> -    FEATURE_ENTRY(VHOST_NET_F_VIRTIO_NET_HDR, \
> -            "VHOST_NET_F_VIRTIO_NET_HDR: Virtio-net headers for RX and TX "
> -            "packets supported"),
> -    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> -            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
> -    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> -            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
> -            "negotiation supported"),
> -    { -1, "" }
> -};
> -#endif
> -
> -/* virtio-scsi features mapping */
> -#ifdef CONFIG_VIRTIO_SCSI
> -static const qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
> -    FEATURE_ENTRY(VIRTIO_SCSI_F_INOUT, \
> -            "VIRTIO_SCSI_F_INOUT: Requests including read and writable data "
> -            "buffers suppoted"),
> -    FEATURE_ENTRY(VIRTIO_SCSI_F_HOTPLUG, \
> -            "VIRTIO_SCSI_F_HOTPLUG: Reporting and handling hot-plug events "
> -            "supported"),
> -    FEATURE_ENTRY(VIRTIO_SCSI_F_CHANGE, \
> -            "VIRTIO_SCSI_F_CHANGE: Reporting and handling LUN changes "
> -            "supported"),
> -    FEATURE_ENTRY(VIRTIO_SCSI_F_T10_PI, \
> -            "VIRTIO_SCSI_F_T10_PI: T10 info included in request header"),
> -    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> -            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
> -    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> -            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
> -            "negotiation supported"),
> -    { -1, "" }
> -};
> -#endif
> -
> -/* virtio/vhost-user-fs features mapping */
> -#ifdef CONFIG_VHOST_USER_FS
> -static const qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
> -    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> -            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
> -    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> -            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
> -            "negotiation supported"),
> -    { -1, "" }
> -};
> -#endif
> -
> -/* virtio/vhost-user-i2c features mapping */
> -#ifdef CONFIG_VIRTIO_I2C_ADAPTER
> -static const qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
> -    FEATURE_ENTRY(VIRTIO_I2C_F_ZERO_LENGTH_REQUEST, \
> -            "VIRTIO_I2C_F_ZERO_LEGNTH_REQUEST: Zero length requests supported"),
> -    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> -            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
> -    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> -            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
> -            "negotiation supported"),
> -    { -1, "" }
> -};
> -#endif
> -
> -/* virtio/vhost-vsock features mapping */
> -#ifdef CONFIG_VHOST_VSOCK
> -static const qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
> -    FEATURE_ENTRY(VIRTIO_VSOCK_F_SEQPACKET, \
> -            "VIRTIO_VSOCK_F_SEQPACKET: SOCK_SEQPACKET supported"),
> -    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> -            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
> -    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> -            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
> -            "negotiation supported"),
> -    { -1, "" }
> -};
> -#endif
> -
> -/* virtio-balloon features mapping */
> -#ifdef CONFIG_VIRTIO_BALLOON
> -static const qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
> -    FEATURE_ENTRY(VIRTIO_BALLOON_F_MUST_TELL_HOST, \
> -            "VIRTIO_BALLOON_F_MUST_TELL_HOST: Tell host before reclaiming "
> -            "pages"),
> -    FEATURE_ENTRY(VIRTIO_BALLOON_F_STATS_VQ, \
> -            "VIRTIO_BALLOON_F_STATS_VQ: Guest memory stats VQ available"),
> -    FEATURE_ENTRY(VIRTIO_BALLOON_F_DEFLATE_ON_OOM, \
> -            "VIRTIO_BALLOON_F_DEFLATE_ON_OOM: Deflate balloon when guest OOM"),
> -    FEATURE_ENTRY(VIRTIO_BALLOON_F_FREE_PAGE_HINT, \
> -            "VIRTIO_BALLOON_F_FREE_PAGE_HINT: VQ reporting free pages enabled"),
> -    FEATURE_ENTRY(VIRTIO_BALLOON_F_PAGE_POISON, \
> -            "VIRTIO_BALLOON_F_PAGE_POISON: Guest page poisoning enabled"),
> -    FEATURE_ENTRY(VIRTIO_BALLOON_F_REPORTING, \
> -            "VIRTIO_BALLOON_F_REPORTING: Page reporting VQ enabled"),
> -    { -1, "" }
> -};
> -#endif
> -
> -/* virtio-crypto features mapping */
> -#ifdef CONFIG_VIRTIO_CRYPTO
> -static const qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
> -    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> -            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
> -    { -1, "" }
> -};
> -#endif
> -
> -/* virtio-iommu features mapping */
> -#ifdef CONFIG_VIRTIO_IOMMU
> -static const qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
> -    FEATURE_ENTRY(VIRTIO_IOMMU_F_INPUT_RANGE, \
> -            "VIRTIO_IOMMU_F_INPUT_RANGE: Range of available virtual addrs. "
> -            "available"),
> -    FEATURE_ENTRY(VIRTIO_IOMMU_F_DOMAIN_RANGE, \
> -            "VIRTIO_IOMMU_F_DOMAIN_RANGE: Number of supported domains "
> -            "available"),
> -    FEATURE_ENTRY(VIRTIO_IOMMU_F_MAP_UNMAP, \
> -            "VIRTIO_IOMMU_F_MAP_UNMAP: Map and unmap requests available"),
> -    FEATURE_ENTRY(VIRTIO_IOMMU_F_BYPASS, \
> -            "VIRTIO_IOMMU_F_BYPASS: Endpoints not attached to domains are in "
> -            "bypass mode"),
> -    FEATURE_ENTRY(VIRTIO_IOMMU_F_PROBE, \
> -            "VIRTIO_IOMMU_F_PROBE: Probe requests available"),
> -    FEATURE_ENTRY(VIRTIO_IOMMU_F_MMIO, \
> -            "VIRTIO_IOMMU_F_MMIO: VIRTIO_IOMMU_MAP_F_MMIO flag available"),
> -    FEATURE_ENTRY(VIRTIO_IOMMU_F_BYPASS_CONFIG, \
> -            "VIRTIO_IOMMU_F_BYPASS_CONFIG: Bypass field of IOMMU config "
> -            "available"),
> -    { -1, "" }
> -};
> -#endif
> -
> -/* virtio-mem features mapping */
> -#ifdef CONFIG_VIRTIO_MEM
> -static const qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
> -#ifndef CONFIG_ACPI
> -    FEATURE_ENTRY(VIRTIO_MEM_F_ACPI_PXM, \
> -            "VIRTIO_MEM_F_ACPI_PXM: node_id is an ACPI PXM and is valid"),
> -#endif /* !CONFIG_ACPI */
> -    FEATURE_ENTRY(VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, \
> -            "VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE: Unplugged memory cannot be "
> -            "accessed"),
> -    { -1, "" }
> -};
> -#endif
> -
> -/* virtio-rng features mapping */
> -#ifdef CONFIG_VIRTIO_RNG
> -static const qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
> -    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> -            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
> -    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> -            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
> -            "negotiation supported"),
> -    { -1, "" }
> -};
> -#endif
> -
>   /*
>    * The alignment to use between consumer and producer parts of vring.
>    * x86 pagesize again. This is the default, used by transports like PCI
> @@ -4296,203 +3862,6 @@ static VirtIODevice *virtio_device_find(const char *path)
>       return NULL;
>   }
>   
> -#define CONVERT_FEATURES(type, map, is_status, bitmap)   \
> -    ({                                                   \
> -        type *list = NULL;                               \
> -        type *node;                                      \
> -        for (i = 0; map[i].virtio_bit != -1; i++) {      \
> -            if (is_status) {                             \
> -                bit = map[i].virtio_bit;                 \
> -            }                                            \
> -            else {                                       \
> -                bit = 1ULL << map[i].virtio_bit;         \
> -            }                                            \
> -            if ((bitmap & bit) == 0) {                   \
> -                continue;                                \
> -            }                                            \
> -            node = g_new0(type, 1);                      \
> -            node->value = g_strdup(map[i].feature_desc); \
> -            node->next = list;                           \
> -            list = node;                                 \
> -            bitmap ^= bit;                               \
> -        }                                                \
> -        list;                                            \
> -    })
> -
> -static VirtioDeviceStatus *qmp_decode_status(uint8_t bitmap)
> -{
> -    VirtioDeviceStatus *status;
> -    uint8_t bit;
> -    int i;
> -
> -    status = g_new0(VirtioDeviceStatus, 1);
> -    status->statuses = CONVERT_FEATURES(strList, virtio_config_status_map,
> -                                        1, bitmap);
> -    status->has_unknown_statuses = bitmap != 0;
> -    if (status->has_unknown_statuses) {
> -        status->unknown_statuses = bitmap;
> -    }
> -
> -    return status;
> -}
> -
> -static VhostDeviceProtocols *qmp_decode_protocols(uint64_t bitmap)
> -{
> -    VhostDeviceProtocols *vhu_protocols;
> -    uint64_t bit;
> -    int i;
> -
> -    vhu_protocols = g_new0(VhostDeviceProtocols, 1);
> -    vhu_protocols->protocols =
> -                    CONVERT_FEATURES(strList,
> -                                     vhost_user_protocol_map, 0, bitmap);
> -    vhu_protocols->has_unknown_protocols = bitmap != 0;
> -    if (vhu_protocols->has_unknown_protocols) {
> -        vhu_protocols->unknown_protocols = bitmap;
> -    }
> -
> -    return vhu_protocols;
> -}
> -
> -static VirtioDeviceFeatures *qmp_decode_features(uint16_t device_id,
> -                                                 uint64_t bitmap)
> -{
> -    VirtioDeviceFeatures *features;
> -    uint64_t bit;
> -    int i;
> -
> -    features = g_new0(VirtioDeviceFeatures, 1);
> -    features->has_dev_features = true;
> -
> -    /* transport features */
> -    features->transports = CONVERT_FEATURES(strList, virtio_transport_map, 0,
> -                                            bitmap);
> -
> -    /* device features */
> -    switch (device_id) {
> -#ifdef CONFIG_VIRTIO_SERIAL
> -    case VIRTIO_ID_CONSOLE:
> -        features->dev_features =
> -            CONVERT_FEATURES(strList, virtio_serial_feature_map, 0, bitmap);
> -        break;
> -#endif
> -#ifdef CONFIG_VIRTIO_BLK
> -    case VIRTIO_ID_BLOCK:
> -        features->dev_features =
> -            CONVERT_FEATURES(strList, virtio_blk_feature_map, 0, bitmap);
> -        break;
> -#endif
> -#ifdef CONFIG_VIRTIO_GPU
> -    case VIRTIO_ID_GPU:
> -        features->dev_features =
> -            CONVERT_FEATURES(strList, virtio_gpu_feature_map, 0, bitmap);
> -        break;
> -#endif
> -#ifdef CONFIG_VIRTIO_NET
> -    case VIRTIO_ID_NET:
> -        features->dev_features =
> -            CONVERT_FEATURES(strList, virtio_net_feature_map, 0, bitmap);
> -        break;
> -#endif
> -#ifdef CONFIG_VIRTIO_SCSI
> -    case VIRTIO_ID_SCSI:
> -        features->dev_features =
> -            CONVERT_FEATURES(strList, virtio_scsi_feature_map, 0, bitmap);
> -        break;
> -#endif
> -#ifdef CONFIG_VIRTIO_BALLOON
> -    case VIRTIO_ID_BALLOON:
> -        features->dev_features =
> -            CONVERT_FEATURES(strList, virtio_balloon_feature_map, 0, bitmap);
> -        break;
> -#endif
> -#ifdef CONFIG_VIRTIO_IOMMU
> -    case VIRTIO_ID_IOMMU:
> -        features->dev_features =
> -            CONVERT_FEATURES(strList, virtio_iommu_feature_map, 0, bitmap);
> -        break;
> -#endif
> -#ifdef CONFIG_VIRTIO_INPUT
> -    case VIRTIO_ID_INPUT:
> -        features->dev_features =
> -            CONVERT_FEATURES(strList, virtio_input_feature_map, 0, bitmap);
> -        break;
> -#endif
> -#ifdef CONFIG_VHOST_USER_FS
> -    case VIRTIO_ID_FS:
> -        features->dev_features =
> -            CONVERT_FEATURES(strList, virtio_fs_feature_map, 0, bitmap);
> -        break;
> -#endif
> -#ifdef CONFIG_VHOST_VSOCK
> -    case VIRTIO_ID_VSOCK:
> -        features->dev_features =
> -            CONVERT_FEATURES(strList, virtio_vsock_feature_map, 0, bitmap);
> -        break;
> -#endif
> -#ifdef CONFIG_VIRTIO_CRYPTO
> -    case VIRTIO_ID_CRYPTO:
> -        features->dev_features =
> -            CONVERT_FEATURES(strList, virtio_crypto_feature_map, 0, bitmap);
> -        break;
> -#endif
> -#ifdef CONFIG_VIRTIO_MEM
> -    case VIRTIO_ID_MEM:
> -        features->dev_features =
> -            CONVERT_FEATURES(strList, virtio_mem_feature_map, 0, bitmap);
> -        break;
> -#endif
> -#ifdef CONFIG_VIRTIO_I2C_ADAPTER
> -    case VIRTIO_ID_I2C_ADAPTER:
> -        features->dev_features =
> -            CONVERT_FEATURES(strList, virtio_i2c_feature_map, 0, bitmap);
> -        break;
> -#endif
> -#ifdef CONFIG_VIRTIO_RNG
> -    case VIRTIO_ID_RNG:
> -        features->dev_features =
> -            CONVERT_FEATURES(strList, virtio_rng_feature_map, 0, bitmap);
> -        break;
> -#endif
> -    /* No features */
> -    case VIRTIO_ID_9P:
> -    case VIRTIO_ID_PMEM:
> -    case VIRTIO_ID_IOMEM:
> -    case VIRTIO_ID_RPMSG:
> -    case VIRTIO_ID_CLOCK:
> -    case VIRTIO_ID_MAC80211_WLAN:
> -    case VIRTIO_ID_MAC80211_HWSIM:
> -    case VIRTIO_ID_RPROC_SERIAL:
> -    case VIRTIO_ID_MEMORY_BALLOON:
> -    case VIRTIO_ID_CAIF:
> -    case VIRTIO_ID_SIGNAL_DIST:
> -    case VIRTIO_ID_PSTORE:
> -    case VIRTIO_ID_SOUND:
> -    case VIRTIO_ID_BT:
> -    case VIRTIO_ID_RPMB:
> -    case VIRTIO_ID_VIDEO_ENCODER:
> -    case VIRTIO_ID_VIDEO_DECODER:
> -    case VIRTIO_ID_SCMI:
> -    case VIRTIO_ID_NITRO_SEC_MOD:
> -    case VIRTIO_ID_WATCHDOG:
> -    case VIRTIO_ID_CAN:
> -    case VIRTIO_ID_DMABUF:
> -    case VIRTIO_ID_PARAM_SERV:
> -    case VIRTIO_ID_AUDIO_POLICY:
> -    case VIRTIO_ID_GPIO:
> -        break;
> -    default:
> -        g_assert_not_reached();
> -    }
> -
> -    features->has_unknown_dev_features = bitmap != 0;
> -    if (features->has_unknown_dev_features) {
> -        features->unknown_dev_features = bitmap;
> -    }
> -
> -    return features;
> -}
> -
>   VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
>   {
>       VirtIODevice *vdev;
--------------d9NLnOXxQiMLiD5hcnPaVJkp
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/13/22 06:17, Philippe
      Mathieu-Daudé wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20221213111707.34921-7-philmd@linaro.org">
      <pre class="moz-quote-pre" wrap="">The monitor decoders are the only functions using the CONFIG_xxx
definitions declared in the target specific CONFIG_DEVICES header.

Signed-off-by: Philippe Mathieu-Daudé <a class="moz-txt-link-rfc2396E" href="mailto:philmd@linaro.org">&lt;philmd@linaro.org&gt;</a>
---
 hw/virtio/meson.build  |   2 +-
 hw/virtio/virtio-qmp.c | 659 +++++++++++++++++++++++++++++++++++++++++
 hw/virtio/virtio-qmp.h |  20 ++
 hw/virtio/virtio.c     | 635 +--------------------------------------
 4 files changed, 682 insertions(+), 634 deletions(-)
 create mode 100644 hw/virtio/virtio-qmp.c
 create mode 100644 hw/virtio/virtio-qmp.h

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 4a3b00d3bf..d506017760 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -5,7 +5,7 @@ softmmu_virtio_ss.add(when: 'CONFIG_VIRTIO_MMIO', if_true: files('virtio-mmio.c'
 
 specific_virtio_ss = ss.source_set()
 specific_virtio_ss.add(files('virtio.c'))
-specific_virtio_ss.add(files('virtio-config-io.c'))
+specific_virtio_ss.add(files('virtio-config-io.c', 'virtio-qmp.c'))
 
 if have_vhost
   specific_virtio_ss.add(files('vhost.c', 'vhost-backend.c', 'vhost-iova-tree.c'))
diff --git a/hw/virtio/virtio-qmp.c b/hw/virtio/virtio-qmp.c
new file mode 100644
index 0000000000..8e7282658f
--- /dev/null
+++ b/hw/virtio/virtio-qmp.c
@@ -0,0 +1,659 @@
+/*
+ * Virtio QMP helpers
+ *
+ * Copyright IBM, Corp. 2007
+ *
+ * Authors:
+ *  Anthony Liguori   <a class="moz-txt-link-rfc2396E" href="mailto:aliguori@us.ibm.com">&lt;aliguori@us.ibm.com&gt;</a>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include &quot;qemu/osdep.h&quot;
+#include &quot;hw/virtio/virtio.h&quot;
+#include &quot;virtio-qmp.h&quot;
+
+#include &quot;standard-headers/linux/virtio_ids.h&quot;
+#include &quot;standard-headers/linux/vhost_types.h&quot;
+#include &quot;standard-headers/linux/virtio_blk.h&quot;
+#include &quot;standard-headers/linux/virtio_console.h&quot;
+#include &quot;standard-headers/linux/virtio_gpu.h&quot;
+#include &quot;standard-headers/linux/virtio_net.h&quot;
+#include &quot;standard-headers/linux/virtio_scsi.h&quot;
+#include &quot;standard-headers/linux/virtio_i2c.h&quot;
+#include &quot;standard-headers/linux/virtio_balloon.h&quot;
+#include &quot;standard-headers/linux/virtio_iommu.h&quot;
+#include &quot;standard-headers/linux/virtio_mem.h&quot;
+#include &quot;standard-headers/linux/virtio_vsock.h&quot;
+
+#include CONFIG_DEVICES
+
+#define FEATURE_ENTRY(name, desc) (qmp_virtio_feature_map_t) \
+    { .virtio_bit = name, .feature_desc = desc }
+
+enum VhostUserProtocolFeature {
+    VHOST_USER_PROTOCOL_F_MQ = 0,
+    VHOST_USER_PROTOCOL_F_LOG_SHMFD = 1,
+    VHOST_USER_PROTOCOL_F_RARP = 2,
+    VHOST_USER_PROTOCOL_F_REPLY_ACK = 3,
+    VHOST_USER_PROTOCOL_F_NET_MTU = 4,
+    VHOST_USER_PROTOCOL_F_SLAVE_REQ = 5,
+    VHOST_USER_PROTOCOL_F_CROSS_ENDIAN = 6,
+    VHOST_USER_PROTOCOL_F_CRYPTO_SESSION = 7,
+    VHOST_USER_PROTOCOL_F_PAGEFAULT = 8,
+    VHOST_USER_PROTOCOL_F_CONFIG = 9,
+    VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD = 10,
+    VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
+    VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
+    VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
+    VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS = 14,
+    VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
+    VHOST_USER_PROTOCOL_F_MAX
+};
+
+/* Virtio transport features mapping */
+static const qmp_virtio_feature_map_t virtio_transport_map[] = {
+    /* Virtio device transport features */
+#ifndef VIRTIO_CONFIG_NO_LEGACY
+    FEATURE_ENTRY(VIRTIO_F_NOTIFY_ON_EMPTY, \
+            &quot;VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of avail. &quot;
+            &quot;descs. on VQ&quot;),
+    FEATURE_ENTRY(VIRTIO_F_ANY_LAYOUT, \
+            &quot;VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts&quot;),
+#endif /* !VIRTIO_CONFIG_NO_LEGACY */
+    FEATURE_ENTRY(VIRTIO_F_VERSION_1, \
+            &quot;VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)&quot;),
+    FEATURE_ENTRY(VIRTIO_F_IOMMU_PLATFORM, \
+            &quot;VIRTIO_F_IOMMU_PLATFORM: Device can be used on IOMMU platform&quot;),
+    FEATURE_ENTRY(VIRTIO_F_RING_PACKED, \
+            &quot;VIRTIO_F_RING_PACKED: Device supports packed VQ layout&quot;),
+    FEATURE_ENTRY(VIRTIO_F_IN_ORDER, \
+            &quot;VIRTIO_F_IN_ORDER: Device uses buffers in same order as made &quot;
+            &quot;available by driver&quot;),
+    FEATURE_ENTRY(VIRTIO_F_ORDER_PLATFORM, \
+            &quot;VIRTIO_F_ORDER_PLATFORM: Memory accesses ordered by platform&quot;),
+    FEATURE_ENTRY(VIRTIO_F_SR_IOV, \
+            &quot;VIRTIO_F_SR_IOV: Device supports single root I/O virtualization&quot;),
+    /* Virtio ring transport features */
+    FEATURE_ENTRY(VIRTIO_RING_F_INDIRECT_DESC, \
+            &quot;VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported&quot;),
+    FEATURE_ENTRY(VIRTIO_RING_F_EVENT_IDX, \
+            &quot;VIRTIO_RING_F_EVENT_IDX: Used &amp; avail. event fields enabled&quot;),
+    { -1, &quot;&quot; }
+};
+
+/* Vhost-user protocol features mapping */
+static const qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_MQ, \
+            &quot;VHOST_USER_PROTOCOL_F_MQ: Multiqueue protocol supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_LOG_SHMFD, \
+            &quot;VHOST_USER_PROTOCOL_F_LOG_SHMFD: Shared log memory fd supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_RARP, \
+            &quot;VHOST_USER_PROTOCOL_F_RARP: Vhost-user back-end RARP broadcasting &quot;
+            &quot;supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_REPLY_ACK, \
+            &quot;VHOST_USER_PROTOCOL_F_REPLY_ACK: Requested operation status ack. &quot;
+            &quot;supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_NET_MTU, \
+            &quot;VHOST_USER_PROTOCOL_F_NET_MTU: Expose host MTU to guest supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_SLAVE_REQ, \
+            &quot;VHOST_USER_PROTOCOL_F_SLAVE_REQ: Socket fd for back-end initiated &quot;
+            &quot;requests supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CROSS_ENDIAN, \
+            &quot;VHOST_USER_PROTOCOL_F_CROSS_ENDIAN: Endianness of VQs for legacy &quot;
+            &quot;devices supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CRYPTO_SESSION, \
+            &quot;VHOST_USER_PROTOCOL_F_CRYPTO_SESSION: Session creation for crypto &quot;
+            &quot;operations supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_PAGEFAULT, \
+            &quot;VHOST_USER_PROTOCOL_F_PAGEFAULT: Request servicing on userfaultfd &quot;
+            &quot;for accessed pages supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CONFIG, \
+            &quot;VHOST_USER_PROTOCOL_F_CONFIG: Vhost-user messaging for virtio &quot;
+            &quot;device configuration space supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD, \
+            &quot;VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD: Slave fd communication &quot;
+            &quot;channel supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_HOST_NOTIFIER, \
+            &quot;VHOST_USER_PROTOCOL_F_HOST_NOTIFIER: Host notifiers for specified &quot;
+            &quot;VQs supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD, \
+            &quot;VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD: Shared inflight I/O buffers &quot;
+            &quot;supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_RESET_DEVICE, \
+            &quot;VHOST_USER_PROTOCOL_F_RESET_DEVICE: Disabling all rings and &quot;
+            &quot;resetting internal device state supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS, \
+            &quot;VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS: In-band messaging &quot;
+            &quot;supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS, \
+            &quot;VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS: Configuration for &quot;
+            &quot;memory slots supported&quot;),
+    { -1, &quot;&quot; }
+};
+
+/* virtio device configuration statuses */
+static const qmp_virtio_feature_map_t virtio_config_status_map[] = {
+    FEATURE_ENTRY(VIRTIO_CONFIG_S_DRIVER_OK, \
+            &quot;VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready&quot;),
+    FEATURE_ENTRY(VIRTIO_CONFIG_S_FEATURES_OK, \
+            &quot;VIRTIO_CONFIG_S_FEATURES_OK: Feature negotiation complete&quot;),
+    FEATURE_ENTRY(VIRTIO_CONFIG_S_DRIVER, \
+            &quot;VIRTIO_CONFIG_S_DRIVER: Guest OS compatible with device&quot;),
+    FEATURE_ENTRY(VIRTIO_CONFIG_S_NEEDS_RESET, \
+            &quot;VIRTIO_CONFIG_S_NEEDS_RESET: Irrecoverable error, device needs &quot;
+            &quot;reset&quot;),
+    FEATURE_ENTRY(VIRTIO_CONFIG_S_FAILED, \
+            &quot;VIRTIO_CONFIG_S_FAILED: Error in guest, device failed&quot;),
+    FEATURE_ENTRY(VIRTIO_CONFIG_S_ACKNOWLEDGE, \
+            &quot;VIRTIO_CONFIG_S_ACKNOWLEDGE: Valid virtio device found&quot;),
+    { -1, &quot;&quot; }
+};
+
+/* virtio-blk features mapping */
+#ifdef CONFIG_VIRTIO_BLK
+static const qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_BLK_F_SIZE_MAX, \
+            &quot;VIRTIO_BLK_F_SIZE_MAX: Max segment size is size_max&quot;),
+    FEATURE_ENTRY(VIRTIO_BLK_F_SEG_MAX, \
+            &quot;VIRTIO_BLK_F_SEG_MAX: Max segments in a request is seg_max&quot;),
+    FEATURE_ENTRY(VIRTIO_BLK_F_GEOMETRY, \
+            &quot;VIRTIO_BLK_F_GEOMETRY: Legacy geometry available&quot;),
+    FEATURE_ENTRY(VIRTIO_BLK_F_RO, \
+            &quot;VIRTIO_BLK_F_RO: Device is read-only&quot;),
+    FEATURE_ENTRY(VIRTIO_BLK_F_BLK_SIZE, \
+            &quot;VIRTIO_BLK_F_BLK_SIZE: Block size of disk available&quot;),
+    FEATURE_ENTRY(VIRTIO_BLK_F_TOPOLOGY, \
+            &quot;VIRTIO_BLK_F_TOPOLOGY: Topology information available&quot;),
+    FEATURE_ENTRY(VIRTIO_BLK_F_MQ, \
+            &quot;VIRTIO_BLK_F_MQ: Multiqueue supported&quot;),
+    FEATURE_ENTRY(VIRTIO_BLK_F_DISCARD, \
+            &quot;VIRTIO_BLK_F_DISCARD: Discard command supported&quot;),
+    FEATURE_ENTRY(VIRTIO_BLK_F_WRITE_ZEROES, \
+            &quot;VIRTIO_BLK_F_WRITE_ZEROES: Write zeroes command supported&quot;),
+#ifndef VIRTIO_BLK_NO_LEGACY
+    FEATURE_ENTRY(VIRTIO_BLK_F_BARRIER, \
+            &quot;VIRTIO_BLK_F_BARRIER: Request barriers supported&quot;),
+    FEATURE_ENTRY(VIRTIO_BLK_F_SCSI, \
+            &quot;VIRTIO_BLK_F_SCSI: SCSI packet commands supported&quot;),
+    FEATURE_ENTRY(VIRTIO_BLK_F_FLUSH, \
+            &quot;VIRTIO_BLK_F_FLUSH: Flush command supported&quot;),
+    FEATURE_ENTRY(VIRTIO_BLK_F_CONFIG_WCE, \
+            &quot;VIRTIO_BLK_F_CONFIG_WCE: Cache writeback and writethrough modes &quot;
+            &quot;supported&quot;),
+#endif /* !VIRTIO_BLK_NO_LEGACY */
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            &quot;VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features &quot;
+            &quot;negotiation supported&quot;),
+    { -1, &quot;&quot; }
+};
+#endif
+
+/* virtio-serial features mapping */
+#ifdef CONFIG_VIRTIO_SERIAL
+static const qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_CONSOLE_F_SIZE, \
+            &quot;VIRTIO_CONSOLE_F_SIZE: Host providing console size&quot;),
+    FEATURE_ENTRY(VIRTIO_CONSOLE_F_MULTIPORT, \
+            &quot;VIRTIO_CONSOLE_F_MULTIPORT: Multiple ports for device supported&quot;),
+    FEATURE_ENTRY(VIRTIO_CONSOLE_F_EMERG_WRITE, \
+            &quot;VIRTIO_CONSOLE_F_EMERG_WRITE: Emergency write supported&quot;),
+    { -1, &quot;&quot; }
+};
+#endif
+
+/* virtio-gpu features mapping */
+#ifdef CONFIG_VIRTIO_GPU
+static const qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_GPU_F_VIRGL, \
+            &quot;VIRTIO_GPU_F_VIRGL: Virgl 3D mode supported&quot;),
+    FEATURE_ENTRY(VIRTIO_GPU_F_EDID, \
+            &quot;VIRTIO_GPU_F_EDID: EDID metadata supported&quot;),
+    FEATURE_ENTRY(VIRTIO_GPU_F_RESOURCE_UUID, \
+            &quot;VIRTIO_GPU_F_RESOURCE_UUID: Resource UUID assigning supported&quot;),
+    FEATURE_ENTRY(VIRTIO_GPU_F_RESOURCE_BLOB, \
+            &quot;VIRTIO_GPU_F_RESOURCE_BLOB: Size-based blob resources supported&quot;),
+    FEATURE_ENTRY(VIRTIO_GPU_F_CONTEXT_INIT, \
+            &quot;VIRTIO_GPU_F_CONTEXT_INIT: Context types and synchronization &quot;
+            &quot;timelines supported&quot;),
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            &quot;VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features &quot;
+            &quot;negotiation supported&quot;),
+    { -1, &quot;&quot; }
+};
+#endif
+
+/* virtio-input features mapping */
+#ifdef CONFIG_VIRTIO_INPUT
+static const qmp_virtio_feature_map_t virtio_input_feature_map[] = {
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            &quot;VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features &quot;
+            &quot;negotiation supported&quot;),
+    { -1, &quot;&quot; }
+};
+#endif
+
+/* virtio-net features mapping */
+#ifdef CONFIG_VIRTIO_NET
+static const qmp_virtio_feature_map_t virtio_net_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_NET_F_CSUM, \
+            &quot;VIRTIO_NET_F_CSUM: Device handling packets with partial checksum &quot;
+            &quot;supported&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_CSUM, \
+            &quot;VIRTIO_NET_F_GUEST_CSUM: Driver handling packets with partial &quot;
+            &quot;checksum supported&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_GUEST_OFFLOADS, \
+            &quot;VIRTIO_NET_F_CTRL_GUEST_OFFLOADS: Control channel offloading &quot;
+            &quot;reconfig. supported&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_MTU, \
+            &quot;VIRTIO_NET_F_MTU: Device max MTU reporting supported&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_MAC, \
+            &quot;VIRTIO_NET_F_MAC: Device has given MAC address&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_TSO4, \
+            &quot;VIRTIO_NET_F_GUEST_TSO4: Driver can receive TSOv4&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_TSO6, \
+            &quot;VIRTIO_NET_F_GUEST_TSO6: Driver can receive TSOv6&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_ECN, \
+            &quot;VIRTIO_NET_F_GUEST_ECN: Driver can receive TSO with ECN&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_UFO, \
+            &quot;VIRTIO_NET_F_GUEST_UFO: Driver can receive UFO&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_HOST_TSO4, \
+            &quot;VIRTIO_NET_F_HOST_TSO4: Device can receive TSOv4&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_HOST_TSO6, \
+            &quot;VIRTIO_NET_F_HOST_TSO6: Device can receive TSOv6&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_HOST_ECN, \
+            &quot;VIRTIO_NET_F_HOST_ECN: Device can receive TSO with ECN&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_HOST_UFO, \
+            &quot;VIRTIO_NET_F_HOST_UFO: Device can receive UFO&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_MRG_RXBUF, \
+            &quot;VIRTIO_NET_F_MRG_RXBUF: Driver can merge receive buffers&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_STATUS, \
+            &quot;VIRTIO_NET_F_STATUS: Configuration status field available&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_VQ, \
+            &quot;VIRTIO_NET_F_CTRL_VQ: Control channel available&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_RX, \
+            &quot;VIRTIO_NET_F_CTRL_RX: Control channel RX mode supported&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_VLAN, \
+            &quot;VIRTIO_NET_F_CTRL_VLAN: Control channel VLAN filtering supported&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_RX_EXTRA, \
+            &quot;VIRTIO_NET_F_CTRL_RX_EXTRA: Extra RX mode control supported&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_ANNOUNCE, \
+            &quot;VIRTIO_NET_F_GUEST_ANNOUNCE: Driver sending gratuitous packets &quot;
+            &quot;supported&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_MQ, \
+            &quot;VIRTIO_NET_F_MQ: Multiqueue with automatic receive steering &quot;
+            &quot;supported&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_MAC_ADDR, \
+            &quot;VIRTIO_NET_F_CTRL_MAC_ADDR: MAC address set through control &quot;
+            &quot;channel&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_HASH_REPORT, \
+            &quot;VIRTIO_NET_F_HASH_REPORT: Hash reporting supported&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_RSS, \
+            &quot;VIRTIO_NET_F_RSS: RSS RX steering supported&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_RSC_EXT, \
+            &quot;VIRTIO_NET_F_RSC_EXT: Extended coalescing info supported&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_STANDBY, \
+            &quot;VIRTIO_NET_F_STANDBY: Device acting as standby for primary &quot;
+            &quot;device with same MAC addr. supported&quot;),
+    FEATURE_ENTRY(VIRTIO_NET_F_SPEED_DUPLEX, \
+            &quot;VIRTIO_NET_F_SPEED_DUPLEX: Device set linkspeed and duplex&quot;),
+#ifndef VIRTIO_NET_NO_LEGACY
+    FEATURE_ENTRY(VIRTIO_NET_F_GSO, \
+            &quot;VIRTIO_NET_F_GSO: Handling GSO-type packets supported&quot;),
+#endif /* !VIRTIO_NET_NO_LEGACY */
+    FEATURE_ENTRY(VHOST_NET_F_VIRTIO_NET_HDR, \
+            &quot;VHOST_NET_F_VIRTIO_NET_HDR: Virtio-net headers for RX and TX &quot;
+            &quot;packets supported&quot;),
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            &quot;VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features &quot;
+            &quot;negotiation supported&quot;),
+    { -1, &quot;&quot; }
+};
+#endif
+
+/* virtio-scsi features mapping */
+#ifdef CONFIG_VIRTIO_SCSI
+static const qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_SCSI_F_INOUT, \
+            &quot;VIRTIO_SCSI_F_INOUT: Requests including read and writable data &quot;
+            &quot;buffers suppoted&quot;),
+    FEATURE_ENTRY(VIRTIO_SCSI_F_HOTPLUG, \
+            &quot;VIRTIO_SCSI_F_HOTPLUG: Reporting and handling hot-plug events &quot;
+            &quot;supported&quot;),
+    FEATURE_ENTRY(VIRTIO_SCSI_F_CHANGE, \
+            &quot;VIRTIO_SCSI_F_CHANGE: Reporting and handling LUN changes &quot;
+            &quot;supported&quot;),
+    FEATURE_ENTRY(VIRTIO_SCSI_F_T10_PI, \
+            &quot;VIRTIO_SCSI_F_T10_PI: T10 info included in request header&quot;),
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            &quot;VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features &quot;
+            &quot;negotiation supported&quot;),
+    { -1, &quot;&quot; }
+};
+#endif
+
+/* virtio/vhost-user-fs features mapping */
+#ifdef CONFIG_VHOST_USER_FS
+static const qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            &quot;VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features &quot;
+            &quot;negotiation supported&quot;),
+    { -1, &quot;&quot; }
+};
+#endif
+
+/* virtio/vhost-user-i2c features mapping */
+#ifdef CONFIG_VIRTIO_I2C_ADAPTER
+static const qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_I2C_F_ZERO_LENGTH_REQUEST, \
+            &quot;VIRTIO_I2C_F_ZERO_LEGNTH_REQUEST: Zero length requests supported&quot;),
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            &quot;VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features &quot;
+            &quot;negotiation supported&quot;),
+    { -1, &quot;&quot; }
+};
+#endif
+
+/* virtio/vhost-vsock features mapping */
+#ifdef CONFIG_VHOST_VSOCK
+static const qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_VSOCK_F_SEQPACKET, \
+            &quot;VIRTIO_VSOCK_F_SEQPACKET: SOCK_SEQPACKET supported&quot;),
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            &quot;VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features &quot;
+            &quot;negotiation supported&quot;),
+    { -1, &quot;&quot; }
+};
+#endif
+
+/* virtio-balloon features mapping */
+#ifdef CONFIG_VIRTIO_BALLOON
+static const qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_BALLOON_F_MUST_TELL_HOST, \
+            &quot;VIRTIO_BALLOON_F_MUST_TELL_HOST: Tell host before reclaiming &quot;
+            &quot;pages&quot;),
+    FEATURE_ENTRY(VIRTIO_BALLOON_F_STATS_VQ, \
+            &quot;VIRTIO_BALLOON_F_STATS_VQ: Guest memory stats VQ available&quot;),
+    FEATURE_ENTRY(VIRTIO_BALLOON_F_DEFLATE_ON_OOM, \
+            &quot;VIRTIO_BALLOON_F_DEFLATE_ON_OOM: Deflate balloon when guest OOM&quot;),
+    FEATURE_ENTRY(VIRTIO_BALLOON_F_FREE_PAGE_HINT, \
+            &quot;VIRTIO_BALLOON_F_FREE_PAGE_HINT: VQ reporting free pages enabled&quot;),
+    FEATURE_ENTRY(VIRTIO_BALLOON_F_PAGE_POISON, \
+            &quot;VIRTIO_BALLOON_F_PAGE_POISON: Guest page poisoning enabled&quot;),
+    FEATURE_ENTRY(VIRTIO_BALLOON_F_REPORTING, \
+            &quot;VIRTIO_BALLOON_F_REPORTING: Page reporting VQ enabled&quot;),
+    { -1, &quot;&quot; }
+};
+#endif
+
+/* virtio-crypto features mapping */
+#ifdef CONFIG_VIRTIO_CRYPTO
+static const qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
+    { -1, &quot;&quot; }
+};
+#endif
+
+/* virtio-iommu features mapping */
+#ifdef CONFIG_VIRTIO_IOMMU
+static const qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_IOMMU_F_INPUT_RANGE, \
+            &quot;VIRTIO_IOMMU_F_INPUT_RANGE: Range of available virtual addrs. &quot;
+            &quot;available&quot;),
+    FEATURE_ENTRY(VIRTIO_IOMMU_F_DOMAIN_RANGE, \
+            &quot;VIRTIO_IOMMU_F_DOMAIN_RANGE: Number of supported domains &quot;
+            &quot;available&quot;),
+    FEATURE_ENTRY(VIRTIO_IOMMU_F_MAP_UNMAP, \
+            &quot;VIRTIO_IOMMU_F_MAP_UNMAP: Map and unmap requests available&quot;),
+    FEATURE_ENTRY(VIRTIO_IOMMU_F_BYPASS, \
+            &quot;VIRTIO_IOMMU_F_BYPASS: Endpoints not attached to domains are in &quot;
+            &quot;bypass mode&quot;),
+    FEATURE_ENTRY(VIRTIO_IOMMU_F_PROBE, \
+            &quot;VIRTIO_IOMMU_F_PROBE: Probe requests available&quot;),
+    FEATURE_ENTRY(VIRTIO_IOMMU_F_MMIO, \
+            &quot;VIRTIO_IOMMU_F_MMIO: VIRTIO_IOMMU_MAP_F_MMIO flag available&quot;),
+    FEATURE_ENTRY(VIRTIO_IOMMU_F_BYPASS_CONFIG, \
+            &quot;VIRTIO_IOMMU_F_BYPASS_CONFIG: Bypass field of IOMMU config &quot;
+            &quot;available&quot;),
+    { -1, &quot;&quot; }
+};
+#endif
+
+/* virtio-mem features mapping */
+#ifdef CONFIG_VIRTIO_MEM
+static const qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
+#ifndef CONFIG_ACPI
+    FEATURE_ENTRY(VIRTIO_MEM_F_ACPI_PXM, \
+            &quot;VIRTIO_MEM_F_ACPI_PXM: node_id is an ACPI PXM and is valid&quot;),
+#endif /* !CONFIG_ACPI */
+    FEATURE_ENTRY(VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, \
+            &quot;VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE: Unplugged memory cannot be &quot;
+            &quot;accessed&quot;),
+    { -1, &quot;&quot; }
+};
+#endif
+
+/* virtio-rng features mapping */
+#ifdef CONFIG_VIRTIO_RNG
+static const qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            &quot;VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features &quot;
+            &quot;negotiation supported&quot;),
+    { -1, &quot;&quot; }
+};
+#endif
+
+#define CONVERT_FEATURES(type, map, is_status, bitmap)   \
+    ({                                                   \
+        type *list = NULL;                               \
+        type *node;                                      \
+        for (i = 0; map[i].virtio_bit != -1; i++) {      \
+            if (is_status) {                             \
+                bit = map[i].virtio_bit;                 \
+            }                                            \
+            else {                                       \
+                bit = 1ULL &lt;&lt; map[i].virtio_bit;         \
+            }                                            \
+            if ((bitmap &amp; bit) == 0) {                   \
+                continue;                                \
+            }                                            \
+            node = g_new0(type, 1);                      \
+            node-&gt;value = g_strdup(map[i].feature_desc); \
+            node-&gt;next = list;                           \
+            list = node;                                 \
+            bitmap ^= bit;                               \
+        }                                                \
+        list;                                            \
+    })
+
+VirtioDeviceStatus *qmp_decode_status(uint8_t bitmap)
+{
+    VirtioDeviceStatus *status;
+    uint8_t bit;
+    int i;
+
+    status = g_new0(VirtioDeviceStatus, 1);
+    status-&gt;statuses = CONVERT_FEATURES(strList, virtio_config_status_map,
+                                        1, bitmap);
+    status-&gt;has_unknown_statuses = bitmap != 0;
+    if (status-&gt;has_unknown_statuses) {
+        status-&gt;unknown_statuses = bitmap;
+    }
+
+    return status;
+}
+
+VhostDeviceProtocols *qmp_decode_protocols(uint64_t bitmap)
+{
+    VhostDeviceProtocols *vhu_protocols;
+    uint64_t bit;
+    int i;
+
+    vhu_protocols = g_new0(VhostDeviceProtocols, 1);
+    vhu_protocols-&gt;protocols =
+                    CONVERT_FEATURES(strList,
+                                     vhost_user_protocol_map, 0, bitmap);
+    vhu_protocols-&gt;has_unknown_protocols = bitmap != 0;
+    if (vhu_protocols-&gt;has_unknown_protocols) {
+        vhu_protocols-&gt;unknown_protocols = bitmap;
+    }
+
+    return vhu_protocols;
+}
+
+VirtioDeviceFeatures *qmp_decode_features(uint16_t device_id, uint64_t bitmap)
+{
+    VirtioDeviceFeatures *features;
+    uint64_t bit;
+    int i;
+
+    features = g_new0(VirtioDeviceFeatures, 1);
+    features-&gt;has_dev_features = true;
+
+    /* transport features */
+    features-&gt;transports = CONVERT_FEATURES(strList, virtio_transport_map, 0,
+                                            bitmap);
+
+    /* device features */
+    switch (device_id) {
+#ifdef CONFIG_VIRTIO_SERIAL
+    case VIRTIO_ID_CONSOLE:
+        features-&gt;dev_features =
+            CONVERT_FEATURES(strList, virtio_serial_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_BLK
+    case VIRTIO_ID_BLOCK:
+        features-&gt;dev_features =
+            CONVERT_FEATURES(strList, virtio_blk_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_GPU
+    case VIRTIO_ID_GPU:
+        features-&gt;dev_features =
+            CONVERT_FEATURES(strList, virtio_gpu_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_NET
+    case VIRTIO_ID_NET:
+        features-&gt;dev_features =
+            CONVERT_FEATURES(strList, virtio_net_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_SCSI
+    case VIRTIO_ID_SCSI:
+        features-&gt;dev_features =
+            CONVERT_FEATURES(strList, virtio_scsi_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_BALLOON
+    case VIRTIO_ID_BALLOON:
+        features-&gt;dev_features =
+            CONVERT_FEATURES(strList, virtio_balloon_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_IOMMU
+    case VIRTIO_ID_IOMMU:
+        features-&gt;dev_features =
+            CONVERT_FEATURES(strList, virtio_iommu_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_INPUT
+    case VIRTIO_ID_INPUT:
+        features-&gt;dev_features =
+            CONVERT_FEATURES(strList, virtio_input_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VHOST_USER_FS
+    case VIRTIO_ID_FS:
+        features-&gt;dev_features =
+            CONVERT_FEATURES(strList, virtio_fs_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VHOST_VSOCK
+    case VIRTIO_ID_VSOCK:
+        features-&gt;dev_features =
+            CONVERT_FEATURES(strList, virtio_vsock_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_CRYPTO
+    case VIRTIO_ID_CRYPTO:
+        features-&gt;dev_features =
+            CONVERT_FEATURES(strList, virtio_crypto_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_MEM
+    case VIRTIO_ID_MEM:
+        features-&gt;dev_features =
+            CONVERT_FEATURES(strList, virtio_mem_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_I2C_ADAPTER
+    case VIRTIO_ID_I2C_ADAPTER:
+        features-&gt;dev_features =
+            CONVERT_FEATURES(strList, virtio_i2c_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_RNG
+    case VIRTIO_ID_RNG:
+        features-&gt;dev_features =
+            CONVERT_FEATURES(strList, virtio_rng_feature_map, 0, bitmap);
+        break;
+#endif
+    /* No features */
+    case VIRTIO_ID_9P:
+    case VIRTIO_ID_PMEM:
+    case VIRTIO_ID_IOMEM:
+    case VIRTIO_ID_RPMSG:
+    case VIRTIO_ID_CLOCK:
+    case VIRTIO_ID_MAC80211_WLAN:
+    case VIRTIO_ID_MAC80211_HWSIM:
+    case VIRTIO_ID_RPROC_SERIAL:
+    case VIRTIO_ID_MEMORY_BALLOON:
+    case VIRTIO_ID_CAIF:
+    case VIRTIO_ID_SIGNAL_DIST:
+    case VIRTIO_ID_PSTORE:
+    case VIRTIO_ID_SOUND:
+    case VIRTIO_ID_BT:
+    case VIRTIO_ID_RPMB:
+    case VIRTIO_ID_VIDEO_ENCODER:
+    case VIRTIO_ID_VIDEO_DECODER:
+    case VIRTIO_ID_SCMI:
+    case VIRTIO_ID_NITRO_SEC_MOD:
+    case VIRTIO_ID_WATCHDOG:
+    case VIRTIO_ID_CAN:
+    case VIRTIO_ID_DMABUF:
+    case VIRTIO_ID_PARAM_SERV:
+    case VIRTIO_ID_AUDIO_POLICY:
+    case VIRTIO_ID_GPIO:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    features-&gt;has_unknown_dev_features = bitmap != 0;
+    if (features-&gt;has_unknown_dev_features) {
+        features-&gt;unknown_dev_features = bitmap;
+    }
+
+    return features;
+}</pre>
    </blockquote>
    <pre>I haven't tried this myself, but is there a reason why we're not also including
the 'qmp_decode_vring_desc_flags' function here?
</pre>
    <blockquote type="cite" cite="mid:20221213111707.34921-7-philmd@linaro.org">
      <pre class="moz-quote-pre" wrap="">
diff --git a/hw/virtio/virtio-qmp.h b/hw/virtio/virtio-qmp.h
new file mode 100644
index 0000000000..075fc27030
--- /dev/null
+++ b/hw/virtio/virtio-qmp.h
@@ -0,0 +1,20 @@
+/*
+ * Virtio QMP helpers
+ *
+ * Copyright IBM, Corp. 2007
+ *
+ * Authors:
+ *  Anthony Liguori   <a class="moz-txt-link-rfc2396E" href="mailto:aliguori@us.ibm.com">&lt;aliguori@us.ibm.com&gt;</a>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef HW_VIRTIO_QMP_H
+#define HW_VIRTIO_QMP_H
+
+#include &quot;qapi/qapi-types-virtio.h&quot;
+
+VirtioDeviceStatus *qmp_decode_status(uint8_t bitmap);
+VhostDeviceProtocols *qmp_decode_protocols(uint64_t bitmap);
+VirtioDeviceFeatures *qmp_decode_features(uint16_t device_id, uint64_t bitmap);
+
+#endif
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 01d043b3c6..09b1a0e3d9 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -16,7 +16,6 @@
 #include &quot;qapi/qmp/qdict.h&quot;
 #include &quot;qapi/qapi-commands-virtio.h&quot;
 #include &quot;qapi/qapi-commands-qom.h&quot;
-#include &quot;qapi/qapi-visit-virtio.h&quot;
 #include &quot;qapi/qmp/qjson.h&quot;
 #include &quot;trace.h&quot;
 #include &quot;qemu/error-report.h&quot;
@@ -33,6 +32,8 @@
 #include &quot;hw/virtio/virtio-access.h&quot;
 #include &quot;sysemu/dma.h&quot;
 #include &quot;sysemu/runstate.h&quot;
+#include &quot;virtio-qmp.h&quot;
+
 #include &quot;standard-headers/linux/virtio_ids.h&quot;
 #include &quot;standard-headers/linux/vhost_types.h&quot;
 #include &quot;standard-headers/linux/virtio_blk.h&quot;
@@ -45,7 +46,6 @@
 #include &quot;standard-headers/linux/virtio_iommu.h&quot;
 #include &quot;standard-headers/linux/virtio_mem.h&quot;
 #include &quot;standard-headers/linux/virtio_vsock.h&quot;
-#include CONFIG_DEVICES
 
 /* QAPI list of realized VirtIODevices */
 static QTAILQ_HEAD(, VirtIODevice) virtio_list;
@@ -55,440 +55,6 @@ static QTAILQ_HEAD(, VirtIODevice) virtio_list;
  */
 #define VHOST_USER_MAX_CONFIG_SIZE 256
 
-#define FEATURE_ENTRY(name, desc) (qmp_virtio_feature_map_t) \
-    { .virtio_bit = name, .feature_desc = desc }
-
-enum VhostUserProtocolFeature {
-    VHOST_USER_PROTOCOL_F_MQ = 0,
-    VHOST_USER_PROTOCOL_F_LOG_SHMFD = 1,
-    VHOST_USER_PROTOCOL_F_RARP = 2,
-    VHOST_USER_PROTOCOL_F_REPLY_ACK = 3,
-    VHOST_USER_PROTOCOL_F_NET_MTU = 4,
-    VHOST_USER_PROTOCOL_F_SLAVE_REQ = 5,
-    VHOST_USER_PROTOCOL_F_CROSS_ENDIAN = 6,
-    VHOST_USER_PROTOCOL_F_CRYPTO_SESSION = 7,
-    VHOST_USER_PROTOCOL_F_PAGEFAULT = 8,
-    VHOST_USER_PROTOCOL_F_CONFIG = 9,
-    VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD = 10,
-    VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
-    VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
-    VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
-    VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS = 14,
-    VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
-    VHOST_USER_PROTOCOL_F_MAX
-};
-
-/* Virtio transport features mapping */
-static const qmp_virtio_feature_map_t virtio_transport_map[] = {
-    /* Virtio device transport features */
-#ifndef VIRTIO_CONFIG_NO_LEGACY
-    FEATURE_ENTRY(VIRTIO_F_NOTIFY_ON_EMPTY, \
-            &quot;VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of avail. &quot;
-            &quot;descs. on VQ&quot;),
-    FEATURE_ENTRY(VIRTIO_F_ANY_LAYOUT, \
-            &quot;VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts&quot;),
-#endif /* !VIRTIO_CONFIG_NO_LEGACY */
-    FEATURE_ENTRY(VIRTIO_F_VERSION_1, \
-            &quot;VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)&quot;),
-    FEATURE_ENTRY(VIRTIO_F_IOMMU_PLATFORM, \
-            &quot;VIRTIO_F_IOMMU_PLATFORM: Device can be used on IOMMU platform&quot;),
-    FEATURE_ENTRY(VIRTIO_F_RING_PACKED, \
-            &quot;VIRTIO_F_RING_PACKED: Device supports packed VQ layout&quot;),
-    FEATURE_ENTRY(VIRTIO_F_IN_ORDER, \
-            &quot;VIRTIO_F_IN_ORDER: Device uses buffers in same order as made &quot;
-            &quot;available by driver&quot;),
-    FEATURE_ENTRY(VIRTIO_F_ORDER_PLATFORM, \
-            &quot;VIRTIO_F_ORDER_PLATFORM: Memory accesses ordered by platform&quot;),
-    FEATURE_ENTRY(VIRTIO_F_SR_IOV, \
-            &quot;VIRTIO_F_SR_IOV: Device supports single root I/O virtualization&quot;),
-    /* Virtio ring transport features */
-    FEATURE_ENTRY(VIRTIO_RING_F_INDIRECT_DESC, \
-            &quot;VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported&quot;),
-    FEATURE_ENTRY(VIRTIO_RING_F_EVENT_IDX, \
-            &quot;VIRTIO_RING_F_EVENT_IDX: Used &amp; avail. event fields enabled&quot;),
-    { -1, &quot;&quot; }
-};
-
-/* Vhost-user protocol features mapping */
-static const qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_MQ, \
-            &quot;VHOST_USER_PROTOCOL_F_MQ: Multiqueue protocol supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_LOG_SHMFD, \
-            &quot;VHOST_USER_PROTOCOL_F_LOG_SHMFD: Shared log memory fd supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_RARP, \
-            &quot;VHOST_USER_PROTOCOL_F_RARP: Vhost-user back-end RARP broadcasting &quot;
-            &quot;supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_REPLY_ACK, \
-            &quot;VHOST_USER_PROTOCOL_F_REPLY_ACK: Requested operation status ack. &quot;
-            &quot;supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_NET_MTU, \
-            &quot;VHOST_USER_PROTOCOL_F_NET_MTU: Expose host MTU to guest supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_SLAVE_REQ, \
-            &quot;VHOST_USER_PROTOCOL_F_SLAVE_REQ: Socket fd for back-end initiated &quot;
-            &quot;requests supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CROSS_ENDIAN, \
-            &quot;VHOST_USER_PROTOCOL_F_CROSS_ENDIAN: Endianness of VQs for legacy &quot;
-            &quot;devices supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CRYPTO_SESSION, \
-            &quot;VHOST_USER_PROTOCOL_F_CRYPTO_SESSION: Session creation for crypto &quot;
-            &quot;operations supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_PAGEFAULT, \
-            &quot;VHOST_USER_PROTOCOL_F_PAGEFAULT: Request servicing on userfaultfd &quot;
-            &quot;for accessed pages supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CONFIG, \
-            &quot;VHOST_USER_PROTOCOL_F_CONFIG: Vhost-user messaging for virtio &quot;
-            &quot;device configuration space supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD, \
-            &quot;VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD: Slave fd communication &quot;
-            &quot;channel supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_HOST_NOTIFIER, \
-            &quot;VHOST_USER_PROTOCOL_F_HOST_NOTIFIER: Host notifiers for specified &quot;
-            &quot;VQs supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD, \
-            &quot;VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD: Shared inflight I/O buffers &quot;
-            &quot;supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_RESET_DEVICE, \
-            &quot;VHOST_USER_PROTOCOL_F_RESET_DEVICE: Disabling all rings and &quot;
-            &quot;resetting internal device state supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS, \
-            &quot;VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS: In-band messaging &quot;
-            &quot;supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS, \
-            &quot;VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS: Configuration for &quot;
-            &quot;memory slots supported&quot;),
-    { -1, &quot;&quot; }
-};
-
-/* virtio device configuration statuses */
-static const qmp_virtio_feature_map_t virtio_config_status_map[] = {
-    FEATURE_ENTRY(VIRTIO_CONFIG_S_DRIVER_OK, \
-            &quot;VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready&quot;),
-    FEATURE_ENTRY(VIRTIO_CONFIG_S_FEATURES_OK, \
-            &quot;VIRTIO_CONFIG_S_FEATURES_OK: Feature negotiation complete&quot;),
-    FEATURE_ENTRY(VIRTIO_CONFIG_S_DRIVER, \
-            &quot;VIRTIO_CONFIG_S_DRIVER: Guest OS compatible with device&quot;),
-    FEATURE_ENTRY(VIRTIO_CONFIG_S_NEEDS_RESET, \
-            &quot;VIRTIO_CONFIG_S_NEEDS_RESET: Irrecoverable error, device needs &quot;
-            &quot;reset&quot;),
-    FEATURE_ENTRY(VIRTIO_CONFIG_S_FAILED, \
-            &quot;VIRTIO_CONFIG_S_FAILED: Error in guest, device failed&quot;),
-    FEATURE_ENTRY(VIRTIO_CONFIG_S_ACKNOWLEDGE, \
-            &quot;VIRTIO_CONFIG_S_ACKNOWLEDGE: Valid virtio device found&quot;),
-    { -1, &quot;&quot; }
-};
-
-/* virtio-blk features mapping */
-#ifdef CONFIG_VIRTIO_BLK
-static const qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
-    FEATURE_ENTRY(VIRTIO_BLK_F_SIZE_MAX, \
-            &quot;VIRTIO_BLK_F_SIZE_MAX: Max segment size is size_max&quot;),
-    FEATURE_ENTRY(VIRTIO_BLK_F_SEG_MAX, \
-            &quot;VIRTIO_BLK_F_SEG_MAX: Max segments in a request is seg_max&quot;),
-    FEATURE_ENTRY(VIRTIO_BLK_F_GEOMETRY, \
-            &quot;VIRTIO_BLK_F_GEOMETRY: Legacy geometry available&quot;),
-    FEATURE_ENTRY(VIRTIO_BLK_F_RO, \
-            &quot;VIRTIO_BLK_F_RO: Device is read-only&quot;),
-    FEATURE_ENTRY(VIRTIO_BLK_F_BLK_SIZE, \
-            &quot;VIRTIO_BLK_F_BLK_SIZE: Block size of disk available&quot;),
-    FEATURE_ENTRY(VIRTIO_BLK_F_TOPOLOGY, \
-            &quot;VIRTIO_BLK_F_TOPOLOGY: Topology information available&quot;),
-    FEATURE_ENTRY(VIRTIO_BLK_F_MQ, \
-            &quot;VIRTIO_BLK_F_MQ: Multiqueue supported&quot;),
-    FEATURE_ENTRY(VIRTIO_BLK_F_DISCARD, \
-            &quot;VIRTIO_BLK_F_DISCARD: Discard command supported&quot;),
-    FEATURE_ENTRY(VIRTIO_BLK_F_WRITE_ZEROES, \
-            &quot;VIRTIO_BLK_F_WRITE_ZEROES: Write zeroes command supported&quot;),
-#ifndef VIRTIO_BLK_NO_LEGACY
-    FEATURE_ENTRY(VIRTIO_BLK_F_BARRIER, \
-            &quot;VIRTIO_BLK_F_BARRIER: Request barriers supported&quot;),
-    FEATURE_ENTRY(VIRTIO_BLK_F_SCSI, \
-            &quot;VIRTIO_BLK_F_SCSI: SCSI packet commands supported&quot;),
-    FEATURE_ENTRY(VIRTIO_BLK_F_FLUSH, \
-            &quot;VIRTIO_BLK_F_FLUSH: Flush command supported&quot;),
-    FEATURE_ENTRY(VIRTIO_BLK_F_CONFIG_WCE, \
-            &quot;VIRTIO_BLK_F_CONFIG_WCE: Cache writeback and writethrough modes &quot;
-            &quot;supported&quot;),
-#endif /* !VIRTIO_BLK_NO_LEGACY */
-    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
-            &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
-            &quot;VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features &quot;
-            &quot;negotiation supported&quot;),
-    { -1, &quot;&quot; }
-};
-#endif
-
-/* virtio-serial features mapping */
-#ifdef CONFIG_VIRTIO_SERIAL
-static const qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
-    FEATURE_ENTRY(VIRTIO_CONSOLE_F_SIZE, \
-            &quot;VIRTIO_CONSOLE_F_SIZE: Host providing console size&quot;),
-    FEATURE_ENTRY(VIRTIO_CONSOLE_F_MULTIPORT, \
-            &quot;VIRTIO_CONSOLE_F_MULTIPORT: Multiple ports for device supported&quot;),
-    FEATURE_ENTRY(VIRTIO_CONSOLE_F_EMERG_WRITE, \
-            &quot;VIRTIO_CONSOLE_F_EMERG_WRITE: Emergency write supported&quot;),
-    { -1, &quot;&quot; }
-};
-#endif
-
-/* virtio-gpu features mapping */
-#ifdef CONFIG_VIRTIO_GPU
-static const qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
-    FEATURE_ENTRY(VIRTIO_GPU_F_VIRGL, \
-            &quot;VIRTIO_GPU_F_VIRGL: Virgl 3D mode supported&quot;),
-    FEATURE_ENTRY(VIRTIO_GPU_F_EDID, \
-            &quot;VIRTIO_GPU_F_EDID: EDID metadata supported&quot;),
-    FEATURE_ENTRY(VIRTIO_GPU_F_RESOURCE_UUID, \
-            &quot;VIRTIO_GPU_F_RESOURCE_UUID: Resource UUID assigning supported&quot;),
-    FEATURE_ENTRY(VIRTIO_GPU_F_RESOURCE_BLOB, \
-            &quot;VIRTIO_GPU_F_RESOURCE_BLOB: Size-based blob resources supported&quot;),
-    FEATURE_ENTRY(VIRTIO_GPU_F_CONTEXT_INIT, \
-            &quot;VIRTIO_GPU_F_CONTEXT_INIT: Context types and synchronization &quot;
-            &quot;timelines supported&quot;),
-    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
-            &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
-            &quot;VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features &quot;
-            &quot;negotiation supported&quot;),
-    { -1, &quot;&quot; }
-};
-#endif
-
-/* virtio-input features mapping */
-#ifdef CONFIG_VIRTIO_INPUT
-static const qmp_virtio_feature_map_t virtio_input_feature_map[] = {
-    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
-            &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
-            &quot;VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features &quot;
-            &quot;negotiation supported&quot;),
-    { -1, &quot;&quot; }
-};
-#endif
-
-/* virtio-net features mapping */
-#ifdef CONFIG_VIRTIO_NET
-static const qmp_virtio_feature_map_t virtio_net_feature_map[] = {
-    FEATURE_ENTRY(VIRTIO_NET_F_CSUM, \
-            &quot;VIRTIO_NET_F_CSUM: Device handling packets with partial checksum &quot;
-            &quot;supported&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_CSUM, \
-            &quot;VIRTIO_NET_F_GUEST_CSUM: Driver handling packets with partial &quot;
-            &quot;checksum supported&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_GUEST_OFFLOADS, \
-            &quot;VIRTIO_NET_F_CTRL_GUEST_OFFLOADS: Control channel offloading &quot;
-            &quot;reconfig. supported&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_MTU, \
-            &quot;VIRTIO_NET_F_MTU: Device max MTU reporting supported&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_MAC, \
-            &quot;VIRTIO_NET_F_MAC: Device has given MAC address&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_TSO4, \
-            &quot;VIRTIO_NET_F_GUEST_TSO4: Driver can receive TSOv4&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_TSO6, \
-            &quot;VIRTIO_NET_F_GUEST_TSO6: Driver can receive TSOv6&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_ECN, \
-            &quot;VIRTIO_NET_F_GUEST_ECN: Driver can receive TSO with ECN&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_UFO, \
-            &quot;VIRTIO_NET_F_GUEST_UFO: Driver can receive UFO&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_HOST_TSO4, \
-            &quot;VIRTIO_NET_F_HOST_TSO4: Device can receive TSOv4&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_HOST_TSO6, \
-            &quot;VIRTIO_NET_F_HOST_TSO6: Device can receive TSOv6&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_HOST_ECN, \
-            &quot;VIRTIO_NET_F_HOST_ECN: Device can receive TSO with ECN&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_HOST_UFO, \
-            &quot;VIRTIO_NET_F_HOST_UFO: Device can receive UFO&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_MRG_RXBUF, \
-            &quot;VIRTIO_NET_F_MRG_RXBUF: Driver can merge receive buffers&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_STATUS, \
-            &quot;VIRTIO_NET_F_STATUS: Configuration status field available&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_VQ, \
-            &quot;VIRTIO_NET_F_CTRL_VQ: Control channel available&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_RX, \
-            &quot;VIRTIO_NET_F_CTRL_RX: Control channel RX mode supported&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_VLAN, \
-            &quot;VIRTIO_NET_F_CTRL_VLAN: Control channel VLAN filtering supported&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_RX_EXTRA, \
-            &quot;VIRTIO_NET_F_CTRL_RX_EXTRA: Extra RX mode control supported&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_ANNOUNCE, \
-            &quot;VIRTIO_NET_F_GUEST_ANNOUNCE: Driver sending gratuitous packets &quot;
-            &quot;supported&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_MQ, \
-            &quot;VIRTIO_NET_F_MQ: Multiqueue with automatic receive steering &quot;
-            &quot;supported&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_MAC_ADDR, \
-            &quot;VIRTIO_NET_F_CTRL_MAC_ADDR: MAC address set through control &quot;
-            &quot;channel&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_HASH_REPORT, \
-            &quot;VIRTIO_NET_F_HASH_REPORT: Hash reporting supported&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_RSS, \
-            &quot;VIRTIO_NET_F_RSS: RSS RX steering supported&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_RSC_EXT, \
-            &quot;VIRTIO_NET_F_RSC_EXT: Extended coalescing info supported&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_STANDBY, \
-            &quot;VIRTIO_NET_F_STANDBY: Device acting as standby for primary &quot;
-            &quot;device with same MAC addr. supported&quot;),
-    FEATURE_ENTRY(VIRTIO_NET_F_SPEED_DUPLEX, \
-            &quot;VIRTIO_NET_F_SPEED_DUPLEX: Device set linkspeed and duplex&quot;),
-#ifndef VIRTIO_NET_NO_LEGACY
-    FEATURE_ENTRY(VIRTIO_NET_F_GSO, \
-            &quot;VIRTIO_NET_F_GSO: Handling GSO-type packets supported&quot;),
-#endif /* !VIRTIO_NET_NO_LEGACY */
-    FEATURE_ENTRY(VHOST_NET_F_VIRTIO_NET_HDR, \
-            &quot;VHOST_NET_F_VIRTIO_NET_HDR: Virtio-net headers for RX and TX &quot;
-            &quot;packets supported&quot;),
-    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
-            &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
-            &quot;VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features &quot;
-            &quot;negotiation supported&quot;),
-    { -1, &quot;&quot; }
-};
-#endif
-
-/* virtio-scsi features mapping */
-#ifdef CONFIG_VIRTIO_SCSI
-static const qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
-    FEATURE_ENTRY(VIRTIO_SCSI_F_INOUT, \
-            &quot;VIRTIO_SCSI_F_INOUT: Requests including read and writable data &quot;
-            &quot;buffers suppoted&quot;),
-    FEATURE_ENTRY(VIRTIO_SCSI_F_HOTPLUG, \
-            &quot;VIRTIO_SCSI_F_HOTPLUG: Reporting and handling hot-plug events &quot;
-            &quot;supported&quot;),
-    FEATURE_ENTRY(VIRTIO_SCSI_F_CHANGE, \
-            &quot;VIRTIO_SCSI_F_CHANGE: Reporting and handling LUN changes &quot;
-            &quot;supported&quot;),
-    FEATURE_ENTRY(VIRTIO_SCSI_F_T10_PI, \
-            &quot;VIRTIO_SCSI_F_T10_PI: T10 info included in request header&quot;),
-    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
-            &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
-            &quot;VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features &quot;
-            &quot;negotiation supported&quot;),
-    { -1, &quot;&quot; }
-};
-#endif
-
-/* virtio/vhost-user-fs features mapping */
-#ifdef CONFIG_VHOST_USER_FS
-static const qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
-    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
-            &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
-            &quot;VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features &quot;
-            &quot;negotiation supported&quot;),
-    { -1, &quot;&quot; }
-};
-#endif
-
-/* virtio/vhost-user-i2c features mapping */
-#ifdef CONFIG_VIRTIO_I2C_ADAPTER
-static const qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
-    FEATURE_ENTRY(VIRTIO_I2C_F_ZERO_LENGTH_REQUEST, \
-            &quot;VIRTIO_I2C_F_ZERO_LEGNTH_REQUEST: Zero length requests supported&quot;),
-    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
-            &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
-            &quot;VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features &quot;
-            &quot;negotiation supported&quot;),
-    { -1, &quot;&quot; }
-};
-#endif
-
-/* virtio/vhost-vsock features mapping */
-#ifdef CONFIG_VHOST_VSOCK
-static const qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
-    FEATURE_ENTRY(VIRTIO_VSOCK_F_SEQPACKET, \
-            &quot;VIRTIO_VSOCK_F_SEQPACKET: SOCK_SEQPACKET supported&quot;),
-    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
-            &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
-            &quot;VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features &quot;
-            &quot;negotiation supported&quot;),
-    { -1, &quot;&quot; }
-};
-#endif
-
-/* virtio-balloon features mapping */
-#ifdef CONFIG_VIRTIO_BALLOON
-static const qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
-    FEATURE_ENTRY(VIRTIO_BALLOON_F_MUST_TELL_HOST, \
-            &quot;VIRTIO_BALLOON_F_MUST_TELL_HOST: Tell host before reclaiming &quot;
-            &quot;pages&quot;),
-    FEATURE_ENTRY(VIRTIO_BALLOON_F_STATS_VQ, \
-            &quot;VIRTIO_BALLOON_F_STATS_VQ: Guest memory stats VQ available&quot;),
-    FEATURE_ENTRY(VIRTIO_BALLOON_F_DEFLATE_ON_OOM, \
-            &quot;VIRTIO_BALLOON_F_DEFLATE_ON_OOM: Deflate balloon when guest OOM&quot;),
-    FEATURE_ENTRY(VIRTIO_BALLOON_F_FREE_PAGE_HINT, \
-            &quot;VIRTIO_BALLOON_F_FREE_PAGE_HINT: VQ reporting free pages enabled&quot;),
-    FEATURE_ENTRY(VIRTIO_BALLOON_F_PAGE_POISON, \
-            &quot;VIRTIO_BALLOON_F_PAGE_POISON: Guest page poisoning enabled&quot;),
-    FEATURE_ENTRY(VIRTIO_BALLOON_F_REPORTING, \
-            &quot;VIRTIO_BALLOON_F_REPORTING: Page reporting VQ enabled&quot;),
-    { -1, &quot;&quot; }
-};
-#endif
-
-/* virtio-crypto features mapping */
-#ifdef CONFIG_VIRTIO_CRYPTO
-static const qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
-    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
-            &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
-    { -1, &quot;&quot; }
-};
-#endif
-
-/* virtio-iommu features mapping */
-#ifdef CONFIG_VIRTIO_IOMMU
-static const qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
-    FEATURE_ENTRY(VIRTIO_IOMMU_F_INPUT_RANGE, \
-            &quot;VIRTIO_IOMMU_F_INPUT_RANGE: Range of available virtual addrs. &quot;
-            &quot;available&quot;),
-    FEATURE_ENTRY(VIRTIO_IOMMU_F_DOMAIN_RANGE, \
-            &quot;VIRTIO_IOMMU_F_DOMAIN_RANGE: Number of supported domains &quot;
-            &quot;available&quot;),
-    FEATURE_ENTRY(VIRTIO_IOMMU_F_MAP_UNMAP, \
-            &quot;VIRTIO_IOMMU_F_MAP_UNMAP: Map and unmap requests available&quot;),
-    FEATURE_ENTRY(VIRTIO_IOMMU_F_BYPASS, \
-            &quot;VIRTIO_IOMMU_F_BYPASS: Endpoints not attached to domains are in &quot;
-            &quot;bypass mode&quot;),
-    FEATURE_ENTRY(VIRTIO_IOMMU_F_PROBE, \
-            &quot;VIRTIO_IOMMU_F_PROBE: Probe requests available&quot;),
-    FEATURE_ENTRY(VIRTIO_IOMMU_F_MMIO, \
-            &quot;VIRTIO_IOMMU_F_MMIO: VIRTIO_IOMMU_MAP_F_MMIO flag available&quot;),
-    FEATURE_ENTRY(VIRTIO_IOMMU_F_BYPASS_CONFIG, \
-            &quot;VIRTIO_IOMMU_F_BYPASS_CONFIG: Bypass field of IOMMU config &quot;
-            &quot;available&quot;),
-    { -1, &quot;&quot; }
-};
-#endif
-
-/* virtio-mem features mapping */
-#ifdef CONFIG_VIRTIO_MEM
-static const qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
-#ifndef CONFIG_ACPI
-    FEATURE_ENTRY(VIRTIO_MEM_F_ACPI_PXM, \
-            &quot;VIRTIO_MEM_F_ACPI_PXM: node_id is an ACPI PXM and is valid&quot;),
-#endif /* !CONFIG_ACPI */
-    FEATURE_ENTRY(VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, \
-            &quot;VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE: Unplugged memory cannot be &quot;
-            &quot;accessed&quot;),
-    { -1, &quot;&quot; }
-};
-#endif
-
-/* virtio-rng features mapping */
-#ifdef CONFIG_VIRTIO_RNG
-static const qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
-    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
-            &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
-    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
-            &quot;VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features &quot;
-            &quot;negotiation supported&quot;),
-    { -1, &quot;&quot; }
-};
-#endif
-
 /*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
@@ -4296,203 +3862,6 @@ static VirtIODevice *virtio_device_find(const char *path)
     return NULL;
 }
 
-#define CONVERT_FEATURES(type, map, is_status, bitmap)   \
-    ({                                                   \
-        type *list = NULL;                               \
-        type *node;                                      \
-        for (i = 0; map[i].virtio_bit != -1; i++) {      \
-            if (is_status) {                             \
-                bit = map[i].virtio_bit;                 \
-            }                                            \
-            else {                                       \
-                bit = 1ULL &lt;&lt; map[i].virtio_bit;         \
-            }                                            \
-            if ((bitmap &amp; bit) == 0) {                   \
-                continue;                                \
-            }                                            \
-            node = g_new0(type, 1);                      \
-            node-&gt;value = g_strdup(map[i].feature_desc); \
-            node-&gt;next = list;                           \
-            list = node;                                 \
-            bitmap ^= bit;                               \
-        }                                                \
-        list;                                            \
-    })
-
-static VirtioDeviceStatus *qmp_decode_status(uint8_t bitmap)
-{
-    VirtioDeviceStatus *status;
-    uint8_t bit;
-    int i;
-
-    status = g_new0(VirtioDeviceStatus, 1);
-    status-&gt;statuses = CONVERT_FEATURES(strList, virtio_config_status_map,
-                                        1, bitmap);
-    status-&gt;has_unknown_statuses = bitmap != 0;
-    if (status-&gt;has_unknown_statuses) {
-        status-&gt;unknown_statuses = bitmap;
-    }
-
-    return status;
-}
-
-static VhostDeviceProtocols *qmp_decode_protocols(uint64_t bitmap)
-{
-    VhostDeviceProtocols *vhu_protocols;
-    uint64_t bit;
-    int i;
-
-    vhu_protocols = g_new0(VhostDeviceProtocols, 1);
-    vhu_protocols-&gt;protocols =
-                    CONVERT_FEATURES(strList,
-                                     vhost_user_protocol_map, 0, bitmap);
-    vhu_protocols-&gt;has_unknown_protocols = bitmap != 0;
-    if (vhu_protocols-&gt;has_unknown_protocols) {
-        vhu_protocols-&gt;unknown_protocols = bitmap;
-    }
-
-    return vhu_protocols;
-}
-
-static VirtioDeviceFeatures *qmp_decode_features(uint16_t device_id,
-                                                 uint64_t bitmap)
-{
-    VirtioDeviceFeatures *features;
-    uint64_t bit;
-    int i;
-
-    features = g_new0(VirtioDeviceFeatures, 1);
-    features-&gt;has_dev_features = true;
-
-    /* transport features */
-    features-&gt;transports = CONVERT_FEATURES(strList, virtio_transport_map, 0,
-                                            bitmap);
-
-    /* device features */
-    switch (device_id) {
-#ifdef CONFIG_VIRTIO_SERIAL
-    case VIRTIO_ID_CONSOLE:
-        features-&gt;dev_features =
-            CONVERT_FEATURES(strList, virtio_serial_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VIRTIO_BLK
-    case VIRTIO_ID_BLOCK:
-        features-&gt;dev_features =
-            CONVERT_FEATURES(strList, virtio_blk_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VIRTIO_GPU
-    case VIRTIO_ID_GPU:
-        features-&gt;dev_features =
-            CONVERT_FEATURES(strList, virtio_gpu_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VIRTIO_NET
-    case VIRTIO_ID_NET:
-        features-&gt;dev_features =
-            CONVERT_FEATURES(strList, virtio_net_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VIRTIO_SCSI
-    case VIRTIO_ID_SCSI:
-        features-&gt;dev_features =
-            CONVERT_FEATURES(strList, virtio_scsi_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VIRTIO_BALLOON
-    case VIRTIO_ID_BALLOON:
-        features-&gt;dev_features =
-            CONVERT_FEATURES(strList, virtio_balloon_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VIRTIO_IOMMU
-    case VIRTIO_ID_IOMMU:
-        features-&gt;dev_features =
-            CONVERT_FEATURES(strList, virtio_iommu_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VIRTIO_INPUT
-    case VIRTIO_ID_INPUT:
-        features-&gt;dev_features =
-            CONVERT_FEATURES(strList, virtio_input_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VHOST_USER_FS
-    case VIRTIO_ID_FS:
-        features-&gt;dev_features =
-            CONVERT_FEATURES(strList, virtio_fs_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VHOST_VSOCK
-    case VIRTIO_ID_VSOCK:
-        features-&gt;dev_features =
-            CONVERT_FEATURES(strList, virtio_vsock_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VIRTIO_CRYPTO
-    case VIRTIO_ID_CRYPTO:
-        features-&gt;dev_features =
-            CONVERT_FEATURES(strList, virtio_crypto_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VIRTIO_MEM
-    case VIRTIO_ID_MEM:
-        features-&gt;dev_features =
-            CONVERT_FEATURES(strList, virtio_mem_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VIRTIO_I2C_ADAPTER
-    case VIRTIO_ID_I2C_ADAPTER:
-        features-&gt;dev_features =
-            CONVERT_FEATURES(strList, virtio_i2c_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VIRTIO_RNG
-    case VIRTIO_ID_RNG:
-        features-&gt;dev_features =
-            CONVERT_FEATURES(strList, virtio_rng_feature_map, 0, bitmap);
-        break;
-#endif
-    /* No features */
-    case VIRTIO_ID_9P:
-    case VIRTIO_ID_PMEM:
-    case VIRTIO_ID_IOMEM:
-    case VIRTIO_ID_RPMSG:
-    case VIRTIO_ID_CLOCK:
-    case VIRTIO_ID_MAC80211_WLAN:
-    case VIRTIO_ID_MAC80211_HWSIM:
-    case VIRTIO_ID_RPROC_SERIAL:
-    case VIRTIO_ID_MEMORY_BALLOON:
-    case VIRTIO_ID_CAIF:
-    case VIRTIO_ID_SIGNAL_DIST:
-    case VIRTIO_ID_PSTORE:
-    case VIRTIO_ID_SOUND:
-    case VIRTIO_ID_BT:
-    case VIRTIO_ID_RPMB:
-    case VIRTIO_ID_VIDEO_ENCODER:
-    case VIRTIO_ID_VIDEO_DECODER:
-    case VIRTIO_ID_SCMI:
-    case VIRTIO_ID_NITRO_SEC_MOD:
-    case VIRTIO_ID_WATCHDOG:
-    case VIRTIO_ID_CAN:
-    case VIRTIO_ID_DMABUF:
-    case VIRTIO_ID_PARAM_SERV:
-    case VIRTIO_ID_AUDIO_POLICY:
-    case VIRTIO_ID_GPIO:
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    features-&gt;has_unknown_dev_features = bitmap != 0;
-    if (features-&gt;has_unknown_dev_features) {
-        features-&gt;unknown_dev_features = bitmap;
-    }
-
-    return features;
-}
-
 VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
 {
     VirtIODevice *vdev;
</pre>
    </blockquote>
  </body>
</html>

--------------d9NLnOXxQiMLiD5hcnPaVJkp--

