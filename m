Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8165A165EDC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 14:33:25 +0100 (CET)
Received: from localhost ([::1]:42306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4lxE-0001Iv-B8
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 08:33:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60839)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1j4lvo-0000QG-OX
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 08:31:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1j4lvn-0007Li-K7
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 08:31:56 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56524
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1j4lvn-0007L9-FL
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 08:31:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582205514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lh/fDkAWyjLeYA6edd1OKYMIv6iDbuJfvWrL7o5UObQ=;
 b=QF5hJgv+fKcOsz36Vv6YfwFX95xB5fubLpQQYspDBdEIHeN0tOSLq6ocRGMFt6/9sdDTzu
 pR9G1aN+xLFtInx2w7FKTOx1P01QYDlZUmVxpob74RrIE/NON42J4REHvNTbGKNzGhdJCx
 k2/DIKBT5AKHkvfHFIR6UR7OsiqHHA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-Ha51yl-JNemZkiJ_xR7StQ-1; Thu, 20 Feb 2020 08:31:53 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 034DA19251A1;
 Thu, 20 Feb 2020 13:31:52 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-92.gru2.redhat.com
 [10.97.116.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68CD460BE1;
 Thu, 20 Feb 2020 13:31:47 +0000 (UTC)
Subject: Re: [PATCH v9 1/3] Acceptance tests: introduce BUILD_DIR and
 SOURCE_DIR
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20200220020652.16276-1-crosa@redhat.com>
 <20200220020652.16276-2-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <38105bbf-a9d2-24d9-e979-3b93bc110918@redhat.com>
Date: Thu, 20 Feb 2020 10:31:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200220020652.16276-2-crosa@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: Ha51yl-JNemZkiJ_xR7StQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/19/20 11:06 PM, Cleber Rosa wrote:
> Some tests may benefit from using resources from a build directory.
> This introduces three variables that can help tests find resources in
> those directories.
>
> First, a BUILD_DIR is assumed to exist, given that the primary form of
> running the acceptance tests is from a build directory (which may or
> may not be the same as the source tree, that is, the SOURCE_DIR).
>
> If the directory containing the acceptance tests happens to be a link
> to a directory, it's assumed to it points to the source tree
> (SOURCE_DIR), which is the behavior defined on the QEMU Makefiles.  If
> the directory containing the acceptance tests is not a link, then a
> in-tree build is assumed, and the BUILD_DIR and SOURCE_DIR have the
> same value.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 25 +++++++++++++++++------
>   1 file changed, 19 insertions(+), 6 deletions(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

Also tested with QEMU built outside of source dir:

Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index d4358eb431..59e7b4f763 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -16,8 +16,21 @@ import tempfile
>   
>   import avocado
>   
> -SRC_ROOT_DIR = os.path.join(os.path.dirname(__file__), '..', '..', '..')
> -sys.path.append(os.path.join(SRC_ROOT_DIR, 'python'))
> +#: The QEMU build root directory.  It may also be the source directory
> +#: if building from the source dir, but it's safer to use BUILD_DIR for
> +#: that purpose.  Be aware that if this code is moved outside of a source
> +#: and build tree, it will not be accurate.
> +BUILD_DIR = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
> +
> +if os.path.islink(os.path.dirname(os.path.dirname(__file__))):
> +    # The link to the acceptance tests dir in the source code directory
> +    lnk = os.path.dirname(os.path.dirname(__file__))
> +    #: The QEMU root source directory
> +    SOURCE_DIR = os.path.dirname(os.path.dirname(os.readlink(lnk)))
> +else:
> +    SOURCE_DIR = BUILD_DIR
> +
> +sys.path.append(os.path.join(SOURCE_DIR, 'python'))
>   
>   from qemu.machine import QEMUMachine
>   
> @@ -49,10 +62,10 @@ def pick_default_qemu_bin(arch=None):
>       if is_readable_executable_file(qemu_bin_relative_path):
>           return qemu_bin_relative_path
>   
> -    qemu_bin_from_src_dir_path = os.path.join(SRC_ROOT_DIR,
> +    qemu_bin_from_bld_dir_path = os.path.join(BUILD_DIR,
>                                                 qemu_bin_relative_path)
> -    if is_readable_executable_file(qemu_bin_from_src_dir_path):
> -        return qemu_bin_from_src_dir_path
> +    if is_readable_executable_file(qemu_bin_from_bld_dir_path):
> +        return qemu_bin_from_bld_dir_path
>   
>   
>   def _console_interaction(test, success_message, failure_message,
> @@ -153,7 +166,7 @@ class Test(avocado.Test):
>           self.qemu_bin = self.params.get('qemu_bin',
>                                           default=default_qemu_bin)
>           if self.qemu_bin is None:
> -            self.cancel("No QEMU binary defined or found in the source tree")
> +            self.cancel("No QEMU binary defined or found in the build tree")
>   
>       def _new_vm(self, *args):
>           vm = QEMUMachine(self.qemu_bin, sock_dir=tempfile.mkdtemp())


