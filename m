Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F018030DC47
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:10:19 +0100 (CET)
Received: from localhost ([::1]:41986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7IrK-0007AJ-Vs
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:10:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1l7IpM-0005zc-Vw
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:08:17 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:36678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1l7IpK-00011f-8y
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:08:16 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 113E4inH054597;
 Wed, 3 Feb 2021 14:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 in-reply-to : references : from : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=F7DmYWvtWKdKUa6lo5JpVVBTEzgKZGFCTq2vlPGFCQs=;
 b=si3CN9fqdhGQSMwcKRpHuvSgRjicX2dqfRtRVDc/BipRmVkV5brjBramcGXGnD31vwgR
 DMYHJH6wYrvhzBZGc30f1I3gM6b5O+V/obQhSEgyaNSLn+0hzeN8PaOuIIsXv3lgrEwx
 eX/6hT9Tuw0TLJOI+4/slHBydyGC/IXWMjekpl4Ybn6gMEItDxzdVWjXdmGk+ZazVHRr
 FXpZXrrg2V3O4weSvlbo69ZsUI7rwPK/9WpEMYue7hyc6Ba1ZQjF9tnyNKtb/C4l3bkl
 qgKG3OwapjcOPlg4QgoOC/1AeBs0/pW3Q2sK8Fe46kfkvC+bvfs3cmfFSnABHDYMyjJH xg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 36cxvr32ks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Feb 2021 14:08:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 113E5fGF001305;
 Wed, 3 Feb 2021 14:08:08 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2059.outbound.protection.outlook.com [104.47.37.59])
 by aserp3030.oracle.com with ESMTP id 36dh1qw55s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Feb 2021 14:08:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVSDXUAtDkvQLZ1Xi9a0VoF19hvv1+o+SX5tF6vWLW11XebnkyuD3KYBxGdTXiH4AIfCWKytbuE4HTKakaL1MJRTcRwMpH4VltNcVf7+CUS3dPdRh8QpZSeGFRN25YNRbmJKBUqUuMIHsE2xOt1QJAjEEvXb/P5sbGGOkqoYmYk6q/3HR7fs6qhkgGReQXHyu3QTVyroJf9wWKtnZ5HMQrRW6DVmUfxc+Zh2gOa9PzQJao3LQESCmmO9fAlzO/tBbYjZFnVuqMPLxwWm+16+aS0MwIS8a9lvOumO2oTqUJARpvhOBUFBeTePwiACC+Gh68F+XsLfTXBD/Nm8F/fQVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7DmYWvtWKdKUa6lo5JpVVBTEzgKZGFCTq2vlPGFCQs=;
 b=hLmfLOWB4kjwTDC/2+tJeIci0oAut0GHHBumvQgOR6b4CkFgPJqC/7Ppxm5e8wn2CgaZyDr5NyZkMsZjuecNxRo+XgeZL0asRGMUT+WgipFmUsRKcvnvpwXJMCbEz4vBpwwkmHtN05fw58FKJgBjyMdZiu3aDhQpFj5r+kFTPohrDG2Cc1gJx6nKqcUqmuReca7AlTJ2efGmeE9lNdLATWoADaTtgtyOfK/D3aIMsOx20rGZRYk4YD0CLcOTwJQaWoB/AWKjpcTezixKv3Hfet0uNd0OX++8R8p2KS1m9fkUuLFTgHG/EH/IZWFU8hKnG1Eh6JMwR7w9JHzAVrtnEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7DmYWvtWKdKUa6lo5JpVVBTEzgKZGFCTq2vlPGFCQs=;
 b=x0OKwxY1xPSVDkfqprQuwVCidXsMD+I7c5KPl4jMPw7BVT0J8HZZ75KiF9yjfAntILKp2uDTUS0WhzDYlHG0NrwFPC8oEZL39Uh7FiwDfcMLQeFJFuN3/5LlMPGf1LHs4z59+u7GKHnoKtbfuCqKyL4IvwIi8wE+XEFP8ecG7g8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM6PR10MB2428.namprd10.prod.outlook.com (2603:10b6:5:b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Wed, 3 Feb
 2021 14:08:06 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3825.020; Wed, 3 Feb 2021
 14:08:06 +0000
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/2] pci: reject too large ROMs
In-Reply-To: <20210203131828.156467-2-pbonzini@redhat.com>
References: <20210203131828.156467-1-pbonzini@redhat.com>
 <20210203131828.156467-2-pbonzini@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <david.edmondson@oracle.com>
