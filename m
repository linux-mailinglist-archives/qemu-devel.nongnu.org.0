Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE046AA084
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 21:17:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYBpX-0004yN-NO; Fri, 03 Mar 2023 15:16:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pYBpV-0004yC-LY
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 15:16:37 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pYBpT-0003w6-4T
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 15:16:37 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 323Ix4Jp001571; Fri, 3 Mar 2023 20:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=fXrvU03FA7+4b9Q1LF+FCqgW7b4au4YkRMXAcXXIy6k=;
 b=wXssEJ6wuRd3fbQHQMnf4cBis5rt8Aa15iVuLAF2PDDV5IHk0c2RdHL9aqZs7gqHdER9
 Rx8dnr7Lp38Y8HfoDfWX5kuTJ34PPZYwiyjX+pSjsvvd0WB90hoDG7thf8PxUvc58LrA
 qhd4W7NPOSQBZiz1HfJNzlIQVFivUoJPLmvRIAmMT1xmOathTyan35sATq5PQ1wLpFst
 OOQ4AFtyEd7ccEeQcgjtnuFGY9WjduHLS9OtUsOBZPbp3LQSdeiD0o1WoKvhsIFjwbED
 1usxUKyoLmGGYcpmIm/sHdZ7RoPzEFa3cYgpe0QbCdzNu8LjGmw5C4HcpqbHIKW/0tVl TQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyb72q2gy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Mar 2023 20:16:31 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 323Jp7wN033358; Fri, 3 Mar 2023 20:16:30 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8sbxrdt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Mar 2023 20:16:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0CnX4fQyXX5BTkpTA9RtbyZc8+JiuVPGzTVix3/CrFCTvcerQI4u+uSefBlp9M6h17m4FJOGlJ/zeJBK+UHtPwe40UrAwT0+s/98GIhuNUP4tzzPgDITgWEVUMfEmzWq72RuY8eVxNmvo8LIe/Ez68cmLFU0VhEteSwFiR5V37+lCEWz0REvVL+g+UKkT+9bUSJ8RslE12qs2YUZYaytUItmN8aIaGYxhetC5+kH1JN1uu5dBvRGIp8YiqvoTjDIEmJGhksaM9I4Wy61heDNr4Nlwhs8IiiYsxfgddKfx61xLqx9OE4OMa8PDT9E379vcS0CSGYAebdTbvM95IcrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXrvU03FA7+4b9Q1LF+FCqgW7b4au4YkRMXAcXXIy6k=;
 b=GAU0fJTGMiyGGoyQHk8xjbMSrzHFMxNdbHsM30TuBzuC3/1y9EFxim8of7/K/LSvUBHgLBGSRIkhKg73u+pN4WGg3Tk15FH2W7oSObHcc3LsUJ8Hdyer1Od+XqfnOB11olvmQIxe6jRWGB1/iRqozaDfXM83Tocx3zuD6UDxQFWNCzenAW19IXVefwbHUGIv4TYEr2spnkRGEpfIQ9okX/ZN3NxDukk7m3SlCECw0MRxSRW3TfObi9hppSFvcKs0YfegTsWvoC8cJ3iYwn2Xd2nudTC+Wfl2AkbBcNg+eVddiEAaq1jJgOZDImalJfcv6Z+m2UkkdEf7oPEUQz4d6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXrvU03FA7+4b9Q1LF+FCqgW7b4au4YkRMXAcXXIy6k=;
 b=ylvCX5tzDSw9Y8Wfx+7LLu5+cxbSdXSJEVJ2IiTC2z9TvckgLfwvT4U6qhG6Gf7PrXTlQjAi1hKa9sqy7KoxiTnvfA1I/S6LrmPrHC6briFhERcsy4EBeogW3cskubsjXeQ3WE6lNu3D78QGai6tJg8lisD6mqz8RiDAiptBgL8=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CO6PR10MB5586.namprd10.prod.outlook.com (2603:10b6:303:145::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 20:16:28 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 20:16:28 +0000
Message-ID: <de73073a-821d-4c31-a8a7-80c054ca5f3a@oracle.com>
Date: Fri, 3 Mar 2023 20:16:19 +0000
Subject: Re: [PATCH v2 10/20] vfio/common: Record DMA mapped IOVA ranges
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-11-avihaih@nvidia.com>
 <20230222151039.1de95db4.alex.williamson@redhat.com>
 <83238759-4808-1e41-824b-865c330a431a@oracle.com>
 <20230223140527.096dc42b.alex.williamson@redhat.com>
 <a53767f9-b630-8f2e-0523-bd47d4539c61@oracle.com>
 <20230223145018.3c46a966.alex.williamson@redhat.com>
 <617b396a-d5e2-8c10-9717-1cc6fc9d43dd@oracle.com>
 <20230228133653.2f911490.alex.williamson@redhat.com>
 <114233e8-bdb8-21f5-ade9-0163658feb84@oracle.com>
 <20230302114248.41b6c21b.alex.williamson@redhat.com>
 <c1e5fa47-7028-5e24-2158-2e64aa44006a@oracle.com>
 <9e219add-ec7c-4408-902f-fce8c5c64020@oracle.com>
 <20230303100551.435e8cd3.alex.williamson@redhat.com>
 <87b39028-4b65-36bb-6b41-9d8ac56164a9@oracle.com>
 <20230303124025.64c35d87.alex.williamson@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20230303124025.64c35d87.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P195CA0024.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::29) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|CO6PR10MB5586:EE_
