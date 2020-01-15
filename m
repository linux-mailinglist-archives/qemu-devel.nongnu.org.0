Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD85B13BA60
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 08:33:54 +0100 (CET)
Received: from localhost ([::1]:50582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irdBZ-0001T7-GN
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 02:33:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39942)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1irdAk-0000rq-CZ
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 02:33:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1irdAj-0003KL-As
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 02:33:02 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42325)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1irdAj-0003II-4d; Wed, 15 Jan 2020 02:33:01 -0500
Received: by mail-wr1-x444.google.com with SMTP id q6so14611039wro.9;
 Tue, 14 Jan 2020 23:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EmlYP6JFqaB3KfgtKG/1eF1x8uMpvsmyEQ2q2iBcfEE=;
 b=pUPbkl18Jszianu250rZcIPl2hwBRqoTSJ5MIbQv9hKRMucADtyYROebIVF5bMIxrw
 0e8xWx/Q9Oxrps1gfHbfzg37PM7zJpb4ZtvC4ABsETFKpA1o0RQLexdGVFKKOwEa55km
 98G+JRvyyyaWkOTXSBXQa4qNwoDoprrT9VBqMLJBGedcP7OV+S2YtwI8G7UoieqdIPLm
 8KLxA78Kjy/n585B2/a2xQZwjC3JaJDJ0gLzR2VWUN79fPNd1r19FGXIQGumbn+hrejU
 etDdSVpwrOOJx288xLybiu9t66PF/rSHOZr7r3mfFnI+ll3/CRxIaa/RhWAD57yjvROs
 Luxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EmlYP6JFqaB3KfgtKG/1eF1x8uMpvsmyEQ2q2iBcfEE=;
 b=FFvfHwA4vxWaY5ySl8Kk1WAsuo0W/ZxxWz1eq77ih57dCr5RD/2zeQPiiYkIwP20zY
 FNS09r0bq9iYA4zt2SN6dsrUlPLadiagny45p2gC0faZYePPMb7QGJBg1pZ66efF9PPR
 BY8Cj3ytW87I0aYp8nY+cByfT2pX62DYz4xdOAi570BvzM2hgK1i/WrOEDNfI0KpmmtG
 njLED38rWpx/rFkt/ptlyDdf3Y+8x6mWnQ8U0CVljQd1jJf5jc2swFfXvyv8osTcw4Iv
 ls0WNO5QawxpvK0A/xi39REU2VfLdyIOfFEO/9llB7ezqkJaSnluqQ2C9FKL54uEjGTi
 Xs0Q==
X-Gm-Message-State: APjAAAU2eQZV+M8VQtowqRIKMukKNKVYVlKvMj7pyi2ra0vI5iZ8P3wN
 kz/OCBPSJ105eYebYBk3Bw+KhpvqrqHYlfD9bf4=
X-Google-Smtp-Source: APXvYqzpeBG+h/oCV+Ecw7cfsGkQ3ULXqyhiVtgfFFqRMkLhMO7eV/Vk0x2zEq+LLyTYX54qxtVbJkkG8suwObVdoNw=
X-Received: by 2002:adf:f10a:: with SMTP id r10mr29633490wro.202.1579073579323; 
 Tue, 14 Jan 2020 23:32:59 -0800 (PST)
MIME-Version: 1.0
References: <20200115072016.167252-1-kuhn.chenqun@huawei.com>
In-Reply-To: <20200115072016.167252-1-kuhn.chenqun@huawei.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 15 Jan 2020 11:32:47 +0400
Message-ID: <CAJ+F1CJfTobGjTJm3nqdqJeh0fnHBs7dbucrq6m7otuMXYd=yg@mail.gmail.com>
Subject: Re: [PATCH] monitor: fix memory leak in
 monitor_fdset_dup_fd_find_remove
To: kuhn.chenqun@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: qemu trival <qemu-trivial@nongnu.org>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 15, 2020 at 11:21 AM <kuhn.chenqun@huawei.com> wrote:
>
> From: Chen Qun <kuhn.chenqun@huawei.com>
>
> When remove dup_fd in monitor_fdset_dup_fd_find_remove function,
> we need to free mon_fdset_fd_dup. ASAN shows memory leak stack:
>
> Direct leak of 96 byte(s) in 3 object(s) allocated from:
>     #0 0xfffd37b033b3 in __interceptor_calloc (/lib64/libasan.so.4+0xd33b=
3)
>     #1 0xfffd375c71cb in g_malloc0 (/lib64/libglib-2.0.so.0+0x571cb)
>     #2 0xaaae25bf1c17 in monitor_fdset_dup_fd_add /qemu/monitor/misc.c:17=
24
>     #3 0xaaae265cfd8f in qemu_open /qemu/util/osdep.c:315
>     #4 0xaaae264e2b2b in qmp_chardev_open_file_source /qemu/chardev/char-=
fd.c:122
>     #5 0xaaae264e47cf in qmp_chardev_open_file /qemu/chardev/char-file.c:=
81
>     #6 0xaaae264e118b in qemu_char_open /qemu/chardev/char.c:237
>     #7 0xaaae264e118b in qemu_chardev_new /qemu/chardev/char.c:964
>     #8 0xaaae264e1543 in qemu_chr_new_from_opts /qemu/chardev/char.c:680
>     #9 0xaaae25e12e0f in chardev_init_func /qemu/vl.c:2083
>     #10 0xaaae26603823 in qemu_opts_foreach /qemu/util/qemu-option.c:1170
>     #11 0xaaae258c9787 in main /qemu/vl.c:4089
>     #12 0xfffd35b80b9f in __libc_start_main (/lib64/libc.so.6+0x20b9f)
>     #13 0xaaae258d7b63  (/qemu/build/aarch64-softmmu/qemu-system-aarch64+=
0x8b7b63)
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  monitor/misc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/monitor/misc.c b/monitor/misc.c
> index a04d7edde0..cf79d36100 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -1744,6 +1744,7 @@ static int64_t monitor_fdset_dup_fd_find_remove(int=
 dup_fd, bool remove)
>              if (mon_fdset_fd_dup->fd =3D=3D dup_fd) {
>                  if (remove) {
>                      QLIST_REMOVE(mon_fdset_fd_dup, next);
> +                    g_free(mon_fdset_fd_dup);
>                      if (QLIST_EMPTY(&mon_fdset->dup_fds)) {
>                          monitor_fdset_cleanup(mon_fdset);
>                      }
> --
> 2.23.0
>
>
>


--=20
Marc-Andr=C3=A9 Lureau

