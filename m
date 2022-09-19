Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7261A5BC340
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 08:59:00 +0200 (CEST)
Received: from localhost ([::1]:38420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaAk7-0004f0-Ci
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 02:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1oaAb9-0000bo-8G; Mon, 19 Sep 2022 02:49:43 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:29020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1oaAb5-00036e-Gj; Mon, 19 Sep 2022 02:49:43 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28J6kbre020578;
 Mon, 19 Sep 2022 06:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=KsVRpejUpfgLwRH8bFU+9eKuc0F68aIKlSTXUOP4inM=;
 b=qEkMVytEsnuTtLlm0vfh/JAj90uZllHJGo07Kxi552/2gjvHX9cqDK5b84uoQ94Jb97B
 wfcFxvF/9jZKTGH5izkTFyHE/3iAdfmriKYG7DdHwJjq4G0GOAuXpQuomG9yi7ynGc0b
 Ayet/ZrQmFWCs6ambMsOLRU5NMynfAy9Va/frrguVkVGnlLUpH6XOc7Cs57PI3b7m6ps
 UB+VavAuGjJfYvsgScSng80PcleyeS2HqR1y+dfg+h1iOnu27xJtHu+Ipaet6J9U7bL/
 I0w2ObQ5mPoY2GHrK+OanwNZwxvLIExSOCI6KxxakSpPxPg7M0OvyrMrfYnFDmRyqiHb rA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn68raugj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Sep 2022 06:49:31 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28J4YwLt010086; Mon, 19 Sep 2022 06:49:30 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2041.outbound.protection.outlook.com [104.47.57.41])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3jp39nqffq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Sep 2022 06:49:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuOXJl+H9BoLR1evxVOevkjJyAeuaXbnXyJmGqO0aCkrXD1rXd0DIR8ewbMLI4eQycgN5oKhhVbBwAAJzakSEYOQ2DPC1knv6Ub/nLojweRGkVdwjIY3Vq6IbWE0Q9lOCmI6GaA/PToGvJ57E8uza9F5pOH8g17y/pI5HesiheUYesRZAsMhhFwmRcQUACZe8XPi6UoeLPkrVmlVmcO0HcUzbE+p+HsGfIIkSa1m+Ho1GG97jrJLdekyPb5M3eb6bv/ErxM2MAbzsfM0ZcI3QM8rk64jSYfpO2VhHASwDPPFE8dGeRY8VNunZbRtf3n4h05XNuY1ZqFr563xF8z4IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsVRpejUpfgLwRH8bFU+9eKuc0F68aIKlSTXUOP4inM=;
 b=CD25xGiQv3gH64SxjaIUJ8YcllHC8eB7kZkodAPiO0xy7UEF93cQix2qiK/UGL5jKQrnUEZSF42zlLvwgHQ3TgqfcKbGzQeSwYoOyrCsaW/cSJLWpBNFSlyx39KTfIeKgRd5kvTURHXxFR4MfoTYnPuClFcZ/IsDDT1ah27aHh9sm1SDmwCtEwQOwqsGbfH6uNlx0mCyTYeIqrxA5DMMlJARSMIGSJai2jkoBL91D7UujdbMVLl8Zkjzdygawm3m08thC4P4SrBDgWz74RtfLI+ZOGmYHbiDWViYjTAMctrimIEBBNw0WiJ0lSsyG672IOyWC/v5FK//zpVBhJeqIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsVRpejUpfgLwRH8bFU+9eKuc0F68aIKlSTXUOP4inM=;
 b=QkaFwhf/Q+oL/u6YpHwiLfRaJl+FadXuYWd5cXW8mW9JQysjeC4f7aTV602s2ShXtcAZdMIoN8/xD+FmyrggXbkU6hdweTZJXIZwlv3cU5QR+r20u/h/4yrZPQRV+rhRXvTE/EF/tiHZxb1ECDC8zD0zmPjqmGpz2wxUoSwrKH0=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by DS0PR10MB6221.namprd10.prod.outlook.com (2603:10b6:8:c1::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.15; Mon, 19 Sep 2022 06:49:28 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::36d2:a229:987:a748]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::36d2:a229:987:a748%5]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 06:49:28 +0000
Subject: Re: [PATCH v3 1/1] monitor/hmp: print trace as option in help for log
 command
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, dgilbert@redhat.com,
 joe.jin@oracle.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220831213943.8155-1-dongli.zhang@oracle.com>
 <87h71qrmkh.fsf@pond.sub.org>
 <d4ed9983-586e-ea44-90ad-0fc0f259acfc@amsat.org>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <4c0425d5-65fa-72e8-5950-abcee7a3a8ce@oracle.com>
