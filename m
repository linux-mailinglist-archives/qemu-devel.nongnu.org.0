Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4756872A4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 01:57:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNNuh-0007bN-N2; Wed, 01 Feb 2023 19:57:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pNNuV-0007aG-UJ
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:57:08 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pNNuS-0001D1-OV
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:57:07 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 311LES2H012334; Thu, 2 Feb 2023 00:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=oVCqz0HzerFUQ4QkMIMj3qn0mgwNBds//346yEMGG3o=;
 b=KFlo1dN+zC99/B2zL7/2Xaz1SHGjhaopwsFV4OusI0Uqm1zQZvVBl6URhrZ7IKYp2kti
 PZ6Ee5KWYIrCDlWFh6eDRqbvbiXaSK+bdCroBJqxZwwOWxL25HU7pyB8cIsHwL0XjQZV
 g0UufW0hkL7Y5mISyltIpz8tuLl/HPb6el65439ac5GTsxElWVmlEf39934mA3KG+iKO
 BlCXn25i5bJhAbDRDGxQBD01Ydbz69eb+WNThK7e7S6upcPYpmwyxeoPL1zqrIEHvA05
 VTTdw4Ked1rMo7auvTgCDI1e6gZd6jQpAKlQytz9UVBNtXsOEyMdbIKhn+ylqIwCaO+T jw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfkfe25d5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 00:56:46 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 311NJJqt003740; Thu, 2 Feb 2023 00:56:46 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct5fdtj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 00:56:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdVgcmhQrhd8USJcTIYfdqR/iOQhRqUgtg/GHdCl3A7zVTPixMuRgbnHUNT3BbX5IlvDLnsDK/JR27/VYoFlGWVI3ydSStuOEZZEZVsq3ddowpyb0PpizM/RT2FUvF49wHBTw1SZOWkrvR0dn+G+CQl/HFvCkgLmoR0Hf8Q5bSWFysGKLmyEeUt3OZGtCaNdJ6nY5b1ARKkttnr7uItuva55/NCcvtnzQJNLm5m/nEyuc8kRYovfEcvXiOKDgVO4Dd2oZbZpaOIsPmfukyaVaPtsc7KiEjnIgAn3DZfy2nkBYYjdPIYQgzS1c9KhIQweNPhZGYdIPJ2uHqZ+bIil1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVCqz0HzerFUQ4QkMIMj3qn0mgwNBds//346yEMGG3o=;
 b=Xlq53qt12fF4EmELhhxG1sai6GcIZ5CeDRKxDRL5haigLnweYrUYiWJFiyr9BtIJAA2ZCEQ2vu6HnRa2tfZza2COGVingzqZGG/2cOXfIzTTlHac4twa8jYCsuwLATmgIOJcttEktgGYhxN2Ic2pUPf6uCLS7HEHlvNN51X9y46KSKxk/du9db5dZlG+UANwwsh3ITR/dWc8dS6SpPH2wyVFNtFwa1ig1SaSQB9v44dLI3rNiBbkeacrdn3w1Gd95kkvlvQbfKSbQvAmnW6L0r4YFklAZGr3hGBHIP34MgNe3IK/v15wyW0yR2T+FBvIomEl1Ab8p8Ij8x62cyriAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVCqz0HzerFUQ4QkMIMj3qn0mgwNBds//346yEMGG3o=;
 b=KA4s5NaQuKe+qh1qTuAXW84CeJB7xYtbnoqUC7UieRahPv69Ce3p4jSf7W8H/EGR3DxThgw11CTEckQ4TXYFOZhiPdaZNS3YgBT3E/5sxC5NRIycjnLM2PXjmo/eNDKi6A8v47uweANYAeYx/vmFSBnWO81dnQpk/PvVD9tbWuw=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by DM4PR10MB7525.namprd10.prod.outlook.com (2603:10b6:8:188::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Thu, 2 Feb
 2023 00:56:43 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::cd0e:bbf4:4b15:308b]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::cd0e:bbf4:4b15:308b%6]) with mapi id 15.20.6064.024; Thu, 2 Feb 2023
 00:56:43 +0000
