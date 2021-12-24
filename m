Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6946347EE64
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 11:58:46 +0100 (CET)
Received: from localhost ([::1]:54482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0iHd-0002Lk-01
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 05:58:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1n0iFa-0000oS-8k
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 05:56:39 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:25838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1n0iFS-0001RE-Mm
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 05:56:35 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BO9s6dd022633; 
 Fri, 24 Dec 2021 10:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 mime-version; s=corp-2021-07-09;
 bh=eJSV2yZOpLzzAs4gOlSlaaKpk5a6InBv5ZnsNFCvbXY=;
 b=ly5cUywBK4gpSheCNU7El/ae4tGDQuySP7wg+bo8s46zjx/Zxg02i12Uqcnip3haJWVL
 WLi6ZlOfJJG8sYRfjhe3VMU/p0ibHJy8HYdPUfdxbgBUmv7sY+eYFd8Xtxj1WlNiVbDh
 Z6zdtSyM4B413J0gpHP/wfQgR/uZpQyWIR4ZQKSl9ikCFWfni+PWT+ob0xoydydYs2GB
 5d4jQxAUIS+Gr8oZNmn1YJ1a+PO0yzcQCAjKS+1A9NaI9nm9CCasn5UlNPkarZYDqBC4
 MC4bNhFie8MuH3zSTRayGGYbYkyGM/0pJLhQeFkA+BknkhsOjg62Tn5KVApxoo9SiGRX 2Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d47a0mctu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Dec 2021 10:56:27 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BOAl7vK056846;
 Fri, 24 Dec 2021 10:56:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by userp3030.oracle.com with ESMTP id 3d14s1f57h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Dec 2021 10:56:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGCpg5QFaVvsvfk7Sr/XH6xGttqwMPDwkZJ/K8UZrDrAmkq8w/gv8IUK+nOMB1ejs2E6/mAo/8sxQZyB16Lqv/ZzOH6IxGDkm/yaoC4M79OktaTNgT2OhDlRrhDYkL03/G7Vn5eCKy48P6C3EreoM02LfD/wDbqik4XXepMRz2UzPcFEZMs+va8p8zL+dv6leRAIND1l1LkbRw7KHPOEeURS3u41Uz5RIMIOjgtGt9wNaUeJZW02qZZOIfKGVUgzYUsS6ib8B5TKlo4qfnpXuV0cqt/xPi5wpxRSI+pveGE8sH5cAVjuurEvFreco3DsGz6SRfahusc5zpFoYcNIwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJSV2yZOpLzzAs4gOlSlaaKpk5a6InBv5ZnsNFCvbXY=;
 b=Jw5ZldI2JM1mlHtD+bO4+rCzm9Vj/U3RGJi8FyXJhClLMjctpDyWjO+rtONG6oMpj+XTnhePOc+l4mK+cTwcMVXw6772PyNEr2V/3HKtL3BWIhu0/DX2xvzS6BDrdVpXIkDrXh5hXhe4Pi1fCbxiDBWC7qGkdt2HR7GCpjM56fkxMFKz3Onm7qTnA/O6ZTRkky/pHKXOL6xn409fXC7hTzDtEZmMN4eZlcPflBhin5WonY7Vc0MiTGaX96HzA2Rtp6wCJ0+BitrDIRxfOEzY1IHneNhGR3GfGhku7Zxmvripw1n+5dvZBrZvbT44i6/GY+7zJ5MvnsUT1Cqp18AgSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJSV2yZOpLzzAs4gOlSlaaKpk5a6InBv5ZnsNFCvbXY=;
 b=oacjzd9cSJJcTEjdvm35+7PESIwy6qPkGQ29aYe+GvoX2aVX1Csys1U54i/PV+ITaf3TGOhnDeETLj0ynlww1XEZf2wH8JAcs4gIq6DWn6Zr+0NWMn4SRTaZQz/3LqUlBfc+qVA8ABk22CeGUbiZjeOTyNivhdlffKVeaAJDMJA=
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM6PR10MB4346.namprd10.prod.outlook.com (2603:10b6:5:223::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Fri, 24 Dec
 2021 10:56:24 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::c517:d737:a012:1a0e]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::c517:d737:a012:1a0e%6]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 10:56:24 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3 6/8] migration: Dump sub-cmd name in
 loadvm_process_command tp
References: <20211224065000.97572-1-peterx@redhat.com>
 <20211224065000.97572-7-peterx@redhat.com>
Date: Fri, 24 Dec 2021 10:56:18 +0000
In-Reply-To: <20211224065000.97572-7-peterx@redhat.com> (Peter Xu's message of
 "Fri, 24 Dec 2021 14:49:58 +0800")
