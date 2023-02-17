Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4545E69A632
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 08:41:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSvL1-000559-PM; Fri, 17 Feb 2023 02:39:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pSvKr-00054s-M8
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 02:39:14 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pSvKo-0002uI-A9
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 02:39:13 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31H7XetR024891; Fri, 17 Feb 2023 07:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=7nCgmxelIYwm8e2KGEEXz2YPaOZb+XYqP1+fQ8ieYaw=;
 b=ElSBOjcK7Kzg4TLcLSO+jVAYNQViWILTi5a6kmtacuoVLLmX5MwANcBk7uOsWw11Wd1k
 0HoAYxluz4JygVTTYU7125TudZJhVmFUF9Fz1AxCl1SJ+Q9YLYZkgRjYwzmEZ0+akYPE
 pMq0SY8CwCM1QmRCCqpACtZzpylZhFj2WO90ohHkutqybUMr8Uqbr0tlsUVgyBNXE30X
 4fZ7T5GTBaI8oZHd+qBiyShch9QLaLxCBgwY0KKK0TUkj4oeZhHODCm0UQRSz+PJYvnQ
 rVoRGZ8xeTzmMLPY7kOrXcyk0JFC6ru5WHYvl2EdXoS4I3xLi+NJyEdPbN6mrjwhwJiJ 1g== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np2mtn88r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Feb 2023 07:38:53 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31H5344D015334; Fri, 17 Feb 2023 07:38:52 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1f9uqk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Feb 2023 07:38:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wn3UgxmlNZE6bwOekyNdTELePVl3mNlU94Vs2Kd73z748EJNRPOSZ5yJClmQzO0vMkwpFD+yOAEwyS8LR+raVywFNtetfPUAM+fxcc3ElyarXESTbSldwQB2oqPafSBIXdonn3ZUIMG1iTQNiZ1XSJe7M0sAVVBTZEhIo9sneHzlPYCmW0Ef/hSXE+JukPiL5GYEd5IBZl+g1uXN6bKJ/zTt71FaqSEQM+b+SaefXjaEoj8f98dVF2ZllAGQa9D9iQUK9+wNrR71wDz1uOhyo538XYsdilIi3k/8VgNgAFzNOHC1FWLPHTJS8QvFuwdiDj7yzFosz136xOK5rJo7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nCgmxelIYwm8e2KGEEXz2YPaOZb+XYqP1+fQ8ieYaw=;
 b=j5OcN31RUvwHh7nIG+MSPCnDBvrpnrEwLUHp/XnYNyvQ5mOg/39UiDpJt+HnvbO0C2/2reSBwKGhCbrzuX6rBeBD3U3d0hB0p+FltZzX4ugeMyRd29TD7AKWe5sna6DpHgt4YicZtkw5sUhT4dojldPminiMZxk5LXFSrKFgyDEOIV5R5Fyj8n/a8FOmzBpH13EaXJaFSe/rV4xl8aUrPWqUuI/lYSQOtg8YBFstSaW3Glmbxj5c5DlEuJ8L9i28rMoCARBCi0314Yv2JDWYzeg4h+9uHVFsSYtzke0qIqOsSo23Yl2YXuyXLq1yJWQGmlz3YoJMrp1KeOXg6ws2xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nCgmxelIYwm8e2KGEEXz2YPaOZb+XYqP1+fQ8ieYaw=;
 b=MxOJyq8OJnuyN5ZBetBnW06s0yPfjclB5UODlDoMPUZXsg9N8gHGi8Oz0ODAWDUSYFn4oB0W0/AxjimhU04TiOeZtaDzTe7kTHz3e5BOdPC/wUw9keS6TrRjIErfuRxbJmOdkWXex67cEbSBI0EtXR/1OBlMoUq954q2lYVq+D4=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by SA2PR10MB4746.namprd10.prod.outlook.com (2603:10b6:806:11c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.11; Fri, 17 Feb
 2023 07:38:50 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::25da:8594:cf75:8ef3]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::25da:8594:cf75:8ef3%8]) with mapi id 15.20.6134.006; Fri, 17 Feb 2023
 07:38:50 +0000
Message-ID: <95ed2106-3630-55b3-ae71-6bba77802579@oracle.com>
Date: Thu, 16 Feb 2023 23:38:44 -0800
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
 <bdd4531e-1616-8513-bb33-80fabb7b2074@oracle.com>
 <CAJaqyWfTPHseAg9fdku00xtvC7kkJyAKMiN5wqoRVioN3zWDFw@mail.gmail.com>
 <5e54b6ed-ae07-d6bf-e143-084c82f1f428@oracle.com>
 <CAJaqyWe8+L208dn1D=vmA2J+MZpdLETKefmwzg340FNu2RiEcg@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAJaqyWe8+L208dn1D=vmA2J+MZpdLETKefmwzg340FNu2RiEcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0067.namprd13.prod.outlook.com
 (2603:10b6:806:23::12) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|SA2PR10MB4746:EE_
