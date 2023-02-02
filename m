Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8333D687331
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 02:54:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNOmr-0003MM-Ee; Wed, 01 Feb 2023 20:53:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pNOmo-0003M4-Ug
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 20:53:15 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pNOmm-0007Bx-3k
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 20:53:14 -0500
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 311LDqMW015727; Thu, 2 Feb 2023 01:52:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=XanZuH1/+vthPl5mdmIIHJCbJSRBPHq23xw659Y2bBw=;
 b=AePHwcDSMTfCkqWs7eoeAworL91JIgHG44RZ2iV4mQFNyODu0SIgnNJ4Nih4yjzXQpK1
 xP7WS3+zLuvwoN7joKtpgd1m+sY04FqmxgRAuU7HSE7SL10KCDgZjr9TKqTcw/hIyYCa
 rvsBRq9q/cyvXdIcq4UxMBLlh47b50EJzpeLjaoyxoVy8GiqaPylbYhobE0xSATWeyGP
 aVDRD6gjsMKuftv/OxVkwNs1p9xZE33HsScdAFWokJlEPCtLpiuzaKp+Ud+9h3NHZ3NR
 EUpKPE9XNAYR8NzFq4rw4xjUxnz9nY87cE1JfmYi6h7XZsiuS7HzkkfsGKtFHoEE/ocb RA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfq4hhrtf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 01:52:56 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 312184AO025157; Thu, 2 Feb 2023 01:52:56 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct58c61b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 01:52:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exeBCPjcTuSibNaxqNvYSeCyDC6APAaJYawppw0RKLCXThkfVhCpG/I/ZN+wHXPb1I11yheRelkD4IfRePYfUvTlV9HXTnghFJNhsjQMt3gSs2hx9A1YY2txvkFPgrTzYWe0qbZ6uNY/1DMLjkL/qnbgt451nIIesVJno4+/ZmW5aeGFUvtNR/dO5k5qz1liTr5ieJVTlaCnPfnPLgSX6MVKiUv/OZ0jY38YTD8P5ug9MSqTwK0rmk5KHSLKQsILZCztaYKs0U9mDVNyuVfFOWDrgXvrYp3+g3jvJ3NmLVCKHWxvkYp16zm7GpNmn+hy1jtQ/pnYVPBf9hjwBccopQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XanZuH1/+vthPl5mdmIIHJCbJSRBPHq23xw659Y2bBw=;
 b=SgaE6Oy32MRu20MSapyDbxzJzLWMNcZhG81lGi4nvglMaUCOH/2FuwV9l7Teiq1ZDr+/LVuUybUcqiIEJyfjfNMSPhCqib3usGWPopaiWJheXFw476YutgoKMjBxfyYp/gLNuZjlueRQtBE0geDKFeHQ3U3TpsOhwfKCdPmyvNVhcrIj70miRmY8135rGKJgS5wlfKc0UleO6lzSRKlU0QRuFefauQLxphrBphPxsr+I4aMTpagKaSUDurwVlgoNtJJAR4nZzvKldf0GC9+RwrdejFlSfkbXIq42h5kk/TSNY7I97kcOBCl0STaW5KzMbSWiExgbdmhmqGLM2h9pMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XanZuH1/+vthPl5mdmIIHJCbJSRBPHq23xw659Y2bBw=;
 b=YCwXJqV7XZ8ov3AuS0YF4fzRFG/Yk46/zlz5IhypTkxdIk0MbujJfQuPjI1KWUQ+1D1cAP8Busswwq8nCnAqk+DBWhCHEfSiKNekw9+95qyGMXI3LycNqkJObcPvAC75Pp2mCkpql9yaqIulGmYdouA1eyvBKmfOTlYSn0dEcv4=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by CO1PR10MB4484.namprd10.prod.outlook.com (2603:10b6:303:90::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.6; Thu, 2 Feb
 2023 01:52:53 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::cd0e:bbf4:4b15:308b]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::cd0e:bbf4:4b15:308b%6]) with mapi id 15.20.6064.024; Thu, 2 Feb 2023
 01:52:53 +0000