Message-ID: <a7367dec-2f96-c748-8f62-7bd03c3de263@oracle.com>
Date: Wed, 1 Feb 2023 16:56:37 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC v2 12/13] vdpa: preemptive kick at enable
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, qemu-devel@nongnu.org,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-13-eperezma@redhat.com>
 <CACGkMEt8cMM1UxVzxb0eHeaWSpR0ApvGzaF901vrM4m-uGMiPA@mail.gmail.com>
 <7438853f-8d5e-33fb-1e53-b4a0036f0b7d@intel.com>
 <CACGkMEtwcjExouCbnMrQ3TcAkXJH4mv63ud-ROEUu6mH+53C6Q@mail.gmail.com>
 <CAJaqyWfijv2doQ8OAiiWdYvrWtmLPwJcnFtO+aUuoTa0jSL73A@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAJaqyWfijv2doQ8OAiiWdYvrWtmLPwJcnFtO+aUuoTa0jSL73A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR07CA0124.namprd07.prod.outlook.com
 (2603:10b6:5:330::34) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|DM4PR10MB7525:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f1e9b11-54ee-4937-a346-08db04b859c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F//kWkNb2H0Vwf78R8evOPo2nNxHAEKFQEd/HsRWlG4aMlCe5W0Rcur4Wnjpzz4yTMFH0jVwtuDvfQjSgcfF1aMWFMK/N3XgOEkomBSUH+suxjvNNFJNCkKFOUQKJzg1P+/7rBFsLffK71kTFOdprw+CHfnQy2IgJWTjhOAWumgUSW0tFLyD2kCjRfK/OkYaI1ihcyn5P2RopnG9H0BfN/pxWB8O3DSt7CvM0oxJNHjchGSwPlWMD2ylihppv8TIvRU9VCLusP721DVhn5KZBfOgFl4qJTBTog8MLYcLtLbWYqkdRbaoYk91GkJ9inwSFA9v3JN19ozB2PWFy4sXi0/QJWUlxmoGpddYbprbQIRTYpSfDh0mZ6EZWV39ha+6E7XmQRhRVa5TOl1CYCTLX3zUvQyhJN07ww/4MbywBrn6DU3QHXVaAF/gmCja8eIG8ax0r2Hs52YEZ1Jc5n3oI8sotMPWGc6u9E/kj3+XwpHMzyV0zWGCUFod02McHz6LvrZ8EIfkDnsf9rivNJAgM6DuF6I6G7t0lmXd81SyHup/tWMihdb+AKl1jvHK+lwGeAWHw8KOToxfbg/cW37Mtc06gJI7KYl3PLqLoHFFQqRve48lYeNIweOuPphwCmvP+cK6gqtzo2ykc4XdCDLyfgcz6g5SkmM+zvf3NHvbAblk4dZ+2Jk8lI+yEtU0/8hlcuSvK+lC64KjTNKFnSYaj+ebSAQ8+U81pV8hGr+HpyM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199018)(316002)(66574015)(110136005)(54906003)(7416002)(5660300002)(41300700001)(8936002)(38100700002)(36756003)(2906002)(66946007)(66556008)(83380400001)(66476007)(4326008)(8676002)(31686004)(6506007)(36916002)(53546011)(31696002)(6666004)(6486002)(2616005)(186003)(86362001)(26005)(478600001)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVVLVjVVZEFDUG1QYlVzcGZ6TkgxdzY4Ylh4VkhrU2VTQytBRmhxVERhZ3RJ?=
 =?utf-8?B?eEVXdXpOZmtkYTh6VzBMRUhVV3hEQXhnaTVqSGk3VXNUNUwrUnZtTnpid3p5?=
 =?utf-8?B?RE1YQlZpZmJhU3F1aEk1dWxvS3JLcjErM2VvY0dlb2RjazltL3hFbHQ5VStP?=
 =?utf-8?B?Uml6aEF2dTBPT0JndmhCMFJMTjdWVFpDZjdtaGxSa0pTY0dFanc1SndMeWhm?=
 =?utf-8?B?TnF3a3VycDdPTDFlTSs0clNCMGN4UGN0NDVtM2ZJbHNYVkI4ai9ZdFI2SGhK?=
 =?utf-8?B?U042RUYwWUlaOWZQbmtZaEZ1YzNldVp5cFpGYWlXKytPeXhRb3Zvcm9ZL3E5?=
 =?utf-8?B?TnZ1QmRrSVBLN2pZN3RKRUZMd3Q4NGJqYjJPNGFLSllydVR3Wjk0bmZjNS83?=
 =?utf-8?B?eFpYb0FOTWVzUVRnTG15Y0lTWnY4QzJ0bnFmdDc0ZmVvRlJhNkt2VlF0S3Nw?=
 =?utf-8?B?R21JVE9NK0pXVWpLQXNuT0FBcnNUOHRmQjI4RXNOTTQ3Unh3S1kvK2hmYVNV?=
 =?utf-8?B?NUZ3cUJIR0JmSmFDcjBRNTNGdVBRRThzSWpMZkw4ckVIMTRXYTRWcnhvY2dX?=
 =?utf-8?B?VG5WeXBSZVM4ejk4TXJobEE2M0V3V3J5dVV5UkdsSE90UWNpcUVqRTMvZmFB?=
 =?utf-8?B?dWg5cjJoejFXcjA5VkNRMk8zM1RYRU54V3lwS2ZWbVdIckYzMnhkR2VCQTZH?=
 =?utf-8?B?dDIvVmRiNGpwcEpoVmMzOVJ1YWxCT3NKRXBORHZDR0ZoZUZBeFVvMHJSREll?=
 =?utf-8?B?aVNwMjZZVkZjczJlUm91bTZ1eGwreGVRcXBYdGFsNS9zdHRCbUpwU2k5c3FU?=
 =?utf-8?B?dkxWUFQrdjYxR29JS2FwOEJ4enYrOG1neVJHVkRIUlI4YW1Wci9FSis1V2Z6?=
 =?utf-8?B?aUZYakZxeDVZYnBhUmMrUllmWENSN2F3ZjJ6OXQ2djY4ZWVrVm1ydTZ1Tmpn?=
 =?utf-8?B?bFQzRkt0cVRUaldUV01GczZ1SXRqci9mSEM0YU8wR25iek94eHVsWGpVUDdO?=
 =?utf-8?B?MTVHY1ZrNEliM05XRUxpbkcwdmxONkN1ZVQ0NmJLdDR5LzNJSVRIejRwdyt6?=
 =?utf-8?B?czFTd1QyTUI4c3BiSGo5OTFWK081NmJwUkJzNkMyTWNDWWEwZjJJa04ranZX?=
 =?utf-8?B?dzYyRVJlT0F5K2hKRmdpTXQvMnNLSW5DNTBhblA4VzBwREZQR2ZNQVUxcTdq?=
 =?utf-8?B?cms4TjZsK3Nuc1JHSmFCOTd6ZmVoNGlNYzBiRllPNUVGOUVsdUJLZjRVOXRB?=
 =?utf-8?B?TzNOWEswUEUzZVhBanlGZkgrWXlrVDhzR29DY2k4akhObVZhVXU3YlVVa2sx?=
 =?utf-8?B?TUVQTUl0a05XUUFZaXcyamRjTExwZlhNNW5oNWtYWU9RQ0x5MjhiKzRyNndM?=
 =?utf-8?B?cStPcVg5TWFOZVhCT1J4SDQxSy85bzdjQnJ5L1RuYkJvbjl6cHgrcUZ4MVVX?=
 =?utf-8?B?Q3EyejQ2UDhXVHRBQUtkVWNXRU5CK08yekM1QjBlNEk3RXE4TFBaODFMWTNu?=
 =?utf-8?B?aExkbHlqMEZTQytTclc3Vkp5OTJGNDJWdkVMUm1sbXptcytMSUpDUFhIcUxu?=
 =?utf-8?B?MDJZM3lCc3N6MjJiRWpyZWxyY2kraU9DakFDSU92MVIvZHFPNDF3MGFoSUla?=
 =?utf-8?B?YnI4Y0ZOdnVTWkFNVzNjOG5ibUlNcmowL1A3T2ttUlIwbGNjVVg2aC93SEh6?=
 =?utf-8?B?M3BlMnRPT2h2OVdWNjJXZzYyVE5JcGpnQ3U4bTBGUkw4QzNPZU1MdHlFYkti?=
 =?utf-8?B?TTRLY0t0Z0puRjhOV3F6ZHNxTjZJSUlhOU9oK0gxalE0SWVDM1YwZlp4STZr?=
 =?utf-8?B?ekNJSVNDUlRBWnFtY2czTlFsN01TSUZLWFZkWlBiUmNLTmdLalhuSlJVWDVm?=
 =?utf-8?B?UWs5QkpUeHJlNE5wSDJTOS9ia0hicEJDdldXLzBBNjRLNWhjYnZrMFpCVSto?=
 =?utf-8?B?blZVSFpjdFNXdVpWVkk4cUVWcGY1YVQ0RWk4ZTF3cGpyb2QxOWhSN1g2OXc4?=
 =?utf-8?B?cHV6TjNRcUV6NzdTMHVaZ1FEcVNDbWF3cEcyb09GYytjR09VQ1J5OGJDNDJW?=
 =?utf-8?B?NEFpLzJJVVo5c1VzTWJkY2FMYUs2TUowc3B3OVlYWGtGVE9yM0VQZVR3cXJQ?=
 =?utf-8?Q?M5dkme6W5d47KA+0/fGTQCtqY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?S2RYMGhBV082Z3FqZ2ovWllGL3J4RzZPcHlja1AyckFFS0FoQWNyNkhSOEtx?=
 =?utf-8?B?Q3BjOVZGVjYyQWVaN0xJbjBtd1NvUU5pU1lPd0hwV3BrNmJJT01kaWFDS2Fo?=
 =?utf-8?B?ay9tK1VCTmNyRE02WGxBdEFzOStFTC84U2VZeTF3WkxkWCtZc1UwSVBuWWZD?=
 =?utf-8?B?Y0VlcytlV2lWS0VhVTA1dHlRQStwNnN3K1VucjFDQThmMUNtVi9lNlJucWov?=
 =?utf-8?B?N25MRmM2Snlob2pOcGhpaERBaFhsdkVQQWZqaHNkS1IyaUdaK0V3dlJ0OXVp?=
 =?utf-8?B?S2pWbkcwU3pQTjhTSnFUNVVrajZWNElGUjZCY2pBMUQ4cENKdjNXTFpCb3RQ?=
 =?utf-8?B?TDVZT3RHaHJSY0tQUUdOVnJieGN1Y1dwWFh2K1pTc2VoTkR4MzRUYThyUnpJ?=
 =?utf-8?B?amJrWVBtaDM5Z1BVbnJ5UjNMNTlabzNWVG54clFTcmhEcWpsU1NBc1lxODUv?=
 =?utf-8?B?ZmMzSndkcDhmRXNRcThiT0x2ZGZRVDRaRWI5c1ZmVUJGYThhOXE4ZlZIVkdm?=
 =?utf-8?B?ZUdKOC9PTTFTcFMwa0ZDaWZiYUhvMERCbWdCRlcvbm5GU0EyUnNiOTRPZ1RB?=
 =?utf-8?B?Wm13ajJqZUdvbmJTZnlPYnFhREpONTFhZVJyWnl3c3NQdWRES0xtQ1dPNWFG?=
 =?utf-8?B?TWVsWExRN3B6OXlJYmNNZjdVMXUvdStkT200djdmTUNyVVZNanJDcTJZM3VQ?=
 =?utf-8?B?NlBWQjdRZHVqaXFVVmJKNkg1UzJ3cnplVzVENXdydEo1aVF6eWRsZnFpZEtk?=
 =?utf-8?B?TC9XV0NaYk5ZcWlkUjFIMGNLd0tNaEVRbElHWE9jeDBPWDJQK2RYUXFMQUd6?=
 =?utf-8?B?d0w0bHd3Z0o3bGlweVpUTzJPVTd4OFJMZWg3eXRLSWtnSDJDTFhYTCtKNnp2?=
 =?utf-8?B?MFhHYXR4eGZuTE54R1pVb24xUjBLazdmRlF3Qy9iMEppVUl5b2VDRG9xMHNw?=
 =?utf-8?B?ZG14N3JxU0x4M3hoQ2lFbUNzdXhIVEVhQmU3ajNHYXhsWHNVbm1RdHROMkph?=
 =?utf-8?B?amF1Y3h2eVRSR2xSekFqTDJlRndKL0NZcEExYkp0dmNIZFVJaC9VRUFQMENQ?=
 =?utf-8?B?bWF2ancvR2k2RjE4MmRQUm96L2J4ZUhyNTl1VHhWYmxHcDlac2lFQkpoZE9Y?=
 =?utf-8?B?bTRvZUw5RXFjR1RtZ0dyTzYrZDBPZE1VZlZzcEhrMkR1OHRIbVM0UXBSMzhk?=
 =?utf-8?B?ZmVFa0V1UnpkMHRPV1JJaXBJQzNQM2IydFNvMnIvSGg0SEE5eTUreVgveUZR?=
 =?utf-8?B?MDZLLzVzRmEzbGJ6Nm1PeCtMU0xucTdKMVRyR1ZqOWdCNzhVdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1e9b11-54ee-4937-a346-08db04b859c2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 00:56:43.1509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfV4mw+L67SZP43leUTUnwVtfEpysd9OCJlQ9q0ml8dgL225HprT3ERk2YAoK3U3zFzSH0Vwx5pVwd/07H4pWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7525
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020007
X-Proofpoint-GUID: jP344la9r02wJLlb8W38awu_Gj8SIv5U
X-Proofpoint-ORIG-GUID: jP344la9r02wJLlb8W38awu_Gj8SIv5U
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



