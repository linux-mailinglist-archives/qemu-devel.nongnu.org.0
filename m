Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF9C4E6E7E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 08:05:14 +0100 (CET)
Received: from localhost ([::1]:33024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXe0X-0006GA-1I
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 03:05:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nXdxL-00052q-QS
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 03:01:56 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:27954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nXdxI-0008C9-2d
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 03:01:54 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22P01a4f031953; 
 Fri, 25 Mar 2022 07:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=jv4ibiEEm66A/b/O7HFYXZi1c59UGv4iaFr75ab+0A4=;
 b=UTju39FhhIuMDqT54bkesQJCslHGMCYomIa0Ms5hcrlNKwqaJTJTSmaj+P14z3DBLzcF
 MeXuSt8HFuwMTzGJfh/dComHdV1SDSjMphuSiYNpYyZfCMdS2i6Lo0IxOb5hrdlnk1Li
 SRoRgW2V0ZGJKredSSf2dmHdCAEIQpOQzwMjK1R62sfYSMcRFILMl3p3SxO02xzGI7yJ
 gYhLqw97epEmw1M+Jhl+kJc/R9OngOrVfFkLoKC8yN/zY9PN9Ag3WwFs5A2Qg0Own9uP
 7c0i0Z/cJf4J2FVBomWo5YcsR8lD0jMvnqE5YEaZrRzCzkXLF67R8MJQT7FKQnr9aqJ+ OA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew5y26hs7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 07:01:47 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22P6uCCR029283;
 Fri, 25 Mar 2022 07:01:46 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by userp3020.oracle.com with ESMTP id 3exawjg205-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 07:01:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L62fwCrsfGvvDPRVciJDy6xxMUAfLC6hTDY7rnrBxCvK3pWnb5OmDhakvj77bZoqXwCOsQhAJi4/WeIKAbr5JEaUzGJLLXFnfbrrpScpwS5uqcTxThcLxf4GLxTYRfKUuaxLgb17y1bRSorWOzsSaOjxh0h7CLbaHrtLhvR4hPWERZgSJzlrAa0TX/VsJJXPlqQN7a9CLmgB1+WP3B//rdNSDxKm5s4HvztzkHiqrwaflfCglhLEvy4BY1StwfDM4Jh4FASIoJpHH1B4ZcwGh1H8YYlElhB52MjeO2vKpHKwnAXqL/7nhT4WeZATkyQWKF6BTZkj8PgbIpbWVjSxKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jv4ibiEEm66A/b/O7HFYXZi1c59UGv4iaFr75ab+0A4=;
 b=O2g2ENZYcX4yag/qF9OElg+wJaPakbF1jCJ7GQwtFUqtXIMYQcIHvUXGXKtMv9Wu+KzdRW8xOJD1nS36YhXZa3WGM9flTGiQlfjqOq1wCyiZSdmX3FNIyPaD3DRnfB2ZRnuSArbWwCjKOlscZYXHIpvN34GShFogAgRWBjjtOk7z5bqeRlyyT804Irz5IDqGXcXnvyuhhZHV61MkakiFo0orqKlIobYAogkzgOpaIQrzXy/43yEapGMc5g+obKbRj25n68Yr+zGeLGBpecAKu3ETejrXiN7ZrKOB4Y1kTrHlyemeQc1QOaHf/o4ko48afXKdBVoCnR1GySzeJUU99Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jv4ibiEEm66A/b/O7HFYXZi1c59UGv4iaFr75ab+0A4=;
 b=eH+yn6CJuRRwKAP1KlMyJQDHwEUzzT7E6Qh9K6vyWsFfHEkthOF1gDJ2hixp1akX0O0UUMD4el1SQh7VC8q0cV48X1TAnt8PNxgO9BP2hdz40rfQWbPFhSXlWMXToqOCjpF9UdbZVVhe69nozUkLSpZKVaxkacyR28A/fZILLYc=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by DM6PR10MB3499.namprd10.prod.outlook.com (2603:10b6:5:178::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Fri, 25 Mar
 2022 07:01:43 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96%6]) with mapi id 15.20.5102.018; Fri, 25 Mar 2022
 07:01:42 +0000
