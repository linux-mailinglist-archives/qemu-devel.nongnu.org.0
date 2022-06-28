Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D9955BD74
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 04:24:10 +0200 (CEST)
Received: from localhost ([::1]:57522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o60te-000500-1l
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 22:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o60rx-0003bA-HF
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 22:22:25 -0400
Received: from mail-tycjpn01on20704.outbound.protection.outlook.com
 ([2a01:111:f403:7010::704]:59167
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o60rv-0003up-JZ
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 22:22:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAGO5ysmVerx5K2Ek1ElJTIWZ+dOR3MaHZ3HuywJnyH71CGuwJ0Q0JmLsxmduZQKiAQq2DzQrOAJBEaxWqCvteVOU9rEtFDW0LlWnhiBSfv2o6MX5n6D8fPO45xfxW9AkZjR1rCVRnz8CQ717/N8L0xKTko61gjfB0RmSpxlIfPBi/dTjduzs1rH2Vta+0JovUlp26iLnmk9fsTCT1v5uw7kr+/RxhM9VMYxBn6iXEheod831aAedzNaZAUHH1WH0977SctYltEKZUbeQnYj6felo+MSnz4+FkC8HJHfUjs7Kb5+hOOcwzDDaPhL4Td+M7w5vBenZ6f4o7kj5TCXVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hlhj1ZtCnK2EIUz99F3wFapcTDm8GARGMg4UlRwHw3Y=;
 b=YgVNZyObjDpZG4uHkqcwahAcYHImeb4kSFTMJjg+neg6nomU6VzG5CJthJEvwD+IeBKwVelfIr6aoHPavU7BDdcWt2EgHtxR/xcs5XzShpQEnvG8nXO6b/kVaJ74iTlsfd5R1sWURx3cTuVWRh+EEtm/G7gvOhfbRt3iV1B4+QyLIODH8alSvXhqKTEMKN3F6WtsQHDNdoF2gAVNdgkw3Ujzj4LpNcRZ6Ii5uyhKh99Eonkzpa9gn3+hySxssuyKA6eN0Yw0B7V0PUoYhLSVpycwJPSw55HH8+P1ZXYGHCHASkU9gsbhaFlaG4/ne2O3cf275pRvPYJ9DfvXGX96hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hlhj1ZtCnK2EIUz99F3wFapcTDm8GARGMg4UlRwHw3Y=;
 b=VO808MklvmFqpamHCP/ZEHBhoXy1x/aOdsuKdjxefGHryLPdpyx1Mi3sa1mXu/bgvrId+EhSBF25AlFZrsoELfcVe+SOtgobQnguJ3mKMBdGl43vGNqvjMJnImsHE1gXYsQiqLRcTYZg+BMUtZiYV9SuQK9sRBpG9vYNBwTFO2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYAP286MB0570.JPNP286.PROD.OUTLOOK.COM (2603:1096:402:31::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15; Tue, 28 Jun 2022 02:17:14 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95%9]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 02:17:14 +0000
Date: Tue, 28 Jun 2022 10:17:06 +0800
From: Hongren Zheng <i@zenithal.me>
To: MkfsSion <mkfssion@mkfssion.com>, Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, "Canokeys.org" <contact@canokeys.org>
Subject: Re: [PATCH v4 1/2] hw: canokey: Remove HS support as not compliant
 to the spec
Message-ID: <YrpkouGfVVbIvS37@Sun>
References: <20220625142138.19363-1-mkfssion@mkfssion.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220625142138.19363-1-mkfssion@mkfssion.com>
X-Operating-System: Linux Sun 5.15.26
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: BY5PR17CA0037.namprd17.prod.outlook.com
 (2603:10b6:a03:167::14) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18e9c061-c591-4b76-7dbe-08da58ac50f1
X-MS-TrafficTypeDiagnostic: TYAP286MB0570:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +4mMEFwytZsmudrEydlhcmJbB1c6W8cmXzjvdj6yjzvfBtOUyBIWlRVbfXkDbAOQUfZhEm4OM9Kll0H/2Q3y3U9B66C95EJ4tjIt+669NaXqyyBbBLhpmPl9ovsSGe9GAlAItnhzxMJSJsj5hviPFwb5WPmNMzDvd9gEKYp4/KfbDWv5sTdTOXjO6OjPkPNjba6LOGSDfOpHLJbF/KroR2MxoOKq5Qssyi42uihTfCMbs7IjdzxEqLgQa0tgW8p2Q/VbNrTsuEvRUe/r2AGxh79urJ0rGWYD6EmCUqGzz50ZIFUersmbEiTMC3/RKqAzTRfqBsojMeHFnF7h0gmSJ8xOLykRIz+yl2t50AZeb/QcRfCUpfowLvHd4P1E7Eu6smGObEaKFxmcYFT/t23LiM5/2putLB1zmPhAyYGzulQR0vP6+yZA8jTFQZ8vOrYppy7YeuDIJJqBHAiSngi5/Vdf5ByFXQRaxlJz0f3ktZ22/ohV7cMqqtpkbGi8lXLmbY1fCheXxCxr41F5TEj9mTi4pGIPd95jJm9ORo1n4mDK7h9ScWE/GpZFKSHWpt8txSsEnhVTQJGSQpeMzdKETSlXnrnYxx4eoO3/JZNSgIs792TTazAX4cDiSL5+XAL3tGYlUP8Ls6JGh45BTWGWLnOo+iIkmhYeOFx9NJdyQlqkfZczsqE10beLAKtuBKaMiT0WfbUCdCeQds36IBRbp87stPT1BAnvVjpzeHf0fQS6DleJUnDuapm+xGER8//Bc9y9NBKEveZ3pulHRsegxTX9VyARSQ3tmFDW1CrDkqU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(39830400003)(376002)(366004)(346002)(396003)(136003)(41320700001)(5660300002)(186003)(6512007)(33716001)(66476007)(786003)(316002)(6666004)(66556008)(6506007)(4326008)(6486002)(478600001)(86362001)(2906002)(52116002)(8936002)(38100700002)(110136005)(8676002)(83380400001)(66946007)(41300700001)(9686003)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?txSFTmoUJTF+zMMSpqRNfFN+zekbrSu4ODCkOLQtTeQc8F5O38sYCvvRxCM6?=
 =?us-ascii?Q?A6U2dATn4J6BaOvqfL7KwHCB0tnNsPhDNYMBAb+UJ9hTgmOMVAaeYEkVVTOh?=
 =?us-ascii?Q?XOyHK3QCbwS/OzaWsqi34wwUUdNJSKXpVmkZZpw44ssKdanHauUq5hylOkzp?=
 =?us-ascii?Q?r2xbEuL6hXVwOF+DQH7sq4vRKSTA+oXhw0iqa5XuznnolrX4YmCw34zpMBf0?=
 =?us-ascii?Q?R5qzcJ7VlXZeLbKx4/xc/xBLePKxSkbrwZfmsxlPIqc5lXOgty1d5bK54iot?=
 =?us-ascii?Q?5cwVC2Dxaw/4sUdFvXz8MuaG63rz79E8TuXsSvqYXOMQQCFT5ZijT5zHW1Ph?=
 =?us-ascii?Q?pjpdbe8ik8cGTQmkln1ykqddX9whfoxnmNHn5X/I4FcOyf7CU0fXQrfeRN1A?=
 =?us-ascii?Q?2pnUbM65VewkreITo2ZoNYwwvgYOtAic8l7wU6MNhoLbqxDd8Si3o7EXhGlk?=
 =?us-ascii?Q?gjXi3Hjra/pWbfp94uWVLrgap5hT3ukW4fY4RXGgg8D3YcN8heNzloIwLgw3?=
 =?us-ascii?Q?RwxnHwaSpSmJkk0Mk5ABAGSNqeUfGLzZtoxjTygTf8f47ff+iGUqJSy3/jcF?=
 =?us-ascii?Q?ktCdTt+aP7sC59ChFS3FGx1Po9FG8rJNxH8WKv0t04CTwmsquSJe9OrPtPli?=
 =?us-ascii?Q?sseT1EfbV5a1SLjP7A9b4ogMO1LHCQ+XUh9KhD9iUr/tWfeJaYIZwrXwEUp2?=
 =?us-ascii?Q?Y4rMb+H/cwe/zGr0j9VX2R61tVhGBcezYuutX963lXIq+BeHvdA09S0kEx/O?=
 =?us-ascii?Q?epRxzSGPHYYHz+E9X8eLNnnhIfHkGoH1PDnQph2v5udvwklBgt8BpADpzN5J?=
 =?us-ascii?Q?Y/7y601UtCdGP6bptU0tjFv0fcfeqmbrAW0+JeQ/5jKNDRLKUrCKuPzOIhZw?=
 =?us-ascii?Q?CxzAQXhySuAsusSKRXFUT1n1+U+ja/twFEfBabFJCCqadb1Fi/BZCiZI2Nj7?=
 =?us-ascii?Q?PUpU9QY8bxVf0VaeSxbpHDIPDB01bkxdt2dULg8WqHM2aaTp3TT3aF9OzjrZ?=
 =?us-ascii?Q?mOZe+A95zVl+ck+EGZ0a8U6f607z7EpF8yaoZZnjjc5GGsAm/d2CxqB9jUxb?=
 =?us-ascii?Q?zv/YNoFIyHT1/qhcXT1WH/QdALucAB093w01Y3CHsHrcHFpVYHhT7n0ZQkpX?=
 =?us-ascii?Q?gNQhNLea9ZEbekha8xl+DNVy8VUAQH5i0JIfFoPzbWItGFJkpimskDeMXXKK?=
 =?us-ascii?Q?az+/QbR7POqMWz1/dtfr+KVxqJmRaISh9zxXCLpQY6FAiJGrECpx/n5nc5oH?=
 =?us-ascii?Q?o5EFacYxo04Vyy0qRIsj1D62bOHnQjFx/bOFcJfmyHmXaATgOuLYPmjQxlwY?=
 =?us-ascii?Q?l3m+myTTz1vQmcyQESrF2ZJOvIM6imJyQZYSocC4aPORBW5SDgaSyGAegCnD?=
 =?us-ascii?Q?YO60JMOmRtyjpU9+FiUWpXuWLg74+CzUEIre56fddVdxv7ee+K+nIzbdE8F+?=
 =?us-ascii?Q?ichfvtC7H5XxHtCTjODdIG0uW8i+EKDzmcdbOtPV//E15vHZPIcAPUdRN/bS?=
 =?us-ascii?Q?uL5niFWx/jteYeJLS8U0mskC/0LS4TdAymNfJWhH3YCzKL/NgwriRAFM3cdR?=
 =?us-ascii?Q?VJPZd/nJW3IPKdyFDiyISuqSsIkFicGIgMUmUH3E?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e9c061-c591-4b76-7dbe-08da58ac50f1
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 02:17:14.5562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFpLC9R/kPTfpSQTWuFeieiHOaL82lzUwvcwY1Z93di0NLwXwn9SusP4iL/70GeV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAP286MB0570
Received-SPF: pass client-ip=2a01:111:f403:7010::704;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

On Sat, Jun 25, 2022 at 10:21:37PM +0800, MkfsSion wrote:
> Canokey core currently using 16 bytes as maximum packet size for
> control endpoint, but to run the device in high-speed a 64 bytes
> maximum packet size is required according to USB 2.0 specification.
> Since we don't acutally need to run the device in high-speed, simply
> don't assign high member in USBDesc.
> 
> When canokey-qemu is used with xhci, xhci would drive canokey
> in high speed mode, since the bcdUSB in canokey-core is 2.1,
> yet canokey-core set bMaxPacketSize0 to be 16, this is out
> of the spec as the spec said that ``The allowable maximum
> control transfer data payload sizes...for high-speed devices,
> it is 64 bytes''.
> 
> In this case, usb device validation in Windows 10 LTSC 2021
> as the guest would fail. It would complain
> USB\DEVICE_DESCRIPTOR_VALIDATION_FAILURE.
> 
> Note that bcdUSB only identifies the spec version the device
> complies, but it has no indication of its speed. So it is
> allowed for the device to run in FS but comply the 2.1 spec.
> 
> To solve the issue we decided to just drop the high
> speed support. This only affects usb-ehci as usb-ehci would
> complain speed mismatch when FS device is attached to a HS port.
> That's why the .high member was initialized in the first place.
> Meanwhile, xhci is not affected as it works well with FS device.
> Since everyone is now using xhci, it does no harm to most users.
> 
> Suggested-by: Hongren (Zenithal) Zheng <i@zenithal.me>
> Signed-off-by: YuanYang Meng <mkfssion@mkfssion.com>
> ---
>  hw/usb/canokey.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
> index 4a08b1cbd7..6a7ab965a5 100644
> --- a/hw/usb/canokey.c
> +++ b/hw/usb/canokey.c
> @@ -56,7 +56,6 @@ static const USBDesc desc_canokey = {
>          .iSerialNumber     = STR_SERIALNUMBER,
>      },
>      .full = &desc_device_canokey,
> -    .high = &desc_device_canokey,
>      .str  = desc_strings,
>  };
>  
> -- 
> 2.36.1
>

Reviewed-by: Hongren (Zenithal) Zheng <i@zenithal.me>

kraxel could you please pick this patch and queue
this up for PULL, thanks!