On 1/13/2023 1:06 AM, Eugenio Perez Martin wrote:
> On Fri, Jan 13, 2023 at 4:39 AM Jason Wang <jasowang@redhat.com> wrote:
>> On Fri, Jan 13, 2023 at 11:25 AM Zhu, Lingshan <lingshan.zhu@intel.com> wrote:
>>>
>>>
>>> On 1/13/2023 10:31 AM, Jason Wang wrote:
>>>> On Fri, Jan 13, 2023 at 1:27 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>>>>> Spuriously kick the destination device's queue so it knows in case there
>>>>> are new descriptors.
>>>>>
>>>>> RFC: This is somehow a gray area. The guest may have placed descriptors
>>>>> in a virtqueue but not kicked it, so it might be surprised if the device
>>>>> starts processing it.
>>>> So I think this is kind of the work of the vDPA parent. For the parent
>>>> that needs this trick, we should do it in the parent driver.
>>> Agree, it looks easier implementing this in parent driver,
>>> I can implement it in ifcvf set_vq_ready right now
>> Great, but please check whether or not it is really needed.
>>
>> Some device implementation could check the available descriptions
>> after DRIVER_OK without waiting for a kick.
>>
> So IIUC we can entirely drop this from the series (and I hope we can).
> But then, what with the devices that does *not* check for them?
I wonder how the kick can be missed from the first place. Supposedly the 
moment when vhost_dev_stop() calls .suspend() into vdpa driver, the 
vcpus already stopped running (vm_running = false) and all pending kicks 
are delivered through vhost-vdpa's host notifiers or mapped doorbell 
already then device won't get new ones. If the device intends to 
purposely ignore (note: this could be a device bug) pending kicks during 
.suspend(), then consequently it should check available descriptors 
after reaching driver_ok to process outstanding descriptors, making up 
for the missing kick. If the vdpa driver doesn't support .suspend(), 
then it should flush the work before .reset() - vhost-scsi does it this 
way.  Or otherwise I think it's the norm (right thing to do) device 
should process pending kicks before guest memory is to be unmapped at 
the late game of vhost_dev_stop(). Is there any case kicks may be missing?

