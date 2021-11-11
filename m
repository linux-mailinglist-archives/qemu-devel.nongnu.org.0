Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4D944D3C8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 10:09:42 +0100 (CET)
Received: from localhost ([::1]:35572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml65V-0007CE-Ci
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 04:09:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1ml63s-0005gn-6l; Thu, 11 Nov 2021 04:08:00 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:52272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1ml63p-00026O-LU; Thu, 11 Nov 2021 04:07:59 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AB7KKMT026260; 
 Thu, 11 Nov 2021 09:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=RppTxraCvQU1YXkMT5tPvjfuYb+0kiX6XGGU8iN06mc=;
 b=OXv/bPpyfk7xP1WsdSJ9tEv6ZXWEsxg43gqc9nNjRfcaGhm4+wpugTnQeDcamXjzQmCN
 bnAMJBQzE7Dt1R+tEZP4GWcvaqq1Vugm/oyW3T0KbUVY3/Zor9oJDwLIGvfuy4rtucdA
 uMbqzb5askXrCIMGzWTcEgsIVrF/uQRQ5H0eYeAH2v5i6ZHvnbH1X7lxmztxYovKrl1l
 cfk94iJJKB+8JeeSMILqMJAj6+RDaekyy8urCrzlPAQVI5WyVpL/gQGKBa1eZbEaX/Tm
 Uh0FJZmJnJt2vFnMTKYJykcuOZl3+ZeziIpgx5hpRjigImKc4b0xllkBTDcXyZ6DUTRG Rw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c85nshbd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Nov 2021 09:07:40 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AB96NGl160334;
 Thu, 11 Nov 2021 09:07:38 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2041.outbound.protection.outlook.com [104.47.73.41])
 by aserp3020.oracle.com with ESMTP id 3c5hh6jm1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Nov 2021 09:07:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cttw6Fdg5GHuvjcrFgXitEjs2iIBfYFew5mZHQ6G7iOTT3y5NcU1c9u6+KGc79Jznf2ogYhkt0JEZgiTtGk6MA//ja8/Bnu8QtfTZ8jJLEmNstu819tivRxRYaS3SKJzzALLuRyUjtqsxzPRv2JjeaCbNpJsi9We+RZHwGXUb0WsMb1UZC1on1xt5OQKmox+qgXPgiRqnmV5a+WXNKoRz5uIUzqBs8roDOU9LfGHUL0if755O8X3hzOn+zQqNdWhEqvGPKSv0UbEy/WSI7EY47oySZR+4u7EGwawEXo4PmwpeinRhhQwTOSIoakXChmHJGtQTelrUHm6eq99xu0+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RppTxraCvQU1YXkMT5tPvjfuYb+0kiX6XGGU8iN06mc=;
 b=K/1FHztJuEAXbo3PQPm6WHdWLvE7NYKEJdaFbe2WEVvFoF4IgzZqz8yFtMiM5e5sbvRWAKfIYxgXQB29ybjYMUu7TYyOx/aVzQocpg5al3hDuQTJ9nU83cVcqIM7LTWVbZ7oM059ZjJ82gZ4zXdyCIHzjfJrWjGo/dk1OgizMbKcbMvoIEjV7Kvb5FP/y6pUH2eT8j+niunUroZziOmVAp9adjnY7gVwU4bC1b9098NTkX9C8ciyj+KrhUKfyqS8rHD97dVbz0FV5qgd7L6/M99wi5e87pdPwh/5qICogYgxgko2GfmmEt6oZHVtnu+r3f090wp0U2C26MWEEB731g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RppTxraCvQU1YXkMT5tPvjfuYb+0kiX6XGGU8iN06mc=;
 b=GRWe0v+U0b9PAIG6fyYiuUoTZ46Hmy3TfnYjwzo62At0nybKyUVGfbivThEeKK0SEoVHUWwEPXMDFV3CSIcVbgbvZ2u1Ws/rfiN3IXGpoXM3osxilae+4Ct5Rs0L6AE9fSCGhJHFkZfZ0ipRx6cG5JWBiowA/u3RUopAcHrUSjc=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4629.namprd10.prod.outlook.com (2603:10b6:510:31::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Thu, 11 Nov
 2021 09:07:35 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4669.016; Thu, 11 Nov 2021
 09:07:35 +0000
Content-Type: multipart/alternative;
 boundary="------------ZOpYfE0xZpQdBOJsrfkKTSyG"
Message-ID: <5eaea4db-7a5f-4918-3967-05c080f7821e@oracle.com>
Date: Thu, 11 Nov 2021 04:07:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 3/8] qmp: add QMP command x-query-virtio
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
References: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
 <1636539792-20967-4-git-send-email-jonah.palmer@oracle.com>
 <87sfw4xloq.fsf@dusky.pond.sub.org>
