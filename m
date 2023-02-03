Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E924688ED1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 06:10:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNoJW-0004im-If; Fri, 03 Feb 2023 00:08:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pNoJU-0004iZ-1F
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 00:08:40 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pNoJR-0003nd-Bb
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 00:08:39 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3130O0at008554; Fri, 3 Feb 2023 05:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=zt5JdPc/iGs8Zn45z+Sy6cZ5112Kwe15P1dK3McvqRs=;
 b=Q1SO2XEYELic9qJdCnSPD/2tj7NSYHYElEO5B9mS6EG/OaYHDbYfac0DT5+OrGcwCFYU
 xZ+pTey4VqG2wSbDQrKOyhrKZsymkfYEdu15njiQTXsG2BugQUY5gBlLIganxzaE6L/e
 3vT80u/xkBoNoBEnrTlqzJAJQHlxtq58SS9bq9WBAJ+hGWwX62jWcYYWW1gvYlGdCLGW
 aBdJbLDDn/J9GrRJFl+DsW/DR4Wu0kbjqlENn68sCdP4kL2h34ss7Dgb5x5Nh4fagvER
 yTSwTNTWfpunu32kVxH9pJR1E2HAOtdWx/hY/ha2y9h1jd49dxou/+FDki1VBIl/D65L qw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfpywmg8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Feb 2023 05:08:23 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3133rYtu040685; Fri, 3 Feb 2023 05:08:23 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct5a2wpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Feb 2023 05:08:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHFatF33bgRYAkpngiAUsN31y9LImFxx5fTuwiQJxSfy9X9jhYqAnfVpEF8+BIUEsZ4e4VrfIgA7OFcVTFqxyo2FzWX/S6VAwvEOqBaOfF4U5ih7MWfskS1e4G24/ku3LGUjPu7dyk4lJwYvaOH3X5MBj3KbJYmiW28ONv7lkkLKqMOedRivPYsRhDk56VK2U9hl3F+gyn1fluNZ4NVoTpBHbZl9Iazlh6fIUIXCvamGhd+cAey/oq25EXq5rkrWLVUkXDXtjxl0safdAIwXOtf10EyBjbjq+V1h6MTaWBBHHkqBT4S4r/PUNwma80hnGoVK5e0UZ/sJPHLwQXXCbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zt5JdPc/iGs8Zn45z+Sy6cZ5112Kwe15P1dK3McvqRs=;
 b=XA2/KXpUFaAYMkKUzknIHydKefY7uXPUlkLwySZJljZjiE8auKZIbbBOBlxSOdpiTGGxGFAA9t2uK6OVBFX4XhmkgVz67kffR/Lr5EfIWQdz9lGn+K4Oy1BdRPlDpuZ1K9xEarU6zjttJhuCrXnAWWQLIC6u1RKlrhE9BzvCT7/tdp2BuS23ns4CNbWZGaNEbCVqa5i6P0c3RbLF7HALQw/QlD/7ZtjVl1hkOIZRQVTOVLuj9J2mqOLweAu4idd18Xaj31cB+NHhijnd7D0myN5MgrVY6Sf5b0tqXziLioc9hHyApsPvZG9L4vcP7pGLaKsPk6lAj8sYwIck+Vqi4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zt5JdPc/iGs8Zn45z+Sy6cZ5112Kwe15P1dK3McvqRs=;
 b=HXGf4H0+Apg03/Jw44TYTw6Nlila4bRs+IWmU0syhTSA4qwXdevnr9cAR+gXdDsIBUyLHRQVMldENOMp2P8eH1Ek2U0tRCQi8XTjXeds+7/NyX0FN9bA8HUXOq0g6hds6pSU+VLalcQ0IEMI1ptguskYpSoa8f0uSxgaybXnqvU=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by DS7PR10MB5101.namprd10.prod.outlook.com (2603:10b6:5:3b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Fri, 3 Feb
 2023 05:08:20 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::cd0e:bbf4:4b15:308b]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::cd0e:bbf4:4b15:308b%6]) with mapi id 15.20.6086.009; Fri, 3 Feb 2023
 05:08:20 +0000