-Siwei


>
> If we drop it it seems to me we must mandate devices to check for
> descriptors at queue_enable. The queue could stall if not, isn't it?
>
> Thanks!
>
>> Thanks
>>
>>> Thanks
>>> Zhu Lingshan
>>>> Thanks
>>>>
>>>>> However, that information is not in the migration stream and it should
>>>>> be an edge case anyhow, being resilient to parallel notifications from
>>>>> the guest.
>>>>>
>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>> ---
>>>>>    hw/virtio/vhost-vdpa.c | 5 +++++
>>>>>    1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>>> index 40b7e8706a..dff94355dd 100644
>>>>> --- a/hw/virtio/vhost-vdpa.c
>>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>>> @@ -732,11 +732,16 @@ static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, int ready)
>>>>>        }
>>>>>        trace_vhost_vdpa_set_vring_ready(dev);
>>>>>        for (i = 0; i < dev->nvqs; ++i) {
>>>>> +        VirtQueue *vq;
>>>>>            struct vhost_vring_state state = {
>>>>>                .index = dev->vq_index + i,
>>>>>                .num = 1,
>>>>>            };
>>>>>            vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
>>>>> +
>>>>> +        /* Preemptive kick */
>>>>> +        vq = virtio_get_queue(dev->vdev, dev->vq_index + i);
>>>>> +        event_notifier_set(virtio_queue_get_host_notifier(vq));
>>>>>        }
>>>>>        return 0;
>>>>>    }
>>>>> --
>>>>> 2.31.1
>>>>>


