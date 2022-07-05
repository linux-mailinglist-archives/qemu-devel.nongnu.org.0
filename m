Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED0656797E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 23:48:15 +0200 (CEST)
Received: from localhost ([::1]:51784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8qOz-0000xi-Tx
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 17:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1o8qNr-00008m-Pi
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 17:47:03 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:45453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1o8qNq-0006Ql-4p
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 17:47:03 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8190758015E;
 Tue,  5 Jul 2022 17:47:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 05 Jul 2022 17:47:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1657057621; x=1657061221; bh=oA9RpymfPn32dxGrxTGcc6015
 VADk5ENGzCFF3APB5Y=; b=2wMq2IMfGkeWGZejMkvfCbpMufUKhnLEyblF0jq4R
 1bcuRk0xIaD0hj+9gLayoq6pfhbxvdCmgkT4elYjFB70C8emR6t/qxJpn2BKT52j
 TpDqfCbOliSnGL2bueuPF+rcTCYDLiar+BD8/Q+iD08WSZuxLt9tYT9zRi5pzlN7
 DDG4qbv0p32756UumS7URHmKLmQdngJMiz6Gjg7A+05z3UoCuir5Z9rq3s3n3bXh
 QJX/dU7xzcGruTPxgozsQpiqWwwRK8fSSgGiNMURESNIK7zAlwxJ87EzkKsWI/Kt
 hKk6KcLQTmAfkTAAAoIBuoOu/3spiU0LyukzZ8NoJnYRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2;
 t=1657057621; x=1657061221; bh=oA9RpymfPn32dxGrxTGcc6015VADk5EN
 GzCFF3APB5Y=; b=ZJVs+8EqFCjLbn5FlLJbhMqAnONS4iuRrpuNwqs0pqvAlNJQ
 v6z20YBuDnqtA0cyG5bolM4Ym5CFHsa10b2+fzz+7NOf49jFMXO5jwAgcdUpUWWP
 Id6Al3ca9Ejw0Esl8XL9/kElp7CBLYL7rXcNeE4HYg+OGlIA2zp6T943qaiE+XcN
 uzGdLI/Q9Zl295KsWEV5A5vv9vn9YDMgJZFpJbKK4DeERYanS+JxGyx/7EO3EzKe
 avhPGW/J11V2UPXuGrpKHxyZtD/B5smd2Mm5AsQfLPtwXHyV6/8vDTtfa6i5OxQO
 7tqa73TTI/T2rgh6QmPtrPkAlTmX88Zl92jJYw==
X-ME-Sender: <xms:VbHEYkxXhuomJgvwNTFW4rjSyfmOwBnXUioc7rB9K-ODPgy3jQYhZg>
 <xme:VbHEYoSPpzcsC7KOBSH4LToXu3_VfsCkG6zSpA5X05398W_y0LeqTTc5QvV2zwaYY
 IeB7LzAD91nkG8_nmg>
X-ME-Received: <xmr:VbHEYmULWfqSFYkERZoYwYHTBEvoac8pJD6YRtDEDpqyLUCUh5BqVwNNPSsoBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddgudeilecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enmhhishhsihhnghcuvffquchfihgvlhguucdlfedtmdenogetfedtuddqtdduucdludeh
 mdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvg
 hrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrght
 thgvrhhnpedvjeeghfekjeejiedtuddtvdeugeehheefleetffeugeejuddttefgvdegve
 eigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 vghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:VbHEYigEJvTkuOH31CRrSHUslEVCuV-NzdcgL_BS3CyXXzlOQKEkww>
 <xmx:VbHEYmB5D90C5ld2zab7fnDDoWelPf8c42jlG6KE6Xi3gci1JrMXkw>
 <xmx:VbHEYjKKCawP9Ic7fG2xxLLxahxHjHtz8UBwi9cv1Woe3LpI1j6Xbw>
 <xmx:VbHEYhNE8ga-KVJsNULDAYAZ_nbHyNfqXhtk4RAXhZRHgGfhNM-vRQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Jul 2022 17:47:00 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: Peter Delevoryas <peter@pjd.dev>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH RESEND] python/machine: Fix AF_UNIX path too long on macOS