Message-ID: <d434e204-6847-f34f-258a-9ae1cf6328ce@oracle.com>
Date: Wed, 1 Feb 2023 17:52:47 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC v2 11/13] vdpa: add vdpa net migration state notifier
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-12-eperezma@redhat.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20230112172434.760850-12-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:806:21::10) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|CO1PR10MB4484:EE_
X-MS-Office365-Filtering-Correlation-Id: 802e8c51-9c16-4c7c-f30d-08db04c03282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w0yewyoa7tI3Wb+F8uTgN23t8vRdUQU/sidGEx+KE65+f4u7vBiKC1xmuoBqm1hs7AR+yvBO6oWEGDftLtkrzbqmmttkAmz6JqX90/C1hw36YUyKOnx/c7J7Ncd/1rn+P8M8r7ULABQNKGJXb/Sg7EvI/xn123P3oY+ozFuxNdcraIJmhmGTnhrlFpBtCRecureMDG+7RaHr5+ICqEJDsaPYWx9XtXknu1OFL8xIo4wPV43vQepBqU49/mslpqbX8nNYLLie1eV0bDZhH/VkFtjuXwLy/b9I83Z/5vjwr+cvxz09qxY46Gew+Erqo19aEFMPGZXmGhlG/1DuXv95Ui4ImAr01HMdH5ywqbvr+MTBAZvpAu46yqHtx+v/HXC1ADQvK0dA9ZaEzJF0+fkG47NmdnSlY6WTGxPxxMkd9E+ZBI6+mfk7ASoE3iHOm5cxNbVtbWX+abUXb0q8LDfnk4/gZ7rn9RezGadzjabFPjnfo5hFiCg6rnbjTPzq9HX7jSubiI2qLpBwahnw7qTkBKHa7ukGm5MuSLnEE9ULL5pjWNj6jm2TVteASfXmvmX1iPnGJq/oNvULbVYl2IkXjzWvmlHegawVWjRYAlh9jAyh52ua/Jivxq0kKHfhhfzlXLiFBpmbWb1Ky4CgQFi1WnK2paXd6MSWL5+WvuCkaI2WrnIhs9tzqUAlRtvRW4jJ7EMBPYG7clKpvdEsjbx8Thj0Y6CHUt+BNdR6bmfoEsA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199018)(36756003)(36916002)(6486002)(41300700001)(478600001)(31696002)(38100700002)(316002)(66476007)(66946007)(4326008)(66556008)(8676002)(54906003)(8936002)(6512007)(26005)(6666004)(186003)(86362001)(5660300002)(6506007)(7416002)(53546011)(66574015)(66899018)(83380400001)(31686004)(2616005)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1NmOStpWVpIU29SeThrNE9RY2tVRmsxY1ZBeFVmZFpyU280UFR3dVpNbk9q?=
 =?utf-8?B?aGdUVFR2aCt4TkI4TGpMRFRmRWtGQjY4dk9rOGp3eGpvK0ZZZldWeSthckV5?=
 =?utf-8?B?dFZLVGwvQUxBT2RDa0FjbnZKeHNFWFdtUGVsSDc5cDdTZjhLbVRrK2VDWS9W?=
 =?utf-8?B?S3QwMmV0VXA4NC91OHBIb1Y3VzFuazJyblU0dlkxTWZmSHJ2ZHlWOFpHNkpE?=
 =?utf-8?B?bTR3SEt2ckpYT2RiN1JvSTVLVUhxZ3lIQ2pRMk1tRU1ta1ZaUHNlNmFOdUxw?=
 =?utf-8?B?dURpRityektIUHNmR3I5bERqZmEyZDMrTjM0aDJkN0NSTDRTU2xEUUZ1WEZW?=
 =?utf-8?B?cDFOV0FrVkh3Y0dUMnBCOVdqa3NNNjY1ZTNxdnFuaHJHTlFhSUNSQlhNVDdj?=
 =?utf-8?B?K1VqRFFVcFFJY2NnOWY2RkJZa0hneHhWOUNIaFpNR0pHUDRBRjRHMnpFVWZz?=
 =?utf-8?B?cWZIbGZBV0h4NWJwTDdmb1l4MnFSY09XMkJhRkdVWXFudHpHZlh6MWl5QjJa?=
 =?utf-8?B?dTdYc1RZcjhBcE1WRkxOQUdhSmxld3lnRnkxYWJTaEdUMm16Um10TkRoUFRW?=
 =?utf-8?B?cVI4TEZLcTVMcU5RN29zMzFDZk54TlIrNG9tUnJjSW9GSTF4NkRVRlZFbjNh?=
 =?utf-8?B?YkVnMDdIMUsrQnhkTjRSMHlLYW9UMERvUFdnVWVLY3Z4V3o4MUhNM29MM21Z?=
 =?utf-8?B?Ry9iRm9abjR2bHk0SUc3Wkl4bDAycG5OeWNwdHBDRmZ6TlZYVTFTZThzclBL?=
 =?utf-8?B?TnZWdmsvZy94VlN0eTZhOVRzNlJRRzF4cGsyUG5ZdlU2RVJKb09XaDhzT2Z3?=
 =?utf-8?B?bGNJR2l0cTMzNlY3ZFBCRHhtME9GRjNpbDRudC9JUmZQREt5Nm9rMVZFSzB5?=
 =?utf-8?B?MlZXdkxkenc2SC9LdzdLNXJjMVNmSU5DUjNXZHhYWURIS3RJQTVRQ2M4RC9q?=
 =?utf-8?B?UDJoMHNRTXluT3M3WHpROEtoVFhyZitGYUM0bTZqVmRBMEYzTHAvUTd5QnV6?=
 =?utf-8?B?SlVFNC9NUll3cWQrR0pDdUFYalRwSm43UmdrMFdndERBWUhxWWY4dG5PUzNS?=
 =?utf-8?B?amVSVDRYUG8rZlhYQ1RlY2xCT3FKdHA4Zk1HN1ZKd1FYRVA1dms2Z1EyNXVL?=
 =?utf-8?B?NTE2cUFnVHRwOE1CU1lkcllMMUYyWWhnSUo0V1NjRkEwTVJEc2d6bDErNFVa?=
 =?utf-8?B?VG0rVHFxRkdQalpORGtpRVF0d2dtLzVnUEJzWk42TXRuVFRNaUl5QXBZSEF5?=
 =?utf-8?B?TmpsOEUwL2ZzMkJ2Q3lEQitUci9wZlRpeTJyRUlOTFYxeUNBMEJ5SUx2WWQ0?=
 =?utf-8?B?eklXd1V5M24vZHAyRHN0L0NaV0NhUE9WZElGVTY3VGNBZXdGcjU4MkltbGNm?=
 =?utf-8?B?MFE3ZHplREJUaWErN3VmVlZJSjlFNGJHc1d5M2U4bkNsSWpVcDZvdTBnMlNV?=
 =?utf-8?B?aFpQTjJiR1BsblNjVUlGOTd0M2VpMW10N0VNSXBDYTFEWGxtY3FvWklyMDR5?=
 =?utf-8?B?UmNCSTBISjlqV2o2bFd4d2d1QytwRkZ2QUpGSDFZOXQxSndLNHd6OXF1VDBF?=
 =?utf-8?B?MzY1Y21SZ0Z5eEU4R20weGFWMDNuN3M2d2hnak5Uckc1NlVBNElJQzQzTmwy?=
 =?utf-8?B?QlVDTk84eS9IMkdIbWV1Q0hsSm41QXYwakQrQWdjeTNhNkcybjE4SkM5Kys5?=
 =?utf-8?B?VzBPM1RTRWlEL1dWdVNEMXpTcDdrNXZ2KzdyMHlTMk42ZkRmWktHU2tWbWtD?=
 =?utf-8?B?Mk5KTHZ4eGhYTzFONzhrWDlELzJTVVBkdldQOWNYcHhXeXoycGsrWnNSV041?=
 =?utf-8?B?bC9PclZrSFEreUdNb2t2THMvbVVhNGwyUkJLejY0WDE3Zk00dERxWE42S0dJ?=
 =?utf-8?B?QUNHcHdQOW94U3ZweHBJeTd5cVBzeTkzV2pDY0tLWEFxNXlCemFVRHBiTTZO?=
 =?utf-8?B?bmtBbDFsaE1JbEVoWE9adGVpWnJJQy90dUtnbjBka2JxYjFqcFNsNTVzNHBw?=
 =?utf-8?B?YU1OVUZVOEZrU3B3OW95L0lUYjYreWhTTC9iVnRtUmY3dWxJeTNpeGRQa0dQ?=
 =?utf-8?B?MVRNeldtcTR4bXdYNFA3RTYwT3lURkVyN2h2aXlWRTRNY0JEakh5UE4xbUJP?=
 =?utf-8?Q?HrcspEmjCz0gXP0dDT7QnCM8B?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?VlhJbWdnaEM4SUdCOUd5czREcVExYWdDRmtTcmpkWTczWTBQL2pjdkVCdFVh?=
 =?utf-8?B?cjFLOHR5SHp4UVBoV21xYnZwKytxV1Nlb3NKOTkwN2l1R3hCVE94bUdmcExE?=
 =?utf-8?B?ZlFnNDM2ZzJCeStvVWFkcjhZMVVINEp1UTBCbzMzSmJIT3lDcXhaTktTODNx?=
 =?utf-8?B?NTJQaHlOWGdiVFlvd3dxOHU0UmJnTG50eXZ3WnFINTdiamxhZXFDVFYwTDJH?=
 =?utf-8?B?T1ROQzU5cmdnU2tvN2dNK2FxMEZEMmM0aGdpQ0NTZEdKV0FFRXVrcXdzNitm?=
 =?utf-8?B?SXliWFNicFhjTDlwdmloTnJLQmc2N3FmLzZBY2liSkVHcVhFcjRGTU1TbHUz?=
 =?utf-8?B?R0kwMzBWbTZlckpFZ2E5UHZiOWdoTW5ISVRtUlNRRWwzVUpaQTZKckJNa0JH?=
 =?utf-8?B?VEpMektMRDVjYWVJeDVtTDdYamZIaXVXQng2UFMreVdjeXhvRHdpckpST3Zv?=
 =?utf-8?B?c0NzZkZMdHRLVkVjNkRXS3pKaTBrL1oxU29RNGdrbUR0VWkrSFJDbkdoZlJk?=
 =?utf-8?B?eEdYVVBBMVdWaFh6OGlJRlllQ3hZNE1CYjJpNFBvNWNKeTMzT1QrWEw3YzRs?=
 =?utf-8?B?Wmo5bXFaQWMzM0JZTFN0a0djZWpuYUtPY2dydDIwQWxlcVhMeGdtVysrZ3Vm?=
 =?utf-8?B?S0hhZEh2NFEwak4wZDlDL1VHZGxucnRoM1JSWW4yRFFyWTlzNkpjUGsxbGpP?=
 =?utf-8?B?TnptRFZFMGRxZ2xDSC9CckhFbFQ4N1cyUHJvVXRhRVRjcEwwb0syYW5wVHcw?=
 =?utf-8?B?a0hjb3pLTENkZm1DNldvTm54MDJXWXBiUytMTmRlS1JGMVVYQzFVUVZ4M1Ra?=
 =?utf-8?B?UUFNQ2VtRlZFb3NKL1F5OVZZTWdMWUszcUU4S2h2VnFxcmNkZnVDejlUMEtF?=
 =?utf-8?B?REJQZDJFUkRQTkM0TGsxNGx5SnJud2JKZzVkaGZRWlZnbm5TNnY1ZEE1SXVI?=
 =?utf-8?B?SVE1cmxVYjZCWW56ZEl2MU1yUkczUDdZTlNQaGFnNVM4NlFLT3M5TmMvVldU?=
 =?utf-8?B?YzNYSHhtT0dscS96bG9jaWREeHlmSGErb2swWGJBZzRGTWhsQUtscGZvbWRj?=
 =?utf-8?B?a3ptTGlZYWVPTXl1cDFGejhZZDE2YjFqQTE0MGR4ckcxQUNMaXlBUzAxYmxo?=
 =?utf-8?B?TlRQc0FydjNLbVZtOGxseXhWVDhHQUNnYXdJZDgxLzF2cTdYSUFmNkZORWhw?=
 =?utf-8?B?MVBxZytxNXFnTWdMM3VBQVB3UmZKV0ZhNkk3TFl6emdOMCtMRUNuYSsrdGZR?=
 =?utf-8?B?SzU5NlJiVjBja2NxY1RRRkRPMmh0THpjL0xFQ01GTHJiUUJzdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 802e8c51-9c16-4c7c-f30d-08db04c03282
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 01:52:53.2762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mlf7lapd+Bl1cBA5YSZZSc+ZtEH6Hquy6JYVrgPlKo92iig19cEs+da1AZvoWzErTfi7AeacVj5U4EkJ6FiE/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4484
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020015
X-Proofpoint-GUID: FACeiY-qk2TxstaC0IpIT6C7fFbkCFKA
X-Proofpoint-ORIG-GUID: FACeiY-qk2TxstaC0IpIT6C7fFbkCFKA
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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



