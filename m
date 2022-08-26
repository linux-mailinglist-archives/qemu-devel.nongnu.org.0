Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD3A5A1FE2
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 06:32:18 +0200 (CEST)
Received: from localhost ([::1]:42216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRR0y-0004Qg-E8
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 00:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1oRQyS-0002vm-AK
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 00:29:40 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:55868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1oRQyO-0008UP-HJ
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 00:29:39 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27Q3k8D4008682;
 Fri, 26 Aug 2022 04:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=QT5rZeddtswW7DuSeXPhVd1EJvD5Fl3Z6laopVu2618=;
 b=GlFV0vOePbV8UOkR2RtwK5ggopJc1ckh18hlhDrLzYARxfUHkiPNIqcS1NJxdIU6BKFe
 0kavJKpsTOZb8eG8gdqpKoWbAABkOp1wJbgOr3a8Z244NRT/ffQ7yRN/hPrDzO37xahc
 2wqxWqvqJ/ILVU8CM8P7SP4eM50Qp0idIkP1NCfFifp70nsGxiJmY1+wnQfh6Nk4zRHO
 INzwMBTw8Cw0cUvFHnfh0HYA7lP1Hc3xbUEP5bc5AelEeUkXmkkmhilPdvmnQhV4WIrt
 Qlre/ssqsY+YlazXKe7v+extTzO3GjLHpcVMsIeWq5I2i8nrnkQfreuoLtgGwHEt3h30 LA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j55nyeu23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Aug 2022 04:28:29 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27Q4JRAr039477; Fri, 26 Aug 2022 04:28:28 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3j5n4n9v83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Aug 2022 04:28:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6B7L35+UZ8Ws8ynTE+2icIVRrF9/ONm7LhdfuUjzA49OC31Un1O44/AluPOP0SmfErKD5k1YljsK+H/x7Vx15hvrk6gbjER+xUHG8PoxI74bDnYTH3rtDCpPsv+fq30txyaGD9Yn1Bp7IJpHOl7Tb1cmadRQ3XHO/JtQ8GHDPnkxk7zCnUqYP/VetmZrjalvIRG8XI3bnytkUciOVYFPY++iAkz1STrgyssDVd7tBvCApotNBJe0nZXujub1XUicu4HOAUNoX6/c18UbqkqUdQl3UzVmcNCX/YpNHW9QyTpiShnf/QKKhfe7tx4HpeWsRtB1ESzOjUXrERYMI8xcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QT5rZeddtswW7DuSeXPhVd1EJvD5Fl3Z6laopVu2618=;
 b=B76uZoyAA66RE3ecGzjewh4uGuzmbE0+FQD3ooB0Ws09EeItK/dCpHROxVmFpskIoWLyFgIXm6yERJzHLEL9Twy8PBDSIvgqFnr03lODlD+b9UB4zVdELL1YE77RDG6gxsXk9F0BfPl0h+LqkSv+Nmc1ncoRY9dQr1dDXsn73JZHPinXsNzEzcG2q5ke/4Y9idO7xiYiWrPtWq2OMi4bxtL15dt4prq+R0NMebrFOr4ygzpPRD9J4cSel3gPI8hHif5d1Fq4LJdb/0S1DhfH2Bj7iadAoIIOykF5adfY7Kpe6JZn51tM0vjguoksY772LVXuz6T5ZfZy22OeNV4XPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QT5rZeddtswW7DuSeXPhVd1EJvD5Fl3Z6laopVu2618=;
 b=fRGiSHUgBA9MpZvhLGOK6pkVyei3Ym4RMY+ac2shRlDUk4aY4uCH1hMhdgvH71QpKiskDYDZxggUFVnbBgMKowZijqX98vASUA0EEsdi6vxZ4XqILG7Ez+8l/yIdWyrj28dFVO2omo7H+a7NkuJdudrlBoGzTAm874XJoyCBDLA=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by DM6PR10MB3242.namprd10.prod.outlook.com (2603:10b6:5:1a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Fri, 26 Aug
 2022 04:28:26 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::dcf7:95c3:9991:e649]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::dcf7:95c3:9991:e649%7]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 04:28:26 +0000
