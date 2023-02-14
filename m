Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA731695611
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 02:47:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRkO3-0007k8-4w; Mon, 13 Feb 2023 20:45:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pRkNz-0007jB-HU
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 20:45:37 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pRkNv-0006Na-Ca
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 20:45:35 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DMO1OT002226; Tue, 14 Feb 2023 01:45:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=4/DI9xa/eAGCzxuYRbY84FXZvo/DZnPU6AVF3vRDsI0=;
 b=ggtANOOGTloobQdSZ8PxBGF45yxt8GEl8UGkli/lBM48akSbANvazANDl6DXKsrMANFY
 IfP03w45HSOjL/soaVoQ0VeJhRZs8UVL8KDHs9p/N70R4Gu5SzeZ5VCzbiv1ttYbrp0E
 +dVsSMgyG8NTHy4vfbur6AV5nHoMC/2kxtbVo3iRVT+uJLol/mS1zPgCxrm5fxLJENC6
 oImmqlqSIkyQE0IdCmfNiXrPRgtXmwX6vfJLb8uEbIezFAvrQwJTsYhzysfsIP5og36T
 A677IBCiflMY5a2nZr/CAMGVpfvHvnBg/Z8mWokT8+RoqomF/bjPD1ZcwxBKWLj30BV6 gw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np2mtc8uh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Feb 2023 01:45:12 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31DMtrAr032605; Tue, 14 Feb 2023 01:45:11 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1f4vwbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Feb 2023 01:45:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7sHCABLFdTVhLXRzUB22f4j9ArIZbHzr57BVF1gYrc3DR6/mcENojiYjEYJZpXKjBNbF837TsjepLGYPLOBQZB2IoIT3pn3Pk0SOKmVwz7voNTx//fm2yTNqSV+Ucqk15RMrYvf9JlheL8kAx2pp2ypRtRckMUBiSbaBRoc2qzH0Yzjmj2zpqzv89QhkOeXyImlunXegc/dvUDIq+L+f/RbVGG9UMpCc7GLQRJcG0z1pIUncd6bl55fkRQas71cytAIowMUtosWo6eI9zJ74ySkmkL+XiLhkaJDexelsNRHFHdLryMFVTIALxQAjraWXnAtMIBdaTGtOiEFQcKq3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/DI9xa/eAGCzxuYRbY84FXZvo/DZnPU6AVF3vRDsI0=;
 b=kruPVMdOdJqOfY+dU54JI2m6NgQCK1mZJsFmJ152DE3RevS9DkFvF45v1eFBz9F9pDwM9M/jgFGnFJm51L2Rd45zSGZn0b/6uEefIa/Hi3NnM/s+vA5HXc/E49r4sN2nkW404JR+g6n5CZvewMHjLqxHMD+uTiL9HtxPPhzAkVWAMHnJkm3oTvNiPOzDwjS7YxodMKV8Aj0Pt1iC7qsPA61w99yKQcx//Q9fvmX7QHe7aFpvfNW1XPniU853zh+lgV9YN0JC/VlpZOh5btMnGnOGmkG15Kx9RZjBFtQNy2SsirlPeezlE6i0T64G2MGmGeaIKVfbEct75oj+Migx1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/DI9xa/eAGCzxuYRbY84FXZvo/DZnPU6AVF3vRDsI0=;
 b=QNsvtEHV8Q9xTX6Rh3vyhl+bH+FIvp4HmkptCs2ubxPjMM1GBgPhIN645bTG6pnSL5NJpIadlufcSZd9QLxZCxSVL7iuxfzT8GurQSyUSxQIMcyIqeY4whrk2cFd7MfIQ4DVYMQOgYI6Kk36vfgQuoFQXNUv7YbeWAY1U5azFBg=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by CH2PR10MB4277.namprd10.prod.outlook.com (2603:10b6:610:7b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Tue, 14 Feb
 2023 01:45:07 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::25da:8594:cf75:8ef3]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::25da:8594:cf75:8ef3%9]) with mapi id 15.20.6111.010; Tue, 14 Feb 2023
 01:45:07 +0000
