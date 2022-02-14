Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598A84B52B9
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 15:06:09 +0100 (CET)
Received: from localhost ([::1]:37270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJbzT-0000my-5R
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 09:06:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nJbCy-0005QH-Tr
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:16:01 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:9198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nJbCv-0002su-Nq
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:16:00 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21EB2NMh028540; 
 Mon, 14 Feb 2022 13:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 mime-version; s=corp-2021-07-09;
 bh=MwXKFiTDgDEUklquWzgzE9YJSvFaAbnypdGC+cp1XMQ=;
 b=K3sikP/B/CKRxzsX+ZwVt8Kyf+pIKsSk8kipksHsj7oD/DM7RbAHSk6V7fbvOOH9FAhu
 3RtK1MKLx87vjfS4NmhtnCE32ncCowwHJFlvF9j605kS863g6GF+tSiQKFPGb+ytGtdd
 zvBslVhXUpEyOKZDhvV7r2BsT5ZSvmVVdQFYGsCmQIyya3XOqZWQhBG6O6+KFv5eXGiL
 mvWfm8t+vYNpUzNlvNUHMZE6YPQOPBN4fZcDx7RQ1e1FsswOO26khchWlo1KhSn6wgY+
 0lOksjNeiVG4s6cn7oZWHPHA6ZgPA+mXldd6Q3OHv+fS3h1HpFq/EALDHRAIgRG4L2C5 Hw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e63g14ds7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 13:15:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21EDAi8w165389;
 Mon, 14 Feb 2022 13:15:47 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by userp3020.oracle.com with ESMTP id 3e66bm0qdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 13:15:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAUB32kISKZhLg1LuDKEQy5enT+dwO1od5WrfgfUl87MGfGplxdmrI72KoH3yR282xuNOwIPOe2NEcTQPVZFhjb+VVNdr6zm/1x+7y7GJs/I7zlMnBs+guoMNau3nLyivEzUCOVWz0zqfUm2iKw/PQcIBWh2U7Mh84Gt8hi8rEGkX3Cpg8PwTtKZyeBihSvH9ZDT9iBBrIjKlhTrE3KHewqyxYIlo1sm5d2iUTxZfifuVe7Ii7xYYAx3ZHTGpB+dRjrRiMHbDsG4bmQy6zc8FMJuf/AnlGrckGrgDSws6n/zPNHZtCcy1ThEo4Q7xZ5z5mhMKtgMLYQ25W7i8lSOMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwXKFiTDgDEUklquWzgzE9YJSvFaAbnypdGC+cp1XMQ=;
 b=Nv12kCfiK3ekp2YVaRgvttgT53o/ndyUIi+j7IJZjPsgaSV0bHQJH8qccT8DnP4JB8Lfe5reOhvC4w0jWC3XSuH+I3TPJvoH3ypOQ22R6wJBDuLHgGi4ABY9qsAnqZgM1TnSJUpqYkmh/6BAkYag10WVMJEshZO/2o/pmyGeArROXr+umbjYNpmo1jHSnSe5r5hSnlZnlNi853MrAqs/pIE+GzLZYTXeP1fE05Xfj8PjyFYqOAYJO9s5pvkB0UfC+4v0yIrp5/5tI4ozaS0rt1VnfJ/tH6TEq0HdR8hCf43iMrRdODpbhNwckMAI7mA/HOJOl29C1uno7r/uYxcx2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MwXKFiTDgDEUklquWzgzE9YJSvFaAbnypdGC+cp1XMQ=;
 b=Mv9lp9VIyocz1/7wlqlLx3cZuFGii3iOSnquhxU7GC7ial/F3BldgQc5jrbF+dteRa8BJycqvOz0Y/l96eZ+SIAWsUNiEGSvZp5yPb9bj4byFMrwYMS4ZHKMR0OvKoCykP6gexI/pyLIpMuMcOZ8vvXuHdkERdpRRt2XzDXweAk=
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by CY4PR10MB1992.namprd10.prod.outlook.com (2603:10b6:903:124::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Mon, 14 Feb
 2022 13:15:45 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::e429:a820:ef6e:98d9]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::e429:a820:ef6e:98d9%6]) with mapi id 15.20.4975.019; Mon, 14 Feb 2022
 13:15:45 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFCv2 3/4] i386/pc: warn if phys-bits is too low
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-4-joao.m.martins@oracle.com>
Date: Mon, 14 Feb 2022 13:15:38 +0000
In-Reply-To: <20220207202422.31582-4-joao.m.martins@oracle.com> (Joao
 Martins's message of "Mon, 7 Feb 2022 20:24:21 +0000")
Message-ID: <cuno839pp1h.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0303.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::27) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03dc8948-40a9-4a23-1baa-08d9efbc1bed
X-MS-TrafficTypeDiagnostic: CY4PR10MB1992:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB1992B354638F01B5B1FAF9CF88339@CY4PR10MB1992.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GVXvs14K2hULbc7yfTgptXgRNZDrx6itmn7bx24LQM8qtLJOBQ+Bxug5zjGONPJ0eo9SGwCjfdmR23dPj8LJS0BQu3bm7pGMGwj68Dqav0n7lrXCYGaxyPueFrFxxg54gkywkQY8XiYIU2SnQ/AUzEhtH3OusqklxH0bgt77kE+aIyaOneDhq9yVzrKOs0X6RS4jPD1aioCgEx8gDGZ2nds3UDubkKxl9YbU6Fvd1f0MtYPD0kHMiex41DxVANefJ80PbgeAi2ZlDTTI+/2cCNCJx4mtD//ilq0jSYw+pxSpCFRvuL7VctbowBOoN5paE762zsNh/TWlkhzgfyV98LaX6mYgQNIN+f4RlOTNnLpbq89RabEJwXdCxCgwIbZZg6/BKmBE+uHf/PHmR9O8hsA5ycj+SQdPCt7LIR3Xv7oPfp4TwD8zJ0jSrvPyFHT908bLxap0oFbyGKzV+BJTGx+3s/6bTFiODQi7mqSdD8HgPqGLguj1XGEugUzK3SuTqH5FY3c2+sWI1y//oyc0ZD1jiHTgdALzkb2gHf/Jidg0hIMXaHHcS5CrTZ3WMLMr2RUMOFFI9XmMtVHieqGQ3fUTbsFX/TQaxgnrW0Hwfo7doTa3UYbdEoUSsv1UWv0/H6mAUDHJy9Sr/I/g4ZYxbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4926.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(2616005)(5660300002)(2906002)(186003)(44832011)(66946007)(8936002)(7416002)(38100700002)(66556008)(52116002)(4326008)(6862004)(8676002)(66476007)(6506007)(508600001)(316002)(54906003)(37006003)(6636002)(6666004)(86362001)(6512007)(6486002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GcbD/RqUud6A6lqw6/Mcf21UtbiRuqlBd3F3W//wIqYP0kOs4/sERLtH6WdQ?=
 =?us-ascii?Q?zpVi2PFGazZVqxKAdtvSmne8JvYFQV2qZgZp4KG8RrKebBg+qZRQ4lAImsqK?=
 =?us-ascii?Q?3KTLve+7CPoWpqqM4oO8O1h9Z/djEDvilPPOUDHyxfuF/gEIt6F0dAsCm3op?=
 =?us-ascii?Q?4d9hJx/wxRToWUtt4oS9zcXk4RuwK86a/NhQT0CwGvLxEuhmfJB3e6qyxLE4?=
 =?us-ascii?Q?r7KbxJQAnz2EywtMz2T5Eh4kjWdGiuiHGE2isPTkM7+CKyxaRI7/RBbgp9qY?=
 =?us-ascii?Q?t4iKbGabwgpxLpXHt7s3V7F2sujVt3J6T6KxxTp18legckPCrqDU8zfqnJwr?=
 =?us-ascii?Q?JmishQujQj6b0ExwKGqEszft8Bp29t+ByHq7mWh1EKT7zulpAvUbs0Z5gvPa?=
 =?us-ascii?Q?rUFxFUm7WtfNU6mTLoxOkzsV1WUXBHkT91dPa39wpK5mPyp1rdzUNDF1ICD9?=
 =?us-ascii?Q?hF7Fcveac6mQ6c3/6ZtB4kh3haJbx7OIw+M4+Oi+dFVW8HqXbRqpOF1hZXrD?=
 =?us-ascii?Q?IaTvMb2BsDIMgpB4cbjlibR1y01Ac42pESRZXZXy1NWNH18f+zGOXJFQQYF6?=
 =?us-ascii?Q?A4IAMYITmTPIcs8+uwRRV/b5Q3GD0oXm/ABmXrb4QQ2LK+icotPagIit07nv?=
 =?us-ascii?Q?ifS5x1ay+GZeSEqmbIcxdIrPg6sCscpm0XOVE4cX2V9fIIWWTb1+zIcPKkf8?=
 =?us-ascii?Q?SAENZwEXg7RmX5fSBZuDLh0tIp43NGBA6Dz1IW0fXQTyMdkGQohS1v1Er2jx?=
 =?us-ascii?Q?xtokb2tbEHUwtKOPDdMyWWEaZMDKCCrXAkJz7xkjqBENSjY8THXn39Q55TF2?=
 =?us-ascii?Q?vvgPSmdpWV1tZ48R6BNFjU9PXjTq3cWX+L6sx4uFLJpiey93S46FX84sSp9C?=
 =?us-ascii?Q?9LApepln2euD6+iJWaQdvp9tgm6Wxr51b/INrcAsbb726rB8r9quw5e0xc7/?=
 =?us-ascii?Q?p8lJ3RC+ahM8E7uOWtVdJPJwpc7Blv73Tiy86WdEHGXujz1xQQpVcb18XUC2?=
 =?us-ascii?Q?27E3GpfzrZR+/M9EQMdSOQT1NO7GeJtcgkXnEvf7liiqj26oVQzlFAHDQom+?=
 =?us-ascii?Q?NLjnp1Xzv8gVAsxtipodjoDMK5i71bjyd3lwsc3NbBhLNLPuKgrFi/TauwOi?=
 =?us-ascii?Q?t+POpDhpt1rYZggJeDPB6vnqaTPXWJxigKyN7qkGB9wPwFsXRVkBgVNbGZt6?=
 =?us-ascii?Q?SomEPbQ17ifrFasNlwT8WyIxXz3kaU/impQdxD5ggzqLibjCDxJmiegTCLNq?=
 =?us-ascii?Q?/bVjhbPcN/+ktN/GZTBw9SvKrxb7U9Wgaov2BLKwjE1vMeWK4zeMcpJoHvkm?=
 =?us-ascii?Q?7WVtFMCOiLESBlfjNZKdCUUUQBJ//h+7PsKuXtQULSwaCumbOqKaXeGbWraq?=
 =?us-ascii?Q?zmV2zvKRLiic4jRgxPKIQIC2vm3DkKA8ZIWXK024xx3RRnuYxSjXFqPDFe39?=
 =?us-ascii?Q?9+Lh9kHI/BWEbGP45j8puutuT2CtL1vm3wmFRz4XTJ5pUG1YgXROFe6zMIYQ?=
 =?us-ascii?Q?G9WVFPQGD/r3dssJqa+6ZGKooCG1Ju6SUdu1QFTysg+7B8BUniQ98z9lMYrV?=
 =?us-ascii?Q?hw/g2ThDHF/NdFvp77d2n5hJYrmNr8OwkLge+oJhkln8BYKXpJPvakleGAPz?=
 =?us-ascii?Q?7MsbMpQHBdutun12CJR6zrAhAmwQaSD4zloR1DB6LI50hECjoaFLVaEnkUE9?=
 =?us-ascii?Q?hm7jUPEhWbZZqzgIHGyPF506H97IvNj6lU3dg8/oYuvCgo9v?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03dc8948-40a9-4a23-1baa-08d9efbc1bed
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 13:15:45.2768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dnJxuyI4jBwtXJIFKCaAadKPYpbUeR8gG5RJI9kAquXYhDpvk4vx8DCcTRppmGe1N+mly+g5Td7CVBFJAZu3USTOnhPz5H67rN3w/uGg/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1992
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10257
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140081
X-Proofpoint-GUID: OjI5YNsFBn0-hvSWNPpSaRGkD2NKWe7n
X-Proofpoint-ORIG-GUID: OjI5YNsFBn0-hvSWNPpSaRGkD2NKWe7n
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0a-00069f02.pphosted.com
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
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Monday, 2022-02-07 at 20:24:21 GMT, Joao Martins wrote:

> Default phys-bits on Qemu is TCG_PHYS_BITS (40) which is enough
> to address 1Tb (0xff ffff ffff). On AMD platforms, if a
> ram-above-4g relocation happens and the CPU wasn't configured
> with a big enough phys-bits, warn the user. There isn't a
> catastrophic failure exactly, the guest will still boot, but
> most likely won't be able to use more than ~4G of RAM.
>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  hw/i386/pc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index b060aedd38f3..f8712eb8427e 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -842,6 +842,7 @@ static void relocate_4g(MachineState *machine, PCMachineState *pcms)
>      X86MachineState *x86ms = X86_MACHINE(pcms);
>      ram_addr_t device_mem_size = 0;
>      uint32_t eax, vendor[3];
> +    hwaddr maxphysaddr;
>
>      host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>      if (!IS_AMD_VENDOR(vendor)) {
> @@ -858,6 +859,12 @@ static void relocate_4g(MachineState *machine, PCMachineState *pcms)
>          return;
>      }
>
> +    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
> +    if (maxphysaddr < AMD_ABOVE_1TB_START)

Braces around the block are required, I believe.

> +        warn_report("Relocated RAM above 4G to start at %lu "

Should use PRIu64?

> +                    "phys-bits too low (%u)",
> +                    AMD_ABOVE_1TB_START, X86_CPU(first_cpu)->phys_bits);
> +
>      x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;

And a real nit - until above_4g_mem_start is modified, the number of
phys_bits is fine, so I would have put the warning after the assignment.

>  }

dme.
-- 
Tonight I'm gonna bury that horse in the ground.