Message-ID: <ad87db8e-d71c-4771-98c7-29effcc8d8c7@oracle.com>
Date: Thu, 25 Aug 2022 21:28:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/5] virtio-net: Update virtio-net curr_queue_pairs in
 vdpa backends
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
References: <20220819171329.3597027-1-eperezma@redhat.com>
 <20220819171329.3597027-5-eperezma@redhat.com>
 <7debe883-819a-f083-aa72-8b9e05ca5be8@redhat.com>
 <8aafb501-a852-bc45-8989-b48644c5e1f5@oracle.com>
 <CAJaqyWfemKiDHSU5ujHhJrNjMgeD2i-7uYA0y3fUSC0fuE7bYA@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAJaqyWfemKiDHSU5ujHhJrNjMgeD2i-7uYA0y3fUSC0fuE7bYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::10) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17b4d2dc-d047-4481-73be-08da871b6b56
X-MS-TrafficTypeDiagnostic: DM6PR10MB3242:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /8gOXo05dnfJsbHVCfZebuMS+CJYlDjyO/ZZMVssQ9InvJkZ/9d1noMRQJqg5f6BiXKG1ijHY8T17RrSqAAzJix6kH8Tq6wK5ajpxQ2+icCzu/CGD84hoRvPW5l/Mpha8oI7vYipZr/IjMU2CRIZGPdX+MAPqnm8iQprmrGtW5Y/qMaDGBWkLN8wLHfDtNaF7JWpGSTYDl2QUY/MO7m50U8zVtZHgSpx0TWT74J70+lhJ1boSqB7HBTajJ/jX93cYQqnon32QuEo1U94c6Gz4cCY7oR0E0rtse3x1gpEqXoqgVbC8Nwqzj+q+V3hlzjUkSAdADy0Bah/N6dNrXvSrrR8xtVNLx0RFxxNXHBmrI+jWE3zcbbiKiu8LcXzL/nij6XuG31Rlgj6znXXEZPxEoO7S67Bf3+HYl1zQeOYlypecqDZcSdnIPOx0W/c4BxKv2MMO/zwkHpvBfABBXXSYUjIt4m2t5Pqyfx3d+YVBeQO991VQakuty59k7OQ4k7ujt6haf0G40Zl5F/UV/nN2LbTJveU/ZfibVIfZVGheXClEvM7DanR/Ab12JONDBAeHo0OL2PpZz45po/6hppX3t++QX6AQ1IbWAhkTH7tSCM4uAb36QczZehOEk7eEY8Odtyuzvx1fWXhINzA0TOOhw1qRUQJIs0Z0RdhA+MytX8XN07R2F1R02YlZGO71DZTj1xSFEWTGfW6p+96NyiKWjn49GUUDM80asRTmn0kKZ51YTr8EC3iZrdeebsn6NuEpgb/7CEQLX/8NLK182sYq2GAcfqmYnM4MIaBdnbPNaA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(376002)(136003)(39860400002)(346002)(38100700002)(26005)(66476007)(53546011)(6512007)(36916002)(6486002)(2616005)(6506007)(83380400001)(478600001)(186003)(8936002)(5660300002)(31686004)(2906002)(6666004)(41300700001)(15650500001)(7416002)(4326008)(66574015)(36756003)(54906003)(66946007)(31696002)(8676002)(86362001)(66556008)(316002)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3Z3V1NEK0FhZ2hRVUplQ3B4NUJsUUJSNVlqSmswRm1wQjlmaUtjZDgzYnU0?=
 =?utf-8?B?Rm85TWcvQktNaHpoL1hQZW4xUitwTWN6RVhVK3hGRnIzSEYrOGxFbk1qd0wr?=
 =?utf-8?B?bTJtUkQ2ajQ2TGZKUW51L1RnVG9vZjk0N0lTb2FyK2YrNnRycEFYenZRWnV6?=
 =?utf-8?B?dGlkOGFnT1BvUUZnM3gyQW81anVQYVNzMDlReXlOMkxYbzJCSTJScXNLakZq?=
 =?utf-8?B?OFhhYVd6NEwzNDZVQU9nckxQQVJBUld0VjRId011Q3ZQdFZoSlNvS1FWWlhI?=
 =?utf-8?B?N0dEQkpCaW5jM3JNRjNRYTdJRkNMbzlXejkzWmtRZzFreFlDVXRUeGJITURN?=
 =?utf-8?B?V2RhVlV6NHVxQ3hQcHVGVUZGemxnUHJPUFNMQVBwU2xpNzJqVkRUbUZiSTIz?=
 =?utf-8?B?Mm9rR1lwd3BzQlltM1JzazBqY0c0aC9qb29WdlRIQWJ1aEZMMnpubHgzSXFQ?=
 =?utf-8?B?dU83bEU2Yjc4cUtpTFNLUHNNelYxZDI5WWYwbWhJMXAyTFRpUkFqNlNES0xh?=
 =?utf-8?B?RTBPTVppUmgzN1lGQjNwNEQzYjhNbnVIczdGQlp1SWJnL29xUjhKeFVqRWFD?=
 =?utf-8?B?VlVvK2VCblhzWTBXUWdjRzE1UkRyelJRMStnR1Vvd3FGKzQzaU5iNklzTm8y?=
 =?utf-8?B?TTZGRTJubnVqTlgxcGhxQUYzYUNjNVpvRGhyaU1ubkpKU3VsSXhJYjh0TFhu?=
 =?utf-8?B?MW82WC9vc2dqR3NHdWFSSm94UDRLNmV4WEFEVklySmhHQVR5OWJROVh3Vjlp?=
 =?utf-8?B?ZmQvUlRWbXdhbzVHUCtHWXN1cjRlSjNqZEd6bHl5VTBRWWNqMk5Ocnc0SCtM?=
 =?utf-8?B?ZnVuL2g3cWhOUnNYRmhuNTV4NzQrY3ZoYzl5NlliN0RUS3hUMzVWS0lFTFhl?=
 =?utf-8?B?NEh4eWM5UkZ2QUp4LzRuZ01WZFdrY085QjNuK29VVGVRemd2U1RiZlNJUlBi?=
 =?utf-8?B?NFdJc2tpUTY1R05tK1I2WUk5OVVYVFNZT0ZFNlJWTzlDNE1YcExIRGJueVhj?=
 =?utf-8?B?V2syNWxBWWdwN3V4c3ZWdXV6eG5xUTE3dVZsQ3NiVmVGdXN4b3RZUG1ycU1U?=
 =?utf-8?B?Z1I1NTdLK0phMG01Yy9mcTV2TEV2T200ZjRBM1pOeURMTUlHTXdqNVFYTkNq?=
 =?utf-8?B?QkZ2QlNyVDR5aEw3Nll4QUdSMGRNeG40eS8rMkZxYktjcGRBUEk2ZGU1MXpx?=
 =?utf-8?B?RDlkRmVVWXdKaC9ML0lDaGlad29YdlVlVTJDNzdwTFErV1k3N1UySDVTd00z?=
 =?utf-8?B?V0pTMkFCd0VRbXJsZVdwWTh4TFVIMkVhb0tqaW9waEdpN1NMZEs0U09wS0tV?=
 =?utf-8?B?dUhiWS9PZ05mNzNkMFlVd2UyRm5naE5GcnQ2NytWekdpUHNsTmJONlhyN0Q4?=
 =?utf-8?B?NTUvNmxnZjhqOW54ZTlIN2xwbkhWT1BJUnhhRWR5Ykt5YnhmUWVpYWxEcU5p?=
 =?utf-8?B?L3htamY0cUt1UHpjVm0wUDVaTnA1YVQrd1VvVEVuWUVIMGlyRWw5K3pnYVBn?=
 =?utf-8?B?aW9GY3dPRUY2M0ZIUzFxS0VXZjVQMmZ0R25mdWt3bEhFS0FRalZlT3FmVFRv?=
 =?utf-8?B?azZYbElzTDdKci9kTmVZVjZObVZzWS9lK0RNUXhyOGF4aEwxTnhFbHljdWM5?=
 =?utf-8?B?b3JqZEhubTVMSnVheHBKQWJRRXNPNTAvR1hhU2dmYTJTbjVaQ1hoeUZHVno4?=
 =?utf-8?B?RUhkRGRwR3NPWEtYMlRobzM3QktYbk45MXI1dFlkNGpBRWtaeTRQZEF6SCti?=
 =?utf-8?B?WFVJMW8zVmtQNXNoMEY4MWI4emJ2TVlhL1NxNDViS3ZpMVBVWkt2dGMvYWZw?=
 =?utf-8?B?dEx2b2tpZENxWUk0bDlVNXY4cDBmMEo5VjQwSG10b3hSMnB3aVhneUxQTTk0?=
 =?utf-8?B?MnNpQnA4UkR1eitpOFkvaEtxRHJxWUdyVmdsY3JsT0tteVRYc05ZVWxta0dJ?=
 =?utf-8?B?RFhPSzFDSW8ybFFMMUd5R0FqZnB2Tzk5dTdpS3pEYUU5cDRabnR5elkvMUNW?=
 =?utf-8?B?RjY2amNQZ1RPRGFOeUhQaTUzQ2RKeDVYTnZCRm1wclRGQTdTSXo0dzMvbEdK?=
 =?utf-8?B?dXZRZW43SzYxYW1BcklHOEg2S1RxQ3FFRXRndHBwZEd0MmZFeTNzQmZ4ZzhK?=
 =?utf-8?Q?zCPcNJiAzAf4gWv1g3ZGpPAFY?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b4d2dc-d047-4481-73be-08da871b6b56
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 04:28:26.2447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fk3uDym/brl3cjv5KfrFU+PcEn6v3j96OQV3foXdID5DY0OOPDpuhFqvqSxkucAZFNJz9422XU7G3Zm0sEkeYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3242
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-26_02,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 phishscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208260015
X-Proofpoint-ORIG-GUID: nNvJLMT1_CCiN7RFo3T1HGRcErL_aZa4
X-Proofpoint-GUID: nNvJLMT1_CCiN7RFo3T1HGRcErL_aZa4
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/24/2022 11:19 PM, Eugenio Perez Martin wrote:
> On Thu, Aug 25, 2022 at 2:38 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 8/23/2022 9:27 PM, Jason Wang wrote:
>>> 在 2022/8/20 01:13, Eugenio Pérez 写道:
>>>> It was returned as error before. Instead of it, simply update the
>>>> corresponding field so qemu can send it in the migration data.
>>>>
>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>> ---
>>>
>>> Looks correct.
>>>
>>> Adding Si Wei for double check.
>> Hmmm, I understand why this change is needed for live migration, but
>> this would easily cause userspace out of sync with the kernel for other
>> use cases, such as link down or userspace fallback due to vdpa ioctl
>> error. Yes, these are edge cases.
> The link down case is not possible at this moment because that cvq
> command does not call virtio_net_handle_ctrl_iov.
Right. Though shadow cvq would need to rely on extra ASID support from 
kernel. For the case without shadow cvq we still need to look for an 
alternative mechanism.

> A similar treatment
> than mq would be needed when supported, and the call to
> virtio_net_set_status will be avoided.
So, maybe the seemingly "right" fix for the moment is to prohibit manual 
set_link at all (for vDPA only)? In longer term we'd need to come up 
with appropriate support for applying mq config regardless of asid or 
shadow cvq support.

>
> I'll double check device initialization ioctl failure with
> n->curr_queue_pairs > 1 in the destination, but I think we should be
> safe.
>
>> Not completely against it, but I
>> wonder if there's a way we can limit the change scope to live migration
>> case only?
>>
> The reason to update the device model is to send the curr_queue_pairs
> to the destination in a backend agnostic way. To send it otherwise
> would limit the live migration possibilities, but sure we can explore
> another way.
A hacky workaround that came off the top of my head was to allow sending 
curr_queue_pairs for the !vm_running case for vdpa. It doesn't look it 
would affect other backend I think. But I agree with Jason, this doesn't 
look decent so I give up on this idea. Hence for this patch,

Acked-by: Si-Wei Liu <si-wei.liu@oracle.com>

>
> Thanks!
>


