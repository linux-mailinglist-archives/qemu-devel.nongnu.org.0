Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B133D6D821B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 17:39:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk5Dp-0005OY-Pp; Wed, 05 Apr 2023 11:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pk5Dm-0005O6-VJ
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 11:38:51 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pk5Dk-0008TQ-M3
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 11:38:50 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 335Cx1NT008288; Wed, 5 Apr 2023 15:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=WzA74zwzZ7O25S604wagfPf05QekOW1dqEcPOz+SOeQ=;
 b=wfg2/AnieB4UHb/D4kTf9wQ1z8wBt1qZ7LDfcfF7fJJ4mbzJBepUDxIrmuzPyDtxii9h
 5vAaYiAEpUUF/nHCwupuLX9iSxRjsDTSuSlpd7X6WwhoKTe3CCVuBdG1QKg37U7V2J62
 MDi+EeD0swTIHSrjvrj60s+gSul+UMTWnYU2/6QFDfbv0CkHkIK+q+8QGSl3Ee604thd
 yZXv/k2MgflS8NucUXiNH7g6Mpiqnp3eGuLsooBW+8ZjmhpmexH4+GHDwyYgzudU9b9F
 RwG7kakw8157N3bU5rtQommDzZg4YzazH5XsYtUex6eqCBp2mnWTpdrHVzT3rayKk4r+ ug== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ppc7u0p3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Apr 2023 15:38:46 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 335FJg1n014089; Wed, 5 Apr 2023 15:38:37 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ppt3hgyh9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Apr 2023 15:38:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n36yDfg2HXGChooKmvUxdq5AjD1UCYDKyQZp3HxHPUELJ7ERBfXMlpKTyNTARBdg3Uc/vx0AxYDvoEAA6IkeKPTNW2uE7D1javM8INC5o6oVztMxD3OywPCoLMLaP+JuKRQa7Fv2jGteG3Xy1yS98WXXDd+1GbJuYLNxG9N6nfI65z1Y+DxoNBfav7ri1FXOR71itFoj7ekDXWfs/jPO1GH5dXUtkxIZ5+kBP3vrSC+7tCY76TgBiTzmk1EciyZHTKvpU9vwMgquNh5xP8VBLeYFHTkPAuBK0T1OWtV7LQ5ZI+G7fS+Ggc1ZVDeTI8svtH8DtaNMaN1L8l/Fig5z1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzA74zwzZ7O25S604wagfPf05QekOW1dqEcPOz+SOeQ=;
 b=kajJc7LOxpq6q/Ul06za8RDw6LRjchsQpH0K0RZYfqTwzeWr4NRloIA3EIbybCZvE/wcObk72tjmFVosMYxAd3/wrRsz7swBOq4xHKGt2jGG19qip7HIVgdcJjZlm321Bg3ljPR6RS85n9T9e1msllvu/oS8kQrctg1G0gtBxHxEYCY2zsjM+WMOLjwOr54UAvppURIS9DvxzhMEQTN7YUxeam3gFaKMhtv+KftmzzVhxNKPsQ/tqfduoj2qHTYzK0dMLu84RjyLJNXEea07BjLQW1AQwDhfds+RZhgoXjgKmIh7ZnPd6uYR0o9vNyaa6Is/CqMqwrFANwGTJVV7+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzA74zwzZ7O25S604wagfPf05QekOW1dqEcPOz+SOeQ=;
 b=iJA6bH5dIQfdjyTjkCHfHMgVAH0I4TiE6Lx2qCCqo+Qr0H2SyZrCmJxWUY6U4HRBrRArjLKiUl92KPTCcTA2YxMsEg4CmZ2lZFuNJO4zBzFF52F80hw3rdUc5P7ZOGitSAq7j0nGGiwfVV2q6QW5ZDK8xZxqUlAIjT+gUmDsE+U=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by SN7PR10MB6618.namprd10.prod.outlook.com (2603:10b6:806:2ad::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 15:38:35 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::7361:8416:8d4c:7733]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::7361:8416:8d4c:7733%9]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 15:38:35 +0000
