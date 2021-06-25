Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D7E3B47F2
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 19:03:06 +0200 (CEST)
Received: from localhost ([::1]:55826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwpEP-000731-9Q
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 13:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwpDB-0006Nb-RG
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 13:01:49 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwpD9-0005G8-RH
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 13:01:49 -0400
Received: by mail-wm1-x32e.google.com with SMTP id u20so1516273wmq.4
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 10:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=sMWJCHu10uaiSj+fyGQE6ntIHe+DFkuTve1NRip0cTQ=;
 b=cd9ptG/RpBZE7zNKBoTnfLqhpymqSFygcG02UtgQiQt3HNV6PzW/LcwS1l7W/teRW1
 a9l6boRsT/x0mScev6ww/vPx4X5l3AnRZ0rc3DQUd8XTo6Op9TkHlwa5+PSzoRFmWM3i
 wo0tgUEedr7VcA/a1karZ7mRynAcDV0cY9vgZH7FMKRadNGKfTeZOEPkbF79p4ect6LQ
 jVrUeoEpVapciDJ6Ih3239/v+zMG8F2/P474K+KgVs3mBdTs69pkpw5gayJy3eZV37kp
 0HoKnYzppdGa2aD1HgVbFYk2vDVbskind1TxgZKJJheYJCQo557kfU8WtbN/LTVFp+To
 91Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:from:subject:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=sMWJCHu10uaiSj+fyGQE6ntIHe+DFkuTve1NRip0cTQ=;
 b=sdsSAFJt5Mh4ACpXli6ud2TvdSZbcztebhdihKEFlFmgd/IEsNLw22UL6xZemb0KDz
 jwQ57x684bwPtDar7qrBPH7vAwApjFKmx51+UTz5m7bntes3JK7EKNKTAnk6o5DXnofE
 o2doUHgMnNZR+KBF8oR6c20v2eEQJ39f0vBbd/5ckNIrje1tFx5XrGi4Yg/2A2bAYf7J
 jp0pVpwe+7B7eqbGHOnQcw+a6ciDAuPNsNF4XdxLH8Ez0yWLm+H2VHxK19ywLavLE9lN
 YqNCTTFgXQYzkvQq91LFNO4FntKUrAMF3p4tfooqrChpsynjlHLEXybcxyrX4niYCZbM
 KCYQ==
X-Gm-Message-State: AOAM532ucctRGJejvIFgR0voG6yy8PjJDmJF95xepbP5k4d84rdvG3Kw
 4qxlB89Hn/eDmSfvTE+sOI8vtC3XzMuzoA==
X-Google-Smtp-Source: ABdhPJwhPF70kLgxarUZw1Hyu3yd+CHWQfUwGMCr05lmEmoeVULstjE3GJ+79lmASvJvIBxWa+svgw==
X-Received: by 2002:a05:600c:291:: with SMTP id
 17mr11755578wmk.52.1624640505753; 
 Fri, 25 Jun 2021 10:01:45 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n65sm11489117wme.21.2021.06.25.10.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 10:01:44 -0700 (PDT)
To: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Subject: tests: ReverseDebugging_AArch64.test_aarch64_virt ->
 InvalidPacketError
Message-ID: <6f85be92-627c-c3ac-2d49-fd18a00dd1f9@amsat.org>
Date: Fri, 25 Jun 2021 19:01:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Pavel,

FYI as of commit 050cee12315 ("Merge remote-tracking branch
'remotes/stsquad/tags/pull-testing-updates-250621-1' into staging")
the ReverseDebugging_AArch64 test is failing:

 (28/37)
tests/acceptance/reverse_debugging.py:ReverseDebugging_AArch64.test_aarch64_virt:
 ERROR (0.96 s)

INFO | recorded log with 1690570+ steps
INFO | replaying the execution...
INFO | connecting to gdbstub
INFO | stepping forward
INFO | saving position 40000000
ERROR|
ERROR| Reproduced traceback from:
lib/python3.8/site-packages/avocado/core/test.py:770
ERROR| Traceback (most recent call last):
ERROR|   File "acceptance/reverse_debugging.py", line 206, in
test_aarch64_virt
ERROR|     self.reverse_debugging(
ERROR|   File "acceptance/reverse_debugging.py", line 140, in
reverse_debugging
ERROR|     pc = self.get_pc(g)
ERROR|   File "acceptance/reverse_debugging.py", line 77, in get_pc
ERROR|     return self.get_reg(g, self.REG_PC)
ERROR|   File "acceptance/reverse_debugging.py", line 72, in get_reg
ERROR|     return self.get_reg_le(g, reg)
ERROR|   File "acceptance/reverse_debugging.py", line 58, in get_reg_le
ERROR|     res = g.cmd(b'p%x' % reg)
ERROR|   File "lib/python3.8/site-packages/avocado/utils/gdb.py", line
783, in cmd
ERROR|     response_payload = self.decode(result)
ERROR|   File "lib/python3.8/site-packages/avocado/utils/gdb.py", line
738, in decode
ERROR|     raise InvalidPacketError
ERROR| avocado.utils.gdb.InvalidPacketError
ERROR|
DEBUG| Local variables:
DEBUG|  -> self <class 'reverse_debugging.ReverseDebugging_AArch64'>:
28-tests/acceptance/reverse_debugging.py:ReverseDebugging_AArch64.test_aarch64_virt
DEBUG|  -> kernel_url <class 'str'>:
https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/29/Everything/aarch64/os/images/pxeboot/vmlinuz
DEBUG|  -> kernel_hash <class 'str'>:
8c73e469fc6ea06a58dc83a628fc695b693b8493
DEBUG|  -> kernel_path <class 'str'>:
avocado-cache/by_location/a00ac4ae676ef0322126abd2f7d38f50cc9cbc95/vmlinuz
DEBUG| >>> {'execute': 'quit'}
ERROR|
ERROR| Reproduced traceback from:
lib/python3.8/site-packages/avocado/core/test.py:796
ERROR| Traceback (most recent call last):
ERROR|   File "python/qemu/machine/machine.py", line 489, in _do_shutdown
ERROR|     self._soft_shutdown(timeout, has_quit)
ERROR|   File "python/qemu/machine/machine.py", line 469, in _soft_shutdown
ERROR|     self._qmp.cmd('quit')
ERROR|   File "python/qemu/qmp/__init__.py", line 325, in cmd
ERROR|     return self.cmd_obj(qmp_cmd)
ERROR|   File "python/qemu/qmp/__init__.py", line 303, in cmd_obj
ERROR|     self.__sock.sendall(json.dumps(qmp_cmd).encode('utf-8'))
ERROR| BrokenPipeError: [Errno 32] Broken pipe
ERROR|
ERROR| The above exception was the direct cause of the following exception:
ERROR|
ERROR| Traceback (most recent call last):
ERROR|   File "acceptance/avocado_qemu/__init__.py", line 244, in tearDown
ERROR|     vm.shutdown()
ERROR|   File "python/qemu/machine/machine.py", line 519, in shutdown
ERROR|     self._do_shutdown(timeout, has_quit)
ERROR|   File "python/qemu/machine/machine.py", line 492, in _do_shutdown
ERROR|     raise AbnormalShutdown("Could not perform graceful shutdown") \
ERROR| qemu.machine.machine.AbnormalShutdown: Could not perform graceful
shutdown
ERROR| Traceback (most recent call last):
ERROR| ERROR
28-tests/acceptance/reverse_debugging.py:ReverseDebugging_AArch64.test_aarch64_virt
-> InvalidPacketError:

