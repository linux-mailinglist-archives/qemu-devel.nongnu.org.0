Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959591F3B6F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 15:09:52 +0200 (CEST)
Received: from localhost ([::1]:45688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jie0l-0005Mg-Ll
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 09:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jidzs-0004RF-0r
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 09:08:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30226
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jidzq-0004uP-4w
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 09:08:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591708132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Se0+q4dY2rAqPs9HNkytIA4ts2DUOjEu+sf89BpgX7E=;
 b=eErqspCy9rvL4fwcRoCjO6NQ8RqcrvL7ZKuzFYRiZyF6FciNvfQ7OWAZJbn3Q6ySOlkaXz
 cd+E2K7QenmdAd4ri0lOl/TOT1m3cJqARlsCmnLnCiuntsrQnZkzjI4Q8ecb6FAMdy+QwS
 vDAZKH2GjmJWCRBdMfPO+cm0LJ4CLnM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-CVxAksr2PN6F_eui1YZnag-1; Tue, 09 Jun 2020 09:08:49 -0400
X-MC-Unique: CVxAksr2PN6F_eui1YZnag-1
Received: by mail-wm1-f70.google.com with SMTP id v24so701987wmh.3
 for <qemu-devel@nongnu.org>; Tue, 09 Jun 2020 06:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Se0+q4dY2rAqPs9HNkytIA4ts2DUOjEu+sf89BpgX7E=;
 b=b29DcQ4Yw+vY0cTKlkrtlP6gRUHP4MYUjRBNsRGUsiQqrUOjN9BdKxLPPbgKH6ZFQy
 O4RwaN2V1WrqAWIXZyKv5NzqUPhv0JGYXiV6+nUXWjCy7bV8Fz5+ibWFtPYTAJRIM6H/
 nJkAykzPMkzGe54Sl3TCSOze2S+t24G5vWwtSZGcKUx3lfaVRptdlxo+p+bB4oKy6uVi
 Nxd1ckF7jwzLGTOAQ/8plh8/o+WWYLAj+6ZcPX7nfhoSQPacTBC6DJx1T3tjxpF7sby3
 jLiQB2JzCchSxhnNlsiphl1/N/YAoTNGCfDdPN6S/r9loN4hJIoycdQJikJhjQvSQiBk
 Z93w==
X-Gm-Message-State: AOAM532RTds1JBxE2AfCX9cKB1vJquRrDSekORYPpgi/ElFkB2c6SFT9
 yoiYtZ4nD2ncn9F9D6Rsr6FvRIMpts7Ddz8lSNXbgNfZctLfF9kRKldx/QlzC0c+d9NSn/UPpCK
 Qnoi+g1sGfpGnpUI=
X-Received: by 2002:adf:f6ce:: with SMTP id y14mr4572814wrp.90.1591708128521; 
 Tue, 09 Jun 2020 06:08:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8uqE+vIqFkhuO/RKYL+GVpIW8C4k60ZmpdFaoNKGqixCXnAcGZNWoWmVkT+hdIO1aFukB4A==
X-Received: by 2002:adf:f6ce:: with SMTP id y14mr4572786wrp.90.1591708128249; 
 Tue, 09 Jun 2020 06:08:48 -0700 (PDT)
Received: from [192.168.1.38] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id l204sm3011392wmf.19.2020.06.09.06.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 06:08:47 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] python/machine.py: refactor shutdown
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20200604195252.20739-1-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <8bd27ec8-1bb6-45e2-a43a-7e0229065414@redhat.com>
Date: Tue, 9 Jun 2020 15:08:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200604195252.20739-1-jsnow@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 01:38:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi John,

