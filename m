Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B97504F48
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 13:10:29 +0200 (CEST)
Received: from localhost ([::1]:51902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngPH1-0000xK-Ow
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 07:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ngPF2-0007tg-2R; Mon, 18 Apr 2022 07:08:25 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:50349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ngPEz-0005t2-EU; Mon, 18 Apr 2022 07:08:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=9ae86JhKlAPHt3HksKkNl2/8wt6yz3nSSEjb4IwdWz8=; b=ZNiilqOBDC3z8xrJoUDehlkB84
 J+8TcULBLaVm/UoG8OfRd4NUxSn6E0azDhW8OlAn11v460FWBgwPhK32B+t0qe4Bhn5d1pMgBAWw9
 gGSRoRCi6dS9cW1QDR0tAIk0YAYbsK10y1Yl1Rmo1PAiygR4j1YLLhU6l4psg4VZi+/YLo1z29wcL
 YDFALbi9RK1hscgYRGgPZMror15KL2gVRVj/gSOQc/ofJmL1+ZIuOaz3vd1XgL8cyysI8H6pmOoo+
 Xb6mYtNvr+gbCte9otAxDhoMpJuLC8/6RtWr2rx3RQKctWRkP/ZxMLTi8yfVrPKAirtrReBLHPy12
 a6tCkjHXUJBG5HTorW5wy8NeTynM4Bdru0OX+O2nWLMTUh5Kk8YiEOO7GrH+gv0vCyBvfIPy7jxHe
 Bu5rlZBOqdntewyN6aASpZPawv7D13PW4O3PdtLjLbBRDSR71iYsPViqpR2awz0Xf9EEtkFh8NeL+
 yvDmjSjg5vXt+pXiUfm3dzWox45Ti6l1lT/yvNjqpW3yFmxl3oC3PN9TvxfJFJAPh5w8wAbrY6rXJ
 XkEOKVyPeb5Rkk+NdGKTMGARUTDiA4PuBYIL1Vm+ZXQ2O3KisFZxohVN2mluSReTGAzv4qWQz5Wys
 waN4Zm1Ja97ZNLWDdLo3QBvNrjDMNqE335Co8hLxA=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-block@nongnu.org, Greg Kurz <groug@kaod.org>,
 malureau@redhat.com, hreitz@redhat.com, stefanha@redhat.com,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 24/26] 9p: add missing coroutine_fn annotations
Date: Mon, 18 Apr 2022 13:08:17 +0200
Message-ID: <15004025.QA3x7dpAkg@silver>
In-Reply-To: <20220415131900.793161-25-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
 <20220415131900.793161-25-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

On Freitag, 15. April 2022 15:18:58 CEST Paolo Bonzini wrote:
> From: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> Acked-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

I would have expected more been missing, anyway ...

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Best regards,
Christian Schoenebeck

>  hw/9pfs/9p.h | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> index 994f952600..a523ac34a9 100644
> --- a/hw/9pfs/9p.h
> +++ b/hw/9pfs/9p.h
> @@ -424,21 +424,24 @@ typedef struct V9fsGetlock
>  extern int open_fd_hw;
>  extern int total_open_fd;
>=20
> -static inline void v9fs_path_write_lock(V9fsState *s)
> +static inline void coroutine_fn
> +v9fs_path_write_lock(V9fsState *s)
>  {
>      if (s->ctx.export_flags & V9FS_PATHNAME_FSCONTEXT) {
>          qemu_co_rwlock_wrlock(&s->rename_lock);
>      }
>  }
>=20
> -static inline void v9fs_path_read_lock(V9fsState *s)
> +static inline void coroutine_fn
> +v9fs_path_read_lock(V9fsState *s)
>  {
>      if (s->ctx.export_flags & V9FS_PATHNAME_FSCONTEXT) {
>          qemu_co_rwlock_rdlock(&s->rename_lock);
>      }
>  }
>=20
> -static inline void v9fs_path_unlock(V9fsState *s)
> +static inline void coroutine_fn
> +v9fs_path_unlock(V9fsState *s)
>  {
>      if (s->ctx.export_flags & V9FS_PATHNAME_FSCONTEXT) {
>          qemu_co_rwlock_unlock(&s->rename_lock);



