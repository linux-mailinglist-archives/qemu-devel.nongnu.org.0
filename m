Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4D8650CA0
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 14:26:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7G9X-0001fn-Sf; Mon, 19 Dec 2022 08:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1p7G9R-0001fB-Vx
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:25:54 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1p7G9O-0004oQ-LR
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:25:53 -0500
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJDEke8020965; Mon, 19 Dec 2022 13:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=6p8m+NxCIckIzbZqTyjyCbGNPoLcrn/Td1XlpnFshrw=;
 b=oMraeBZzNvxuStJkXFO0JoGydu/Kk+NQ/ylcBZ373jRZSn4JpQLZ2qUuV3Z+YRPMDRPj
 r9LhtFFYA2K/yuKdfJDe0DwlNl0h0Tgi7DLz2WGVavtEjZoCiediFF2jac0jqNO/oy8X
 3SeOyqAdvYs7rwCzFqw4orjSY6jkcO1FOZ433v00bznmxfyp9kwhQ6iKuYxDCuJlLngk
 fUO+wcRLjliflIOQKtyRSOr2tvp+RYZLGH1NqHyQTJVS66PDVo0G38INK0HkoKzZrs06
 Bo6LF1/ER/hCI7YMu67zfbyGKF3eAVftb1TrS/uZJa9yWJPeANQYmwufWJIjLzW0Q77X hw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3mh6tnaukj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Dec 2022 13:25:39 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2BJBruD2022355; Mon, 19 Dec 2022 13:25:38 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3mh473g5bq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Dec 2022 13:25:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B44mr2xKoyCeqOcyhyljRQRjh6UtqlaRfq6HyWy4iGRmUXQ+9tilDzqdDIbz8hhfegnS2sE8ZmtYzI+RQJiU6N+WL5QI7NApsH2gp3q42wX9UtfqqilA92dUOIKFzFsIisVm/uSYffwmNMvUZia42oTL2og9OyF/ZnIio0h/Njm2GtLPteA4IfM6ZdHkhaygJJEjQyMeq3GgZsGEWJhfNj+hTW+xVaPQu7l61QgspZhXXnhFVbboJeefitM3+RAKBd25uTn83454VpfVfiNxCtuZffagZr+airzQA7ogqD3sbu/cjEyDwk/YoGRKOdCcq0gpOpHJBlrRldHjZf0Ihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6p8m+NxCIckIzbZqTyjyCbGNPoLcrn/Td1XlpnFshrw=;
 b=PaBBsKEj/j2wlNB9f7+/EwaobFIun/Kk45TMYl9HSXUrEu9S4SHs/U1BK18u/w1XeGRgmbu3yEDMTkGjto+YMjnghvCi5TeDPAH8p3HA61Tp+1o6Mk+i+LwIzL3PApJ/t6mJkmOcg+avlDdpN0opAnEnAb3D1QHbeVd9jejeqgOYzJ+N32FnPVJBkqhl7uBIZ/kIy2PTFOqDqi6Ynn3lVZC6qBIMdjsRaDOcFOiX8jxCVbHU18dl9qikUyDeyKu1QHw6uhnLfXxPqiBQqMpUI67GCrPkvadZh9cH93ZW72QnyOZLH//QwVnyFWyeGlVjn9RV/FOjLAknj2NOvrzKZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6p8m+NxCIckIzbZqTyjyCbGNPoLcrn/Td1XlpnFshrw=;
 b=VQCOe01kKkSW9mhnjZ5B7F+Eov5a8/OyCfP+IlQ39tWEpF1HPMlWIbXrx3DdAHwqKVmEISlqSJvb0dtOV30wDWw9a7RicODZOVJGOQlgTW70I+6NV69QiVYQ5vjXbGV0PDbsADQ4MPZb0vpApaSlC6nBGV7Xz6e6UBuMTAc06TY=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by SN4PR10MB5606.namprd10.prod.outlook.com (2603:10b6:806:209::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 13:25:36 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c449:15e4:b116:e06b]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c449:15e4:b116:e06b%8]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 13:25:36 +0000
Content-Type: multipart/alternative;
 boundary="------------wWF36XZHtVlS06GnqMg0bj7I"
