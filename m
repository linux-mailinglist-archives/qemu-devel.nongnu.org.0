Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8293D6CDA7E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 15:20:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phViO-0002XL-0h; Wed, 29 Mar 2023 09:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1phViK-0002WY-5G; Wed, 29 Mar 2023 09:19:45 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1phViI-0001sg-2j; Wed, 29 Mar 2023 09:19:43 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32TCn7Gl009213; Wed, 29 Mar 2023 13:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=i/Bs8fir25w77+xBGiIZ1VreqrGnPypAhWnVbgSwix0=;
 b=b5TDoWMUM110xXrxnjkmyIxvhZYGgS3zyzKGx6iq96eSVvJnE9E5j4DO5pBZje2yO/Vh
 c5OyJh3BzbfkgW8Mj5AOp1ausHoptuiYegzl9KFuwMH++K3KZs4uTW/L9muUm2UDc8T7
 cDjMaD8UW+P8xmBvQqvjlqqycZHwflT2kI/kKoKpECtTG2F2DDnVbV/rTbeSNsqNyQqf
 yBcb8PCq+2a/ysKN8OcgmHe6FrmQSHm1OaS0UujCSle/kVWrznGv+HjTAoSCNOcNU+Zp
 2HvYMl7NsfuWGI6G3DcoxI4Eyj0XWTVGK7E0Si/MAxSoU2KV/XHozfmcqIVgfOELIUK5 Iw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pmnnxr2hs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Mar 2023 13:19:38 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32TCYmmw030046; Wed, 29 Mar 2023 13:19:37 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3phqdeasbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Mar 2023 13:19:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQ0wg1MC2YHUZLZ2IfwsORQo3nhY4asI9UQoY9fccAJaUAxupUSfq9XCdCSy+Ud4JQUVX7a6BFbyw4V9+uxTrHCxHIRN0eHtLORR9oq5WbaADO4+x2Tiel1P6kQ3jS9ME5o850OAikiOUqoTPiSt2as0wrwWGDR3IJm9LdMYJqF7wKDQRoqoUXGhB00OjJFouaap01dXqQtPohJ8SQiQxByWhNrBM+1y8zZ4+4ShGDxYlWJRJKyR8TuhhyC96a26iFuQH3wY+qRXT5P3H9Dt3zntYY3jcCSmGLXBUMABEftQoYJIZbp6vN4ED9TruDHrm5RzmNh5vxwVhTwULsz3Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/Bs8fir25w77+xBGiIZ1VreqrGnPypAhWnVbgSwix0=;
 b=VJOoP5ZIhMBfaTCq9pthqX5gx70w+yiX/5cZvkjWHrADUQVn7mHFsCzOYYcIeQHDi+JJPdPPiYXKXOa7284cpdnWX/8ATnyw0Zs1nyJgdnnoGetiN4HFcRJDRE7ceYEGki1CtUr9ep56MRD1Wk1RPuyo/N7VEuUR72DMrUrYDsE5krJq8S6ZVIcLS5eSXi8yN3Idd196wUbHObrQ3mnAY19wTZyrgnPVVH2qi/higc6Kd0R9tI6gIp1f9NWarWn355WqoIlxCAG5zawZD5Zk84a6SDxsBe17r5IFgXY5sBk3mzj3urxjfGZlWaZ++6ekNfuoTyOmkudTyXVMBl2/ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/Bs8fir25w77+xBGiIZ1VreqrGnPypAhWnVbgSwix0=;
 b=NkW0lnJK5ikjvR5tbFv4KZr4pQM6nBBYUIa8LsC5T42GFqLRX9nFl+DWMqSBtF+qqVuP+PxJ13CrPb1sjhGnUB+5RNL9T1hyH93gf3FwwwwALlN5wqt7FGTcGumYgVtBy6DtwPB/A2Z2R4v7uNBSmekggvdIUb6BjjR3fhevkyY=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by IA0PR10MB6746.namprd10.prod.outlook.com (2603:10b6:208:43e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 13:19:35 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::e9ed:8782:64cb:cfc3]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::e9ed:8782:64cb:cfc3%9]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 13:19:35 +0000
