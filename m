Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAEB62EFD0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 09:43:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovwxI-0005N4-Nu; Fri, 18 Nov 2022 03:42:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ovwxG-0005Ml-T8
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 03:42:34 -0500
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ovwxE-0000Jh-K4
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 03:42:34 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.68])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id BFF3123A09;
 Fri, 18 Nov 2022 08:42:28 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 18 Nov
 2022 09:42:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0051179fcd6-96a9-4159-bdae-9fe5b17692a9,
 4F902188D8BE41AB548CD4542CCC6124F715487A) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Fri, 18 Nov 2022 09:42:26 +0100
From: Greg Kurz <groug@kaod.org>
To: Bin Meng <bin.meng@windriver.com>
CC: <qemu-devel@nongnu.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 <qemu-trivial@nongnu.org>
Subject: Re: [PATCH v2 02/19] hw/9pfs: Drop unnecessary *xattr wrapper API
 declarations
Message-ID: <20221118094226.245d4667@bahia>
In-Reply-To: <20221111042225.1115931-3-bin.meng@windriver.com>
References: <20221111042225.1115931-1-bin.meng@windriver.com>
 <20221111042225.1115931-3-bin.meng@windriver.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 7c3c2b86-fbd6-4917-b368-fd538b4038d9
X-Ovh-Tracer-Id: 5004625088793647584
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeelgdduvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeekjedtveegkeeileffvdetvddvgedtudduiefghffhgfdvhfegjeetkeehfeeknecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoghhrohhugheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsihhnrdhmvghnghesfihinhgurhhivhgvrhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhupghoshhssegtrhhuuggvsgihthgvrdgtohhmpdhqvghmuhdqthhrihhvihgrlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.121.110; envelope-from=groug@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 11 Nov 2022 12:22:08 +0800
Bin Meng <bin.meng@windriver.com> wrote:

> These are not used anywhere in the source tree. Drop them.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 

This one could even go through the trivial tree right
away IMHO.

Reviewed-by: Greg Kurz <groug@kaod.org>

> (no changes since v1)
> 
>  hw/9pfs/9p-util.h | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> index c3526144c9..ccfc8b1cb3 100644
> --- a/hw/9pfs/9p-util.h
> +++ b/hw/9pfs/9p-util.h
> @@ -90,19 +90,8 @@ static inline int errno_to_dotl(int err) {
>  
>  #ifdef CONFIG_DARWIN
>  #define qemu_fgetxattr(...) fgetxattr(__VA_ARGS__, 0, 0)
> -#define qemu_lgetxattr(...) getxattr(__VA_ARGS__, 0, XATTR_NOFOLLOW)
> -#define qemu_llistxattr(...) listxattr(__VA_ARGS__, XATTR_NOFOLLOW)
> -#define qemu_lremovexattr(...) removexattr(__VA_ARGS__, XATTR_NOFOLLOW)
> -static inline int qemu_lsetxattr(const char *path, const char *name,
> -                                 const void *value, size_t size, int flags) {
> -    return setxattr(path, name, value, size, 0, flags | XATTR_NOFOLLOW);
> -}
>  #else
>  #define qemu_fgetxattr fgetxattr
> -#define qemu_lgetxattr lgetxattr
> -#define qemu_llistxattr llistxattr
> -#define qemu_lremovexattr lremovexattr
> -#define qemu_lsetxattr lsetxattr
>  #endif
>  
>  static inline void close_preserve_errno(int fd)