Message-ID: <a5ea8a1e-889d-8871-dec1-d156fbddbe1b@oracle.com>
Date: Thu, 2 Feb 2023 21:08:15 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC v2 00/13] Dinamycally switch to vhost shadow virtqueues at
 vdpa net migration
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>,
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
 <17ca79ae-7cda-3d1e-4935-d783ecbe992e@oracle.com>
 <CAJaqyWetxZ1kn--LJ9VZBy0fNgaSnFYjiNDQbU7h4Br0uKR44A@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAJaqyWetxZ1kn--LJ9VZBy0fNgaSnFYjiNDQbU7h4Br0uKR44A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR10CA0005.namprd10.prod.outlook.com
 (2603:10b6:806:a7::10) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|DS7PR10MB5101:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c8e79c-b1e3-4e12-d1d0-08db05a4aadb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C1vl+uRKKT84BL7Gm6y1Vjzx5wPq85KR1FMcMlfPiZxjQhMD8ncT1aqYpi2lI/qCjPNXdyTk8nR4fjKASEDG5V4h4PGH9crI8oyaCWFbMue6tpCchBOePgZm63YDCVTbbZnXRn+Rj5OXhIXAx1jox129/MsGmX91uA3KPPuGTyVPKYwagV7wPg6xngCLBPIvaLtTcKggspKs6npcAUekUbbZyBPK5MBIcODYjw0Ea5REWjc9yuyRxhb6UcQx10qAsQLeaD4/8Kvkrpyz6VXq/sHNbHN+uQtlUdsbLly73MQ53hQ0jy0ughbrAlbl7RzpZ/X3qRSetb+tVLX3Mhog4dstsv/bmShfU8uerp+resgW6FLbFXYU8kxVwzgZzwiCeuhmBDLo4nUp+0B3E4wclXfLuR2DznEHKW0f2iELMZx4v5Kn2uKT9DvF6RQgVO3Slc8zemO46rfsLdWw0b/VeeIRG/TUelpNkGRhSdJAjwx7OTq2mItBE7xk1TzhAKd+dgS2zwmTqRsMJrQ0PuavMxI+dAvVcc6qs7KVd0dUplWkYRedXVjdpT+6Bud36p677I+FNYZ2Ql3HyT7s9mE/Sbm2JZNAoaZIlciwmXJokjcYBIxXh7EeanmoNQhADUDkGRAR+JmmHxWw3uW1SgVNfriiCO06CMVJPVhY25Lty6zc3qxb/SheKfHi7lyREm7fVhTUqYxtstI1Ca5omp6B3STtTEZmUdy8Scj4UIPDpA/yTB50LUxYNFY16dPwlPyfDcGDY8fna+gvIfQcIhf6QA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199018)(31686004)(4326008)(83380400001)(6916009)(8676002)(66476007)(66946007)(66556008)(66574015)(2616005)(66899018)(41300700001)(38100700002)(6512007)(2906002)(36756003)(8936002)(186003)(26005)(53546011)(36916002)(316002)(54906003)(7416002)(478600001)(5660300002)(6506007)(31696002)(6666004)(86362001)(6486002)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEZnYkJHT3R1UVRoUTVPMVhhZVNQY3M0QU9PZ3dxeVN6ZThrWUFKa01wVmU4?=
 =?utf-8?B?OHR0eDBiVWZkR2ZHVE1Vc0FYT3plRExMZldMa0JIZ20yTW5BU1BCT2ovVkMy?=
 =?utf-8?B?c3pXakQyZ3JVekI5MVV4RmNiMTlCTnkvaFVkNXlkNkhBSTZJRTF2VlQ3aEE0?=
 =?utf-8?B?Mlp5cUo3VEk5SnFTcytwbDdaUmFUL1k3M1NWMnhjbVp6NHV4aWxYMDlHUERa?=
 =?utf-8?B?ZzFyS2o4VjhqQlVzTXdzeS9wbjRoanRveDRTbW03WUVwY0ExRGlyZDZQclBP?=
 =?utf-8?B?c0c3U2RyUGJFTU1jcmtHeTMyQ3l1Mm1SNU5qeFBaVFI1TERHckw2NEd4ZmYx?=
 =?utf-8?B?aCtSZ0FaK2JPY2RMNE0rL0N2eTdiMDJEMldwV3pQTkk5YXdmbXIwTzA0dC9l?=
 =?utf-8?B?SXIydlQ2bmMwN3daRkpHM2tDMjVlMTZxMmM0M29vaGJYK0N4MnhrNUV5U1Bj?=
 =?utf-8?B?ZS9JY0Z5YXBpSktNVVJBNk1VQ252bVJ5akpkK21rYlNUZVVGM1o0anJ0REpC?=
 =?utf-8?B?RE5ZTXByaXVZN3lac0tPNlhZaGtqOThZU3Z6a0ZsQ2VOY0JncCt1K0tPWlpY?=
 =?utf-8?B?ZHhZU0tETE1FbHB5dXVrU0lZVVk3WVJEWEFQQTlwT3JnQlRxQ01uU05MaHVX?=
 =?utf-8?B?R3NCNXpVQjl0MVh6NWRYWlpSMW9FNGI3SFBTbmxmbnA5WWMreDhDRXVDMzVr?=
 =?utf-8?B?YVdqaUUwelNPK2xkbHRYQXdrVGtVVXVKaHhCcFIzTG52OXMxdkc3ZnFGalpZ?=
 =?utf-8?B?eUo2dDhzMVpUWFRXeTJ6SmtTNUdGaHFJdFR4NjNnT2Z2Ui9FMEY2K2JKend5?=
 =?utf-8?B?LzhoNnZjZDB2UCtjWGcyNTRrREh0M2RUYnpmRXlDMHc0ODVGdjhIZTFVa0V3?=
 =?utf-8?B?Y1BJY3YrS0IyL1pGV1pwL0ZJZ2dHdUNWV0VNbDZpNzFHS3Q3YnB4ZlJrZERx?=
 =?utf-8?B?MkdteTcyNFEwRVZ5OFJzREdiVTBVb2lkN0lkd0FuUTcxNk9ZR3JDU2p6elJT?=
 =?utf-8?B?NEhxWWdZTVRLS0FvdGlBWUdXQmp2a0tnVU5UVDlGQkpzU0VESTMvb3g1YlRD?=
 =?utf-8?B?LzIvMmY2emxEVUc1UWJLMk5aKy93QVVaajY4aXA0ZmFNSlJBNHlsYjIwd2hC?=
 =?utf-8?B?bU5zQkJ6WVAxY2M5clV6MHBVUHo1OGlPQTZVRFM5UUZuYU5ZVHJOYVBHSjM2?=
 =?utf-8?B?ZXc4citNcDNZYUlCeFJLZlR0eTBtajVjUmVhWXVObUphUGZhUEx1NktBc0JV?=
 =?utf-8?B?MHkrc0JlMVYrSDlYM3IzZkZpWkxRMlR3ZDg2bER5cVVwcFRhczB0Z1ZlTU1m?=
 =?utf-8?B?MHZJZlA1OUlnQ1BLbWdmb2xWc25xL2xFVGRjZWxSbW5tUFF1V1BHOWg1S0Q3?=
 =?utf-8?B?OERqS1pwdC9sWkx1ZFJsZDc1UEZsYlFISU5SZ21JMnRlTjNIdFlQKzJEOSs4?=
 =?utf-8?B?YjNOT3lGaGYrcmJ1NDlvNnAzZFhiOUtsK2RjVFFqeEtta0ZhQmRKLzNNSEVx?=
 =?utf-8?B?YjJ1UmhCL2JmQnBtTkd6eU5vaXhqaDdUNXFDaHc1RGVLbi9MbzFsZ01VblFF?=
 =?utf-8?B?SE1tbEI5M2FybHlJQ0hkU3Y0UktDbE5uMzVKVlFqS0o2bmhGaU14Syt5MHR0?=
 =?utf-8?B?c05ELzBrT0pRT1MwTXFIck1HOFN0SDQyMVd0VERNVFhkRmlYelU0eXVmeHpa?=
 =?utf-8?B?VVUyd0JQcnd1ODF4TGFyM1lUVld4bVhrTVNoYks5cmFYenluZkcwcGozem9y?=
 =?utf-8?B?MzZqQ2JWYmlGR3U1YnkvZkV3eVBDRHNiM280dFMrMGUzb3MybjFyaWI5OWFX?=
 =?utf-8?B?L2E5UGJENGN5dlY4TytxMWhObXgvRzliaXluTkl3LzZHbkxySjVZeGVIZjEr?=
 =?utf-8?B?c0NxN3pXSnV1VURqc3ZQYjVYNk5IQ0d0RWhDU0VuUHpodmFFdWVsQ0VieUNT?=
 =?utf-8?B?eHVMVmN3emJib1EyTGhEM00zWFZxVnJ0NFNGVzI3TnFaY1hrUGFUNmVFdDdv?=
 =?utf-8?B?ZWRvcWx6TDNjRmlWK3FZRXhVSW5Ycld3UmhKbURkYW8yOHBkMEJERzhMREtl?=
 =?utf-8?B?V1pxTHIwbzk1Z1MyYWQwRmZnSXhvaVl0ZWk4SmEyQ3RZTS8rbVcycjZUVFh6?=
 =?utf-8?Q?4L7XyyIHFodmPhJ89Xe26e9wH?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?UGJMSVZnaVhGRXhOWVhpdmhzWkk2eG9jZjFSVy91MnZ2WFRUM1Q5NkNMU3B0?=
 =?utf-8?B?MXJxcVpDeFVrU1B6TjhvTmIvWkdXZmdJUjd5YUF6MDAxVXlJS1FrMzFIZWhp?=
 =?utf-8?B?OS9hcm5hckYvTDErZ0FHUU1EYmRPanFyT3phdWlnZVY2SVZ2ZUhyVUZJcU53?=
 =?utf-8?B?c2lXVm5qeHhRUU1WRWhxdER6RmRuOGpUZTBsQ2V6dUJqODZ1eWo4WGtoR0VH?=
 =?utf-8?B?QjZkaStYbkFsK25haFBXWEdDRlV0YnEyaWIyTHBjWUxhNVNNUkswbzdpQXNQ?=
 =?utf-8?B?aHZ4T3hlbjcxSEYvV1pYM2JGemF4bnZYTFFqeHFJN0hlN0xER3FCSVZIcVJs?=
 =?utf-8?B?WnJGTHZTNXFQZ0ZiOHEvRnFTNmxETUtKOFVzMTQ5TGF0a3Q4ZWZpNWVJcndF?=
 =?utf-8?B?QmlLK210SVpMNG5YT0ZrcFZlNlR6b3JLRldhcFl6MHNOOEI5aXUrMm9FcWhZ?=
 =?utf-8?B?SVFGbCtKc2ZET25sdDQzczB1eFVxZWRqL3ZZSGoxQ0oxK1RDQXl5eElqMm0y?=
 =?utf-8?B?NmdTZGFXRE00UjEraVpwdDMrTGNEZmhkS0hXVW5MQ3RqU3pOL0dtMjEzSGtJ?=
 =?utf-8?B?MEc4THQ1amtxQm1pdmhpN2IwRVVZa0FKd291ZDhoODJENVJKRVlYUU9iVGZn?=
 =?utf-8?B?QndKaXk1YzlHL2F6TGZxeFpzL3JRWmhRVVZpUXIzb2o2VncwWGVESXhQUGNB?=
 =?utf-8?B?eStvaXNiLzRDNytESWdqM3BnWGVPYnZHdFp6ZDR3NXZKSFdqQUZ1MkdWMU9o?=
 =?utf-8?B?SjlsemFOL0NieEZBbytoaWRldDhFczRIQlN1U1JOOC9hWndJZXluQ0dCVzVV?=
 =?utf-8?B?ejlrWTBrMmNGS25Sa3RmU0h3TDZTVll1bnhZNElpL0JIVTYxUjNwMjljVzEw?=
 =?utf-8?B?YTZVK3RISmRydDFtRVk1S1pSOU9nVmk4KzJ1Sy9vQ1FCTStuaUJDSTBScDVD?=
 =?utf-8?B?YVR2R2NFeGwxb0tnWTNrbkNOWXZuSXhlY3NtNjh3c09vNVdNU0JwcVltT0tS?=
 =?utf-8?B?bFRPTnlXYjlrMUZNUlVJNlNJd2ZOdTdtRGF6RTRrbTIycEZyTHN2cSsrU2U0?=
 =?utf-8?B?aVoxNWpTNlk5Y3FyTDZnZWRwdnJqWnlheDd5Zzhna1hXOXBQbWl5USttQTJT?=
 =?utf-8?B?V01pcjFlK2NhdUZyTVBEc1hIVUFWMnJTVnRKT0d5RjBoa1dOK2NtbUFKUDF3?=
 =?utf-8?B?Q0hSNS9lclYzNis3YndXWDI1ejJLNjZUQkJBT0JuWDlhSkRpNHZFTFNISFJ4?=
 =?utf-8?B?UE5nRHEwNklDTmpsd3Z3N1VyV2hOMnoxV1J3UDc1UGV4ekN2QT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c8e79c-b1e3-4e12-d1d0-08db05a4aadb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 05:08:20.4844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zy0i9lDLRfALXYj+j95IK6GZmK5PCR4s/I/dgqW39UQYOvMRg3opQcjMAKOvugdH4TvCBe8QqDSB5bL7YPGFXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5101
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_02,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302030046
X-Proofpoint-GUID: nkt0Az6euJjGYqolaWtKpOL5RpbUUEqJ
X-Proofpoint-ORIG-GUID: nkt0Az6euJjGYqolaWtKpOL5RpbUUEqJ
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
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



