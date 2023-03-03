Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6E56A9C8F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:59:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8ki-0005WV-0a; Fri, 03 Mar 2023 11:59:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pY8kd-0005TI-8z
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:59:23 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pY8ka-0004qJ-Ef
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:59:23 -0500
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 323GcMZ2029426; Fri, 3 Mar 2023 16:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=+r/THDWXfevg71Ujs1XZ1/cTzFQv41fCf0k6dzBrWGo=;
 b=0rAs6fZ4liGcF8QLfQhz51FR+hFR5o3XOWWBxApRML7QPsNiPdd3LvMkkO+OYnpegBDz
 BQluZIt5+eIWtMser+nqF7JuQfU6IkLYYwLRUTztXlBZMdgzSUtqyMt4A/cofQ+oaSsO
 KGGBd7V0ySMsfsoMvtxmumxNM5VSWMunxtpeLvudDuyOSyX1SsLb72XxrlC5uY+rx+rJ
 RCxaqo11o87AZX6aONu+TJPhsz3Y4gUWuFmDU3gjtYpK4ODDSZFIvtUJe4agMJ99orvw
 mU5R2qxvWltcLf3k7/W3msy5VSEGRUU4OBWZ1eJTKRi1wQDvger7GuE8el0ISC8OkTzj cw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyba2exw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Mar 2023 16:59:16 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 323FWHHX005343; Fri, 3 Mar 2023 16:59:16 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8sc1twf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Mar 2023 16:59:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgJJTGaJVgmQZAAKX/5Rur6gHTnd3HTyr5WezXbJnvnUaZ6rF82bSYB5NWylHl4/jY6bAuoBa3DVJm4MYqBzInZqXuYy6J1DbziPiGh0IQPOKap0wRV6fh0dEapKSJkcVFyA7ZP+Z8SppkLmo4WVEmHy6As++XYk+zbCFjowvSG8Q75633fv5MWleAgdufWnpCaPTilp339meIdsHUH3sb2tyl41kajnwDhhIgVn9rL5dLo+FcwsrRGYIII50amiuD34cxFiOcsDY0+CopcSTV9Vxx+JJ+Nt7ED2pSpoJAGXZfaOQNzFjLJNhBoKrECKMSKL82LqFs9bzyBvFUD+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+r/THDWXfevg71Ujs1XZ1/cTzFQv41fCf0k6dzBrWGo=;
 b=P+Ah63KE/hJxmmgpxawfq2SuBPKmW2HELJtWXgou0RKaD+qcRw+tzqsSxbhvRGwEr8LgGBrwnPShPdy0FSTiRA/Ims4WB5aZtpatnEIRy/U0Qzp21lBLrvOuLxLqUWe6lg7yqEAtANvjYlkJe62rcsp4fcBjpQWtqF+awjJOwQOjHKI0DsxPiBLzXgpo7/wTFQGhw/kpUtgC2+nFcPqOoly6UAeSMwzmnz8W5Ebscw3IGGClCvJQF7Zz/qNcWNW9X10xMoC6y0EFLnOstSPu15CHAlSzE2+x5kJKIg6ypygxuu/tjx6m/BOYHSzevdLGiQHeImynf4k0TtUi0nLHGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+r/THDWXfevg71Ujs1XZ1/cTzFQv41fCf0k6dzBrWGo=;
 b=M97yWzohlOp2CZO+moiySO1PLwUBVsvxVrSMLQnJ6E27SSro79le3oZclZX9RttK7yIGQj3gDpAOKIGPzKFw1oFupR6ee3unBE5Lvv4UsvS0YTWAfKf3EDAWnWzOmrpBdbPKj/TZnRB/uu5egOMOwXwR9Z7JmKfXsWbW13FM9ic=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by PH7PR10MB5769.namprd10.prod.outlook.com (2603:10b6:510:125::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Fri, 3 Mar
 2023 16:59:13 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 16:59:13 +0000
Message-ID: <9e219add-ec7c-4408-902f-fce8c5c64020@oracle.com>
Date: Fri, 3 Mar 2023 16:58:55 +0000
Subject: Re: [PATCH v2 10/20] vfio/common: Record DMA mapped IOVA ranges
Content-Language: en-US
From: Joao Martins <joao.m.martins@oracle.com>
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
In-Reply-To: <c1e5fa47-7028-5e24-2158-2e64aa44006a@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:196::21) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|PH7PR10MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: b349bff1-e651-4a33-bac1-08db1c089d87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lhmv+NtAwG2sgS9+emTjzPKcMaW1ml42kwVcqtZ6H48sFkVWPSNqr6CqqY+9XAv8aMmgCybtdMZmR6qRDmi/EebAs5gWtouuGVT0G8dRAPxk1zi/0R2oqi7YLxDejoVL9EXbSoRkP59LTWYwigGbu2s1dnU6Za8w9DQyWUnwLhzKaJU5h0/2zfrESj3y7ecZuhsBrsFcsxx3xcJLzCPmlgGplhDf8/L4QzkrKjyIoEpUf4PW6bESX8Pxi1iWPfIFsYAYFqKAgEIw72i4fMg/+mqriMfBycr4jkh8l3IuRKrYDJQPCTYH3YS1p4hxvDV+lClV+bOTV4HLqKOlv8inF7/AxgMKbYhjDFVDS4Bj4dZGlWkRs9WBLE3MVcUJXo9GY1q5jSDAP+5FWnwh6UL4gI0cSO+5aFvMvymFB6osCSyMXT1MmJdihH0bzTNqvPRPDtRjrOUhWw4y6Wv0s9Hr2RiLPVtpuMLs83dXB4eva4gXae0Dz0u+FR9gCr0xcqNJ2gcHwyVaOHoQKdo3JLiGsOSsGjoIXygHy9ORqLJ/FDazX/ZESxSP/zM6GphD6nrT38WWkIDpauXhcaJ8w+jAmU/iL3Ei099W377XvinxHV1W7U3OgiuAI+WAHnSMnK4bYXkXuqvbeClaqakMfIjWlApjoHi+3NrowHdtSgmPhE1rzOj9RnYArlQB8GhqTfPAL4hUJoJtQEgSYq8r4ooKIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199018)(36756003)(31696002)(86362001)(5660300002)(66476007)(4326008)(6916009)(8676002)(66946007)(8936002)(316002)(54906003)(41300700001)(66556008)(2906002)(38100700002)(83380400001)(6506007)(6486002)(53546011)(6666004)(478600001)(2616005)(7416002)(186003)(26005)(6512007)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2xIVEtwbmdxNmIwQmZxNUU3TXMwYm1yWnJleE1xYWcxenhIbk14Q1ViZXpD?=
 =?utf-8?B?R0FIdmdBTVByYkt1WUdqaEtRNUtqZjFwbUd5Y0tSTkhldVFhVU5oWUtZVnRy?=
 =?utf-8?B?L0JyTjBpM1l6V283WldaRHhISWFFbjRSYXdyYWdNZFJhY3Z5Vkk2anlwN005?=
 =?utf-8?B?d2k1TFQ3N0FiQVgxYTVFYXlkajBqSUlCdG4wN3dLUmE4RlpYZ3pTYVFoWEln?=
 =?utf-8?B?Mi9tTlVpMkZhM1pEblpPRmNrUDg3TldXY1JmNndvb2tGdk9qTS9hbC9Tb2xW?=
 =?utf-8?B?NFNuM2pVWWtQVTZFbk1EU1lMOTFpT1lrdlhmOTVqYVJVQUNzK0JDZkFLcHZJ?=
 =?utf-8?B?enEyYnhzcHRmSjVXaXVVL3N5SGxKYlEvM05CM1padDVFT3Z1SHkwSC9teXdT?=
 =?utf-8?B?QWFwTEFHNzR1Njd2Wng4ZVhWL08zSW5XTXN4UW5oZCswbjFVSFZMV0RTVGd4?=
 =?utf-8?B?VzdtTFk1dUFNNEJ6bGp2aXdoRVBMR0FaYU1ueHlONldnT1k4RzRzNElKN0lX?=
 =?utf-8?B?Vm1qc3V3K05aNW41N0RHOWdkdTd1N1EydS9HdEJQcm1OWkNraFN1dHdYWkZa?=
 =?utf-8?B?Tmk5cGtKeWc5K3ZGNlpudDREY2o4Si9HcmhuczZYWXJHeUFWUXNJVnBYMnRn?=
 =?utf-8?B?UzRNV1VmK2xEcEZBYm55K1pmKzU0VVJwaFkxZXY1VHV0Q09qdVZXZGVuV1RP?=
 =?utf-8?B?cUFTakkwT3h3TURhcS9uemw2TkV2L1hCdzFDSENZYTlFcEVVY2gyR2xlR0dI?=
 =?utf-8?B?blJMTzNCN2d0U0JGRGtvQllVY2p4RHhSOTFRMDZyZlVRWG9IeCs4VlZVclBu?=
 =?utf-8?B?VDhHbmFlWWhQRTJTM1didW82cVBjV0tIS3hJL1hVSVJLZ2NCd3BSbS9WbXUz?=
 =?utf-8?B?Tng0eHZ0RkZhNnhmWk45cUhvSnFKSkg3ZHZnbGNhRmNJUFo5YjY0d0FhUWpI?=
 =?utf-8?B?OE1lUWZPam5FeDVHK2dlaXJaR3hhRElKT2RjcVMvUENqenk1WDYyYnhYNnFG?=
 =?utf-8?B?V3MvT2JySFo0Y1VqcDVMaWxUWGZQdVYrMkxyTjI5UHRpa21ZdUNLbWdmckJ1?=
 =?utf-8?B?allVWG1vcW1OSHMvU09FZnBXTldlbk1xdTB4dC9HcTdTNlVITHVCcUcyVVVB?=
 =?utf-8?B?TCtIWnZoRGx6bHR5NDc2TVd4QWdhb2hrd0VnTnBlbi9JM0haRmYwNWlvK1Aw?=
 =?utf-8?B?cmxiMjlHMXBlaHluR0U1QTBPOTdNOFFLSHFkU2hSeHRyR3hEZFhzcXFMWFlt?=
 =?utf-8?B?d0VmRUJoUjVybmtMZ1lQdmFlVkMxdVZYUjZheThLMHArbTJtd0FrLzlZSzFF?=
 =?utf-8?B?SGlPQkRuSUNXMGpMNFJHUkhsclFWa25DOWYyK1hjbHpiNktiU2tOSUY2dXNY?=
 =?utf-8?B?dkFIcy9OallJbi8wc3hxZkRDV2FNLzFJVjUrNWNiM2lDRGJQVXdncEJxeFpU?=
 =?utf-8?B?Y2puQ2l3WWpLZlYvZmVyMmxRalhDMTY4RlVKQlF1RmtwcitZQmFKVm15TThU?=
 =?utf-8?B?NFVyTVg2UjRjUzJvc2xCMDAwYlorSEY5RHl0Rmh0TXdHQkZFQmhJaUtwTU5y?=
 =?utf-8?B?MWRUUGNDdElxckw5d1RzeWhDWDg5VXFLL3JqN1R6TTJ1YVM3V3VXNVF4ZE4x?=
 =?utf-8?B?SGJROHpHYklsUWNlekdrdjAycXJRZ2d1bjJIQlVOMDdTTm5PRmx1RCt0QXJj?=
 =?utf-8?B?TmQ0dU93a0QyYjhZZExtQVRZSW9NRGl2UlIvNWpieU8vWEd1UEhrTmdtY0Rj?=
 =?utf-8?B?RUdHZFgvZlFxU2tGVlo0WlVsMS9rWGlzL3Z5aW5LeFMwRFVmMHMvcWNIVjFv?=
 =?utf-8?B?amlsZloxL25ENmlQanR1ZVd0dUhlQ1pOMmNMY05kb2xMeUdPOU53TlpEenFH?=
 =?utf-8?B?TjRnMklFS2ZsYzJ1Y1MwVjROczNiT3RnY0ZYbk5BRVpEZll0SW9MZi9PSnp0?=
 =?utf-8?B?Z0JiMEVNd2wxbDltQXhmd0ljV09haEtaeXNvaUN5dGlnbC9QellyTHo3K2o3?=
 =?utf-8?B?RHE0bkloUEtSUjJIK2c3a0tWbmM3TFE5cWo1ZjIrOEtpcEVVU2NMaE5GREF1?=
 =?utf-8?B?cGJySVo0UVhQL0RYTlZ0ZXFKWmF2OStOYkZSM0NqUmRjMDBzVVo1a2N5U0pJ?=
 =?utf-8?B?cy9zUjJ1cnZ1dEU2SmZNOEM2MEdhcFhxSTRYNWgrT3FPQUxuTHJyMXBLaXZn?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: iIoIXvXVHAq1mXATMupXdhybOkjupyAdltlyIEp1yS97Pg/PYcBaWopZZrV752rvioSALZBCSy83iKBuzKaZMQnzA4nqLvt0Wyi9zCMueVvy7AwOtWus95iq4LB4Tn7mZacSyFCOGh/w1HAia4ofHfJFAIiAAyQf4NT5Ie2q3hP7I4O3JfNvkOcX/3s/ZiQ1m6fROFzPw5gv8fmZfkesHGl9OaptCmdtYhX8HcnAb32RqAnq89t3YhGYoQEmas0fXuL9PMt+ovsYfppL7F87tQRQDH/ptKZXJ/vgECW93Ez5b00wFOhMvI6Ca+tbfCbR8opkK3VY+NXKjUm/SzgTG9i396U3U4L9Mby20W5QNI0GjjLp3UnIXjz9/j4Ft+76Fc3U5vQo6sz0QlAF2CD/kJrSxJ+Eohisfhfqs8NpO7OIcMf5N3VTUFnspdCgYO3BdXAUu0dJVVl0nLlMNXi/gSFdQ3PCAGoohiXga0F9aTjpRaW6Sdya0FVTfdIpDWo/BhnLTR9WcIcwNBauiWOH7OR7XrmabQ5AT7agY6qARosltHUywgzN3aKb+DEkNOi0QzOOzVh3tLqCTpKXcINy7G6qbgge+If1tWu5ZmpwzWFFM5fb/YUgcCVkjMKY++PALa77lpa4a0+orD3U7cN9d+EyyZ/XwwMeX0xKC+hR9HqmLzeRgIk2lsiYJSOMCEhA8XtI3jc6aaLJ5dw0fOlSMNyVSxEaHmtWo/G7O/eozRv4UOnZEe1r5eZjociv94t9OCtkbP6ypO82fuJiGWQPQco+KRGMEeaNSPLQsofQac+vBwUTED3942eavzKPMlZMGARjE1kTB+0Z8wP9sBHbRm/Db0Ty3VVpzplKi9FdDwNoh5+cKNO4hyY26vXLcia4QWKtkubvSf20rlisKdHgRQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b349bff1-e651-4a33-bac1-08db1c089d87
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 16:59:13.5040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/RhJMgSITWklooVXd68uICpXvZt+kPGLlAqT0rUSRLU4w79AWByWUxgdZqb7RFVXwNVNEysjlO8w5HmVcuR/e9vsP9UbKuKzdFxrlyiZ1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5769
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_03,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303030147
X-Proofpoint-GUID: 2cxfuU_KhH4-kNNtulMQ_Q8bZvHBB4iY
X-Proofpoint-ORIG-GUID: 2cxfuU_KhH4-kNNtulMQ_Q8bZvHBB4iY
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

