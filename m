Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB02664C24
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 20:16:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFGz0-00007C-25; Tue, 10 Jan 2023 10:56:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFGyx-0008To-QI
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:56:11 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFGyw-00041C-2i
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:56:11 -0500
Received: by mail-pg1-x534.google.com with SMTP id 36so8511418pgp.10
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 07:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7iVh/nH3j0mkVinw9tLzyucV7ro8lTcKQnlIqz7N44c=;
 b=OS6Br1AXH6t7iF2D/11NewmHKdb/mQkhHoGfPD8sz2udAOey3HDNvHzVgMw96xmA1Y
 B2+D/vQ8dohT4SUAORPBNwdSdDerSlgruCzaLca5nQcoRORI70EBEemVW5O8dbov0uHW
 7x8V/robmfoBL2tZcmI6CpscAbAkPW47Wy03pL1Gagj5v17Vdzny/BH6ieuyHj6ih/Ky
 E37hPvs7AKwgHlZeyiIiXrfQGUZa6OaeDCcHeiC+9RDi+0tf6LinEOhPQWOwAhXINIPn
 jtRZ+j+ryZQ78D+xox9iB2POXgFjYyM4i9gB6Ci5HALuf96l0OhlQGoikF4WMLy5nSPV
 so/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7iVh/nH3j0mkVinw9tLzyucV7ro8lTcKQnlIqz7N44c=;
 b=pc+OVk8IDdOqo8oJ6GLnCV/JJbuoA2z4NQr7TKYKbEdGumc2TZj0JxDnxbUD6Tp1R1
 uRyYfqAwEyiTuVFCRAAstJVzvFtdOIMOfatAHXUWhy/SY1rGltioGsF17SmMrkJHu0oX
 3Lt2IHaSgWyQ5/ITqrsMIhKgIXlYYKFke//OZ0wFQQiCyR0730asYm3lnIEG127/yIZS
 1X4/WBYuIj7YyHv39xFO9/TANjyrOSh4OyJOBYKMaL/pTwZ3uu2ljexROCCJl/je5MYy
 QvzTlyt7gV240f3/BEJ9cnyl7KgtgQaby9zZd4KclvUcDh076TDD4aWJrM0u87VdvA8E
 YqZA==
X-Gm-Message-State: AFqh2kqzHw1UiCk2vt80j28/nQs9VNK/rrxng2IXIl0CYNY0rVVMZyra
 S1/yu/vtr0Xq7qm8cbllIYGMbi6Or2siAyBwPjvxzA==
X-Google-Smtp-Source: AMrXdXtQdU9d5XkAeKyU+Omqf6N2p35NsL+tUGYOZutBb5faAaQ5dRxbww4IQXtzoxsXMiNrEe68poVgZ3qvIsWc4fw=
X-Received: by 2002:a63:e20b:0:b0:479:18a:8359 with SMTP id
 q11-20020a63e20b000000b00479018a8359mr4474562pgh.105.1673366168452; Tue, 10
 Jan 2023 07:56:08 -0800 (PST)
MIME-Version: 1.0
References: <87tu0yo458.fsf@pond.sub.org>
In-Reply-To: <87tu0yo458.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jan 2023 15:55:56 +0000
Message-ID: <CAFEAcA8ugDcG_e_DWgbz7MW_cK6xuCMcps7MgqyWF=bXjT8CmA@mail.gmail.com>
Subject: Re: make vm-build-freebsd appears to require . in PATH
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
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

On Tue, 10 Jan 2023 at 15:44, Markus Armbruster <armbru@redhat.com> wrote:
>
> Look at this:
>
>     $ make vm-build-freebsd
>     [...]
>     ### Preparing iso and disk image ...
>     /home/armbru/.cache/qemu-vm/images/freebsd.img.install.iso.xz (1/1)
>       100 %       684.3 MiB / 959.4 MiB = 0.713   222 MiB/s       0:04
>     Failed to prepare guest environment
>     Traceback (most recent call last):
>       File "/work/armbru/qemu/tests/vm/basevm.py", line 640, in main
>         return vm.build_image(args.image)
>                ^^^^^^^^^^^^^^^^^^^^^^^^^^
>       File "/work/armbru/qemu/tests/vm/freebsd", line 100, in build_image
>         self.exec_qemu_img("create", "-f", "qcow2", img_tmp, self.size)
>       File "/work/armbru/qemu/tests/vm/basevm.py", line 270, in exec_qemu_img
>         subprocess.check_call(cmd)
>       File "/usr/lib64/python3.11/subprocess.py", line 408, in check_call
>         retcode = call(*popenargs, **kwargs)
>                   ^^^^^^^^^^^^^^^^^^^^^^^^^^
>       File "/usr/lib64/python3.11/subprocess.py", line 389, in call
>         with Popen(*popenargs, **kwargs) as p:
>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^
>       File "/usr/lib64/python3.11/subprocess.py", line 1024, in __init__
>         self._execute_child(args, executable, preexec_fn, close_fds,
>       File "/usr/lib64/python3.11/subprocess.py", line 1901, in _execute_child
>         raise child_exception_type(errno_num, err_msg, err_filename)
>     FileNotFoundError: [Errno 2] No such file or directory: 'qemu-img'
>     make: *** [/work/armbru/qemu/tests/vm/Makefile.include:97: /home/armbru/.cache/qemu-vm/images/freebsd.img] Error 2
>     make: Target 'vm-build-freebsd' not remade because of errors.
>     make: Leaving directory '/work/armbru/qemu/bld'
>
> Or similar errors at a later stage when the "guest environment" doesn't
> need preparing anymore (I guess).

Does it actually require '.' on the PATH, or does it just want
a qemu-img binary on the PATH? (eg your distro one in /usr/bin).
I don't have '.' on my PATH and it works for me.

(Alternatively you can set QEMU_IMG to an absolute path to a
qemu-img, as documented in the 'make vm-help' output.)

thanks
-- PMM