Message-ID: <cunh7ayl19p.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0304.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::28) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c84b5c62-47d5-40b7-2c72-08d9c6cc06a7
X-MS-TrafficTypeDiagnostic: DM6PR10MB4346:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB434665F2C351D6B207E0EEA7887F9@DM6PR10MB4346.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:268;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PoOZlytmcWrjo8u2oe3vQXjR+xEoHOOORWm1wMvob+jJsMlDQ0nPf/iJVznJQeoQgtj6+B6tBpw7l5IQbo4TiladFkqbaJ8D5ktlN47/UcIBoPY0i5V/CABcKN42wBe0zrdbdudYgaEdPONJsLWBKRI1JHyuzLTXIzu2lhtWknY0/Szc+zWw+GfFGXmjGYpB1BH0XGClP9B4U2ihdvOsUUvbl7MOaYmdFF2jud1JS5zh8k6Hfeg8fK7hI8uFW6r8QakfrArFc3HhYRkGhlsx37xJJq3Rbi/G+zDL5XjHX8/N3GC+7ZXhzCmjAI4ARsWh8ePqPvMg4GVBmt6kr3ytx0ML34s3bXFU8zI/aFjbuGyFN5LTfIj/r7NPZ6gzVRcR4ivPE7HfgoBNJPJvdYaEX7tZkpsebJCIs7bICsXyavYYnSBjmrkLlmIKBwuDYA2Zm2IaM0v8epG+MHElD6pI1tmqIVv6I+Z9kKF4rofCRPMW7r9c8hLlp5RweSZMsbqfcqTrhS/LB+cgJnP+Ktde9MXS8XnFvVb2C8RblpZUD93+ePxqa9EtuWvYcd8r72ZdfnJrdWKc+Pb4FANJE2MhOdMR1OB39jNQtFwQmFz6no2Vw1TCA5I+Vun3Jpgi/vyyrW7/i2QCyKEAr38T575dMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(2616005)(6486002)(66556008)(508600001)(44832011)(4326008)(83380400001)(6512007)(66946007)(4001150100001)(8936002)(36756003)(52116002)(186003)(8676002)(5660300002)(2906002)(86362001)(6916009)(54906003)(316002)(38100700002)(66476007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ges4jq9RsToq9uBt4hAWTpo1kneQmBVvdHkiNAXk0DtQ7qpot7/dqaQqImtu?=
 =?us-ascii?Q?Nw2zyU6reZBubPeiLRX2IKjA3LB7LwBZC1XT8hDQHHYOYiVwRD5YcSbD6tbR?=
 =?us-ascii?Q?qO+oNaXY2SOM/SMCuLXF67DLrGNWrkDKC55G0vGJchOpkK2qGaaKNwLt7r/1?=
 =?us-ascii?Q?/ALPd3foWv7gEqF3JBCWvIp4L80WGJWcEPBFvVz0cWyaqCWpOSlJFLJSzxb5?=
 =?us-ascii?Q?PiGrDtrd56CHL5ylgMjPfD6o/9jVlO9lBBQXY22u3DjlMkg3ZDsrIEFedc2S?=
 =?us-ascii?Q?oA0vacicfgH5b8ePObjTmJG0pbYMLWzrp7c+/57Bfe7rIeNzEYXdxA8vSB2V?=
 =?us-ascii?Q?fyx6byHfvvWrt8STJXTkvO17jbU0P9NvqP6j8ua+Ds42cMX4JmWALWbCiP3k?=
 =?us-ascii?Q?eoLCYigvqPutjAXPb2Apc0/jQt7ud4qRzwyXEFfRPDBsYC9IOzgIJmzDXASu?=
 =?us-ascii?Q?pRK1rwL0R9bXZu9OZS9JUQSe4fEdtdBMeXjfOo3wnSNe02K5CXPLm2fH3OZv?=
 =?us-ascii?Q?L4SI7c5DmN/oaUO5eXeoROIbYTG+xZhIVlFaBOHC0J6bwem2yJlqYNrocHan?=
 =?us-ascii?Q?O4PulsrkmhXa72Qlk1nWkA4Bll47SvbzGN9hjGN6++bnbJmNKDvkCKa31tNW?=
 =?us-ascii?Q?Oo6xZs4XrhQMjWBLLffwNa1WMlQIwbz/n0lj+V7n8oodYvXNIsivfk15HzVo?=
 =?us-ascii?Q?NMLYrhoQr/HUqqTnHoWbLHDvRZ2tFHNz3i1OKQkFV7hLh7HydvnaxZw5QxkZ?=
 =?us-ascii?Q?SpqhdfZvO27/WlzXF2JXU3yd2pIcNoE0unbS1XA9QSGh6WoaVqKibgtjDhxF?=
 =?us-ascii?Q?qb6icN83v7tRhLiRSXOny1IsRJfVZa69ddSls7vvQKBbSYCd/+lbu5pjZbt9?=
 =?us-ascii?Q?Sv/FxD4HpSlTcPx4VwLRqUQVjNBDgOruO5N9MvBJQVnz3TNLOXV9Sb8mcJMd?=
 =?us-ascii?Q?t32HBrd08339BvlL9yRriduy+NijcixaetPR0KbGB6xg27k7qrQYXetxeNrv?=
 =?us-ascii?Q?laRhEmgqYfRBVlwiQgDBLWlLw+rI/SjgDhPUipPSss3s54wd9tqTxaGhGRiC?=
 =?us-ascii?Q?95WtdjFFfoJ2T5nme2THToV9TTkAtVZAqr5R6HZPNW+mFxTfdL5NcmpTebp4?=
 =?us-ascii?Q?o0wy+FpzWaYStaLKq4tzgCOU8BD/kSF8bOb+CXlkX105DyXH1tdb6ARkMR7b?=
 =?us-ascii?Q?WQ/kxMqQkRwYTddWL6c2i7xJvpRSdVwWy5dgMXs81aphUVLRTA75/vfPF+05?=
 =?us-ascii?Q?mPi94IldCT7yeYCOvdw6tn7MSwHJWhKAmRX/xWkt/Am0W+fqcEXG2+Hpai0O?=
 =?us-ascii?Q?hTo3WwQWOS8pXYLxNbNTrzCMi39VMa+otRUy/5CYNIBJcf6T1HSAqTanmkHb?=
 =?us-ascii?Q?wUDsIYQveQg/Ykj96FQUqM8pmSb7VuX3y/iGJKqObNbWMm+TaYVb2Cy7pqor?=
 =?us-ascii?Q?3ehgjy5wHYTVr+3T2DU60CPgu/R3VEMDwHCF8pmkStuCI3htxfE/F33ZmO4i?=
 =?us-ascii?Q?3KXUXJyrg+e4TwXcUB2ZRT/Y8g2f5bEJ+kgP+36FpjSKTcu7B6eL9QfwYp7B?=
 =?us-ascii?Q?QsXSda7Ww8P3bTZfZm+VXrB3Y1LvSn6AuGuhX9qD2IEpVOX2lE9DqEPUkU29?=
 =?us-ascii?Q?QwHPGVhQ2Hd6NP9Y8BYCdgcGZS+wBcM+fg0lw2xQtuVM+Vzn0ucA5D73Ntmt?=
 =?us-ascii?Q?obLNGdddztHbYjHm5rMMgBe8MW1SEV9Wa1VgWZ7rN/szG7ej?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c84b5c62-47d5-40b7-2c72-08d9c6cc06a7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 10:56:23.9191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KKko63ZGvqENBo8vEJ5AZjCR7fIw7DlbjO53WivZx2fEuYcTGbXhjCmzAAPAUgjF3fEseNMxuUlXPbFeGe0w4FhbDZDj2TCQf1K7LLrKGcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4346
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10207
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112240052
X-Proofpoint-ORIG-GUID: SJ7njGVvGanFhW3r9Dx4ukbLenQf7p4Q
X-Proofpoint-GUID: SJ7njGVvGanFhW3r9Dx4ukbLenQf7p4Q
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Friday, 2021-12-24 at 14:49:58 +08, Peter Xu wrote:

> It'll be easier to read the name rather than index of sub-cmd when debugging.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  migration/savevm.c     | 3 ++-
>  migration/trace-events | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 0bef031acb..7f7af6f750 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2272,12 +2272,13 @@ static int loadvm_process_command(QEMUFile *f)
>          return qemu_file_get_error(f);
>      }
>
> -    trace_loadvm_process_command(cmd, len);
>      if (cmd >= MIG_CMD_MAX || cmd == MIG_CMD_INVALID) {
>          error_report("MIG_CMD 0x%x unknown (len 0x%x)", cmd, len);
>          return -EINVAL;
>      }
>
> +    trace_loadvm_process_command(mig_cmd_args[cmd].name, len);
> +
>      if (mig_cmd_args[cmd].len != -1 && mig_cmd_args[cmd].len != len) {
>          error_report("%s received with bad length - expecting %zu, got %d",
>                       mig_cmd_args[cmd].name,
> diff --git a/migration/trace-events b/migration/trace-events
> index b48d873b8a..d63a5915f5 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -22,7 +22,7 @@ loadvm_postcopy_handle_resume(void) ""
>  loadvm_postcopy_ram_handle_discard(void) ""
>  loadvm_postcopy_ram_handle_discard_end(void) ""
>  loadvm_postcopy_ram_handle_discard_header(const char *ramid, uint16_t len) "%s: %ud"
> -loadvm_process_command(uint16_t com, uint16_t len) "com=0x%x len=%d"
> +loadvm_process_command(const char *s, uint16_t len) "com=%s len=%d"
>  loadvm_process_command_ping(uint32_t val) "0x%x"
>  postcopy_ram_listen_thread_exit(void) ""
>  postcopy_ram_listen_thread_start(void) ""

dme.
-- 
I'm catching up with myself!