On 2/2/2023 3:27 AM, Eugenio Perez Martin wrote:
> On Thu, Feb 2, 2023 at 2:00 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 1/12/2023 9:24 AM, Eugenio Pérez wrote:
>>> It's possible to migrate vdpa net devices if they are shadowed from the
>>>
>>> start.  But to always shadow the dataplane is effectively break its host
>>>
>>> passthrough, so its not convenient in vDPA scenarios.
>>>
>>>
>>>
>>> This series enables dynamically switching to shadow mode only at
>>>
>>> migration time.  This allow full data virtqueues passthrough all the
>>>
>>> time qemu is not migrating.
>>>
>>>
>>>
>>> Successfully tested with vdpa_sim_net (but it needs some patches, I
>>>
>>> will send them soon) and qemu emulated device with vp_vdpa with
>>>
>>> some restrictions:
>>>
>>> * No CVQ.
>>>
>>> * VIRTIO_RING_F_STATE patches.
>> What are these patches (I'm not sure I follow VIRTIO_RING_F_STATE, is it
>> a new feature that other vdpa driver would need for live migration)?
>>
> Not really,
>
> Since vp_vdpa wraps a virtio-net-pci driver to give it vdpa
> capabilities it needs a virtio in-band method to set and fetch the
> virtqueue state. Jason sent a proposal some time ago [1], and I
> implemented it in qemu's virtio emulated device.
>
> I can send them as a RFC but I didn't worry about making it pretty,
> nor I think they should be merged at the moment. vdpa parent drivers
> should follow vdpa_sim changes.
Got it. No bother sending RFC for now, I think it's limited to virtio 
backed vdpa providers only. Thanks for the clarifications.

