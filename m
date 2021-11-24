Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2604B45C919
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 16:45:28 +0100 (CET)
Received: from localhost ([::1]:45892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpuSd-0002q2-9c
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 10:45:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mpuRM-000265-88
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 10:44:09 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:43389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mpuRK-0004Oo-6y
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 10:44:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=k2OFWj8M9PVq413mcPHbmRbnb6Bv2WOV2VgdOW9EE1Q=; b=YYodKEbK7/OjlDE4xKNSuQ2XHu
 HkoTjr3Dy2o5R64HxOBr4w8Zqd5Ml/DC8P6PsN4fe8kcWYMkio3vSXOAKh+uNoJyLUHbW7Of2C4G/
 8zRhjX24mUZc4M8g9NkefBmcV3DE0IH3PuiV4tV5xIXpc9JGETQmPj8L28K6wkicOa24o9PWcNruc
 g84a09WdIktvC+bC1xN0FHmVqr5F6eVQgRkUzoTjW40clNOUwVXP3Fna0zk13vPf9lWVTpmqE8rEj
 Kk6RRhJ93Q087MTOcfBxpFXkgZiC2NOeNAMNjFXYQpu4BUQYMKuHPLCaK81ZhPY0RuD3/FIsw3W0e
 MPo/i79SUMfbzSU4SF8/2Hgt6g661S4c5hV+5YaafBEIV60CFzagXGRLw9iXaiNSc6/ZClM9USGDY
 0iumWJE9/GMS4kQbVyTNM3sQxNmC6ecpL24urfCjvGYbdsFNMG1XrBL1RMIw47LE3zCZFI/6ihTuB
 ECsOeTv39MFI6zp+Vm86HYdM+BQgm+SvaEgsCDpgrXWBfC+vUjxFqhD/HorwfdzsoxruYtMcDDcRB
 Q93IyJm7+YsVmo7xeSxZzImE9bvTzS97MT3bZi+y83OiNEOGm8mV1s2ZIaY+tKVcoq2RgyOcAqCZ0
 1OaIZ/4k/VQbw6X2Fq2kQXvAS/C34YntVoa5sM3dQ=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Keno Fischer <keno@juliacomputing.com>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>
Subject: Re: [PATCH v2 06/11] 9p: darwin: Compatibility defn for XATTR_SIZE_MAX
Date: Wed, 24 Nov 2021 16:44:02 +0100
Message-ID: <1678058.28b0zsHzDf@silver>
In-Reply-To: <20211122004913.20052-7-wwcohen@gmail.com>
References: <20211122004913.20052-1-wwcohen@gmail.com>
 <20211122004913.20052-7-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 22. November 2021 01:49:08 CET Will Cohen wrote:
> From: Keno Fischer <keno@juliacomputing.com>
> 
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> [Will Cohen: - Adjust coding style]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>  hw/9pfs/9p.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index c941b46f60..d671995aa4 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -3943,6 +3943,14 @@ out_nofid:
>      v9fs_string_free(&name);
>  }
> 
> +#if defined(CONFIG_DARWIN) && !defined(XATTR_SIZE_MAX)
> +/*
> + * Darwin doesn't seem to define a maximum xattr size in its user
> + * space header, but looking at the kernel source, HFS supports
> + *  up to INT32_MAX, so use that as the maximum.
> + */
> +#define XATTR_SIZE_MAX INT32_MAX
> +#endif
>  static void coroutine_fn v9fs_xattrcreate(void *opaque)
>  {
>      int flags, rflags = 0;

That would be 2 GB.

v9fs_xattrcreate() [9p.c] calls g_malloc0(size), if that fails it would
terminate QEMU.

I think it would make sense to simply set this to a reasonable small value for
macOS for now as well. The intended supported scenario for 9p currently is
macOS being host and Linux being guest. So the limitations of Linux would
apply anyway ATM.

Once we have macOS guest support, we can still work on a refinement to support
larger attributes IMO.



