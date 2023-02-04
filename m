Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F9D68A993
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 12:06:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOGLZ-0003J7-Pa; Sat, 04 Feb 2023 06:04:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pOGLW-0003It-8L
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 06:04:38 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pOGLT-000808-BD
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 06:04:37 -0500
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3143Si9U016065; Sat, 4 Feb 2023 11:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=7VYNJ4tuXb+7gmMlmm79keAqeijSUCUzRHbgrx3kFSo=;
 b=1j9gBTj0gAu45PnlTAl7XapO882W/Bqcc8p7C0P31vG2Snm6EI0oJHcfQbxqq5+fXMVe
 X+khCGQfTWhSP413W0ybivwGWog9drFtdqW4mPs16NebYxZMAqmmmveVtSzPGb1wXFnz
 ScpObmkL2fO7typX/SUI3n6j23TWnHP3APkkeYrPcKdYLxIi3lT9gNAMfz2D9mXV50vd
 XlKGMAGUpz+pJRLAIzSzpUEgIk1X0pUJP9E0xkHJoSQGKcnyZR4Ky2CpB+FrXAektHq2
 SoMmG3L7aw5Xf9LzVoO06h6R/uS03tkqmtCm9SF2FbL75Ip5gtF9PDI0O2/PtR/10/UN XA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhfdc8cch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 04 Feb 2023 11:04:12 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3146XTmw011568; Sat, 4 Feb 2023 11:04:11 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdt2t9kn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 04 Feb 2023 11:04:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RV2397cim/gjI7Nzm8UMuqkx1i7jQMf0ih5+/9ZTlb84c9iNdJ/ncRuI/toAP7S70ve8LPCU7k8Q2SLwvQhG0RR0jQkr3DF9hYBXBrQna9C2nbl1IMeFI6Box8rt9YZ2KuDoYeSOZaOmo7491neF6LJ9HZbBMtKeUAj1FbsZFvV/xPKdlJQf5dLnef7+b4JvsEPo69dFsRQ5wmJz+eagjSb8pB1Sl8uKQgNEFSstZCJ/kWeFdjsUkzyVAs0xqu/oCuexiVl7By1jRjyYp3XLs6RMxhEIk6MlJH4lQTL2BtoTlnETw/e2AokbMWQPB4upjzGZCEaMG30+5SNBkEhnZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VYNJ4tuXb+7gmMlmm79keAqeijSUCUzRHbgrx3kFSo=;
 b=TevGn4Gg2LRlE44AmXkn6/G2n3xO1t56eOTknTbV6jcz7Cve9cG+OtEcROVx2CnHQg3TghNBNyuZFt1qSfuwlUlulBtrHT/n+TlbOVVoX1Zbz3uazXf1PJuvm03GM3dwNgvJ6Yi4yzX8zAh1Z7icTZqEsr0qW1l2yShC+qCfnqeDSWSbRYq0D8iqHH2RK5H4rNki+S+mOq1P/YrEQk+mLGcH8YHoLLXFnbZhzGTpsQ/8/zHWU15h3W/C20FVyXYjAYD49b8Yt77/oObeuZr+KV6pn6QBTsdNzg4+m+3McUiULL8HDSGX/ZUsghDTzwYAVTjLZU4bV5P5V2bjQM9tbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VYNJ4tuXb+7gmMlmm79keAqeijSUCUzRHbgrx3kFSo=;
 b=RkKwZKUF7S+NMWPmLyLiZAklagxYmJCOwuZlZ8aSvf+0Q9F43uWlJef2j0fJJSs4KoqysOqztrwF98K2AXXEBxDcqQMVqqsoQB2M0RPWc4Nq/SMNucbgRj4PkfKtnBhVcnlWE6frUNPglTvay+CM6QppanAj15TPVAxOsj8ICW8=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.7; Sat, 4 Feb
 2023 11:04:09 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::cd0e:bbf4:4b15:308b]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::cd0e:bbf4:4b15:308b%6]) with mapi id 15.20.6086.009; Sat, 4 Feb 2023
 11:04:09 +0000
