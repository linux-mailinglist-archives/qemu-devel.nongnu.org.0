Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC33AF7653
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 15:24:35 +0100 (CET)
Received: from localhost ([::1]:53582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUAcM-0001wN-R4
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 09:24:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54132)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iUAbW-0001Uw-D5
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 09:23:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iUAbV-0000ro-Dq
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 09:23:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34311
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iUAbV-0000ri-A8
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 09:23:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573482220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7dud9yzHE0QOTlvf//ZqYkWh5Lxd5bAkYU3oyhF2QC0=;
 b=ZSJAPrHXwP+AFuzg2WwHgMKAf5V+vT2xnGSCnl+IeRHVOvZased2Wug7FSWbzjXuR9hRAP
 w9mVaEI5oL6MGjAjj97+337IEaLgAcyXjTNKySKktJlXNTuXMCLQ43O6v6e20rubeVbOKG
 JJB2ScnBhSMB5PygqXWgKQVIxv//qyA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-mD2KPqWmOmmcozyl2FZWHw-1; Mon, 11 Nov 2019 09:23:39 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E973E100551C
 for <qemu-devel@nongnu.org>; Mon, 11 Nov 2019 14:23:38 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-162.ams2.redhat.com
 [10.36.116.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6251017196;
 Mon, 11 Nov 2019 14:23:25 +0000 (UTC)
Subject: Re: [PATCH v6 1/4] tests/vm: netbsd autoinstall, using serial console
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20191031085306.28888-1-kraxel@redhat.com>
 <20191031085306.28888-2-kraxel@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <cc02b8cf-61f7-d4a1-9699-f194c609f26a@redhat.com>
Date: Mon, 11 Nov 2019 15:23:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191031085306.28888-2-kraxel@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: mD2KPqWmOmmcozyl2FZWHw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/10/2019 09.53, Gerd Hoffmann wrote:
> Instead of fetching the prebuilt image from patchew download the install
> iso and prepare the image locally.  Install to disk, using the serial
> console.  Create qemu user, configure ssh login.  Install packages
> needed for qemu builds.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Kamil Rytarowski <n54@gmx.com>
> Tested-by: Thomas Huth <thuth@redhat.com>
> [ehabkost: rebased to latest qemu.git master]
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  tests/vm/netbsd | 189 +++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 179 insertions(+), 10 deletions(-)
[...]
> +        # shutdown
> +        self.ssh_root(self.poweroff)
> +        self.console_wait("entering state S5")
> +        self.wait()
> +
> +        if os.path.exists(img):
> +            os.remove(img)

What about removing the above two lines again?
(see commit fcd2060e8efff83b7bde)

 Thomas


