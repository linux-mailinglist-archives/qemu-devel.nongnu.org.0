Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7044C1FD5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 00:38:21 +0100 (CET)
Received: from localhost ([::1]:46102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN1DB-0007Gx-38
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 18:38:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nN1BU-0006Yy-AJ
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 18:36:36 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:17480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nN1BB-0002j3-N4
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 18:36:35 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21NKYPO3005367; 
 Wed, 23 Feb 2022 23:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=lHBCSC0mwsH6KQsiY6eaok3EvQTCt/K+KupcbDRHMQE=;
 b=FXXnZUIbWXlGABcxCEBOQiLx1xYEvABc6+5aX35xS+vez/T8YXfCFO7hTK3jfI7EoL7p
 JbRv6XYmjdAVkyw769n3hW05J01a0jpbHClS+Tz5jILMmn53LNcQrSBtOcULHaM0dyvt
 gw1+QLIKj85M3HUYLUIrxd2ax3qQ27ntCq9dA/GEIzOPC2Epz0wYOQkNTpYUCiMtUPWQ
 OO8yjChm0IkXrrpqpALS08qkj7xAEKcHsVlOg2hpOr+SMMrjfHamdxiPvS8DOTnL+3t3
 rQaR8HozBZdASCUeBiyKE4Ap19aeaFXh0BPLQiujiT6KNXwuN5f1lFnWwwIhm3nJLWt1 1w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ect3cnpcb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 23:36:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21NNKne7112725;
 Wed, 23 Feb 2022 23:36:07 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by userp3020.oracle.com with ESMTP id 3eat0q50d9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 23:36:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTcfiff5FmAg/gny1foY9aw5NwZGgee3sxhnhoN9cOif0dVET2VCQNfD2wlxXgO8Pw5Ox3f9MGR8ucx2qOKt0/b8w7kIrlNn8dxBhq40pFPD/qRSiu+MNewAawvNRvWSO88LU1BpPK9M2srN3fmQSU3HYySdmzAxbTb6KGtsJKGOqjF9+9TPnyaeQBTPJ8C6R7223+8NtR/Mtb3bvK8ML6ZrPMabe1gntZjCVMeFfSuvEmdj2GtnPgkc+toZFd8XhFfSSAMrXm1jkQ2ATnyCf0JK03wugd7aNqC3lJFZrF81TQOe8ZuFI2LwaRhedP9J6OkJ5TUAhzR72slcDk6MHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHBCSC0mwsH6KQsiY6eaok3EvQTCt/K+KupcbDRHMQE=;
 b=RKC5HIGvSnd6jZGbhgOz2gTDPW4o3ClXuJ1nrTBjQdWQg3urJOzFaaKIszIPoYq/1o1S5tewUCz89kIsFx8LZN8U3AQZAgaBb11L5gb/AgF15xBjG/T2z/K2LNTKVg6wN/O51FIsZOPfj4WPCTd3t7GAZsyh7B0RgXD2/u1s+behrfB/FSbhdopsqpxVYTr8SnxAI50TWI78HLXGLCT2AfBNh5yxXZDUXkO1CvQmncBhNOtIiuHjl7/2gGAQj931enZ0ey4ftqtdbZzwJAutogLR/CAhSRNkqsKBOHBNfVjEBipMN735qDHetnh3XuGMo6BqFp5cG/vhc15M6Nb1og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHBCSC0mwsH6KQsiY6eaok3EvQTCt/K+KupcbDRHMQE=;
 b=ImHcHG6Ls2jEGf/oZ7We72yKKA9xIfcAn81wUWUKJK62mWny2sPHNtLjiOAUMlBBzIC62fhzC+LwTOugFMkb8HSiqcPfUv/6hcT8nL2v2mfRke6X4aBswFQ5FKuzq9kGqlV/UTin9eQOmXx2nZb3KkEjCEd+6vDPyqbDgUtfJt8=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MWHPR1001MB2111.namprd10.prod.outlook.com (2603:10b6:301:34::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Wed, 23 Feb
 2022 23:36:04 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%6]) with mapi id 15.20.5017.024; Wed, 23 Feb 2022
 23:36:03 +0000