On 1/12/2023 9:24 AM, Eugenio Pérez wrote:
> This allows net to restart the device backend to configure SVQ on it.
>
> Ideally, these changes should not be net specific. However, the vdpa net
> backend is the one with enough knowledge to configure everything because
> of some reasons:
> * Queues might need to be shadowed or not depending on its kind (control
>    vs data).
> * Queues need to share the same map translations (iova tree).
>
> Because of that it is cleaner to restart the whole net backend and
> configure again as expected, similar to how vhost-kernel moves between
> userspace and passthrough.
>
> If more kinds of devices need dynamic switching to SVQ we can create a
> callback struct like VhostOps and move most of the code there.
> VhostOps cannot be reused since all vdpa backend share them, and to
> personalize just for networking would be too heavy.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   net/vhost-vdpa.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 84 insertions(+)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 5d7ad6e4d7..f38532b1df 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -26,6 +26,8 @@
>   #include <err.h>
>   #include "standard-headers/linux/virtio_net.h"
>   #include "monitor/monitor.h"
> +#include "migration/migration.h"
> +#include "migration/misc.h"
>   #include "migration/blocker.h"
>   #include "hw/virtio/vhost.h"
>   
> @@ -33,6 +35,7 @@
>   typedef struct VhostVDPAState {
>       NetClientState nc;
>       struct vhost_vdpa vhost_vdpa;
> +    Notifier migration_state;
>       Error *migration_blocker;
>       VHostNetState *vhost_net;
>   
> @@ -243,10 +246,86 @@ static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState *s)
>       return DO_UPCAST(VhostVDPAState, nc, nc0);
>   }
>   
> +static void vhost_vdpa_net_log_global_enable(VhostVDPAState *s, bool enable)
> +{
> +    struct vhost_vdpa *v = &s->vhost_vdpa;
> +    VirtIONet *n;
> +    VirtIODevice *vdev;
> +    int data_queue_pairs, cvq, r;
> +    NetClientState *peer;
> +
> +    /* We are only called on the first data vqs and only if x-svq is not set */
> +    if (s->vhost_vdpa.shadow_vqs_enabled == enable) {
> +        return;
> +    }
> +
> +    vdev = v->dev->vdev;
> +    n = VIRTIO_NET(vdev);
> +    if (!n->vhost_started) {
> +        return;
> +    }
> +
> +    if (enable) {
> +        ioctl(v->device_fd, VHOST_VDPA_SUSPEND);
> +    }
> +    data_queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
> +    cvq = virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
> +                                  n->max_ncs - n->max_queue_pairs : 0;
> +    vhost_net_stop(vdev, n->nic->ncs, data_queue_pairs, cvq);
> +
> +    peer = s->nc.peer;
> +    for (int i = 0; i < data_queue_pairs + cvq; i++) {
> +        VhostVDPAState *vdpa_state;
> +        NetClientState *nc;
> +
> +        if (i < data_queue_pairs) {
> +            nc = qemu_get_peer(peer, i);
> +        } else {
> +            nc = qemu_get_peer(peer, n->max_queue_pairs);
> +        }
> +
> +        vdpa_state = DO_UPCAST(VhostVDPAState, nc, nc);
> +        vdpa_state->vhost_vdpa.shadow_data = enable;
> +
> +        if (i < data_queue_pairs) {
> +            /* Do not override CVQ shadow_vqs_enabled */
> +            vdpa_state->vhost_vdpa.shadow_vqs_enabled = enable;
> +        }
> +    }
> +
> +    r = vhost_net_start(vdev, n->nic->ncs, data_queue_pairs, cvq);
As the first revision, this method (vhost_net_stop followed by 
vhost_net_start) should be fine for software vhost-vdpa backend for e.g. 
vp_vdpa and vdpa_sim_net. However, I would like to get your attention 
that this method implies substantial blackout time for mode switching on 
real hardware - get a full cycle of device reset of getting memory 
mappings torn down, unpin & repin same set of pages, and set up new 
mapping would take very significant amount of time, especially for a 
large VM. Maybe we can do:

1) replace reset with the RESUME feature that was just added to the 
vhost-vdpa ioctls in kernel
2) add new vdpa ioctls to allow iova range rebound to new virtual 
address for QEMU's shadow vq or back to device's vq
3) use a light-weighted sequence of suspend+rebind+resume to switch mode 
on the fly instead of getting through the whole reset+restart cycle