Message-ID: <4be85e27-0990-7ba9-60a1-45d53d63004e@oracle.com>
Date: Wed, 5 Apr 2023 11:38:30 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] tap: fix net_init_tap() return code
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>
References: <1680624004-154390-1-git-send-email-steven.sistare@oracle.com>
 <9da71dfa-52b7-5b65-3160-6f236440add4@linaro.org>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <9da71dfa-52b7-5b65-3160-6f236440add4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0122.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::7) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|SN7PR10MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c969ae-6e53-4e37-f6b9-08db35ebd15b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6YZHUHWAUgOZxPtOLRIP4PojX22TWeKBlnQ/r8L0HnlRKWu4L9VbnYD6bSslc49km/LYrJrd8nNBbiUJYIak5l0YpI7/851IPcoZdnBJF36lSr+acOsNtfZtAWLs7LbpTeimvKJm/15LshNnjPIJ/j626Y0Vtvl8rQf+eho1MNDwBF6Cdbz4bzwZ2JT3TqSb/4Ig95JJnS2Vvh/k9TgbTtNGpQY6cUWs71Cirl9cG5euu7p+5cJuLlCRy01ov6q0OA/ggvF0Uea8OeP36i9QQ7y8ae52rAYbkGl2G2EcLPekSli41vRrUTQCL6vQjnoREelohQVD1p9CunivGpi1diRlrQozalKIX9yfvs7ngyu4DtcB9yvY2+2Y/Ag5KU187FosmkvDcNvYxE0TVP/YBIucxFPLeEj1axajfesvD3Sb8FjkXCmqtDNjyAz0ckEUACt5gjfk2fgaoXKYU3msIS2VsMHK6UtoTxlAh4YC2vZ0Vf5Gxd88UrzWuM86iPnIU9or44YCdkED3zp89uE+XlJYwswtzyYDJiyebmXKzuYty9i9WzQst/0U7v9noZFswGWO4avokpF13WhFyJN0tK2x1mHphR2Dw88oFFC/TOPwb43i6yjpcf8frJDAeV08+JzkpbVfW2+hYshlrrwO7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(396003)(366004)(346002)(136003)(451199021)(31686004)(6486002)(66556008)(36916002)(41300700001)(66476007)(66946007)(8676002)(110136005)(36756003)(478600001)(316002)(86362001)(31696002)(6666004)(53546011)(6506007)(186003)(38100700002)(6512007)(83380400001)(2616005)(2906002)(5660300002)(8936002)(44832011)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVgrcXZ3OGEwTDFZSERmRWdLc2JURTdsL0taaFBmcHBrSHc4eUFPaXozOXV0?=
 =?utf-8?B?c1Y2Ym5IN2pTalFyNlJwc3E0Z0lWYmJVcDNOSXc5dVIyVjVHRzdSQnUrZG1l?=
 =?utf-8?B?MnVFYmJLQ0lKaFM0NWdVTmxnYzNxNEplTUVMOFJGTCtjTXdYNGlYZ3lpTThQ?=
 =?utf-8?B?VVpLVzlsMXc3QTNvL1JlRVpGM2x1d2RrNFJUN1kyUXNWbXJRYmdmaGtHQWox?=
 =?utf-8?B?cGFLR0pRbitNMG8ySzk5aTdHRU80K01NckZkTHlkL3R1elplQUJYSnRnYUZ5?=
 =?utf-8?B?eXhvb0loUWpxL0NIRkQzK3BueW5pOEhDeTlBU28xZ2N3cHRtdEQyQmVYZ3VN?=
 =?utf-8?B?TlVybzk4b25GK0tXSEpHVHpUTjdxU0FMOHhLQVNhcUxWMlgydFFhYmJ6TlRo?=
 =?utf-8?B?VjZpK1ZLVjZqMHc4ZXdUaFBtWFJGSzBWSzN6WWxWbCtBMVQzSmt0WXd3VWUv?=
 =?utf-8?B?a0tyTTJ2N3RacC9od3FWOFFhTHNqQkFFVnNnMUc5WUsxTkhHY1NDNDhxRnFL?=
 =?utf-8?B?MitONXZpTFVkUGVrcTRNc1oxZ2lLLzB0bGJESjZVNlNQRzBPdVI0QnFkSkZG?=
 =?utf-8?B?MzBGMTdjTW94V3VZakFHOHp0SEJudzE1T2kvT1RRZHVmZ1FZZlYxNG9idXpB?=
 =?utf-8?B?WjlMWVkwL3FVM2p2TzA1Y3dHRWZiQzNrTU5kY3plaXNJTjRyKy9WR0Rub1E5?=
 =?utf-8?B?bEFkS3Y3UWJCWVJ3Vk1RdkV3em5RNC9QYTRCaHNxUGk5T2ZRR0RXMllPS3c1?=
 =?utf-8?B?anNxZHVGNG5GeUVZbGIzY3VVWDJjalhWVm51V2NPT2xqODBIMjE2Z0NGV3kv?=
 =?utf-8?B?SGNyMnM0dmpCd0p4VWI0R05VQXd3WW1nc1hBRGNHUFhaVUJwMmJHcjBVL3FG?=
 =?utf-8?B?WGd4NFIvdnN3dS9kMENXRXBoZC9Ic2dmeDlRYjUzcWdWamZ5NWlkc3BBcmZP?=
 =?utf-8?B?bGE3MW1XU0VqZkNLaDlRbWpBMndlcFE1amExaGE5a3JSbnB4TzRybWt0SXRu?=
 =?utf-8?B?Z0YyT3kydXRYb1VHWEpRQUMrd2kyd3R2ZXJZWVNlUlh3UEhCZllEeW0zdVBS?=
 =?utf-8?B?TWR3ZDlFTFVIQkRDWko1bGQ5ZVM2ODlrR1VpczhtK253M3pITGdJbFZudC9u?=
 =?utf-8?B?VzIwNEluUWxwN3UvaTNGVm9SRE4zd29PVzdDRXQvOHRrYVU0QTZlNjdUdmFz?=
 =?utf-8?B?aW1YaER4Mm1PcnRUeUsxbGhXMWpjQkU2Z1NzdzlERUR6TjF5VHg2QlN2LzFO?=
 =?utf-8?B?TGZUS2I1R21oQ25kUEhNdzZMVXN5TEJROXNoVmVUbVJvcXZNT1A2MU5GV2cr?=
 =?utf-8?B?TGdwMlhWd2w1TVRhWDBvVGhGMGdZQm5aQ1ozZElidkczTmJ3ZVp2ZDJNNGRS?=
 =?utf-8?B?WWQ4OHNrU1FKWk1FRGVsZTFVY2l2Z3QydUxiNjVJQnJoZElUSStmVUNCaElC?=
 =?utf-8?B?UWs3cTFwT2hjZkIrMkhNbHhXY0hJdzdPSGNXUzZBQWhVMzluZkxpVEtteGJR?=
 =?utf-8?B?YmNVTHZ6YlhPcnd2MHJDN0l4MzF5WnFHR2Y1SXNIbHdnd2NvTWhGODJOZjlo?=
 =?utf-8?B?c2NwTm1OVGpGN2ZlaVlKeXVTSW9WVXg5ODI0cnd3eGkydEEyZ0R0U0E4dS9z?=
 =?utf-8?B?cFFDL2hMZnQralhHcXpxQXMrMkhhVVlzM1FRZDR1UUhHWlJ0V2tnWTNvOGtV?=
 =?utf-8?B?MU9CSDF3dXF0NXNWYkNlRm5wbXo0ZFNJeFB0SUhybU1oQlE4V094bytqTmV0?=
 =?utf-8?B?bzFNcE1ZY1JWL29TTUlSbjNWR05SMGNDSCt2UWhnSXU0K3F1MHVjZitBK2th?=
 =?utf-8?B?SjNya1N0b0NBd2E3NzZMaDAzNXRkSERsS3pvR0l5ZEM3dlp0WFU3TUhKSzhw?=
 =?utf-8?B?dnhNaG9HaE9mdk1INjhXbmpHVFVxSGF4Q1VVMkQ3Q1FXUjM5MUN1K0kvdVRJ?=
 =?utf-8?B?R3JNUyt6ZGF5RUtsemxJMFFFY3doK1RaUGJiWTluaDdFWGw1ZG1pejVOUFdm?=
 =?utf-8?B?bUhCbFpRN1AwczlNNit0VTVLSC9SMzFlQVVOK3RyLys5SFJBWnZjd2tyaSt1?=
 =?utf-8?B?eGxpTHJ4c3ZxdzQ0UkNjSmZ1OTdvRXlQanYrbmZZdkhhUzVpVWhxSUJrWFh5?=
 =?utf-8?B?aEJIbHpYTnBGdkZxQlR6aTJjV2RkdnlIWTBYb1BhR0tBSUtKeEpaaVJ3T2U1?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 9aXI3E4Zw2aOBu2oTRiYf5RXuRiGEmhtUUERUrq9S3bzTucHOff8Gcpu4LDwEwa9OBPBgvhpHXsZnYaPl/zEZoojgpyAcV6fltmsCShzMtantKZTULXGU6wPPF98XnTO84uFwfmR9427mPB85nu9QisYT3H3fKeXKF2uow+1alToFcT8nez1T4N3bwHY+m9d6hv9PEywPuIXWGTm8XLHonSebaF9MmZT8RX89B17Mn/vykUbm9Ffqbd7PKb8yQrBOmx8W1nUHx72gl+IFIaOFr2c3UoYXaMdLgI/qRrOVxb2Q2nvvUX4Sjf7QE7eTbiWNogSDpT9i5/rJQ+09MPHENoKWQJNqWadvqUbwP9E+ZQBX05KENcpKRDpya/9YunvkM2LpKVKmOR/0Z7V1SBFtyZb22xL0tQPmi5NV5jfinFrW/7jOqz9NEfNiS7DNDs3e29PiitQIeqwww4WFIUOUq72C4p0n391Htiyrk5KhR+rRMgJQtqua7CCAezzBAEm8nS97DETYwmbJXAwe1Kq/LAtNktOMhQ+Es+tLIMGvXTh2H+IT7L/M9yIG/zLaanbolnluVEtljzXkHGKhS1NyRr2bmv96Hj4PaSt1e94cwo6nLLzNjJUadgFR964orO1xORu74u02quNcxxQb2TWLUvQv3VCpy5V0f3eUAN+KB0Ff/mcSphJqY0cy+GTrI8HuAnABwicZQpKpXCw+Zoi5aY3v0jnnPQ+PyRdLffTiX0beXVTh3jsKK3Do9TQpL7WOkqsj6rxa/nM0a9rpO/xXFeEQ/I1xca4rzEB6jhn3koBQvAt8lmX7xjF4yYZ/47J
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c969ae-6e53-4e37-f6b9-08db35ebd15b
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 15:38:35.0553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFXXzj3Xw9m9tC6C2wTQA3c5lKZv+OUPc4+1UfA05nIJq077sxS/1eTUvg//nkJ6JDnWgffbPkFYeQcZzWj3dpeneqc2zr/TNYm+hgvbkbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6618
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_09,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304050142
X-Proofpoint-ORIG-GUID: ly1f5KFX5c-dPrZWF8spTC6soAL5JgJD
X-Proofpoint-GUID: ly1f5KFX5c-dPrZWF8spTC6soAL5JgJD
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.355,
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