Date: Sun, 18 Sep 2022 23:49:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <d4ed9983-586e-ea44-90ad-0fc0f259acfc@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN1PR12CA0049.namprd12.prod.outlook.com
 (2603:10b6:802:20::20) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB2663:EE_|DS0PR10MB6221:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e8eaa9-76f5-43f1-d2b8-08da9a0b18d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vhK6PLENa2BMvFpoYQqacVTJHccxerhD1oLMvTZWNBYh4sxpeAykbEtt65c15xqqkuKa13EcHFks7FbQuNCKshNJuLvUzuBC7/VOrfxjODckvfWY8Br4w5Hd7xSlvl5YohcgaJ+gBF/bIDU5+rhrLdiPGWpyBrszpDcLug2bW7hyGWNuV1yhU/HJheNgIfNoqTEL1OneN39+6mDh2IysCXrNxuDxHTwTJuy+5heIR/NQKJkU0swcNsC2zcZYGKGBmdyXuYrHTZn6NfMpHrqkGN2R5alWyZYMY1oWiwb2FGt+8N4ese1uTxyAfUxxOTOHGSMh4mgSP+wlyaYV+QdQ+jzw1HAYTIn/3zrFAgSmkdRYDL7kA4gGzpIv/57luMq6E9GJ9+njkDRPM8A6/CjU8dRGi1mLWisRrwGP+VyIOOMY3H7E/vNvtj8RFNMVTe3ibstitFeSPAaLrqZXkRu5GPEJ0Vhcs2fGa/9nWCWB2WBm2ez12nb6bIbSzj7lR1iuW6KHR5MNWmNHWK2uFjEcUfwYm0T0y80dkCQ34r1cGJoIM4l55GIBUn+G4c324DAlaoeZt13MP637Y7zD9t1XWTIR7y/xcmdcr/IIBkXf17FHgPzJ8JCIn1uzVkqZjIu0HQFm57oOfq/czvFmESbqe+aQtnSKkPCP7Jkx7HVnj+DPQnaq4V7+Eu8WL+y/O8G3fOHLNSlTjACPG0CYMDFYuqvs0SIGTlR0/1GoNJOxJtmjOxWl29Q4O8rX5j3EbZyhK5bMV+/792h8ASPoiQPrta9Nc+6lGy6hAsKbkvCZWDU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199015)(6666004)(186003)(83380400001)(86362001)(316002)(6916009)(36756003)(6486002)(8676002)(66556008)(41300700001)(66946007)(38100700002)(4326008)(5660300002)(66476007)(478600001)(8936002)(31686004)(6506007)(31696002)(44832011)(2616005)(2906002)(53546011)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTk4VVYra2puTWF4aloyTkV1ZmVPbWdpbXFTd2JYYXFqeDliNWlaU25HSEFU?=
 =?utf-8?B?UGN3TVduUjBvQmliazRrVUJEeWE1VEZrcDc5K2ZIbDJDTDRnZlpDd2hOU0pi?=
 =?utf-8?B?VEVFbDRqQmc2V0ZWMTFpMlIvd0xMcjlQemVrWkhoTjdDeTRYV2kvdUhkNTU1?=
 =?utf-8?B?UUZ0UkhDWlVKR013aVZCMk1aK1RJQXF4WGN6MHdqL21lTEhPTUNYLzh6S0ha?=
 =?utf-8?B?eFZXTkZxUndBVi95V3JtSUZveEFLd0FlR3U5SVpsWnFMSnFuNzRMNmxXTDBp?=
 =?utf-8?B?Q2dWWksyVDRUZ3JKTVVpT3REMnBMeVc0dm1vMEpleG5LNVVZVHFYbWZDUTRB?=
 =?utf-8?B?TExOOTY3VkwyUnFSbXhPdmNzaFJqcG1xeUJrU2VqQ2VuV1N3eUx1SUJqdURN?=
 =?utf-8?B?R0p6NUx2bUhjakhjRUNGTW9IS0RaakRWcXVBVmxkZ1FxYURuUVpEOGVMSVRK?=
 =?utf-8?B?Sjd3Y1J5NGhQS3B4QUpIUHVXbFZnK0VxUnIrVGNsWUtBL1NaV3NMTTQraDhB?=
 =?utf-8?B?RHpaeURCYzJidytvb3o3bFBnVWFndjVaM0xhbGRGZ2ZUaG5ia2xJVW8xQjBK?=
 =?utf-8?B?TlltdE1QdDlyQ1dGYUhySXcxZGZ6UzgwN0h2aTF5UXl5Y0ZqbFNZTy9Sa2NJ?=
 =?utf-8?B?UmgxZ3EyYTVFa21JaHBpRmtXUk9uS2V6MzRudXN3SU1ZalN0aDF1SkhGL0Q1?=
 =?utf-8?B?bVJueWttaE42SkFZMjJ1ZDQzc0QvVk16OTg2dzc2NGxkd0g5M0o3L3h1TXNh?=
 =?utf-8?B?WXRoNDJxbkNxeTRSQ1pENUJjeGduSGJpblNrajVzdVVhNjl1K1h5dEZlSTVT?=
 =?utf-8?B?U0QvcFFoOXhUb01kNHY4SEE1ZlpYeGtsOWQ2YnpyMHhqdVEvM3FGeVNqalYx?=
 =?utf-8?B?WitKeWszZ3FzNDJWUmk4RUYyZ1dLajhrdk0xNG90WEY5VnlmV013VHhkd2hH?=
 =?utf-8?B?d1IvZXpwT1Vnd1R3UVdiZUQ0UjAvV2xRVmEvQm8zK0JpQkFoZWh6ZVhhVFZU?=
 =?utf-8?B?N3JTWXRmOU9hYVU3WU9Pa2dERVFJWnhBbDBwN2tDZ0RCaUFVN01XMzZaYXMw?=
 =?utf-8?B?OWp6QnF0MkNrWlJ4bWhmL2Z4a2hrOEVYMlU2Y1Z3OU4vYXhKKzBVNkdiSmFH?=
 =?utf-8?B?c05zREFxakhTYVhyTjFHMGpqbkJxNEM3eFJzNG1DWFFEUWx6QlhmQmQzbm45?=
 =?utf-8?B?cFhHUEd3NWpjVjMvQ3duZXpDOU1KdTE1aWU3T0dVSnJ3Vi8zUmZaeEwycWh6?=
 =?utf-8?B?NXhTc1U0NzMwbkZFQlRuSW4vUWJmVFVpTVhUY2h1a0dUOGNxaWFDRGFBdkcr?=
 =?utf-8?B?VCtlbzN0bDN5a1RHMDBPazN5Z2JweVVKUGtrY0FGN3AwNzlCaEp1ZlYxT2Ew?=
 =?utf-8?B?TFV0R1RyamR4U1IyZUxLdmRudHB0S3RlQzlzMHQ3dy9WbWFKQVN4dGZQZFIv?=
 =?utf-8?B?T1dCamY1L1NRVndLbEtYbkxaTDFud0RzTUh3cmJUbklLYXo1VVkvM1FGT3VY?=
 =?utf-8?B?S3d2K2d2cXQ0bWlHQUVzVVA2NEJVRVpFdzllak1qaVZMY0JlK1JrMG5iQ3l1?=
 =?utf-8?B?ZzlpNTVVQkkrOURkN0oranYzRk9UQUJQSm01dnlXSnptODVmeWI3NmJiMnRq?=
 =?utf-8?B?TzhCL1VjRWxsRUpHNWh4UHVEMlI1R0lOU3hQU2k0Q0hNYXhBNnI2MGJ1THdI?=
 =?utf-8?B?RlBIRFJmNVVJS0pNNHFMaEtWQWx1a3d5dk0rMm1tanliNVFpajlPTVhLcGVo?=
 =?utf-8?B?Z0ZsNVhKNUZiTy8zanlXVmtITmRlNHRDTjExV3FGbndqZFNJR2lXYnZjTmlC?=
 =?utf-8?B?U2lBZjE3dzNBL1BuSWV4T0NsdzZ5R3ViSlRIZTZnYVdMYjMrdEplWVA2MHNp?=
 =?utf-8?B?aGcrN2ErYk43ZTVFUTRMK1VYN1kxVkxGYzJYR0hKUnBYYWpkUm90SmpkN0V6?=
 =?utf-8?B?YVBsMU11REFjcUl1NGRJMHY4YXlpZ3lRRWhXZVB2ekd6M1BSVVZlMGtEZUsv?=
 =?utf-8?B?VWFZalQrMjNrcWd1QzdicTFXbzhpcGRvb05QYlAxSW9TeTRyYUJ5UHhDMzhz?=
 =?utf-8?B?Q1ZwcUdTUjNwRTJKZzYrYTYrRVVNZ0NEelpUVUtnWFFGRUhOSnh6NXY3QWZI?=
 =?utf-8?B?ZjBvZm9Ia25IR1ZGU3JJVFlCNE5KZUllYUZJYXJNajNSNGowNkZuaDVicG1M?=
 =?utf-8?Q?RTEbVgdQgO+NzksvFnG7X1g=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e8eaa9-76f5-43f1-d2b8-08da9a0b18d0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 06:49:28.2377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ir/HYrbMYOWgCp5Baxi33qxEsNLe0yYbe7QUSvBFha9SYZI3CfXZ48hd3m1OBYF0Yx0L8kd6JWhAhFdrQHVsqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6221
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_03,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209190045
X-Proofpoint-GUID: dd9Duvw808Cy0JdGx62QrYU5NS2s_Qcd
X-Proofpoint-ORIG-GUID: dd9Duvw808Cy0JdGx62QrYU5NS2s_Qcd
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.657,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Markus,

