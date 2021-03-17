Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD2B33F3DE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:13:26 +0100 (CET)
Received: from localhost ([::1]:41708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXrR-0001n9-5U
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lMXXy-0006Yv-TF
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 10:53:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lMXXv-0007nl-LP
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 10:53:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615992794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vQgeZ3ivKfXOtxaWgvn5XxbrRfiVx0m+LTu97qcYEJ0=;
 b=Pvn6BNetlR9HHcQetYz8LANsWud8i1yOOeWvgpI4QD2Hq4mt/AMHxtxxaLTmOjFhlkKwIP
 jeBGgrEoxUA6+0bTNWDwZ0pk2y0y+ocsZMTzLi4JQGrTs3bM718Izo4Y33aU+lne4/KMYu
 FszcPybR1XMQr13LtaL0X/2asQL6MmQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-OAnZogrPMEusjiVBMo0zJQ-1; Wed, 17 Mar 2021 10:53:09 -0400
X-MC-Unique: OAnZogrPMEusjiVBMo0zJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97A30107B7C6;
 Wed, 17 Mar 2021 14:53:08 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D64419C66;
 Wed, 17 Mar 2021 14:53:00 +0000 (UTC)
Subject: Re: [PATCH v3 4/5] tests/acceptance: Share useful helpers from
 virtiofs_submounts test
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210315230838.2973103-1-f4bug@amsat.org>
 <20210315230838.2973103-5-f4bug@amsat.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <cdb9df6d-ab8a-c7c3-bfa8-92dca87e6d6b@redhat.com>
Date: Wed, 17 Mar 2021 11:52:57 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210315230838.2973103-5-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 3/15/21 8:08 PM, Philippe Mathieu-Daudé wrote:
> Move the useful has_cmd()/has_cmds() helpers from the virtiofs
> test to the avocado_qemu public class.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 57 ++++++++++++++++++++++
>   tests/acceptance/virtiofs_submounts.py    | 59 +----------------------
>   2 files changed, 59 insertions(+), 57 deletions(-)

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index b471bee66e0..48c705fe3d2 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -11,6 +11,7 @@
>   import logging
>   import os
>   import shutil
> +import subprocess
>   import sys
>   import uuid
>   import tempfile
> @@ -45,6 +46,62 @@
>   from qemu.accel import tcg_available
>   from qemu.machine import QEMUMachine
>   
> +def has_cmd(name, args=None):
> +    """
> +    This function is for use in a @avocado.skipUnless decorator, e.g.:
> +
> +        @skipUnless(*has_cmd('sudo -n', ('sudo', '-n', 'true')))
> +        def test_something_that_needs_sudo(self):
> +            ...
> +    """
> +
> +    if args is None:
> +        args = ('which', name)
> +
> +    try:
> +        _, stderr, exitcode = run_cmd(args)
> +    except Exception as e:
> +        exitcode = -1
> +        stderr = str(e)
> +
> +    if exitcode != 0:
> +        cmd_line = ' '.join(args)
> +        err = f'{name} required, but "{cmd_line}" failed: {stderr.strip()}'
> +        return (False, err)
> +    else:
> +        return (True, '')
> +
> +def has_cmds(*cmds):
> +    """
> +    This function is for use in a @avocado.skipUnless decorator and
> +    allows checking for the availability of multiple commands, e.g.:
> +
> +        @skipUnless(*has_cmds(('cmd1', ('cmd1', '--some-parameter')),
> +                              'cmd2', 'cmd3'))
> +        def test_something_that_needs_cmd1_and_cmd2(self):
> +            ...
> +    """
> +
> +    for cmd in cmds:
> +        if isinstance(cmd, str):
> +            cmd = (cmd,)
> +
> +        ok, errstr = has_cmd(*cmd)
> +        if not ok:
> +            return (False, errstr)
> +
> +    return (True, '')
> +
> +def run_cmd(args):
> +    subp = subprocess.Popen(args,
> +                            stdout=subprocess.PIPE,
> +                            stderr=subprocess.PIPE,
> +                            universal_newlines=True)
> +    stdout, stderr = subp.communicate()
> +    ret = subp.returncode
> +
> +    return (stdout, stderr, ret)
> +
>   def is_readable_executable_file(path):
>       return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
>   
> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
> index 46fa65392a1..201645cd740 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -6,67 +6,12 @@
>   
>   from avocado import skipUnless
>   from avocado_qemu import LinuxTest, BUILD_DIR
> +from avocado_qemu import has_cmds
> +from avocado_qemu import run_cmd
>   from avocado_qemu import wait_for_console_pattern
>   from avocado.utils import ssh
>   
>   
> -def run_cmd(args):
> -    subp = subprocess.Popen(args,
> -                            stdout=subprocess.PIPE,
> -                            stderr=subprocess.PIPE,
> -                            universal_newlines=True)
> -    stdout, stderr = subp.communicate()
> -    ret = subp.returncode
> -
> -    return (stdout, stderr, ret)
> -
> -def has_cmd(name, args=None):
> -    """
> -    This function is for use in a @avocado.skipUnless decorator, e.g.:
> -
> -        @skipUnless(*has_cmd('sudo -n', ('sudo', '-n', 'true')))
> -        def test_something_that_needs_sudo(self):
> -            ...
> -    """
> -
> -    if args is None:
> -        args = ('which', name)
> -
> -    try:
> -        _, stderr, exitcode = run_cmd(args)
> -    except Exception as e:
> -        exitcode = -1
> -        stderr = str(e)
> -
> -    if exitcode != 0:
> -        cmd_line = ' '.join(args)
> -        err = f'{name} required, but "{cmd_line}" failed: {stderr.strip()}'
> -        return (False, err)
> -    else:
> -        return (True, '')
> -
> -def has_cmds(*cmds):
> -    """
> -    This function is for use in a @avocado.skipUnless decorator and
> -    allows checking for the availability of multiple commands, e.g.:
> -
> -        @skipUnless(*has_cmds(('cmd1', ('cmd1', '--some-parameter')),
> -                              'cmd2', 'cmd3'))
> -        def test_something_that_needs_cmd1_and_cmd2(self):
> -            ...
> -    """
> -
> -    for cmd in cmds:
> -        if isinstance(cmd, str):
> -            cmd = (cmd,)
> -
> -        ok, errstr = has_cmd(*cmd)
> -        if not ok:
> -            return (False, errstr)
> -
> -    return (True, '')
> -
> -
>   class VirtiofsSubmountsTest(LinuxTest):
>       """
>       :avocado: tags=arch:x86_64


