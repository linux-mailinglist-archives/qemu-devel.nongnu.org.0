Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6559FE7565
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 16:47:08 +0100 (CET)
Received: from localhost ([::1]:52784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP7EX-0000E1-Nb
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 11:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55118)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iP74j-00011h-Tu
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 11:36:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iP74h-0001UA-JY
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 11:36:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25415
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iP74h-0001Tq-F3
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 11:36:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572277014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9jMOer25XptR3y3YpPqS8mdHVlMdrp3QJPNz/WNRFpA=;
 b=KX2pCtnbruIOgZezcHbvQqmveJxgbLKFvQiOcItocjEWeX7ADQHv12SmmQ58waqkHNei2G
 6/JjM6pdz2BPsbtJQd34TYLY9y5t2qd2QziOCVELF7wbMBSQyhrSRIHNvYD0+tCU7gG6D+
 0GH48iT+kA7bgVCvvtD5KmEgRN7d174=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-OAVx3hgQPXClqGeoEj4ZnQ-1; Mon, 28 Oct 2019 11:36:51 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A87EF1005509;
 Mon, 28 Oct 2019 15:36:48 +0000 (UTC)
Received: from localhost.localdomain (ovpn-123-183.rdu2.redhat.com
 [10.10.123.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 915E65C1D6;
 Mon, 28 Oct 2019 15:36:42 +0000 (UTC)
Date: Mon, 28 Oct 2019 11:36:40 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 04/26] tests/acceptance: Send <carriage return> on serial
 lines
Message-ID: <20191028153640.GC3978@localhost.localdomain>
References: <20191028073441.6448-1-philmd@redhat.com>
 <20191028073441.6448-5-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191028073441.6448-5-philmd@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: OAVx3hgQPXClqGeoEj4ZnQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-devel@nongnu.org,
 Fabien Chouteau <chouteau@adacore.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Kamil Rytarowski <kamil@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 28, 2019 at 08:34:19AM +0100, Philippe Mathieu-Daud=E9 wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> Some firmwares don't parse the <Newline> control character and
> expect a <carriage return>.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
> since previous: do not send NewLine
> ---
>  tests/acceptance/boot_linux_console.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
> index 8897e0c253..f9b77af359 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -34,7 +34,7 @@ class BootLinuxConsole(Test):
>                                   failure_message=3D'Kernel panic - not s=
yncing')
> =20
>      def exec_command_and_wait_for_pattern(self, command, success_message=
):
> -        command +=3D '\n'
> +        command +=3D '\r'
>          self.vm.console_socket.sendall(command.encode())
>          wait_for_console_pattern(self, success_message)
> =20
> --=20
> 2.21.0
>=20

Given the discussion on
<d21da354-0c14-5b55-0e87-1a63d246e4ca@amsat.org>, this LGTM.

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

Queuing on my python-next branch (and sending shortly in a PR).

Thanks,
- Cleber.


