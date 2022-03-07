Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91E54D01B1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:45:32 +0100 (CET)
Received: from localhost ([::1]:50124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nREc7-0003Mr-IF
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:45:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nREZ8-0001Pk-4d
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:42:26 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:27596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nREZ5-00028F-Ib
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:42:25 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227ELQRn009281; 
 Mon, 7 Mar 2022 14:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=eeLW6SqOHzqHH13leTt5xS+zd6LbZReGUoqQaRMZ51k=;
 b=tru9wPGb5PTn8zR/2G/l7Qa314XfIqEKvB9b4rDa++8sFCo3pww/cOeXpGclpJ4OxiXX
 e5DziBTh7EUwHoMF4FmF/hWWcFMyRgJZa/4ZHErxM6QqobdBnaMlRRcMczOofXa2CKdg
 3KJwLjQYMIicpdoT9bRemtPWO9bWv4vVExZ8jLrM0HOaBsrnkfx7WM9AAJoAyc9hw7Pf
 qpoPAJnbS/SYGYnWdRz+OMHjNb+BrGqHrip3LOe9RrjgAJCh6NQFe3UO6IL6h0gv8Fcp
 yAukUB4WSrP+B+UPWW54pjzxwTzO5Vx+8us68E7ex0h+1xvYRKKHLxorMZ9QrlcIITQ8 Hg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekxf0m2bm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 14:42:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227Ef3m5073426;
 Mon, 7 Mar 2022 14:42:07 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by userp3020.oracle.com with ESMTP id 3em1aj1xw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 14:42:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6/UV9L16RE7LorKDEZX569OfKjfxkPpqWxiS5Xjbiyl0YyByhzE1BxZ1Yis7G4mb8YWjrat+wqgjR5kQHQflitO09fds9NqpGQLnfmrx0Nzv0FUl4EZ2ndwC3x3IdYPWdu07hFMzu9dEInU92gwWi8k6s7pkaNfF3bt8FWPkLuzc3J0Yeq2eA0dEV0gbJ1oWollmvVRADlQuJjqpm0VM9zO4jrvnp0IHEukB0RVMOfX6+KdmArmdxOcCLMi98RM/COwdyxtYHvSeCz9LfIPo6ecN3QYizJEnmSsioYuhTz1BvtC552A6j1776QAC+6atP0tBeL1+CdqLEUzRKYzXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeLW6SqOHzqHH13leTt5xS+zd6LbZReGUoqQaRMZ51k=;
 b=OHQIyerw5vg7E+8mfLRur3d5JC9ewu1Wtz2iizq+lBUKC7nBdT5Xq/M6XC6cF83hsXiPdNSNpd2DAoHc09AB1gxRrfBJIf/Q/aerKWxN18uBR/lIMmt2pC/Q+RP7w+L2i9ZqbITQLE4XgoFLyBJHERNZJlgU7zxz+QgXtKnPCRSAR960/tAtMcYxFBFq5qfXv46SHDeupAWm2018nnCHmgUwrO1F9/58hbim6iMz58ZCIdw4a5AKozmS28jKLnIZuE9y1tnz/74+/newMSDPjJnANkHQdzMvV4aLlfmtugCEM6HzaIWXiokj/jbM0KzBtAj1VeoYQhFsEjVMPuxpTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeLW6SqOHzqHH13leTt5xS+zd6LbZReGUoqQaRMZ51k=;
 b=EJj7cgXELMhGUSwnzvbcQFOJ2tZOFW9feR+sGAbN2Kx1njruszvgmg5SiikUV1H5PtnRKOnwE5qNx/Qb/na+joJD6ZFD3WIqrwAHP4URoQJBWiEo5K2up32u3e6QZwBNRzYQT5M+fNPqTftRVWQln5CKNC+vPu6ynqGs3nT6hMQ=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BN6PR1001MB2100.namprd10.prod.outlook.com (2603:10b6:405:35::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 14:41:50 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 14:41:50 +0000
Message-ID: <c42748ca-3e06-d57e-dcfb-a2a97006d2fc@oracle.com>
Date: Mon, 7 Mar 2022 09:41:44 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH V7 10/29] machine: memfd-alloc option
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-11-git-send-email-steven.sistare@oracle.com>
 <20220303121534-mutt-send-email-mst@kernel.org>
 <20220304114124.6fe97646@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20220304114124.6fe97646@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM5PR07CA0037.namprd07.prod.outlook.com
 (2603:10b6:3:16::23) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 194c4f53-1bde-4fe1-0780-08da00489d42
X-MS-TrafficTypeDiagnostic: BN6PR1001MB2100:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1001MB2100857BD9B2ED9EB336BEB5F9089@BN6PR1001MB2100.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UxUndnBuNBLDaOAyL6SqvxhQgAlNzraic6MxfsgnPZZakThoGg3RSFEW2A85Qqzmaioj2xr2B++wpjQW+CLnE489V81og7NqCq6YtosTTRlyB9/w2yJCV/4TXKcrL+deYZ7BJxNZWSm0vnaYXLMQMvF32OZDoVsP6LJjo5J9xuPIskO8CdmD0/h7bMfVBHEaKYeKCgh0Ee4YHJTEOJVEIgcPdnGHtYZ2fuXx5Pm3Kw5bKXc9kvqRnJQW5EBgOYG6gaB/o5mCerVskpU5bL4ki9l7IYfa9XvyU2j/PK5e1zVoMRryLEjcOix+U6PkIb1K4uoaZedJmeuITaxbage0yzjEThA+vVStiZbH4OGoX5CTZj5wvvZE1tO8xonfZApHYLL5E5artkb/rFnfQGgTh6Ep9Clig+PRsTEowoJMEuL1mlAlUIm6B7P1cy8Hqr3auClosrxKwto7du46IZVw2h3MPGIIp6FMqg94ejmrZ9wZzBbGa38RtvB1oioJOAO2Axku0d/6t+btdW73F/+oBhnk4M948OkgtDbNZpRq2KZEWj9hYQzQhpTreusBzpEf7jAt5xapzTrBz34OUE1H6aphkHuSjPWoSUz6AanSnAlDl1wGIvrId1o5sVZi7SGh4qN9mgynNLaBuKWmEIUtySRzyKvDzT+HcFLIF5n0MZGGUFlzaa5sIYO8Nf9GFnIDioqJXJGnFgtyHhYoc75hnaUuhJh9ZqCCRa98HpGdbAw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(44832011)(508600001)(36916002)(6506007)(53546011)(8936002)(66946007)(30864003)(7416002)(86362001)(5660300002)(6666004)(6486002)(2906002)(6512007)(26005)(186003)(8676002)(4326008)(31696002)(66476007)(66556008)(2616005)(110136005)(38100700002)(316002)(31686004)(54906003)(36756003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V042K3NQUHZoV3d2ZEd4ZW5Pc3hSL2dySlJtLzduM0VpVXdXcFc1S3dNYlZG?=
 =?utf-8?B?TEw2ZlRqODNnRk9xQnRNRVkrWTd2ZUx4aU9SejV4OHZPeHdUdUFKRHFrQ1FI?=
 =?utf-8?B?VDlVcVlOU0dSdUpIb0ZZMm9JUW9Hd245d204cHRxd2JtZG9rNjQyQjhmZklR?=
 =?utf-8?B?SkhjbWZhWXZVYjFQOVRSK0pxR09xazgrQitBdFJKdXhBbmdpc2pZS25rb1hF?=
 =?utf-8?B?VWRKeGpERG42VkcvTSsrd1U4MUk0ZUZVRDJPOUVicG1ua1RDb3FQZ1I1Y0VY?=
 =?utf-8?B?Z2NQNmRWQmVUM2MxNnJoaWxtNHVlUG95cDh3NzhxWVd0WmczSzBsZnJtZHdI?=
 =?utf-8?B?TWdLTndXMFUrYjV2TVRrSXUyMzgwVGs4Y0Q0VFZJc0xEVEdQeUlRWWpncE9S?=
 =?utf-8?B?dGFscWxib1Z0OFcwRTFqRTBrK25YQUREUHUzV0pydk5ObVovdzFxdEJZa2Iv?=
 =?utf-8?B?VVQ0UklPNkVIZjcydVBSLzBkcHRwcjB1QTFRQzEzUjNDQlIyOGNkZ1QvWXZt?=
 =?utf-8?B?VElDSzlaMGtRUjRSdkw1NHRqdEdzOENzOE5sdEczUVZibFZuQUFqU0FkK29U?=
 =?utf-8?B?ZGF3NTh4Vk1aK2lkYitBMUhsajR4cXZlOEVSSnM3RmpScklseU9YbVkxMUhZ?=
 =?utf-8?B?eE1SdVJqY2VjYXMzS09MaDNXTmd0NExqV1VXZTIvT1JDMGZ6eGl0NlYzSEtY?=
 =?utf-8?B?N0c4NWtQblJEQmNUN21xaTVEMHc1YlAwR2d3cDZJVklrUGUwekJqTjV3aFdD?=
 =?utf-8?B?L1BjS0UwSk1pTm0zUHlvREhMZk01clJUVFM2cFl6MGNmcExaZzlQVzRaN20y?=
 =?utf-8?B?a3o3UzJQL0ZQV1Nha3A0Rk5qTFlQRkYyT1VFYXBLTnZvM1Z0Z3E2dWhxbFRP?=
 =?utf-8?B?ZlQxV0lROE9rYzBUaDZHcGp0cG1CbHhTYUMzVjFGeVZkWVppZUErUXM4NUxn?=
 =?utf-8?B?Uzc3KzRpYlVEcUR3UkVEWGNTT1RzMFNtT09ENmQrSjhRVHpKSk94cUxWOWJi?=
 =?utf-8?B?NGNnQVdQb3BrOFUzSEI4RnJXTzRXQnl2eElKaDRTN2FGcFdrUElSa3VhaERt?=
 =?utf-8?B?Q1Bmd3YyOGsrQmNSelZOdjBwSUkyeS9DejBQVjFjTU9jSUJZVEY4VjJUZWFH?=
 =?utf-8?B?MVZiYUZBdk9ERzJENGdwblZuL3ROL0JjNmw4dlI0Tm9LTnlGT3d4cjh5ZElS?=
 =?utf-8?B?a2dEN0hCUGFldFdiSC9lRWtkZTVKaTdHWUV0K1NGSTZXaWZsbUp2dXZWVDBT?=
 =?utf-8?B?eW9jTjArNzJ4bTNLVC9aRXBRQWx5TEoya3RHV1kvZ0FkbDZQb2tGWUxiNWRv?=
 =?utf-8?B?VFl3dEdlSkNJV3VwbmF6eXdoL0s3VTFTTHZEUXB0Q21kOVF5aGlOYVdqczR0?=
 =?utf-8?B?UFJhYzMrMWN4aTJpMjBNcDFVNnZwSjdIOWhFTy9tVVBSd09HZGNtTjhVcWgx?=
 =?utf-8?B?a2JuN0lqeUF1aU5ZMWh0U1I3d0pham1pVnU5ZnFSMlFDMlVCdE5ENmdoM09h?=
 =?utf-8?B?NVhVM0l0ZmdqK0FoSDRiSythaVBlZEIvMDlVblZwdHpXbmV0UW5tc2xmYTE5?=
 =?utf-8?B?SVZBL2xOQjhJclhaTXRyZW1lZFEwQUZvTXVtMmJ6YWNnNXVYK1A5Zks1SUV2?=
 =?utf-8?B?aENMN0NRbnBBVlVLejE4U3BYTW4rSVduc0VNL1lXdUFndFZvS0NPSVN4elRQ?=
 =?utf-8?B?TFk4aUk5ckRJblJmVjFmUEVLZEpuYVdvODhVRVNzRVhxRTZEclNJdUxLYytH?=
 =?utf-8?B?dVJpL1k5R0c5LzRqTFgrTTFrY2MrSHRyc1k2NHhJbmQrS2VuMjMyL2hEVkcz?=
 =?utf-8?B?eTlMamNpK29aNy9BZXI4Vkl2L0dzc3FUcTA3alZuRzdQNW5RUUduQTJpUnVX?=
 =?utf-8?B?SlNJcVgxSzJCaEQwck5zN2UwZW9NaWxGTUJTbU1NRElQVmVtZ2VJNFZpVG1s?=
 =?utf-8?B?TXVZT1JYcDE2UFNNSjhKWWcxOEd1TXBtUjlERGpXRVVQSW9BUjFmdnhsSGdY?=
 =?utf-8?B?cGc3ajFURlg4djQ2NXRuSDJiOUZCa05iZ3dISlRrRjUwcWJvY1F3Ym5Wb1NC?=
 =?utf-8?B?RHAyT2JYVUhtdWd4dGtQRjZzUi9RVVROT21SRmlsM1MwUmJDbGxrTWxnMjNo?=
 =?utf-8?B?WG1xWm1qNEZjNjBKanN6eGo4ZXpjbUttTHF0YThsbjIvejBPemJFRlBVbXdi?=
 =?utf-8?B?bmhyVnFtYk9rY2M3YWdndGplVTBNTDRXMmhoY0lYMWJPN3NtQ0R5V01IMTVO?=
 =?utf-8?B?NTgyU1JpUFh6QW9ybEFJdXV3VUl3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 194c4f53-1bde-4fe1-0780-08da00489d42
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:41:50.7966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 20e/yQdAZ5kDu/ISaLNnM63u4NjC0qZcvTzssfTZYYNWR8uZEtzK3xwQJaDaGh2JXQLT4+F7nPbFqE5CLJ/2/so3Wi7fCyafLkVEgt9tyiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1001MB2100
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10278
 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203070085
X-Proofpoint-ORIG-GUID: KngiGarNBRHYaeCBQsjiWA18jS7MbOkt
X-Proofpoint-GUID: KngiGarNBRHYaeCBQsjiWA18jS7MbOkt
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/2022 5:41 AM, Igor Mammedov wrote:
> On Thu, 3 Mar 2022 12:21:15 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
>> On Wed, Dec 22, 2021 at 11:05:15AM -0800, Steve Sistare wrote:
>>> Allocate anonymous memory using memfd_create if the memfd-alloc machine
>>> option is set.
>>>
>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>>> ---
>>>  hw/core/machine.c   | 19 +++++++++++++++++++
>>>  include/hw/boards.h |  1 +
>>>  qemu-options.hx     |  6 ++++++
>>>  softmmu/physmem.c   | 47 ++++++++++++++++++++++++++++++++++++++---------
>>>  softmmu/vl.c        |  1 +
>>>  trace-events        |  1 +
>>>  util/qemu-config.c  |  4 ++++
>>>  7 files changed, 70 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>> index 53a99ab..7739d88 100644
>>> --- a/hw/core/machine.c
>>> +++ b/hw/core/machine.c
>>> @@ -392,6 +392,20 @@ static void machine_set_mem_merge(Object *obj, bool value, Error **errp)
>>>      ms->mem_merge = value;
>>>  }
>>>  
>>> +static bool machine_get_memfd_alloc(Object *obj, Error **errp)
>>> +{
>>> +    MachineState *ms = MACHINE(obj);
>>> +
>>> +    return ms->memfd_alloc;
>>> +}
>>> +
>>> +static void machine_set_memfd_alloc(Object *obj, bool value, Error **errp)
>>> +{
>>> +    MachineState *ms = MACHINE(obj);
>>> +
>>> +    ms->memfd_alloc = value;
>>> +}
>>> +
>>>  static bool machine_get_usb(Object *obj, Error **errp)
>>>  {
>>>      MachineState *ms = MACHINE(obj);
>>> @@ -829,6 +843,11 @@ static void machine_class_init(ObjectClass *oc, void *data)
>>>      object_class_property_set_description(oc, "mem-merge",
>>>          "Enable/disable memory merge support");
>>>  
>>> +    object_class_property_add_bool(oc, "memfd-alloc",
>>> +        machine_get_memfd_alloc, machine_set_memfd_alloc);
>>> +    object_class_property_set_description(oc, "memfd-alloc",
>>> +        "Enable/disable allocating anonymous memory using memfd_create");
>>> +
>>>      object_class_property_add_bool(oc, "usb",
>>>          machine_get_usb, machine_set_usb);
>>>      object_class_property_set_description(oc, "usb",
>>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>>> index 9c1c190..a57d7a0 100644
>>> --- a/include/hw/boards.h
>>> +++ b/include/hw/boards.h
>>> @@ -327,6 +327,7 @@ struct MachineState {
>>>      char *dt_compatible;
>>>      bool dump_guest_core;
>>>      bool mem_merge;
>>> +    bool memfd_alloc;
>>>      bool usb;
>>>      bool usb_disabled;
>>>      char *firmware;
>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>> index 7d47510..33c8173 100644
>>> --- a/qemu-options.hx
>>> +++ b/qemu-options.hx
>>> @@ -30,6 +30,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>>>      "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
>>>      "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
>>>      "                mem-merge=on|off controls memory merge support (default: on)\n"
>>> +    "                memfd-alloc=on|off controls allocating anonymous guest RAM using memfd_create (default: off)\n"  
>>
>> Question: are there any disadvantages associated with using
>> memfd_create? I guess we are using up an fd, but that seems minor.  Any
>> reason not to set to on by default? maybe with a fallback option to
>> disable that?

Old Linux host kernels, circa 4.1, do not support huge pages for shared memory.
Also, the tunable to enable huge pages for share memory is different than for
anon memory, so there could be performance loss if it is not set correctly.
    /sys/kernel/mm/transparent_hugepage/enabled
    vs
    /sys/kernel/mm/transparent_hugepage/shmem_enabled

It might make sense to use memfd_create by default for the secondary segments.

>> I am concerned that it's actually a kind of memory backend, this flag
>> seems to instead be closer to the deprecated mem-prealloc. E.g.
>> it does not work with a mem path, does it?

One can still define a memory backend with mempath to create the main ram segment,
though it must be some form of shared to work with live update.  Indeed, I would 
expect most users to specify an explicit memory backend for it.  The secondary
segments would still use memfd_create.

> (mem path and mem-prealloc are transparently aliased to used memory backend
> if I recall it right.)
> 
> Steve,
> 
> For allocating guest RAM, we switched exclusively to using memory-backends
> including initial guest RAM (-m size option) and we have hostmem-memfd
> that uses memfd_create() and I'd rather avoid adding random knobs to machine
> for tweaking how RAM should be allocated, we have memory backends for this,
> so this patch begs the question: why hostmem-memfd is not sufficient?
> (patch description is rather lacking on rationale behind the patch)

There is currently no way to specify memory backends for the secondary memory
segments (vram, roms, etc), and IMO it would be onerous to specify a backend for
each of them.  On x86_64, these include pc.bios, vga.vram, pc.rom, vga.rom,
/rom@etc/acpi/tables, /rom@etc/table-loader, /rom@etc/acpi/rsdp.

- Steve

>>>      "                aes-key-wrap=on|off controls support for AES key wrapping (default=on)\n"
>>>      "                dea-key-wrap=on|off controls support for DEA key wrapping (default=on)\n"
>>>      "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
>>> @@ -76,6 +77,11 @@ SRST
>>>          supported by the host, de-duplicates identical memory pages
>>>          among VMs instances (enabled by default).
>>>  
>>> +    ``memfd-alloc=on|off``
>>> +        Enables or disables allocation of anonymous guest RAM using
>>> +        memfd_create.  Any associated memory-backend objects are created with
>>> +        share=on.  The memfd-alloc default is off.
>>> +
>>>      ``aes-key-wrap=on|off``
>>>          Enables or disables AES key wrapping support on s390-ccw hosts.
>>>          This feature controls whether AES wrapping keys will be created
>>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>>> index 3524c04..95e2b49 100644
>>> --- a/softmmu/physmem.c
>>> +++ b/softmmu/physmem.c
>>> @@ -41,6 +41,7 @@
>>>  #include "qemu/config-file.h"
>>>  #include "qemu/error-report.h"
>>>  #include "qemu/qemu-print.h"
>>> +#include "qemu/memfd.h"
>>>  #include "exec/memory.h"
>>>  #include "exec/ioport.h"
>>>  #include "sysemu/dma.h"
>>> @@ -1964,35 +1965,63 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
>>>      const bool shared = qemu_ram_is_shared(new_block);
>>>      RAMBlock *block;
>>>      RAMBlock *last_block = NULL;
>>> +    struct MemoryRegion *mr = new_block->mr;
>>>      ram_addr_t old_ram_size, new_ram_size;
>>>      Error *err = NULL;
>>> +    const char *name;
>>> +    void *addr = 0;
>>> +    size_t maxlen;
>>> +    MachineState *ms = MACHINE(qdev_get_machine());
>>>  
>>>      old_ram_size = last_ram_page();
>>>  
>>>      qemu_mutex_lock_ramlist();
>>> -    new_block->offset = find_ram_offset(new_block->max_length);
>>> +    maxlen = new_block->max_length;
>>> +    new_block->offset = find_ram_offset(maxlen);
>>>  
>>>      if (!new_block->host) {
>>>          if (xen_enabled()) {
>>> -            xen_ram_alloc(new_block->offset, new_block->max_length,
>>> -                          new_block->mr, &err);
>>> +            xen_ram_alloc(new_block->offset, maxlen, new_block->mr, &err);
>>>              if (err) {
>>>                  error_propagate(errp, err);
>>>                  qemu_mutex_unlock_ramlist();
>>>                  return;
>>>              }
>>>          } else {
>>> -            new_block->host = qemu_anon_ram_alloc(new_block->max_length,
>>> -                                                  &new_block->mr->align,
>>> -                                                  shared, noreserve);
>>> -            if (!new_block->host) {
>>> +            name = memory_region_name(mr);
>>> +            if (ms->memfd_alloc) {
>>> +                Object *parent = &mr->parent_obj;
>>> +                int mfd = -1;          /* placeholder until next patch */
>>> +                mr->align = QEMU_VMALLOC_ALIGN;
>>> +                if (mfd < 0) {
>>> +                    mfd = qemu_memfd_create(name, maxlen + mr->align,
>>> +                                            0, 0, 0, &err);
>>> +                    if (mfd < 0) {
>>> +                        return;
>>> +                    }
>>> +                }
>>> +                qemu_set_cloexec(mfd);
>>> +                /* The memory backend already set its desired flags. */
>>> +                if (!object_dynamic_cast(parent, TYPE_MEMORY_BACKEND)) {
>>> +                    new_block->flags |= RAM_SHARED;
>>> +                }
>>> +                addr = file_ram_alloc(new_block, maxlen, mfd,
>>> +                                      false, false, 0, errp);
>>> +                trace_anon_memfd_alloc(name, maxlen, addr, mfd);
>>> +            } else {
>>> +                addr = qemu_anon_ram_alloc(maxlen, &mr->align,
>>> +                                           shared, noreserve);
>>> +            }
>>> +
>>> +            if (!addr) {
>>>                  error_setg_errno(errp, errno,
>>>                                   "cannot set up guest memory '%s'",
>>> -                                 memory_region_name(new_block->mr));
>>> +                                 name);
>>>                  qemu_mutex_unlock_ramlist();
>>>                  return;
>>>              }
>>> -            memory_try_enable_merging(new_block->host, new_block->max_length);
>>> +            memory_try_enable_merging(addr, maxlen);
>>> +            new_block->host = addr;
>>>          }
>>>      }
>>>  
>>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>>> index 620a1f1..ab3648a 100644
>>> --- a/softmmu/vl.c
>>> +++ b/softmmu/vl.c
>>> @@ -2440,6 +2440,7 @@ static void create_default_memdev(MachineState *ms, const char *path)
>>>          object_property_set_str(obj, "mem-path", path, &error_fatal);
>>>      }
>>>      object_property_set_int(obj, "size", ms->ram_size, &error_fatal);
>>> +    object_property_set_bool(obj, "share", ms->memfd_alloc, &error_fatal);
>>>      object_property_add_child(object_get_objects_root(), mc->default_ram_id,
>>>                                obj);
>>>      /* Ensure backend's memory region name is equal to mc->default_ram_id */
>>> diff --git a/trace-events b/trace-events
>>> index a637a61..770a9ac 100644
>>> --- a/trace-events
>>> +++ b/trace-events
>>> @@ -45,6 +45,7 @@ ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_
>>>  # accel/tcg/cputlb.c
>>>  memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
>>>  memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
>>> +anon_memfd_alloc(const char *name, size_t size, void *ptr, int fd) "%s size %zu ptr %p fd %d"
>>>  
>>>  # gdbstub.c
>>>  gdbstub_op_start(const char *device) "Starting gdbstub using device %s"
>>> diff --git a/util/qemu-config.c b/util/qemu-config.c
>>> index 436ab63..3606e5c 100644
>>> --- a/util/qemu-config.c
>>> +++ b/util/qemu-config.c
>>> @@ -207,6 +207,10 @@ static QemuOptsList machine_opts = {
>>>              .type = QEMU_OPT_BOOL,
>>>              .help = "enable/disable memory merge support",
>>>          },{
>>> +            .name = "memfd-alloc",
>>> +            .type = QEMU_OPT_BOOL,
>>> +            .help = "enable/disable memfd_create for anonymous memory",
>>> +        },{
>>>              .name = "usb",
>>>              .type = QEMU_OPT_BOOL,
>>>              .help = "Set on/off to enable/disable usb",
>>> -- 
>>> 1.8.3.1  
>>
>>
> 

