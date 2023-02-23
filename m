Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F5E6A1208
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 22:31:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVJAQ-0000Cp-Pm; Thu, 23 Feb 2023 16:30:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pVJAN-0000CK-P6
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:30:16 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pVJAL-00025h-K9
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:30:15 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31NGwoga005023; Thu, 23 Feb 2023 21:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=qVG48oQ4DOlO54AMaa/Fh/SB4nyIc/5rGtrD0pR8oY8=;
 b=CZiJDiHFfcvfdGScNoe1KRnPa656szZ3q6kHejmr/njYYG37ZI2/rDufFn8GIdxlHlZd
 +qZTzMf4DPVzIWU+Z2FtBsakLcINOQy4Yz/uAva0a6jAR9F2EqYMkvziTnWWV8Z5jVMp
 MkexOBf/ZnQ9yhuUkvBi79ZWKkyk3jw85+nLHvMI+o3XaDx70238g70KYJ9KynSjyj6V
 51WaA7YjOOnkiVGlVACedM/GtkhiCv59qrsovYIy8hxvet7fxg1xYqAQujJV5FQogjOh
 seYzZja3YG0+mV0ybgUubmwrHKtrB18tP7Yi6Hu1frQLj4pPsl36jkp/suH+koWn2LED tQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntnf3kqhq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Feb 2023 21:30:09 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31NJsIJm013532; Thu, 23 Feb 2023 21:30:09 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2048.outbound.protection.outlook.com [104.47.51.48])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ntn4f7vsn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Feb 2023 21:30:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hY5t83noiSu/gGin7H79kDSXPxTY+DkJk256hRQVEAzxWjUu6mB2vOe8TJKNXOk4ushIQeYNsKhz/9dW7EEwMWJUPmHUBSHQGyXp4cSMaIeGX3jAo1zOofIkJWDoDQdPy3JUkce8HAVD+hEwws6B3erLUskw/Tsw4DuaF5zir3i//qXCCBraMvhUUPzWZeYKaE5FYYo38TMyryl94fiykBfgnbC4O/hPgIVbKAhqa7JxlcHI261/Gc0kJsaxEj/iYaYccehCCBv3m7WF62HSMzxnhz4VXeczEy+7GqGrpdIzHfJWtaRNiExIvn9mp2zKDCVK2gUqXu7FYbVjouvOFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVG48oQ4DOlO54AMaa/Fh/SB4nyIc/5rGtrD0pR8oY8=;
 b=QOWVjd2FMOnSLuUXl/4pLxVVu5twuqVb8IwMz/ltfKArg0WkyM7p5t8FRHBDcFOlr8T1ocB8LFa+eF6EmbmsoZxwtjxdV1KY6IdxVrKRXNlNCJY0sVKo2Qic4Q9Fj2bpIXn3kAN+QsvlvspsRBVac6GBcDCQME1FWB+a216xUbiEAlOxw4Q1WPVguEloY8YCq5Ns8nyXYork+fl3/DHxPMpDLHwbJRRnuN+POYd8GBohqljj/9vTOoPvJCjiwH531RRbkUWJcCSBeR+w7JG5qG4EhmfNy2Jn/ieTVIPR1EWv3q9sG9ndiTOYVvo0imSeg5qbqN12vu4Y8VGGqodQBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVG48oQ4DOlO54AMaa/Fh/SB4nyIc/5rGtrD0pR8oY8=;
 b=uLak5QKMFQ2Bi0W8nxXDFyYGYcMM4FNNZTXS90FVa3HbU75u5MABKw+gCfXHd23LHzgtGNeSqQZs39kCIRE5cHjXUvI8UsFnvdocq2t0pRyFd+RrS0iq+FVJCeCqV0tT9Y9YQaq9I+syAAehbFFJiryCiAOqcaGaru18qxutzQI=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SA2PR10MB4745.namprd10.prod.outlook.com (2603:10b6:806:11b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.7; Thu, 23 Feb
 2023 21:30:07 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 21:30:07 +0000
Message-ID: <30dfd66d-2a52-7a0a-31a2-505907c1d7d3@oracle.com>
Date: Thu, 23 Feb 2023 21:30:00 +0000
Subject: Re: [PATCH v2 17/20] vfio/common: Support device dirty page tracking
 with vIOMMU
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>
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
 Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-18-avihaih@nvidia.com>
 <20230222163439.68ad5e63.alex.williamson@redhat.com>
 <Y/bKoUBe17YNhGEA@nvidia.com>
 <20230223130633.4bd07948.alex.williamson@redhat.com>
 <Y/fS2rX+JvYVC9jR@nvidia.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <Y/fS2rX+JvYVC9jR@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0210.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::17) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|SA2PR10MB4745:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c81754-1360-41d5-e37d-08db15e5223f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mUaZ/EIQ8mWZeyAVUNPWrxHnSsEBmLke2xORTgm3/e6Zx1ObvTuk0Eo1PSp9lV7gAhButNul0iTTTHo7W32UiWGxY/oFxPVAlebwNMoQJ39UrOTaxxt/mw4Xyin8HeD+0dMRN9bOQUSo4DFkmxoY9ZjRQYpMw4FPFsBnmzSLTJsY8EBTb+aaR8C0y+PekXRvyCteiUW+pn3InDAKVAM85e1i/7MLyfl4O+NxQ0jFVPCFFsL2qoVOH6jmhA18X9eE+4MTAdksL6sIM05hAaaPX1Di/tI4/IAuqdWRMvB65mPB8buIXsUL0lknrZ0hJjxu/AW22J5nGgpi70dEgQxQqcL3eFOoI4bCbYxuwzqLrh+E0Wi96zzJOO5wCm9k4cY/2SMoBTciuRLOJP+u0YQPTZJ5n1+gOm09EapHsKJs/v7ZA7/+iGtozifft78XwbtUF3qpaoQhPBJtmG9nOFVfGHl8jPEo1/n5QQgCjhJnkAPzUAyPS140A/pKyO/hcRyvQZl8BIdTmpBLi2qkTqlzAcH7XXlK5rxZm/Sg6uPOmnUftipraUG3yfib/s9NNvN/ye3UNY7wgqfkIw7Q0vJKyJwgGxjl2b6r42WmGBKQwVuum2B+w8IEN2FEVg+f1OIIGFTIwuaaLxjAYN1GXRqkT4/+phV1Ijp63gS2mfUBnl1aM1sBVOOyAb2byXuCbYOL5QKB9zeIl0LBaJyzZC6EfzO6HWdS3LVXU5Oy3tYlV1w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199018)(2906002)(316002)(110136005)(54906003)(66899018)(5660300002)(7416002)(8936002)(4326008)(8676002)(66556008)(66946007)(66476007)(41300700001)(36756003)(83380400001)(6666004)(6512007)(6506007)(53546011)(2616005)(31686004)(86362001)(31696002)(38100700002)(6486002)(26005)(186003)(478600001)(14143004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTBLaER3WTJDUUt3Y3hSajhoZnRlRHBBU1oyRVJjMHh3UWtnampLWVE0OEJv?=
 =?utf-8?B?bnE2T2d6NWFqN1ZNYmc5enR1eFVDR1haaWpHVi91ZmxKMWkwUjBIaWcxOHEz?=
 =?utf-8?B?clNyMStKUWtvSldObnhFVXNlSHdycXhpTzJwZ1ZONlJuZ3lzVFRmSjBtM3dC?=
 =?utf-8?B?STNVeXR2dzlNNndhK2pMUDc3QktwV25WVGk0dGh6bEtNd2NTMG4rUkhobUFF?=
 =?utf-8?B?N0pkdjFqZThqdVphZ1cyTVhZU0plTTRGTHVlYWttVEtScmwvWGVSTEN3Vk1I?=
 =?utf-8?B?RytuVmZnUng0d0s3bElEa3NOOHZ2V1NMZW96ZDVkSUVlZDUwaGswZno3dlp6?=
 =?utf-8?B?Q1ZQN0s3WmRIOVpJQ0ZGb3NHc2pNOU9lb09CbWx4TzUvU1R6eE5vOFl3R0pp?=
 =?utf-8?B?eTZYRkRsRDJSemVaNWNrQm45U1k5c0Z5aW9vdCtPQmlUQUdmRWZjVFVkNjR2?=
 =?utf-8?B?d20zZUZudmdtTkkxMU5FV053dHNxc0dmZjdUdWZLbUx4TnlaKzZMTUJsaFdt?=
 =?utf-8?B?UExZbE11d2NXbGhYeWNoRS8vVmh3NzkreEJwMjF1QjVqZVN1U29BMmFLcFJz?=
 =?utf-8?B?bm5hdDhPalVFME83cWtGTFo5OXJHcXVody9JVU5RME1LcEd0SlY4eTAwR3Zv?=
 =?utf-8?B?SGcvNENhQzUzdW4wSXJsd1kreUoxaWpCQW1pM2FNM3B6SGZTQVJ5U2FmajBU?=
 =?utf-8?B?OE05YTFqZTZxazJwaHJ3dW1kUFhVRFFRRitvcG1tb0c1Y1VxQ2VnQVluQmxH?=
 =?utf-8?B?eVovcEk2RGRxaVlDcCs0ZFVxTUJzNzh6T3Uxd0VaNGZWTnpYSmVOdDZ4MU03?=
 =?utf-8?B?UXQ2MmF4b0NzdnJvWURQbWx3RVdadzNDSVU4cFRod0NtOWlWYVNkNWxZTVVa?=
 =?utf-8?B?M2RtU0lzbVFWNXVxMWJRWnVKM3JMYlpkWFBCNzduTGtIeUtoSWw4Sm5VaXlN?=
 =?utf-8?B?ak83TlE4aXZydHJqZWRVK3p1Wnp6WWF3YkQ1T0tzSEovNHV2blJOZ1QweE82?=
 =?utf-8?B?bkF0KzRnM01UNVl2akJ1UVdIK2grMDg2QWRXTldETncwUTF3aHRac0Yxd1N4?=
 =?utf-8?B?M2IzT0tLMjM5TUM0dVNQVnNWVFRkZ3czbGdkdlN3Q1ZheGNzS2hOWHhWNHU2?=
 =?utf-8?B?c000UzN5MzlLTHhIbmVENnZodUZhVzk4QW9mNlV2ckVoaEd1UVhjZ0lzQnh6?=
 =?utf-8?B?eHFkaWxNNTRSRXJ4cGNCeS9ONDVpS3BUZnB6cnFiRjBOcmxQNldaNnZjQlV3?=
 =?utf-8?B?SHRBbk9lbHpiM3V2dEVhaDVCdGdSYWNUcGVlYW9zTDVOL2NrUXhVM0d5R0U4?=
 =?utf-8?B?Y0JGVitIWGxlQjdXVWVEVEZ0c0ZROUZYVXFHcTFpTm9JWnpnV2M4OFNieXBB?=
 =?utf-8?B?WVpTVFpkTnNQaDVXR1dTeC9kV2dRTlB0N0FEc3ZDNzBlV2V6YkhLTDMxN2Qy?=
 =?utf-8?B?V1p4REo5QnNrenlOYzNNN2FrLzYzY1BXY0dObU5SRDIzbTBHQzVUTDkxU0JS?=
 =?utf-8?B?ZXBnTHlWdlhJOXUwQi85d2IyVm1NZzVvVFZyRUVBTUVjR1gvcnBjTkR1ZzlS?=
 =?utf-8?B?OGQ4RWNXWGZVamxuaUViNTdoUk1HZURFT0MvV1Z6Wk9weHhSaUNycExhdGhz?=
 =?utf-8?B?UEVRYk01d2U2S3VRTXhBYllUNk1hSUpXNTNoTEZIS2txMWRJcjVQazVIL3pP?=
 =?utf-8?B?U2h4bUVHRVhxMDNRSktqWjJ1T1hWT2RVMEUzQlAvUHZheXpoc2s3ekNXU1VY?=
 =?utf-8?B?Ni9ZMHJiUjhTTUZOeU5WSDd1QmtZQThHdW9wa2FnUUh5dW5weG5KWENFQy9Y?=
 =?utf-8?B?SUZEWmxENVNlL2FGQWNHLzRoYVFFWTRlMG9JbExHUlVLeFFJaFNkalhkNU51?=
 =?utf-8?B?L0N0VHZTRjloM09SeDRmem1kbkNJTjRGUmRHQlBMcjU3cUJLbTZTZklmQzgr?=
 =?utf-8?B?amlveVVTN1pXUkFSVlkwNlF4Rk1LcEhrWHJJck5RUW9BbE45MFBaLzNMOXpB?=
 =?utf-8?B?TmxZK2tHRlZpZFRjSUJYcm5JVG5EL0dIYVhrSGVBTjFQNnVKeldIRFdRTVFj?=
 =?utf-8?B?YlFPd0R1UjZBUXRWeVRSdU5uWXhwRHQ0TS9uZ3NvUGNLQ2doNnBhbVE3eGFF?=
 =?utf-8?B?RGZxYUZHdWNpWEdMYW1YZFZOWUVvY3JBdlNIbkwwQVlYZzRKaUFxNE41SVdv?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: POhbPISVxKhL0sxX16g7dobXKX+jkdjXSCu+iNhqHDHnNkcA0uI5oxUH9UH3H9XzcnW2iZe8fENCoNbR8bn0AaZxKFlgiNJis1ESO7iYBCalfMy4ccYhtav7OMZ/BO6V90P5Y3GGJEDcGzV3fkqUgGv1aaxPXODrU8zjxlnWh0KkNafa0LPm337Pg/WiK9cTC0YxGDjLVH4AuKl0BzuhMRhlq/oHULif4dty9e3zpPzvhiwrGtc4GPdkZrM6sUmSLau+SqTY/Jc0sdF1U8od93hlke4lPtWBGTwuju1F5+cZLUsDFUyq4MBmphANhjy+Uc/0IzqfTJfBY6640jxkp+pLZMVE1qZoe34vxEl1fBsVaz5sc7n3kr2+71rdUv7PrN2LFCiW7ETN/LxXXFbPfQFMOXkJF5uITJxvdZmMaA8vgwvWiWLyqg1DT4xBK5PFFIsHezMOyqZ23tn9Om6oIA7EawW5iGeT8Nvl+HXP3u4JfZQq/WmXCTtQ6d6Uc2TiBEI8mZ5EnKaw9GkdNtUvZr9GowQWIUJhG/nkpG5uCK2cJJipp0nbtEn5JPomppj5oDYBcwJulB/ibcZeZwvzKqn+xAzpsFMTpBWNL9wIfyWknVW2oN/l8WuJLbpoWiV0h2W3qOkSsxQus/el02vHTXQs3TcYU13xktNWp0qMB7bt+Y8pvCKDgIlFVv6uAJ7bDgCn8/7v0X2MHRa+ok2qpqR7Hqd05VZohIUCPyHJJyD5+DO8OCBt1QliQJvFRo5iyTHWZUXbH9K3aP5Ejcx8Y+uGFh8zDR69TB+HMrfTJzYUfwLViqRRzKeyZpgzo5lIPYshkvBDHkMrfCDYa8YsGQNfXtCxPyH3eQnlQyKaOjZTyLzbDNr7emAH6B0gnFMHY56RvJkC1WIVG0IRg/lXPw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c81754-1360-41d5-e37d-08db15e5223f
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 21:30:07.1238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4p+8HZGT9bBQVZdnsBrrp08y9oelEq4M5yYRPazfjC/eHJzgyWUpRTzjcDAa3VNt3Kjumu+BrecB5FOQt7nlHqQVMNzvfCDSK+XsmDm/yQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4745
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_13,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302230176
X-Proofpoint-GUID: t1PxYzKuvTGKVwKHe4lzA8OuM_64NyCT
X-Proofpoint-ORIG-GUID: t1PxYzKuvTGKVwKHe4lzA8OuM_64NyCT
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

On 23/02/2023 20:55, Jason Gunthorpe wrote:
> On Thu, Feb 23, 2023 at 01:06:33PM -0700, Alex Williamson wrote:
>>> #2 is the presumption that the guest is using an identity map.
>> Isn't it reasonable to require that a device support dirty tracking for
>> the entire extent if its DMA address width in order to support this
>> feature?
> 
> No, 2**64 is too big a number to be reasonable.
> 
+1

> Ideally we'd work it the other way and tell the vIOMMU that the vHW
> only supports a limited number of address bits for the translation, eg
> through the ACPI tables. Then the dirty tracking could safely cover
> the larger of all system memory or the limited IOVA address space.
> 
> Or even better figure out how to get interrupt remapping without IOMMU
> support :\

FWIW That's generally my use of `iommu=pt` because all I want is interrupt
remapping, not the DMA remapping part. And this is going to be specially
relevant with these new boxes that easily surprass the >255 dedicated physical
CPUs mark with just two sockets.

The only other alternative I could see is to rely on IOMMU attribute for DMA
translation. Today you can actually toggle that 'off' in VT-d (and I can imagine
the same thing working for AMD-vIOMMU). In Intel it just omits the 39
Address-width cap. And it means it doesn't have virtual addressing. Similar to
what Avihai already does for MAX_IOVA, we would do for DMA_TRANSLATION, and let
each vIOMMU implementation support that.

But to be honest I am not sure how robust relying on that is as that doesn't
really represent a hardware implementation. Without vIOMMU you have a (KVM) PV
op in new *guest* kernels that (ab)uses some unused bits in IOAPIC for a 24-bit
DestID. But this is only on new guests and hypervisors, old *guests* running
older < 5.15 kernels won't work.

... So iommu=pt really is the most convenient right now :/

	Joao