On 9/17/22 2:44 PM, Philippe Mathieu-Daudé via wrote:
> Hi Markus,
> 
> On 2/9/22 14:24, Markus Armbruster wrote:
>> Dongli Zhang <dongli.zhang@oracle.com> writes:
>>
>>> The below is printed when printing help information in qemu-system-x86_64
>>> command line, and when CONFIG_TRACE_LOG is enabled:
>>>
>>> ----------------------------
>>> $ qemu-system-x86_64 -d help
>>> ... ...
>>> trace:PATTERN   enable trace events
>>>
>>> Use "-d trace:help" to get a list of trace events.
>>> ----------------------------
>>>
>>> However, the options of "trace:PATTERN" are only printed by
>>> "qemu-system-x86_64 -d help", but missing in hmp "help log" command.
>>>
>>> Fixes: c84ea00dc2 ("log: add "-d trace:PATTERN"")
>>> Cc: Joe Jin <joe.jin@oracle.com>
>>> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
>>> ---
>>> Changed since v1:
>>> - change format for "none" as well.
>>> Changed since v2:
>>> - use "log trace:help" in help message.
>>> - add more clarification in commit message.
>>> - add 'Fixes' tag.
>>> ---
>>>   monitor/hmp.c | 9 +++++++--
>>>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
>> Not this patch's fault:
>>
>> 1. "-d help" terminates with exit status 1, "-d trace:help" with 0.  The
>>     former is wrong.