Message-ID: <fbb445f5-05c5-dea4-b694-9b001e342091@oracle.com>
Date: Sat, 4 Feb 2023 03:04:02 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC v2 12/13] vdpa: preemptive kick at enable
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, "Zhu, Lingshan"
 <lingshan.zhu@intel.com>, qemu-devel@nongnu.org,
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
 <a7367dec-2f96-c748-8f62-7bd03c3de263@oracle.com>
 <CAJaqyWe3d0i85DS2+yS9nZ6dZkcXyOEmYng-vKVk=6G3Ty-mfg@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAJaqyWe3d0i85DS2+yS9nZ6dZkcXyOEmYng-vKVk=6G3Ty-mfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:5:333::29) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|PH0PR10MB4615:EE_
X-MS-Office365-Filtering-Correlation-Id: a166c922-1f74-4a67-7087-08db069f89d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NXMxxTdxjwEOZCMQ8G30WZhK2yZh1jmiyCoyG+0uF3HushZ+X4kJXpY0ENrfXL2MkVeApHNK6ibBynoUZO8xFeDeVx2IX+lw7/U9Ce6bVeU893XzFYqhEJpwlho3t0r6h5IlcxCgbcCm92sejXON9Mbs9hZP4YMPtEy1qcfls+FFr7alQ+x5npbLDHdh/O5WxSAnCLmi5T2kAPtwpBNPbWNg1n1hiyHaC9rYcMEWxe5w2v5nuq28rpBM7vJdZL6EeGBLm9eqsvCL2DnmR3IEW8tbFP9NH7ptebYnfqAUbR/ERH2kpjllLjkYqgdNoX919NzjxiIi5V123LHrMc80LLNfCeanwFLFJAgniKW7hkaPxIf9gkwQo++WSjPLUIbt2LyFS9vxdwP1oktBvI3JAEfHXDJfIwALbTHH+D3+3qzpV9NnDnQNtziX3fmLSh9ICEuCc5YlAjaYKJ/2I7Gam3APsQ3ImgqLtFXqqfUXAyoGNQ2jF7arXdyPUlD4mClXXgKXbdmvxS59ONce8tM5rDMz6WWxzVahK3aMJG26WKrWq5lRWKiptsMmMK9wwPrt56H/RJUV32G/nuXBUykcHUq6j6no4uVdvJ6wBN8yi0EDs5njWkVvfRP0LDcV7I6YYNVftagFe4nKmFTP85TcnsZNHcH4hzL1RloxYR7l9jvylZP5/Zq7FQ2YDHhLC1ujnvbnXaguq79ghz8Keq2TkV6CwuG1iYf61TzN8Epw5gY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199018)(31686004)(2906002)(86362001)(41300700001)(36916002)(478600001)(36756003)(7416002)(66574015)(53546011)(6512007)(6506007)(6666004)(186003)(26005)(31696002)(6486002)(2616005)(8936002)(5660300002)(38100700002)(66556008)(66476007)(83380400001)(4326008)(6916009)(8676002)(66946007)(316002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGVybGwrWXFnaGxIdm9MUFllajNGdjZUTXVZTnhyRzYwalNOb090Y1NsS2Jm?=
 =?utf-8?B?Q0ZLb0VNd29NWDZTbktBZEhsTjh3UmtCN1lPTWFGdzZERXQzeStGVGpFYmRi?=
 =?utf-8?B?RklBMGd6QW80dXpzVnhuZFdDbUJuWjhDVFhpdkFkN0hMRnlxZy8xbmVMV2VU?=
 =?utf-8?B?QW1QeVpBKzA2c0FobjB0UEoxY0tJa2UyRjRYdkRhYlZkeTlxVmxBdktOTHlC?=
 =?utf-8?B?RG5xbUlnWUVmVGpvbkxvVklRSWpsN1FyZU1QcEJOK2dZRDJvSjloemtVT1Nz?=
 =?utf-8?B?MjVUZnl4aEtnMXVZNzBvbllBbjNTU1FzazgvY0g2WVNnYmFvVzBHcVRSNFhR?=
 =?utf-8?B?UXpQYUs0SjkxdExTQklLU1VwSTFXOWE0TEVvRFlzKzZRaHBwbjZaa0J5UDJv?=
 =?utf-8?B?a0txaklJWW9ETDdCL2RHcHQ5MlhyekdHZHpyaUZmU1RtMjVYWlc5RVk0dERn?=
 =?utf-8?B?MFI3RjJSTkhwcmI1czAveWVIVm1ndWIwSjlOMFJubXE1R2UvQTMxNFdxekFX?=
 =?utf-8?B?WWl4MS94WWt1eFFVRWMzZW9SdW85TVd0Z3JEVXNaWDBFcEZBT3E1VWtlZGk4?=
 =?utf-8?B?RUtOZDBMVmhqTVpCOFlPRFUyOXo4VjF5dkpyLzVVTEk1eHNmZm00emtsVTRK?=
 =?utf-8?B?bkwzWEpJYVpreHJkQzBReXlEaTJ6eUJGRXNrQzh4MUhvRW5QSzZGMFRNSi9u?=
 =?utf-8?B?cVppY0dkdnMzbHZWeThITjR0Z2ZlL0h6MDU3eklaZks1RXZSdm5mMnp6SVRP?=
 =?utf-8?B?UmU0d3IwcTZGUldJVmlQNGp2Syt1cTc4TzA1QW5vVXA4VGFPb1JyVm03Q1k0?=
 =?utf-8?B?Z0Q1RlQzVXN3U09lSDRRMFg5VjFkR1ZHcjVIM2JNa3d3cWRQR1RQalFuYmJK?=
 =?utf-8?B?VFdzWXRPa2RES0FHMk11NFd0bmRQZ1lUcDQ5RUpJZTQyUmVuNHJzTUhDMmFq?=
 =?utf-8?B?M3A3amhMSy8zK0hjUVZCY2FGT0lJU2srTE52NG1sWklsbG9xdElOTDU4djh1?=
 =?utf-8?B?SFpCZDRISGY2WnZEdkJTTk1qM3l6akNyL1FkWW9WVUt0RGc5MlM3bDFueDFJ?=
 =?utf-8?B?UGc3S2k1eVVoakFmOGdtKzV1OEtheE96L3lORGxlRW1odmQxZHU3ZkppUUFL?=
 =?utf-8?B?NW1vd1M0ZVErSnJSMzRVOWtENUdlR2cxZXZjU0dYU2ZKZnpiOXZjSDVJdys2?=
 =?utf-8?B?M2ZlQTY5a3ZSdjYxa3FrM1BaaEdJekxZeDRaRXhidWJMQk1pUDFVTWI2WEVW?=
 =?utf-8?B?eWFjVThyWlQwblNDRGUwNVBTWHIrRFNaWW5RbVJkblZvZk9kcjVBd3dYY2hD?=
 =?utf-8?B?cXZFdUdyMkdZT3RhRmlKTkx6WVdPejVNb1YzdDAwUktNVFdNdDdNb1ZibmFE?=
 =?utf-8?B?U2trSVR3bXdJL2VjNDBDczYweXZqZFJIdVl5NmZOTitiQWdHbmJwLzRnRmNm?=
 =?utf-8?B?c01aMTYyUGI4UEcyQy93cnhoK1Zhcldia0xraHhtVmZ2VmJMUE1samkvRGVm?=
 =?utf-8?B?dk9OQ2J4T1kyVXVxMG8xUmZVTFI5NFY5U3cvQkZVcFBoZlF3bnR3OEV6Uyt2?=
 =?utf-8?B?KzRZZ3Zwdm1MQUR4OXhlQ3ArR1ZxakdiaXJhS3V2ZTVyVFdiUDZXN0hGaWg5?=
 =?utf-8?B?VkxWOVBnalRYb294bmpteDBSMUx5bldqQlk1SU1KTVNnYzV0bEJJREFkb1E3?=
 =?utf-8?B?Y3J3a2c1MnVJY2ZKLzFVS1lXSDBQbU5oZ1N2YXRiUzhudGQ5cFRpdllPejVk?=
 =?utf-8?B?eFBtcWk5UDRySEZNc1FGUEpGTHlLWjdxcSsvMDV2bU9lNFAwczh4RENDNDlK?=
 =?utf-8?B?cXZaY3JWWlFjUUhiZVJGbUQ2WXFXM0F5NjQ1QjNWbi9RSUQ0Y09Tc3ZZOVp2?=
 =?utf-8?B?UGh1Y1Nsc2FMTTNIVFJpTjVsdjFEdkVxVzdCd3M1Z1B1aFVWcTcyQXBtZ2Jr?=
 =?utf-8?B?U2RLWDZUQjlXT1pDWWZ2ZzNWUjErakMrSUphbXNheThObUk2Ky8xeG5JdjQx?=
 =?utf-8?B?L1dMZy8zZ0pDZVZON3hETG1iVkFZQmpUQW1wb2w2eTM5ay9SZWpnMHpYMVhN?=
 =?utf-8?B?eUtPQjBQSzhHOEsyWXY5Vnd0S0pxdWJaRy9UQjBLbXc2UWhocUJFTkdHZzlh?=
 =?utf-8?Q?sN8QGlizoh/w0CUh8WpYJUGmL?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?eEl0dW1seXZEcnBrckdlcG9uR3BBZmxaak96VHppRXo4YVRQaGNjYVYvcUNs?=
 =?utf-8?B?VFhIWTBwalRHSTdFRDA0TG56M2NHTW9RN2RnU2Z5c3R2WERqNmsyeFhxTEhD?=
 =?utf-8?B?WHl2T2RXMC92SGE2NWF1U1hoMmZzMW96UVVZSXpRMDJHYmc2RXh2UzZKSTEw?=
 =?utf-8?B?VkNld0E0TWt5K3oxOStCcGRFZStPZTRsaUxjekpwMVFRd0VPMVIrMXkvS0s3?=
 =?utf-8?B?SGNVM3VkK0htYnFhZlkvemdFenFMS1BvWDlDcUM1WCtkVjYrdktsMG8rYkpt?=
 =?utf-8?B?dURIdHRuZGVJcThBSEg0ZStYa29MTDgyT3Y0T1ZqbXBCWGJ2MkxXeDdjTDZa?=
 =?utf-8?B?ck55SU9ZSFhyUmI4cnhLV0FERm13ZHhFbm0vcThnSlh3RVpUcjQveTZFTXNw?=
 =?utf-8?B?UkptdmhKRy9JRFkyWFVaVExoMXJ2c1E0QXFlQiszREI3SEt5ZEJpc251dmhz?=
 =?utf-8?B?amRKL0loV0gwMVN6Y3BhWXE4VkttNTFGRFdKOWpBMURScXZJcHl3UjdSM29W?=
 =?utf-8?B?N1RvR2VXV3pyRmtiUzJmbWtqUWx3TnNFeGltKytHS3BxaDc0bWRTZkZHcm4v?=
 =?utf-8?B?b0NJeG5lQU5HNWZVODlLSUlOeXM3V0ZlZEx6S1l5Z1k1RHFOWnFRRnZLdVZ5?=
 =?utf-8?B?Y095elBlaGZVbENZUStvaEJyWVlnTUJ4Ni9PVWFPNWtES2tSaVZhTWRRSXNi?=
 =?utf-8?B?T1pHQ25QYjl5d0IzN0wzeCswUVJKcmYrN3Jxald5U2gzeitWKzBnNkhqR21m?=
 =?utf-8?B?UGZUdkVaOFVDaVZKL2p5RWlIaE9FVFdHQ3pmN09hR1VOREhaTUFINjNud1Fq?=
 =?utf-8?B?WTJmK0xKVFlZUlR4eGRqOGl2V3FRN2FYWXk5b1lmTHdTWmJnV1RNTzVtZ1NJ?=
 =?utf-8?B?Uk5DR1lrbnAzNDNOYnZaNEg2VjN3Q01Jc0tyK0tZaFY5di9ucHo4YkZ1RmlI?=
 =?utf-8?B?dFhJelNOQUtlMVFYRWpURGU0and3aXV3am9WVUpUelJmekxZZzRILytoSWVm?=
 =?utf-8?B?d0tIVmRqZU10OFkyam9KKzJSbXdndDAwV0tYbDdJd3cvNmxBd3FTNEtKTE5K?=
 =?utf-8?B?bUlOOXFDUUZHYXVRa1VPbEptVlFLNGFjd0p4M2NjR1dEQnZHczF3QVZoVUcy?=
 =?utf-8?B?d1Q0d3hnSkRmWk9LWkp2ci9zZzR0SURHK2tndjNWSXRQU1NlRVFvM3FzWjJ6?=
 =?utf-8?B?S1ZGSVUyQUlZZDNhMTYydUpxbHhKdVVuTjRGWUZjTDB3bXZtNTBaNlFlOW8z?=
 =?utf-8?B?QzNVV3ZoV3hoUWRGSUhjQmhOazZXVnlWbGJjbzVjUDRadEhZQT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a166c922-1f74-4a67-7087-08db069f89d2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2023 11:04:08.6924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGd+1gVxWTKj4o9wbszf2iGwOFbeWLUQ6RY24b9luoWQ5m+XBfVO3tc3UQPrpDy+F8xCGHEQGFFpYFB9k+Bmqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4615
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-04_05,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302040099
X-Proofpoint-GUID: ZR3Rl5kFlLb5cD-GyNqjgQ9toMgWl-1k
X-Proofpoint-ORIG-GUID: ZR3Rl5kFlLb5cD-GyNqjgQ9toMgWl-1k
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



On 2/2/2023 8:53 AM, Eugenio Perez Martin wrote:
> On Thu, Feb 2, 2023 at 1:57 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 1/13/2023 1:06 AM, Eugenio Perez Martin wrote:
>>> On Fri, Jan 13, 2023 at 4:39 AM Jason Wang <jasowang@redhat.com> wrote:
>>>> On Fri, Jan 13, 2023 at 11:25 AM Zhu, Lingshan <lingshan.zhu@intel.com> wrote:
>>>>>
>>>>> On 1/13/2023 10:31 AM, Jason Wang wrote:
>>>>>> On Fri, Jan 13, 2023 at 1:27 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>>>>>>> Spuriously kick the destination device's queue so it knows in case there
>>>>>>> are new descriptors.
>>>>>>>
>>>>>>> RFC: This is somehow a gray area. The guest may have placed descriptors
>>>>>>> in a virtqueue but not kicked it, so it might be surprised if the device
>>>>>>> starts processing it.
>>>>>> So I think this is kind of the work of the vDPA parent. For the parent
>>>>>> that needs this trick, we should do it in the parent driver.
>>>>> Agree, it looks easier implementing this in parent driver,
>>>>> I can implement it in ifcvf set_vq_ready right now
>>>> Great, but please check whether or not it is really needed.
>>>>
>>>> Some device implementation could check the available descriptions
>>>> after DRIVER_OK without waiting for a kick.
>>>>
>>> So IIUC we can entirely drop this from the series (and I hope we can).
>>> But then, what with the devices that does *not* check for them?
>> I wonder how the kick can be missed from the first place. Supposedly the
>> moment when vhost_dev_stop() calls .suspend() into vdpa driver, the
>> vcpus already stopped running (vm_running = false) and all pending kicks
>> are delivered through vhost-vdpa's host notifiers or mapped doorbell
>> already then device won't get new ones.
> I'm thinking now in cases like the net rx queue.
>
> When the guest starts it fills it and kicks the device. Let's say
> avail_idx is 255.
>
> Following the qemu emulated virtio net,
> hw/virtio/virtio.c:virtqueue_split_pop will stash shadow_avail_idx =
> 255, and it will not check it again until it is out of rx descriptors.
>
> Now the NIC fills N < 255 receive buffers, and VMM migrates. Will the
> destination device check rx avail idx even if it has not received any
> kick? (here could be at startup or when it needs to receive a packet).
> - If the answer is yes, and it will be a bug not to check it, then we
> can drop this patch. We're covered even if there is a possibility of
> losing a kick in the source.
So this is not an issue of missing delivery of kicks, but more of how 
device is expected to handle pending kicks during suspend? For network 
device, it's not required to process up to avail_idx during suspend, but 
this doesn't mean it should ignore the kick for new descriptors, or 
instead I would say the device shouldn't specifically rely on kick, 
either at suspend or at startup. If at suspend, the device doesn't 
process up to avail_idx, correspondingly the implementation of it should 
sync the avail_idx in memory at startup. Even if the device 
implementation has to process up to avail_idx at suspend, for 
interoperability (i.e. source device didn't sync at suspend) point of 
view it still needs to check avail_idx at startup (resume) time and go 
on to process any pending request, right? So in any case, it seems to me 
the "implicit" kick at startup is needed for any device implementation 
anyway. I wouldn't say mandatory but that's the way how its supposed to 
work I feel.

> - If the answer is that it is not mandatory, we need to solve it
> somehow. To me, the best way is to spuriously kick as we don't need
> changes in the device, all we need is here. A new feature flag
> _F_CHECK_AVAIL_ON_STARTUP or equivalent would work the same, but I
> think it complicates everything more.
>
> For tx the device should suspend "immediately", so it may receive a
> kick, fetch avail_idx with M pending descriptors, transmit P < M and
> then receive the suspend. If we don't want to wait indefinitely, the
> device should stop processing so there are still pending requests in
> the queue for the destination to send. So the case now is the same as
> rx, even if the source device actually receives the kick.
>
> Having said that, I didn't check if any code drains the vhost host
> notifier. Or, as mentioned in the meeting, check that HW cannot
> reorder kick and suspend call.
Not sure how order matters here, though I thought device suspend/resume 
doesn't tie in with kick order?

>
>> If the device intends to
>> purposely ignore (note: this could be a device bug) pending kicks during
>> .suspend(), then consequently it should check available descriptors
>> after reaching driver_ok to process outstanding descriptors, making up
>> for the missing kick. If the vdpa driver doesn't support .suspend(),
>> then it should flush the work before .reset() - vhost-scsi does it this
>> way.  Or otherwise I think it's the norm (right thing to do) device
>> should process pending kicks before guest memory is to be unmapped at
>> the late game of vhost_dev_stop(). Is there any case kicks may be missing?
>>
> So process pending kicks means to drain all tx and rx descriptors?
No it doesn't have to. What I said is it shouldn't ignore pending kicks 
as if there's no more buffer posted to the device. But really, a fair 
expectation for suspending or starting device is device should do a 
spontaneous sync for getting the latest avail_idx in the memory, which 
does not have to depend on kicks. For network hardware device, I thought 
suspend just needs to wait until the completion of ongoing Tx/Rx DMA 
transaction already in the flight, rather than to drain all the upcoming 
packets until avail_idx.

Regards,
-Siwei
> That would be a solution, but then we don't need virtqueue_state at
> all as we might simply recover it from guest's vring avail_idx.
>
> Thanks!
>
>> -Siwei
>>
>>
>>> If we drop it it seems to me we must mandate devices to check for
>>> descriptors at queue_enable. The queue could stall if not, isn't it?
>>>
>>> Thanks!
>>>
>>>> Thanks
>>>>
>>>>> Thanks
>>>>> Zhu Lingshan
>>>>>> Thanks
>>>>>>
>>>>>>> However, that information is not in the migration stream and it should
>>>>>>> be an edge case anyhow, being resilient to parallel notifications from
>>>>>>> the guest.
>>>>>>>
>>>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>>>> ---
>>>>>>>     hw/virtio/vhost-vdpa.c | 5 +++++
>>>>>>>     1 file changed, 5 insertions(+)
>>>>>>>
>>>>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>>>>> index 40b7e8706a..dff94355dd 100644
>>>>>>> --- a/hw/virtio/vhost-vdpa.c
>>>>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>>>>> @@ -732,11 +732,16 @@ static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, int ready)
>>>>>>>         }
>>>>>>>         trace_vhost_vdpa_set_vring_ready(dev);
>>>>>>>         for (i = 0; i < dev->nvqs; ++i) {
>>>>>>> +        VirtQueue *vq;
>>>>>>>             struct vhost_vring_state state = {
>>>>>>>                 .index = dev->vq_index + i,
>>>>>>>                 .num = 1,
>>>>>>>             };
>>>>>>>             vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
>>>>>>> +
>>>>>>> +        /* Preemptive kick */
>>>>>>> +        vq = virtio_get_queue(dev->vdev, dev->vq_index + i);
>>>>>>> +        event_notifier_set(virtio_queue_get_host_notifier(vq));
>>>>>>>         }
>>>>>>>         return 0;
>>>>>>>     }
>>>>>>> --
>>>>>>> 2.31.1
>>>>>>>


