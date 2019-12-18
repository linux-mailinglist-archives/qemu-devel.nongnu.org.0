Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE0212422F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 09:48:59 +0100 (CET)
Received: from localhost ([::1]:51348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihV0s-0006H8-Kn
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 03:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54393)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ihUzj-0005PN-Ft
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:47:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ihUzi-0008Ob-DX
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:47:47 -0500
Received: from 4.mo179.mail-out.ovh.net ([46.105.36.149]:44940)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ihUzi-0008JS-6Z
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:47:46 -0500
Received: from player787.ha.ovh.net (unknown [10.108.57.95])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id F163F15283D
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 09:47:43 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player787.ha.ovh.net (Postfix) with ESMTPSA id 9199FD8630B1;
 Wed, 18 Dec 2019 08:47:41 +0000 (UTC)
Date: Wed, 18 Dec 2019 09:47:36 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 1/9] tests/virtio-9p: v9fs_string_read() didn't
 terminate string
Message-ID: <20191218094736.6d89f513@bahia.lan>
In-Reply-To: <E1ihMue-00076W-9u@lizzy.crudebyte.com>
References: <E1ihMue-00076W-9u@lizzy.crudebyte.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 16694562344593496384
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvddtkedguddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeekjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.36.149
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An affirmative form would provide a better one-line summary of what this
patch does, eg:

Add terminating nul in v9fs_string_read().

And maybe explain that, despite it is well known that strings don't have
a terminating nul in 9P, this will allow future users of v9fs_string_read()
to use regular C library string functions with the returned string.

On Mon, 16 Dec 2019 00:17:48 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  tests/virtio-9p-test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/virtio-9p-test.c b/tests/virtio-9p-test.c
> index e7b58e3a0c..880b4ff567 100644
> --- a/tests/virtio-9p-test.c
> +++ b/tests/virtio-9p-test.c
> @@ -130,8 +130,9 @@ static void v9fs_string_read(P9Req *req, uint16_t *len, char **string)
>          *len = local_len;
>      }
>      if (string) {
> -        *string = g_malloc(local_len);
> +        *string = g_malloc(local_len+1);

ERROR: spaces required around that '+' (ctx:VxV)
#97: FILE: tests/virtio-9p-test.c:133:
+        *string = g_malloc(local_len+1);

>          v9fs_memread(req, *string, local_len);
> +        (*string)[local_len] = 0;
>      } else {
>          v9fs_memskip(req, local_len);
>      }