On 4/4/2023 6:00 PM, Philippe Mathieu-Daudé wrote:
> On 4/4/23 18:00, Steve Sistare wrote:
>> When net_init_tap() succeeds for a multi-queue device, it returns a
>> non-zero ret=1 code to its caller, because of this code where ret becomes
> 
> Indeed g_unix_set_fd_nonblocking() returns TRUE on success.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
>> 1 when g_unix_set_fd_nonblocking succeeds.  Luckily, the only current call
>> site checks for negative, rather than non-zero.
>>
>>      ret = g_unix_set_fd_nonblocking(fd, true, NULL);
>>      if (!ret) {
>>          ...
>>          goto free_fail;
>>
>> Also, if g_unix_set_fd_nonblocking fails (though unlikely), ret=0 is returned,
>> and the caller will use a broken interface.
> 
> We should return -1 from free_fail, not trying to propagate 'ret':

Thanks for the review.  I will add your "return -1" changes if Jason agrees.

- Steve

> 
> -- >8 --
> diff --git a/net/tap.c b/net/tap.c
> index 1bf085d422..e59238bda0 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -821,3 +821,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
>      char ifname[128];
> -    int ret = 0;
> 
> @@ -896,3 +895,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
>                             "the number of vhostfds passed");
> -                ret = -1;
>                  goto free_fail;
> @@ -904,3 +902,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
>              if (fd == -1) {
> -                ret = -1;
>                  goto free_fail;
> @@ -908,4 +905,3 @@ int net_init_tap(const Netdev *netdev, const char *name,
> 
> -            ret = g_unix_set_fd_nonblocking(fd, true, NULL);
> -            if (!ret) {
> +            if (!g_unix_set_fd_nonblocking(fd, true, NULL)) {
>                  error_setg_errno(errp, errno, "%s: Can't use file descriptor %d",
> @@ -918,3 +914,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
>                  if (vnet_hdr < 0) {
> -                    ret = -1;
>                      goto free_fail;
> @@ -924,3 +919,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
>                             "vnet_hdr not consistent across given tap fds");
> -                ret = -1;
>                  goto free_fail;
> @@ -934,3 +928,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
>                  error_propagate(errp, err);
> -                ret = -1;
>                  goto free_fail;
> @@ -948,3 +941,3 @@ free_fail:
>          g_free(vhost_fds);
> -        return ret;
> +        return -1;
>      } else if (tap->helper) {
> ---
> 
>> Fixes: a8208626ba89.. ("net: replace qemu_set_nonblock()")
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>   net/tap.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)

