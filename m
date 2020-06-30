Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6A320F30E
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 12:48:48 +0200 (CEST)
Received: from localhost ([::1]:53956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqDol-0001vt-I7
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 06:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jqDnR-0000dZ-Lo; Tue, 30 Jun 2020 06:47:27 -0400
Received: from charlie.dont.surf ([128.199.63.193]:47736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jqDnP-0003kx-2D; Tue, 30 Jun 2020 06:47:25 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id D8714BF676;
 Tue, 30 Jun 2020 10:47:20 +0000 (UTC)
Date: Tue, 30 Jun 2020 12:47:17 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 1/4] hw/block/nvme: Update specification URL
Message-ID: <20200630104717.xy6l7tepgsuphwnd@apples.localdomain>
References: <20200630103739.9715-1-philmd@redhat.com>
 <20200630103739.9715-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200630103739.9715-2-philmd@redhat.com>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 04:46:49
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
> At some point the URL changed, update it to avoid other
> developers to search for it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

> ---
>  hw/block/nvme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 1aee042d4c..6628d0a4ba 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -11,7 +11,7 @@
>  /**
>   * Reference Specs: http://www.nvmexpress.org, 1.2, 1.1, 1.0e
>   *
> - *  http://www.nvmexpress.org/resources/
> + *  https://nvmexpress.org/developers/nvme-specification/
>   */
>  
>  /**
> -- 
> 2.21.3
> 
> 

