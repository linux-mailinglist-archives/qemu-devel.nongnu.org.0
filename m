Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D4E6A9BAB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:23:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8BW-00043S-9p; Fri, 03 Mar 2023 11:23:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8BU-00042g-6T
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:23:04 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8BS-0002FF-BH
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:23:03 -0500
Received: by mail-pj1-x1029.google.com with SMTP id bo22so3040053pjb.4
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 08:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677860580;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R+qkRF9syQ20v+D5pFmgveVeurPXd0ylLRUaVU6Vo48=;
 b=XnQvDTRNYsewSp/+73Kl5wLRtM9Gj02pMM1jyJvfl65e1FbXVCmNPsuiPFv+wqiZMO
 DpctuFAnPm0wuq5Lmhy5lsnXDr3k1jzu4HNq8C2d7A9wpby3WiDY0lxqmcWdD/nNyNCV
 l6w362w3N+94JhNEISawxxxcCE+WtE58gRrJpwM/M4tHy9umMYVkoKyL5YyxXCV2ONax
 47RQ68Dr8qeIwOwJyVz2quD5uUG8UrVReFVnbQGrWxsVvpfX2sCBjCS6r2JTTcjflGLA
 UgrpdJ/fRg1PYyiZeRQv+4p0CvGi7aGsHdcJG0O1U9pIBpmkCXm7k8w82wM7HqACj7AV
 f7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677860580;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R+qkRF9syQ20v+D5pFmgveVeurPXd0ylLRUaVU6Vo48=;
 b=zHKl0CdenYvu96VPnZKBv2nSiUlHpdIdC7YkhhlwYFSFhCdoPfzDR14G2kukwEBflq
 sxsx2PK0U1UChcjdUMjNNkYmNWYq0bIpY/qqc2CtH1WjqR4RtGzIh4absl72RB6Ju5ve
 JIs72UvpMrgoiSNpeb870oLbOB7iM4s6EezX8WBtiC2VZ1wCukkaYCpdEp8EGetQUqd9
 yQfDzw7sXMEFMGwnIBfXrYgf0ZOOv8ONyyi43j+hcigA/2/Dntkbjg6g3T2i9igE257R
 FuT7LHmVzEFCnS9nooIgevUcWYr0yDBtLp5U2P7eZSID46PntHE2TKWwuyGcJfA33QAE
 RMxQ==
X-Gm-Message-State: AO0yUKXrqfrS8hDHbNvIMdHVvwp+9VkYqpgQ5yNggHVJIqE3Ruj+hOUf
 utNno2jnSG4jpXOjMReRwHV2W8eg7KEr+eahPIuUgg==
X-Google-Smtp-Source: AK7set/3XlioQDaMHjrQLvd1Umm5xd4S9xCFzDu+kRcpSaKJC+8YnaSD3k6eaTdFkgFjx4/Lm3dTJRa5pOdlA6jBpwM=
X-Received: by 2002:a17:903:258f:b0:19a:98ea:5ef1 with SMTP id
 jb15-20020a170903258f00b0019a98ea5ef1mr898960plb.13.1677860580621; Fri, 03
 Mar 2023 08:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-6-farosas@suse.de>
In-Reply-To: <20230228192628.26140-6-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 16:22:49 +0000
Message-ID: <CAFEAcA8p86BdbbO-thyov+A-dc98iygPx6nyCmnxinCRCuKviA@mail.gmail.com>
Subject: Re: [PATCH RESEND v7 5/9] tests/avocado: Pass parameters to migration
 test
To: Fabiano Rosas <farosas@suse.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 28 Feb 2023 at 19:28, Fabiano Rosas <farosas@suse.de> wrote:
>
> The migration tests are currently broken for an aarch64 host because
> the tests pass no 'machine' and 'cpu' options on the QEMU command
> line.
>
> Add a separate class to each architecture so that we can specify
> 'machine' and 'cpu' options instead of relying on defaults.
>
> Add a skip decorator to keep the current behavior of only running
> migration tests when the qemu target matches the host architecture.

I still don't understand this patch. Don't we run the
migration-test on all hosts already? David ?

> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>  tests/avocado/migration.py | 83 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 78 insertions(+), 5 deletions(-)
>
> diff --git a/tests/avocado/migration.py b/tests/avocado/migration.py
> index 4b25680c50..8b2ec0e3c4 100644
> --- a/tests/avocado/migration.py
> +++ b/tests/avocado/migration.py
> @@ -11,6 +11,8 @@
>
>
>  import tempfile
> +import os
> +
>  from avocado_qemu import QemuSystemTest
>  from avocado import skipUnless
>
> @@ -19,7 +21,7 @@
>  from avocado.utils.path import find_command
>
>
> -class Migration(QemuSystemTest):
> +class MigrationTest(QemuSystemTest):
>      """
>      :avocado: tags=migration
>      """
> @@ -62,20 +64,91 @@ def _get_free_port(self):
>              self.cancel('Failed to find a free port')
>          return port
>
> -
> -    def test_migration_with_tcp_localhost(self):
> +    def migration_with_tcp_localhost(self):
>          dest_uri = 'tcp:localhost:%u' % self._get_free_port()
>          self.do_migrate(dest_uri)
>
> -    def test_migration_with_unix(self):
> +    def migration_with_unix(self):
>          with tempfile.TemporaryDirectory(prefix='socket_') as socket_path:
>              dest_uri = 'unix:%s/qemu-test.sock' % socket_path
>              self.do_migrate(dest_uri)
>
>      @skipUnless(find_command('nc', default=False), "'nc' command not found")
> -    def test_migration_with_exec(self):
> +    def migration_with_exec(self):
>          """The test works for both netcat-traditional and netcat-openbsd packages."""
>          free_port = self._get_free_port()
>          dest_uri = 'exec:nc -l localhost %u' % free_port
>          src_uri = 'exec:nc localhost %u' % free_port
>          self.do_migrate(dest_uri, src_uri)
> +
> +
> +@skipUnless('aarch64' in os.uname()[4], "host != target")
> +class Aarch64(MigrationTest):
> +    """
> +    :avocado: tags=arch:aarch64
> +    :avocado: tags=machine:virt
> +    :avocado: tags=cpu:max
> +    """
> +
> +    def test_migration_with_tcp_localhost(self):
> +        self.migration_with_tcp_localhost()
> +
> +    def test_migration_with_unix(self):
> +        self.migration_with_unix()
> +
> +    def test_migration_with_exec(self):
> +        self.migration_with_exec()
> +
> +
> +@skipUnless('x86_64' in os.uname()[4], "host != target")
> +class X86_64(MigrationTest):
> +    """
> +    :avocado: tags=arch:x86_64
> +    :avocado: tags=machine:pc
> +    :avocado: tags=cpu:qemu64
> +    """
> +
> +    def test_migration_with_tcp_localhost(self):
> +        self.migration_with_tcp_localhost()
> +
> +    def test_migration_with_unix(self):
> +        self.migration_with_unix()
> +
> +    def test_migration_with_exec(self):
> +        self.migration_with_exec()
> +
> +
> +@skipUnless('ppc64le' in os.uname()[4], "host != target")
> +class PPC64(MigrationTest):
> +    """
> +    :avocado: tags=arch:ppc64
> +    :avocado: tags=machine:pseries
> +    :avocado: tags=cpu:power9_v2.0
> +    """
> +
> +    def test_migration_with_tcp_localhost(self):
> +        self.migration_with_tcp_localhost()
> +
> +    def test_migration_with_unix(self):
> +        self.migration_with_unix()
> +
> +    def test_migration_with_exec(self):
> +        self.migration_with_exec()
> +
> +
> +@skipUnless('s390x' in os.uname()[4], "host != target")
> +class S390X(MigrationTest):
> +    """
> +    :avocado: tags=arch:s390x
> +    :avocado: tags=machine:s390-ccw-virtio
> +    :avocado: tags=cpu:qemu
> +    """
> +
> +    def test_migration_with_tcp_localhost(self):
> +        self.migration_with_tcp_localhost()
> +
> +    def test_migration_with_unix(self):
> +        self.migration_with_unix()
> +
> +    def test_migration_with_exec(self):
> +        self.migration_with_exec()
> --
> 2.35.3

thanks
-- PMM

