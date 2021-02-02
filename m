Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CD130C4A5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:58:49 +0100 (CET)
Received: from localhost ([::1]:54996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6y4l-0007RA-4x
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:58:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l6xmb-0006cn-Mr
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:40:01 -0500
Received: from zangief.bwidawsk.net ([107.170.211.233]:46424
 helo=mail.bwidawsk.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l6xmZ-0002b8-W8
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:40:01 -0500
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id D15E41234A4; Tue,  2 Feb 2021 07:39:58 -0800 (PST)
Received: from mail.bwidawsk.net (c-73-37-61-164.hsd1.or.comcast.net
 [73.37.61.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id AB645122C69;
 Tue,  2 Feb 2021 07:39:52 -0800 (PST)
Date: Tue, 2 Feb 2021 07:39:51 -0800
From: Ben Widawsky <ben@bwidawsk.net>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [RFC PATCH 1/4] include/standard-headers/linux/pci_regs: temp
 hack to add necessary DOE definitions.
Message-ID: <20210202153951.2i6qxd63wk5xw2rm@mail.bwidawsk.net>
References: <20210201151629.29656-1-Jonathan.Cameron@huawei.com>
 <20210201151629.29656-2-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210201151629.29656-2-Jonathan.Cameron@huawei.com>
Received-SPF: none client-ip=107.170.211.233; envelope-from=ben@bwidawsk.net;
 helo=mail.bwidawsk.net
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, linuxarm@openeuler.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, f.fangjian@huawei.com,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org, f4bug@amsat.org,
 jcm@redhat.com, Prashant V Agarwal <agpr123@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-02-01 23:16:26, Jonathan Cameron wrote:
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  include/standard-headers/linux/pci_regs.h | 33 ++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/include/standard-headers/linux/pci_regs.h b/include/standard-headers/linux/pci_regs.h
> index e709ae8235..7e852d3dd0 100644
> --- a/include/standard-headers/linux/pci_regs.h
> +++ b/include/standard-headers/linux/pci_regs.h
> @@ -730,7 +730,8 @@
>  #define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
>  #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
>  #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
> -#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_PL_16GT
> +#define PCI_EXT_CAP_ID_DOE	0x2E	/* Data Object Exchange */
> +#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_DOE
>  
>  #define PCI_EXT_CAP_DSN_SIZEOF	12
>  #define PCI_EXT_CAP_MCAST_ENDPOINT_SIZEOF 40
> @@ -1092,4 +1093,34 @@
>  #define  PCI_PL_16GT_LE_CTRL_USP_TX_PRESET_MASK		0x000000F0
>  #define  PCI_PL_16GT_LE_CTRL_USP_TX_PRESET_SHIFT	4
>  
> +/* Data Object Exchange */
> +#define PCI_DOE_CAP		0x04
> +#define  PCI_DOE_CAP_INT_SUPPORT			0x00000001
> +#define  PCI_DOE_CAP_INT_MSG_NUM			0x00000FFE
> +
> +#define PCI_DOE_CTRL		0x08
> +#define  PCI_DOE_CTRL_DOE_ABORT				0x00000001
> +#define  PCI_DOE_CTRL_DOE_INT_EN			0x00000002
> +#define  PCI_DOE_CTRL_DOE_GO				0x80000000
> +
> +#define PCI_DOE_STATUS		0x0c
> +#define  PCI_DOE_STATUS_DOE_BUSY			0x00000001
> +#define  PCI_DOE_STATUS_INT_STATUS			0x00000002
> +#define  PCI_DOE_STATUS_DOE_ERROR			0x00000004
> +#define  PCI_DOE_STATUS_DATA_OBJECT_READY		0x80000000
> +
> +#define PCI_DOE_WRITE_MAILBOX	0x10
> +#define PCI_DOE_READ_MAILBOX	0x14
> +
> +/* Data Object Format DOE ECN 6.xx.1 */
> +#define PCI_DATA_OBJ_DW0_VID				0x0000ffff
> +#define PCI_DATA_OBJ_DW0_TYPE				0x00ff0000
> +#define PCI_DATA_OBJ_DW1_LEN				0x0003ffff
> +
> +/* DOE Discover Data Object */
> +#define PCI_DOE_DIS_OBJ_TYPE	 0x1
> +#define PCI_DOE_DIS_REQ_D0_DW0_INDEX			0x000000ff
> +#define PCI_DOE_DIS_RSP_DO_DW0_VID			0x0000ffff
> +#define PCI_DOE_DIS_RSP_D0_DW0_PROT			0x00ff0000
> +#define PCI_DOE_DIS_RSP_D0_DW0_NEXT_INDEX		0xff000000
>  #endif /* LINUX_PCI_REGS_H */

I think a lot of these should have had _MASK at the end.

As for the accuracy of the values, lgtm.