Message-ID: <bdd4531e-1616-8513-bb33-80fabb7b2074@oracle.com>
Date: Mon, 13 Feb 2023 17:45:04 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/13] vdpa net: move iova tree creation from init to
 start
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>,
 alvaro.karsz@solid-run.com, Zhu Lingshan <lingshan.zhu@intel.com>,
 Lei Yang <leiyang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>,
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, longpeng2@huawei.com,
 virtualization@lists.linux-foundation.org,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-2-eperezma@redhat.com>
 <a71b4dfc-67ea-ef8b-023b-8e18638bd8b2@oracle.com>
 <CAJaqyWfVOmVs5j_O=TMRSO3ZkDWuX-ZRJMY_nTYicAev8+QMHA@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAJaqyWfVOmVs5j_O=TMRSO3ZkDWuX-ZRJMY_nTYicAev8+QMHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0261.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::26) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|CH2PR10MB4277:EE_
X-MS-Office365-Filtering-Correlation-Id: 002b67b0-ca78-4172-2c13-08db0e2d19a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DI0M+GGgmOKqBE+ICumvBBmhC8oI49+GVhqY7yPpf2Z2ALEZiqYEqKwn97brHB/py4cCWUww7qDamFyn8m9aWuyQ0BlDwaC8TzvPyvK2GN8LCam5EF3yP1Qb4S8ZCYRtpu/gr4mUOf3W9lc10YnlEGOelBsMc2ftzWbJchI1CNRn2FjDcakOnKQrE6DshYylkWH2O+iO04YTZ1ooxsEwVUxXPMiZVZWfPSEW0sTZdGPEVS5YFhgNP95On9nZ3tJsgUQXmozJx7670ErWntdaU9bUD4Pc5WIp64NGKxRc+uxK0SzhsnFdZw+21S2nXuJ+s+0YhcQ0OsWgBdhdOfWrcEoom0wl3zMrb+5F4AXYvAZNDz8VF5bNKZ0GrNuqJg3B1GFzyOScPvkN4iDiz67+CHGAQSKlRDAfdGxqn4SoQjmBWijI0Ou++mHjnuA/C8iDrrcGGu/zAFvH64UcrEwwHvICavW6Fcq0AFe+AN7nwx2c3gigGt2v95wgMjWe53KdZVsEK7Oj7yRnT9rGHIsyp3oaZNK+9llcf8Cx2Fp0cm6XStJ63m51v28uB9p76Yx34qm9/ylmK5kcmT87NKL+ERwm/S3duY+uLLoTIQbI88O2Opy7tnd7/gAKWN88swNkoRSUQs6L80mzvc462enytXxMYbeDm6zVZOdvoQKdbJmpUdNeRFwmL2Fc+4XOAlgr86ztmMXYGEUy7Api9z6Vq+P4W3V/hJdQFf8c+muR6Dg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199018)(186003)(26005)(31686004)(6486002)(86362001)(54906003)(83380400001)(36756003)(36916002)(316002)(31696002)(66574015)(6512007)(53546011)(6506007)(6666004)(30864003)(5660300002)(2906002)(478600001)(41300700001)(2616005)(38100700002)(66556008)(8936002)(6916009)(66946007)(8676002)(66476007)(7416002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWNJTjNKaGR3K1lRay9LczVZd0RBcUt5SU9VNGpxSXVMYTU4TXBqaGI4aWRF?=
 =?utf-8?B?cmYrd21mdUVHay9ldElCbFdOZGIvZ0RPUUdGS2UzYWIrbWJ6WFBZTTF5cGx1?=
 =?utf-8?B?UkMrQ1Jsd1E0SktCZ1lOQkcxdVBGWFNZWjF1U0ZKc1U2Rmg5SGo2L2dkSWV5?=
 =?utf-8?B?RW5UT1JiaCs3S0c2b25YWGN3b29hSExuQUQ3RW9CRFJ6WmgydmVzcXFkYWI3?=
 =?utf-8?B?QjA0ZWhmRmFvL1VaWE9GTXMrNUE0ejhyWG5nTDdNWVBMUUNtdjJDQnF6a0Np?=
 =?utf-8?B?eFZ2UUNIa3FLMXVFZlhrVG4wbHhSTlNVeVpqcU9ZakFQYjVBMjZ3WFBwTWZw?=
 =?utf-8?B?UXdCcGpCQUN5c0JDVlZONUlHdWFlNzVEcXVxQ21DdGZicC9kQ05ZQ2svbzlU?=
 =?utf-8?B?TmVIVjFQbFlrRzZVYzZuQ0sySjYrQnc1amJwTHdmTnF1dUVXdHBTMC84bzRt?=
 =?utf-8?B?enJHS2dpa1h3dGF1U3I5Kys4VE42R0FtQUFXTkVhVEg2SFBad0t1OCsvdlN5?=
 =?utf-8?B?N25EWDN6cEtQVE9FZ3pUOE1Lb3RNK0MzV3ZkdFNMajdVd040VGw1cldNeUJ3?=
 =?utf-8?B?TUdjNysxeUlMMnFQMkhJWER0bEw5SnluZnBtYzd2UzFCZVNqUnM1M2NMdW9R?=
 =?utf-8?B?NjY1R3VGeHI2REVvYWxkdENzL1ByNkVMS3Y2MmVxS0M5U2Y3WVNGZzFSM1dY?=
 =?utf-8?B?WGZ3cHg5RTBkZlVtNERYaE5JandFQnhkWE53UER2SWhnaGQvRk53UXpDNGs4?=
 =?utf-8?B?UE05RjhzM2d6VXN4RzhZQlhTQUZRaEQwREN2ZHkrWjYrR1BMSjV4aXM0NWp0?=
 =?utf-8?B?NVZGaDBGdlpHaWp0ZTVWSlc1d0drMUpvMXV0TXk3S1FzbXJKZmJFdGNiT3NN?=
 =?utf-8?B?cndDM2JCQXhvRFJEbHp1bkJBK1FnSGVoRDBQM2l6QlVQSjVmbk1HNUw4bjF6?=
 =?utf-8?B?bEwydnc0UlkwNWdBQnBLZkh1dXlremxEWHBtY2FDVkIySlcwb2Zoc2E1MjJ6?=
 =?utf-8?B?Mzh0NSs5am5pMDU1SG9NeVpQR0lBaXhrb0kwNEVDSGRMQ2MrdllReU9sRk16?=
 =?utf-8?B?cFE2K2dYM0FDdXZDcC8ySkZPLzg3bnJpbkxmVzF5d2N2aVlUeVpJUm5LZzZ5?=
 =?utf-8?B?ZHFMZ1JxbkxWakZta1l1RjRVU3hERWZLeVVmRExXRnB3MTZ6L0F0Z3l2NFpm?=
 =?utf-8?B?M0Z5ZXJWYmsxUEpDQmVHbkQ3dDJXSWtPNWhpdk1BWHlaVSs3ODhVSUlRUEMv?=
 =?utf-8?B?Z3Rqay9ObVNLK09sbVdlT2RyYTlpUmFQd21sNGhPMXR6NFNXdGY3L29ENVdp?=
 =?utf-8?B?cy91SUFrU1JsR0cvSXcrWmtVWkNzM0k0OUhRSHNXL1ZYbm1wRDlJemN1bXJF?=
 =?utf-8?B?dzdyR3BxOU44R0YyRUd2eVltMFA1Qjc2emlvWFFqajhlQUdzMHRmcUlZeFZJ?=
 =?utf-8?B?RnZ5SndWMkxKU3hsdlc4REhYcDdUdUtKcDNwOU44V2Mvbm1SWUJOYWFGdDUr?=
 =?utf-8?B?VDQ2Zy8xc21ac1VPVGdabDJkZmhzWVVIa3Nvc1Z2aFdtTlJ0S0VsbjBXVktt?=
 =?utf-8?B?a3BlTHU1SzJ2Skp3cGFYOUJtY3NwNmtOZmNjQkI4UVBGeDVUZWIwMitTRm5F?=
 =?utf-8?B?eC82SUFwUzFKMWpvdC9uU3BMc3JtckQvM3Z2eUZjYzBMcjJtMkc3Q2t0a2JS?=
 =?utf-8?B?cWZneGdHQjN3NlJBeWM5YXE3ajh6NDF0R0FSRFM2N055NnNXQXk3ZTAyeGlk?=
 =?utf-8?B?L2pJRE1sYldNSmphVUVoMGlsaThhTUY5VTljZXYvcG1JRGZnUXV3eDViYjlp?=
 =?utf-8?B?UDg4OTNFem1GVlgzUy9wWWtZMlZOQnpMT3dMZ2h1VXF3ZkJ0U1A5ZmJIUVp2?=
 =?utf-8?B?L2dWQzBwdlUyb3VrSmZ6TSsrNXg4Uzd4TU54MHQwcElZeFdEcHI3ZXBDYzlY?=
 =?utf-8?B?V1Q2MmNNSEt1eXRTWFdOajRodER3bDk2QjYxSEk2SGVaWlFxNVJYZktjYjZW?=
 =?utf-8?B?WnVXTjB1eWdQMXkvNFNPeDEwRmF3cjM0eThhSzUrVFEzbC9FMkJjK21NR05h?=
 =?utf-8?B?MnRoM3NmOEszQjJ1N3c1Z3RaN3RPN0FoYU1KVWVIdDMrd3NHR0ExbDd1S3dE?=
 =?utf-8?Q?A/c/zSVqPMYzxGcPqfhE1GCkT?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?citCUmpKazhNOCtaNGtibEFjS0xmd2pCdkEwUlorcDhkS3FXN0ovQ3RIZTI0?=
 =?utf-8?B?WVFFRDVaMmdNb2t5V3F2bmd1N0xuUWV1SXJtNGUzTXdheEptV2MzR3llWVBH?=
 =?utf-8?B?R0paMEpUQ09GaFNyV3VybE1iK05qUHMxak9oa3dpYmprL0JrWDRxV0tBT3RU?=
 =?utf-8?B?OEdIRStwMTFSR0ZKcU5sWDU5NldMb294WkJydHF5UXV1YTJETjI5TnRiNzFE?=
 =?utf-8?B?YTFMQStjRWhubGU5YWxZR1grZS9RYVprNWZ5YkdsbUE0cWNjS0hsSkcrUy9t?=
 =?utf-8?B?Vis2SmtaSnMzRlVsY3d5V1dCdGwzbTlob2lNTEVkNmVMSXdacG1MMjFFNUVv?=
 =?utf-8?B?czJxL3RsZEE3aHFhUEUxeDRIWEhjQ1QzMUtZaGpVcUVEdjBqV3cva1N2cnhD?=
 =?utf-8?B?ajR0cHF0ODRvNnhiempTU1BMRTQ2SVBqeklQeUFVR3E4SWVGRjhEM0l1Q2lB?=
 =?utf-8?B?a0l3bTBUK2w5bjkzMEEwNHd0QVVFTWZaS0pWdHZLSEllbEVCNElvOVFWdGtD?=
 =?utf-8?B?UklNMWVSY3A5aGNRLzlHT2oxUnJCRUVJajRHbTJUVk5FMHRJMzN0Nkg4cTZM?=
 =?utf-8?B?SEN4RE9odFk2NVBCL2swY1lWYnZtL204bi9DSjFxTGdodFBBT1FEZ3FXVUtu?=
 =?utf-8?B?d0lJVE1WdnlnVWMwNS9TeHp0c29lWngrdkZZck1FMXJ6ZE9ISmFOMjJIeXdG?=
 =?utf-8?B?ZTlJYkVxTmtTNExRLzVMelNYNXozUzU3STNwWi9ZZkR6OURuQm8zWkp4SXFM?=
 =?utf-8?B?YVZWNXZEMHptNXIxMnVMWUJTTGRHQXhSd3UwZVZDM1V0anBiWjFkQXB1bDhu?=
 =?utf-8?B?VllXUW1wcjVjMWdCQmtyME9mK01yRXAvdkpOWm43ak1OWmc1aXhEZVp4MG5V?=
 =?utf-8?B?aUp5Z2tkK2wrY1pERXlhR29tempTZW9nM1dLcWJyall5eUJpNDZiMENlTWtV?=
 =?utf-8?B?RGZaeTc2clNGWHh4bEpDczh6ZjNxV1ZMMk1oVitmbVFLUWRHbWEvOCtsNzRG?=
 =?utf-8?B?d2VmdWVFcm50NUthenpic0RoSkYyM2g0a0I2OEwwNjNyVjFnejQ2ODlPR0xp?=
 =?utf-8?B?TE8yVTFlWEhXNE51Z1FmQmRFRk95VnorUUJmNWxldzhSSkFRVlcvUTRndzRO?=
 =?utf-8?B?UUhTaUZ4M09tVXpDK3Y4bmlMaldvOThlKzV0UFVnWWRJcHNJdjdQVzcyc2Zv?=
 =?utf-8?B?ZE5uc0dOWHF3Q3hlVnliWmlXakU1OE5MTFk0UG1Jem9JSDZhbjlOeHkvZCtv?=
 =?utf-8?B?NWZVYTVDTEd0K05QS2Uxc0tRd2YvMWdlMjJ2bHhJdmhsOGkveW9pbHd4Q1lB?=
 =?utf-8?B?YkQxT2tmdlF0Qzg2OFR1RVh4TkN4d0ZYalFYWjBtQkltY04wRkNXdWZNWUV4?=
 =?utf-8?Q?owWBdzJ7efLmkBVUhBa3sY2WAUBK0LOQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 002b67b0-ca78-4172-2c13-08db0e2d19a6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 01:45:07.1100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDgYxxb+gNhc/P6LrrhkpbvI0YM5YZ9Fh5QEgMKg/8X6Bb693a9Gm+iKr7b9U50xjjgdrmGDBCzomFeRaekXAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4277
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_01,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302140011
X-Proofpoint-GUID: hyG92HKBdHf2rpw2vSZfLaHPOgh-j7rL
X-Proofpoint-ORIG-GUID: hyG92HKBdHf2rpw2vSZfLaHPOgh-j7rL
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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



On 2/13/2023 3:14 AM, Eugenio Perez Martin wrote:
> On Mon, Feb 13, 2023 at 7:51 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 2/8/2023 1:42 AM, Eugenio Pérez wrote:
>>> Only create iova_tree if and when it is needed.
>>>
>>> The cleanup keeps being responsible of last VQ but this change allows it
>>> to merge both cleanup functions.
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> Acked-by: Jason Wang <jasowang@redhat.com>
>>> ---
>>>    net/vhost-vdpa.c | 99 ++++++++++++++++++++++++++++++++++--------------
>>>    1 file changed, 71 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>> index de5ed8ff22..a9e6c8f28e 100644
>>> --- a/net/vhost-vdpa.c
>>> +++ b/net/vhost-vdpa.c
>>> @@ -178,13 +178,9 @@ err_init:
>>>    static void vhost_vdpa_cleanup(NetClientState *nc)
>>>    {
>>>        VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
>>> -    struct vhost_dev *dev = &s->vhost_net->dev;
>>>
>>>        qemu_vfree(s->cvq_cmd_out_buffer);
>>>        qemu_vfree(s->status);
>>> -    if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
>>> -        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
>>> -    }
>>>        if (s->vhost_net) {
>>>            vhost_net_cleanup(s->vhost_net);
>>>            g_free(s->vhost_net);
>>> @@ -234,10 +230,64 @@ static ssize_t vhost_vdpa_receive(NetClientState *nc, const uint8_t *buf,
>>>        return size;
>>>    }
>>>
>>> +/** From any vdpa net client, get the netclient of first queue pair */
>>> +static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState *s)
>>> +{
>>> +    NICState *nic = qemu_get_nic(s->nc.peer);
>>> +    NetClientState *nc0 = qemu_get_peer(nic->ncs, 0);
>>> +
>>> +    return DO_UPCAST(VhostVDPAState, nc, nc0);
>>> +}
>>> +
>>> +static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
>>> +{
>>> +    struct vhost_vdpa *v = &s->vhost_vdpa;
>>> +
>>> +    if (v->shadow_vqs_enabled) {
>>> +        v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>>> +                                           v->iova_range.last);
>>> +    }
>>> +}
>>> +
>>> +static int vhost_vdpa_net_data_start(NetClientState *nc)
>>> +{
>>> +    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
>>> +    struct vhost_vdpa *v = &s->vhost_vdpa;
>>> +
>>> +    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>> +
>>> +    if (v->index == 0) {
>>> +        vhost_vdpa_net_data_start_first(s);
>>> +        return 0;
>>> +    }
>>> +
>>> +    if (v->shadow_vqs_enabled) {
>>> +        VhostVDPAState *s0 = vhost_vdpa_net_first_nc_vdpa(s);
>>> +        v->iova_tree = s0->vhost_vdpa.iova_tree;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void vhost_vdpa_net_client_stop(NetClientState *nc)
>>> +{
>>> +    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
>>> +    struct vhost_dev *dev;
>>> +
>>> +    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>> +
>>> +    dev = s->vhost_vdpa.dev;
>>> +    if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
>>> +        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
>>> +    }
>>> +}
>>> +
>>>    static NetClientInfo net_vhost_vdpa_info = {
>>>            .type = NET_CLIENT_DRIVER_VHOST_VDPA,
>>>            .size = sizeof(VhostVDPAState),
>>>            .receive = vhost_vdpa_receive,
>>> +        .start = vhost_vdpa_net_data_start,
>>> +        .stop = vhost_vdpa_net_client_stop,
>>>            .cleanup = vhost_vdpa_cleanup,
>>>            .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
>>>            .has_ufo = vhost_vdpa_has_ufo,
>>> @@ -351,7 +401,7 @@ dma_map_err:
>>>
>>>    static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>>>    {
>>> -    VhostVDPAState *s;
>>> +    VhostVDPAState *s, *s0;
>>>        struct vhost_vdpa *v;
>>>        uint64_t backend_features;
>>>        int64_t cvq_group;
>>> @@ -425,6 +475,15 @@ out:
>>>            return 0;
>>>        }
>>>
>>> +    s0 = vhost_vdpa_net_first_nc_vdpa(s);
>>> +    if (s0->vhost_vdpa.iova_tree) {
>>> +        /* SVQ is already configured for all virtqueues */
>>> +        v->iova_tree = s0->vhost_vdpa.iova_tree;
>>> +    } else {
>>> +        v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>>> +                                           v->iova_range.last);
>> I wonder how this case could happen, vhost_vdpa_net_data_start_first()
>> should've allocated an iova tree on the first data vq. Is zero data vq
>> ever possible on net vhost-vdpa?
>>
> It's the case of the current qemu master when only CVQ is being
> shadowed. It's not that "there are no data vq": If that case were
> possible, CVQ vhost-vdpa state would be s0.
>
> The case is that since only CVQ vhost-vdpa is the one being migrated,
> only CVQ has an iova tree.
OK, so this corresponds to the case where live migration is not started 
and CVQ starts in its own address space of VHOST_VDPA_NET_CVQ_ASID. 
Thanks for explaining it!

>
> With this series applied and with no migration running, the case is
> the same as before: only SVQ gets shadowed. When migration starts, all
> vqs are migrated, and share iova tree.
I wonder what is the reason to share the iova tree when migration 
starts, I think CVQ may stay on its own VHOST_VDPA_NET_CVQ_ASID still?

Actually there's discrepancy in vhost_vdpa_net_log_global_enable(), I 
don't see explicit code to switch from VHOST_VDPA_NET_CVQ_ASID to 
VHOST_VDPA_GUEST_PA_ASID for the CVQ. This is the address space I 
collision I mentioned earlier:

9585@1676093788.259201:vhost_vdpa_dma_map vdpa:0x7ff13088a190 fd: 16 
msg_type: 2 asid: 0 iova: 0x1000 size: 0x2000 uaddr: 0x55a5a7ff3000 
perm: 0x1 type: 2
9585@1676093788.279923:vhost_vdpa_dma_map vdpa:0x7ff13088a190 fd: 16 
msg_type: 2 asid: 0 iova: 0x3000 size: 0x1000 uaddr: 0x55a5a7ff6000 
perm: 0x3 type: 2
9585@1676093788.290529:vhost_vdpa_set_vring_addr dev: 0x55a5a77cec20 
index: 0 flags: 0x0 desc_user_addr: 0x1000 used_user_addr: 0x3000 
avail_user_addr: 0x2000 log_guest_addr: 0x0
:
:
9585@1676093788.543567:vhost_vdpa_dma_map vdpa:0x7ff1302b6190 fd: 16 
msg_type: 2 asid: 0 iova: 0x16000 size: 0x2000 uaddr: 0x55a5a7959000 
perm: 0x1 type: 2
9585@1676093788.576923:vhost_vdpa_dma_map vdpa:0x7ff1302b6190 fd: 16 
msg_type: 2 asid: 0 iova: 0x18000 size: 0x1000 uaddr: 0x55a5a795c000 
perm: 0x3 type: 2
9585@1676093788.593881:vhost_vdpa_set_vring_addr dev: 0x55a5a7580930 
index: 7 flags: 0x0 desc_user_addr: 0x16000 used_user_addr: 0x18000 
avail_user_addr: 0x17000 log_guest_addr: 0x0
9585@1676093788.593904:vhost_vdpa_dma_map vdpa:0x7ff13026d190 fd: 16 
msg_type: 2 asid: 1 iova: 0x19000 size: 0x1000 uaddr: 0x55a5a77f8000 
perm: 0x1 type: 2
9585@1676093788.606448:vhost_vdpa_dma_map vdpa:0x7ff13026d190 fd: 16 
msg_type: 2 asid: 1 iova: 0x1a000 size: 0x1000 uaddr: 0x55a5a77fa000 
perm: 0x3 type: 2
9585@1676093788.616253:vhost_vdpa_dma_map vdpa:0x7ff13026d190 fd: 16 
msg_type: 2 asid: 1 iova: 0x1b000 size: 0x1000 uaddr: 0x55a5a795f000 
perm: 0x1 type: 2
9585@1676093788.625956:vhost_vdpa_dma_map vdpa:0x7ff13026d190 fd: 16 
msg_type: 2 asid: 1 iova: 0x1c000 size: 0x1000 uaddr: 0x55a5a7f4e000 
perm: 0x3 type: 2
9585@1676093788.635655:vhost_vdpa_set_vring_addr dev: 0x55a5a7580ec0 
index: 8 flags: 0x0 desc_user_addr: 0x1b000 used_user_addr: 0x1c000 
avail_user_addr: 0x1b400 log_guest_addr: 0x0
9585@1676093788.635667:vhost_vdpa_listener_region_add vdpa: 
0x7ff13026d190 iova 0x0 llend 0xa0000 vaddr: 0x7fef1fe00000 read-only: 0
9585@1676093788.635670:vhost_vdpa_listener_begin_batch 
vdpa:0x7ff13026d190 fd: 16 msg_type: 2 type: 5
9585@1676093788.635677:vhost_vdpa_dma_map vdpa:0x7ff13026d190 fd: 16 
msg_type: 2 asid: 0 iova: 0x0 size: 0xa0000 uaddr: 0x7fef1fe00000 perm: 
0x3 type: 2
2023-02-11T05:36:28.635686Z qemu-system-x86_64: failed to write, fd=16, 
errno=14 (Bad address)
2023-02-11T05:36:28.635721Z qemu-system-x86_64: vhost vdpa map fail!
2023-02-11T05:36:28.635744Z qemu-system-x86_64: vhost-vdpa: DMA mapping 
failed, unable to continue


Regards,
-Siwei
>
> Thanks!
>
>> Thanks,
>> -Siwei
>>> +    }
>>> +
>>>        r = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer,
>>>                                   vhost_vdpa_net_cvq_cmd_page_len(), false);
>>>        if (unlikely(r < 0)) {
>>> @@ -449,15 +508,9 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
>>>        if (s->vhost_vdpa.shadow_vqs_enabled) {
>>>            vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
>>>            vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
>>> -        if (!s->always_svq) {
>>> -            /*
>>> -             * If only the CVQ is shadowed we can delete this safely.
>>> -             * If all the VQs are shadows this will be needed by the time the
>>> -             * device is started again to register SVQ vrings and similar.
>>> -             */
>>> -            g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
>>> -        }
>>>        }
>>> +
>>> +    vhost_vdpa_net_client_stop(nc);
>>>    }
>>>
>>>    static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_len,
>>> @@ -667,8 +720,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>>>                                           int nvqs,
>>>                                           bool is_datapath,
>>>                                           bool svq,
>>> -                                       struct vhost_vdpa_iova_range iova_range,
>>> -                                       VhostIOVATree *iova_tree)
>>> +                                       struct vhost_vdpa_iova_range iova_range)
>>>    {
>>>        NetClientState *nc = NULL;
>>>        VhostVDPAState *s;
>>> @@ -690,7 +742,6 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>>>        s->vhost_vdpa.shadow_vqs_enabled = svq;
>>>        s->vhost_vdpa.iova_range = iova_range;
>>>        s->vhost_vdpa.shadow_data = svq;
>>> -    s->vhost_vdpa.iova_tree = iova_tree;
>>>        if (!is_datapath) {
>>>            s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
>>>                                                vhost_vdpa_net_cvq_cmd_page_len());
>>> @@ -760,7 +811,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>        uint64_t features;
>>>        int vdpa_device_fd;
>>>        g_autofree NetClientState **ncs = NULL;
>>> -    g_autoptr(VhostIOVATree) iova_tree = NULL;
>>>        struct vhost_vdpa_iova_range iova_range;
>>>        NetClientState *nc;
>>>        int queue_pairs, r, i = 0, has_cvq = 0;
>>> @@ -812,12 +862,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>            goto err;
>>>        }
>>>
>>> -    if (opts->x_svq) {
>>> -        if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
>>> -            goto err_svq;
>>> -        }
>>> -
>>> -        iova_tree = vhost_iova_tree_new(iova_range.first, iova_range.last);
>>> +    if (opts->x_svq && !vhost_vdpa_net_valid_svq_features(features, errp)) {
>>> +        goto err;
>>>        }
>>>
>>>        ncs = g_malloc0(sizeof(*ncs) * queue_pairs);
>>> @@ -825,7 +871,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>        for (i = 0; i < queue_pairs; i++) {
>>>            ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>>>                                         vdpa_device_fd, i, 2, true, opts->x_svq,
>>> -                                     iova_range, iova_tree);
>>> +                                     iova_range);
>>>            if (!ncs[i])
>>>                goto err;
>>>        }
>>> @@ -833,13 +879,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>        if (has_cvq) {
>>>            nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>>>                                     vdpa_device_fd, i, 1, false,
>>> -                                 opts->x_svq, iova_range, iova_tree);
>>> +                                 opts->x_svq, iova_range);
>>>            if (!nc)
>>>                goto err;
>>>        }
>>>
>>> -    /* iova_tree ownership belongs to last NetClientState */
>>> -    g_steal_pointer(&iova_tree);
>>>        return 0;
>>>
>>>    err:
>>> @@ -849,7 +893,6 @@ err:
>>>            }
>>>        }
>>>
>>> -err_svq:
>>>        qemu_close(vdpa_device_fd);
>>>
>>>        return -1;