X-MS-Office365-Filtering-Correlation-Id: bb6851ba-571a-4ebd-eb8e-08db10ba02bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xu/TIc9vJ63/1s2ah1ouGs3c1iN2yZuvjIDH9+U5VtyhGblxl7XN8u673ULRgwSuQVMvZctHk6+e3J2Nnve1l/NRB3CEwjJ+5W57Si+DPMtATXbqQzraQpQLj7MhHUlDKCqzuL/oRgqdVGvjvQXeZdJ0Xbfv56yh9D0p+H5E0fJZkmrsJh+gKcx48nklpxs5WAb4W+HBob/KUUESLvL4CR5LIgy4H4aPQg8iV0QlOY/aMDmmjeGP9IKQazp8PXsSxNI2e3yVde6vT0T9GVMZhmlXYNoqVD2jZIjMdbgrEP4ZjwGSVmXxoWrOrNpbMrkXwIKNPPw1wNAtGnBYNAoYEGaap9wtsBlkYUO2r5rWd1nBAudPJTWevhfvp3JS6IN+z7xkSyoPTgsr/Nhym4QYYIrNthdsdm456vxqwg0wNtdzK0A3tgf74K9vNvk1KZqZK4S9TuFuEZnj87tZkCZO/EFOgMXx0gJgyU0FFKBnhITeemYBUU9m4s6tkYVHtcRN2bjI3tFEi5Lk57jv88JdN0Ogn3I19+gh6WVcLOf5LdCSpysdo6uAB9RCz6BKXXUY/gnohhKCtxY5aj5gBApmfB8vLdR8d5kVVtBY9lNrxg9OSKMZT39+ZiI2KZQTAO9QVYBW1soIoazwy2nDo9lYrPw2jD+mNd5tZliVOH1B/U58hoBCJqCCX0krWiZ3EXkaZqwDQzNYcpAqQaX+8Mg1zPNsK8aftbFio0JnLbkawT0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(366004)(39860400002)(376002)(136003)(451199018)(31686004)(6916009)(4326008)(316002)(31696002)(41300700001)(66556008)(66476007)(8676002)(66946007)(478600001)(36916002)(6486002)(86362001)(966005)(2906002)(6506007)(6512007)(6666004)(5660300002)(7416002)(8936002)(30864003)(54906003)(186003)(53546011)(38100700002)(26005)(36756003)(2616005)(83380400001)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm1uektVd1B5SlZNNjFYOFlKZHFQVnBoaVdCZDk5UlArZnNVNjBQNDljM2Rq?=
 =?utf-8?B?Y3hoME8xLzlBVThmaXdRa2ZxNmtQOGY3cWlQWWlGYUJqVkpRMitWNFdOTU9p?=
 =?utf-8?B?TzdmRHk1RUFkcmpYejRwZmRYUGdFNEZTRGcyUnNEV0d0YVZuQkZsdWhWcjZl?=
 =?utf-8?B?TkdoU0c1WWFQU3VwbnBsNDdOM1lBdk5LWmRDbHNzRVdBRU8xSGsvQmhpbEx1?=
 =?utf-8?B?eExsUG1jU3lNV21ENWJLZHlHK2ZiMzJiT0tMYkozaFJUb2kxWHNzdEUrRlVW?=
 =?utf-8?B?Y0dRT2RINHJEK1FJcnBUWlplK1J1MHd2aENaN0RBY0pOWFZFK0RtZGJqMEtR?=
 =?utf-8?B?c2FYbjdSa2o2VmdmdnBFT2EzMU82Nkl0cG9WRTNnbTR3SGVhWVFaN09Uc09q?=
 =?utf-8?B?UitucXFRcU5nT2crR2RGc201dEs2c2RRckNuQ3FFeUdhUE4yZEEwOXZJZXo2?=
 =?utf-8?B?YWM5Q3RvdzNrYnZFUmtLTWJ4bGVWRlpwMlQxV09UYWd3MjBvL1hiODVSN2hx?=
 =?utf-8?B?a3RILzJFUG10RisvRmtwVEZTcWdOV0hiRFpuc3NJQWJQSTFVK2VEV3MyNmRx?=
 =?utf-8?B?MC8wSVB1MnJSaDhjTXJUemo5UTFudEdSOEtQanZaVXh5c1dyRVFDc0g4VzI3?=
 =?utf-8?B?emNuTi94eFdNNFlDS291cytuckFYRk9QcGV4ZG95QUF6QTdnTlc5UTY2eGdI?=
 =?utf-8?B?Mkl5amZyeVVYc29yV3pKZVZLUG5XZzRNQWVEalB4UG1URXhMaERJa0NRdjdq?=
 =?utf-8?B?OElTZHFzMS9NalFQNjIrd3JJWWJZQ1lmcVlWUVpaUSt0SEhnUjJvaFBWR0ZJ?=
 =?utf-8?B?MnhQdlVQKzJJMnEyQndBZjA2WGdDU2c3UmRBRkNCU0NQOGQvcys2UitmU0N0?=
 =?utf-8?B?dlJuVG1WaHNoTGZBRytqVkdyRFJhSzRmb1NmcWpDTVppbVFBang5aEhCa2x3?=
 =?utf-8?B?SjNZQkV0WXhSNkJxSzR3VkdOMmFvMnFtd3pGUWY4QnBhenRRWkorTXoyaDhL?=
 =?utf-8?B?WitKSWhDODhMMDl4RjRrcTBpN1RWL05yTXFIOS8rSFVqekxOLzZvOUJmVE03?=
 =?utf-8?B?dlRTRWVpYkFsWUo5Q3NLVVFnUTVQNGVKang2Zm9nWmExUkZ2dzZ5VXFRTFh1?=
 =?utf-8?B?Z2NqU1MvK0RsSFEzU3J5UFJqMUFxSXMwa0xBVk5uZTBxRTFsdlJpTEZ2VzFz?=
 =?utf-8?B?VEhlS0NZcXpDdGlwWjlScFFxY2c4cFNlODR5Tm9qcm1tMWpQMHlLdVpieXZa?=
 =?utf-8?B?VkVCWW1aa3BrRWlYSDlNWDJSTVRQQjlBS3lzdGtqbWNFM0EraG5CV1A2UXhh?=
 =?utf-8?B?SytMMFdUWEk0RnBPdXhYR01sb3B2TXJZQU1wSEdua1gwQW5hb1k2NWFueEJp?=
 =?utf-8?B?QzE0TzhFSXdRV01WcHNDSUd3ZWNMQURSNU5qNkYrQXVFMmRtNGZQWlkrZDEz?=
 =?utf-8?B?YjZ2NWFyRWJKdHZqc0hNUEJHSkQyZlpYWjhHL0NPOXZyQTVjUEFVYVdPVXdx?=
 =?utf-8?B?SmU4azRQUjZjb3dGNTVIbG93NUc5YjVZVG12OWYrQzAyazhkd1NFMUZMaERN?=
 =?utf-8?B?eElBNzNWR005VzZMSGVqc0NrUjZxQUpZMGtVK1VHSFlSWVIreTBwaGdSckxi?=
 =?utf-8?B?ekRmNUh3bkhnMlM0ZERkUkU5NmI3ZzBnNmdhSG9GUzN1bmY0OHpXMk5TdWZy?=
 =?utf-8?B?UjRmeVNReXl1dWdtOTV2T1pORi9aNnNaYTAzWVAydCt5SXhhMlFjb1pEL2xw?=
 =?utf-8?B?QUlGYnJNMTBidjBteVVBdHFPclMzdVdDa0xPcEVMZ2JBOUVpUkQ2Y3hUcEVS?=
 =?utf-8?B?Q2JBWEYxM3JMck50V0RYOUdvWndxVmJvQmlzY25jZWtITHRJWFBWZGlJN2NZ?=
 =?utf-8?B?Wlp0dmpwRFYxdGtoZi9YRnZ4SWNGYUp1K253Vk81eDMzaCtxUTNPNk4zUGUv?=
 =?utf-8?B?YlpYNFoxdEZaT0JHbUU0ZG9nU0ZTZzBiRjV6NE9jUVdyWDNBd0w0a3JTL2lN?=
 =?utf-8?B?Yjl2QjVWbFZidnZ3Rit6QVN3aGVveDRWNy9yd0ZoSVVSMG5YNmp6RDlvYVJW?=
 =?utf-8?B?U0hNS3NtUkZGWWVuQmxhS1Z1WnpkY2lpNHhkOVQzNEV1ZUViU2huZVNtUnRh?=
 =?utf-8?Q?gyBMA+WX+vLnd2KgdfF4TEZZd?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?SVUxUnI1czJKZ0JoK2NVdXFTd3dzbzRPY21VeDhhTVJvTGZiVDYybXE1LzJZ?=
 =?utf-8?B?OUlYc2FSNlJxdUZ3ejVOQ3pQUWFOTmJiZzRyaDFuc295aEFPOGxtZzN5TFpZ?=
 =?utf-8?B?S3lGSThhVTdmT0NwQ2tkS2JoQmFIVFlyaFhGZGtqVFY1ckhWZG41clR1V2F2?=
 =?utf-8?B?MXNYbDJubm1Fa3poTVpiQjVuWTFURUtmSVQ4clNJaXhKL1A1cFhSOWJ0K3BU?=
 =?utf-8?B?T2k1WDQ3THVBTGFMWmV0aWxmMFE2ZzMvR3p6ek1LTHZQTGdWazJjSDcrbEJH?=
 =?utf-8?B?S29JNHExU2RtWUZEZkhWRGt3OHdFaUt0SnAvUzVWQWVIUTBaZnVHQWsyMlpO?=
 =?utf-8?B?VTJjbVZzVHh4UVRkM3I4RXRrNFB2M29SZXhTeWhCQVlaUjRZVGQrNG9iMmg4?=
 =?utf-8?B?OUhJQ2JwZHVQdFJWWkNRY1UwMzIvY01nTnlsNGVLT3JBSnpNMkdFbWQ4MlNy?=
 =?utf-8?B?SE9xY0lqMlJtNHdycWJvK1UwTjRSZ25FSlc3dDIwQzJpVXBhcnluaGd5a0dK?=
 =?utf-8?B?Q3l6QmV2OGtQSXNvcHBKaEF4VUp0elZnV1pqVGo3TDhJdFlIMEpaNUZCOEcy?=
 =?utf-8?B?SC9aSWxPcndlWkxTWTBhODZOclJVT1RMcytnSXZuRUNSKzFNRzRuT0h3SWtp?=
 =?utf-8?B?alZuMUg1TG5YUmFRQXFERGJPeHBET2I5K21xZzE2Y21MNng3cWJ3T1RjdzBV?=
 =?utf-8?B?cUYxUE11bmFsZzRGdzFCQjB5UXJLcG5hUDJkQTlLZzR0QXpqZnN0ZVl6bkNp?=
 =?utf-8?B?NjRQWlI1TklidmdnUE82UkhWY3BReGhKTWdFTGZGUmcvc2JScldhMlRnZXJD?=
 =?utf-8?B?dDRUL1BrbEpsVGJoKzRIY2Z1dndoYlhsVmU3M3JsbFJhdk5mb05jS2d5V1Y3?=
 =?utf-8?B?L09kSDJ4aGhCcG92SnRpbmJXbnkwc1ZjNTRsR1E4U2R2Y2hHQXphSXB0M2c0?=
 =?utf-8?B?dUwxUHFxZWg0UkFMcEZrYnQ3cXIyV2d3eXVXUm9kY0J5TlZlNy9oZVFBcHJr?=
 =?utf-8?B?Z21yL2tNcUg5WE1FUU9URElHL3FOMC9GcVlvSDg5VERrWGlka1FHZmxrUHhr?=
 =?utf-8?B?bGlFL0Z2YVJZc0N1VXhXdmJSdWdYcURCSUN3U2FTRUtKZGFCVHpoemJJcGQ4?=
 =?utf-8?B?ckU5QmNnUTFQOVlCTktWcUNWY0p3QW5RaWNWWlplWWE2Nld3MWoyVWN2V3RX?=
 =?utf-8?B?Snh6RlBaYzBsVkNSUDk5ZVF1dVlYcVV6WEIvNGt0cnY0Z0hOYmIyWkx4dkpr?=
 =?utf-8?B?MjdCaVk0aWtxNGlqRW52VHY5Z21zREc1R042Z2JKUUhjMG1SNjRNRnFWNVQ0?=
 =?utf-8?B?ZUZSbVdwRytWUnhERE1Rc0s1SlFiY0NLb3N0MlZxRGsvc0hwSERNR0FGdXhI?=
 =?utf-8?Q?OXg7KR6WZCP1jXRG3vbdgUyFTcKX1Xfk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb6851ba-571a-4ebd-eb8e-08db10ba02bf
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 07:38:50.1338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxtIU74zVlmWg0snyoU2ofUFaEkqGo76zSx8WVwgOdDagN3hyNep1OUvXwrmzkeowRI8w21JhycH9WQMCXhqNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4746
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_04,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302170069
X-Proofpoint-GUID: kn3-XY08SnIHc4MGum8d64fiAyfQx8gt
X-Proofpoint-ORIG-GUID: kn3-XY08SnIHc4MGum8d64fiAyfQx8gt
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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