On 6/4/20 9:52 PM, John Snow wrote:
> v3:
>  - Split _post_shutdown refactor into own patch (now 1/3)
>  - Re-add sigkill warning squelch (now 3/3)
> 
> NOTE: I re-added the squelch in its own patch for review purposes, but
> for the purposes of avoiding temporary breakage, a maintainer may wish
> to squash patches 2 and 3 if they are accepted.
> 
> v2: Philippe took patches 1, 3 and 4.
> 
> This is a re-write of what was:
> [PATCH RFC 03/32] python//machine.py: remove bare except
> [PATCH 2/4] python/machine.py: remove bare except
> 
> It's a bit heavier handed, but it should address some of kwolf's
> feedback from the RFC version.
> 
> Applies straight to origin/master, ought to pass pylint and flake8:
> 
>> cd ~/src/qemu/python/qemu
>> pylint *.py
>> flake8 *.py
> 
> John Snow (3):
>   python/machine.py: consolidate _post_shutdown()
>   python/machine.py: refactor shutdown
>   python/machine.py: re-add sigkill warning suppression
> 
>  python/qemu/machine.py | 100 +++++++++++++++++++++++++++++------------
>  1 file changed, 71 insertions(+), 29 deletions(-)
> 

I'm now seeing this error:

21:31:58 DEBUG| / # reboot
21:32:01 DEBUG| / # reboot: Restarting system
21:32:01 DEBUG| >>> {'execute': 'quit'}
21:32:01 WARNI| qemu received signal 9; command:
"mips-softmmu/qemu-system-mips -display none -vga none -chardev
socket,id=mon,path=/tmp/tmp679upvrk/qemu-10292-monitor.sock -mon
chardev=mon,mode=control -machine malta -chardev
socket,id=console,path=/tmp/tmp679upvrk/qemu-10292-console.sock,server,nowait
-serial chardev:console -kernel
/tmp/avocado_b3aaagr9/avocado_job_5bj0xe1h/12-tests_acceptance_boot_linux_console.py_BootLinuxConsole.test_mips_malta_cpio/boot/vmlinux-4.5.0-2-4kc-malta
-initrd
/tmp/avocado_b3aaagr9/avocado_job_5bj0xe1h/12-tests_acceptance_boot_linux_console.py_BootLinuxConsole.test_mips_malta_cpiorootfs.cpio
-append printk.time=0 console=ttyS0 console=tty rdinit=/sbin/init
noreboot -no-reboot"
21:32:01 ERROR|
21:32:01 ERROR| Reproduced traceback from:
/home/travis/build/philmd/qemu/build/tests/venv/lib/python3.6/site-packages/avocado/core/test.py:886
21:32:01 ERROR| Traceback (most recent call last):
21:32:01 ERROR|   File
"/home/travis/build/philmd/qemu/build/tests/acceptance/avocado_qemu/__init__.py",
line 195, in tearDown
21:32:01 ERROR|     vm.shutdown()
21:32:01 ERROR|   File
"/home/travis/build/philmd/qemu/python/qemu/machine.py", line 449, in
shutdown
21:32:01 ERROR|     self._do_shutdown(has_quit)
21:32:01 ERROR|   File
"/home/travis/build/philmd/qemu/python/qemu/machine.py", line 426, in
_do_shutdown
21:32:01 ERROR|     self._soft_shutdown(has_quit, timeout)
21:32:01 ERROR|   File
"/home/travis/build/philmd/qemu/python/qemu/machine.py", line 413, in
_soft_shutdown
21:32:01 ERROR|     self._qmp.cmd('quit')
21:32:01 ERROR|   File
"/home/travis/build/philmd/qemu/python/qemu/qmp.py", line 271, in cmd
21:32:01 ERROR|     return self.cmd_obj(qmp_cmd)
21:32:01 ERROR|   File
"/home/travis/build/philmd/qemu/python/qemu/qmp.py", line 249, in cmd_obj
21:32:01 ERROR|     self.__sock.sendall(json.dumps(qmp_cmd).encode('utf-8'))
21:32:01 ERROR| BrokenPipeError: [Errno 32] Broken pipe
21:32:01 ERROR|
21:32:01 DEBUG| DATA (filename=output.expected) => NOT FOUND (data
sources: variant, test, file)
21:32:01 DEBUG| DATA (filename=stdout.expected) => NOT FOUND (data
sources: variant, test, file)
21:32:01 DEBUG| DATA (filename=stderr.expected) => NOT FOUND (data
sources: variant, test, file)
21:32:01 DEBUG| Not logging /var/log/syslog (lack of permissions)
21:32:01 ERROR| ERROR
12-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_mips_malta_cpio
-> TestSetupFail: [Errno 32] Broken pipe
21:32:01 INFO |

https://travis-ci.org/github/philmd/qemu/jobs/696142277#L5329


