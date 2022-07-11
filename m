Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C747570693
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 17:06:00 +0200 (CEST)
Received: from localhost ([::1]:60488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAuz1-0000QD-EF
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 11:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oAuP2-00067F-MJ
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 10:28:50 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:60972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oAuOw-000562-4Q
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 10:28:44 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BDoXmD019628;
 Mon, 11 Jul 2022 14:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=VDxww3Y1Xzu82k56jXhlY2AmKlWzgXkVoSu+9hnczTo=;
 b=j7WWPPG0E3bdqmlw6DFHuk0zr8vmaS/yZfukJMGQ0HSlSmGO2zhzo6JGjuLPn5waFOa4
 3pAroIOc01kFMAHURhR6QV7MpUYYTVYFSKZ6Ef6yVaD2FswYFdnitIb10CSIxKwWluQg
 27bFAKpio11clGe5IkKN09dfFtLpuInbk82vDI3oVNzSdRMnheLZaXIaDXQPQt3YmBuD
 dVQ/yCvOUrqff48mRIxDF3k8wDira3X53sgfDhoptQsc8VBvs3MYx5v1o1JQ4miAlBcV
 QH6yJ//c2WZ8bDqGf+IRc8aLZWP+YKa7KyiRlSj1/POIQSGFfVaQBKNMmpz7rVeX5XtA 0Q== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71rfumx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jul 2022 14:28:28 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26BEP4eF014796; Mon, 11 Jul 2022 14:28:26 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h70422wtc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jul 2022 14:28:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtXfWd1jSjGpj0Sg0XGbebUy0s/VqwtEexHjqU/PNpnCB//VOCdVjWQ6m8uI+6z57RseLKmVt23b9HeD8tV7sBeY+8GRIxAfUaefQbXD7h8gaDEsGHbkjnwLewKod4ASkfif3Ea8hCazooEFC/H3hmmfWPmt8NqkWIWy870FchIpSJr3+GNAfC3bIIL+yfUUh+1uXk8VD4xZS7gApQff68u66PG19naiqUd8wkfeyTq8fzDJehjz7PfZUFPauUBjIirz9nd4ozBlgjh3xNn1xOlxnukeZPTachFNxxaP/uYjnDI28jKIZOjfvbWNhwJQeSrR9zzqoNb2/kFITFEprg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDxww3Y1Xzu82k56jXhlY2AmKlWzgXkVoSu+9hnczTo=;
 b=RhtD1eaCAb0kryA/G9JdnP8FeOae3vMEbloeS1AcIl39NAV9SYP4tmbUaF5nQd1/bWMq3XzEJMBs6+rvYJfxKVS4sC7UBJi0y1xSIgvwofB7zILXse5RVS+3X1+cXqzF3oQTkpfjhXnHxrZtH+Vnlas/uDEXBXzOYGKafiCXz1W4+O85A1v6oBKN6QAi3q2L9NLqxlCdSarkH/TbBVPbog5lrsAHTOdNfEgaWIq9tCK+UAzhr23OS9xRhFB/OwMHLxRf6FvMmTq5idOar6y8Lgh8ruaU1BhPatoJyJxKtnkBqSRad5XLl2sh/BXOiyvEBJLm6zJR2CkYuHLoRNebqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDxww3Y1Xzu82k56jXhlY2AmKlWzgXkVoSu+9hnczTo=;
 b=zzCk2ukMyWC1LNjV5ztTRU0Uv0jCYr4FxecWmDbLvQl4k/YdhKl1n0gnKgBtn1eGyjKqRMGbOmTDmOf2m6dHWoSsS2Dm/dCBAHquw1PNMqY9eV1paO84IqXSF5gDsjCdo4QAGPeCGBACoWmEKoGXcu9T/LguAa5H1xMLs3UZETs=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DM5PR10MB1723.namprd10.prod.outlook.com (2603:10b6:4:10::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Mon, 11 Jul
 2022 14:28:24 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 14:28:24 +0000
Message-ID: <ec7d862e-18db-065f-2895-00e93999a256@oracle.com>
Date: Mon, 11 Jul 2022 15:28:16 +0100
Subject: Re: [PATCH v6 06/10] i386/pc: factor out cxl range start to helper
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-7-joao.m.martins@oracle.com>
 <20220707150015.22b9d29e@redhat.com>
 <d2ded99f-91e7-53af-9dd0-07b974ee27af@oracle.com>
 <20220711144756.17e225be@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220711144756.17e225be@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0551.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::19) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56261c20-8ee0-446b-01ed-08da63499d10
X-MS-TrafficTypeDiagnostic: DM5PR10MB1723:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: akmKTBVdrdFTOu6CupFT27dc/7J40WEP0rJ97fSV4QAg3gaUuVbKx5N+38uvJK09oHVH/KA1oDtR7jxDzgEjz4GLq/4L/5bbnWNoXPRSvEZKv3MdFu1t/HcPCRVe1uU1635TNhRQI9QVFPQGXNFhFK5IGbSkNqSR9Vh2g2m7Z3bqlGGnwGRgKxyf2UkG9FITmfP4d+rz5ZbO6lHIe/YQs8ils5akDj9US8Vr4zuYmAQqgeQSEfbETZI2VYdLBizI4lCjlhBxh7V5KRakDINZPRcP/870fuy/DAH9wLcTFtWVTySiNByhOpAA4q93nPt+vO2vNRQgkr5gDv6J9KNKf9G+ciNJmLAA6appRGoZo0n7R81XlCtvPQ86tEabq4IOuA9Oe/rBGWDqkLYISq4DOj/WUCWs3GI5XdOHv7js1vWWwUMTrRmHAXPzGctilGDAgaUgwnAlv8qiG/Q3d4y5uYl7Lrv6Cy3cW2/K0V1abD12laaz90kfl6/RdFOrf1bUrE/bvTGSiTmMfmeuoaNwVpFC9dEpk+AMIaATfuvUfk1Er0StzzPx9QHXnDr9WkqChKUtHJ6eTQJddZICymn2EWpeQ0STh/nq1ovur4w+zIU7m3HFMsDrGsnh/Sy7DIKGAgMjmFxU6020cLPy0Rbd9hY+x70p/KnFqCHdgkTiVf/76YJ1LVvOIjFdLRDyswqT4pnOvBHj7rDckzPkEkhxCyllJ/140+eXuoFipGaBcyOY1i07sA2VhhcMAH+q8cqW0gW0F5J0r5AK+9tEjnKJ70ZOSso9JqqoGfBuRz5usgKwWDi3SXmI3x9PopD4QKUJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(376002)(39860400002)(396003)(366004)(8936002)(86362001)(5660300002)(6486002)(478600001)(2616005)(31696002)(6666004)(6506007)(83380400001)(26005)(7416002)(186003)(41300700001)(2906002)(6512007)(66476007)(316002)(66946007)(4326008)(31686004)(66556008)(6916009)(8676002)(38100700002)(54906003)(36756003)(53546011)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aS9aT05veVZ2dlZSWGZzV2pRNFF1K01aRWh6eGREVU9zbDA0c0IwWHBWTlRJ?=
 =?utf-8?B?RFJ0WWJSbDJyakk3d21pSTIrclBtL2lqRmNyNTZsN3U0dnpMeXVtQ2cwemRi?=
 =?utf-8?B?RFZ3UFd4RG5LN2J2ZVQyY29GWllpUGdERkZBN2hpRkFocGpsV01mQ241dHVn?=
 =?utf-8?B?R0puVmVBd1pBWXFVMmtPWnZPMmk2ZzJFVzhTMUxiUEtNUmFaZmhBcXlDOHFq?=
 =?utf-8?B?eUVocE9QbXFheUhMYmwyZFpVN3FMSFRCSS8wRERWV214Nkc3dVRPMG8zSHJB?=
 =?utf-8?B?OFc5T2xlVkZ6V3BVeUhLTVFua2ZYazVQWlVLU0hPSWV6cThGb1Z5NEthUExk?=
 =?utf-8?B?TXNPcFJuR1MrVGNQL0hwYUZkRnVKVjdIQytlQUNpVzRrQlNiOFBOTGwvamJ4?=
 =?utf-8?B?NllUVDlqZVN0b0IwTHZDYVo0a1phU0xEdER3ejMrUFp4RkpBcmJFNXhhM09V?=
 =?utf-8?B?MWRhSEdIK1JCdFJyYmovMGNMV0I1aE4vUzVDdWRTYVh5R29WRUZhaWtkUWhz?=
 =?utf-8?B?a0FhaTMwQkNvMEtWMVlLLzJFYi9SLzBzeUdyTE1idzV4d0lnYlVZRDlKOGRo?=
 =?utf-8?B?VWptdDZIc21PTzNSMVJxc1hrNklpUm9ZOWdiSWxvMGRzcnN1aVRoZlQzcUty?=
 =?utf-8?B?UlpPeVcxTjlGRkhOZE1taU0vdDN6RGpZZllaNk1zNHphQzJTWDlMUjRHM0Rk?=
 =?utf-8?B?UGtiZEZsOXZaUS9jdEhIZEdEekxxZVhoSGNZMEszcllLM2VoUVQzSDZVYXVw?=
 =?utf-8?B?YUQrSWUrOURCQTJDRldUVFJKSUJxOVd3elAzN3ZaVWZtdXdkMnVUUmVQclRk?=
 =?utf-8?B?QmlMR0Z2V3NjVk9mMVFYcHFnZCszVXQydHhKcXdFR0w0ekFVTXRuZUJLZVhO?=
 =?utf-8?B?STRSS043MVpkenNYQm43emc5MGh4ODgxY0pLVzRZdkdabFJLeEFTMCtHMTRD?=
 =?utf-8?B?K3pqNW4wamFlOFdxdERKbngrbjB3b2FmLzRXbUY1azZuMzNNejFYUUJZQlZm?=
 =?utf-8?B?OGFYTjZsazVvS3RERVgwNGtPOTRUUVlsZ1JlZ2xxd0I2T2w0bWNGempvMzJs?=
 =?utf-8?B?VDVQaHR0cjd0a05XWWNBUWNuQ0VqbmZ5cDhyU2pHUnlsWGJNelVFS29TS21T?=
 =?utf-8?B?a01KQ1JnN0ZkSGxvT1A4cFJHMG5FRjF1NlBFdEdXME50Z3BBQkVkQjJEYmdJ?=
 =?utf-8?B?ZEt3Q01aYzdQUlBuSzI3UDVIUlM0aHYrYmY2QTRCTm51NHd4Vko2UmdaeHpO?=
 =?utf-8?B?a3BQVGx1L2V4V0VaVENLcFBXVXRFZHN1UVNsVmw0K2h3MWt2S3NpOUluN1JF?=
 =?utf-8?B?RzlOUk1GTlRRZnVXbkVYdHkyUzhEREtHcm9kWnhlUDR2enFwWUcwV3FjSkZx?=
 =?utf-8?B?bXZmUmI0MDRFa2Rjd2VKVnowSG9KRUZOcE5OdlZVUWgwL3lHYm5SbWpiOHpj?=
 =?utf-8?B?YlFnL0c1R2o3Y3VOVnlUUW5rdzJ1bFV1WTI3SytrcUZ4cDA2MlJnUzFmbGR2?=
 =?utf-8?B?WEtySjg3Mm5pTkJTMGh5ajJDTUNlZ2wzNmZXeGhnUnFaSGh5eVl6QVljUTBN?=
 =?utf-8?B?Y1d5S1gxbWhVU01HVlczS0hRdVFKdGJ1VjRzaldGdk5LLzNCUVAvME1wb3pL?=
 =?utf-8?B?YnprRzY5ODZ0RzdWMno0WndaaXRiTWJFMFM1UnkxdUEwZ0M3RElLamY2YmlO?=
 =?utf-8?B?UU9melRPaEdjdEZFbmp4UHZZbW5HN1RBSmpIMkw1b1RBV1NpbHQ4MVdVODBB?=
 =?utf-8?B?Q0FhSW94TWE1QkdnSzF4cG5XdzQxcEZLWTFNb3ZlWEY2VW1BamVjMWRHbDNx?=
 =?utf-8?B?U0lvTEdjOEEza1RacUkvVnAraThjdzFBd1pQeklldUlYM3JrNis3alhkMnFa?=
 =?utf-8?B?ZkNPZkhzMCtZS3hZSUZ0T0VHS2Y5Wk10Sk1rUmpMay9uTTMwOVhTdDZ4cFN1?=
 =?utf-8?B?N3NVQkZhNlZaN1dWTVRaYUlzMysyeUwxVWRUTEJXUHJqRWo2TGNlNTd6SUNF?=
 =?utf-8?B?dG1TYXAwQXJsdm44QzhwNUhDcS9neXlrVWtCU2JvaXI0NzFlY21ncGpFazhX?=
 =?utf-8?B?VTQzZ2JyVHZxOVZvQ3pqUXU1L2FrNVFnNFVHcTkwWVk2UDh1dFdnK0MyVE04?=
 =?utf-8?B?TlB5S3VmY0J4MzRjMEhLYUU4VklqVG9GY2VFODE1N3JSTDRyQmVFZ3E5QWdp?=
 =?utf-8?B?T1E9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56261c20-8ee0-446b-01ed-08da63499d10
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 14:28:24.7680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1G+FpBWNnw9KM6U/BLueu30AKdwzEwctjw6s/sn/P1QKGID8vMK7+hCs1SzSxoRUDO5w/q69bJ3brQO36ra0d8lA7sHdUeQRmUo6RVJhhYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1723
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-11_19:2022-07-08,
 2022-07-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207110061
X-Proofpoint-GUID: x6P0nF_pyk2kgWmiJAafVZVlcQdEtIlR
X-Proofpoint-ORIG-GUID: x6P0nF_pyk2kgWmiJAafVZVlcQdEtIlR
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 7/11/22 13:47, Igor Mammedov wrote:
> On Thu, 7 Jul 2022 16:18:43 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> On 7/7/22 14:00, Igor Mammedov wrote:
>>> On Fri,  1 Jul 2022 17:10:10 +0100
>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>   
>>>> Factor out the calculation of the base address of the MR. It will be
>>>> used later on for the cxl range end counterpart calculation and as
>>>> well in pc_memory_init() CXL mr initialization, thus avoiding
>>>> duplication.
>>>>
>>>> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
>>>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>  
>>>
>>> needs to be rebased on top of 
>>>
>>>
>>> [PATCH 2/3] hw/i386/pc: Always place CXL Memory Regions after device_memory
>>>   
>> Is Michael merging these or should I just respin v7 with the assumption
>> that these patches are there?
> 
> I'd do the later (just mention dependency in cover letter)
>  

Yeap -- Will do.

>> I can't see anything in his tree yet.
>>
>>>> ---
>>>>  hw/i386/pc.c | 28 +++++++++++++++++++---------
>>>>  1 file changed, 19 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>>> index 0abbf81841a9..8655cc3b8894 100644
>>>> --- a/hw/i386/pc.c
>>>> +++ b/hw/i386/pc.c
>>>> @@ -825,6 +825,24 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
>>>>      return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
>>>>  }
>>>>  
>>>> +static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
>>>> +{
>>>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>>> +    MachineState *machine = MACHINE(pcms);
>>>> +    hwaddr cxl_base;
>>>> +
>>>> +    if (pcmc->has_reserved_memory && machine->device_memory->base) {
>>>> +        cxl_base = machine->device_memory->base;
>>>> +        if (!pcmc->broken_reserved_end) {
>>>> +            cxl_base += memory_region_size(&machine->device_memory->mr);
>>>> +        }
>>>> +    } else {
>>>> +        cxl_base = pc_above_4g_end(pcms);
>>>> +    }
>>>> +
>>>> +    return cxl_base;
>>>> +}
>>>> +
>>>>  static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>>>>  {
>>>>      uint64_t start = 0;
>>>> @@ -946,15 +964,7 @@ void pc_memory_init(PCMachineState *pcms,
>>>>          MemoryRegion *mr = &pcms->cxl_devices_state.host_mr;
>>>>          hwaddr cxl_size = MiB;
>>>>  
>>>> -        if (pcmc->has_reserved_memory && machine->device_memory->base) {
>>>> -            cxl_base = machine->device_memory->base;
>>>> -            if (!pcmc->broken_reserved_end) {
>>>> -                cxl_base += memory_region_size(&machine->device_memory->mr);
>>>> -            }
>>>> -        } else {
>>>> -            cxl_base = pc_above_4g_end(pcms);
>>>> -        }
>>>> -
>>>> +        cxl_base = pc_get_cxl_range_start(pcms);
>>>>          e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
>>>>          memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
>>>>          memory_region_add_subregion(system_memory, cxl_base, mr);  
>>>   
>>
> 