On 2/15/2023 11:35 PM, Eugenio Perez Martin wrote:
> On Thu, Feb 16, 2023 at 3:15 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 2/14/2023 11:07 AM, Eugenio Perez Martin wrote:
>>> On Tue, Feb 14, 2023 at 2:45 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>>
>>>> On 2/13/2023 3:14 AM, Eugenio Perez Martin wrote:
>>>>> On Mon, Feb 13, 2023 at 7:51 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>>>> On 2/8/2023 1:42 AM, Eugenio Pérez wrote:
>>>>>>> Only create iova_tree if and when it is needed.
>>>>>>>
>>>>>>> The cleanup keeps being responsible of last VQ but this change allows it
>>>>>>> to merge both cleanup functions.
>>>>>>>
>>>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>>>> Acked-by: Jason Wang <jasowang@redhat.com>
>>>>>>> ---
>>>>>>>      net/vhost-vdpa.c | 99 ++++++++++++++++++++++++++++++++++--------------
>>>>>>>      1 file changed, 71 insertions(+), 28 deletions(-)
>>>>>>>
>>>>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>>>>>> index de5ed8ff22..a9e6c8f28e 100644
>>>>>>> --- a/net/vhost-vdpa.c
>>>>>>> +++ b/net/vhost-vdpa.c
>>>>>>> @@ -178,13 +178,9 @@ err_init:
>>>>>>>      static void vhost_vdpa_cleanup(NetClientState *nc)
>>>>>>>      {
>>>>>>>          VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
>>>>>>> -    struct vhost_dev *dev = &s->vhost_net->dev;
>>>>>>>
>>>>>>>          qemu_vfree(s->cvq_cmd_out_buffer);
>>>>>>>          qemu_vfree(s->status);
>>>>>>> -    if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
>>>>>>> -        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
>>>>>>> -    }
>>>>>>>          if (s->vhost_net) {
>>>>>>>              vhost_net_cleanup(s->vhost_net);
>>>>>>>              g_free(s->vhost_net);
>>>>>>> @@ -234,10 +230,64 @@ static ssize_t vhost_vdpa_receive(NetClientState *nc, const uint8_t *buf,
>>>>>>>          return size;
>>>>>>>      }
>>>>>>>
>>>>>>> +/** From any vdpa net client, get the netclient of first queue pair */
>>>>>>> +static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState *s)
>>>>>>> +{
>>>>>>> +    NICState *nic = qemu_get_nic(s->nc.peer);
>>>>>>> +    NetClientState *nc0 = qemu_get_peer(nic->ncs, 0);
>>>>>>> +
>>>>>>> +    return DO_UPCAST(VhostVDPAState, nc, nc0);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
>>>>>>> +{
>>>>>>> +    struct vhost_vdpa *v = &s->vhost_vdpa;
>>>>>>> +
>>>>>>> +    if (v->shadow_vqs_enabled) {
>>>>>>> +        v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>>>>>>> +                                           v->iova_range.last);
>>>>>>> +    }
>>>>>>> +}
>>>>>>> +
>>>>>>> +static int vhost_vdpa_net_data_start(NetClientState *nc)
>>>>>>> +{
>>>>>>> +    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
>>>>>>> +    struct vhost_vdpa *v = &s->vhost_vdpa;
>>>>>>> +
>>>>>>> +    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>>>>>> +
>>>>>>> +    if (v->index == 0) {
>>>>>>> +        vhost_vdpa_net_data_start_first(s);
>>>>>>> +        return 0;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    if (v->shadow_vqs_enabled) {
>>>>>>> +        VhostVDPAState *s0 = vhost_vdpa_net_first_nc_vdpa(s);
>>>>>>> +        v->iova_tree = s0->vhost_vdpa.iova_tree;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void vhost_vdpa_net_client_stop(NetClientState *nc)
>>>>>>> +{
>>>>>>> +    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
>>>>>>> +    struct vhost_dev *dev;
>>>>>>> +
>>>>>>> +    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>>>>>> +
>>>>>>> +    dev = s->vhost_vdpa.dev;
>>>>>>> +    if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
>>>>>>> +        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
>>>>>>> +    }
>>>>>>> +}
>>>>>>> +
>>>>>>>      static NetClientInfo net_vhost_vdpa_info = {
>>>>>>>              .type = NET_CLIENT_DRIVER_VHOST_VDPA,
>>>>>>>              .size = sizeof(VhostVDPAState),
>>>>>>>              .receive = vhost_vdpa_receive,
>>>>>>> +        .start = vhost_vdpa_net_data_start,
>>>>>>> +        .stop = vhost_vdpa_net_client_stop,
>>>>>>>              .cleanup = vhost_vdpa_cleanup,
>>>>>>>              .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
>>>>>>>              .has_ufo = vhost_vdpa_has_ufo,
>>>>>>> @@ -351,7 +401,7 @@ dma_map_err:
>>>>>>>
>>>>>>>      static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>>>>>>>      {
>>>>>>> -    VhostVDPAState *s;
>>>>>>> +    VhostVDPAState *s, *s0;
>>>>>>>          struct vhost_vdpa *v;
>>>>>>>          uint64_t backend_features;
>>>>>>>          int64_t cvq_group;
>>>>>>> @@ -425,6 +475,15 @@ out:
>>>>>>>              return 0;
>>>>>>>          }
>>>>>>>
>>>>>>> +    s0 = vhost_vdpa_net_first_nc_vdpa(s);
>>>>>>> +    if (s0->vhost_vdpa.iova_tree) {
>>>>>>> +        /* SVQ is already configured for all virtqueues */
>>>>>>> +        v->iova_tree = s0->vhost_vdpa.iova_tree;
>>>>>>> +    } else {
>>>>>>> +        v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>>>>>>> +                                           v->iova_range.last);
>>>>>> I wonder how this case could happen, vhost_vdpa_net_data_start_first()
>>>>>> should've allocated an iova tree on the first data vq. Is zero data vq
>>>>>> ever possible on net vhost-vdpa?
>>>>>>
>>>>> It's the case of the current qemu master when only CVQ is being
>>>>> shadowed. It's not that "there are no data vq": If that case were
>>>>> possible, CVQ vhost-vdpa state would be s0.
>>>>>
>>>>> The case is that since only CVQ vhost-vdpa is the one being migrated,
>>>>> only CVQ has an iova tree.
>>>> OK, so this corresponds to the case where live migration is not started
>>>> and CVQ starts in its own address space of VHOST_VDPA_NET_CVQ_ASID.
>>>> Thanks for explaining it!
>>>>
>>>>> With this series applied and with no migration running, the case is
>>>>> the same as before: only SVQ gets shadowed. When migration starts, all
>>>>> vqs are migrated, and share iova tree.
>>>> I wonder what is the reason to share the iova tree when migration
>>>> starts, I think CVQ may stay on its own VHOST_VDPA_NET_CVQ_ASID still?
>>>>
>>>> Actually there's discrepancy in vhost_vdpa_net_log_global_enable(), I
>>>> don't see explicit code to switch from VHOST_VDPA_NET_CVQ_ASID to
>>>> VHOST_VDPA_GUEST_PA_ASID for the CVQ. This is the address space I
>>>> collision I mentioned earlier:
>>>>
>>> There is no such change. This code only migrates devices with no CVQ,
>>> as they have their own difficulties.
>>>
>>> In the previous RFC there was no such change either. Since it's hard
>>> to modify passthrough devices IOVA tree, CVQ AS updates keep being
>>> VHOST_VDPA_NET_CVQ_ASID.
>> That's my understanding too, the current code doesn't support changing
>> AS once it is set, although uAPI doesn't prohibit it.
>>
>>> They both share the same IOVA tree though, just for simplicity.
>> It would be good to document this assumption somewhere in the code, it's
>> not easy to infer userspace doesn't have the same view as that in the
>> kernel in terms of the iova tree being used.
>>
>>>    If
>>> address space exhaustion is a problem we can make them independent,
>>> but this complicates the code a little bit.
>>>
>>>> 9585@1676093788.259201:vhost_vdpa_dma_map vdpa:0x7ff13088a190 fd: 16
>>>> msg_type: 2 asid: 0 iova: 0x1000 size: 0x2000 uaddr: 0x55a5a7ff3000
>>>> perm: 0x1 type: 2
>>>> 9585@1676093788.279923:vhost_vdpa_dma_map vdpa:0x7ff13088a190 fd: 16
>>>> msg_type: 2 asid: 0 iova: 0x3000 size: 0x1000 uaddr: 0x55a5a7ff6000
>>>> perm: 0x3 type: 2
>>>> 9585@1676093788.290529:vhost_vdpa_set_vring_addr dev: 0x55a5a77cec20
>>>> index: 0 flags: 0x0 desc_user_addr: 0x1000 used_user_addr: 0x3000
>>>> avail_user_addr: 0x2000 log_guest_addr: 0x0
>>>> :
>>>> :
>>>> 9585@1676093788.543567:vhost_vdpa_dma_map vdpa:0x7ff1302b6190 fd: 16
>>>> msg_type: 2 asid: 0 iova: 0x16000 size: 0x2000 uaddr: 0x55a5a7959000
>>>> perm: 0x1 type: 2
>>>> 9585@1676093788.576923:vhost_vdpa_dma_map vdpa:0x7ff1302b6190 fd: 16
>>>> msg_type: 2 asid: 0 iova: 0x18000 size: 0x1000 uaddr: 0x55a5a795c000
>>>> perm: 0x3 type: 2
>>>> 9585@1676093788.593881:vhost_vdpa_set_vring_addr dev: 0x55a5a7580930
>>>> index: 7 flags: 0x0 desc_user_addr: 0x16000 used_user_addr: 0x18000
>>>> avail_user_addr: 0x17000 log_guest_addr: 0x0
>>>> 9585@1676093788.593904:vhost_vdpa_dma_map vdpa:0x7ff13026d190 fd: 16
>>>> msg_type: 2 asid: 1 iova: 0x19000 size: 0x1000 uaddr: 0x55a5a77f8000
>>>> perm: 0x1 type: 2
>>>> 9585@1676093788.606448:vhost_vdpa_dma_map vdpa:0x7ff13026d190 fd: 16
>>>> msg_type: 2 asid: 1 iova: 0x1a000 size: 0x1000 uaddr: 0x55a5a77fa000
>>>> perm: 0x3 type: 2
>>>> 9585@1676093788.616253:vhost_vdpa_dma_map vdpa:0x7ff13026d190 fd: 16
>>>> msg_type: 2 asid: 1 iova: 0x1b000 size: 0x1000 uaddr: 0x55a5a795f000
>>>> perm: 0x1 type: 2
>>>> 9585@1676093788.625956:vhost_vdpa_dma_map vdpa:0x7ff13026d190 fd: 16
>>>> msg_type: 2 asid: 1 iova: 0x1c000 size: 0x1000 uaddr: 0x55a5a7f4e000
>>>> perm: 0x3 type: 2
>>>> 9585@1676093788.635655:vhost_vdpa_set_vring_addr dev: 0x55a5a7580ec0
>>>> index: 8 flags: 0x0 desc_user_addr: 0x1b000 used_user_addr: 0x1c000
>>>> avail_user_addr: 0x1b400 log_guest_addr: 0x0
>>>> 9585@1676093788.635667:vhost_vdpa_listener_region_add vdpa:
>>>> 0x7ff13026d190 iova 0x0 llend 0xa0000 vaddr: 0x7fef1fe00000 read-only: 0
>>>> 9585@1676093788.635670:vhost_vdpa_listener_begin_batch
>>>> vdpa:0x7ff13026d190 fd: 16 msg_type: 2 type: 5
>>>> 9585@1676093788.635677:vhost_vdpa_dma_map vdpa:0x7ff13026d190 fd: 16
>>>> msg_type: 2 asid: 0 iova: 0x0 size: 0xa0000 uaddr: 0x7fef1fe00000 perm:
>>>> 0x3 type: 2
>>>> 2023-02-11T05:36:28.635686Z qemu-system-x86_64: failed to write, fd=16,
>>>> errno=14 (Bad address)
>>>> 2023-02-11T05:36:28.635721Z qemu-system-x86_64: vhost vdpa map fail!
>>>> 2023-02-11T05:36:28.635744Z qemu-system-x86_64: vhost-vdpa: DMA mapping
>>>> failed, unable to continue
>>>>
>>> I'm not sure how you get to this. Maybe you were able to start the
>>> migration because the CVQ migration blocker was not effectively added?
>> It's something else, below line at the start of
>> vhost_vdpa_net_cvq_start() would override the shadow_data on the CVQ.
>>
>>       v->shadow_data = s->always_svq;
>>
>> Which leads to my previous question why shadow_data needs to apply to
>> the CVQ
>>
> Ok, I'm proposing some documentation here. I'll send a new patch
> adding it to the sources if you think it is complete.
It's fine, I don't intend to block on this. But what I really meant is 
that there is a bug in the line I pointed out earlier. shadow_data is 
already set by net_vhost_vdpa_init() at init time (for the x-svq=on 
case). For the x-svq=off case, vhost_vdpa_net_log_global_enable() sets 
shadow_data to true on the CVQ within the migration notifier, that's 
correct and expected; however, the subsequent vhost_net_start() function 
right after would call into vhost_vdpa_net_cvq_start(). The latter 
inadvertently sets the CVQ's shadow_data back to false, which defeats 
the purpose of using shadow_data to indicate translating iova on 
shadowed CVQ using the *shared* iova tree. You can say migration with 
CVQ is blocked anyway so this code path doesn't get exposed for now, but 
that somehow causes conflict and confusions for readers to understand 
what the code attempts to achieve. Maybe remove this line or move this 
line to vhost_vdpa_net_cvq_stop()?

> Shadow_data needs to apply to CVQ because memory_listener is
> registered against CVQ,
It's bound to the last virtqueue pair which is not necessarily a CVQ.
>   and memory listener needs to know if data vqs
> are passthrough or shadowed. We could apply a memory register to a
> different vhost_vdpa but then its lifecycle gets complicated.
The lifecycle can remain same but the code will be a lot messier for 
sure. :)

> ---
>
> For completion, the original discussion was [1].
>
>> and why the userspace iova is shared between data queues and CVQ.
> It's not shared unless the device does not support ASID. They only
> share the iova tree because iova tree itself is not used for tracking
> memory itself but only translations, so its lifecycle is easier. Each
> piece of memory's lifecycle is tracked differently:
> * Guest's memory is tracked by the memory listener itself, so we got
> all the regions at register / unregister and in its own updates.
> * SVQ vrings are tracked in vhost_vdpa->shadow_vqs[i].
> * CVQ shadow buffers are tracked in net VhostVDPAState.
> ---
>
> I'll send a new series adding the two pieces of doc if you think they
> are complete. Please let me know if you'd add or remove something.
No you don't have to. Just leave it as-is.

What I thought about making two iova trees independent was not just 
meant for translation but also keep sync with kernel's IOVA address 
space, so that it causes less fluctuations by sending down thinner iova 
update for the unmap and map cycle when switching mode. For now sharing 
the iova tree is fine. I'll see if there's other alternative to keep 
guest memory identity mapped 1:1 on the iova tree across the mode 
switch. Future work you don't have to worry about now.

Thanks,
-Siwei

>
> Note that this code is already on qemu master so this doc should not
> block this series, correct?
>
> Thanks!
>
> [1] https://mail.gnu.org/archive/html/qemu-devel/2022-11/msg02033.html
>
>> -Siwei
>>
>>
>>> Thanks!
>>>
>>>
>>>> Regards,
>>>> -Siwei
>>>>> Thanks!
>>>>>
>>>>>> Thanks,
>>>>>> -Siwei
>>>>>>> +    }
>>>>>>> +
>>>>>>>          r = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer,
>>>>>>>                                     vhost_vdpa_net_cvq_cmd_page_len(), false);
>>>>>>>          if (unlikely(r < 0)) {
>>>>>>> @@ -449,15 +508,9 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
>>>>>>>          if (s->vhost_vdpa.shadow_vqs_enabled) {
>>>>>>>              vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
>>>>>>>              vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
>>>>>>> -        if (!s->always_svq) {
>>>>>>> -            /*
>>>>>>> -             * If only the CVQ is shadowed we can delete this safely.
>>>>>>> -             * If all the VQs are shadows this will be needed by the time the
>>>>>>> -             * device is started again to register SVQ vrings and similar.
>>>>>>> -             */
>>>>>>> -            g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
>>>>>>> -        }
>>>>>>>          }
>>>>>>> +
>>>>>>> +    vhost_vdpa_net_client_stop(nc);
>>>>>>>      }
>>>>>>>
>>>>>>>      static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_len,
>>>>>>> @@ -667,8 +720,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>>>>>>>                                             int nvqs,
>>>>>>>                                             bool is_datapath,
>>>>>>>                                             bool svq,
>>>>>>> -                                       struct vhost_vdpa_iova_range iova_range,
>>>>>>> -                                       VhostIOVATree *iova_tree)
>>>>>>> +                                       struct vhost_vdpa_iova_range iova_range)
>>>>>>>      {
>>>>>>>          NetClientState *nc = NULL;
>>>>>>>          VhostVDPAState *s;
>>>>>>> @@ -690,7 +742,6 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>>>>>>>          s->vhost_vdpa.shadow_vqs_enabled = svq;
>>>>>>>          s->vhost_vdpa.iova_range = iova_range;
>>>>>>>          s->vhost_vdpa.shadow_data = svq;
>>>>>>> -    s->vhost_vdpa.iova_tree = iova_tree;
>>>>>>>          if (!is_datapath) {
>>>>>>>              s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
>>>>>>>                                                  vhost_vdpa_net_cvq_cmd_page_len());
>>>>>>> @@ -760,7 +811,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>>>>>          uint64_t features;
>>>>>>>          int vdpa_device_fd;
>>>>>>>          g_autofree NetClientState **ncs = NULL;
>>>>>>> -    g_autoptr(VhostIOVATree) iova_tree = NULL;
>>>>>>>          struct vhost_vdpa_iova_range iova_range;
>>>>>>>          NetClientState *nc;
>>>>>>>          int queue_pairs, r, i = 0, has_cvq = 0;
>>>>>>> @@ -812,12 +862,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>>>>>              goto err;
>>>>>>>          }
>>>>>>>
>>>>>>> -    if (opts->x_svq) {
>>>>>>> -        if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
>>>>>>> -            goto err_svq;
>>>>>>> -        }
>>>>>>> -
>>>>>>> -        iova_tree = vhost_iova_tree_new(iova_range.first, iova_range.last);
>>>>>>> +    if (opts->x_svq && !vhost_vdpa_net_valid_svq_features(features, errp)) {
>>>>>>> +        goto err;
>>>>>>>          }
>>>>>>>
>>>>>>>          ncs = g_malloc0(sizeof(*ncs) * queue_pairs);
>>>>>>> @@ -825,7 +871,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>>>>>          for (i = 0; i < queue_pairs; i++) {
>>>>>>>              ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>>>>>>>                                           vdpa_device_fd, i, 2, true, opts->x_svq,
>>>>>>> -                                     iova_range, iova_tree);
>>>>>>> +                                     iova_range);
>>>>>>>              if (!ncs[i])
>>>>>>>                  goto err;
>>>>>>>          }
>>>>>>> @@ -833,13 +879,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>>>>>          if (has_cvq) {
>>>>>>>              nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>>>>>>>                                       vdpa_device_fd, i, 1, false,
>>>>>>> -                                 opts->x_svq, iova_range, iova_tree);
>>>>>>> +                                 opts->x_svq, iova_range);
>>>>>>>              if (!nc)
>>>>>>>                  goto err;
>>>>>>>          }
>>>>>>>
>>>>>>> -    /* iova_tree ownership belongs to last NetClientState */
>>>>>>> -    g_steal_pointer(&iova_tree);
>>>>>>>          return 0;
>>>>>>>
>>>>>>>      err:
>>>>>>> @@ -849,7 +893,6 @@ err:
>>>>>>>              }
>>>>>>>          }
>>>>>>>
>>>>>>> -err_svq:
>>>>>>>          qemu_close(vdpa_device_fd);
>>>>>>>
>>>>>>>          return -1;