Message-ID: <c3e931ee-1a1b-9c2f-2f59-cb4395c230f9@oracle.com>
Date: Fri, 25 Mar 2022 00:01:38 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [RFC PATCH] vhost_net: should not use max_queue_pairs for non-mq
 guest
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
References: <1647663216-11260-1-git-send-email-si-wei.liu@oracle.com>
 <CACGkMEucw7GASmZwYEwwTYtNw3Bup_0huaDtoV5_FdSfW_4Cuw@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEucw7GASmZwYEwwTYtNw3Bup_0huaDtoV5_FdSfW_4Cuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0143.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::28) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4208b4e1-4626-4988-8ad9-08da0e2d5157
X-MS-TrafficTypeDiagnostic: DM6PR10MB3499:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB349948EDFD248279A4C33C32B11A9@DM6PR10MB3499.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9BYyPeAnqrurIUCzL908lmYTbyXO0GKD/krAHO9b/XRawZrw01mfcq7tfgMUyJ75QhSK4CWpQ6cNeRhT2qMfb4GTXvC4dz37n5EBr+XoFfaPbORSJiWzXNCH8ha4CANMzs/a51f1xBTSUiskqsQeOkaa202FThWX9INF5FWo/5e67qr6lESrMFR3BVxHA1wHAc0o7xeY93YetEPmnvtn13SZ2ob0I8IC3rTpoTpvFO1+HB/zEJvGQ/Dm3BBf/1XzbfC+bM82Jvi7Vm/VA/DvTeik7mSkeRbDaFEoHHReVJRrU/2D8NiwycWF/+uXECVxznmIT/9/XppihK/ImjJok1TiZWggb6jfMMJ9lnLJy1rWDrNqF10g0NRzHqPPMxZU7DLUFrzLmPNteaIwvF5P/GVVcefs5cQV139U7r2aQonnZ1tdEHOZ8gV/r13bzRrysCSm0FELbDZDGfnzsXRJS4P8xX/xxIO6Md7w3IfaVKWMOC8fYh/q29q/EiWsPxk84kiwj1HcOq07nymbNqvgq4radbmZB11G1jjq0cohKlsOH+xqVlRH04bv9EtutbT4MsGzGfRKmJA5On0N6r5uDBYWH9GNNGbUXmgS35gyGTrT55Y5M6yOpUiAM5gtFpirXBpZeNtXStPEMdaUOhNTeyPWZvTk5S9mCKIiGqeG3pdAWglmxkZrmE1idFa4DRgqBa1u9yukuMJMEfdF0eB2wVtrcWLi/Gx+uPsuT6BEigM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(31686004)(31696002)(6486002)(83380400001)(36916002)(38100700002)(6666004)(6506007)(6512007)(2906002)(53546011)(508600001)(66946007)(5660300002)(4326008)(66476007)(66556008)(8676002)(8936002)(2616005)(30864003)(6916009)(26005)(186003)(54906003)(316002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djcrUWQ4OXFIU0hORXhBUnhPMWZ5Y28raGlMeFEvQ2JsL3BFRDdFZDBVKzBR?=
 =?utf-8?B?LzlvNGIrc050VG81clg0dnRzUEVEYnVhR3hGdUkzU011bTA5Unh4cWhtTC9m?=
 =?utf-8?B?NWpvWlV2TnpPSHByQmRISmtmZ0psN0NRMENrQ3k2WTdPWDcxczB5OGFRS3p4?=
 =?utf-8?B?b1oxa2NkeVY5VkpNd0l0SC9hNy92TUg1RTcwSlpjdVNqWlVKb3k5eVV4L2F6?=
 =?utf-8?B?M1ZkemkrWmNzU3krZVk1M29ycnN5VDUwQ1lkNzVrMEQwMFE2ckNCWlFhcG1y?=
 =?utf-8?B?eTRQU2F2MnBHcndEWkY5TFlVaXhtQ2phY2NrTkhoWDR3T09zamhjd3EzNVRp?=
 =?utf-8?B?bklnMXFqQ1gwVHNOTzFSL3d5TGc0SVlLZU4walY1WVo1NGxLRVlSd29XeDNT?=
 =?utf-8?B?dWVyWVQ4ekw2dlpaTEdOZWRCeXpUWHZBeXg2NnU0cFVobnFiTEw4eTNzUFlF?=
 =?utf-8?B?RXVHNE1zRFlkRUd1K0Q4T0k3eFU3dmgrU3ZJcEpLVk5aM0M1TndjS0JRNzNO?=
 =?utf-8?B?b2JFSzhPdG5MZ2Izb01NNms2RHhlZ1hyZ0lKU3ZVSW5iMW1sZFlLOXJKRXZC?=
 =?utf-8?B?QkNSbDhEYzFvZkk0WkJoNWJ6emc3bmhwaERjcXRtU0VrMThuZSs3QXpnZUwy?=
 =?utf-8?B?V2NPN0Jzdlp2cW1FQkJiZWFWb0RJSEdBNExySUZoZHMvWDNJVVdIREJZMURC?=
 =?utf-8?B?Y2s1aVZZemg0Tno0Zk0wekdKbEwrZDRWSUpaaGlSZ1ZaaWk1dHlXSkNsbmh3?=
 =?utf-8?B?dHRkV2JZa21KTmlCRGlKRUFVNDJnU01TSERBRnBXM3A1MkhxWmQxTldqSWpU?=
 =?utf-8?B?c01aTFdvbFJXMy9ITlpXLzQ1bk96a09DLy9KY0hreVRNaVZxVFYwSC9KL00w?=
 =?utf-8?B?ekJmRHRHaUZrRTh5eGxpUEZnOXI0MlJCRTErWWFDSmxuaWh6a0RLdktxd2l1?=
 =?utf-8?B?V3didFRiaEcyV1ZyRjBZWG0wOXJxNG1nRURSMzdrcnVQU24wNjlmY1NTQTNk?=
 =?utf-8?B?b2tmYUw0QjgvSk5zbDU3MmVHQnlIUXF5QTVmcWhNdWdZZnZHWk91NnV4NjZP?=
 =?utf-8?B?Y2ZtOWVhZys1ZWR2SGo3MFgySnVmRFlubzNGMHgxWjV0cU9mcUtGSDh4VEY4?=
 =?utf-8?B?RGM2OUgrYVBDT0xac3NVSWR0d1duTjh4dHVTZHAwTlZkck1jTjJOZ0lVeTU4?=
 =?utf-8?B?cGUwWUgrbWxBMityTjJJUnNMT2hjUEJvRVhhNFFFeDlJYVcxbVhMQWJveEdW?=
 =?utf-8?B?YmI0WGpycThzSHhNaElyZmltaDVvQzlVYVdzOXU2OVlyU0xCMVpQc05yb2c0?=
 =?utf-8?B?WFc2UDlDVXlubVBZcHhOcHJzMk5JbTN3MjJ3WE03bVpiYU1KY085N3IxL1Vv?=
 =?utf-8?B?dmd0RUN5WUVwaGowUGJjdDdBbG5UWldwL09rVUlRY1RUamYxZnNGa0RGTUJk?=
 =?utf-8?B?aUN1TXFTbUVNbExtMG5wS3BicU9EUEpBNkMvZnVyekN0TDNIZ1U2c3JyN3Bw?=
 =?utf-8?B?dWtTS0VseVEwV0EwT09EejVGRUZUV0F5T1dnN2gxMmc3blh0VjE4YnZnRmx5?=
 =?utf-8?B?SHY1UE5rMjlrTlU5a0l0MTYrenM0N21raCtmd0R2YXcwYkdjUEc0amhNUzh0?=
 =?utf-8?B?ZDc0TG9xRFQ0cmZtSVJFQXJEN1Q1NHpmM0w1VFRUZTF0bVdLcVZpUUptbExW?=
 =?utf-8?B?Q0dVMmVET1BvNWZRdWEyQ016c0FhejUzczZma1lsS0lOdExYMnRreGFJbGo1?=
 =?utf-8?B?VEd6NExmSk02QTArbG1vaVVZMVpFdi94aC9hdzU2WXprVnpoVWxUR1l6eFkv?=
 =?utf-8?B?VWVmR1pvUG1mMjNSenRaN0ZnQmZqclc0STAvaG5VSG1OYjRHMXYvVVQ3bVdK?=
 =?utf-8?B?amgxcHFQTnIvbmRlTnZ5aE9oa0FyZEVrZng4ZGtrR0tEU2RrUXlRbEt2cFlL?=
 =?utf-8?Q?WrJUpeZNsg7+lcNNwMEZfoHSnh6or39W?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4208b4e1-4626-4988-8ad9-08da0e2d5157
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 07:01:42.8761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQkK+bni0Sqh4+Npz8aCNsjy2ywquYbvOKf4ODJ7b28VZoC6/+3iG6yQIbInTbleipJJP4JiliBxiztfE42i5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3499
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10296
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203250037
X-Proofpoint-GUID: fYjGZMIau2-0k3S8aFXsH_oKDuZbOeV4
X-Proofpoint-ORIG-GUID: fYjGZMIau2-0k3S8aFXsH_oKDuZbOeV4
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eperezma <eperezma@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/21/2022 8:47 PM, Jason Wang wrote:
> On Sat, Mar 19, 2022 at 12:14 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>> With MQ enabled vdpa device and non-MQ supporting guest e.g.
>> booting vdpa with mq=on over OVMF of single vqp, it's easy
>> to hit assert failure as the following:
>>
>> ../hw/virtio/vhost-vdpa.c:560: vhost_vdpa_get_vq_index: Assertion `idx >= dev->vq_index && idx < dev->vq_index + dev->nvqs' failed.
>>
>> 0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
>> 1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
>> 2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
>> 3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
>> 4  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:563
>> 5  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:558
>> 6  0x0000558f52d7329a in vhost_virtqueue_mask (hdev=0x558f55c01800, vdev=0x558f568f91f0, n=2, mask=<optimized out>) at ../hw/virtio/vhost.c:1557
>> 7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier (d=d@entry=0x558f568f0f60, n=n@entry=2, assign=assign@entry=true, with_irqfd=with_irqfd@entry=false)
>>     at ../hw/virtio/virtio-pci.c:974
>> 8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers (d=0x558f568f0f60, nvqs=3, assign=true) at ../hw/virtio/virtio-pci.c:1019
>> 9  0x0000558f52bf091d in vhost_net_start (dev=dev@entry=0x558f568f91f0, ncs=0x558f56937cd0, data_queue_pairs=data_queue_pairs@entry=1, cvq=cvq@entry=1)
>>     at ../hw/net/vhost_net.c:361
>> 10 0x0000558f52d4e5e7 in virtio_net_set_status (status=<optimized out>, n=0x558f568f91f0) at ../hw/net/virtio-net.c:289
>> 11 0x0000558f52d4e5e7 in virtio_net_set_status (vdev=0x558f568f91f0, status=15 '\017') at ../hw/net/virtio-net.c:370
>> 12 0x0000558f52d6c4b2 in virtio_set_status (vdev=vdev@entry=0x558f568f91f0, val=val@entry=15 '\017') at ../hw/virtio/virtio.c:1945
>> 13 0x0000558f52c69eff in virtio_pci_common_write (opaque=0x558f568f0f60, addr=<optimized out>, val=<optimized out>, size=<optimized out>) at ../hw/virtio/virtio-pci.c:1292
>> 14 0x0000558f52d15d6e in memory_region_write_accessor (mr=0x558f568f19d0, addr=20, value=<optimized out>, size=1, shift=<optimized out>, mask=<optimized out>, attrs=...)
>>     at ../softmmu/memory.c:492
>> 15 0x0000558f52d127de in access_with_adjusted_size (addr=addr@entry=20, value=value@entry=0x7f8cdbffe748, size=size@entry=1, access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x558f52d15cf0 <memory_region_write_accessor>, mr=0x558f568f19d0, attrs=...) at ../softmmu/memory.c:554
>> 16 0x0000558f52d157ef in memory_region_dispatch_write (mr=mr@entry=0x558f568f19d0, addr=20, data=<optimized out>, op=<optimized out>, attrs=attrs@entry=...)
>>     at ../softmmu/memory.c:1504
>> 17 0x0000558f52d078e7 in flatview_write_continue (fv=fv@entry=0x7f8accbc3b90, addr=addr@entry=103079215124, attrs=..., ptr=ptr@entry=0x7f8ce6300028, len=len@entry=1, addr1=<optimized out>, l=<optimized out>, mr=0x558f568f19d0) at /home/opc/qemu-upstream/include/qemu/host-utils.h:165
>> 18 0x0000558f52d07b06 in flatview_write (fv=0x7f8accbc3b90, addr=103079215124, attrs=..., buf=0x7f8ce6300028, len=1) at ../softmmu/physmem.c:2822
>> 19 0x0000558f52d0b36b in address_space_write (as=<optimized out>, addr=<optimized out>, attrs=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>)
>>     at ../softmmu/physmem.c:2914
>> 20 0x0000558f52d0b3da in address_space_rw (as=<optimized out>, addr=<optimized out>, attrs=...,
>>     attrs@entry=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>, is_write=<optimized out>) at ../softmmu/physmem.c:2924
>> 21 0x0000558f52dced09 in kvm_cpu_exec (cpu=cpu@entry=0x558f55c2da60) at ../accel/kvm/kvm-all.c:2903
>> 22 0x0000558f52dcfabd in kvm_vcpu_thread_fn (arg=arg@entry=0x558f55c2da60) at ../accel/kvm/kvm-accel-ops.c:49
>> 23 0x0000558f52f9f04a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:556
>> 24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so.0
>> 25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6
>>
>> The cause for the assert failure is due to that the vhost_dev index
>> for the ctrl vq was not aligned with actual one in use by the guest.
>> Upon multiqueue feature negotiation in virtio_net_set_multiqueue(),
>> if guest doesn't support multiqueue, the guest vq layout would shrink
>> to single queue pair of 3 vqs in total (rx, tx and ctrl). This results
>> in ctrl_vq taking a different vhost_dev group index than the default
>> n->max_queue_pairs, the latter of which is only valid for multiqueue
>> guest. While on those additional vqs not exposed to the guest,
>> vhost_net_set_vq_index() never populated vq_index properly, hence
>> getting the assert failure.
>>
>> A possible fix is to pick the correct vhost_dev group for the control
>> vq according to this table [*]:
>>
>> vdpa tool / QEMU arg / guest config    / ctrl_vq group index
>> ----------------------------------------------------------------
>> max_vqp 8 / mq=on    / mq=off  (UEFI) => data_queue_pairs
>> max_vqp 8 / mq=on    / mq=on  (Linux) => n->max_queue_pairs(>1)
>> max_vqp 8 / mq=off   / mq=on  (Linux) => n->max_queue_pairs(=1)
>>
>> [*] Please see FIXME in the code for open question and discussion
>>
>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>> ---
>>   hw/net/vhost_net.c     | 13 +++++++++----
>>   hw/virtio/vhost-vdpa.c | 25 ++++++++++++++++++++++++-
>>   2 files changed, 33 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>> index 30379d2..9a4479b 100644
>> --- a/hw/net/vhost_net.c
>> +++ b/hw/net/vhost_net.c
>> @@ -322,6 +322,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>>       BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(dev)));
>>       VirtioBusState *vbus = VIRTIO_BUS(qbus);
>>       VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
>> +    bool mq = virtio_host_has_feature(dev, VIRTIO_NET_F_MQ);
>>       int total_notifiers = data_queue_pairs * 2 + cvq;
>>       VirtIONet *n = VIRTIO_NET(dev);
>>       int nvhosts = data_queue_pairs + cvq;
>> @@ -343,7 +344,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>>           if (i < data_queue_pairs) {
>>               peer = qemu_get_peer(ncs, i);
>>           } else { /* Control Virtqueue */
>> -            peer = qemu_get_peer(ncs, n->max_queue_pairs);
>> +            peer = qemu_get_peer(ncs, mq ? data_queue_pairs : n->max_queue_pairs);
>>           }
>>
>>           net = get_vhost_net(peer);
>> @@ -368,7 +369,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>>           if (i < data_queue_pairs) {
>>               peer = qemu_get_peer(ncs, i);
>>           } else {
>> -            peer = qemu_get_peer(ncs, n->max_queue_pairs);
>> +            peer = qemu_get_peer(ncs, mq ? data_queue_pairs : n->max_queue_pairs);
>>           }
>>           r = vhost_net_start_one(get_vhost_net(peer), dev);
>>
>> @@ -390,7 +391,10 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>>
>>   err_start:
>>       while (--i >= 0) {
>> -        peer = qemu_get_peer(ncs , i);
>> +        if (mq)
>> +            peer = qemu_get_peer(ncs, i < data_queue_pairs ? i : data_queue_pairs);
>> +        else
>> +            peer = qemu_get_peer(ncs, i < data_queue_pairs ? i : n->max_queue_pairs);
>>           vhost_net_stop_one(get_vhost_net(peer), dev);
>>       }
>>       e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>> @@ -409,6 +413,7 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
>>       VirtioBusState *vbus = VIRTIO_BUS(qbus);
>>       VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
>>       VirtIONet *n = VIRTIO_NET(dev);
>> +    bool mq = virtio_host_has_feature(dev, VIRTIO_NET_F_MQ);
>>       NetClientState *peer;
>>       int total_notifiers = data_queue_pairs * 2 + cvq;
>>       int nvhosts = data_queue_pairs + cvq;
>> @@ -418,7 +423,7 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
>>           if (i < data_queue_pairs) {
>>               peer = qemu_get_peer(ncs, i);
>>           } else {
>> -            peer = qemu_get_peer(ncs, n->max_queue_pairs);
>> +            peer = qemu_get_peer(ncs, mq ? data_queue_pairs : n->max_queue_pairs);
>>           }
>>           vhost_net_stop_one(get_vhost_net(peer), dev);
>>       }
>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>> index 27ea706..623476e 100644
>> --- a/hw/virtio/vhost-vdpa.c
>> +++ b/hw/virtio/vhost-vdpa.c
>> @@ -1097,7 +1097,30 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>>           vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>>       }
>>
>> -    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
>> +    /* FIXME the vhost_dev group for the control vq may have bogus nvqs=2
>> +     * value rather than nvqs=1. This can happen in case the guest doesn't
>> +     * support multiqueue, as a result of virtio_net_change_num_queue_pairs()
>> +     * destroying and rebuilding all the vqs, the guest index for control vq
>> +     * will no longer align with the host's. Currently net_init_vhost_vdpa()
>> +     * only initializes all vhost_dev's and net_clients once during
>> +     * net_client_init1() time, way earlier before multiqueue feature
>> +     * negotiation can kick in.
> See below, it looks like the code doesn't find the correct vhost_dev.
>
>> +     *
>> +     * Discussion - some possible fixes so far I can think of:
>> +     *
>> +     * option 1: fix vhost_net->dev.nvqs and nc->is_datapath in place for
>> +     * vdpa's ctrl vq, or rebuild all vdpa's vhost_dev groups and the
>> +     * net_client array, in the virtio_net_set_multiqueue() path;
>> +     *
>> +     * option 2: fix vhost_dev->nvqs in place at vhost_vdpa_set_features()
>> +     * before coming down to vhost_vdpa_dev_start() (Q: nc->is_datapath
>> +     * seems only used in virtio_net_device_realize, is it relevant?);
> Relevant but not directly related, for the vhost_dev where
> nc->is_datapath is false, it will assume it is backed by a single
> queue not a queue pair.
>
>> +     *
>> +     * option 3: use host queue index all along in vhost-vdpa ioctls instead
>> +     * of using guest vq index, so that vhost_net_start/stop() can remain
>> +     * as-is today
>> +     */
> Note that the vq_index of each vhost_dev is assigned during
> vhost_net_start() according to whether or not the MQ or CVQ is
> negotiated in vhost_net_start()
>
>      for (i = 0; i < nvhosts; i++) {
>
>          if (i < data_queue_pairs) {
>              peer = qemu_get_peer(ncs, i);
>          } else { /* Control Virtqueue */
>              peer = qemu_get_peer(ncs, n->max_queue_pairs);
>          }
>
>          net = get_vhost_net(peer);
>          vhost_net_set_vq_index(net, i * 2, index_end);
>
> It means some of the peers won't be used when MQ is not negotiated. So
> it looks to me the evil came from virtio_net_get_notifier_mask().
Yes, there it is. Where the control virtqueue first ever needs a 
guest_notifier for vhost_dev.
> Where it doesn't mask the correct vhost dev when the guest doesn't
> support MQ but the host does. So we had option 4:
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 2087516253..5e9ac019cd 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3179,7 +3179,13 @@ static void
> virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
>                                              bool mask)
>   {
>       VirtIONet *n = VIRTIO_NET(vdev);
> -    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
> +    NetClientState *nc;
> +
> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
Hmmm, I thought it would be more natural to align the layout of 
vhost_dev's with that of virtqueue's, not the other way around. Not sure 
how this vhost_dev selection scheme may work with additional queues 
discovered through transport specific mechanism, such as the admin 
virtqueue, but I can live with it for now:

--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -244,7 +244,8 @@ static void virtio_net_vhost_status(VirtIONet *n, 
uint8_t status)
      VirtIODevice *vdev = VIRTIO_DEVICE(n);
      NetClientState *nc = qemu_get_queue(n->nic);
      int queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
-    int cvq = n->max_ncs - n->max_queue_pairs;
+    int cvq = virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
+              n->max_ncs - n->max_queue_pairs : 0;

      if (!get_vhost_net(nc->peer)) {
          return;
@@ -3161,8 +3162,14 @@ static NetClientInfo net_virtio_info = {
  static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
  {
      VirtIONet *n = VIRTIO_NET(vdev);
-    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
+    NetClientState *nc;
      assert(n->vhost_started);
+    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
+        assert(virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ));
+        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
+    } else {
+        nc = qemu_get_subqueue(n->nic, vq2q(idx));
+    }
      return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
  }

@@ -3170,8 +3177,14 @@ static void 
virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
                                             bool mask)
  {
      VirtIONet *n = VIRTIO_NET(vdev);
-    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
+    NetClientState *nc;
      assert(n->vhost_started);
+    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
+        assert(virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ));
+        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
+    } else {
+        nc = qemu_get_subqueue(n->nic, vq2q(idx));
+    }
      vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
                               vdev, idx, mask);
  }


Thanks,
-Siwei

> +        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
> +    } else {
> +        nc = qemu_get_subqueue(n->nic, vq2q(idx));
> +    }
>       assert(n->vhost_started);
>       vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
>                                vdev, idx, mask);
>
> Thanks
>
>> +    if (dev->vq_index + dev->nvqs < dev->vq_index_end) {
>>           return 0;
>>       }
>>
>> --
>> 1.8.3.1
>>


