Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A686223A0
	for <lists+qemu-devel@lfdr.de>; Sat, 18 May 2019 16:23:08 +0200 (CEST)
Received: from localhost ([127.0.0.1]:34810 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hS0Et-0002tc-G9
	for lists+qemu-devel@lfdr.de; Sat, 18 May 2019 10:23:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1hS0Cn-0001oM-A7
	for qemu-devel@nongnu.org; Sat, 18 May 2019 10:20:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1hS0Cm-00076A-DZ
	for qemu-devel@nongnu.org; Sat, 18 May 2019 10:20:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51996)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1hS0Cm-00075g-7w; Sat, 18 May 2019 10:20:56 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D24D3082141;
	Sat, 18 May 2019 14:20:55 +0000 (UTC)
Received: from x1.home (ovpn-117-92.phx2.redhat.com [10.3.117.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97B5A59142;
	Sat, 18 May 2019 14:20:52 +0000 (UTC)
Date: Sat, 18 May 2019 08:20:52 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Li Qiang <liq3ea@163.com>
Message-ID: <20190518082052.4e9884d1@x1.home>
In-Reply-To: <20190518032811.60341-3-liq3ea@163.com>
References: <20190518032811.60341-1-liq3ea@163.com>
	<20190518032811.60341-3-liq3ea@163.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Sat, 18 May 2019 14:20:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/4] vfio: platform: fix a typo
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, qemu-trivial@nongnu.org, liq3ea@gmail.com,
	qemu-devel@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 17 May 2019 20:28:10 -0700
Li Qiang <liq3ea@163.com> wrote:

An actual trivial patch, but it could still use a commit message.

> CC: qemu-trivial@nongnu.org
> Signed-off-by: Li Qiang <liq3ea@163.com>
> ---
>  hw/vfio/platform.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
> index e59a0234dd..d52d6552e0 100644
> --- a/hw/vfio/platform.c
> +++ b/hw/vfio/platform.c
> @@ -72,7 +72,7 @@ static VFIOINTp *vfio_init_intp(VFIODevice *vbasedev,
>          g_free(intp->interrupt);
>          g_free(intp);
>          error_setg_errno(errp, -ret,
> -                         "failed to initialize trigger eventd notifier");
> +                         "failed to initialize trigger eventfd notifier");
>          return NULL;
>      }
>      if (vfio_irq_is_automasked(intp)) {
> @@ -84,7 +84,7 @@ static VFIOINTp *vfio_init_intp(VFIODevice *vbasedev,
>              g_free(intp->unmask);
>              g_free(intp);
>              error_setg_errno(errp, -ret,
> -                             "failed to initialize resample eventd notifier");
> +                             "failed to initialize resample eventfd notifier");
>              return NULL;
>          }
>      }


