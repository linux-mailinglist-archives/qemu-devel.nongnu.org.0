Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CC933F137
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 14:34:17 +0100 (CET)
Received: from localhost ([::1]:36612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMWJU-0003aC-65
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 09:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lMWI6-0002eC-PL
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:32:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lMWI2-0001hy-W5
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615987965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NpxmYajSjKdwvjK+mY/8RLagSI+XCbjRGXOqZH0+rRA=;
 b=KZUAPi+WWA2+YheuOhxtW8oROYRHgltVHxUG8QvfyFzJUw29ifopwOZdmwmqiO1kYXgW7+
 /xY9V+RYOvncmo5R1OqrevxMXVvggpcFzRcJL/BP5YUHDFucWOdWgZR0kWYCDOyHNtxwBa
 Z+tNFN2sqLRlYoPl3UW9SD6xWjoyBPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-iC-nvkG7OtWKDyOpXNb-5g-1; Wed, 17 Mar 2021 09:32:44 -0400
X-MC-Unique: iC-nvkG7OtWKDyOpXNb-5g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B92BC10168CE;
 Wed, 17 Mar 2021 13:32:42 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CA6037DD;
 Wed, 17 Mar 2021 13:32:36 +0000 (UTC)
Subject: Re: [PATCH v3 2/5] tests/acceptance: Make pick_default_qemu_bin()
 more generic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210315230838.2973103-1-f4bug@amsat.org>
 <20210315230838.2973103-3-f4bug@amsat.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <1bb15b0e-44d2-d761-e2d2-8ae5e906f2cd@redhat.com>
Date: Wed, 17 Mar 2021 10:32:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210315230838.2973103-3-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 3/15/21 8:08 PM, Philippe Mathieu-Daudé wrote:
> Make pick_default_qemu_bin() generic to find qemu-system or
> qemu-user binaries.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 4f814047176..08b3fa1124f 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -48,7 +48,7 @@ def is_readable_executable_file(path):
>       return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
>   
>   
> -def pick_default_qemu_bin(arch=None):
> +def pick_default_qemu_bin(bin_fmt, arch=None):
I suggest that bin_fmt defaults to "qemu-system-%" (or "qemu-system-", 
see below) so that you don't need to change the existing callers.
>       """
>       Picks the path of a QEMU binary, starting either in the current working
>       directory or in the source tree root directory.
> @@ -67,7 +67,7 @@ def pick_default_qemu_bin(arch=None):
>       # qemu binary path does not match arch for powerpc, handle it
>       if 'ppc64le' in arch:
>           arch = 'ppc64'
> -    qemu_bin_relative_path = "./qemu-system-%s" % arch
> +    qemu_bin_relative_path = os.path.join(".", bin_fmt % arch)

Above construct fails (unless I missed something):

   >>> bin_fmt="qemu-system-%"

   >>> arch="aarch64"
   >>> qemu_bin_relative_path = os.path.join(".", bin_fmt % arch)
   Traceback (most recent call last):
     File "<stdin>", line 1, in <module>
   ValueError: incomplete format

Instead it could be "bin_prefix" where the value is either 
"qemu-system-" or "qemu-", then "arch" is just appended.

>       if is_readable_executable_file(qemu_bin_relative_path):
>           return qemu_bin_relative_path
>   
> @@ -187,14 +187,14 @@ def require_accelerator(self, accelerator):
>               self.cancel("%s accelerator does not seem to be "
>                           "available" % accelerator)
>   
> -    def setUp(self):
> +    def setUp(self, bin_fmt):
>           self.arch = self.params.get('arch',
>                                       default=self._get_unique_tag_val('arch'))
>   
>           self.machine = self.params.get('machine',
>                                          default=self._get_unique_tag_val('machine'))
>   
> -        default_qemu_bin = pick_default_qemu_bin(arch=self.arch)
> +        default_qemu_bin = pick_default_qemu_bin(bin_fmt, arch=self.arch)
>           self.qemu_bin = self.params.get('qemu_bin',
>                                           default=default_qemu_bin)
>           if self.qemu_bin is None:
> @@ -217,7 +217,7 @@ def fetch_asset(self, name,
>   class Test(QemuBaseTest):
>       def setUp(self):
>           self._vms = {}
> -        super(Test, self).setUp()
> +        super(Test, self).setUp("qemu-system-%s")
>   
>       def _new_vm(self, *args):
>           self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")


