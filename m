Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 166E344F3F2
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Nov 2021 16:27:36 +0100 (CET)
Received: from localhost ([::1]:56328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mluwJ-0001MJ-0t
	for lists+qemu-devel@lfdr.de; Sat, 13 Nov 2021 10:27:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maciej.szmigiero@oracle.com>)
 id 1mlusv-00063U-PT; Sat, 13 Nov 2021 10:24:05 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:20906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maciej.szmigiero@oracle.com>)
 id 1mlust-0001ZI-Ow; Sat, 13 Nov 2021 10:24:05 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ADERisL005227; 
 Sat, 13 Nov 2021 15:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=wA4A+hjv0pJqTgojdjhVagTI8XnbFTxodneZwqmCQSs=;
 b=0vS1F63UlBF3LhSrGzPVp/o+hy7rejo7KYxeHl0YwOQ6V1ffpJuVc7ubSnhEhms5ceQ9
 kLkuHRXB1uCQfVH1DsBDzOlK9OmZTlY0fD3iB7YKjUKbYyDZUTBmoR5vwPXaoJwxzYgM
 YGHdAboLnHCYltvmBREntOzglWJ3+EqEiGHUsNgUHyfKOI8wLlZxljfdu7gYTUYNPRW6
 aEFA3LWMLev48YDpE5O83+R3juSV43zLCfzlCW4371T68M6EcdLrkxnb4xw7pgmDwTMw
 +qWTwSj+qf/+CLyToBwy8+WphPBPtE3Aom+qGegGGDsrlGaIPPBh3aNe8b+Pt/+fgr5w Pw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ca4yth6y6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Nov 2021 15:24:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1ADF6SCV154166;
 Sat, 13 Nov 2021 15:24:01 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by aserp3020.oracle.com with ESMTP id 3ca5625cq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Nov 2021 15:24:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UglkYAbOIyYQdZgDuNjarHJ2rHMJH95owDAZc9XqG09RVWEeZmRy8m2bz+i6aO593q8AMAU2ZNbBR0oBNYfggYH2ahm+vHlAksNck8K2P3SRVa0sPD/uDJJAK5QQab1EQks7kwzyhu1dJvCJbj9/Ii7yUltC57K2QVGbXEGluORI3tp7vkElc1YcXzx8wlSdhkv/wlePNUNKKKf/N3meM56W6ZBmk0jkW4xYa+crvQFiBdy3JLXrlM9oTB/YLWkCF5IFTEteK7QjgfJGIXWXZzMf7093SpsphPQFAyHfWkM3t4QiazjdsLbEGuytDVSMDoAw6jFss0Zi6XzuMlE/Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wA4A+hjv0pJqTgojdjhVagTI8XnbFTxodneZwqmCQSs=;
 b=Ay2omDhXslL2XNdUx/9JBTQ+xyaIep9QNBfto6ydeSJBkYjHEAk+hPh5zYqvoJiIYStG/gZXZPww5qnmh+KQSJfMVXbzMpBc1AApBVWra+YNgHGJOE0TyCEU+crvTsZ407G+7secvEPCjVDr8put9uBOMbXDfu6S9pvVL5dyKYeZi3qFuGbBRX/5pjQpM3swwyN6FKyejEvWZNgaiECni3yBPq4WBsWhJDOkotEG+6Dxbt9XOZWQidkOtMusTIQEbcL1wnXa+/k2iVryUoVm7/5JQFKGpN0HOPaCJA8Lj2uLRhmvInP9g9ZOd74Q6cSpEWl053ju6bqy5EPCgzSJ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wA4A+hjv0pJqTgojdjhVagTI8XnbFTxodneZwqmCQSs=;
 b=wa6S+x+XKHoWUCucswWTijtBhZVZpr/H4Rad2Q+EZHZZnfiK+3HvBbAMo8F6WT4RJL1Ji9j+Rvpsrmxx3rSORKjJkyw07Jx4gQue0OUnTuGqMugcKRPnfZUSEx30ok+K9bI3yQiQJJKU+hfQYr11Z0CVd8JHw1hYj7BTRVeaHo4=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by CH2PR10MB3928.namprd10.prod.outlook.com (2603:10b6:610:6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Sat, 13 Nov
 2021 15:23:59 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::74b8:818d:18e5:e6c6]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::74b8:818d:18e5:e6c6%6]) with mapi id 15.20.4690.026; Sat, 13 Nov 2021
 15:23:59 +0000
