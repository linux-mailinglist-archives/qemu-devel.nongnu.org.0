Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4202420F31E
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 12:52:26 +0200 (CEST)
Received: from localhost ([::1]:58900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqDsH-0005HS-7s
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 06:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jqDrD-0004YG-A2; Tue, 30 Jun 2020 06:51:19 -0400
Received: from charlie.dont.surf ([128.199.63.193]:47748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jqDrA-0004Lr-5y; Tue, 30 Jun 2020 06:51:18 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 35CC1BF676;
 Tue, 30 Jun 2020 10:51:13 +0000 (UTC)
Date: Tue, 30 Jun 2020 12:51:09 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 3/4] hw/block/nvme: Fix pmrmsc register size
Message-ID: <20200630105109.krkk5h4jjoiunknt@apples.localdomain>
References: <20200630103739.9715-1-philmd@redhat.com>
 <20200630103739.9715-4-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200630103739.9715-4-philmd@redhat.com>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 04:46:49
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jun 30 12:37, Philippe Mathieu-Daudé wrote:
> The Persistent Memory Region Controller Memory Space Control
> register is 64-bit wide. See 'Figure 68: Register Definition'
> of the 'NVM Express Base Specification Revision 1.4'.
> 
> Fixes: 6cf9413229 ("introduce PMR support from NVMe 1.4 spec")
> Reported-by: Klaus Jensen <its@irrelevant.dk>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

(if possible, please change the Reported-by to my Samsung address)

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

> ---
> Cc: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
> Cc: Keith Busch <kbusch@kernel.org>
> ---
>  include/block/nvme.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index 71c5681912..82c384614a 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -21,7 +21,7 @@ typedef struct QEMU_PACKED NvmeBar {
>      uint32_t    pmrsts;
>      uint32_t    pmrebs;
>      uint32_t    pmrswtp;
> -    uint32_t    pmrmsc;
> +    uint64_t    pmrmsc;
>  } NvmeBar;
>  
>  enum NvmeCapShift {
> -- 
> 2.21.3
> 
> 

