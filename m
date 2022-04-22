Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DA950B350
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 10:55:34 +0200 (CEST)
Received: from localhost ([::1]:52020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhp4f-0002es-8T
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 04:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <knuto@ifi.uio.no>)
 id 1nhooo-0008DE-UI; Fri, 22 Apr 2022 04:39:16 -0400
Received: from mail-out02.uio.no ([2001:700:100:8210::71]:47165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <knuto@ifi.uio.no>)
 id 1nhoom-0006S3-JV; Fri, 22 Apr 2022 04:39:10 -0400
Received: from mail-mx10.uio.no ([129.240.10.27])
 by mail-out02.uio.no with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <knuto@ifi.uio.no>)
 id 1nhoof-00G4Ql-RA; Fri, 22 Apr 2022 10:39:01 +0200
Received: from 108.84-234-134.customer.lyse.net ([84.234.134.108]
 helo=[172.25.2.5])
 by mail-mx10.uio.no with esmtpsa (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 user knuto (Exim 4.94.2) (envelope-from <knuto@ifi.uio.no>)
 id 1nhoof-000D6G-6Y; Fri, 22 Apr 2022 10:39:01 +0200
Message-ID: <39d76f6ddf886fc32bf4e18a499bcd5744f1a75b.camel@ifi.uio.no>
Subject: Re: [PATCH] docs: Replace Qemu -> QEMU
From: Knut Omang <knuto@ifi.uio.no>
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org, 
 qemu-trivial@nongnu.org, Knut Omang <knut.omang@oracle.com>
Date: Fri, 22 Apr 2022 10:38:59 +0200
In-Reply-To: <20220422083007.1082667-1-sw@weilnetz.de>
References: <20220422083007.1082667-1-sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-UiO-SPF-Received: Received-SPF: neutral (mail-mx10.uio.no: 84.234.134.108 is
 neither permitted nor denied by domain of ifi.uio.no)
 client-ip=84.234.134.108; envelope-from=knuto@ifi.uio.no; helo=[172.25.2.5]; 
X-UiO-Spam-info: not spam, SpamAssassin (score=-4.8, required=5.0,
 autolearn=disabled, TVD_RCVD_IP=0.001, UIO_HTTP=0.2, UIO_MAIL_IS_INTERNAL=-5)
X-UiO-Scanned: D357DE2A48B1FBDC736776C45C0972358AE999D1
X-UiOonly: 9C48052885EDA4DBCB32979576F9AB025DB42659
Received-SPF: pass client-ip=2001:700:100:8210::71;
 envelope-from=knuto@ifi.uio.no; helo=mail-out02.uio.no
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2022-04-22 at 10:30 +0200, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  docs/pcie_sriov.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/pcie_sriov.txt b/docs/pcie_sriov.txt
> index f5e891e1d4..11158dbf88 100644
> --- a/docs/pcie_sriov.txt
> +++ b/docs/pcie_sriov.txt
> @@ -8,8 +8,8 @@ of a PCI Express device. It allows a single physical function (PF) to
> appear as
>  virtual functions (VFs) for the main purpose of eliminating software
>  overhead in I/O from virtual machines.
>  
> -Qemu now implements the basic common functionality to enable an emulated device
> -to support SR/IOV. Yet no fully implemented devices exists in Qemu, but a
> +QEMU now implements the basic common functionality to enable an emulated device
> +to support SR/IOV. Yet no fully implemented devices exists in QEMU, but a
>  proof-of-concept hack of the Intel igb can be found here:
>  
>  git://github.com/knuto/qemu.git sriov_patches_v5
> @@ -18,7 +18,7 @@ Implementation
>  ==============
>  Implementing emulation of an SR/IOV capable device typically consists of
>  implementing support for two types of device classes; the "normal" physical device
> -(PF) and the virtual device (VF). From Qemu's perspective, the VFs are just
> +(PF) and the virtual device (VF). From QEMU's perspective, the VFs are just
>  like other devices, except that some of their properties are derived from
>  the PF.
>  

Reviewed-by: Knut Omang <knuto@ifi.uio.no>