Date: Wed, 03 Feb 2021 14:08:00 +0000
Message-ID: <cunh7mtnt1b.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LNXP265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::27) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LNXP265CA0015.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17 via Frontend Transport; Wed, 3 Feb 2021 14:08:05 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 1c21aa19;
 Wed, 3 Feb 2021 14:08:00 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5169cc06-bf28-41b9-dd05-08d8c84d20bc
X-MS-TrafficTypeDiagnostic: DM6PR10MB2428:
X-Microsoft-Antispam-PRVS: <DM6PR10MB24282ADBD81987DA48331AF288B49@DM6PR10MB2428.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +R+IsVYR0eUP87xPLn6mUVAnZIAEgsLeZ/mqCUwnSiIi9wUTlrnWnyx2jhYji5trRUh2bgkQ3M+zyDT88RR7QIzJn5vPYRVIoR5xBCj52bNEprqc43n2rlyGmbo0l0JrqqJL1EFXa7HIGWLr7ndmf0XvidV7/OFa7VMIE7QJDm6fUUudU9GbZLYNL4VoWLhw/GFGfbMcHsouV4dNbT1IJzq+TB2VBzBoHTLHsI+eUCC3QBLgi1a6lK68pENf3d8xzm6SCY7HyYOiYXpJL5cGcxmdlnCGJFgKeCGTLlNc2t/5BzZt2o3cRCdhFMOi3VC+RmaqqExdK6YOn6F6fYwNlNT5+kBYtQ4mN3SuJeo1zU7xKDohgj12U6KgdL/pvgGWduloyPfuBzxS2Z07tKFlmmfRAu5Dzbf/GDpHU0obYR9vs/Rh1iB0KDblqr2M7ezHE9Nly68gTwg7P1Edo8wgJb6kcEo1xsh8VulGiDQhQYTmAI/5xprUI3SVJ75WeCCSVQMy0PZAGs6dAKIFF5nN8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(366004)(396003)(346002)(39860400002)(8936002)(2616005)(44832011)(66476007)(66946007)(5660300002)(83380400001)(36756003)(52116002)(8676002)(66556008)(4326008)(186003)(316002)(2906002)(478600001)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aDdlNUpnSVZwUHhpZ0trQkxjbmtBV2pOV2p6NkVYV0lidUtHM1lLWnNNK1ZR?=
 =?utf-8?B?WVZxOHJJbS90UXlBQkIxM2V4NUNKVnpoVGRGSTNKaDBuQ28yNDY1dlNWMmNH?=
 =?utf-8?B?RjVwWk5KM3VrUTVvcnlNR1FQZHNIdStCK0FIS1JnUWpOK3M4Njd1ZnFXcncv?=
 =?utf-8?B?VUNOazRNSEhITC9KYlkraUs1TmNSanFuNlR0dUx2UVhoek5jUWZIeHNnL0pR?=
 =?utf-8?B?c1ZCT1dHeitVZDVGa0F2R25HalJvcTZEV2lZaE8rTm9QZ3FvNmlpaDBMcEJm?=
 =?utf-8?B?ZWl0WmdQN1c0Sjd0MVEySitCT1V6RGVrdStaZDNqaUxQVE8wTDE3cUtuSHI5?=
 =?utf-8?B?ZHhiRmgyaGVRVXQzQldnOGJNNFVYbVpqTUtiV2k0eERDRUZISThGSXFDeVJC?=
 =?utf-8?B?VzJvUWFsNGtlSlM5cEVmV2UrQ25wMlluaG1EazBjemdwSkNWdTF4ejRneFFO?=
 =?utf-8?B?aUx1YnMza2NFam5sekgwb0hDNDRvOW84NFZUamxmbFpvYkRrWGhKT0ovNWE1?=
 =?utf-8?B?TFQ3a2laVkxSNXl6UlhCZGhwZnFyaDlBWmU4TG90elVoUmtHTGJZRmRmNldO?=
 =?utf-8?B?V0RKczdVenhOVWM2SUhiRUR2cjJDNmVBbTh3b0p1dmpGYzE2QU9GaG42THIr?=
 =?utf-8?B?OHVGeTJZN1Y4ZWJtQ1ZEUk5mQnZUUFB5SnltT1hzWlVsT0lKSFhMSDZrZ3JO?=
 =?utf-8?B?Njh0dkpjMW55bnBYZ3B6aE5mYS9NKzhmcWR2aEVvU0t6eVV6blg3M1NZaFBL?=
 =?utf-8?B?UGY0RmJjcXo1NFBDbjZNNGlSNUJMMEp2MzhzWUJKbXZzZVlwZTVkdEZkQUhG?=
 =?utf-8?B?VE14Q1czZUVGOWt1VGZMVHBlUU0vU2NMVXFvV0hsM1R5Y0ZsQnk3dThrQTNK?=
 =?utf-8?B?OUFRajd5dHppSkN5UlQ3REh4WWNiK0NZSjFWTkJ2b28wTkY0eCtWY25iQWQr?=
 =?utf-8?B?S3NwOEZLaHpuZk13RTJMWTJsVFZRTUp5WGFVdFlaT0xBTDVQN1ovNUNGaVd4?=
 =?utf-8?B?N0w5dmZFOTA3cGpuQnpEeEtOYlVrWmhBS2Y2K0NTVjBsbS9KbjQxWk1PdFJF?=
 =?utf-8?B?ZVJWR2paaFhhQXNzUnJoalJVNk8wTTc5UWZyYjd4TTA1YlEwQUlUQjFpNWhs?=
 =?utf-8?B?SHowVzB2K1ZxRnBsODMycXcxdHMyaWk2Q1h6WFAxUFVFSmJ6aFdKSDNITGsx?=
 =?utf-8?B?SDRGU1VzMmM5MkozNWRZQzRpOFErdEgyQnZ6LzJBVkFRQkUwdytJUGpzWlQ4?=
 =?utf-8?B?d05JM1hMSEo2QVBTVVpFQldqa3kvYVZQdlg2OXZRd0tocWNVUWxZazVQeXgz?=
 =?utf-8?B?QmR0c1BVSEVjdWROTFNhNlg4QTAxcks4bFRIcnNWZmJPV1ZpNHRMSFJsam52?=
 =?utf-8?B?YXpUdzE1NW5ZcDByUklwVkV6K3FIcm11TVlvWm96K3diRGIzN0ZEMVVCMkdR?=
 =?utf-8?B?endzUUdGQTlVeDQvNndDK2I0TldjUkJxbXY0WjZBPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5169cc06-bf28-41b9-dd05-08d8c84d20bc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 14:08:06.2089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oHwLqQLumEVTdd9PDC9VyOaX0buso4mVbJ1DtojNQQc92MQWNiC2mgqKIqMt3Kv9pAVGcSRe84RqaJGJDI61g8Bu1GQcbicYfqmHmHw84Qs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2428
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9883
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102030088
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9883
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102030088
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=david.edmondson@oracle.com; helo=userp2130.oracle.com
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
Cc: lersek@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, peterx@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-02-03 at 14:18:27 +01, Paolo Bonzini wrote:

> get_image_size() returns an int64_t, which pci_add_option_rom() assigns
> to an "int" without any range checking.  A 32-bit BAR could be up to
> 2 GiB in size, so reject anything above it.  In order to accomodate
> a rounded-up size of 2 GiB, change pci_patch_ids's size argument
> to unsigned.
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  hw/pci/pci.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 512e9042ff..58560c044d 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -25,6 +25,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu-common.h"
>  #include "qemu/datadir.h"
> +#include "qemu/units.h"
>  #include "hw/irq.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_bridge.h"
> @@ -2234,7 +2235,7 @@ static uint8_t pci_find_capability_at_offset(PCIDev=
ice *pdev, uint8_t offset)
> =20
>  /* Patch the PCI vendor and device ids in a PCI rom image if necessary.
>     This is needed for an option rom which is used for more than one devi=
ce. */
> -static void pci_patch_ids(PCIDevice *pdev, uint8_t *ptr, int size)
> +static void pci_patch_ids(PCIDevice *pdev, uint8_t *ptr, uint32_t size)
>  {
>      uint16_t vendor_id;
>      uint16_t device_id;
> @@ -2292,7 +2293,7 @@ static void pci_patch_ids(PCIDevice *pdev, uint8_t =
*ptr, int size)
>  static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>                                 Error **errp)
>  {
> -    int size;
> +    int64_t size;
>      char *path;
>      void *ptr;
>      char name[32];
> @@ -2342,6 +2343,11 @@ static void pci_add_option_rom(PCIDevice *pdev, bo=
ol is_default_rom,
>          error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
>          g_free(path);
>          return;
> +    } else if (size > 2 * GiB) {
> +        error_setg(errp, "romfile \"%s\" too large (size cannot exceed 2=
 GiB)",
> +                   pdev->romfile);
> +        g_free(path);
> +        return;
>      }
>      size =3D pow2ceil(size);
> =20
> --=20
> 2.29.2

dme.
--=20
I used to worry, thought I was goin' mad in a hurry.