May I assume it is expected to have exit status 1 when "-d help"?

According to the output of "-d", there is even not a "help" option, but only a
"-d trace:help" option. That is, "-d help" is not officially supported.

The below example use "-d hellworld" but not "help".

# qemu-system-x86_64 -d helloworld
Log items (comma separated):
out_asm         show generated host assembly code for each compiled TB
in_asm          show target assembly code for each compiled TB
op              show micro ops for each compiled TB
op_opt          show micro ops after optimization
op_ind          show micro ops before indirect lowering
int             show interrupts/exceptions in short format
exec            show trace before each executed TB (lots of logs)
cpu             show CPU registers before entering a TB (lots of logs)
fpu             include FPU registers in the 'cpu' logging
mmu             log MMU-related activities
pcall           x86 only: show protected mode far calls/returns/exceptions
cpu_reset       show CPU state before CPU resets
unimp           log unimplemented functionality
guest_errors    log when the guest OS does something invalid (eg accessing a
non-existent register)
page            dump pages at beginning of user mode emulation
nochain         do not chain compiled TBs so that "exec" and "cpu" show
complete traces
plugin          output from TCG plugins

strace          log every user-mode syscall, its input, and its result
tid             open a separate log file per thread; filename must contain '%d'
trace:PATTERN   enable trace events

Use "-d trace:help" to get a list of trace events.


According to the source code, the qemu_str_to_log_mask() expects either log
items or "trace". For any other inputs (e.g., "help" or "helloworld"),
qemu_str_to_log_mask() returns 0 (no bit set in the mask). That indicates the
input (e.g., "help") is not an expected input.

Therefore, can I assume this is not a bug? I do not think something like below
is very helpful.

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 263f029a8e..54c8e624bf 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2389,6 +2389,8 @@ static void qemu_process_early_options(void)
             mask = qemu_str_to_log_mask(log_mask);
             if (!mask) {
                 qemu_print_log_usage(stdout);
+                if (g_str_equal(log_mask, "help"))
+                    exit(0)
                 exit(1);
             }
         }

Thank you very much!

Dongli Zhang


>>
>> 2. HMP "log trace:help" prints to stdout instead of the current monitor.
>>
>> 3. Output of HMP "log trace:help" sometimes is truncated for me.
>>
>> 4. Output of "log trace:help" and "info trace-events" is unwieldy.
>>     Sorted output could be a bit less unwieldy.
>>
>> 5. Could "log trace:help" and "info trace-events" share code?
> 
> Do you mind opening issue(s) on our GitLab so we don't loose your
> analysis buried within the infinite mailing list?
> 