Message-ID: <2e153afa-75a6-9b4b-e3ed-f1995694a7fa@oracle.com>
Date: Mon, 19 Dec 2022 08:25:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH-for-8.0 v2 4/6] hw/virtio: Constify
 qmp_virtio_feature_map_t[]
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>
References: <20221213111707.34921-1-philmd@linaro.org>
 <20221213111707.34921-5-philmd@linaro.org>
From: Jonah Palmer <jonah.palmer@oracle.com>
In-Reply-To: <20221213111707.34921-5-philmd@linaro.org>
X-ClientProxiedBy: BLAPR03CA0151.namprd03.prod.outlook.com
 (2603:10b6:208:32f::15) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4664:EE_|SN4PR10MB5606:EE_
X-MS-Office365-Filtering-Correlation-Id: d9993d47-1930-488a-ad0f-08dae1c4833f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LQIgOakAUH85apawSf8STnuPKUDCtsKpryuFR0mFL9PCTeSoEF28OJvfb8/6zLLbOP8g7JOpHcjd6Fmq2uC4M6trFrRQwEAO21Dr7ZBkZBoTKxW9OT1fGu77T3Jn454Elpx22SZQKJeVGf1LifZqSVvAMqINUdkqu00WMVyuwxUDpgAx/1FnC3U9MmwNN5HfUAkdpSjoO2nIY/MW4kKA+YkHGBAOENolfSFdJjN8+p5axUPa2aG9nFO3JD5Am4TBvg+38DK+5TYcFgYvmLUqfyRDIZGwdL5m3mw59PtxoX9xrTt1IHol+1XfTxfWtkQBqAMSkkJBZ93zx0LOF1gnjIIgu3k2JYHFlgJKC70LHg3Ykt62E7E+bmyc8F13q/Llw86nLw4jXXdm0YZnHj+yMrPxbnF1Eu1e0QhcbexaRQS6O4je8+eCG7DgktLd2rff2iejqAhLt2bddqHRb0ZS8oG+7CARVhiOXU0dbK3OLxPFDac0EpQk7F/lsv8XrRhLUNx6qJ3TePodkoOuAmmVeqSrhly5CsnbT5SFtaVYNeRcOpB5CY0TKAzqWnb16gAZiFVe8w3aipCLrJXkDm9yPRQYyftXQl/WB4r7vw+aYNe+KoFt8BfBbxuJIb5XhT7kftxyYNrK6GynLbb29Er6tYtCpAhn4aSmPikom9jQ9wv6hz4kR+0vjSqMFHOwUTWoukoxjd0izA0uhcs7mc98ZgHaqO/X3nPYTvQBjWf/zJo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199015)(66556008)(86362001)(66946007)(31696002)(66476007)(8676002)(4326008)(316002)(5660300002)(36756003)(8936002)(2616005)(41300700001)(186003)(6666004)(33964004)(6512007)(6506007)(83380400001)(53546011)(26005)(110136005)(54906003)(38100700002)(6486002)(478600001)(30864003)(44832011)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajdHeC9hZ1hoSFJzazljNk1ZUnFLVEcvci80QU5oZURyYkJkYklSYjZDcVpv?=
 =?utf-8?B?NFBpaE4wVnMvdStqR0M3b1I4bnBsMmtDZFVWTVlBVU9kOVd0SUNiZVgwVWhl?=
 =?utf-8?B?eFZJZEZJZHoxSkc4dHI5YThYRWM3UEpSQ2tia1NzQzRsa3pTTXFjZlhiNjRG?=
 =?utf-8?B?VnZ3elpNUy9tQUhPSjNWVE83bU1qTFNjUU1JTFJrVG9rMU44UTM3RXNCenpV?=
 =?utf-8?B?dHZBK3RiMi9EcmFoSHVHRDJUWmxOT3p3UzZ6ZFVaYkY1YStCNzF2NldmdGZK?=
 =?utf-8?B?SHg1S050dGJ3akVMT1Fycyt4S0JPbUtocVhEU1l4a01JQkxiM1ZzaWZkTEhw?=
 =?utf-8?B?UlFsaVRWYklxWGN0ZDUwSmdoeloxRFp2UVlpNGNJMEF5UWFCOHBUWk1ZTFQ4?=
 =?utf-8?B?NGNyUzFyMXF6cjROWTBXei9uN252bGI4Szc1cFhuRDJzSGdoSUxWSVk0TkF1?=
 =?utf-8?B?S0NjQjhFbDg2aktMSTJkNVpVN2tDS3dNT3cyMWNMZVpITDRza2ljWE5zZU5a?=
 =?utf-8?B?bjJNVEtCeDBPa2w5RDVIczl5RmpHZnc1UkpjcDlERUlob2JCNUNsb2h2aDdr?=
 =?utf-8?B?NWxQS0oyQ3VMZFJjY3FnaWdUVEs5NXJrR2NCQzZzSDBhRnVuL25xMjEyRkVh?=
 =?utf-8?B?U2ZZT2duS3BlQ3loRDBIUXZZNDlneldzQ1FEUWNESjdRQVdMNGdSU0VuVG1v?=
 =?utf-8?B?UFQ3RUI3Wms1Vkg5S2VqN1BEc291UG9neW1vSm9PTVBUVzk3UmdScURJYzZ0?=
 =?utf-8?B?ZXYxVmVWZFdXa01oWWJIVlVLeklxdENwaXplWGd1TjZreTd0MlYyMWY3elNQ?=
 =?utf-8?B?NGplbHFiekNLaGFCUCtTWUNmb21kZ1g5Uk4wQzdtS0JDSE9LaExNTGM1MWcz?=
 =?utf-8?B?TDMvNldUVHAzd1NVZXhwQmVMQkhjZkwzZ2NYZFNvSExMYTBHY2dZMkFDbzNh?=
 =?utf-8?B?Qmp1N2MwQXI1eG1WblZYYjVscTFXTGNwanp3WUJlY3hYd3dFTHM0YnJXNVh0?=
 =?utf-8?B?MDVQNnNlSnY3U3ZCNDZuZUdrNVRvR1RXeXdRMUtHVmhEeGp3MWg4Nys2enpC?=
 =?utf-8?B?cUcvQ29YOSsrTDRNYmZLUHRJMXgxRjhFMzR2VjNxa1lqQ0FhR2paMW9VV29Y?=
 =?utf-8?B?c2VkY1FmWVdzZHJXOHpqUnozamgrQ1ZmcTRueng5bEo4VGVqVCtNeWNXaCtv?=
 =?utf-8?B?YWJJV0pNQkZ2Nml3cytIczgxZFhsUTJSTktFRnArbGFudnVRRStkM3l4SDQ0?=
 =?utf-8?B?THNVUitpUGJXdzZON1p1V1oxZHR6SmduVDl2V25RRy8reHBCcEtEbWUrU0xD?=
 =?utf-8?B?MFkyUUVVcmR1OHFrejUxSXE1ZHJyS3pEUzhvWTBsYnNvNTJRcWlWNklBYzY2?=
 =?utf-8?B?aGNjMFhaYmZ2L1UwQ21QR3pUcDVxaWMyT3lKMm9Fak9LbUNmUFVaejlhOGg2?=
 =?utf-8?B?SWJiaS9ITGNnenRHNUlMcGZDb1dIdVNOaGU1YmdtNk1uZWh3WXBmM0l0ekJX?=
 =?utf-8?B?QjFmaGRhMU1hTWw4dHZ4dzY0YjRvSkd1ZHg3cDJ0cTVtNmVwaHdWS2cveXFH?=
 =?utf-8?B?c3h0aTBMYU5zalVaOHpublU2MEt0RE9ZNWhUSUVOblNpaG92NlEvYnkvTVB2?=
 =?utf-8?B?Wkx5NE01ZXdpd1gzOTREbGhrbnQwMXVnVU8yc3MyNXhoUWtqZHRUd3dpdmpX?=
 =?utf-8?B?TFhhS282cFhqL041NTN3QnFGSnpwNTFnU3l0dzFQcU5SeWEzeksxV1lPa1d3?=
 =?utf-8?B?TDhWSEdzVGdUdUt0YlVNT3lwM2wxSi9JWDVvR0c4dXJNeWtQZDlwdjNuTjFO?=
 =?utf-8?B?RHNCTCtwK2t5b25XcU9SbjA5ZU91azJtenBFNHh5Vm95dlMraWcvRVBmcnBk?=
 =?utf-8?B?TjRqV0poUmNPdUs1MTZPejhLTlRGRHoyWlcwSjJsdm5oNmJUbzRCdlVTM1dT?=
 =?utf-8?B?Z05yZWIzZ1QvblNKcFBha1NxTzhlK3lwUXJOamY5L1hjYktpMDkvdlptTTJt?=
 =?utf-8?B?YjUwd0lMM1dqZDY5ckxTL1FFT3NiRWtzZzltTm50dWx1OEs2TFRLWkI1dkQ2?=
 =?utf-8?B?aVNtT0xVZVRrVVgydmp5Q3pWVEN6MTFCcGp6N2w3T3BwWCs3TXhubEVnNXZI?=
 =?utf-8?B?L1VWQ2Z5b2dhNmpvOC9sSFVmQ2FsQVZqRE9tK1RXSTBwQkR1WGVUOTA5WkJP?=
 =?utf-8?B?Umc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9993d47-1930-488a-ad0f-08dae1c4833f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 13:25:35.8955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIVFVOEHbu/dvoKQJh84a/GoHZo4CwscRR3J4tnx8pQpJq8koIahiUiZVOBRwoF4UBZVtfj0fzYdhCip2hmA9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5606
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 spamscore=0 phishscore=0 adultscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190119
X-Proofpoint-ORIG-GUID: XZ2gAMjXTt3jRAaLK4y4JyXFVg36Nhhs
X-Proofpoint-GUID: XZ2gAMjXTt3jRAaLK4y4JyXFVg36Nhhs
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
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