I suspect the same idea could even be used to address high live 
migration downtime seen on hardware vdpa device. What do you think?

Thanks,
-Siwei

> +    if (unlikely(r < 0)) {
> +        error_report("unable to start vhost net: %s(%d)", g_strerror(-r), -r);
> +    }
> +}
> +
> +static void vdpa_net_migration_state_notifier(Notifier *notifier, void *data)
> +{
> +    MigrationState *migration = data;
> +    VhostVDPAState *s = container_of(notifier, VhostVDPAState,
> +                                     migration_state);
> +
> +    switch (migration->state) {
> +    case MIGRATION_STATUS_SETUP:
> +        vhost_vdpa_net_log_global_enable(s, true);
> +        return;
> +
> +    case MIGRATION_STATUS_CANCELLING:
> +    case MIGRATION_STATUS_CANCELLED:
> +    case MIGRATION_STATUS_FAILED:
> +        vhost_vdpa_net_log_global_enable(s, false);
> +        return;
> +    };
> +}
> +
>   static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
>   {
>       struct vhost_vdpa *v = &s->vhost_vdpa;
>   
> +    if (v->feature_log) {
> +        add_migration_state_change_notifier(&s->migration_state);
> +    }
> +
>       if (v->shadow_vqs_enabled) {
>           v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>                                              v->iova_range.last);
> @@ -280,6 +359,10 @@ static void vhost_vdpa_net_client_stop(NetClientState *nc)
>   
>       assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>   
> +    if (s->vhost_vdpa.index == 0 && s->vhost_vdpa.feature_log) {
> +        remove_migration_state_change_notifier(&s->migration_state);
> +    }
> +
>       dev = s->vhost_vdpa.dev;
>       if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
>           g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
> @@ -767,6 +850,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>       s->vhost_vdpa.device_fd = vdpa_device_fd;
>       s->vhost_vdpa.index = queue_pair_index;
>       s->always_svq = svq;
> +    s->migration_state.notify = vdpa_net_migration_state_notifier;
>       s->vhost_vdpa.shadow_vqs_enabled = svq;
>       s->vhost_vdpa.iova_range = iova_range;
>       s->vhost_vdpa.shadow_data = svq;


