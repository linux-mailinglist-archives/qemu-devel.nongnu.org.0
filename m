Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9456D6F8BAB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:55:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv3NU-0007IT-BP; Fri, 05 May 2023 17:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pv3NS-0007I4-8b; Fri, 05 May 2023 17:54:10 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pv3NP-0005Hh-9f; Fri, 05 May 2023 17:54:10 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 345HhJPp014769; Fri, 5 May 2023 21:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=mFv2yNBVenyNuk5ZEeM55LcGTsAr8AlLfT7jdDV3QL4=;
 b=dYCViwy9xcDAfoCQYxP8X5c2oWHca0sei/vYepAxfSVOfuNQ9vzKtwnGrcOHDvKlVORx
 aIeOkigNqijjxs7beifbS8B/56BEHMSZ8+Xy9732N95ZS71uyRmb8KyfYjN5t2Hrbeoh
 PSMkmjfjwqTcTGBbpQ+0zpIH/6vRvev3y3G2hZ77jomKgXxYcpEhEa5S6VIyceeMtC4l
 dpAfEAZ6AJ+7Ng1tmWYquYhZ5b6ugCVD6bBU5DacOni0ErYWfF2zDax60C2aC5S4r1nB
 sNWh334Semb8awUAkTRCpY1oIwQtJiPq7M2AFHwlsLiunpz53hMpbhZhJEDnnNHI78WS 9w== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3q8snedtar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 May 2023 21:54:01 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 345LQujV009952; Fri, 5 May 2023 21:53:54 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3q8spaw212-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 May 2023 21:53:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6VOj3VCCyO8/CDFhQ9qVEcnqfPKjYu+ON0F7vCNwqzHorCrXWiCfZQcOH9q7oyq+/k2k57weeKHdTNokZsTP6eezdIpNaFxS09nt/Yzwpy/E9POo2ZU5qBSGf3JjJwGbXqQ6gxVf3gIhR3g339oMbsLA0HNhOTxs+GHko5rVBQDberlMkFn3MJ7foaHZLxZCT3yxouMg0JbLK9hqkjOCIdZVgvBCpgMI2RFNEOEcjJrZCFN9ZzhR/W/DOw+S2MZxHDQ2EjPB3LbOL8VK6Z3tnAg2HGy+PQJZsVPHqL2qWjNQUMN0voHG7r+imRKnTJa8eZyxaJLbbgC2kSiil4wdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFv2yNBVenyNuk5ZEeM55LcGTsAr8AlLfT7jdDV3QL4=;
 b=QkTAr660FvBUzS2k4kbCv8xvlOzodRCVaeaF6ip3nY1Vk5SkSH7iyLGMMrYTNfj0A7DoAL7gHbutNrZE3mOZeUdrtZgzXyp5/KzZWS7DXTzbacITVOKNGvNvHjDCH6IzAuVCWA4TdZAC9HPLVhIwK5AP2OLuXikLpJL/V1k9MYuhr2NfrREtgeujHWdBdhqMIQ8FibiKXF+eosyfn0L+H4BOMr//prpzrH2S62dE8kNpEwB96Q7oNxWlk6nCwvIwvC+/DjBzNBpLqrfIUeKJ/RZTT0lUz+dAotgWbrUfi1E+BvVrr11GlzuLNg0otFMBpU16UqyzJE4GQY4Z3wtNSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFv2yNBVenyNuk5ZEeM55LcGTsAr8AlLfT7jdDV3QL4=;
 b=yDoaFn9FGOz+aN+40zRwYCw7rxEy8RqBLigvGob2uwPLL4ZYjfJ60EVPoNtKYr3V2f2jqSmsY+skve+KsZaNxsTL4bfljV8MUcKD0l+jTMWegbjrEkdjKI8z3O6CbD/2w6DYnbvkEuraCUUAMVIRfyEEeSN7V/wP4nu/yHVUg3M=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DM4PR10MB7427.namprd10.prod.outlook.com (2603:10b6:8:181::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 21:53:51 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac1a:bf88:bdbf:2573]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac1a:bf88:bdbf:2573%5]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 21:53:51 +0000