From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
Subject: Re: [PATCH v4 0/1] hw/hyperv/vmbus: Is it maintained?
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20211106134155.582312-1-philmd@redhat.com>
 <e9c29f4d-d5d5-34aa-8311-7ad1fc05b7d6@oracle.com>
 <96683e8d-9633-7cb8-98ab-0a8791e1c63e@redhat.com>
Message-ID: <ec422556-2152-cda8-a2df-24b9cc41bd2c@oracle.com>
Date: Sat, 13 Nov 2021 16:23:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <96683e8d-9633-7cb8-98ab-0a8791e1c63e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR08CA0030.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::18) To CH2PR10MB4008.namprd10.prod.outlook.com
 (2603:10b6:610:c::22)
MIME-Version: 1.0
Received: from [172.20.10.2] (37.248.222.61) by
 AM6PR08CA0030.eurprd08.prod.outlook.com (2603:10a6:20b:c0::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Sat, 13 Nov 2021 15:23:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05ebae99-a0c1-42c1-c891-08d9a6b99d86
X-MS-TrafficTypeDiagnostic: CH2PR10MB3928:
X-Microsoft-Antispam-PRVS: <CH2PR10MB392823D769707A99A4A678E6FF969@CH2PR10MB3928.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 35syN+uqhovA+aeeMJgcDHEo3ojtfo5AIxwISk1OoYIcIIdkIfom0WNyQDewVm9wXOXndrbMtslepKRM5XZI0vO0YKEWEkqp++5RI020TxOl1Z71VZOgkBKHcJaFHbMS9TUCHWwjiUPvl6lUPxeRbxER4Yp2/od3SlxS5ZmtWHtwbxLsdJorFQ8VZDckJoBHV8XUQMFJmAKHIv0icjdh0+VrMEogaDnH1sJ+ho9Yuk+31cHJJ6/o55g2pWRQv9vgmseDRJd/7PplOudq8sMXKTSSWKDp7GY45Ivn/d4cE0w2TZL43b9JnJ6eqRQXULXiT/v0qmbKVkhjtvj9uQRU8xgmXCqPX0/5ZCKqM/xFBj7/DUJiV6BLevq0yeCx+zM6CTJMGFJfzm2H8z4ufRpNEMJkHU68gGOONGv/CZ/EkrIursF5itTm2JRGG8nb72Mbpuq9SKH5NjNbwUF2+1vhFG/Lb2bWKMjx5kvUcMJdKswPtx7OyCmsTS5ja5tDhNXfj2UUKHWuqzOS+odkodw/rxUyogTD+SODMpzk+12OWsygPZrTJ/p0AbJol7DtNli5IBkyvtTafRS+t/GeFu6jWBLZcZYNyK5kXnOUKvSoEuE5adA5ms0EJ9kc41fGnbtYsTLf+Pk2FRFcGxIT+S9hn3NY8MNwYo7lYCi2Vodyw5b4v4OjzFnWYBbxskUMqi9Ntr87KlCUaV8nbRu6+Y2dJiNOsPxZgpszONBaxJqg9tM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(5660300002)(31696002)(8676002)(6486002)(4326008)(66476007)(66556008)(86362001)(2906002)(66946007)(956004)(8936002)(26005)(36756003)(2616005)(186003)(16576012)(316002)(54906003)(6916009)(508600001)(6666004)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXl2S1hCWHNGQm55Y3d2QmtCejY0RlZ2Um1SaTBHc1pqdjQwYjlrZVIvSHh6?=
 =?utf-8?B?dWNkRjlyejAwL1RFTXZnT1pxSEkwRHFRa2l3eW5PTy9vWkh1OHB4Wk5jdHZO?=
 =?utf-8?B?Tm5aUE1rRGhWVnlhR0QrUFl3WGVmYjJ5cUdUMXFKcld1TTZHazN0elhyclJH?=
 =?utf-8?B?NE1haU9yQ3J0SWNJdDFsbFVKZjJlSWhDdTBSNlJIVEJBZGNoWWxQbGdIM0lS?=
 =?utf-8?B?L1A2TGkya1E1OUdtYXNuZ3BYTm5rZEhqMm51MFFKbkRPMEgwUjBjN3hBM0ZF?=
 =?utf-8?B?VThRRzZWU0d6dVJRTi9KT0lCY0FEbTcvUTc3eWZqQTA0bEpZSm1RN1VEa3RN?=
 =?utf-8?B?M2xnMGdjZUxldmtUcG9xQXFEN1Qrc2hkM2Fzb0VEbkFKZ3NrdUdINHgxU1BN?=
 =?utf-8?B?NjVDdzFJK2hWTE1nQWZtcGExQTR4bGZKK2podERBa1dPUGNnVkdjdW1JVk8w?=
 =?utf-8?B?MnBzMjNqdnZ5aExaaDFYM21PSm1VNWFmODZGMDdhV0hKTEoyZXQ0UjZGOTRq?=
 =?utf-8?B?UUtmeGVtak02KzZzM2FGeFJCNGJteFkyMjhTK0NYRnJyVy9jdWEzbmRBRTBu?=
 =?utf-8?B?aXR4Y1dtSEFERGVoU1lqZ2VoTU00YSttcGpBK083OU5JMFJBWTJnU0ZPQmZy?=
 =?utf-8?B?MjZoUk92T1k0Ynl3MUwrQnJjaUw1WjF0VzhqeGNxK0d1NTdGUEhOT3JUUkJm?=
 =?utf-8?B?cC9CYjFLREJSU0EyVlgvb2l3VnF3VXE0dFBIL2Z0aU5tWVRGUGRnMjFTMlFn?=
 =?utf-8?B?QmhKTjk2aFhDc21GT3dkVjRwcmVhQUNPUlB4UEhVZW92M3hPeDBJT1NzTmRN?=
 =?utf-8?B?QnA3NEloOFpleGs1bXg3K3ZDandDUVNyU3FRMnNDS0VsNEk4MTZkc3U4bFlS?=
 =?utf-8?B?L1FVRFNKVnp1akxmcnFBYVc3SzhVdW8vRlVZSkFHQ3B4TTViOFg5amRQTFN5?=
 =?utf-8?B?aFlMMCtONitJTnZqVDlVcERLV3VLSytrWXg5WC9JenEvUDF3SGpQTHNhL2JQ?=
 =?utf-8?B?VU9QbGdYYi9hd0t4MXlRUlMzVXVpVlZDK0Q1eGNYQW9TaURXZE9CK09vNVA0?=
 =?utf-8?B?aFNGY2p1MXNIZVhNU1lDbWYrWHhqMGlRQTFCOVVLYmhJZzRwWWhHSktlaGRL?=
 =?utf-8?B?Y2V3V3RCQ0RDSWVyY1J5TkNTSTQvdkl3YzZ2YzFEeTZXZTZSbHU5d1FIWS95?=
 =?utf-8?B?RUdoM1V0a2lJNVEzNEFEcnFoaDYrLytDOU9reUJhd2JIVFlwenNGUnRFdkdq?=
 =?utf-8?B?OWY0aytHLzdSNHpheGZxQ3M4WXIyOTZza0J1cFlqYitLTWpJWlRHSjhWZGM3?=
 =?utf-8?B?U3hPWGkzZDdReWtLQ0FyNlRQU0xlbDFLQ0U1bnd6Vng5Y1VETmg3cGdtblhY?=
 =?utf-8?B?ZUE0c1pOU3AwUzkwU3JIUm9YYmx1eU0xdWxCL054VlZhOVlmbFJFaWQ0SlVG?=
 =?utf-8?B?eFh5VUFkUGMzaGVPR3YzczVzZ2JyN1J2US9vbytFVmFIRSt1S0o4ZmV4b1NZ?=
 =?utf-8?B?NEtyR1psaWdHcW01cjJrUUNWclBnUEsrSm0rbE9QVTN0YXFRZlJVbHhTQmtW?=
 =?utf-8?B?emkrYzlvcVVKbWJodWdLRGhQYkJPUjJ1ZWlOaElqSDZjeFNSYUFRZGtLZ08x?=
 =?utf-8?B?WWNqYUFNdzIzRkw4c3E4MFMzWmJqWGlLL1JwRVltQ29DVFJ0b1A2WE5DS3VW?=
 =?utf-8?B?b09pUzhDZDBUMEFFYzF4NWJNd0N3TFJqb0xqeWZRd2RXenJ6aVpyQzNTNU1G?=
 =?utf-8?B?QlhlbXRaNXZyRDh0Vk1MY1Q1aXVTT2VmZ2p2T01QRTRaeVFoWkt2VExHRTV5?=
 =?utf-8?B?UENCU2x4VjBFSUplWFJhTVA1ZFVEVE5CaVBNL2NFVm5xeE42Y0pWMkhqYzM2?=
 =?utf-8?B?OVhoOGFmV2lhemVkQW9Rc000OFZ2TnlnMWRVc0pIcGNzci9uQ09vVzdjNHF3?=
 =?utf-8?B?TUQ2bjVCemU0ay8xWHBwZ2lkZ1g1T01Jd0Z1QU9JekpqR3gxZXB3cTlXUzVv?=
 =?utf-8?B?M0JKYkRySEUxZFVWcDNvWU1jY05RajJJaWdoNXJJd095UXo3YzhHT2pQNkF2?=
 =?utf-8?B?Q2JEcW1xTFBCaEQwNjZDVmtFSm9Bc1hFeWtqWEN1ZSs1TjY5MFI1eVUya0t3?=
 =?utf-8?B?OWp0RHdnZ0dJVjJ6R2JEM2JLUSsxVG8vSC9IbUpodHMvSVNUdWdZaS9CNTFn?=
 =?utf-8?B?Vk9CQzNRNGd6Y2lCTm9Sd2l1cDB6OG4rNU4yR0cvMGZSNWdKTk5xV0MyV0ZB?=
 =?utf-8?B?aXF1L1FnWnNxTkJNNTBNOW13QXZRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ebae99-a0c1-42c1-c891-08d9a6b99d86
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2021 15:23:59.2502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2F3puj3R7z/iJbeB22y6SlZW7Fjv6SHZ2TNi+9zwPDC23aMhHTTWccOjo15igq9SfFbc+VsA3paE19OodXspUqrH1w54O9t9UPieeKr3YE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB3928
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10166
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=723
 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111130088
X-Proofpoint-GUID: 4CRqfcqCylj-Uma1z8lv7C26zJulOS-x
X-Proofpoint-ORIG-GUID: 4CRqfcqCylj-Uma1z8lv7C26zJulOS-x
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=maciej.szmigiero@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.852, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jon Doron <arilou@gmail.com>, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Roman Kagan <rvkagan@yandex-team.ru>, "Denis V. Lunev" <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.11.2021 08:30, Philippe Mathieu-Daudé wrote:
> On 11/6/21 20:28, Maciej S. Szmigiero wrote:
>> On 06.11.2021 14:41, Philippe Mathieu-Daudé wrote:
>>> This is the 4th time I send this patch. Is the VMBus infrastructure
>>> used / maintained? Should we deprecate & remove?
>>>
>>>     $ ./scripts/get_maintainer.pl -f hw/hyperv/vmbus.c -f
>>> include/hw/hyperv/vmbus.h
>>>     get_maintainer.pl: No maintainers found
>>
>> There's an email thread at [1] explaining the reasons for having VMBus
>> infrastructure last time such question was asked.
>>
>> In short: mere presence of a working VMBus is needed for some high-speed
>> Windows debugging, also people are working on VMBus host device drivers.
> 
> Great. Do you mind adding an entry in MAINTAINERS to
> cover these files, so we stop wondering about them?
> 

I will submit a patch next week adding myself as a reviewer of VMBus code
so there is at least some contact point for incoming patches.

We'll see whether the code still gets just a random patch a few times
a year or whether it requires a permanent maintainer to take care of it.

Thanks,
Maciej

