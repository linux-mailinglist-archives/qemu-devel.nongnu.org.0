Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413D830DC60
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:14:07 +0100 (CET)
Received: from localhost ([::1]:50832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Iv0-0002ZK-73
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:14:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1l7Ipe-0006Db-QO
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:08:34 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:53850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1l7Ipc-00019x-0b
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:08:34 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 113E3xIo138869;
 Wed, 3 Feb 2021 14:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 in-reply-to : references : from : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=MSEkME6ZYIsmoSWm4ofhzHQIMtmnhITaXCGVSTx+dDY=;
 b=OlkoCEf/qYNc7xtYkDW3TlGyGOj89HQDXSVr38waO9NLXdbjcah83BMagRppsQ2ham04
 ubU5+jJ2n2bDuXwzxdZhWlupp9cdRk9hZxp9FSl7hAhIFq/MyUprphguUDU3vhZ1MZHl
 /oAl+SH6axpuOX7fBGEGqHZtmJRZPwIovVybVMTn9QoyGANjfBpbFir0YaEn1yUy4gUP
 ZAYqbiMWqBrPTtuKgUfV5stl7hE6JhiWH7yq6KLOD92dae81KFMsZrsghtAx6CXZx6HC
 1+l+c3pa3Y7uH8AoqoUeRogNru8lIsU9sZYo6Cs4CYEFQCpyZUGUKoU4SRvkS7PKZcND 8Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 36fs458ve0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Feb 2021 14:08:30 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 113E6F3f183522;
 Wed, 3 Feb 2021 14:08:30 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
 by userp3020.oracle.com with ESMTP id 36dh7tgwra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Feb 2021 14:08:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3IxEQdXlC2YRXlnp5WhrhutqSd+IdoOHP4+4keWk/WKqItu/exE/pDRFcX3838icuWHIw3H0NHTl+maozsfAAHx4J8EbdUrQEU6cG0aok1QvIvVICPo9j7TdMnaqvKhzVWjKwl88p1kYmbPlPgC6rRKKDFz8s4sNBtmqg7+PWTnkOq+saCWrA4x0JObR1ekHK1CN7eEJyaZJ/ngnpWzsIur7LJTb3gezb4oBIT7w0ATmTkdrhDJwem0RpisaTHy9e6dUpkNq68wd6rzcuEQWXb4AjJwdHr1QUJGwCvo2183IJA9kDs1zNwgT09Mx+9ZeIADhsv+GAGXgRV/dp8EmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSEkME6ZYIsmoSWm4ofhzHQIMtmnhITaXCGVSTx+dDY=;
 b=bIc/4BwvtvCbLwv3lJJ7zxTWRGBrb9L6rSAoFUpenlnOhzzltsAvYrnJ2qTXF2wle2s2znUGKmXXCx19c/Zj3PAvuWkQ8J51An8tmFQ+B76HgKz+VpYoCLqYYbZg50GVxmH/xXx1dlSpSvE2hWmtUKzAAsTDPHWOlhADHjtAjtntSKmYM4RZjJAxH7gsj1ObiKnMb+aAEWb+Qw1ID2X/HrVYiAZJLOJH0MqFWucZwUMwYbAqyuC9EcE45zGBTjUf+6zWGrugHIvdOnpmZYv/bk2U4SSWWom9BvunSQnLUvR8AG3HQbPWan+Y4qSgmdldba/oRSCO5V2PTT6oHC1vdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSEkME6ZYIsmoSWm4ofhzHQIMtmnhITaXCGVSTx+dDY=;
 b=TIl5SgUX91sqLrwcCHCY16eKm17oi2j4n2evkl/MixA3xQI9LPCSSVLEBNGSrj0xX9ieY9sneypL9531AFKAB02uh6xh4P3Z8PHcciQsYGt5eNsRkWvfyV6ZQHJXdLLadgHg1xJFqxyKCci88otJuAp0pcHy/h52yjOBFXMqBJM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM5PR10MB1962.namprd10.prod.outlook.com (2603:10b6:3:110::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Wed, 3 Feb
 2021 14:08:27 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3825.020; Wed, 3 Feb 2021
 14:08:27 +0000
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 2/2] pci: add romsize property
In-Reply-To: <20210203131828.156467-3-pbonzini@redhat.com>
References: <20210203131828.156467-1-pbonzini@redhat.com>
 <20210203131828.156467-3-pbonzini@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <david.edmondson@oracle.com>
Date: Wed, 03 Feb 2021 14:08:21 +0000
Message-ID: <cuneehxnt0q.fsf@oracle.com>
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO2P265CA0137.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::29) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO2P265CA0137.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9f::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Wed, 3 Feb 2021 14:08:26 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 2e7d0850;
 Wed, 3 Feb 2021 14:08:21 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09b56e02-2e7f-4c54-d8e8-08d8c84d2d34