Date: Tue,  5 Jul 2022 14:46:59 -0700
Message-Id: <20220705214659.73369-1-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I noticed that I can't run any avocado tests on macOS because the QMP
unix socket path is too long:

$ ./configure --target-list=arm-softmmu
$ make
$ make check-avocado AVOCADO_TESTS=tests/avocado/boot_linux_console.py
changing dir to build for /Library/Developer/CommandLineTools/usr/bin/make "check-avocado"...
  GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc slirp
  AVOCADO tests/avocado
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_virt
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_emcraft_sf2
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_emcraft_sf2
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_exynos4210_initrd
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_exynos4210_initrd
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_cubieboard_initrd
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_cubieboard_initrd
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_cubieboard_sata
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_cubieboard_sata
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_quanta_gsj
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_quanta_gsj_initrd
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_quanta_gsj_initrd
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_quanta_gsj_initrd
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_ast2600_debian
JOB ID     : 84bd26125345c6f12c92d118e98acde6aacfea57
JOB LOG    : /Users/pdel/qemu/build/tests/results/job-2022-07-02T11.24-84bd261/job.log
 (01/16) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_virt: ERROR: ConnectError: Failed to establish connection: AF_UNIX path too lo
ng\n    Command: \n     Output: None\n (0.11 s)
Interrupting job (failfast).
RESULTS    : PASS 0 | ERROR 1 | FAIL 0 | SKIP 15 | WARN 0 | INTERRUPT 0 | CANCEL 0

The job log shows a backtrace that points to the QMP monitor's unix socket path:

2022-07-02 11:24:05,906 protocol         L0554 DEBUG| Awaiting connection on /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/avo_qemu_sock_uh3w_dgc/qemu-37331-10bacf110-monitor.sock ...
2022-07-02 11:24:05,907 protocol         L0426 ERROR| Failed to establish connection: OSError: AF_UNIX path too long

I think the path limit for unix sockets on macOS might be 104 [1]

/*
 * [XSI] Definitions for UNIX IPC domain.
 */
struct  sockaddr_un {
    unsigned char   sun_len;        /* sockaddr len including null */
    sa_family_t     sun_family;     /* [XSI] AF_UNIX */
    char            sun_path[104];  /* [XSI] path name (gag) */
};

The path we're using is exactly 105 characters:

$ python
Python 2.7.10 (default, Jan 19 2016, 22:24:01)
[GCC 4.2.1 Compatible Apple LLVM 7.0.2 (clang-700.1.81)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> len('/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/avo_qemu_sock_uh3w_dgc/qemu-37331-10bacf110-monitor.sock')
105

In this change I removed some of the unnecessary elements of the path, to keep
us under the limit. This seemed like the simplest thing to do, and I imagine
the extra human-readable elements were just added to make it easier to identify
left-over sockets or something else related to debugging.

[1]: /Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/un.h

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 python/qemu/machine/machine.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 37191f433b..93451774e3 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -157,7 +157,7 @@ def __init__(self,
         self._wrapper = wrapper
         self._qmp_timer = qmp_timer
 
-        self._name = name or f"qemu-{os.getpid()}-{id(self):02x}"
+        self._name = name or f"{os.getpid()}{id(self):02x}"
         self._temp_dir: Optional[str] = None
         self._base_temp_dir = base_temp_dir
         self._sock_dir = sock_dir
@@ -167,7 +167,7 @@ def __init__(self,
             self._monitor_address = monitor_address
         else:
             self._monitor_address = os.path.join(
-                self.sock_dir, f"{self._name}-monitor.sock"
+                self.sock_dir, f"{self._name}.sock"
             )
 
         self._console_log_path = console_log
-- 
2.37.0