Message-ID: <5fee0e05-e4d1-712b-9ad1-f009aba431ea@oracle.com>
Date: Wed, 23 Feb 2022 23:35:56 +0000
Subject: Re: [PATCH v3 4/6] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220223184455.9057-1-joao.m.martins@oracle.com>
 <20220223184455.9057-5-joao.m.martins@oracle.com>
 <20220223161744-mutt-send-email-mst@kernel.org>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220223161744-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::14) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63a96d9c-a121-4387-844f-08d9f72540fe
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2111:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2111682C3011F49B0F3CA049BB3C9@MWHPR1001MB2111.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yERTOemcC860KP4q3qsMP0E4fVhYuAb+RGRiFPzDd/pjGT26HzLFVTPE5SNbavBAJEezY4699qEM628yhc0S+Ldp0jqkkJoX8TZfXyewpgiEdjpDTRdsufjwkqYEZUaEWw/1Kz93OQmhzrR/pMzrpACYNzX4GdNEeVIa538ifKc4SkPBmB7cv491/QHOrHogeUMYbzRqIQU6OiZnkwUjL9uBLzLnAV/mPOkjlgcdTBP1PXuHWehfKpoTQPZb0MCA7xhLy+MWmtFkLlynwcnVnsw2mfAzuubWJi+M/ZENrhYOyBt5r7rezVTWifP3xOrfD2/3bpVvUg/arU2VRsEz7Rpi0Ge4mz9uAzrjfJGaV3psSdCx9WO1ff5dRvnZIp/bg5TZ6Pg4eeNWRfAJGqNXvu8zQ7UVA1vttgjiuOvAGFtO4Mkgjbmzn6MRoGV5XhFziuhMYtD3vImXAiZvROjkxdMIkqZ2XBpgZ1UOgLjnETpVPxBV0PKGjdz0+qhoZt0OVTzqpLdkSzghvfQT9Y5SLql9C7V7ZujB3GZHAdJIV+lrcxNWJ/gx5Ms+j4VG0dwgfiBC4oF7B0a/Bt/Gi3w+og/dlr9t1n9Y5tvMZwY8WTSPtVDM12WUWMr/4Aia+920L8WssHp51zTx3Ef5K2i2FqVebF1kSHysFjQfQ52AMtvSixRL5t9leXXO4KIRDY19ihH/EmXb9IeHYc/4vDFn6BlTWR9Anu2LDAc9ONtP3mS8zgBrpwqQ8WCptdJcSedn0zn2uyBVM0EEOxf7Qwd0+KDJ2GIKNNFewd3gPVf6FLW/sab1yEjIbSX5ZaPQTaTzpM1gvMhcE6FPEjy8ualobkDjhyg8LVJZyIbChHUBPBs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66556008)(36756003)(53546011)(6666004)(316002)(186003)(6916009)(66476007)(2906002)(6506007)(8676002)(4326008)(66946007)(26005)(8936002)(83380400001)(31686004)(54906003)(2616005)(31696002)(5660300002)(6486002)(7416002)(508600001)(38100700002)(6512007)(966005)(86362001)(43620500001)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEY3UURrQ0RZY0loRDhESTQyeFdTcXZTeWI5OTZrMisxT2FjTytqWkJ2aDJZ?=
 =?utf-8?B?eng2ajNXUjU2aGFSK2tCSWZiNEllRDlPdTlJcTBJRHdLL3ZrOE9TVTlVbzh1?=
 =?utf-8?B?aW0yTFpFcHlNWUhkUVFqZnhVcVRnMVFzdkhFU0NnSjZIeWs4QnNlQjhtS2M0?=
 =?utf-8?B?enB1eTNVSSt1cExibVd1TEVOYmVnSnZUTzhVeVIwc29ZMHJCWkxXRCtsck1w?=
 =?utf-8?B?NGhVeDQ1UnU5WlZwZzFBNFVuNGRwMHpyeTlBUE4yMW01eEtLT1NJS200SFNL?=
 =?utf-8?B?MHZDVWJDQU9rY0xLMzZXYWRGaVo3ZTg5YkdsNjljRU5OTVFrdyt2VVVoRk1Q?=
 =?utf-8?B?SmtsbEtxdGl3cXgraUZtSm1SSXBXSk5MWDh4OGIwRU1LWXlPNkxHOXJsb0R2?=
 =?utf-8?B?eGNhU1htNGUzdkhzdWV0OFhhb0U5QWxMRXVrVlhOWUVhL2RlMWhTTi9JK3ZG?=
 =?utf-8?B?UURvOUZGcnBVQyt6REpiZ21uYTFLSGw1U24vUDZocllBcEtYWGNHVkRsZkNC?=
 =?utf-8?B?c2V5VHh6WUJQUnVZSXVxUW5weFMveHNVa0hjU1h5eHFCOFFLTHcwalM2RHAy?=
 =?utf-8?B?Vmo5SGNaNDBBTFRXR0xiaUJSa3hnenpmYVRHMzlFZnBaL1ZOOXhmeFlKVGx3?=
 =?utf-8?B?ci8raFpJTlJmV1RvZEZiMUFxZzJFaXpQUVRmS1BZRCs4WTN1dXZxclB1anp6?=
 =?utf-8?B?S01JY1NLUlVWSkRmMHhTZ245eEVuRVF0MmFCZDBmZEpVNXR0cEtQV2JQYTAr?=
 =?utf-8?B?aXZJYzYzaXBqVkpjZFNsQ3VSUmZZbzgyb3p4Zm1VWU1VVVUrVWN3ZnRTU0ZF?=
 =?utf-8?B?TzJpNitjRE56TVg3T1VpS1VWY21vUFNXMFEwYm5NVzhjWmwyWWRrTVFGQ2w4?=
 =?utf-8?B?UllveUdrQ2xNK3B2QXhaL2tNT1BOVFhGNlhIUzRnYzlhdWpRK1dzOGdpTS9Q?=
 =?utf-8?B?bk5wZkJXS3pZYnlLYlhnR2JnUWg1QnBJblQxYjlhVHgwRUNnaVpRUGpUUFBl?=
 =?utf-8?B?M1o0VjAyR2c3SHpWRzZRVC9pRzE3VGF3Wm9NTC96Z1AyNW5BQUVld0d1OUl4?=
 =?utf-8?B?ZWJKOXkxaVdPbElTMi9IaGlDTzNqTjZKem95V2sxWmRBRllMU3VXblRVZHVw?=
 =?utf-8?B?UERuYWJWRnFVSzlkS0xJbExEK2M2YXlBbFdYOWM3Um51Wm5sd2xualIyc29q?=
 =?utf-8?B?bE93RVo1YlZyTGlkd3NpMVNJQjlTTlU0cDh0ejhEWjY1MXA0ekJQdmlPazFV?=
 =?utf-8?B?ZFJJd0tzWVBta0FnN2tMeUd3Qlg0RERqaUVOM050Q0E2ZjNtajU1VUwzM3Jv?=
 =?utf-8?B?T1ZvcWJucEh1dEhoMXA0ZytrdjdlbFlJb2s4M052a3RaOHhobStjakZVR1Bl?=
 =?utf-8?B?V1JZakF3WkpWZm5jSVEwWjlhZGQzWmJsL2daVjZwZGc3Ym5nNGkwOFJvdXRv?=
 =?utf-8?B?d3A0ZCthclJDV2M3UWNiZXJRVitkVzZtUTNrY1RuMURvYUIxUGsxZXpma2Fp?=
 =?utf-8?B?eDhlTVFGaDRpQ01GNFVnQzNEWWZDNmdNaEREUFQzUE9ESmpJa0taL242M1NL?=
 =?utf-8?B?eVhncGZsRnI4eWNqVEg0WjEyYzNFQzlTY0RWeU81bHRZZWo2RmMvd0tWcTdX?=
 =?utf-8?B?ZDdzTmw1THdidmpabUt2SjE0UHgvRHNvY3p0MzdWQTFuSnBTdXlUZm1saXBP?=
 =?utf-8?B?NE9nR1pvQ1VnY3NPckRZQmdleGNYSVNJN3lpUUhDclBJdnAreFF1NzlJL3Vh?=
 =?utf-8?B?Q21DaE9IaVFrRHBmMlE4M1ZZcEpyclI4WnA3L2pqOUVDYWhBZnJaL2oySk1L?=
 =?utf-8?B?RHFVSDBlbHFDMEF2ZStybnZWd3JTako5WHhDdEpPUDhBT1ZHOXROMkFqTXdL?=
 =?utf-8?B?dDdTb3crZzh2ck5BekgxNVdMUEJZQzFUUEZDTFplRFdSYkRrcWk0WmszUWlP?=
 =?utf-8?B?Q2w5TklRVDhlallhQm9RMkpnTGV2Z2Nwd05SRFE1TFM0TWo3RGFKY1ppMGZp?=
 =?utf-8?B?U1ZyU3JoY0VvNTIvc0NKTzJvc0xoMGVZWmJQZE82L0YxUEt6U2loZFUvV0s0?=
 =?utf-8?B?WVFmc21OeDREWC9DV3dHUXo4S21rSlN6Yk0vcWtxWWlzc2taaXJ6QVB5d2xt?=
 =?utf-8?B?d2tZSFh0WnhtZ0lZT1Jpcnd1TktBdXVST3g1d3dRZFBKTUNQak9QWWZTcDFu?=
 =?utf-8?B?Vmo2MWZRRjNlcE80YlhJWnpwUjhaSW5lc01Ya3c2aWtNTENocXpnaExQa0h0?=
 =?utf-8?B?ZXc4Z2I4eXJpdHpuWGZSd2NHRG1RPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a96d9c-a121-4387-844f-08d9f72540fe
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 23:36:03.9033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qxh03q+Bn7V7zvLD0X+7ARDmy5xam1pVB2ns2lXTYGUGG36A4Y89kXkvZi7xcIHWbY2kqtODPooEriMKB2ZHo9htX173r8HWgsjqIkB+APE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2111
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10267
 signatures=681306
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202230132
X-Proofpoint-ORIG-GUID: MK0RZq0-l6L55rhvT8lz9aO5Tx6YLqGB
X-Proofpoint-GUID: MK0RZq0-l6L55rhvT8lz9aO5Tx6YLqGB
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/22 21:22, Michael S. Tsirkin wrote:
> On Wed, Feb 23, 2022 at 06:44:53PM +0000, Joao Martins wrote:
>> It is assumed that the whole GPA space is available to be DMA
>> addressable, within a given address space limit, expect for a
>> tiny region before the 4G. Since Linux v5.4, VFIO validates
>> whether the selected GPA is indeed valid i.e. not reserved by
>> IOMMU on behalf of some specific devices or platform-defined
>> restrictions, and thus failing the ioctl(VFIO_DMA_MAP) with
>>  -EINVAL.
>>
>> AMD systems with an IOMMU are examples of such platforms and
>> particularly may only have these ranges as allowed:
>>
>> 	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
>> 	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
>> 	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb[*])
>>
>> We already account for the 4G hole, albeit if the guest is big
>> enough we will fail to allocate a guest with  >1010G due to the
>> ~12G hole at the 1Tb boundary, reserved for HyperTransport (HT).
> 
> Could you point me to which driver then reserves the
> other regions on Linux for AMD platforms?
> 
It's two regions only. The 4G hole which its use is the same use as AMD[0]/Intel[1],
and part of that hole is the IOMMU MSI reserved range. And the 1T hole, is reserved
for HyperTransport[2]. This is hardware behaviour, so drivers just mark them reserved
and avoid using those at all.

