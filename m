Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33982492D02
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 19:12:49 +0100 (CET)
Received: from localhost ([::1]:42370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9syO-0004tw-BD
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 13:12:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n9sqD-0005iW-6V
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 13:04:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n9sqB-0004dM-54
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 13:04:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642529058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tISaqgH6LMizGcqN9ild5fLx+F/T5Cn9e1GtQc+7X3Y=;
 b=JV/X+i1f0WJ6FSCc95qrV8Ki5BzZlek1fUxbXzdFUklk87UZ/Yb6Ff0UShg5A5Z98a2qOm
 ENnVOXa8GX37Z7tnWihFONZ6guwaI5pjdm/Z5xYhPOFhPqjHZeHt+l4/aCRRiwxEoX5b47
 R6t/ASBPsNCZ1JZTvwMBOHON7RIht/g=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-iPwxq3FKOhq-Z7U_ikP4UQ-1; Tue, 18 Jan 2022 13:04:14 -0500
X-MC-Unique: iPwxq3FKOhq-Z7U_ikP4UQ-1
Received: by mail-vk1-f197.google.com with SMTP id
 w65-20020a1f6244000000b00317041f0e4bso3240731vkb.16
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 10:04:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tISaqgH6LMizGcqN9ild5fLx+F/T5Cn9e1GtQc+7X3Y=;
 b=4r3w9ccgbbecbHpicR/jcVl5WFTKVL5rB1CgURNZgSxTqFZ1vLFGTQCz/ztiHK5iiO
 nlngBiBHYtYNZOrvMn6uiJvQLvbso/AkOJFqYvgGj02jGgDFV/K5dgs09XR54UnKnov1
 xdp12irMCL8dE27QXVR5wUrulNHg8fE2W/jn8Wpv3ozvuPP9LfIedC7T+6xKMA9NlyJc
 7mU2dI+FqYyiH8pEcBSpzoz8UvRGFqDtAZ9kufg73hPb6CvSsZHkwvPUcTPt65X8z2LD
 zYTxDxrsnGA97OYYmHalCYJSaf4FYdAtiLNmIGJopQGjBDpjWn5zZ4NChmkO893wwCYR
 l7KA==
X-Gm-Message-State: AOAM533uYub2go0iEM/mXsmYMe9vF9eHKUIXWHV/jyeK4SQQqF8b2V0t
 vdAflXur6jufzlCBQdygIUwUdoP7QSBII8KbSIEyDlT/dQ/pqdDSBcFucKP3vMCq3a12QHvszDE
 vYOqyCFFjlFH94ErE8/qWcLJmnWHwS7o=
X-Received: by 2002:a05:6102:3714:: with SMTP id
 s20mr10223004vst.61.1642529054154; 
 Tue, 18 Jan 2022 10:04:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6Nehlw9zfmc2iCrscwx/57FJyrGWbhTVQcttBmpOjaAq9OnWISONSW0wvJE7VsdFA2iEM4lz7llsOAYBBFLE=
X-Received: by 2002:a05:6102:3714:: with SMTP id
 s20mr10222975vst.61.1642529053744; 
 Tue, 18 Jan 2022 10:04:13 -0800 (PST)
MIME-Version: 1.0
References: <20220117141103.157288-1-berrange@redhat.com>
 <20220117141103.157288-2-berrange@redhat.com>
 <CAFn=p-Z4sn94+i18JjEnXgPTJK1H0GBqjCA3kwxtHdrELcOc5g@mail.gmail.com>
 <YeaRJF3tqMjipU3o@redhat.com>
In-Reply-To: <YeaRJF3tqMjipU3o@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 18 Jan 2022 13:04:02 -0500
Message-ID: <CAFn=p-ZS247FdLySHMcBTpqKzV=eTgsQQMAXyU5CwNEWdZQusQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] python: introduce qmp-shell-wrap convenience tool
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 5:06 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Mon, Jan 17, 2022 at 06:27:24PM -0500, John Snow wrote:
> > On Mon, Jan 17, 2022 at 9:11 AM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> > >
> > > With the current 'qmp-shell' tool developers must first spawn QEMU wi=
th
> > > a suitable -qmp arg and then spawn qmp-shell in a separate terminal
> > > pointing to the right socket.
> > >
> > > With 'qmp-shell-wrap' developers can ignore QMP sockets entirely and
> > > just pass the QEMU command and arguments they want. The program will
> > > listen on a UNIX socket and tell QEMU to connect QMP to that.
> > >
> > > For example, this:
> > >
> > >  # qmp-shell-wrap -- qemu-system-x86_64 -display none
> > >
> > > Is roughly equivalent of running:
> > >
> > >  # qemu-system-x86_64 -display none -qmp qmp-shell-1234 &
> > >  # qmp-shell qmp-shell-1234
> > >
> > > Except that 'qmp-shell-wrap' switches the socket peers around so that
> > > it is the UNIX socket server and QEMU is the socket client. This make=
s
> > > QEMU reliably go away when qmp-shell-wrap exits, closing the server
> > > socket.
> > >
> > > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > > ---
> > >  python/qemu/qmp/qmp_shell.py | 61 +++++++++++++++++++++++++++++++++-=
--
> > >  scripts/qmp/qmp-shell-wrap   | 11 +++++++
> > >  2 files changed, 68 insertions(+), 4 deletions(-)
> > >  create mode 100755 scripts/qmp/qmp-shell-wrap
> > >
> > > diff --git a/python/qemu/qmp/qmp_shell.py b/python/qemu/qmp/qmp_shell=
.py
> > > index e7d7eb18f1..12f7d28afc 100644
> > > --- a/python/qemu/qmp/qmp_shell.py
> > > +++ b/python/qemu/qmp/qmp_shell.py
> > > @@ -86,6 +86,7 @@
> > >  import os
> > >  import re
> > >  import readline
> > > +from subprocess import Popen
> > >  import sys
> > >  from typing import (
> > >      Iterator,
> > > @@ -162,8 +163,10 @@ class QMPShell(qmp.QEMUMonitorProtocol):
> > >      :param verbose: Echo outgoing QMP messages to console.
> > >      """
> > >      def __init__(self, address: qmp.SocketAddrT,
> > > -                 pretty: bool =3D False, verbose: bool =3D False):
> > > -        super().__init__(address)
> > > +                 pretty: bool =3D False,
> > > +                 verbose: bool =3D False,
> > > +                 server: bool =3D False):
> > > +        super().__init__(address, server=3Dserver)
> > >          self._greeting: Optional[QMPMessage] =3D None
> > >          self._completer =3D QMPCompleter()
> > >          self._transmode =3D False
> > > @@ -404,8 +407,10 @@ class HMPShell(QMPShell):
> > >      :param verbose: Echo outgoing QMP messages to console.
> > >      """
> > >      def __init__(self, address: qmp.SocketAddrT,
> > > -                 pretty: bool =3D False, verbose: bool =3D False):
> > > -        super().__init__(address, pretty, verbose)
> > > +                 pretty: bool =3D False,
> > > +                 verbose: bool =3D False,
> > > +                 server: bool =3D False):
> > > +        super().__init__(address, pretty, verbose, server)
> > >          self._cpu_index =3D 0
> > >
> > >      def _cmd_completion(self) -> None:
> > > @@ -529,6 +534,54 @@ def main() -> None:
> > >          for _ in qemu.repl():
> > >              pass
> > >
> > > +def main_wrap() -> None:
> > > +    """
> > > +    qmp-shell-wrap entry point: parse command line arguments and sta=
rt the REPL.
> > > +    """
> > > +    parser =3D argparse.ArgumentParser()
> > > +    parser.add_argument('-H', '--hmp', action=3D'store_true',
> > > +                        help=3D'Use HMP interface')
> > > +    parser.add_argument('-v', '--verbose', action=3D'store_true',
> > > +                        help=3D'Verbose (echo commands sent and rece=
ived)')
> > > +    parser.add_argument('-p', '--pretty', action=3D'store_true',
> > > +                        help=3D'Pretty-print JSON')
> > > +
> > > +    parser.add_argument('command', nargs=3Dargparse.REMAINDER,
> > > +                        help=3D'QEMU command line to invoke')
> > > +
> > > +    args =3D parser.parse_args()
> > > +
> > > +    cmd =3D args.command
> > > +    if len(cmd) !=3D 0 and cmd[0] =3D=3D '--':
> > > +        cmd =3D cmd[1:]
> > > +    if len(cmd) =3D=3D 0:
> > > +        cmd =3D "qemu-system-x86_64"
> > > +
> > > +    sockpath =3D "qmp-shell-wrap-%d" % os.getpid()
> > > +    cmd +=3D ["-qmp", "unix:%s" % sockpath]
> > > +
> > > +    shell_class =3D HMPShell if args.hmp else QMPShell
> > > +
> > > +    try:
> > > +        address =3D shell_class.parse_address(sockpath)
> > > +    except qmp.QMPBadPortError:
> > > +        parser.error(f"Bad port number: {socketpath}")
> > > +        return  # pycharm doesn't know error() is noreturn
> > > +
> > > +    with shell_class(address, args.pretty, args.verbose, True) as qe=
mu:
> > > +        qemuproc =3D Popen(cmd)
> > > +
> > > +        try:
> > > +            qemu.accept()
> > > +        except qmp.QMPConnectError:
> > > +            die("Didn't get QMP greeting message")
> > > +        except qmp.QMPCapabilitiesError:
> > > +            die("Couldn't negotiate capabilities")
> > > +        except OSError as err:
> > > +            die(f"Couldn't connect to {sockpath}: {err!s}")
> > > +
> > > +        for _ in qemu.repl():
> > > +            pass
> > >
> > >  if __name__ =3D=3D '__main__':
> > >      main()
> > > diff --git a/scripts/qmp/qmp-shell-wrap b/scripts/qmp/qmp-shell-wrap
> > > new file mode 100755
> > > index 0000000000..9e94da114f
> > > --- /dev/null
> > > +++ b/scripts/qmp/qmp-shell-wrap
> > > @@ -0,0 +1,11 @@
> > > +#!/usr/bin/env python3
> > > +
> > > +import os
> > > +import sys
> > > +
> > > +sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', =
'python'))
> > > +from qemu.qmp import qmp_shell
> > > +
> > > +
> > > +if __name__ =3D=3D '__main__':
> > > +    qmp_shell.main_wrap()
> > > --
> > > 2.33.1
> > >
> >
> > Adds some new failures to the python linters; try "make check-dev" in
> > the python sub-dir.
>
> It would be nice to just have this integrated into 'make check' so we
> don't need to remember to run a special command.

