Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6A32844B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 18:54:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40661 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTqzZ-0005Vs-Jz
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 12:54:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hTqvU-0002R1-N4
	for qemu-devel@nongnu.org; Thu, 23 May 2019 12:50:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hTqhS-0003ZR-3a
	for qemu-devel@nongnu.org; Thu, 23 May 2019 12:36:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38738)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hTqhR-0003X0-0U; Thu, 23 May 2019 12:36:13 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4866581F35;
	Thu, 23 May 2019 16:36:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-250.ams2.redhat.com
	[10.36.117.250])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1276A5B683;
	Thu, 23 May 2019 16:36:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D8D291138648; Thu, 23 May 2019 18:36:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20190523152250.106717-1-sgarzare@redhat.com>
	<20190523152250.106717-3-sgarzare@redhat.com>
Date: Thu, 23 May 2019 18:36:10 +0200
In-Reply-To: <20190523152250.106717-3-sgarzare@redhat.com> (Stefano
	Garzarella's message of "Thu, 23 May 2019 17:22:49 +0200")
Message-ID: <87tvdlgmbp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 23 May 2019 16:36:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/3] block/file-posix: update .help of
 BLOCK_OPT_PREALLOC option
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
Cc: Kevin Wolf <kwolf@redhat.com>, integration@gluster.org,
	qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefano Garzarella <sgarzare@redhat.com> writes:

> Show 'falloc' among the allowed values of 'preallocation'
> option, only when it is supported (if defined CONFIG_POSIX_FALLOCATE)
>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  block/file-posix.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/block/file-posix.c b/block/file-posix.c
> index d018429672..9632e3a87b 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -2751,7 +2751,11 @@ static QemuOptsList raw_create_opts = {
>          {
>              .name = BLOCK_OPT_PREALLOC,
>              .type = QEMU_OPT_STRING,
> -            .help = "Preallocation mode (allowed values: off, falloc, full)"
> +            .help = "Preallocation mode (allowed values: off"
> +#ifdef CONFIG_POSIX_FALLOCATE
> +                    ", falloc"
> +#endif
> +                    ", full)"
>          },
>          { /* end of list */ }
>      }

Reviewed-by: Markus Armbruster <armbru@redhat.com>