--------------wWF36XZHtVlS06GnqMg0bj7I
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/13/22 06:17, Philippe Mathieu-Daudé wrote:
> These arrays are only accessed read-only, move them to .rodata.
>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/virtio/virtio.c | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index b35480be8f..f2298bb437 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -80,7 +80,7 @@ enum VhostUserProtocolFeature {
>   };
>   
>   /* Virtio transport features mapping */
> -static qmp_virtio_feature_map_t virtio_transport_map[] = {
> +static const qmp_virtio_feature_map_t virtio_transport_map[] = {
>       /* Virtio device transport features */
>   #ifndef VIRTIO_CONFIG_NO_LEGACY
>       FEATURE_ENTRY(VIRTIO_F_NOTIFY_ON_EMPTY, \
> @@ -111,7 +111,7 @@ static qmp_virtio_feature_map_t virtio_transport_map[] = {
>   };
>   
>   /* Vhost-user protocol features mapping */
> -static qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
> +static const qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
>       FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_MQ, \
>               "VHOST_USER_PROTOCOL_F_MQ: Multiqueue protocol supported"),
>       FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_LOG_SHMFD, \
> @@ -161,7 +161,7 @@ static qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
>   };
>   
>   /* virtio device configuration statuses */
> -static qmp_virtio_feature_map_t virtio_config_status_map[] = {
> +static const qmp_virtio_feature_map_t virtio_config_status_map[] = {
>       FEATURE_ENTRY(VIRTIO_CONFIG_S_DRIVER_OK, \
>               "VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready"),
>       FEATURE_ENTRY(VIRTIO_CONFIG_S_FEATURES_OK, \
> @@ -180,7 +180,7 @@ static qmp_virtio_feature_map_t virtio_config_status_map[] = {
>   
>   /* virtio-blk features mapping */
>   #ifdef CONFIG_VIRTIO_BLK
> -static qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
> +static const qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
>       FEATURE_ENTRY(VIRTIO_BLK_F_SIZE_MAX, \
>               "VIRTIO_BLK_F_SIZE_MAX: Max segment size is size_max"),
>       FEATURE_ENTRY(VIRTIO_BLK_F_SEG_MAX, \
> @@ -221,7 +221,7 @@ static qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
>   
>   /* virtio-serial features mapping */
>   #ifdef CONFIG_VIRTIO_SERIAL
> -static qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
> +static const qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
>       FEATURE_ENTRY(VIRTIO_CONSOLE_F_SIZE, \
>               "VIRTIO_CONSOLE_F_SIZE: Host providing console size"),
>       FEATURE_ENTRY(VIRTIO_CONSOLE_F_MULTIPORT, \
> @@ -234,7 +234,7 @@ static qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
>   
>   /* virtio-gpu features mapping */
>   #ifdef CONFIG_VIRTIO_GPU
> -static qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
> +static const qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
>       FEATURE_ENTRY(VIRTIO_GPU_F_VIRGL, \
>               "VIRTIO_GPU_F_VIRGL: Virgl 3D mode supported"),
>       FEATURE_ENTRY(VIRTIO_GPU_F_EDID, \
> @@ -257,7 +257,7 @@ static qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
>   
>   /* virtio-input features mapping */
>   #ifdef CONFIG_VIRTIO_INPUT
> -static qmp_virtio_feature_map_t virtio_input_feature_map[] = {
> +static const qmp_virtio_feature_map_t virtio_input_feature_map[] = {
>       FEATURE_ENTRY(VHOST_F_LOG_ALL, \
>               "VHOST_F_LOG_ALL: Logging write descriptors supported"),
>       FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> @@ -269,7 +269,7 @@ static qmp_virtio_feature_map_t virtio_input_feature_map[] = {
>   
>   /* virtio-net features mapping */
>   #ifdef CONFIG_VIRTIO_NET
> -static qmp_virtio_feature_map_t virtio_net_feature_map[] = {
> +static const qmp_virtio_feature_map_t virtio_net_feature_map[] = {
>       FEATURE_ENTRY(VIRTIO_NET_F_CSUM, \
>               "VIRTIO_NET_F_CSUM: Device handling packets with partial checksum "
>               "supported"),
> @@ -349,7 +349,7 @@ static qmp_virtio_feature_map_t virtio_net_feature_map[] = {
>   
>   /* virtio-scsi features mapping */
>   #ifdef CONFIG_VIRTIO_SCSI
> -static qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
> +static const qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
>       FEATURE_ENTRY(VIRTIO_SCSI_F_INOUT, \
>               "VIRTIO_SCSI_F_INOUT: Requests including read and writable data "
>               "buffers suppoted"),
> @@ -372,7 +372,7 @@ static qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
>   
>   /* virtio/vhost-user-fs features mapping */
>   #ifdef CONFIG_VHOST_USER_FS
> -static qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
> +static const qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
>       FEATURE_ENTRY(VHOST_F_LOG_ALL, \
>               "VHOST_F_LOG_ALL: Logging write descriptors supported"),
>       FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> @@ -384,7 +384,7 @@ static qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
>   
>   /* virtio/vhost-user-i2c features mapping */
>   #ifdef CONFIG_VIRTIO_I2C_ADAPTER
> -static qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
> +static const qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
>       FEATURE_ENTRY(VIRTIO_I2C_F_ZERO_LENGTH_REQUEST, \
>               "VIRTIO_I2C_F_ZERO_LEGNTH_REQUEST: Zero length requests supported"),
>       FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> @@ -398,7 +398,7 @@ static qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
>   
>   /* virtio/vhost-vsock features mapping */
>   #ifdef CONFIG_VHOST_VSOCK
> -static qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
> +static const qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
>       FEATURE_ENTRY(VIRTIO_VSOCK_F_SEQPACKET, \
>               "VIRTIO_VSOCK_F_SEQPACKET: SOCK_SEQPACKET supported"),
>       FEATURE_ENTRY(VHOST_F_LOG_ALL, \
> @@ -412,7 +412,7 @@ static qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
>   
>   /* virtio-balloon features mapping */
>   #ifdef CONFIG_VIRTIO_BALLOON
> -static qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
> +static const qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
>       FEATURE_ENTRY(VIRTIO_BALLOON_F_MUST_TELL_HOST, \
>               "VIRTIO_BALLOON_F_MUST_TELL_HOST: Tell host before reclaiming "
>               "pages"),
> @@ -432,7 +432,7 @@ static qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
>   
>   /* virtio-crypto features mapping */
>   #ifdef CONFIG_VIRTIO_CRYPTO
> -static qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
> +static const qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
>       FEATURE_ENTRY(VHOST_F_LOG_ALL, \
>               "VHOST_F_LOG_ALL: Logging write descriptors supported"),
>       { -1, "" }
> @@ -441,7 +441,7 @@ static qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
>   
>   /* virtio-iommu features mapping */
>   #ifdef CONFIG_VIRTIO_IOMMU
> -static qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
> +static const qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
>       FEATURE_ENTRY(VIRTIO_IOMMU_F_INPUT_RANGE, \
>               "VIRTIO_IOMMU_F_INPUT_RANGE: Range of available virtual addrs. "
>               "available"),
> @@ -466,7 +466,7 @@ static qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
>   
>   /* virtio-mem features mapping */
>   #ifdef CONFIG_VIRTIO_MEM
> -static qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
> +static const qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
>   #ifndef CONFIG_ACPI
>       FEATURE_ENTRY(VIRTIO_MEM_F_ACPI_PXM, \
>               "VIRTIO_MEM_F_ACPI_PXM: node_id is an ACPI PXM and is valid"),
> @@ -480,7 +480,7 @@ static qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
>   
>   /* virtio-rng features mapping */
>   #ifdef CONFIG_VIRTIO_RNG
> -static qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
> +static const qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
>       FEATURE_ENTRY(VHOST_F_LOG_ALL, \
>               "VHOST_F_LOG_ALL: Logging write descriptors supported"),
>       FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \

Also a good catch. These maps should not change after being initialized,
since they're just definitions. Adding const here appears to be appropriate.

Reviewed-by: Jonah Palmer<jonah.palmer@oracle.com>

--------------wWF36XZHtVlS06GnqMg0bj7I
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <pre>
</pre>
    <div class="moz-cite-prefix">On 12/13/22 06:17, Philippe
      Mathieu-Daudé wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20221213111707.34921-5-philmd@linaro.org">
      <pre class="moz-quote-pre" wrap="">These arrays are only accessed read-only, move them to .rodata.

Signed-off-by: Philippe Mathieu-Daudé <a class="moz-txt-link-rfc2396E" href="mailto:philmd@linaro.org">&lt;philmd@linaro.org&gt;</a>
---
 hw/virtio/virtio.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index b35480be8f..f2298bb437 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -80,7 +80,7 @@ enum VhostUserProtocolFeature {
 };
 
 /* Virtio transport features mapping */
-static qmp_virtio_feature_map_t virtio_transport_map[] = {
+static const qmp_virtio_feature_map_t virtio_transport_map[] = {
     /* Virtio device transport features */
 #ifndef VIRTIO_CONFIG_NO_LEGACY
     FEATURE_ENTRY(VIRTIO_F_NOTIFY_ON_EMPTY, \
@@ -111,7 +111,7 @@ static qmp_virtio_feature_map_t virtio_transport_map[] = {
 };
 
 /* Vhost-user protocol features mapping */
-static qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
+static const qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
     FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_MQ, \
             &quot;VHOST_USER_PROTOCOL_F_MQ: Multiqueue protocol supported&quot;),
     FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_LOG_SHMFD, \
@@ -161,7 +161,7 @@ static qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
 };
 
 /* virtio device configuration statuses */
-static qmp_virtio_feature_map_t virtio_config_status_map[] = {
+static const qmp_virtio_feature_map_t virtio_config_status_map[] = {
     FEATURE_ENTRY(VIRTIO_CONFIG_S_DRIVER_OK, \
             &quot;VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready&quot;),
     FEATURE_ENTRY(VIRTIO_CONFIG_S_FEATURES_OK, \
@@ -180,7 +180,7 @@ static qmp_virtio_feature_map_t virtio_config_status_map[] = {
 
 /* virtio-blk features mapping */
 #ifdef CONFIG_VIRTIO_BLK
-static qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_BLK_F_SIZE_MAX, \
             &quot;VIRTIO_BLK_F_SIZE_MAX: Max segment size is size_max&quot;),
     FEATURE_ENTRY(VIRTIO_BLK_F_SEG_MAX, \
@@ -221,7 +221,7 @@ static qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
 
 /* virtio-serial features mapping */
 #ifdef CONFIG_VIRTIO_SERIAL
-static qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_CONSOLE_F_SIZE, \
             &quot;VIRTIO_CONSOLE_F_SIZE: Host providing console size&quot;),
     FEATURE_ENTRY(VIRTIO_CONSOLE_F_MULTIPORT, \
@@ -234,7 +234,7 @@ static qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
 
 /* virtio-gpu features mapping */
 #ifdef CONFIG_VIRTIO_GPU
-static qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_GPU_F_VIRGL, \
             &quot;VIRTIO_GPU_F_VIRGL: Virgl 3D mode supported&quot;),
     FEATURE_ENTRY(VIRTIO_GPU_F_EDID, \
@@ -257,7 +257,7 @@ static qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
 
 /* virtio-input features mapping */
 #ifdef CONFIG_VIRTIO_INPUT
-static qmp_virtio_feature_map_t virtio_input_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_input_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
     FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
@@ -269,7 +269,7 @@ static qmp_virtio_feature_map_t virtio_input_feature_map[] = {
 
 /* virtio-net features mapping */
 #ifdef CONFIG_VIRTIO_NET
-static qmp_virtio_feature_map_t virtio_net_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_net_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_NET_F_CSUM, \
             &quot;VIRTIO_NET_F_CSUM: Device handling packets with partial checksum &quot;
             &quot;supported&quot;),
@@ -349,7 +349,7 @@ static qmp_virtio_feature_map_t virtio_net_feature_map[] = {
 
 /* virtio-scsi features mapping */
 #ifdef CONFIG_VIRTIO_SCSI
-static qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_SCSI_F_INOUT, \
             &quot;VIRTIO_SCSI_F_INOUT: Requests including read and writable data &quot;
             &quot;buffers suppoted&quot;),
@@ -372,7 +372,7 @@ static qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
 
 /* virtio/vhost-user-fs features mapping */
 #ifdef CONFIG_VHOST_USER_FS
-static qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
     FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
@@ -384,7 +384,7 @@ static qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
 
 /* virtio/vhost-user-i2c features mapping */
 #ifdef CONFIG_VIRTIO_I2C_ADAPTER
-static qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_I2C_F_ZERO_LENGTH_REQUEST, \
             &quot;VIRTIO_I2C_F_ZERO_LEGNTH_REQUEST: Zero length requests supported&quot;),
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
@@ -398,7 +398,7 @@ static qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
 
 /* virtio/vhost-vsock features mapping */
 #ifdef CONFIG_VHOST_VSOCK
-static qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_VSOCK_F_SEQPACKET, \
             &quot;VIRTIO_VSOCK_F_SEQPACKET: SOCK_SEQPACKET supported&quot;),
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
@@ -412,7 +412,7 @@ static qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
 
 /* virtio-balloon features mapping */
 #ifdef CONFIG_VIRTIO_BALLOON
-static qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_BALLOON_F_MUST_TELL_HOST, \
             &quot;VIRTIO_BALLOON_F_MUST_TELL_HOST: Tell host before reclaiming &quot;
             &quot;pages&quot;),
@@ -432,7 +432,7 @@ static qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
 
 /* virtio-crypto features mapping */
 #ifdef CONFIG_VIRTIO_CRYPTO
-static qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
     { -1, &quot;&quot; }
@@ -441,7 +441,7 @@ static qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
 
 /* virtio-iommu features mapping */
 #ifdef CONFIG_VIRTIO_IOMMU
-static qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_IOMMU_F_INPUT_RANGE, \
             &quot;VIRTIO_IOMMU_F_INPUT_RANGE: Range of available virtual addrs. &quot;
             &quot;available&quot;),
@@ -466,7 +466,7 @@ static qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
 
 /* virtio-mem features mapping */
 #ifdef CONFIG_VIRTIO_MEM
-static qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
 #ifndef CONFIG_ACPI
     FEATURE_ENTRY(VIRTIO_MEM_F_ACPI_PXM, \
             &quot;VIRTIO_MEM_F_ACPI_PXM: node_id is an ACPI PXM and is valid&quot;),
@@ -480,7 +480,7 @@ static qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
 
 /* virtio-rng features mapping */
 #ifdef CONFIG_VIRTIO_RNG
-static qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
+static const qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             &quot;VHOST_F_LOG_ALL: Logging write descriptors supported&quot;),
     FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
</pre>
    </blockquote>
    <pre>Also a good catch. These maps should not change after being initialized,
since they're just definitions. Adding const here appears to be appropriate.

Reviewed-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
</pre>
  </body>
</html>

--------------wWF36XZHtVlS06GnqMg0bj7I--