The CI will run it, but 'make check' doesn't. To add it to make check,
I need to figure out how to insert a venv-building step into 'make
check' such that the venv gets deposited into the build dir instead of
the source dir.
I think I may also need yet another set of package dependencies that
pin on precise dependencies for testing purposes to prevent random
regressions during 'make check' when nobody has touched the Python
code.

Overall, I felt like maybe it was more hassle than it was worth if I
can just nudge people touching the python to run a 'make check-dev'
every so often.

Patches welcome, etc. My overall strategy with the python tests so far has =
been:

(1) Keep python tests fully separate from the QEMU build system to
allow them to be split out into new repositories easily.
(2) Use the pipenv test to lock the very oldest dependencies the code
and tests support, using the very oldest python we support (3.6) This
test is used as the gating test in GitLab CI, as it is very repeatable
and the GitLab CI setup ensures I can always have the exact Python
packages it requires available.
(3) Use the tox test to test against a wide variety of Python
interpreters (3.6 through 3.10 inclusive) using the very latest python
packages to detect regressions on cutting-edge environments
(4) Use the widest possible range of versions for dependent packages
in setup.cfg such that QEMU packages are unlikely to cause versioning
conflicts in environments that decide to integrate our code.

Overall, I test on 3.6 through 3.10, and against the "oldest" and
"newest" dependencies. It's a good, wide matrix.

However, It's #4 there that runs me into trouble with tests that are
guaranteed to pass -- the linters update all the time and cause new
problems. I use pipenv to lock to specific versions, but that tool
wants to run against Python 3.6 *explicitly*, so it isn't suitable for
a generic purpose 'make check' because not everyone will have a Python
3.6 interpreter available. I need something kind of halfway between,
where I can lock against specific versions but not against the Python
interpreter version, and that's what could be used for a decent 'make
check' test.

Of course, I don't want to maintain like 10 versions of a dependent
packages list, either.

(I really, really wish pip had an --use-oldest flag for dependency
resolution, but it doesn't.)

>
> > ... Though, due to a bug in avocado, this helpfully doesn't actually
> > show you the failure output right now ...
>
> Urgh.
>

It regressed during winter vacation. I sent a small patch to enable
the new runner [1], and I have been discussing with Beraldo how to
re-enable the Coverage.py tests under the new Avocado.

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg03614.html