Message-ID: <5ff9199b-0149-45dc-6138-3ad9b2d71fd3@oracle.com>
Date: Wed, 29 Mar 2023 08:19:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 2/2] hw/acpi: i386: bump MADT to revision 5
Content-Language: en-US
From: Eric DeVolder <eric.devolder@oracle.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: shannon.zhaosl@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 boris.ostrovsky@oracle.com
References: <20230328155926.2277-1-eric.devolder@oracle.com>
 <20230328155926.2277-3-eric.devolder@oracle.com>
 <20230329010126-mutt-send-email-mst@kernel.org>
 <b9fcf584-8c83-9d56-c67a-b830b17c1272@oracle.com>
In-Reply-To: <b9fcf584-8c83-9d56-c67a-b830b17c1272@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0029.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::17) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|IA0PR10MB6746:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec48cc2-43cb-4a3b-2384-08db30583d5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bpaYmjTcS7yfrHMRjs0WJn71xpSbdY57J8TFFel+e/eCCecIF2yVKRrM8B1OxLlwBLNZPZkm33H5UsRrgMJ6nAuFtz+AUuJNMJ75X7zFzX0k3F/+RBp/i61xo26B5jEyJlzflLjRxwFgtDO079PZeox/RXS0xo1+xMoa6L3HVjC2VVZJG28vdYI7eEpjUXLwlVWPBBou3ST/5uKftM9MIbidesiG7iBE+zIVby+qDkci3hCnsWTWTjms0i2kI9tovtPiJe8prBnvgFuMfHZGtAbnUJ5ZSIsDXwOOSIQaoWVVSdKTlyv2heHrMLkS41877l8cYvt5ZBlmtsKzGaHAJQEjj9euvfGJvr8ROTudVFQOaqWNfyjafHBO+7II+x6oa1QCfVYVpYNxYR394oz+WbYSquODJN1hvbBx8+fccVzNWvzLHWXX4o1tclnPQ6dwksy8C52OOPaKAVwWtAaaA2r6yK9dGyuHptcAp7cS8Vme2liXY9N0lBcK2Ap/F1EYDpyEzZ5whKubZI0k4rzfE3PjyYiRCywOwSN4DujJJYxDWzWhU0R5Mff1kp8m6JSgUNtx4kwzmTbuv1+zQzbQs9NFXnSRbZHyYGTTS7LZmx5TmfHWZS3S5Owy0Z/9NKMEssvgsNbT9QhaSoW86PNRKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199021)(83380400001)(2616005)(6506007)(6512007)(53546011)(31696002)(107886003)(86362001)(186003)(38100700002)(36756003)(41300700001)(478600001)(8936002)(5660300002)(7416002)(6666004)(6486002)(66946007)(6916009)(66556008)(66476007)(4326008)(8676002)(316002)(31686004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHlFNmtsMGZsaGYvaWR1QzRWOS9SUEpGNlJMWU1iK0x0c1BMN3ppWXBpbjZy?=
 =?utf-8?B?SnNoc0tIakpCNmRUSjA1WWt1dG5zcmRyNUlrSXI0bk1UOExERXVnUzlvNnJq?=
 =?utf-8?B?VndrWFpUYXBvSElPWUk5bXZGSEV2WnFEekxjZW44dllZNmROaVR2bE90Z1lX?=
 =?utf-8?B?ZVNhdHVMYlNNdnVaZDNySXAwa0VnZ01MZXpaazVWNVNhMmlJaGxTSk95TXFQ?=
 =?utf-8?B?OW9nUGEvYkFyNXJaSU12ckV5RjJPVWFQdWVETk9qR3dOMkhuZFZJNU1rYmFO?=
 =?utf-8?B?M0hFRHRnZVNIVlUyU1l6SXFoV29hT0NRR25jWkJTMVZjT0x1Tjg3SnNHWTlI?=
 =?utf-8?B?VXZZekJRM0Jxa1ZqZ2VPRWowc0h0blgvdVhEK052dGVueVQ5Z2VXdDFXK3Fn?=
 =?utf-8?B?YnpTUmh1YktLaDFoYUdLUFBmYU1vN3JtVUxSR0JqWFA2QkpnbDFkNDViRFVI?=
 =?utf-8?B?d1kvVk4yQWxiRjhkYkVQVis4WGxjNW5XK1hsNVlJNHhQM0pWZTNmNjI2NWdR?=
 =?utf-8?B?VTNuTjB4SEE3Kzh4c2N0WWRGTWxINy8vcmJtcDJxaUhaQkt0c1hyZ3Y3bXhm?=
 =?utf-8?B?VUVoUGVWb29DNnM1VFljV2MzWXZkbGJraWNNS1hMSWhyaEY0YWtwTEFIWFVw?=
 =?utf-8?B?Uy9KNnpmekZyY3RkbTdUOVlyVXRuZGxJK0lBOTV5V1NxNllWeVpvZis3YW9o?=
 =?utf-8?B?MTNHa2ltODZ1SnJlYzNUN2hyTkxZOGFWYm9VdFFuY2tvUm8vUEFWUnhienYv?=
 =?utf-8?B?Y2NTMUdQNUVjWDRzcUpPcWNmQ2pkNjBvcVFxSVJDa0lNOGlMZ0NsSVdoRm1a?=
 =?utf-8?B?K3JKbnk3cTEveTJGejcwNjlBQ1ZrbDhYYVo4ZFVCY25ha3BuUTR3aVpnWnZJ?=
 =?utf-8?B?NHRnd2Fxam5YaXFQV1Jza0RKelkzZ245Q0xKVjc2MFF6di9BcFExNWtpSU5Z?=
 =?utf-8?B?cEVSbGg3WXYzVjg3Z1lka0tNd05sdUY4S1lMY3BEMGZBNndHc1ZIU1lTM0Jv?=
 =?utf-8?B?bXB1cCtBM0NCTmZPUGtvOFJ0eHZpbi9SNzhCVkMzNVc5UmxPVnpxdWxycUtX?=
 =?utf-8?B?Mllwc3Q5dDRNajNIdGhRSlYxVWwvdFVHZy85czJtbGpjbGc2eDJFYkx0ajh6?=
 =?utf-8?B?Vm9MdHZxWlp2ekZZLzNTazBvYVlndTdXd2JmL3dmTDFtM0F4dit4MmNiQWVn?=
 =?utf-8?B?WWw2TUxTckNFZG1ISmJmcExFTFpFUk9GZWtNVDVYNXZLUVJ4K3ZZSTJkWDZY?=
 =?utf-8?B?eHIwQzFaRDRFdTJZNXFsc1JHb1VPMTlheWRiRHE0WEpvWHlCczdoNFpqSFJI?=
 =?utf-8?B?WVlsYlhYRG5qMnRZMjd3T2E5bTkwc1l2ZkRZUHdvK1l4bGQvRjdzT0RoQzhh?=
 =?utf-8?B?UFdNcVUxa2NQMGEzOUhUR1RWaU00YU1oalFDNGdaYStXWnREWWFiWHozeDZQ?=
 =?utf-8?B?ajhjOTdnRnloS1ZnM0tnKytKR2VQV1kzRkFPNUdKL3JlRGN0RllaLzFvSkZD?=
 =?utf-8?B?blNScEN3M25zS2F1U3lONGxKeTI0SHY3dlgreThWN1FhYVlKeWZGM0tWRkxQ?=
 =?utf-8?B?UTZjWUNxalJiVVdzREZkS1lLWEIwR2luMjE2SFZ2dHNLNnI5UmdYNDZEYTlN?=
 =?utf-8?B?Si9XL0NWQ05QTEdIcndvREpFNklBRmoxdWNwWHRXT1BVaG9aZ011NU0yL0F2?=
 =?utf-8?B?VFMwVWdLM3FNMElPL1lsUlFHVkdzOW5US1dGaFc5VnFXWDA0NExmNUh1VmRu?=
 =?utf-8?B?RzBGcFhiTDFjZ09McGltcWRLaXM5UmZ3bGJaSDZxMk1COGVjMzZidDBrTHZq?=
 =?utf-8?B?MzJmaldrbWxlM0dWeFJoaEYvTXdpR3B6Q3lHeVNtUXNFZS9hWTNwZzBVcTVs?=
 =?utf-8?B?Yk0zNlZwdENNcDdZcXBZZFY4S2hLSmd2TTBIenNZMDFNZlJkVGEybmpSQzFG?=
 =?utf-8?B?bUwrTDMwcGlFR0VaVjVxa05oemQrN2dvZURkc0h1VmNVRkNIcEhCQ0k5dm8y?=
 =?utf-8?B?SXh4cUFBK1NGVEpmTVNCOHNkMXpjTldPd0t3amloTWFadForN1dTTGpoT1FD?=
 =?utf-8?B?WERJQ29aRkpvRGhBV1lkZW1SQzRIZEN6UjNKZ0M4MGROTkRhRTdCWXZhejli?=
 =?utf-8?B?NTU1ZXhGeWtvb1JvRlRsRlpMMVdhMFhkVndobnR1V1dEN1loZ3JpeUJvTk8x?=
 =?utf-8?Q?98mFBXW/qiVcPsGX/uGWM9k=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 7KMmWKcu3lm96rTRY3yxUzUN36Yw/cfLuZgFS9ZttOZh+EN5gJ1v2mhozbqOKBfRqD2tKD4t64a3ZcySq4DUVSCbsH4XUoEXLCDLWwWPgj6N/zJjIEj/RNx7QShAbVRulFM9H5RrM2IFU/tv20V8pfYgYv5IPw7EOnRrQ/oDGpI46eD1Vh1rwFpA6qtLSmp4M7GtFDZuRBeksfW6r/sYTlj6uqMtRJaEabrbVViKM96F8nMoP+JHPcpkKF9PENyuco6+s1Rx8pSRFGtErgViyFgPRaD5FDjtXW9zoVInAVgdzELfIyY/tU1+Y2UiSo8TGBTNbsnESHt5fJ5/NAnXcJ9C5AXwuZJx/CWYFl19rr9RLU8+/GsDC8V7cGGPi8vZfEVV9fwkt2lccRR6ko3qxtpqXP3FzpG2wRjkGa8bC00wdWUvqhtldZM48aX6ocTYPAo8+FoZdOgf00KWM8AoOrZ+P9yo9eJwcXkvRtpgo/FCOwXK3LVMzvUeg2qXm3lONlY/dQOqx6rYO6fNKAa7YpCmlwyMLWHcIP14CTzbm+7CoxLDPvI2uaikqtDXZRAOogkuYev1/bqW/DaHquatknqzMPKhboHxdr5ORrtYPGv58S0UtL8okUvGbi4qT1IseYCUW6jG5dYphzX478/L6+8TQS/wpspQu/I/Gdf6qaxEKq771cIT5GjygTGqno5gD5K3hKraQfZq8wkL+CjZplGBb08Ba+KQ/EsmSdWhOaSIJK7Au0e/616ZqcQdh/cYTvzAg2tL6kC+fskb6ho1rpW4caeNhlRdKVLfNcjAvY+ArTVFoGTjihpJP+6gl8L0Rg9XtObMYcJu/mJ7Q88TNsWzuS9W8DjJRlFx5E3UD/5CzYFWo72+MtmpKO9SYMMQQsfZk+XjkK5nqXhVWaPtFA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec48cc2-43cb-4a3b-2384-08db30583d5e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 13:19:35.0185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QiU1vGQU/V7hgrRgn6Uo+IsOGNqiEBtbQ0esmFnRBG/kZA963k+HnJwOpTRh/QF2jzRVhSIbKhbOsVroENAh0smmAn3Su+/1gycwKJar3t0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6746
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_06,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303290106
X-Proofpoint-GUID: sy3YSByef1eHd-91gf9M0kYAd-epTq6z
X-Proofpoint-ORIG-GUID: sy3YSByef1eHd-91gf9M0kYAd-epTq6z
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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



On 3/29/23 08:16, Eric DeVolder wrote:
> 
> 
> On 3/29/23 00:03, Michael S. Tsirkin wrote:
>> On Tue, Mar 28, 2023 at 11:59:26AM -0400, Eric DeVolder wrote:
>>> Currently i386 QEMU generates MADT revision 3, and reports
>>> MADT revision 1. ACPI 6.3 introduces MADT revision 5.
>>>
>>> For MADT revision 4, that introduces ARM GIC structures, which do
>>> not apply to i386.
>>>
>>> For MADT revision 5, the Local APIC flags introduces the Online
>>> Capable bitfield.
>>>
>>> Making MADT generate and report revision 5 will solve problems with
>>> CPU hotplug (the Online Capable flag indicates hotpluggable CPUs).
>>>
>>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>>
>> I am looking for ways to reduce risk of breakage with this.
>> We don't currently have a reason to change it if cpu
>> hotplug is off, do we? Maybe make it conditional on that.
> 
> By "cpu hotplug off", do you mean, for example, no maxcpus= option?
> In other words, how should I detect "cpu hotplug off"?
> eric
> 

Actually, if, for example, one had -smp 30,maxcpus=32, then there would be two hotpluggable cpus 
reported, the last two with the Enabled=0 and Online Capable=1. If one had -smp 32 (ie "cpu hotplug 
off"), then all cpus would be reported as Enabled and no cpu would have its Online Capable flag set.

Granted in both cases, MADT.revision would report 5, but it would still be accurate.

eric

>>
>>
>>
>>
>>
>>> ---
>>>   hw/i386/acpi-common.c | 13 ++++++++++---
>>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
>>> index 52e5c1439a..1e3a13a36c 100644
>>> --- a/hw/i386/acpi-common.c
>>> +++ b/hw/i386/acpi-common.c
>>> @@ -38,8 +38,15 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
>>>   {
>>>       uint32_t apic_id = apic_ids->cpus[uid].arch_id;
>>>       /* Flags – Local APIC Flags */
>>> -    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
>>> -                     1 /* Enabled */ : 0;
>>> +    bool enabled = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
>>> +                     true /* Enabled */ : false;
>>> +    /*
>>> +     * ACPI 6.3 5.2.12.2 Local APIC Flags: OnlineCapable must be 0
>>> +     * if Enabled is set.
>>> +     */
>>> +    bool onlinecapable = enabled ? false : true; /* Online Capable */
>>> +    uint32_t flags = onlinecapable ? 0x2 : 0x0 |
>>> +        enabled ? 0x1 : 0x0;
>>>       /* ACPI spec says that LAPIC entry for non present
>>>        * CPU may be omitted from MADT or it must be marked
>>> @@ -102,7 +109,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>>>       MachineClass *mc = MACHINE_GET_CLASS(x86ms);
>>>       const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
>>>       AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
>>> -    AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
>>> +    AcpiTable table = { .sig = "APIC", .rev = 5, .oem_id = oem_id,
>>>                           .oem_table_id = oem_table_id };
>>>       acpi_table_begin(&table, table_data);
>>> -- 
>>> 2.31.1
>>>
>>>
>>>
>>

