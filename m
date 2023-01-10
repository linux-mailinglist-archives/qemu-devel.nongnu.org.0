Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B65066479E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:45:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHSZ-0004eN-92; Tue, 10 Jan 2023 11:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFHSI-0004cG-TQ
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:26:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFHSH-0001hf-3e
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:26:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673367988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DBGduuxfrTb3D6c31cWbPBgXFJlhUovvJtuj8RhuoYY=;
 b=edUdV0NVeDBCVpObHjmhQvdyZlomxYBJbAoWxQ5QMDl7RVHNuepHoCsWWj932HLse6jnfp
 TwalFwQd92lETRvT9kc1obO+jN0cDAQ6u8ILp86/WSoplM56mnv4BqBBq4kydxy+nYglcL
 LnPt+bbDHfX2J0EdAo8yfNVIvp1pCuU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-k8El_p2PMHiVgV9IjC_haA-1; Tue, 10 Jan 2023 11:26:27 -0500
X-MC-Unique: k8El_p2PMHiVgV9IjC_haA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9BF180234E;
 Tue, 10 Jan 2023 16:26:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 856112026D68;
 Tue, 10 Jan 2023 16:26:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4C46621E675B; Tue, 10 Jan 2023 17:26:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: make vm-build-freebsd appears to require . in PATH
References: <87tu0yo458.fsf@pond.sub.org>
 <CAFEAcA8ugDcG_e_DWgbz7MW_cK6xuCMcps7MgqyWF=bXjT8CmA@mail.gmail.com>
Date: Tue, 10 Jan 2023 17:26:25 +0100
In-Reply-To: <CAFEAcA8ugDcG_e_DWgbz7MW_cK6xuCMcps7MgqyWF=bXjT8CmA@mail.gmail.com>
 (Peter Maydell's message of "Tue, 10 Jan 2023 15:55:56 +0000")
Message-ID: <87358inyoe.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 10 Jan 2023 at 15:44, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Look at this:
>>
>>     $ make vm-build-freebsd
>>     [...]
>>     ### Preparing iso and disk image ...
>>     /home/armbru/.cache/qemu-vm/images/freebsd.img.install.iso.xz (1/1)
>>       100 %       684.3 MiB / 959.4 MiB = 0.713   222 MiB/s       0:04
>>     Failed to prepare guest environment
>>     Traceback (most recent call last):
>>       File "/work/armbru/qemu/tests/vm/basevm.py", line 640, in main
>>         return vm.build_image(args.image)
>>                ^^^^^^^^^^^^^^^^^^^^^^^^^^
>>       File "/work/armbru/qemu/tests/vm/freebsd", line 100, in build_image
>>         self.exec_qemu_img("create", "-f", "qcow2", img_tmp, self.size)
>>       File "/work/armbru/qemu/tests/vm/basevm.py", line 270, in exec_qemu_img
>>         subprocess.check_call(cmd)
>>       File "/usr/lib64/python3.11/subprocess.py", line 408, in check_call
>>         retcode = call(*popenargs, **kwargs)
>>                   ^^^^^^^^^^^^^^^^^^^^^^^^^^
>>       File "/usr/lib64/python3.11/subprocess.py", line 389, in call
>>         with Popen(*popenargs, **kwargs) as p:
>>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>       File "/usr/lib64/python3.11/subprocess.py", line 1024, in __init__
>>         self._execute_child(args, executable, preexec_fn, close_fds,
>>       File "/usr/lib64/python3.11/subprocess.py", line 1901, in _execute_child
>>         raise child_exception_type(errno_num, err_msg, err_filename)
>>     FileNotFoundError: [Errno 2] No such file or directory: 'qemu-img'
>>     make: *** [/work/armbru/qemu/tests/vm/Makefile.include:97: /home/armbru/.cache/qemu-vm/images/freebsd.img] Error 2
>>     make: Target 'vm-build-freebsd' not remade because of errors.
>>     make: Leaving directory '/work/armbru/qemu/bld'
>>
>> Or similar errors at a later stage when the "guest environment" doesn't
>> need preparing anymore (I guess).
>
> Does it actually require '.' on the PATH, or does it just want
> a qemu-img binary on the PATH? (eg your distro one in /usr/bin).
> I don't have '.' on my PATH and it works for me.

Do we want to use qemu-img, qemu-system-x86_64 and so forth from PATH,
or the one in the build tree?

The former could well be old, which feels like a potential source of
problems.

> (Alternatively you can set QEMU_IMG to an absolute path to a
> qemu-img, as documented in the 'make vm-help' output.)

Thanks.