X-MS-Office365-Filtering-Correlation-Id: e663a3a6-cc7d-422d-fa26-08db1c242b6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RCQx9DQj0GtT8vb4BT80FoGwHiNRoRYDAH6tm7I51+JR/m0i2pIWvXEiyCUypWgDkFnGAf8Isacs97WTtanIlJ1jNmuIuXlVvLvseJteuAlJzIwCuJOtkP/SsvQ6vbuQbPu2p7js0rT9f3xIjWrijAZicUjBDi7fRn5Jq0LqThoOoOal2wxyjHWD9mna4bd47GaWz2wJKsGjcJsckYkkziRmalPGRLDyFb/lvxq5bpx71mybZCY0KwMwMoi21eQOlnq6uqSkb1BQyVbqQQCDjNk9iOWWFO9p2GBrOPBIQseOrgiVu0JaLIxhqeb+9CzhHF2g8dgOQM8ckq809NOZLqiFQFTHxLjhssEPSfZ7jnUqCVX8ukX0JXCM10+ZrL8JbnLb7xicJYBHUF5HGmnYRURtetBjWo9j5rx2jRBy6i4cuU4ayRkUzI0VLGC63eUYTzpR6NlUal7kRJTeZ6OWyh+NCm4Xi6SNgeyr4/3TSAKnZm5HN/4ZVRn5AkXvpkDbwou4H3rv2U5BNYmAiiSal3nyMzy1uBRKI83AI/MzMmFoWyV03hy8+nmwEedkwFmbGwER3mi0LToK33++05fLkGI6GVNj/tY0akXdrYQ6ldymH6lz7dNbiJOxSk4CQj5bMdi1NMgFo49So+KBNh0PmM5FHGle6z3Q245gLiJ9LBFGy5/5tf+idRv24YFRiNSX5YWBP+lhF+OKrHWhfi+85A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199018)(6486002)(7416002)(478600001)(5660300002)(83380400001)(38100700002)(2906002)(36756003)(86362001)(31696002)(2616005)(6666004)(6506007)(186003)(6512007)(26005)(53546011)(316002)(54906003)(8676002)(6916009)(4326008)(41300700001)(31686004)(66476007)(66556008)(8936002)(66946007)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVJEbjBsRHlKK0orUUpDbjduZFl0NnBQbmUxdFdrckxmcnZNTklOVis0VUNJ?=
 =?utf-8?B?SkpLVktma0dNbVRLbjVmRVRJdXpnOVdkZUpwWWlsbm5Tc0FDL3Ivck9XYmtJ?=
 =?utf-8?B?WnRzSWZ0dWZwc0JCM3BXQ1Z6R1J5ZkN0OEc3OGpiREZINVlFdFRIRU95aVFT?=
 =?utf-8?B?UlRpdXJvanVFa3NxbHNUOWlST3piM054VWhGT0J1dk10dGNHcEMzTlRuQzly?=
 =?utf-8?B?L2JBTEljbkErK0tObWY0d0lCK1NOZ2llcGgxTFp4bUJNaWtzbzhLanZVWG1r?=
 =?utf-8?B?NEhBcGJCdXB4SVRBaTNqTE5WRHBSTEsvc3Zsd1BBcjdHeVN2RnlNUSsrUjRr?=
 =?utf-8?B?NnZtZ1FzQzU5QmZUZGFRU08vRjBaZXA4RDcyK2FMNk5uSmJKTkltS2JpcEc1?=
 =?utf-8?B?SER0bjJNOHRiakcyRC82SnRYelZpTkpRZnZzd0VvVk14YjhmZ3lycFpQVjVS?=
 =?utf-8?B?Mkk5MGZnb1paWWVXTFcwQklsS0Zmdm0zeE9md3grYXhIMlJWZDJSa2JFeTVO?=
 =?utf-8?B?dGJ2RlVEMkZaUXVlMTkxeHJpQmFUNHFzVStsYk05VDhDZm9qN2owckFUTTUv?=
 =?utf-8?B?dExTRUZjYjVkVlRDV3U4OHpxTUoxbWpKa25iSlVTQmdBR2liWjBSMURWcDg5?=
 =?utf-8?B?eWo5Tlo4RXA5dE0wa3A2TWxxMDZwdHNpU3NvVStyTUVzeVUwUjhWVUtkaWxR?=
 =?utf-8?B?M3JraUVySlg0czZCQzFOTVdjZnpsdDNOSytyNFRPTFZkRCsrMDB2N3RrUDRZ?=
 =?utf-8?B?SGx0V2J5eGtUWnljUnEwSE1YbGE1aFlkNEFMT2NhbHZxbVZnK09TcnJ6MjFr?=
 =?utf-8?B?d1RpWHRGK21HU3ppYmU4ZmIzaC9kYUcxU1NBK3JZZXZDYUkvNENMK2lmRE81?=
 =?utf-8?B?OXBmUzdYaXdUWFZyOEYxTjJxTmZiOFlnVHZ6YWwyazdUa3Z4cFhQV0VWNXFj?=
 =?utf-8?B?WUNTb3pIR0pVLzdvcnI4MnNySmZDblFzWVFLYWFUTUpPN1psZmlEazRqMWJD?=
 =?utf-8?B?S3FtY3BKcmpGaG43NzFnMzM2bFV0WnZZUTQwNW1kTnJYYjJqZ1pGNC8zblZL?=
 =?utf-8?B?Qmk4L3ZHT0FkL21DRXBlajREZlFCN1RQcUVJc0wxeThxRGQ0QlFiN2dLeFA0?=
 =?utf-8?B?aHd3eGlML1NZWmpISFErQTc1ZHhXZjEvS2NxYmh3MFdaeW9jOUl4eDdPOWlm?=
 =?utf-8?B?VW8xem5QaFVzd0grbEhxNDFHZGVTWEZJdGQ1Y0NEeXMwWmpjTjYzYkVUeGdO?=
 =?utf-8?B?RlltWGE2RmFFK1ZURGtqNHZ0MzFzNlJOM2hielkvTmlzemZ4Smtld3NpaVVF?=
 =?utf-8?B?Vk81eHFzQW4wY3NpOEJoSzNNMUdEMUhIdUd2K2diSW4yNHpTdjAyN1ZCZmdu?=
 =?utf-8?B?VVkwVVhaTVpMeWd0Y3ljV005MnA2VkZJSGRzY2s1alFlSWRGbHROZGpDdlVk?=
 =?utf-8?B?cnhPQjRYeE5SY05ER01lU0VNMm52SVdYUEJWWDJFNVpHU1kwbk0xUXhOTEJY?=
 =?utf-8?B?UVZLTTBaWG5pU0JKYU9VYnNud2V5ZVVXdmIySFdkZzZWY0JZZ3IxeU9ySlFP?=
 =?utf-8?B?M1EwOGYyZWE1RVppbUU3aGdQOEhOdEJhV0VWbkl1VlF3TUZDajhpOUVsZCtB?=
 =?utf-8?B?azIrUlBCUTZKT3phaytwMEJXSzM3MTVlMmVUSm1uWjI3MHI4ZHJRelJJR2xr?=
 =?utf-8?B?Mzk2ck5Ub2VUd2NsV2phaWl4ODhNaEswWFl2T1lyWlFTWDBBUXN1VEw1NzE2?=
 =?utf-8?B?NVVUMUVUbjdkeVk2Nk9Gb0U0bXo4NUpWblV0NkdyZWlWOWZaYU5BVUl6ZEpE?=
 =?utf-8?B?QllFdk1iRis5MnRFVzBoYlVOeldEcjZGUjRMTStCYUEvUmhkc0M5Ti96MzBk?=
 =?utf-8?B?aVFVVk1HMjBZQzFTaDdQcUhBSFpRTmpVWml0YUJ0RGNJcm9vTjFKbjZiRkVN?=
 =?utf-8?B?MHFuYzFOWVNsMGpkRXU2QWFGOFpSUjRVNzIveVcxdSs3cFpyNEhDTmRWMEU4?=
 =?utf-8?B?bm1SdmJRcW94TkZBbWsybkFEYVJVa0xMRlJkekxvMk9FcjBlODFkdklsRzZO?=
 =?utf-8?B?K05qNXhrWnpjTThiVWFHcTdJUG9uL1NZQnFkQkJqWGxubzhqT1RLcDhKZXh1?=
 =?utf-8?B?dXRackRSclBYTEE0RXRLalJzNXBmUGJVQzlTN1dKQUlpRXpCNjIzM2Q1N1Ur?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: qrsMV8lemf3chH8+ph29x+JQmNtdDgzNkHhDXe71YQlFSJf4fzoh1K2iBnvB9Rk7SuK7bMl8gdE2hFSh1IAfvf6z2PmlUbr2VDWy65kudWOctyF3/m9HBiISisSjGeV5TcYkJv0QvADiuYSpXXDLTZyk81F0JMtWKIHAC/gS7epr/XnlXUnVpyMN+kGgbJlrTTcWgpBBAu/XkNVy27vXS2+tZ6TP5Jes1iWdx9fhygAQk8nqetlBw5Rdh+JbNNzKkpXAp8B+ugxvvEdS109HEoerYhOodakoTrcwKqJEwCSnhnggEI8xVqsH9xKSlsE6ixfE88iHyMUm+T7OmMaBdJMEtO28T10M7nZXMGR7skPJGPrCEnKy18hLp0vhmjPvXn5uZ/8WR+UuUAOPA1pXeFYuySwrc/o5Vo4JgX41zWoYG0yrwNe4ur8FGEWZglLkL4dNfvevIqangZ3TRJ/01P3gFduy0awfhFvR7dk8COMmlLeRUp32Ymf86Jv2ZjsCEnXyOWFHR7Ip2cF3BB2gW3Z6t1+L+jCq0O1fGLMWBmOBRg/wryRqZ8/eJjBelAHF7KJJ5oYKowD2+yGHUS6Vwvu+yCiskxmiM9WcrvZWhmwy5Vv35uAnABMyH35hgXEcgO+K6K75e0Ld7dUn/3xnkrYq0B9iS+IclhE44A05SkoUFkQSye9mWFI7h2Ucp1s05RvyGplQAbDYxTuP2U3hd+Q++m7QYHDYrMS9BLpE+d6Io4v+AiV5jjI8Q6WSBEPKRW7/nYelYzhxp1sNN+Mcuy7fHChbgRwrPaDlpN2rBsbwLH2YfjkUZbr9H6fDWKmCPlcKvzrY60S3vgpmnbyXAUB5lX7hMxv2vBjspCp1AzytK0cFPLIiZdmaA53Wz514ybndf5BWKN9QbSsXw5BVfQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e663a3a6-cc7d-422d-fa26-08db1c242b6f
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 20:16:28.1059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2gNY+3AGvqQimGdyX84dmJAZUscNZfIEbxnanCLqRPbDGNQgwlZTqXq/FItvDa7epOLBAu3Di+Btyej/5FCD6foFnZVlRLz2MFsFfGo3fzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5586
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_05,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 spamscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303030172
X-Proofpoint-ORIG-GUID: hvOtV0jTe4GvmbNCAOLhZuSA8aGXV7Um
X-Proofpoint-GUID: hvOtV0jTe4GvmbNCAOLhZuSA8aGXV7Um
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 03/03/2023 19:40, Alex Williamson wrote:
> On Fri, 3 Mar 2023 19:14:50 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> On 03/03/2023 17:05, Alex Williamson wrote:
>>> On Fri, 3 Mar 2023 16:58:55 +0000
>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>   
>>>> On 03/03/2023 00:19, Joao Martins wrote:  
>>>>> On 02/03/2023 18:42, Alex Williamson wrote:    
>>>>>> On Thu, 2 Mar 2023 00:07:35 +0000
>>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:    
>>>>>>> @@ -426,6 +427,11 @@ void vfio_unblock_multiple_devices_migration(void)
>>>>>>>      multiple_devices_migration_blocker = NULL;
>>>>>>>  }
>>>>>>>
>>>>>>> +static bool vfio_have_giommu(VFIOContainer *container)
>>>>>>> +{
>>>>>>> +    return !QLIST_EMPTY(&container->giommu_list);
>>>>>>> +}    
>>>>>>
>>>>>> I think it's the case, but can you confirm we build the giommu_list
>>>>>> regardless of whether the vIOMMU is actually enabled?
>>>>>>    
>>>>> I think that is only non-empty when we have the first IOVA mappings e.g. on
>>>>> IOMMU passthrough mode *I think* it's empty. Let me confirm.
>>>>>     
>>>> Yeap, it's empty.
>>>>  
>>>>> Otherwise I'll have to find a TYPE_IOMMU_MEMORY_REGION object to determine if
>>>>> the VM was configured with a vIOMMU or not. That is to create the LM blocker.
>>>>>     
>>>> I am trying this way, with something like this, but neither
>>>> x86_iommu_get_default() nor below is really working out yet. A little afraid of
>>>> having to add the live migration blocker on each machine_init_done hook, unless
>>>> t here's a more obvious way. vfio_realize should be at a much later stage, so I
>>>> am surprised how an IOMMU object doesn't exist at that time.  
>>>
>>> Can we just test whether the container address space is system_memory?  
>>
>> IIUC, it doesn't work (see below snippet).
>>
>> The problem is that you start as a regular VFIO guest, and when the guest boot
>> is when new mappings get established/invalidated and propagated into listeners
>> (vfio_listener_region_add) and they morph into having a giommu. And that's when
>> you can figure out in higher layers that 'you have a vIOMMU' as that's when the
>> address space gets changed? That is without being specific to a particular IOMMU
>> model. Maybe region_add is where to add, but then it then depends on the guest.
> 
> This doesn't seem right to me, look for instance at
> pci_device_iommu_address_space() which returns address_space_memory
> when there is no vIOMMU.  If devices share an address space, they can
> share a container.  When a vIOMMU is present (not even enabled), each
> device gets it's own container due to the fact that it's in its own
> address space (modulo devices within the same address space due to
> aliasing).