[0]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/iommu/amd/iommu.c#n2203
[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/iommu/intel/iommu.c#n5328
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/iommu/amd/iommu.c#n2210

Now for the 256T on AMD, it isn't reserved anywhere and the only code reference that I can
give you is KVM selftests that had issues before[4] fixed by Paolo. The errata also gives
a glimpse[3].

[3] https://developer.amd.com/wp-content/resources/56323-PUB_0.78.pdf
[4]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c8cc43c1eae2910ac96daa4216e0fb3391ad0504

>> +/*
>> + * AMD systems with an IOMMU have an additional hole close to the
>> + * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
>> + * on kernel version, VFIO may or may not let you DMA map those ranges.
>> + * Starting Linux v5.4 we validate it, and can't create guests on AMD machines
>> + * with certain memory sizes. It's also wrong to use those IOVA ranges
>> + * in detriment of leading to IOMMU INVALID_DEVICE_REQUEST or worse.
>> + * The ranges reserved for Hyper-Transport are:
>> + *
>> + * FD_0000_0000h - FF_FFFF_FFFFh
>> + *
>> + * The ranges represent the following:
>> + *
>> + * Base Address   Top Address  Use
>> + *
>> + * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
>> + * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
>> + * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
>> + * FD_F910_0000h FD_F91F_FFFFh System Management
>> + * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
>> + * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
>> + * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
>> + * FD_FE00_0000h FD_FFFF_FFFFh Configuration
>> + * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
>> + * FE_2000_0000h FF_FFFF_FFFFh Reserved
>> + *
>> + * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
>> + * Table 3: Special Address Controls (GPA) for more information.
>> + */
>> +#define AMD_HT_START         0xfd00000000UL
>> +#define AMD_HT_END           0xffffffffffUL
>> +#define AMD_ABOVE_1TB_START  (AMD_HT_END + 1)
>> +#define AMD_HT_SIZE          (AMD_ABOVE_1TB_START - AMD_HT_START)
>> +
>> +static hwaddr x86_max_phys_addr(PCMachineState *pcms,
>> +                                uint64_t pci_hole64_size)
>> +{
>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>> +    MachineState *machine = MACHINE(pcms);
>> +    ram_addr_t device_mem_size = 0;
>> +    hwaddr base;
>> +
>> +    if (pcmc->has_reserved_memory &&
>> +       (machine->ram_size < machine->maxram_size)) {
>> +        device_mem_size = machine->maxram_size - machine->ram_size;
>> +    }
>> +
>> +    base = ROUND_UP(x86ms->above_4g_mem_start + x86ms->above_4g_mem_size +
>> +                    pcms->sgx_epc.size, 1 * GiB);
>> +
>> +    return base + device_mem_size + pci_hole64_size;
>> +}
>> +
>> +static void x86_update_above_4g_mem_start(PCMachineState *pcms,
>> +                                          uint64_t pci_hole64_size)
>> +{
>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>> +    uint32_t eax, vendor[3];
>> +
>> +    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>> +    if (!IS_AMD_VENDOR(vendor)) {
>> +        return;
>> +    }
> 
> Wait a sec, should this actually be tying things to the host CPU ID?
> It's really about what we present to the guest though,
> isn't it?
> 

It was the easier catch all to use cpuid without going into
Linux UAPI specifics. But it doesn't have to tie in there, it is only
for systems with an IOMMU present.

> Also, can't we tie this to whether the AMD IOMMU is present?
> 
I think so, I can add that. Something like a amd_iommu_exists() helper
in util/vfio-helpers.c which checks if there's any sysfs child entries
that start with ivhd in /sys/class/iommu/. Given that this HT region is
hardcoded in iommu reserved regions since >=4.11 (to latest) I don't think it's
even worth checking the range exists in:

	/sys/kernel/iommu_groups/0/reserved_regions

(Also that sysfs ABI is >= 4.11 only)

