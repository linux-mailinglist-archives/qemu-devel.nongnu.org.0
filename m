Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E76136FBE1
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:05:57 +0200 (CEST)
Received: from localhost ([::1]:47094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTmG-0004gn-EN
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcTXb-0006mo-Mu
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:50:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcTXW-00009C-0c
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:50:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619790641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=INRmEFbM9mYuzh8I4lakDY/Ac8z2Ob9bvPNuK83Rl2M=;
 b=RBC0uF7vbrlCxrNN/dZ0IDE+2AJVVUCqic2OvpI318qZE97ayF5qHh/FRwqFgaOJ7RoCO6
 oofLRfztFmI3Ihanf45iWd8geei+NjrebR/MzsgfJRI9r4xSr4qh4U4flkrPB6G21dlJ2T
 QtTzW9vJ++oUvu6pyvZZIfqz8RUI+y8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-0VbB40JDMRGbZztqnbYr-A-1; Fri, 30 Apr 2021 09:50:39 -0400
X-MC-Unique: 0VbB40JDMRGbZztqnbYr-A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B91E18D6A21;
 Fri, 30 Apr 2021 13:50:38 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-68.ams2.redhat.com
 [10.36.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72F7119D7C;
 Fri, 30 Apr 2021 13:50:36 +0000 (UTC)
Subject: Re: [PATCH v3 14/15] qemu_iotests: add option to show qemu binary
 logs on stdout
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-15-eesposit@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <2935fed5-4330-bdb1-6062-7d4a7ed05893@redhat.com>
Date: Fri, 30 Apr 2021 15:50:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414170352.29927-15-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.04.21 19:03, Emanuele Giuseppe Esposito wrote:
> Using the flag -p, allow the qemu binary to print to stdout.
> This helps especially when doing print-debugging.

I think this shouldn’t refer to prints but to qemu’s stdout/stderr in 
general, i.e....

> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   tests/qemu-iotests/check      | 3 ++-
>   tests/qemu-iotests/iotests.py | 9 +++++++++
>   tests/qemu-iotests/testenv.py | 9 +++++++--
>   3 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index 489178d9a4..84483922eb 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check
> @@ -33,6 +33,7 @@ def make_argparser() -> argparse.ArgumentParser:
>                      help='pretty print output for make check')
>   
>       p.add_argument('-d', dest='debug', action='store_true', help='debug')
> +    p.add_argument('-p', dest='print', action='store_true', help='shows qemu binary prints to stdout')

I’d prefer for the description to be “redirects qemu's stdout and stderr 
to the test output”.

Also, this line is too long.

>       p.add_argument('-gdb', action='store_true',
>                      help="start gdbserver with $GDB_QEMU options. \
>                            Default is localhost:12345")
> @@ -117,7 +118,7 @@ if __name__ == '__main__':
>                     aiomode=args.aiomode, cachemode=args.cachemode,
>                     imgopts=args.imgopts, misalign=args.misalign,
>                     debug=args.debug, valgrind=args.valgrind,
> -                  gdb=args.gdb)
> +                  gdb=args.gdb, qprint=args.print)
>   
>       testfinder = TestFinder(test_dir=env.source_iotests)
>   
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index f9832558a0..52ff7332f8 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -79,6 +79,8 @@
>   if os.environ.get('GDB_QEMU'):
>       qemu_gdb = ['gdbserver'] + os.environ.get('GDB_QEMU').strip().split(' ')
>   
> +qemu_print = os.environ.get('PRINT_QEMU', False)
> +
>   imgfmt = os.environ.get('IMGFMT', 'raw')
>   imgproto = os.environ.get('IMGPROTO', 'file')
>   output_dir = os.environ.get('OUTPUT_DIR', '.')
> @@ -621,6 +623,13 @@ def _post_shutdown(self) -> None:
>           super()._post_shutdown()
>           self.subprocess_check_valgrind(qemu_valgrind)
>   
> +    def _pre_launch(self) -> None:
> +        super()._pre_launch()
> +        if qemu_print and self._qemu_log_file != None:

I think "is not None" is mostly used in Python.  (I’m saying this in 
this weird way because I’m not the one to ask what’s mostly used in 
Python...)

(That also silences mypy, which otherwise complains and then fails 297.)

> +            # set QEMU binary output to stdout
> +            self._qemu_log_file.close()
> +            self._qemu_log_file = None

I don’t know enough Python to know how this works.  I suppose this does 
access the super class’s member?  (I could also imagine it creates a new 
member, just for this child class, but that then effectively overwrites 
the super class’s member.)

Considering _qemu_log_file is apparently meant to be a private attribute 
(from the leading underscore), I think it would be better to have a 
function provided by the super class for this.

> +
>       def add_object(self, opts):
>           self._args.append('-object')
>           self._args.append(opts)
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index 39ae7ace33..6ae099114e 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -73,7 +73,7 @@ class TestEnv(ContextManager['TestEnv']):
>                        'AIOMODE', 'CACHEMODE', 'VALGRIND_QEMU',
>                        'CACHEMODE_IS_DEFAULT', 'IMGFMT_GENERIC', 'IMGOPTSSYNTAX',
>                        'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_',
> -                     'GDB_QEMU']
> +                     'GDB_QEMU', 'PRINT_QEMU']
>   
>       def get_env(self) -> Dict[str, str]:
>           env = {}
> @@ -165,7 +165,8 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
>                    misalign: bool = False,
>                    debug: bool = False,
>                    valgrind: bool = False,
> -                 gdb: bool = False) -> None:
> +                 gdb: bool = False,
> +                 qprint: bool = False) -> None:
>           self.imgfmt = imgfmt
>           self.imgproto = imgproto
>           self.aiomode = aiomode
> @@ -173,6 +174,9 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
>           self.misalign = misalign
>           self.debug = debug
>   
> +        if qprint:
> +            self.print_qemu = 'y'
> +
>           if gdb:
>               self.gdb_qemu = os.environ.get('GDB_QEMU', 'localhost:12345')
>           elif 'GDB_QEMU' in os.environ:
> @@ -278,6 +282,7 @@ def print_env(self) -> None:
>   SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
>   GDB_QEMU      -- "{GDB_QEMU}"
>   VALGRIND_QEMU     -- "{VALGRIND_QEMU}"
> +PRINT_QEMU    --  "{PRINT_QEMU}"

Again, I personally don’t like the quotes.

(I think “PRINT_QEMU -- y” and “PRINT_QEMU --” look better.)

Another thing: Here in this place, the name of the environment variable 
is visible.  “PRINT_QEMU” doesn’t really have meaning; now, if it 
weren’t visible, I wouldn’t care, but here it is visible.  Perhaps 
“PRINT_QEMU_OUTPUT”, or "SHOW_QEMU_OUTPUT" would mean more?

Well, it’s all bike-shedding, so with “is not None” and the add_argument 
line broken so it doesn’t exceed 79 characters:

Reviewed-by: Max Reitz <mreitz@redhat.com>

>   """
>   
>           args = collections.defaultdict(str, self.get_env())
> 


