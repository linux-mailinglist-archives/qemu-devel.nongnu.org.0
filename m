Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AF63BE6E0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 13:07:00 +0200 (CEST)
Received: from localhost ([::1]:54246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15ON-0006Eg-Et
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 07:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <denniswoelfing@gmx.de>)
 id 1m15KP-0007aF-Vw
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:02:54 -0400
Received: from mout.gmx.net ([212.227.15.15]:36999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <denniswoelfing@gmx.de>)
 id 1m15KE-0003Cs-6k
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1625655756;
 bh=7E/KpRMhlS7a13XKEdSo4vVYrig22uAxisnFUh18KQ8=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=KrQNM5bqWaxsrje7Kwb1zLNrOPWQHV3RrJ9zreAcS/lKD5A2aA/LfWxw9+4nGA7nX
 gUvV3GKga4MHufdSBsst5ZMWzBaBrUc3DfwcXD9qNIZlS67fvmz0kY7mIAG/sCv7nW
 pwCJhmS70gTB8fJLNHCGgxSKkW/0qCy1qH5cIHxA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.188.43] ([88.130.62.247]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MacSe-1lUUas2oFm-00c7w1; Wed, 07
 Jul 2021 13:02:36 +0200
Subject: Re: [PATCH] ui/gtk: Fix relative mouse with multiple monitors
To: qemu-devel@nongnu.org
References: <20210629132410.286813-1-denniswoelfing@gmx.de>
From: =?UTF-8?Q?Dennis_W=c3=b6lfing?= <denniswoelfing@gmx.de>
Message-ID: <e8a8fece-0d18-d055-e637-fe988db854c5@gmx.de>
Date: Wed, 7 Jul 2021 13:02:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629132410.286813-1-denniswoelfing@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:K1QCMp2bosdDNoPHPF7Rmg7MU7r6bEZNSSyFG3o2pUS2jvCxHRv
 Re9fixeIFI4GcInyLw/tT2ffMyFOsHtdMkx8ipuP3wtFAavRpBDVV6KRXrLRcfSs8drHNmc
 Itx5kjVOG/BQ5juQQkfC7wyJmWZBAvYvRzNjxBgd9WL/MS7hRjbm4cQ/X0FpxYNIOs9KDMZ
 8nl77q50BY7ZXDFr+tD1w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0iTWZ6xZEpo=:TDluKPfcWIZ4Kh1e2mia4M
 HSCTs03Z/Jy3kJ8j48J9l1BS5Xw2MOgMKfJh/LgmqBZGwyBTqGCRty7ZlWybn15KI9DBVr7eK
 Jm/zpc6Ca8CbUVjddBGC0lapla5p+7MQF/QQsg7AXcsUepozraduSz4WgOzKvfPuH/fX0YXvP
 wZJ3m64qmNCX3jwzUWjf0RV5QDzlIzWlA3eNTROd6ONwAevOn+aLXyklOR7GV+ZjEm2IUHUn9
 N90XDYVrAJ+yYNdpBjzEcMs6xkviHARr5P1oxZ3jJpO0V0ngcoYVeITR8Czkf1wAlleUG9kmS
 X0mnRWp/z+t0jObIgzmoAIWEtEj5LJYqs1+UAEgJ6oV8hllu545Vb6ZvTGl2JdJQ8+OM8uo4E
 31ZQM+Sd36yGxv5nve1NQNB+exNRCJQm+GYea3ZXOkep7ZN4s+aCTOPlIeWOhxOBg8Vk7YlRM
 X8u/I9K4z24oolCyBq3L7FS4FXtcI7wgddjNSpHFrLEKiZc92apF6gC3+WAQGbH5izGxDEUSb
 wKwcxNcKI214k4ruAmUN+0oCnd3hQROT+Ko+nYWsqkfHgNpvxbjaIz+aSfi1HZMJ93q9RdM8N
 pPUxK8dTfmHyv+1Ut8UOZGOd3ZKnK4EAgh1E/OFNkea6BDTO7oNo/u63pHs96olgxnapkgFsS
 vZ3cIx42LpcwrsEVlp1Lsxr/3DlPkSpSVPVj4k5y5WEX79jvYlwMZQ7Qb5E8yRinOQdjhXSAm
 GFz3IXkYnszqGfl/wXg+sAT3UeC3qOzrgtaiTdqoJ8iT/nkGPhRR3FlXx+0EZklGTS1qfG7yW
 dAvJbMscxouy0bxR1WRW+L8X7xH5bG5lWmUGrMQ4zYAtlzxVLf6niWdY6r0MTEX7YJrBtAFal
 n29BVLAr/9mBTKrMU4Nvo/cd8L3iVUsXTRbLzregiEwwHBo3fx6A6suZZGLedlRlcF9vQhpgi
 XFqciRdFydk/2QMZzq5T3x7W2jHvaqS3YHDAlYPu2C8Qyjlv1eQl6H8T+BrMSfkr5mYM70iNf
 ALA1v+m2mZSsxl8kT6okRU8ewv3E6WBdMSQqezcxQkVVcAKycpxaKW9Pj4ZxnEgfZ69epNu+Z
 xSES3nOhL2OTdBxb7wsHCgPtZFpT4wwh3iT/7AcrL1t7A5uU5IiYNErwQCa7PW3Igq/WTfbUQ
 hYESU=
Received-SPF: pass client-ip=212.227.15.15; envelope-from=denniswoelfing@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping
https://lore.kernel.org/qemu-devel/20210629132410.286813-1-denniswoelfing@=
gmx.de

On 29.06.21 15:24, Dennis W=C3=B6lfing wrote:
> To handle relative mouse input the event handler needs to move the mouse
> away from the screen edges. Failing to do so results in the mouse
> getting stuck at invisible walls. However the current implementation for
> this is broken on hosts with multiple monitors.
>
> With multiple monitors the mouse can be located outside of the current
> monitor which is not handled by the current code. Also the monitor
> itself might be located at coordinates different from (0, 0).
>
> Signed-off-by: Dennis W=C3=B6lfing <denniswoelfing@gmx.de>
> ---
>   ui/gtk.c | 21 +++++++++------------
>   1 file changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 98046f577b..5258532b19 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -865,33 +865,30 @@ static gboolean gd_motion_event(GtkWidget *widget,=
 GdkEventMotion *motion,
>           GdkWindow *win =3D gtk_widget_get_window(widget);
>           GdkMonitor *monitor =3D gdk_display_get_monitor_at_window(dpy,=
 win);
>           GdkRectangle geometry;
> -        int screen_width, screen_height;
>
>           int x =3D (int)motion->x_root;
>           int y =3D (int)motion->y_root;
>
>           gdk_monitor_get_geometry(monitor, &geometry);
> -        screen_width =3D geometry.width;
> -        screen_height =3D geometry.height;
>
>           /* In relative mode check to see if client pointer hit
> -         * one of the screen edges, and if so move it back by
> +         * one of the monitor edges, and if so move it back by
>            * 200 pixels. This is important because the pointer
>            * in the server doesn't correspond 1-for-1, and so
>            * may still be only half way across the screen. Without
>            * this warp, the server pointer would thus appear to hit
>            * an invisible wall */
> -        if (x =3D=3D 0) {
> -            x +=3D 200;
> +        if (x <=3D geometry.x) {
> +            x =3D geometry.x + 200;
>           }
> -        if (y =3D=3D 0) {
> -            y +=3D 200;
> +        if (y <=3D geometry.y) {
> +            y =3D geometry.y + 200;
>           }
> -        if (x =3D=3D (screen_width - 1)) {
> -            x -=3D 200;
> +        if (x - geometry.x >=3D (geometry.width - 1)) {
> +            x =3D geometry.x + (geometry.width - 1) - 200;
>           }
> -        if (y =3D=3D (screen_height - 1)) {
> -            y -=3D 200;
> +        if (y - geometry.y >=3D (geometry.height - 1)) {
> +            y =3D geometry.y + (geometry.height - 1) - 200;
>           }
>
>           if (x !=3D (int)motion->x_root || y !=3D (int)motion->y_root) =
{
> --
> 2.32.0
>

