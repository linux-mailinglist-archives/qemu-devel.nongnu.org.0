Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63C749125D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 00:28:50 +0100 (CET)
Received: from localhost ([::1]:42670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9bQe-0006SC-9v
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 18:28:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n9bPZ-0005lz-BF
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 18:27:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n9bPW-0005nh-DN
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 18:27:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642462057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NXZVAzv0TX2oYHM1L0Wi+Foojx3C8ABMLV+zdD+RKu0=;
 b=gtsv12jU8zv3bNq+htzhSzXgQrSAsMC/DX9GzPgsVVcQpnAHgCc7S3krcLWGQF85v77yZH
 y8bUlcuXYs4R5xYxqMglTbeRw+LsuvbhkqOsdVq9R6V6rg7u7fv7uDJDlewYh4TPw++Xq6
 Zo1KlWMyOEDDXuonsGCHaNAsQc61eHs=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-7Z0ysc08MEOoin9BL_JaRA-1; Mon, 17 Jan 2022 18:27:35 -0500
X-MC-Unique: 7Z0ysc08MEOoin9BL_JaRA-1
Received: by mail-ua1-f69.google.com with SMTP id
 i28-20020a9f305c000000b00305923be96aso10916558uab.9
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 15:27:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NXZVAzv0TX2oYHM1L0Wi+Foojx3C8ABMLV+zdD+RKu0=;
 b=iZCxJqqxt48wzqqldLAXxFvxZmFaI379DYezIMJHqViuVaMs7Qs74GdfS3a9DACaZp
 JoTZvD7RTdCNvHeJQhSjfn+VZM0VHlKN+5/H7ztHrGJVmVupJJFvoYFLNGBOF481perI
 sAR++ubcjYacINosCPbOLb9Rn1yWJGJKMbLiEfZGU9VFUFYVbVl2MT9/A+8Zp2UOk+ZQ
 UuA0a+nVsGpUc+opIWYmeqYr4fv105mWHPuL5QWfvTY8iWAh1lNZVvSMfnZyzS1+QNFX
 LFi1qVeXamcCmFzX8BbfNkkdgTx5OV/4pkQyQeDGrBvDdQ1vx1xYorkP/hewh6+bhkKO
 JlOg==
X-Gm-Message-State: AOAM531xJvF09kmmJ7+mwe42Gm1hmCDh2oWKVSWRq1x1NsgzVAdisLzi
 QgxRS/rayhI6qqYx6q0hKABHT4zAQUyrwh3Ab8epVIX4dYefQojuo9tiOLoEqpZ3StkNC72qTHP
 0BDr5BMAC17OXlcwdX87V0aoC8wmLyzU=
X-Received: by 2002:a05:6102:1045:: with SMTP id
 h5mr8576441vsq.38.1642462055321; 
 Mon, 17 Jan 2022 15:27:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwobdWzmjHCGgYj7Fd9MQIuAknVUmNKJH/q/RB/sdwda+cLDw8B4L5D70vXp6KAOsYaL6fEcKhfKjgvUY41mAY=
X-Received: by 2002:a05:6102:1045:: with SMTP id
 h5mr8576434vsq.38.1642462055035; 
 Mon, 17 Jan 2022 15:27:35 -0800 (PST)
MIME-Version: 1.0
References: <20220117141103.157288-1-berrange@redhat.com>
 <20220117141103.157288-2-berrange@redhat.com>
In-Reply-To: <20220117141103.157288-2-berrange@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 17 Jan 2022 18:27:24 -0500
Message-ID: <CAFn=p-Z4sn94+i18JjEnXgPTJK1H0GBqjCA3kwxtHdrELcOc5g@mail.gmail.com>
Subject: Re: [PATCH 1/2] python: introduce qmp-shell-wrap convenience tool
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 17, 2022 at 9:11 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> With the current 'qmp-shell' tool developers must first spawn QEMU with
> a suitable -qmp arg and then spawn qmp-shell in a separate terminal
> pointing to the right socket.
>
> With 'qmp-shell-wrap' developers can ignore QMP sockets entirely and
> just pass the QEMU command and arguments they want. The program will
> listen on a UNIX socket and tell QEMU to connect QMP to that.
>
> For example, this:
>
>  # qmp-shell-wrap -- qemu-system-x86_64 -display none
>
> Is roughly equivalent of running:
>
>  # qemu-system-x86_64 -display none -qmp qmp-shell-1234 &
>  # qmp-shell qmp-shell-1234
>
> Except that 'qmp-shell-wrap' switches the socket peers around so that
> it is the UNIX socket server and QEMU is the socket client. This makes
> QEMU reliably go away when qmp-shell-wrap exits, closing the server
> socket.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  python/qemu/qmp/qmp_shell.py | 61 +++++++++++++++++++++++++++++++++---
>  scripts/qmp/qmp-shell-wrap   | 11 +++++++
>  2 files changed, 68 insertions(+), 4 deletions(-)
>  create mode 100755 scripts/qmp/qmp-shell-wrap
>
> diff --git a/python/qemu/qmp/qmp_shell.py b/python/qemu/qmp/qmp_shell.py
> index e7d7eb18f1..12f7d28afc 100644
> --- a/python/qemu/qmp/qmp_shell.py
> +++ b/python/qemu/qmp/qmp_shell.py
> @@ -86,6 +86,7 @@
>  import os
>  import re
>  import readline
> +from subprocess import Popen
>  import sys
>  from typing import (
>      Iterator,
> @@ -162,8 +163,10 @@ class QMPShell(qmp.QEMUMonitorProtocol):
>      :param verbose: Echo outgoing QMP messages to console.
>      """
>      def __init__(self, address: qmp.SocketAddrT,
> -                 pretty: bool =3D False, verbose: bool =3D False):
> -        super().__init__(address)
> +                 pretty: bool =3D False,
> +                 verbose: bool =3D False,
> +                 server: bool =3D False):
> +        super().__init__(address, server=3Dserver)
>          self._greeting: Optional[QMPMessage] =3D None
>          self._completer =3D QMPCompleter()
>          self._transmode =3D False
> @@ -404,8 +407,10 @@ class HMPShell(QMPShell):
>      :param verbose: Echo outgoing QMP messages to console.
>      """
>      def __init__(self, address: qmp.SocketAddrT,
> -                 pretty: bool =3D False, verbose: bool =3D False):
> -        super().__init__(address, pretty, verbose)
> +                 pretty: bool =3D False,
> +                 verbose: bool =3D False,
> +                 server: bool =3D False):
> +        super().__init__(address, pretty, verbose, server)
>          self._cpu_index =3D 0
>
>      def _cmd_completion(self) -> None:
> @@ -529,6 +534,54 @@ def main() -> None:
>          for _ in qemu.repl():
>              pass
>
> +def main_wrap() -> None:
> +    """
> +    qmp-shell-wrap entry point: parse command line arguments and start t=
he REPL.
> +    """
> +    parser =3D argparse.ArgumentParser()
> +    parser.add_argument('-H', '--hmp', action=3D'store_true',
> +                        help=3D'Use HMP interface')
> +    parser.add_argument('-v', '--verbose', action=3D'store_true',
> +                        help=3D'Verbose (echo commands sent and received=
)')
> +    parser.add_argument('-p', '--pretty', action=3D'store_true',
> +                        help=3D'Pretty-print JSON')
> +
> +    parser.add_argument('command', nargs=3Dargparse.REMAINDER,
> +                        help=3D'QEMU command line to invoke')
> +
> +    args =3D parser.parse_args()
> +
> +    cmd =3D args.command
> +    if len(cmd) !=3D 0 and cmd[0] =3D=3D '--':
> +        cmd =3D cmd[1:]
> +    if len(cmd) =3D=3D 0:
> +        cmd =3D "qemu-system-x86_64"
> +
> +    sockpath =3D "qmp-shell-wrap-%d" % os.getpid()
> +    cmd +=3D ["-qmp", "unix:%s" % sockpath]
> +
> +    shell_class =3D HMPShell if args.hmp else QMPShell
> +
> +    try:
> +        address =3D shell_class.parse_address(sockpath)
> +    except qmp.QMPBadPortError:
> +        parser.error(f"Bad port number: {socketpath}")
> +        return  # pycharm doesn't know error() is noreturn
> +
> +    with shell_class(address, args.pretty, args.verbose, True) as qemu:
> +        qemuproc =3D Popen(cmd)
> +
> +        try:
> +            qemu.accept()
> +        except qmp.QMPConnectError:
> +            die("Didn't get QMP greeting message")
> +        except qmp.QMPCapabilitiesError:
> +            die("Couldn't negotiate capabilities")
> +        except OSError as err:
> +            die(f"Couldn't connect to {sockpath}: {err!s}")
> +
> +        for _ in qemu.repl():
> +            pass
>
>  if __name__ =3D=3D '__main__':
>      main()
> diff --git a/scripts/qmp/qmp-shell-wrap b/scripts/qmp/qmp-shell-wrap
> new file mode 100755
> index 0000000000..9e94da114f
> --- /dev/null
> +++ b/scripts/qmp/qmp-shell-wrap
> @@ -0,0 +1,11 @@
> +#!/usr/bin/env python3
> +
> +import os
> +import sys
> +
> +sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'pyt=
hon'))
> +from qemu.qmp import qmp_shell
> +
> +
> +if __name__ =3D=3D '__main__':
> +    qmp_shell.main_wrap()
> --
> 2.33.1
>

Adds some new failures to the python linters; try "make check-dev" in
the python sub-dir.

... Though, due to a bug in avocado, this helpfully doesn't actually
show you the failure output right now ...

making this little edit should fix that, sorry for the inconvenience here.

diff --git a/python/avocado.cfg b/python/avocado.cfg
index c7722e7ecd..a460420059 100644
--- a/python/avocado.cfg
+++ b/python/avocado.cfg
@@ -1,5 +1,5 @@
 [run]
-test_runner =3D runner
+test_runner =3D nrunner