On 03/03/2023 00:19, Joao Martins wrote:
> On 02/03/2023 18:42, Alex Williamson wrote:
>> On Thu, 2 Mar 2023 00:07:35 +0000
>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>> @@ -426,6 +427,11 @@ void vfio_unblock_multiple_devices_migration(void)
>>>      multiple_devices_migration_blocker = NULL;
>>>  }
>>>
>>> +static bool vfio_have_giommu(VFIOContainer *container)
>>> +{
>>> +    return !QLIST_EMPTY(&container->giommu_list);
>>> +}
>>
>> I think it's the case, but can you confirm we build the giommu_list
>> regardless of whether the vIOMMU is actually enabled?
>>
> I think that is only non-empty when we have the first IOVA mappings e.g. on
> IOMMU passthrough mode *I think* it's empty. Let me confirm.
> 
Yeap, it's empty.

> Otherwise I'll have to find a TYPE_IOMMU_MEMORY_REGION object to determine if
> the VM was configured with a vIOMMU or not. That is to create the LM blocker.
> 
I am trying this way, with something like this, but neither
x86_iommu_get_default() nor below is really working out yet. A little afraid of
having to add the live migration blocker on each machine_init_done hook, unless
t here's a more obvious way. vfio_realize should be at a much later stage, so I
am surprised how an IOMMU object doesn't exist at that time.

@@ -416,9 +421,26 @@ void vfio_unblock_multiple_devices_migration(void)
     multiple_devices_migration_blocker = NULL;
 }

-static bool vfio_have_giommu(VFIOContainer *container)
+int vfio_block_giommu_migration(Error **errp)
 {
-    return !QLIST_EMPTY(&container->giommu_list);
+    int ret;
+
+    if (!object_resolve_path_type("", TYPE_INTEL_IOMMU_DEVICE, NULL) ||
+        !object_resolve_path_type("", TYPE_AMD_IOMMU_DEVICE, NULL) ||
+        !object_resolve_path_type("", TYPE_ARM_SMMU, NULL) ||
+        !object_resolve_path_type("", TYPE_VIRTIO_IOMMU, NULL)) {
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

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 8981ae71a6f8..127a44ccaf19 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -649,6 +649,11 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
         return ret;
     }

+    ret = vfio_block_giommu_migration(errp);
+    if (ret) {
+        return ret;
+    }
+
     trace_vfio_migration_probe(vbasedev->name);
     return 0;

