Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CE31327D8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 14:38:33 +0100 (CET)
Received: from localhost ([::1]:48828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iop43-0006kw-GM
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 08:38:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52410)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qemu_oss@crudebyte.com>) id 1ionke-0007Vo-JK
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:14:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <qemu_oss@crudebyte.com>) id 1ionkd-0002QS-FG
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:14:24 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:39153)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ionkd-0002PW-42; Tue, 07 Jan 2020 07:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=kHnAvQb+bCtckqXNHiGqjg1vnZNiazUuQfZqot5vWfA=; b=nIwShGu8c7igOKSk1LqI38kgAn
 MRFEuaHoKlXlOsIAWGht4vXcuUHplGSq/UWrTmg9tlx1r1Wq7PU6yqQcYv91uhmXAgsN8ZQ78XWeF
 4XTlLmUWdNX3Ohztk8s4kWkkxOtyo8lC5up6Zwr/dJlY7g5JGYqxI1MYKtzxocr+8Ft5d43ZdsV22
 sDBHLmIREZqr6jFOFxvogTbyxANvYuq3YF94ODACU/bHQKQMkD19fYZ1DG4NzRXQi+zGfyP4VKdnc
 SMEqEjtQQSOn+sutTffft2jDZQFLmeACN0Gz+RYNO5RZKQlgnGqjVPXPJ/0S/r+FSYPus6Ns/gcQt
 REoRo8XxYbjjMQH5/hKI9mfkHgMWjti3Tl70/LqH+z/Mgarp47Wtj6PgfkhpwzRrkCG9VmQhwpCpZ
 lonqUQxL9Jtw9e2wDOWMkUK/FJxVgWj/jFeL1vn2IFooV+RQeLHHCBnHS0lLzRUo3nWNcGQzF0tMK
 oClP/yApl42w4x/Ke6e6kQ3jfVkSlpSNLx/o3SRAxXbHAkeEimCbwQhG/7RplsmuAquHXduz/PmbB
 /FWO1uNUW0TamNDdP3GpXOmbYMMR3CvrvmOzNXj7R80H3hUAJHLt8AEVhs24hvDJElmocAC8RbHzo
 M1cSqOn36BfZdAxmQv9fF+1eeYCynm6QPdS4aomXM=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-trivial@nongnu.org,
 Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v1 45/59] 9pfs/9p.c: remove unneeded labels
Date: Tue, 07 Jan 2020 13:14:20 +0100
Message-ID: <13045963.Gd4jlxRJ09@silver>
In-Reply-To: <20200106182425.20312-46-danielhb413@gmail.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-46-danielhb413@gmail.com>
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

On Montag, 6. Januar 2020 19:24:11 CET Daniel Henrique Barboza wrote:
> 'out' label in v9fs_xattr_write() and 'out_nofid' label in
> v9fs_complete_rename() can be replaced by appropriate return
> calls.
> 
> CC: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/9pfs/9p.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 520177f40c..be2beba4cd 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -2464,8 +2464,7 @@ static int v9fs_xattr_write(V9fsState *s, V9fsPDU
> *pdu, V9fsFidState *fidp,
> 
> 
>      if (fidp->fs.xattr.len < off) {
> -        err = -ENOSPC;
> -        goto out;
> +        return -ENOSPC;
>      }
>      write_count = fidp->fs.xattr.len - off;
>      if (write_count > count) {
> @@ -2491,7 +2490,7 @@ static int v9fs_xattr_write(V9fsState *s, V9fsPDU
> *pdu, V9fsFidState *fidp, off += to_copy;
>          write_count -= to_copy;
>      }
> -out:
> +
>      return err;
>  }
> 
> @@ -3056,8 +3055,7 @@ static int coroutine_fn v9fs_complete_rename(V9fsPDU
> *pdu, V9fsFidState *fidp, if (newdirfid != -1) {
>          dirfidp = get_fid(pdu, newdirfid);
>          if (dirfidp == NULL) {
> -            err = -ENOENT;
> -            goto out_nofid;
> +            return -ENOENT;
>          }
>          if (fidp->fid_type != P9_FID_NONE) {
>              err = -EINVAL;
> @@ -3100,7 +3098,6 @@ out:
>          put_fid(pdu, dirfidp);
>      }
>      v9fs_path_free(&new_path);
> -out_nofid:
>      return err;
>  }

Same as with patch 44: IMO not any improvement, but also not any behaviour 
change at least. So it's up to you Greg.

Best regards,
Christian Schoenebeck



