Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A075013263F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 13:35:42 +0100 (CET)
Received: from localhost ([::1]:47864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioo5E-0002aB-Ll
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 07:35:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49481)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qemu_oss@crudebyte.com>) id 1ionaz-0007q7-HE
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:04:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <qemu_oss@crudebyte.com>) id 1ionay-00055U-5L
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:04:25 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:48767)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ionax-00054a-Nt; Tue, 07 Jan 2020 07:04:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=qwn+YflkmXMzVdg/qc9WtGHPelcy3T8p1Ct687icdtw=; b=NuycvI0YnEne/Wj+tZooHDrbWg
 JHMW0BaIv740ddVqahQ3sS1gatgoUCAWddwjykSoKshHm5WXKNG5BKjrsg8AesZkDr/RprHL25mlq
 pHklX4UbONXGqPm5OyAI3aj7JbkQFGQWYmxHKpoKb0rY76OweZUgOyUBEGl6h47ivI/WsLXTgZV/x
 b7WklDH/AWw3kX1EAQMMfI4kJhakOyl2xCU4GzpQWyRdzi4d/MZHYekgWErZ8gUMPcFs6kjXIWzqv
 iZw69OoU9nxD1uVwF+bGzwD3uQh08urYBjENMxS6Fz4d0ZDq1SGzcTcKbwmb49A9ut/4mt87BQnS7
 2Eul54CS+GOc/IeTIzsYANtvwvMSLYyRWp+AD+NSv5Sqmz/9/vtXmtN8LsVCGi1uMRvfkpbOJ8nft
 drl1VZOvOBSBIU8D31AfV592qx02K1R4SR4mEtAcgYlvkYpfs0AIAleTYIAkZHfbyE4rhZMnNq7Ba
 HwxuclEA/BqQfW1d37c+1NFBkBabvilMgl56PEa71uhtzeJDrMKF0O8Hh3EgWOMA0hDKPMJlcpsms
 vZvJYaSPoOlHdXlSlbcTPV6g6Q7z6NGiagC9CUEssXczxx0XupmU1EmmuJRFz2l0oWAuohuM2UP7N
 mF2+27EZiRPxTZEa2Feuo/ROtrnzuqdazG5WpmlHI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-trivial@nongnu.org,
 Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v1 44/59] 9p-local.c: remove unneeded label in
 local_unlinkat_common()
Date: Tue, 07 Jan 2020 13:04:20 +0100
Message-ID: <16442994.pYkbpd2YfT@silver>
In-Reply-To: <20200106182425.20312-45-danielhb413@gmail.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-45-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.189.157.229
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 6. Januar 2020 19:24:10 CET Daniel Henrique Barboza wrote:
> 'err_out' can be replaced by 'return ret' in the error conditions
> the jump was being made.
> 
> CC: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/9pfs/9p-local.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> index ca641390fb..f9bdd2ad7c 100644
> --- a/hw/9pfs/9p-local.c
> +++ b/hw/9pfs/9p-local.c
> @@ -1094,12 +1094,12 @@ static int local_unlinkat_common(FsContext *ctx, int
> dirfd, const char *name,
> 
>              fd = openat_dir(dirfd, name);
>              if (fd == -1) {
> -                goto err_out;
> +                return ret;
>              }
>              ret = unlinkat(fd, VIRTFS_META_DIR, AT_REMOVEDIR);
>              close_preserve_errno(fd);
>              if (ret < 0 && errno != ENOENT) {
> -                goto err_out;
> +                return ret;
>              }
>          }
>          map_dirfd = openat_dir(dirfd, VIRTFS_META_DIR);
> @@ -1107,16 +1107,14 @@ static int local_unlinkat_common(FsContext *ctx, int
> dirfd, const char *name, ret = unlinkat(map_dirfd, name, 0);
>              close_preserve_errno(map_dirfd);
>              if (ret < 0 && errno != ENOENT) {
> -                goto err_out;
> +                return ret;
>              }
>          } else if (errno != ENOENT) {
> -            goto err_out;
> +            return ret;
>          }
>      }
> 
> -    ret = unlinkat(dirfd, name, flags);
> -err_out:
> -    return ret;
> +    return unlinkat(dirfd, name, flags);
>  }
> 
>  static int local_remove(FsContext *ctx, const char *path)

Well, personally I don't see any improvement by these changes. It probably 
makes the code slightly more elegant, but IMO not more readable. And return 
constructed functions vs. jump to label constructed functions are more likely 
to gather missing-cleanup bugs.

At least this patch does not cause any behaviour change, so I leave that up to 
you Greg to decide. ;-)

Best regards,
Christian Schoenebeck