Message-ID: <67265b8f-10ff-d276-bdda-b6c66666e36a@oracle.com>
Date: Fri, 5 May 2023 16:53:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 0/3] ACPI: i386: bump MADT to revision 5
Content-Language: en-US
To: shannon.zhaosl@gmail.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net
Cc: boris.ostrovsky@oracle.com, miguel.luis@oracle.com
References: <20230421214901.2053-1-eric.devolder@oracle.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20230421214901.2053-1-eric.devolder@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0087.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::28) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DM4PR10MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a61e4f-600a-462c-3e34-08db4db33634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x/kBNTclDoAwTCCpMu+fLldlJ6pHhupmYzhnUrTUifWgm9LS43XrzzmauCf/ZX/hY6XREkpWk0nQZNTIg9bG4JeLJvLr6xef7SHMvQ/fHVgD2SKRJJDTLndKAArKJHt7uqRo8odX8sxEiZS5lbXgiQ4iMT61UkX5UjTJzOLIhF7sr7Qr0I+MmCdv++M8lXatxQ9ZZ4CkfRJTg78yPlWOZfFHH7EzRdfimIOp9VboysbrRp4itgr0SCtAXunoftpv2GFu426nDG2MGX/aKyHnUHC2sKOInN9mEOn2u3iauP4QBBJgrdWdtjOVGx79XwisKSFMMGUEbAA3NF6oDloqbDOxftS6Wnv0PnB5wzZmE71RkQtgXb4ATZH1muWSwsgnJ4p8WIdnVmaViIDh9jG6FbJJEmWzTKaQv+G+ITstCClHwSmZs+FsHZT0dFpBaIZ7MfZVEDAJt5hUCObWgsIqL/KyowMlE3xgwOsWfD/+Wf6x+nnIa3CGLd4ioF9w3ysb1DwBFxtUkYgxfbN2tejxaNd1QCOc6GjemMBCtTPJVOdyNZB4yBtiGlztlWv/Ic2KiLBV4AzZs2NbLGrIKwXTKcv6puFMdc9D+hOjH5HXb0/eX0YNWLRbWuxDtWJRmodpy6mV4wQNSHzlq5M2v3vR9fjWnfKfHxSR4m3H9WPCF6EtIjweEzhtci3tQd39zUjg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199021)(31686004)(8676002)(966005)(8936002)(6506007)(26005)(2616005)(6512007)(53546011)(7416002)(107886003)(2906002)(30864003)(83380400001)(5660300002)(41300700001)(478600001)(6486002)(4326008)(316002)(186003)(66476007)(66556008)(66946007)(6666004)(86362001)(31696002)(36756003)(38100700002)(921005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkRXUi8ycWJsTkd4YTJWSnZ0d2FFZlpIMGpld29wWk9mMmJucERvdWkxbXJ3?=
 =?utf-8?B?TXo5MSthaGUyZTJiN1RRZUMzbGpUa0V6cG9oTUk0aVQ1bGNFRS9zSW8vb1Fw?=
 =?utf-8?B?NENHbzZSOGg4MzFYcUFnVWpSZEZoc2ZEcWkyRDhVRUtPRS9zdlNON1RpbUZE?=
 =?utf-8?B?ZGJlUElrblJ5SUZwVFNCMW45TXltMXBBQ0FsaDdBUW1nM1pzS2pqanU3aEFm?=
 =?utf-8?B?bFp1Wmxhd2FYTktubWJnN0FjMDFiZ3l0VjAyOEUvTU1CNEFQQ2ZPVGpycFZk?=
 =?utf-8?B?TlFtU21pbHlvTjdSWDJ3MkgzZ1JreEFBQ1AvWjAyQytXNWJnMlo1Z1BoSVFO?=
 =?utf-8?B?WHJ6Mi9EQmNEVTAwa0U4STRPMmdYRkdJcGRneWRVUi9BWStXQ2xqU1N2ZW44?=
 =?utf-8?B?YlpDd2hBZXIrcFdsRkZGNXNaUDkvdGk5ek9pU1BxU0hsZHNhem00OXFOdE5N?=
 =?utf-8?B?aXBrek13blNlNjFzallwV2dRZEZrQUsxcWRFSkEzNGRKendLcjlCWnAwSDNw?=
 =?utf-8?B?K2NkSDZ1bm1ENlkyK01uaHc1NThPeldNWFNNeFFkRWxLY1plRVh5bkpqMWRp?=
 =?utf-8?B?OGg3SFM4SjBla0dacUtNMGZqYXFFeUpmNG1HeVhqcUhxWWtwVjBFejMvVnY3?=
 =?utf-8?B?R1lseGNKcmFSMU4yUjRON2dpTWpHdDNsekxSWldMbGdVSjF1ck52TndZK0JE?=
 =?utf-8?B?Sy9iS2hyT0VPT2Z0VXkxVVhQV1pLbVgzSWdybUlpeE4xTklxcFdLc2hNcTR3?=
 =?utf-8?B?ODlWZER1UW9yMGlhWFZ1V0ZzNW80SFdvOFZueHNVVGxNZERJTmZBRUhkMVJR?=
 =?utf-8?B?L3kwN3AvVms2RDR5bDc0dmxrZXdhdjBJQW8zWGVrZCtmT2N1NHJuYW5aYWt5?=
 =?utf-8?B?L1NyUVR0YU96ZzJLSm9pZDBVMklVVVFGYmhuaCs2TVBpeVdsOUJYWWRMWDlX?=
 =?utf-8?B?RjNoKzJyeEYrSjd0V0llZWczaXJTQm9tanlleW5yaVBPc205RVpRR1QrcWlU?=
 =?utf-8?B?alA1SjJ5dnQxa05FbnowVE1LYWV2YWdPVDhSbUdPM0FVUm5XcTByMGZURXFC?=
 =?utf-8?B?VUhCOFBQMnBnbzdub2lFb0sxc3lzU2ppNFJtVURQelV4aWVpYWNvUFdaS0V3?=
 =?utf-8?B?N1VKbFR3TmQxYmhzYTdpUVBMc3RBNzUzS0M1dlQwR2pzcC9ZV1FvS0lJQmJ3?=
 =?utf-8?B?WmtnNnhZbjhRWHZHN2VVdE0vTk5mUWlpNmJaZGFEcFAzRDRodEZmOU9peHBa?=
 =?utf-8?B?LzFkZnp3ei9tNlg3bjhRdHlzWXZ2NjFzZUgzNmtWeHJZUkV6bUp5NlladjQ3?=
 =?utf-8?B?aE83cXRNQ20weFJYWGh0WklJOHg3YlVrMFA3cFA0YWhUZ2dnVkNLeFFxZ2Jl?=
 =?utf-8?B?ZG4wbG1wb01ueEg3cEM2cjdJVDhDczNUN1BDbnJ2SjQ0dk9ZS3JoMUpBTDJo?=
 =?utf-8?B?VG02Y0wvQnVQVlBjWlIwNWRzNVpqT2s0d29MMFV0Y2tMSkovK0dtRGEzWnh3?=
 =?utf-8?B?aTk0TTBNaWkwWWNQNWc2YW1qR2ZMb3FRR3lLaXVqcWRWbVpmTTJLeGVlVC9H?=
 =?utf-8?B?c2E4a3FHVFBiQXJkT3hacTJURWlJTXgwYnhhdlFCRmlmaU82eVFpbkUzQ2tQ?=
 =?utf-8?B?NkxjT2p2cVVhSGxlUldmTlZ3d0tkQVY5RjUxVVlWL1Z4azd0NGsvNWtMMkhz?=
 =?utf-8?B?SkJrMXYwWkNNOUxkWUNHWko3d1NsMnY3S3lZd2tRSE9FMTZQQnMrZjlTMGNS?=
 =?utf-8?B?OG1QNThSMmNWcVJaNHY0anN3WVlXc2NWUC9wdytSRHQweWVObnJLMWhheTNl?=
 =?utf-8?B?MktCSEdoU3hEK05qcjN5RjB6cnA1blEvdFhOcXloQ1dQeGdzSHVCNEZDUkxx?=
 =?utf-8?B?Q0kzYURWL2FlcXpEeFIxRGw4bGJyQklBUEhEMHJ4NDhIQkJZNGU4bk02YXRO?=
 =?utf-8?B?a01wUW1Ed0lWU2RieUZQL2VZN1VDL2lOalBTNWd2bVgzOUowb0xEWHdJcWI5?=
 =?utf-8?B?MWFmek5aemtVWG9hS1F4T3lUTnNZQ3hEWG8wb1NqYk5ub29uOTYxUDg2amJz?=
 =?utf-8?B?b2c4cG1pWFNFK2grVkxubVZSYWYxWldDcVBZdU92UHc1UHBvbVdVN3lCaVVT?=
 =?utf-8?B?aE5Pb3RRM3pqc2phMHV2Qyt1UEgyWFNxNlFYOXR0MnZUNUdDMG4zMUZuOUhh?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: fYLwALja6iNnkSi6TLZ2YpfUw8xN66MyZR/OvlBzDhbusQgZ2CK8fJj0QFWxRtljErc70eMkVfKVKgyQlysHVIU2nKMMxdz3kXQBTlJadHxoiRcREHt0MSTt3IN8+XYwlT8conQUec2/GIc4vS5L3P3l6d3BbVm1AR6r0onmENiYdYdhZtFMZ4AmrIpfyZELWFYoeQn54e77kO6Mha9yUcXMnbBOU3bDKf57Bru5FKMIIEaSq5LkiIN+A2pIUdtwyx43yh97K6U7xmNKOWwKcKN15KPxLnZkfsV4MS6lH7D4Ppv3ALbJW0AWYTVlhDhHwIzstLXvNwtoWN+d92x2p/5nyA7SM35ACb85KvU1fLogspYDRx3bJ5ukF6ERxQWo7v2E/KK5n8Na4PMuiN3GpQWhMC07sQnushGW6woHWYUo8yN+NiYX5LUj+i6TScpkf9bgHydurOR/SGYOZYWJ++OMP/5pyIysJWVabWPSzxgOqkEOWuVJ2yRtKlL1nLb3+FjrwXUNU+PiGKtvg67P3n4Vhi3rP4oLz6UYzvGQ5NYp8cwyLAV3HuRtEsswRIvRIHS58JMT7q7w6k/XHZ8CLkFPSDbgYl5pf2Ht0PruaLCrXgSKEKVKdXunnWZWg2FnvHVa2ocABovIr9Og8B8wuBMX5ynC8G8ezDqoaVQOgTGhPPeztSluOk5Yzo4Th5qONMAQlb6obkepHonCQOU3Dwwu0CrTFE46R3qCf22GpPynaloF+RqpuxEeuBeWSVTYgcmUiCtvAmvnkF0J02mSzQNHOAdvBeCrQRuRyiO8lW5wjAEDRb3RhkOR7OTdQFANDRbcWUuaAyJ4AnBVSsRD81s1izPceZmM2DHkcpDlWpnayc3yFqE/WrcVAThXJKAKQW/QLsvCfwsunQmLln65cA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a61e4f-600a-462c-3e34-08db4db33634
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 21:53:50.9386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5j+uYLgnFvDTmI31vchLEgaYFlqo7qrIY7RoW23MMoFHUgavm3IkOM8XqYks268n+N6RLrCcf32X4DGkVr6DfdN6pUuU50RGrxsx99swMSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7427
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_27,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305050177
X-Proofpoint-GUID: ZW4Rr-tqPkxG_KaSMKtWiRlaz8a7Dujo
X-Proofpoint-ORIG-GUID: ZW4Rr-tqPkxG_KaSMKtWiRlaz8a7Dujo
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Thoughts?
eric

On 4/21/23 16:48, Eric DeVolder wrote:
> The following Linux kernel change broke CPU hotplug for MADT revision
> less than 5.
> 
>   e2869bd7af60 ("x86/acpi/boot: Do not register processors that cannot be onlined for x2APIC")
> 
> Discussion on this topic can be located here:
> 
>   https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t
> 
> which resulted in the following fixes Linux in 6.3-rc5:
> 
>   a74fabfbd1b7: ("x86/ACPI/boot: Use FADT version to check support for online capable")
>   fed8d8773b8e: ("x86/acpi/boot: Correct acpi_is_processor_usable() check")
> 
> However, as part of the investigation into resolving this breakage, I
> learned that i386 QEMU reports revision 1, while technically it
> generates revision 3. Aarch64 generates and reports revision 4.
> 
> ACPI 6.3 bumps MADT revision to 5 as it introduces an Online Capable
> flag that the above Linux patch utilizes to denote hot pluggable CPUs.
> 
> So in order to bump MADT to the current revision of 5, need to
> validate that all MADT table changes between 1 and 5 are present
> in QEMU.
> 
> Below is a table summarizing the changes to the MADT. This information
> gleamed from the ACPI specs on uefi.org.
> 
> ACPI    MADT    What
> Version Version
> 1.0             MADT not present
> 2.0     1       Section 5.2.10.4
> 3.0     2       Section 5.2.11.4
>                   5.2.11.13 Local SAPIC Structure added two new fields:
>                    ACPI Processor UID Value
>                    ACPI Processor UID String
>                   5.2.10.14 Platform Interrupt Sources Structure:
>                    Reserved changed to Platform Interrupt Sources Flags
> 3.0b    2       Section 5.2.11.4
>                   Added a section describing guidelines for the ordering of
>                   processors in the MADT to support proper boot processor
>                   and multi-threaded logical processor operation.
> 4.0     3       Section 5.2.12
>                   Adds Processor Local x2APIC structure type 9
>                   Adds Local x2APIC NMI structure type 0xA
> 5.0     3       Section 5.2.12
> 6.0     3       Section 5.2.12
> 6.0a    4       Section 5.2.12
>                   Adds ARM GIC structure types 0xB-0xF
> 6.2a    45      Section 5.2.12   <--- version 45, is indeed accurate!
> 6.2b    5       Section 5.2.12
>                   GIC ITS last Reserved offset changed to 16 from 20 (typo)
> 6.3     5       Section 5.2.12
>                   Adds Local APIC Flags Online Capable!
>                   Adds GICC SPE Overflow Interrupt field
> 6.4     5       Section 5.2.12
>                   Adds Multiprocessor Wakeup Structure type 0x10
>                   (change notes says structure previously misplaced?)
> 6.5     5       Section 5.2.12
> 
> For the MADT revision change 1 -> 2, the spec has a change to the
> SAPIC structure. In general, QEMU does not generate/support SAPIC.
> So the QEMU i386 MADT revision can safely be moved to 2.
> 
> For the MADT revision change 2 -> 3, the spec adds Local x2APIC
> structures. QEMU has long supported x2apic ACPI structures. A simple
> search of x2apic within QEMU source and hw/i386/acpi-common.c
> specifically reveals this. So the QEMU i386 MADT revision can safely
> be moved to 3.
> 
> For the MADT revision change 3 -> 4, the spec adds support for the ARM
> GIC structures. QEMU ARM does in fact generate and report revision 4.
> As these will not be used by i386 QEMU, so then the QEMU i386 MADT
> revision can safely be moved to 4 as well.
> 
> Now for the MADT revision change 4 -> 5, the spec adds the Online
> Capable flag to the Local APIC structure, and the ARM GICC SPE
> Overflow Interrupt field.
> 
> For i386, the ARM SPE is not applicable.
> 
> For the i386 Local APIC flag Online Capable, the spec has certain rules
> about this value. And in particuar setting this value now explicitly
> indicates a hotpluggable CPU.
> 
> So this patch makes the needed changes to move i386 MADT to
> revision 5.
> 
> Without these changes, the information below shows "how" CPU hotplug
> breaks with the current upstream Linux kernel 6.3.  For example, a Linux
> guest started with:
> 
>   qemu-system-x86_64 -smp 30,maxcpus=32 ...
> 
> and then attempting to hotplug a CPU:
> 
>    (QEMU) device_add id=cpu30 driver=host-x86_64-cpu socket-id=0 core-id=30 thread-id=0
> 
> fails with the following:
> 
>    APIC: NR_CPUS/possible_cpus limit of 30 reached. Processor 30/0x.
>    ACPI: Unable to map lapic to logical cpu number
>    acpi LNXCPU:1e: Enumeration failure
> 
>    # dmesg | grep smpboot
>    smpboot: Allowing 30 CPUs, 0 hotplug CPUs
>    smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x)
>    smpboot: Max logical packages: 1
>    smpboot: Total of 30 processors activated (125708.76 BogoMIPS)
> 
>    # iasl -d /sys/firmware/tables/acpi/APIC
>    [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Descript
>    [004h 0004   4]                 Table Length : 00000170
>    [008h 0008   1]                     Revision : 01          <=====
>    [009h 0009   1]                     Checksum : 9C
>    [00Ah 0010   6]                       Oem ID : "BOCHS "
>    [010h 0016   8]                 Oem Table ID : "BXPC    "
>    [018h 0024   4]                 Oem Revision : 00000001
>    [01Ch 0028   4]              Asl Compiler ID : "BXPC"
>    [020h 0032   4]        Asl Compiler Revision : 00000001
> 
>    ...
> 
>    [114h 0276   1]                Subtable Type : 00 [Processor Local APIC]
>    [115h 0277   1]                       Length : 08
>    [116h 0278   1]                 Processor ID : 1D
>    [117h 0279   1]                Local Apic ID : 1D
>    [118h 0280   4]        Flags (decoded below) : 00000001
>                               Processor Enabled : 1          <=====
> 
>    [11Ch 0284   1]                Subtable Type : 00 [Processor Local APIC]
>    [11Dh 0285   1]                       Length : 08
>    [11Eh 0286   1]                 Processor ID : 1E
>    [11Fh 0287   1]                Local Apic ID : 1E
>    [120h 0288   4]        Flags (decoded below) : 00000000
>                               Processor Enabled : 0          <=====
> 
>    [124h 0292   1]                Subtable Type : 00 [Processor Local APIC]
>    [125h 0293   1]                       Length : 08
>    [126h 0294   1]                 Processor ID : 1F
>    [127h 0295   1]                Local Apic ID : 1F
>    [128h 0296   4]        Flags (decoded below) : 00000000
>                               Processor Enabled : 0          <=====
> 
> The (latest upstream) Linux kernel sees 30 Enabled processors, and
> does not consider processors 31 and 32 to be hotpluggable.
> 
> With this patch series applied, by bumping MADT to revision 5, the
> latest upstream Linux kernel correctly identifies 30 CPUs plus 2
> hotpluggable CPUS.
> 
>    CPU30 has been hot-added
>    smpboot: Booting Node 0 Processor 30 APIC 0x1e
>    Will online and init hotplugged CPU: 30
> 
>    # dmesg | grep smpboot
>    smpboot: Allowing 32 CPUs, 2 hotplug CPUs
>    smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x6, model: 0x56, stepping: 0x3)
>    smpboot: Max logical packages: 2
>    smpboot: Total of 30 processors activated (125708.76 BogoMIPS)
> 
>    # iasl -d /sys/firmware/tables/acpi/APIC
>    [000h 0000 004h]                   Signature : "APIC"    [Multiple APIC Descript
>    [004h 0004 004h]                Table Length : 00000170
>    [008h 0008 001h]                    Revision : 05          <=====
>    [009h 0009 001h]                    Checksum : 94
>    [00Ah 0010 006h]                      Oem ID : "BOCHS "
>    [010h 0016 008h]                Oem Table ID : "BXPC    "
>    [018h 0024 004h]                Oem Revision : 00000001
>    [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
>    [020h 0032 004h]       Asl Compiler Revision : 00000001
> 
>    ...
> 
>    [114h 0276 001h]               Subtable Type : 00 [Processor Local APIC]
>    [115h 0277 001h]                      Length : 08
>    [116h 0278 001h]                Processor ID : 1D
>    [117h 0279 001h]               Local Apic ID : 1D
>    [118h 0280 004h]       Flags (decoded below) : 00000001
>                               Processor Enabled : 1          <=====
>                          Runtime Online Capable : 0          <=====
> 
>    [11Ch 0284 001h]               Subtable Type : 00 [Processor Local APIC]
>    [11Dh 0285 001h]                      Length : 08
>    [11Eh 0286 001h]                Processor ID : 1E
>    [11Fh 0287 001h]               Local Apic ID : 1E
>    [120h 0288 004h]       Flags (decoded below) : 00000002
>                               Processor Enabled : 0          <=====
>                          Runtime Online Capable : 1          <=====
> 
>    [124h 0292 001h]               Subtable Type : 00 [Processor Local APIC]
>    [125h 0293 001h]                      Length : 08
>    [126h 0294 001h]                Processor ID : 1F
>    [127h 0295 001h]               Local Apic ID : 1F
>    [128h 0296 004h]       Flags (decoded below) : 00000002
>                               Processor Enabled : 0          <=====
>                          Runtime Online Capable : 1          <=====
> 
> In terms of testing older operating systems, I did:
> 
> - Windows Server 2008.
>   By opening Device Manager -> Processors, and watching/counting
>   the listed CPUs before and after hot un/plug operations.
>   When hot plugging a CPU, the new processor shows in the list;
>   one more processor is available after the hotplug.
>   When hot unplugging a CPU, Windows refuses, with the message:
> 
>    The 'Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz' device is not
>    removable and cannot be ejected or unplugged.
> 
>   This is expected as hot unplug did not work in Windows 2008.
> 
> - RHEL 6.9
>   Kernel 2.6.32-696.el6.x86_64
>   Build Feb 21 2017
>   From dmesg:
>   ACPI: APIC 000000007ffe32f0 000F0 (v05 BOCHS  BXPC    00000001 BXPC 00000001)
>   SMP: Allowing 16 CPUs, 8 hotplug CPUs
> 
>   # cat /sys/devices/system/cpu/online
>   0-7
> 
>   (QEMU) device_add id=cpu8 driver=host-x86_64-cpu socket-id=0 core-id=8 thread-id=0
> 
>   CPU 8 got hotplugged
>   Booting Node 0 Processor 8 APIC 0x8
>   kvm-clock: cpu 8, msr 2830ed00
>   Will online and init hotplugged CPU: 8
>   microcode: CPU8 sig=0x50663, pf=0x1, revision=0x700001c
>   platform microcode: firmware: requesting intel-ucode/06-56-03
> 
>   # cat /sys/devices/system/cpu/online
>   0-8
> 
>   (QEMU) device_del id=cpu8
> 
>   Broke affinity for irq 24
>   CPU 8 is now offline
> 
>   # cat /sys/devices/system/cpu/online
>   0-7
> 
>   RHEL 6.9
>   kernel 2.6.32-696.el6.x86_64
>   build Feb 21 2017
> 
> Both of the above 'legacy' operating systems behaved as expected.
> 
> Regards,
> Eric
> 
> ---
> v3: 21apr2023
>   - Dropped ARM patch as there is no compelling need to move to
>     MADT revision 5, per Michael Tsirkin.
>   - Recoded the flags to be simpler, per Michael, Ani Sinha and
>     Miguel Luis.
>   - Regenerated the binary tables, as per bios-tables-test.c
>     instructions.
> 
> v2: 18apr2023
>   https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg02576.html
>   - Code formatting changes per Igor Mammedov
>   - Included the steps in bios-tables-test.
> 
> v1: 28mar2023
>   https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06705.html
>   - Initial series for ARM and i386 MADT revision bump to 5.
> Eric DeVolder (3):
>    ACPI: bios-tables-test.c step 2 (allowed-diff entries)
>    hw/acpi: i386: bump MADT to revision 5
>    ACPI: bios-tables-test.c step 5 (updated expected table binaries)
> 
>   hw/i386/acpi-common.c                         |   4 ++--
>   tests/data/acpi/microvm/APIC                  | Bin 70 -> 70 bytes
>   tests/data/acpi/microvm/APIC.ioapic2          | Bin 82 -> 82 bytes
>   tests/data/acpi/microvm/APIC.pcie             | Bin 110 -> 110 bytes
>   tests/data/acpi/pc/APIC                       | Bin 120 -> 120 bytes
>   tests/data/acpi/pc/APIC.acpihmat              | Bin 128 -> 128 bytes
>   tests/data/acpi/pc/APIC.cphp                  | Bin 160 -> 160 bytes
>   tests/data/acpi/pc/APIC.dimmpxm               | Bin 144 -> 144 bytes
>   tests/data/acpi/q35/APIC                      | Bin 120 -> 120 bytes
>   tests/data/acpi/q35/APIC.acpihmat             | Bin 128 -> 128 bytes
>   tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 144 -> 144 bytes
>   tests/data/acpi/q35/APIC.core-count2          | Bin 2478 -> 2478 bytes
>   tests/data/acpi/q35/APIC.cphp                 | Bin 160 -> 160 bytes
>   tests/data/acpi/q35/APIC.dimmpxm              | Bin 144 -> 144 bytes
>   tests/data/acpi/q35/APIC.xapic                | Bin 2686 -> 2686 bytes
>   15 files changed, 2 insertions(+), 2 deletions(-)
> 