You're obviously right, I was reading this whole thing wrong. This works as far
as I tested with an iommu=pt guest (and without an vIOMMU).

I am gonna shape this up, and hopefully submit v3 during over night.

@@ -416,9 +416,26 @@ void vfio_unblock_multiple_devices_migration(void)
     multiple_devices_migration_blocker = NULL;
 }

-static bool vfio_have_giommu(VFIOContainer *container)
+static VFIOAddressSpace *vfio_get_address_space(AddressSpace *as);
+
+int vfio_block_giommu_migration(VFIODevice *vbasedev, Error **errp)
 {
-    return !QLIST_EMPTY(&container->giommu_list);
+    int ret;
+
+    if (vbasedev->type == VFIO_DEVICE_TYPE_PCI &&
+       !vfio_has_iommu(vbasedev)) {
+       return 0;
+    }
+
+    error_setg(&giommu_migration_blocker,
+               "Migration is currently not supported with vIOMMU enabled");
+    ret = migrate_add_blocker(giommu_migration_blocker, errp);
+    if (ret < 0) {
+        error_free(giommu_migration_blocker);
+        giommu_migration_blocker = NULL;
+    }
+
+    return ret;
 }
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 939dcc3d4a9e..f4cf0b41a157 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2843,6 +2843,15 @@ static void vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
     vdev->req_enabled = false;
 }

+bool vfio_has_iommu(VFIODevice *vbasedev)
+{
+    VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
+    PCIDevice *pdev = &vdev->pdev;
+    AddressSpace *as = &address_space_memory;
+
+    return !(pci_device_iommu_address_space(pdev) == as);
+}
+


