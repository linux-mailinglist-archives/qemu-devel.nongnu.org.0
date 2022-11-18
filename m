Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748B162F598
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 14:11:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow190-0005f3-UR; Fri, 18 Nov 2022 08:10:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ow18v-0005dM-A1; Fri, 18 Nov 2022 08:10:55 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ow18t-0006FA-7v; Fri, 18 Nov 2022 08:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=vGd+kttURgQ3h2LaWVbxzIgi02RWvXCs6eru15nrrM8=; b=i1pZ60ti78M9R94dJt0FykV5LF
 AblJekWP98nQ1Bp/kf9VLsI5UVYURPgsSDliizvbv1JEBXarri9ygfV7fzeA9dwht1m1XiKGGnOZf
 bQU5LaWedN+XGekziCbDRhBvCarWZp4JF/Z7z4WwYLz25zT1+YLiYUrZfBl2P9K8adKkpYbW5RknW
 gmqJlKlSMGtNrd4rHTpWPaoxfzYL+o6tOBhy4DgKQZQNOsEiAvHMDJfVTR5gv20E6fWKP8peD3XjH
 PJ2oiRi33dGHTb4jB4CYGC0uxL5YlNxIcTwa/gt4Nsov3qENSzGIRo4rTQfmnZ8Fl49VbXbXzCCO8
 lLYWEwJ6AB1MzbgRKDZMvDDooGYUeKge6wba//7/LCrpS50/Yp47RHyn8i1Fc1Ppa4TjbeTG6dbbs
 htiRAvtZCZ2TW/KCNC891xA6ZrjggZXwlV6qeBNORCTIqXYEUI2i1JJf6I6BbqbIjgP4iCMDY5nje
 m8x8t97ahq+MJpPEqGDg64wmCVZ/S1PlA9zrrVg0DuoimUDNaos1/rArQPESOOWloeMS2Ouwn8b2D
 IAhNAIw0AKv+0D7lyIv3sRtpJrfGRb9Pngnbw9fkmNzYWFcBbeKRTCzphHkRXgMvWvkLIsDNc6k8R
 dy5GSk6TDUGRGsvysKJEBs8hC31uds3IsU+rxm0UU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 02/19] hw/9pfs: Drop unnecessary *xattr wrapper API
 declarations
Date: Fri, 18 Nov 2022 14:10:46 +0100
Message-ID: <2297121.quG6T8svdv@silver>
In-Reply-To: <20221118094226.245d4667@bahia>
References: <20221111042225.1115931-1-bin.meng@windriver.com>
 <20221111042225.1115931-3-bin.meng@windriver.com>
 <20221118094226.245d4667@bahia>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Friday, November 18, 2022 9:42:26 AM CET Greg Kurz wrote:
> On Fri, 11 Nov 2022 12:22:08 +0800
> Bin Meng <bin.meng@windriver.com> wrote:
> 
> > These are not used anywhere in the source tree. Drop them.
> > 
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> > 
> 
> This one could even go through the trivial tree right
> away IMHO.

+1

> Reviewed-by: Greg Kurz <groug@kaod.org>
> 
> > (no changes since v1)
> > 
> >  hw/9pfs/9p-util.h | 11 -----------
> >  1 file changed, 11 deletions(-)
> > 
> > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> > index c3526144c9..ccfc8b1cb3 100644
> > --- a/hw/9pfs/9p-util.h
> > +++ b/hw/9pfs/9p-util.h
> > @@ -90,19 +90,8 @@ static inline int errno_to_dotl(int err) {
> >  
> >  #ifdef CONFIG_DARWIN
> >  #define qemu_fgetxattr(...) fgetxattr(__VA_ARGS__, 0, 0)
> > -#define qemu_lgetxattr(...) getxattr(__VA_ARGS__, 0, XATTR_NOFOLLOW)
> > -#define qemu_llistxattr(...) listxattr(__VA_ARGS__, XATTR_NOFOLLOW)
> > -#define qemu_lremovexattr(...) removexattr(__VA_ARGS__, XATTR_NOFOLLOW)
> > -static inline int qemu_lsetxattr(const char *path, const char *name,
> > -                                 const void *value, size_t size, int 
flags) {
> > -    return setxattr(path, name, value, size, 0, flags | XATTR_NOFOLLOW);
> > -}
> >  #else
> >  #define qemu_fgetxattr fgetxattr
> > -#define qemu_lgetxattr lgetxattr
> > -#define qemu_llistxattr llistxattr
> > -#define qemu_lremovexattr lremovexattr
> > -#define qemu_lsetxattr lsetxattr
> >  #endif
> >  
> >  static inline void close_preserve_errno(int fd)
> 
> 
> 



