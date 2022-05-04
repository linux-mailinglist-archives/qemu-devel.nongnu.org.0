Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABA451ABEF
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 19:56:06 +0200 (CEST)
Received: from localhost ([::1]:49656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmJEL-0000sh-Ld
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 13:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nmIuy-0006ef-6V
 for qemu-devel@nongnu.org; Wed, 04 May 2022 13:36:04 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:58179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nmIuv-0004ww-Pf
 for qemu-devel@nongnu.org; Wed, 04 May 2022 13:36:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=dOzk+KmBvTHfKhRRNKLsoY/ZtQXcDeF+CwxevkF0zrw=; b=Z6DDNzbNKvP4GMJzMRGqua0i59
 LMGwtgTPCrDQyI7nhCDh87F8+/g1zQkP0qm45p+TcMYuSnJSAYOTbpp+0MvJh6S4NfzjfMUK4FML+
 2y9S5BXUNBm2lUZBIj9o5TFPwBbzHGkkcVCACDFSihQmynG/BTPmPolO5TdBmSnIc388DPya6uyXS
 KLwDxt0Lpq5q+DTYOgmS4/jxJ3s5/2f+MgCQ4sLBhCst1R321Lu/TybTCApmyAUd0aemJM3eJyRk2
 EeQru4FGq7j+kGeTfDmAuZrJ/6Jn/E9TKklNDw+FDo6PppQUIYB0BQjygCw5bytxcM7Frr9PyL4zo
 HS+2gHBk9YPoHpMCj6ijKsbiYidc8WRrVEe0VgGaOHXrfCdcsebRDY+05Y38ANdtgoQgkpTTeNEqd
 cOX2hI8GwoPyU0ybgFLj/wWhlUKaOzNUjWbgO23baVsU+Pl6gCyZker//9k0nvF57tl7jA/ORFHG8
 PvVc/9LpX2jmABAN0xdCL239wFFI9K+fLP+vm9q4SA6Qikpys7cRNsYNRK7bvsJaLANrvKdYvwWSE
 mf4wkQo4nMK96qyi9XPsaikJ/oyr8b0mFakbluQ8IDbrnKijK38EzSY0gITDj64f4ppF0ERxk+YnI
 ro4GAAhsg+68/3NqPP3exw8Cv/eSzgrXp5SwPJA4w=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Bin Meng <bin.meng@windriver.com>,
 Guohuai Shi <guohuai.shi@windriver.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 4/9] fsdev: Add missing definitions for Windows in
 file-op-9p.h
Date: Wed, 04 May 2022 19:35:57 +0200
Message-ID: <14881555.QTHmst5ePb@silver>
In-Reply-To: <20220425142705.2099270-5-bmeng.cn@gmail.com>
References: <20220425142705.2099270-1-bmeng.cn@gmail.com>
 <20220425142705.2099270-5-bmeng.cn@gmail.com>
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

On Montag, 25. April 2022 16:27:00 CEST Bin Meng wrote:
> From: Guohuai Shi <guohuai.shi@windriver.com>
> 
> Add uid_t, gid_t and struct statfs definitions, which are currently
> missing from Windows headers, but are required when we add 9p file
> system support for Windows in later patches.
> 
> Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  fsdev/file-op-9p.h | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
> index 4997677460..7d9a736b66 100644
> --- a/fsdev/file-op-9p.h
> +++ b/fsdev/file-op-9p.h
> @@ -27,6 +27,39 @@
>  # include <sys/mount.h>
>  #endif
> 
> +#ifdef CONFIG_WIN32
> +
> +/* POSIX structure not defined in Windows */
> +
> +typedef uint32_t uid_t;
> +typedef uint32_t gid_t;
> +
> +/* from http://man7.org/linux/man-pages/man2/statfs.2.html */
> +typedef uint32_t __fsword_t;
> +typedef uint32_t fsblkcnt_t;
> +typedef uint32_t fsfilcnt_t;
> +
> +/* from linux/include/uapi/asm-generic/posix_types.h */
> +typedef struct {
> +    long __val[2];
> +} fsid_t;
> +
> +struct statfs {
> +    __fsword_t f_type;
> +    __fsword_t f_bsize;
> +    fsblkcnt_t f_blocks;
> +    fsblkcnt_t f_bfree;
> +    fsblkcnt_t f_bavail;
> +    fsfilcnt_t f_files;
> +    fsfilcnt_t f_ffree;
> +    fsid_t f_fsid;
> +    __fsword_t f_namelen;
> +    __fsword_t f_frsize;
> +    __fsword_t f_flags;
> +};
> +
> +#endif /* CONFIG_WIN32 */
> +
>  #define SM_LOCAL_MODE_BITS    0600
>  #define SM_LOCAL_DIR_MODE_BITS    0700

I don't think this header file is the right place to add these missing POSIX 
types. I would add them to 9p-util-windows.h or something like that.

Best regards,
Christian Schoenebeck