X-MS-TrafficTypeDiagnostic: DM5PR10MB1962:
X-Microsoft-Antispam-PRVS: <DM5PR10MB1962C1FE985073785EEEA39D88B49@DM5PR10MB1962.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:514;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 734QhbtwWfRkvNT9Y0g43Ppw5Br0xeju9ibC4DQntyEPFejVZeJ/B1XbyNGm7pobxS5DF8o8I/QM54lx3IZ+DPgNHJufNpbJOxplzbmWVovpGPfS6RuuV7JGdPT6/GCyTDksZJ7753vCr6xfFQ1BWmDG90ddjBM6tYSPBrt4OxZcGVfaYpWHnjwa/DKvnuAniCNFf+qfIQM6nrQpXjgOYUlaxzSd2ATyIkg4zQkUgRy7cnTw/uU7h84ikZsvgrledtwQhyhZPH5F/D7NAbL7LUuqIejnNc8NFx1r1/KLz2BUF3DnFlRTgszSgbW9HnwL6Q0wvHbgkSK6Gl/YYp9dEFCUyqD108QgqkeoOpGVVlzXj5TYe98oXoqXPbwzWK0At0/RvpLzCgtYej2/ykIQjeqqIiPzNgiGewXYo3eoGHv8c+oZhUawkJ4/BNuaRjjgCUWBqUMbKwDBIqNvItJFQvaA+2sg4HCiDWN/JifWaB2MnDFKpFNR0CYM2k/K6SXJ+/CHDEbK4rjdgcO/QHgWmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(136003)(366004)(39860400002)(396003)(316002)(86362001)(5660300002)(36756003)(8936002)(66556008)(8676002)(52116002)(478600001)(66946007)(2616005)(186003)(2906002)(66476007)(83380400001)(4326008)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Z4jfHr01RCd3rSrHjbebLE89J18ZP+Zz0SrSAawy6Z+BVy4FHBUIc9PhzISV?=
 =?us-ascii?Q?jQ+t5tMD9e81KAO2tjqpXjgamk0Hz5N/+sHIqxagvRHrH+tzi4qDZuROaVuQ?=
 =?us-ascii?Q?huOhHdSUBz+h8EeGyPL93N96T6BT0sD6D2Y2VZxAsOSVi9SjDcMfmL25YrO3?=
 =?us-ascii?Q?CkXTkVcEguhFQKHbgo/h9TkUZt80jQdgE3QFw9lSZo9sDrqpUQCYn37gfBtw?=
 =?us-ascii?Q?9DqXpV1jzTVwWHODQyGeKGFFj028cBYHRk3PAMQ4ga0vUalWDQNpQw17hBlN?=
 =?us-ascii?Q?6cW3FY4bgE+FkfZl/6T/1CvmPV2q/CMy/Wjycmqc0GofXBYpE7HhWg9HhiZE?=
 =?us-ascii?Q?xEM/KIoyBvOchiYYJb7ieveXH6d4P6XyoAVnOSzvFrQRkPY4L1xxIHXozfPE?=
 =?us-ascii?Q?ulSYHPB9wuaIZ0EG+zz5MzGrXG9ZYlmz/dxqWbjrTLAN6hXfxS4rnZprZNQ6?=
 =?us-ascii?Q?iYqFUupVtY0os7+HzvDkldL0tDVyuvBlDuOg2N2daCSSjbTfzTjKOrAxD5qG?=
 =?us-ascii?Q?q1iCAKHfBSlwDC2muGCTm2NDmvidYMWWtbcbbUB4wVNeLRuBX5Ciq2y+G07Y?=
 =?us-ascii?Q?S9Nqw+EXvstVC983pUDfdw7Ris73eq8Q0cdZCkwO8njVg3RGyT7kCaAkQ+gl?=
 =?us-ascii?Q?Fr0CK8FnHn+/T35CEkBqQBYvHiILkFM9JxVEBebouijYNf9yZv6I6vLQmS4o?=
 =?us-ascii?Q?0lgrIGSyyQt29EM5nx5REXNQzcbjy/vrqxwNwH5MwgvV6TyqXdndQXW6qvSn?=
 =?us-ascii?Q?mKxfQ9AKoAX2BBD/kv0ovkTQl5ED7iPZsq9+2MkWsSCmZ7c5MmmpmBgqnV9U?=
 =?us-ascii?Q?sBfdmygzIeH7wXfomztW0qjFFRWJuUHtD3JG1I4p8okhzLMCol+tUwWkVw81?=
 =?us-ascii?Q?EpoC6zEbukx00ymiTEG7yMjrvlKO2iP6WlFeKBuVqmqeFFAtwCVatTsim2A2?=
 =?us-ascii?Q?MYN4W+taJ+WbzKIYps6RFXxa+/4hH6zRgOoRF75zHFAW3KY6vCPCYLh4kevM?=
 =?us-ascii?Q?8OxdbUIzYe1YoXVAtwmWI14nBiRbX3MATogwWLQKI33PcoeZCcJboilvBenc?=
 =?us-ascii?Q?2wQ0PNf/NB2Hcxj7QfjI5/d3LUAUuA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b56e02-2e7f-4c54-d8e8-08d8c84d2d34
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 14:08:27.1149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMIQ5DgNOOh/020yKOc67u3CyfTByX8dwah5Tp/t4W+HlUBJvnxVetbFZ13wBv+1JBFRD+iYFAvfU/ipUmnoJhw1HMM68YW0slJQQxfAPCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1962
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9883
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102030088
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9883
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102030088
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=david.edmondson@oracle.com; helo=userp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lersek@redhat.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 peterx@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-02-03 at 14:18:28 +01, Paolo Bonzini wrote:

> This property can be useful for distros to set up known-good ROM sizes for
> migration purposes.  The VM will fail to start if the ROM is too large,
> and migration compatibility will not be broken if the ROM is too small.
>
> Note that even though romsize is a uint32_t, it has to be between 1
> (because empty ROM files are not accepted, and romsize must be greater
> than the file) and 2^31 (because values above are not powers of two and
> are rejected).
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Message-Id: <20201218182736.1634344-1-pbonzini@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  hw/pci/pci.c             | 19 +++++++++++++++++--
>  hw/xen/xen_pt_load_rom.c | 14 ++++++++++++--
>  include/hw/pci/pci.h     |  1 +
>  3 files changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 58560c044d..a9ebef8a35 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -69,6 +69,7 @@ static void pcibus_reset(BusState *qbus);
>  static Property pci_props[] = {
>      DEFINE_PROP_PCI_DEVFN("addr", PCIDevice, devfn, -1),
>      DEFINE_PROP_STRING("romfile", PCIDevice, romfile),
> +    DEFINE_PROP_UINT32("romsize", PCIDevice, romsize, -1),
>      DEFINE_PROP_UINT32("rombar",  PCIDevice, rom_bar, 1),
>      DEFINE_PROP_BIT("multifunction", PCIDevice, cap_present,
>                      QEMU_PCI_CAP_MULTIFUNCTION_BITNR, false),
> @@ -2084,6 +2085,11 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
>      bool is_default_rom;
>      uint16_t class_id;
>  
> +    if (pci_dev->romsize != -1 && !is_power_of_2(pci_dev->romsize)) {
> +        error_setg(errp, "ROM size %u is not a power of two", pci_dev->romsize);
> +        return;
> +    }
> +
>      /* initialize cap_present for pci_is_express() and pci_config_size(),
>       * Note that hybrid PCIs are not set automatically and need to manage
>       * QEMU_PCI_CAP_EXPRESS manually */
> @@ -2349,7 +2355,16 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>          g_free(path);
>          return;
>      }
> -    size = pow2ceil(size);
> +    if (pdev->romsize != -1) {
> +        if (size > pdev->romsize) {
> +            error_setg(errp, "romfile \"%s\" (%u bytes) is too large for ROM size %u",
> +                       pdev->romfile, (uint32_t)size, pdev->romsize);
> +            g_free(path);
> +            return;
> +        }
> +    } else {
> +        pdev->romsize = pow2ceil(size);
> +    }
>  
>      vmsd = qdev_get_vmsd(DEVICE(pdev));
>  
> @@ -2359,7 +2374,7 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>          snprintf(name, sizeof(name), "%s.rom", object_get_typename(OBJECT(pdev)));
>      }
>      pdev->has_rom = true;
> -    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, size, &error_fatal);
> +    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize, &error_fatal);
>      ptr = memory_region_get_ram_ptr(&pdev->rom);
>      if (load_image_size(path, ptr, size) < 0) {
>          error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
> diff --git a/hw/xen/xen_pt_load_rom.c b/hw/xen/xen_pt_load_rom.c
> index a50a80837e..03422a8a71 100644
> --- a/hw/xen/xen_pt_load_rom.c
> +++ b/hw/xen/xen_pt_load_rom.c
> @@ -53,10 +53,20 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev,
>      }
>      fseek(fp, 0, SEEK_SET);
>  
> +    if (dev->romsize != -1) {
> +        if (st.st_size > dev->romsize) {
> +            error_report("ROM BAR \"%s\" (%ld bytes) is too large for ROM size %u",
> +                         rom_file, (long) st.st_size, dev->romsize);
> +            goto close_rom;
> +        }
> +    } else {
> +        dev->romsize = st.st_size;
> +    }
> +
>      snprintf(name, sizeof(name), "%s.rom", object_get_typename(owner));
> -    memory_region_init_ram(&dev->rom, owner, name, st.st_size, &error_abort);
> +    memory_region_init_ram(&dev->rom, owner, name, dev->romsize, &error_abort);
>      ptr = memory_region_get_ram_ptr(&dev->rom);
> -    memset(ptr, 0xff, st.st_size);
> +    memset(ptr, 0xff, dev->romsize);
>  
>      if (!fread(ptr, 1, st.st_size, fp)) {
>          error_report("pci-assign: Cannot read from host %s", rom_file);
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 66db08462f..1bc231480f 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -344,6 +344,7 @@ struct PCIDevice {
>  
>      /* Location of option rom */
>      char *romfile;
> +    uint32_t romsize;
>      bool has_rom;
>      MemoryRegion rom;
>      uint32_t rom_bar;
> -- 
> 2.29.2

dme.
-- 
I'm not the reason you're looking for redemption.

