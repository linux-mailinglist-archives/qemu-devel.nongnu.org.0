Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6112838F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 18:28:08 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40355 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTqZb-0000Ti-KK
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 12:28:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1hTqXN-0007gp-Vs
	for qemu-devel@nongnu.org; Thu, 23 May 2019 12:25:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1hTqXM-0002TO-LE
	for qemu-devel@nongnu.org; Thu, 23 May 2019 12:25:49 -0400
Received: from mail-yb1-f195.google.com ([209.85.219.195]:34347)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1hTqXM-0002Ss-29
	for qemu-devel@nongnu.org; Thu, 23 May 2019 12:25:48 -0400
Received: by mail-yb1-f195.google.com with SMTP id v78so2504323ybv.1
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 09:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8jc8gC1FsjETx+Zw1+/DIZ7IwnaG09oHp+wbeAXPGvc=;
	b=e9rq3pRSNODZzOHaxF54PfDJwIgyrEzTY0RjYlFRXzjVtJcMCXIdCMT2pnuFUUVCqo
	mw6wn+pILvHMNdQSnU5eN/M9LKQKN0HwEJVDTdg8BfCq4foUqg1P7O/mfLKbH/BW22OI
	W4K4lMx3CfCjQBVrJz860udFbyQ8yRIl6aMaQoh3wKyeCnQ6SHxZRmWp8s7wumV6Sz7u
	ObjPJyVWzruCNuZwePvmedxpCoYk4iDGE86kcLWwE+oWAFfkJCZnhkTfry7PllGOai91
	0DmsJn9PCVgm3/Jq/UD4UVscaxlV55BJMOLNoGhjZCU3OSic2blP5WTNoHdYBsvasjld
	nfrg==
X-Gm-Message-State: APjAAAVJLOOv/Ly4Gm2bgFZvL95a1oN3qRmTxPH2jyObEBr3MFceAjw8
	ftRWDVoMIqyxP/HSOyMufneq+1s74Twl9QyZN/M=
X-Google-Smtp-Source: APXvYqwDK/oeqlcsTuiYG++JpUYVCI0MG6kiQuHd4wVK+e77rRVSoo0/BfsvH6YZKSGr7w+e/7uBsWdQXmHjF4DrkeU=
X-Received: by 2002:a25:9704:: with SMTP id d4mr8626064ybo.312.1558628747397; 
	Thu, 23 May 2019 09:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190523161832.22490-1-f4bug@amsat.org>
In-Reply-To: <20190523161832.22490-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 23 May 2019 18:25:35 +0200
Message-ID: <CAAdtpL6N+C8paG408Sh5bfFhDq0NGwXB_aZn8agDSwAkw_MiNQ@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.219.195
Subject: Re: [Qemu-devel] [PATCH v2 0/4] mips: Add more Avocado tests
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <arikalo@wavecomp.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 23, 2019 at 6:18 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Hi,
>
> It was a rainy week-end here, so I invested it to automatize some
> of my MIPS tests.
>
> The BootLinuxSshTest is not Global warming friendly, it is not
> meant to run on a CI system but rather on a workstation previous
> to post a pull request.
> It can surely be improved, but it is a good starting point.
>
> v2: Decorate slow tests with skipIf(CONTINUOUS_INTEGRATION):
>
>   VENV    /home/travis/build/philmd/qemu/tests/venv
>   PIP     /home/travis/build/philmd/qemu/tests/requirements.txt
>   MKDIR   /home/travis/build/philmd/qemu/tests/results
>   AVOCADO tests/acceptance
> JOB ID     : 02a2b1c585c12aebfbd8db2f330ed9730a547ae0
> JOB LOG    : /home/travis/build/philmd/qemu/tests/results/job-2019-05-23T=
16.05-02a2b1c/job.log
>  (01/22) acceptance/boot_linux_console.py:BootLinuxConsole.test_x86_64_pc=
:  PASS (5.41 s)
>  (02/22) acceptance/boot_linux_console.py:BootLinuxConsole.test_mips_malt=
a:  PASS (3.33 s)
>  (03/22) acceptance/boot_linux_console.py:BootLinuxConsole.test_mips64el_=
malta:  PASS (3.47 s)
>  (04/22) acceptance/boot_linux_console.py:BootLinuxConsole.test_mips_malt=
a_cpio:  PASS (15.09 s)
>  (05/22) acceptance/boot_linux_console.py:BootLinuxConsole.test_aarch64_v=
irt:  PASS (2.48 s)
>  (06/22) acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_virt:=
  PASS (7.25 s)
>  (07/22) acceptance/boot_linux_console.py:BootLinuxConsole.test_s390x_s39=
0_ccw_virtio:  PASS (4.66 s)
>  (08/22) acceptance/boot_linux_console.py:BootLinuxConsole.test_alpha_cli=
pper:  PASS (3.37 s)
>  (09/22) acceptance/cpu_queries.py:QueryCPUModelExpansion.test:  PASS (0.=
16 s)
>  (10/22) acceptance/empty_cpu_model.py:EmptyCPUModel.test:  PASS (0.02 s)
>  (11/22) acceptance/linux_initrd.py:LinuxInitrd.test_with_2gib_file_shoul=
d_exit_error_msg_with_linux_v3_6:  PASS (3.89 s)
>  (12/22) acceptance/linux_initrd.py:LinuxInitrd.test_with_2gib_file_shoul=
d_work_with_linux_v4_16:  PASS (15.14 s)
>  (13/22) acceptance/linux_ssh_mips_malta.py:LinuxSSH.test_mips_malta32eb_=
kernel3_2_0:  SKIP: Running on Travis-CI
>  (14/22) acceptance/linux_ssh_mips_malta.py:LinuxSSH.test_mips_malta64el_=
kernel3_2_0:  SKIP: Running on Travis-CI

Job output here:
https://travis-ci.org/philmd/qemu/jobs/536369687
"Ran for 16 min 26 sec"

>  (15/22) acceptance/migration.py:Migration.test_migration_with_tcp_localh=
ost:  PASS (0.23 s)
>  (16/22) acceptance/version.py:Version.test_qmp_human_info_version:  PASS=
 (0.04 s)
>  (17/22) acceptance/virtio_version.py:VirtioVersionCheck.test_conventiona=
l_devs:  PASS (1.20 s)
>  (18/22) acceptance/virtio_version.py:VirtioVersionCheck.test_modern_only=
_devs:  PASS (0.41 s)
>  (19/22) acceptance/vnc.py:Vnc.test_no_vnc:  PASS (0.03 s)
>  (20/22) acceptance/vnc.py:Vnc.test_no_vnc_change_password:  PASS (0.04 s=
)
>  (21/22) acceptance/vnc.py:Vnc.test_vnc_change_password_requires_a_passwo=
rd:  PASS (0.04 s)
>  (22/22) acceptance/vnc.py:Vnc.test_vnc_change_password:  PASS (0.04 s)
> RESULTS    : PASS 20 | ERROR 0 | FAIL 0 | SKIP 2 | WARN 0 | INTERRUPT 0 |=
 CANCEL 0
> JOB TIME   : 68.64 s