-Siwei

>
> Thanks!
>
> [1] https://lists.oasis-open.org/archives/virtio-comment/202103/msg00036.html
>
>> -Siwei
>>
>>> * Expose _F_SUSPEND, but ignore it and suspend on ring state fetch like
>>>
>>>     DPDK.
>>>
>>>
>>>
>>> Comments are welcome, especially in the patcheswith RFC in the message.
>>>
>>>
>>>
>>> v2:
>>>
>>> - Use a migration listener instead of a memory listener to know when
>>>
>>>     the migration starts.
>>>
>>> - Add stuff not picked with ASID patches, like enable rings after
>>>
>>>     driver_ok
>>>
>>> - Add rewinding on the migration src, not in dst
>>>
>>> - v1 at https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01664.html
>>>
>>>
>>>
>>> Eugenio Pérez (13):
>>>
>>>     vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check
>>>
>>>     vdpa net: move iova tree creation from init to start
>>>
>>>     vdpa: copy cvq shadow_data from data vqs, not from x-svq
>>>
>>>     vdpa: rewind at get_base, not set_base
>>>
>>>     vdpa net: add migration blocker if cannot migrate cvq
>>>
>>>     vhost: delay set_vring_ready after DRIVER_OK
>>>
>>>     vdpa: delay set_vring_ready after DRIVER_OK
>>>
>>>     vdpa: Negotiate _F_SUSPEND feature
>>>
>>>     vdpa: add feature_log parameter to vhost_vdpa
>>>
>>>     vdpa net: allow VHOST_F_LOG_ALL
>>>
>>>     vdpa: add vdpa net migration state notifier
>>>
>>>     vdpa: preemptive kick at enable
>>>
>>>     vdpa: Conditionally expose _F_LOG in vhost_net devices
>>>
>>>
>>>
>>>    include/hw/virtio/vhost-backend.h |   4 +
>>>
>>>    include/hw/virtio/vhost-vdpa.h    |   1 +
>>>
>>>    hw/net/vhost_net.c                |  25 ++-
>>>
>>>    hw/virtio/vhost-vdpa.c            |  64 +++++---
>>>
>>>    hw/virtio/vhost.c                 |   3 +
>>>
>>>    net/vhost-vdpa.c                  | 247 +++++++++++++++++++++++++-----
>>>
>>>    6 files changed, 278 insertions(+), 66 deletions(-)
>>>
>>>
>>>