From: Jonah Palmer <jonah.palmer@oracle.com>
In-Reply-To: <87sfw4xloq.fsf@dusky.pond.sub.org>
X-ClientProxiedBy: SA9PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:806:28::25) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from [10.39.203.104] (209.17.40.41) by
 SA9PR13CA0170.namprd13.prod.outlook.com (2603:10b6:806:28::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.5 via Frontend Transport; Thu, 11 Nov 2021 09:07:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7511520f-025c-416b-f389-08d9a4f2b385
X-MS-TrafficTypeDiagnostic: PH0PR10MB4629:
X-Microsoft-Antispam-PRVS: <PH0PR10MB46298B7E444DE6EC0E8D297CE8949@PH0PR10MB4629.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YcgUqQv5nG5EZON+Eu8n2YUtffC+L05CLzx4kRIYXViOLIWruW/G0xHvFhhx7LGmyC2Xdo1Ha5niccyqKq3FQ6qdbdNI/dMIWHs6YTwLei+N6Z5TQ7t2Xam9FdjQNdmhQpA37XihWilYFFALYMHuD9QvqdxXKjIMdaHMBuMAtiJYiE3gCvOME/feqHj8X3qEg0lYattDqkTEOrDAJB5JPHDd8/UI9IzKFthk7I8yXKr76LlpmAlUXylVqG+HEZ6401VW3IeX1+7BS61TV01Zrozp5WpSUidAaDHPaGPQCZOxSO0LfgrDZsNmBD81lmxj8qhDV787VUKrOivlh88fjmNw5HXJmG0JxH6ZiygezxGff0I1n9poFm6n+ZPVwzSbQMNdL54QyXWjbzy5y9vqCMDeq2sNFiDB9VymxSd4XFrfslBYx6fV2jkkKEkYzNR4wJwEnOlIx+S+lG8ptyQUyNRaHVJZf/XflvWR5J+u2HVRUV2Uy4H08oKwxWeh+Ow4IVCcHFS4cDECV8xu571Hul0K3upUSgmwLjNaG/frvYzeemCChYeXFw0D8drqYzbx32ETzCBRvc84/njoftN55SN+4ai7qIVzywcsjKUoz4WG8BaIbVcKlyP4c0NhMsuPDr80+XhaRFBBa5PGvKvYy6esizq1knyG9YLc79LSdAaG5AyLb1CuXpWvzI/Muhpaur70IPnvCJtYInb58COiC8nIJjjckW1p95eM+ORtC64=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(2906002)(31696002)(36756003)(508600001)(38100700002)(33964004)(8936002)(66556008)(66476007)(86362001)(5660300002)(7416002)(4326008)(83380400001)(66946007)(8676002)(16576012)(316002)(6486002)(44832011)(2616005)(31686004)(26005)(186003)(6916009)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWUzMlIwZGd6eHJXOERsTERSbElkTkoxc1pnd0h4citXVUh6My9Hajd1NGh1?=
 =?utf-8?B?cWphZ0pmVjZkZ3dQVDdjVFRVaHl6RWpac2ZSc1Q3UDF3aTBHTGtlc0Era2h2?=
 =?utf-8?B?WXFsZHI5bThwQ1VNYmMyejFaaWFBb1hnV0djdG5kUGZ6Qmt4MHowSENIcndu?=
 =?utf-8?B?dlNHbHBSYTJiUXc5bk45NTB4ei8vRUNmWWJWQUJIdEFwL29VSE5qYWdWUVlR?=
 =?utf-8?B?a3BYSlVGTHpXb2lmbVVhOGxVaFpaVW5nOUpFc2JNdm5NR09lbW00SEMyZmNM?=
 =?utf-8?B?THhRbUk5cGQ1LzJicnhGSkxsOW9xZ0dpQWJzbHpRK3FuaWk2eDZDbTNsYThT?=
 =?utf-8?B?YVhFcUg4aXNSeFlvSjl3SkE3TC9RVTVRNTNhV2pLcDhKZzdIbXNRaEZnaXpu?=
 =?utf-8?B?a1NKVVpiYzhzcGp1ZWpGOFM2anB3cGxLYVovYjlXWmNlUmlkRzdqUlNqZXhz?=
 =?utf-8?B?VTJVY0lyQ1loMzhTVWhmMlhwT1NkeitobXdHeEwrVzV6WUhNLzhhbm80RVFw?=
 =?utf-8?B?N1FMUEVlRUpSN1kzSmI1L1FMckVWbVZPbUhjL1EzdERhRHIzQUNMc2xHZ21Q?=
 =?utf-8?B?SFNwWWRrTlUxTkdEdEdRVjliUE4wbFVEN3hHZWFhNkhyaC90eTl6SVBjNnNI?=
 =?utf-8?B?TElmZ1RrZ3plcHVsQkxaSm9tMlN6MDZ6b1lRM3RJbFk4dVo0cjlUaElHMFdN?=
 =?utf-8?B?UUpCVms1ZDBTdW9VbDVuSXpNRm91Nk5XOTB4b1ZOekVnL01yRjZ6L3gyb3Bs?=
 =?utf-8?B?OE43ekpHSG9BVnJjUzI2UHF5aDJ5YUVHbCtieVJYeVcrWUlLSENLRUgvcC93?=
 =?utf-8?B?b3dndG0rN0tGYjBiMVlQakxNVWN3R0dFU1RQRm9wMjl3aWlZWUt0K2Era3dE?=
 =?utf-8?B?VXFhUjAveVZXejJVUkJhM3EwNlNqSTRySkxpT2diTXVobW1lZzQ3MGRkaWxN?=
 =?utf-8?B?MGZYYUxHcHUzSFA2M2V2WGxUNUxueGdMQUxYTzYrL2tWNHJ4VWFHTVkxTy9E?=
 =?utf-8?B?WTlEdFdIVC9DR08xaGFKazNQVHh3NENVUFE3cFloYTlTV25rYXV5NWFELzFC?=
 =?utf-8?B?RkJiVFlNZUN5V3NGQW0yWXk0VzYrNGoyRW9ScXdpczNlS09DWWJzYUFQTTZI?=
 =?utf-8?B?WVk3b0NmQXltdlFGWXhxVmhIMDNSRGgrMEV4aGhvVmt1QUtxcS9zSll3akJL?=
 =?utf-8?B?YlRoQlhKTVRiN3Z4aSs3QVp2SmRLcE9qUncrVXJ2cFNhVzl5ZExkOEZ2a3Ay?=
 =?utf-8?B?cG40VkVtOWY1RW03TXVuY3RleDJLV2QyVDBLSU5yaXkzT29tWnpQbGdsRm1j?=
 =?utf-8?B?MHVYVS9zWTVDT2EyVkYxemFpQ0FCK2E5aENxeHRZaWhOZEEwNGtuT01Va0t5?=
 =?utf-8?B?OGJBcGIvbkVHdDJtNUoybWtNSnlqZERRUTVGTnlKUWdydkF4VHRHdXBFMzRm?=
 =?utf-8?B?cVQ1RXNNTU1pVThQV3F6ZlYvdnpPMWJjanBGeHh5dUVUaVEzYkpBaWpTRmx6?=
 =?utf-8?B?Sk96Y2tWbVNOQ3N1dC8xOGdOV2NpYmJBWUV0b0FGSlFpcTZwaStQUEs5R1RB?=
 =?utf-8?B?VUQxdWJGemNqMzdWRVZhaTZhdldVN3VvL1VsMWwzZWExODVxZlRWK3ZCRXQw?=
 =?utf-8?B?WUNxOUxYOTdzWjVtbnhJY3ZRclRTNVlWUTdENXVTMkRkOVZsV3RiOWo1aGwz?=
 =?utf-8?B?aWtDOWh2T3gyeEhKNnhWbTBFY3NaR3gwS3Zoak15N2hpQkZLbzMxRlB0R3FC?=
 =?utf-8?B?NDM3Y2lvcFlqZFJ4UzdKekw4dndLYzNJYkRxTHQxS0JMV0NUN0ZjWE9RWTdu?=
 =?utf-8?B?Yi8reVhqakdFWjJBckt2SmxqazUxMHpOdXFhb0tBQlN5QjU5bitCbk5Vdm90?=
 =?utf-8?B?MWc5TXhiYTRSUDczNmxGWkpBMThPM09CS3ZXSFBuNlY2V2Z5THo4OHNiQkU2?=
 =?utf-8?B?d1lJY2ZURGdYUThrUU1MWmhpRmN0QlhadHI4Z0hTUnQ1M1NmQUQxc1d4NGgz?=
 =?utf-8?B?VjczZ0gyZmZUOEd4QTBIMU9kRlNTazJQTFpzc3c0QnQ4MjRhMlkxdjBlN1pV?=
 =?utf-8?B?dzVJNmtEL1c0YWhrbUNXd1dSTmNTYjR4ZEowbHBzdjE0Q1dqNjA4Y2xjalUw?=
 =?utf-8?B?ZVU0T2w5RnZiMk1FNEFzWHV2dWZmTVdpSk9WL1lHMTdlcFk0clBycExkSW9Y?=
 =?utf-8?Q?aLa9vyMRjfStC0p1hnyZOvg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7511520f-025c-416b-f389-08d9a4f2b385
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 09:07:35.2299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/hNhFEKrEZVC5Pk4d/qwEOa2Xv6XnH+/uHPGI8Cynkcr7jRKaVqJD0n7h5FLUAJWcHyABAgdKWHTI7WkiU6MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4629
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10164
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111110054
X-Proofpoint-GUID: mZql7dFKoxiPSBrU_474SgsbhLM4CVl5
X-Proofpoint-ORIG-GUID: mZql7dFKoxiPSBrU_474SgsbhLM4CVl5
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 eblake@redhat.com, qemu-block@nongnu.org, david@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------ZOpYfE0xZpQdBOJsrfkKTSyG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/10/21 07:03, Markus Armbruster wrote:
> Jonah Palmer<jonah.palmer@oracle.com>  writes:
>
>> From: Laurent Vivier<lvivier@redhat.com>
>>
>> This new command lists all the instances of VirtIODevice with
>> their QOM paths and virtio type/name.
>>
>> Signed-off-by: Jonah Palmer<jonah.palmer@oracle.com>
> [...]
>
>> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
>> index 4912b97..1512ada 100644
>> --- a/qapi/qapi-schema.json
>> +++ b/qapi/qapi-schema.json
>> @@ -93,3 +93,4 @@
>>   { 'include': 'audio.json' }
>>   { 'include': 'acpi.json' }
>>   { 'include': 'pci.json' }
>> +{ 'include': 'virtio.json' }
>> diff --git a/qapi/virtio.json b/qapi/virtio.json
>> new file mode 100644
>> index 0000000..324ba8c
>> --- /dev/null
>> +++ b/qapi/virtio.json
>> @@ -0,0 +1,55 @@
>> +# -*- Mode: Python -*-
>> +# vim: filetype=python
>> +#
>> +
>> +##
>> +# = Virtio devices
>> +##
>> +
>> +##
>> +# @VirtioInfo:
>> +#
>> +# Basic information about a given VirtIODevice
>> +#
>> +# @path: the device's canonical QOM path
>> +#
>> +# @type: VirtIO device name
>> +#
>> +# Since: 6.3
> I expect the next release to be numbered 7.0.

Got it. I'll update this for next series.

>
>> +#
>> +##
>> +{ 'struct': 'VirtioInfo',
>> +  'data': { 'path': 'str',
>> +            'type': 'str' } }
>> +
>> +##
>> +# @x-query-virtio:
>> +#
>> +# Returns a list of all realized VirtIO devices
>> +#
>> +# Features:
>> +# @unstable: This command is meant for debugging.
>> +#
>> +# Returns: list of gathered @VirtioInfo devices
>> +#
>> +# Since: 6.3
>> +#
>> +# Example:
>> +#
>> +# -> { "execute": "x-query-virtio" }
>> +# <- { "return": [ { "path": "/machine/peripheral-anon/device[4]/virtio-backend",
>> +#                    "type": "virtio-input" },
>> +#                  { "path": "/machine/peripheral/crypto0/virtio-backend",
>> +#                    "type": "virtio-crypto" },
>> +#                  { "path": "/machine/peripheral-anon/device[2]/virtio-backend",
>> +#                    "type": "virtio-scsi" },
>> +#                  { "path": "/machine/peripheral-anon/device[1]/virtio-backend",
>> +#                    "type": "virtio-net" },
>> +#                  { "path": "/machine/peripheral-anon/device[0]/virtio-backend",
>> +#                    "type": "virtio-serial" }
>> +#                ] }
> Any particular reason for reformatting the example?  For what it's
> worth, I'd prefer the previous version.
>
> Aside: consistent formatting of examples would be nice.  Not in this
> series.

I think I got a little too excited reformatting. I'll revert the examples back to
their original format and make sure the rest of the examples throughout the entire
series are consistent with each other.

>
>> +#
>> +##
>> +
>> +{ 'command': 'x-query-virtio', 'returns': ['VirtioInfo'],
>> +  'features': [ 'unstable' ] }
>> diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
>> index 7f103ea..fd00ee2 100644
>> --- a/tests/qtest/qmp-cmd-test.c
>> +++ b/tests/qtest/qmp-cmd-test.c
>> @@ -103,6 +103,7 @@ static bool query_is_ignored(const char *cmd)
>>           "query-gic-capabilities", /* arm */
>>           /* Success depends on target-specific build configuration: */
>>           "query-pci",              /* CONFIG_PCI */
>> +        "x-query-virtio",         /* CONFIG_VIRTIO */
>>           /* Success depends on launching SEV guest */
>>           "query-sev-launch-measure",
>>           /* Success depends on Host or Hypervisor SEV support */
--------------ZOpYfE0xZpQdBOJsrfkKTSyG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/10/21 07:03, Markus Armbruster
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87sfw4xloq.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>

This new command lists all the instances of VirtIODevice with
their QOM paths and virtio type/name.

Signed-off-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
[...]

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b97..1512ada 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -93,3 +93,4 @@
 { 'include': 'audio.json' }
 { 'include': 'acpi.json' }
 { 'include': 'pci.json' }
+{ 'include': 'virtio.json' }
diff --git a/qapi/virtio.json b/qapi/virtio.json
new file mode 100644
index 0000000..324ba8c
--- /dev/null
+++ b/qapi/virtio.json
@@ -0,0 +1,55 @@
+# -*- Mode: Python -*-
+# vim: filetype=python
+#
+
+##
+# = Virtio devices
+##
+
+##
+# @VirtioInfo:
+#
+# Basic information about a given VirtIODevice
+#
+# @path: the device's canonical QOM path
+#
+# @type: VirtIO device name
+#
+# Since: 6.3
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I expect the next release to be numbered 7.0.</pre>
    </blockquote>
    <pre>Got it. I'll update this for next series.
</pre>
    <blockquote type="cite" cite="mid:87sfw4xloq.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#
+##
+{ 'struct': 'VirtioInfo',
+  'data': { 'path': 'str',
+            'type': 'str' } }
+
+##
+# @x-query-virtio:
+#
+# Returns a list of all realized VirtIO devices
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: list of gathered @VirtioInfo devices
+#
+# Since: 6.3
+#
+# Example:
+#
+# -&gt; { &quot;execute&quot;: &quot;x-query-virtio&quot; }
+# &lt;- { &quot;return&quot;: [ { &quot;path&quot;: &quot;/machine/peripheral-anon/device[4]/virtio-backend&quot;,
+#                    &quot;type&quot;: &quot;virtio-input&quot; },
+#                  { &quot;path&quot;: &quot;/machine/peripheral/crypto0/virtio-backend&quot;,
+#                    &quot;type&quot;: &quot;virtio-crypto&quot; },
+#                  { &quot;path&quot;: &quot;/machine/peripheral-anon/device[2]/virtio-backend&quot;,
+#                    &quot;type&quot;: &quot;virtio-scsi&quot; },
+#                  { &quot;path&quot;: &quot;/machine/peripheral-anon/device[1]/virtio-backend&quot;,
+#                    &quot;type&quot;: &quot;virtio-net&quot; },
+#                  { &quot;path&quot;: &quot;/machine/peripheral-anon/device[0]/virtio-backend&quot;,
+#                    &quot;type&quot;: &quot;virtio-serial&quot; }
+#                ] }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Any particular reason for reformatting the example?  For what it's
worth, I'd prefer the previous version.

Aside: consistent formatting of examples would be nice.  Not in this
series.</pre>
    </blockquote>
    <pre>I think I got a little too excited reformatting. I'll revert the examples back to
their original format and make sure the rest of the examples throughout the entire
series are consistent with each other. 
</pre>
    <blockquote type="cite" cite="mid:87sfw4xloq.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#
+##
+
+{ 'command': 'x-query-virtio', 'returns': ['VirtioInfo'],
+  'features': [ 'unstable' ] }
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 7f103ea..fd00ee2 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -103,6 +103,7 @@ static bool query_is_ignored(const char *cmd)
         &quot;query-gic-capabilities&quot;, /* arm */
         /* Success depends on target-specific build configuration: */
         &quot;query-pci&quot;,              /* CONFIG_PCI */
+        &quot;x-query-virtio&quot;,         /* CONFIG_VIRTIO */
         /* Success depends on launching SEV guest */
         &quot;query-sev-launch-measure&quot;,
         /* Success depends on Host or Hypervisor SEV support */
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>
--------------ZOpYfE0xZpQdBOJsrfkKTSyG--

