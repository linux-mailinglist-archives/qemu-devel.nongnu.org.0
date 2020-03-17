Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD88E188ED0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 21:16:49 +0100 (CET)
Received: from localhost ([::1]:40788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEIds-0007Dl-Si
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 16:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59226)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1jEIcP-0006i8-62
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 16:15:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1jEIcN-0003ZZ-Mk
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 16:15:16 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:52507)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1jEIcN-0003UM-Hj
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 16:15:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584476114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l6RSuGlE7GmDitW93DKKuo+MuB0TFLpK+eK8fg3lumA=;
 b=CHzXF+C/nL0wALnYbxiT3pBQZgBZia4X+A5CPoisZVST/om/+H21e5cLOhCm8FMmOlsSYN
 yGrCYqJRq7tewepunsIYUyMspMXsL2xiw1TSZeuGI/Md2DTSjC5FDoynTS11X1/EASAwlZ
 JqlhGs6AT+lY/n1qCCFNpBc7oFx6t0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-lv2DZMLgMA2PeW-vwvxkDg-1; Tue, 17 Mar 2020 16:15:12 -0400
X-MC-Unique: lv2DZMLgMA2PeW-vwvxkDg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EC87107ACCD
 for <qemu-devel@nongnu.org>; Tue, 17 Mar 2020 20:15:11 +0000 (UTC)
Received: from localhost.localdomain (ovpn-115-69.rdu2.redhat.com
 [10.10.115.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 079268C087;
 Tue, 17 Mar 2020 20:15:03 +0000 (UTC)
Subject: Re: [PATCH v4] python/qemu/qmp.py: QMP debug with VM label
To: Oksana Vohchana <ovoshcha@redhat.com>, qemu-devel@nongnu.org
References: <20200316103203.10046-1-ovoshcha@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <289c4cea-6df3-0b79-b0b9-e40a25c12ee9@redhat.com>
Date: Tue, 17 Mar 2020 17:15:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200316103203.10046-1-ovoshcha@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: ehabkost@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 3/16/20 7:32 AM, Oksana Vohchana wrote:
> QEMUMachine writes some messages to the default logger.
> But it sometimes hard to read the output if we have requests to
> more than one VM.

For example,=C2=A0 tests/acceptance/migration.py uses two VMs and reading t=
he=20
qmp outputs on avocado's log is very confusing. Certainly this change=20
will help to improve that situation, just need to adapt=20
tests/acceptance/avocado_qemu/__init__.py to create the QEMUMachine=20
object with a name.

Anyway, this patch looks good to me so:

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

Thanks!

> This patch adds a label to the logger in the debug mode.
>
> Signed-off-by: Oksana Vohchana <ovoshcha@redhat.com>
> ---
> v2:
>   - Instead of shown the label in the message it provides the label
>     only in the debug logger information.
> v3:
>   - Fixes coding style problems.
> v4:
>   - Use a suffix method to get a children's logger process from the paren=
t.
> ---
>   python/qemu/machine.py | 3 ++-
>   python/qemu/qmp.py     | 5 ++++-
>   2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
> index 183d8f3d38..f53abfa492 100644
> --- a/python/qemu/machine.py
> +++ b/python/qemu/machine.py
> @@ -270,7 +270,8 @@ class QEMUMachine(object):
>                   self._vm_monitor =3D os.path.join(self._sock_dir,
>                                                   self._name + "-monitor.=
sock")
>                   self._remove_files.append(self._vm_monitor)
> -            self._qmp =3D qmp.QEMUMonitorProtocol(self._vm_monitor, serv=
er=3DTrue)
> +            self._qmp =3D qmp.QEMUMonitorProtocol(self._vm_monitor, serv=
er=3DTrue,
> +                                                nickname=3Dself._name)
>  =20
>       def _post_launch(self):
>           if self._qmp:
> diff --git a/python/qemu/qmp.py b/python/qemu/qmp.py
> index f40586eedd..d6c9b2f4b1 100644
> --- a/python/qemu/qmp.py
> +++ b/python/qemu/qmp.py
> @@ -46,7 +46,7 @@ class QEMUMonitorProtocol:
>       #: Logger object for debugging messages
>       logger =3D logging.getLogger('QMP')
>  =20
> -    def __init__(self, address, server=3DFalse):
> +    def __init__(self, address, server=3DFalse, nickname=3DNone):
>           """
>           Create a QEMUMonitorProtocol class.
>  =20
> @@ -62,6 +62,9 @@ class QEMUMonitorProtocol:
>           self.__address =3D address
>           self.__sock =3D self.__get_sock()
>           self.__sockfile =3D None
> +        self._nickname =3D nickname
> +        if self._nickname:
> +            self.logger =3D logging.getLogger('QMP').getChild(self._nick=
name)
>           if server:
>               self.__sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEAD=
DR, 1)
>               self.__sock.bind(self.__address)


