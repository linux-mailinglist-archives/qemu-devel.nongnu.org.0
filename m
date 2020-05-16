Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EC71D6089
	for <lists+qemu-devel@lfdr.de>; Sat, 16 May 2020 13:32:09 +0200 (CEST)
Received: from localhost ([::1]:37166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZv31-00009Z-TZ
	for lists+qemu-devel@lfdr.de; Sat, 16 May 2020 07:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1jZv1i-0007no-9y
 for qemu-devel@nongnu.org; Sat, 16 May 2020 07:30:46 -0400
Received: from 14.mo7.mail-out.ovh.net ([178.33.251.19]:33132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1jZv1h-0007pX-8t
 for qemu-devel@nongnu.org; Sat, 16 May 2020 07:30:45 -0400
Received: from player763.ha.ovh.net (unknown [10.108.35.74])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id E68E21632FF
 for <qemu-devel@nongnu.org>; Sat, 16 May 2020 13:30:33 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player763.ha.ovh.net (Postfix) with ESMTPSA id F16F8126A8418;
 Sat, 16 May 2020 11:30:29 +0000 (UTC)
Date: Sat, 16 May 2020 13:30:23 +0200
From: Greg Kurz <groug@kaod.org>
To: Dan Robertson <dan@dlrobertson.com>
Subject: Re: [PATCH 1/1] 9pfs: include linux/limits.h for XATTR_SIZE_MAX
Message-ID: <20200516133023.55492cfe@bahia.lan>
In-Reply-To: <20200515203015.7090-2-dan@dlrobertson.com>
References: <20200515203015.7090-1-dan@dlrobertson.com>
 <20200515203015.7090-2-dan@dlrobertson.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 14904944445331970542
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddttddggedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheekhfdtheegheehjeeludefkefhvdelfedvieehhfekhfdufffhueeuvdfftdfhnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejieefrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.33.251.19; envelope-from=groug@kaod.org;
 helo=14.mo7.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/16 07:30:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 May 2020 20:30:15 +0000
Dan Robertson <dan@dlrobertson.com> wrote:

> linux/limits.h should be included for the XATTR_SIZE_MAX definition used
> by v9fs_xattrcreate.
> 
> Signed-off-by: Dan Robertson <dan@dlrobertson.com>
> ---

Applied to 9p-next with R-b and Fixes tags, thanks.

>  hw/9pfs/9p.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index a2a14b5979..68c2df7333 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -28,6 +28,7 @@
>  #include "sysemu/qtest.h"
>  #include "qemu/xxhash.h"
>  #include <math.h>
> +#include <linux/limits.h>
>  
>  int open_fd_hw;
>  int total_open_fd;
> 


