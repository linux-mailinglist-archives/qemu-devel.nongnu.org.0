Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8812558D4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 12:47:15 +0200 (CEST)
Received: from localhost ([::1]:42302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBbuc-0002Fi-8z
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 06:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kBbpM-0003Yn-4j
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 06:41:48 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kBbpJ-0005hg-3a
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 06:41:47 -0400
Received: by mail-wr1-x441.google.com with SMTP id b18so843147wrs.7
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 03:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LIf0cxQtW4hzKm0O7L8caZ594n9XcAZSf6i1rCeNjZk=;
 b=d22AIMjKeRUgBAq6Me+AslRt0Z7/E/+lfAYk3Vhyj8k1DRf8LQV5OXxTbpE/8tCkRC
 frlF68m70idHOn5t4oyqLtwzxdjs7EiR0UzvYpV4K+XqBu0PKE6PHCzb2jhS7CDPuLFr
 e6l82FARRMrbNCzVWFcNX8xoYPvXz7IV8nrAr3gN+zTMuytZyPFx4RtHP0uIevCpmbCn
 d0C2HPig5+nf8mvn+Gq8UER1gcI3Vi7YAbNXUfQkj4v5mP40brC6JnPd/dO51+ZfXlqP
 KKel+EL8jPYe0ojuwXc/Qyj3AGzSWETumaaUC7xLZ+91uV1sYj4smmidCJfTClMEunx5
 /eIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LIf0cxQtW4hzKm0O7L8caZ594n9XcAZSf6i1rCeNjZk=;
 b=feEeLct9rkHjZ88mvTPUA4l7AWPH55VmgjDlav8Grcx26XOoq2RlMTk0buX2lCXkeg
 x03GsHgfixSS59dkFF+/2nle12X8jwBSvsFvpB87A4LoIlMs8EIKEwbnbZ1yNodWAPo2
 d2vn4PJnBZOucu+GUl65aOMYUmE4fXi9mAUTMiCsYU+fyEwezbp+PNohHVXvftwqVtLZ
 DktxSXdJnE90NuV6PrZQW3w2VA0kB0r1uIC5Xlr+/0074aqDGEHOwnlL8VTdiUP28s5F
 3cPk8OzFs+1H1dvz6R9FyhxsF8YgFH/tQlbnT1msTIhrxK/WrJA9w39fpNlnjkYnT9kt
 XlqA==
X-Gm-Message-State: AOAM532DQqWgeRH7B5EkZJz1RXs6MuN8PCxUHB3U7wvnmQLDRfFpfYpE
 VjAsOWrAltggJMxmA+zqq90nsyKBD7J7Rw==
X-Google-Smtp-Source: ABdhPJzLgdt+VUg1kK5s5dAGQlueSyKj9ZHTrjhfUnKU3dUnC08oX7yEINk3+0r1h3AlB5U2mS4WfA==
X-Received: by 2002:a5d:6087:: with SMTP id w7mr916406wrt.290.1598611303029;
 Fri, 28 Aug 2020 03:41:43 -0700 (PDT)
Received: from localhost.localdomain ([197.58.77.158])
 by smtp.gmail.com with ESMTPSA id e18sm1307453wrx.50.2020.08.28.03.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 03:41:42 -0700 (PDT)
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org, aleksandar.qemu.devel@gmail.com, philmd@redhat.com,
 alex.bennee@linaro.org, eblake@redhat.com, ldoktor@redhat.com,
 jsnow@redhat.com, rth@twiddle.net, ehabkost@redhat.com, crosa@redhat.com
Subject: [PATCH 6/9] scripts/performance: Add bisect.py script
Date: Fri, 28 Aug 2020 12:40:59 +0200
Message-Id: <20200828104102.4490-7-ahmedkhaledkaraman@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828104102.4490-1-ahmedkhaledkaraman@gmail.com>
References: <20200828104102.4490-1-ahmedkhaledkaraman@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Python script that locates the commit that caused a performance
degradation or improvement in QEMU using the git bisect command
(binary search).

Syntax:
bisect.py [-h] -s,--start START [-e,--end END] [-q,--qemu QEMU] \
--target TARGET --tool {perf,callgrind} -- \
<target executable> [<target executable options>]

[-h] - Print the script arguments help message
-s,--start START - First commit hash in the search range
[-e,--end END] - Last commit hash in the search range
                (default: Latest commit)
[-q,--qemu QEMU] - QEMU path.
                (default: Path to a GitHub QEMU clone)
--target TARGET - QEMU target name
--tool {perf,callgrind} - Underlying tool used for measurements

Example of usage:
bisect.py --start=fdd76fecdd --qemu=/path/to/qemu --target=ppc \
--tool=perf -- coulomb_double-ppc -n 1000

Example output:
Start Commit Instructions:     12,710,790,060
End Commit Instructions:       13,031,083,512
Performance Change:            -2.458%

Estimated Number of Steps:     10

*****************BISECT STEP 1*****************
Instructions:        13,031,097,790
Status:              slow commit
*****************BISECT STEP 2*****************
Instructions:        12,710,805,265
Status:              fast commit
*****************BISECT STEP 3*****************
Instructions:        13,031,028,053
Status:              slow commit
*****************BISECT STEP 4*****************
Instructions:        12,711,763,211
Status:              fast commit
*****************BISECT STEP 5*****************
Instructions:        13,031,027,292
Status:              slow commit
*****************BISECT STEP 6*****************
Instructions:        12,711,748,738
Status:              fast commit
*****************BISECT STEP 7*****************
Instructions:        12,711,748,788
Status:              fast commit
*****************BISECT STEP 8*****************
Instructions:        13,031,100,493
Status:              slow commit
*****************BISECT STEP 9*****************
Instructions:        12,714,472,954
Status:              fast commit
****************BISECT STEP 10*****************
Instructions:        12,715,409,153
Status:              fast commit
****************BISECT STEP 11*****************
Instructions:        12,715,394,739
Status:              fast commit

*****************BISECT RESULT*****************
commit 0673ecdf6cb2b1445a85283db8cbacb251c46516
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Tue May 5 10:40:23 2020 -0700

    softfloat: Inline float64 compare specializations

    Replace the float64 compare specializations with inline functions
    that call the standard float64_compare{,_quiet} functions.
    Use bool as the return type.
***********************************************

Signed-off-by: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
---
 scripts/performance/bisect.py | 425 ++++++++++++++++++++++++++++++++++
 1 file changed, 425 insertions(+)
 create mode 100755 scripts/performance/bisect.py

diff --git a/scripts/performance/bisect.py b/scripts/performance/bisect.py
new file mode 100755
index 0000000000..0c60be22ce
--- /dev/null
+++ b/scripts/performance/bisect.py
@@ -0,0 +1,425 @@
+#!/usr/bin/env python3
+
+"""
+Locate the commit that caused a performance degradation or improvement in
+QEMU using the git bisect command (binary search).
+
+This file is a part of the project "TCG Continuous Benchmarking".
+
+Copyright (C) 2020  Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
+Copyright (C) 2020  Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
+
+This program is free software: you can redistribute it and/or modify
+it under the terms of the GNU General Public License as published by
+the Free Software Foundation, either version 2 of the License, or
+(at your option) any later version.
+
+This program is distributed in the hope that it will be useful,
+but WITHOUT ANY WARRANTY; without even the implied warranty of
+MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+GNU General Public License for more details.
+
+You should have received a copy of the GNU General Public License
+along with this program. If not, see <https://www.gnu.org/licenses/>.
+"""
+
+import argparse
+import multiprocessing
+import tempfile
+import os
+import shutil
+import subprocess
+import sys
+
+from typing import List
+
+
+# --------------------------- GIT WRAPPERS --------------------------
+def git_bisect(qemu_path: str, qemu_build_path: str, command: str,
+               args: List[str] = None) -> str:
+    """
+    Wrapper function for running git bisect.
+
+    Parameters:
+    qemu_path (str): QEMU path
+    qemu_build_path (str): Path to the build directory with configuration files
+    command (str): bisect command (start|fast|slow|reset)
+    args (list): Optional arguments
+
+    Returns:
+    (str): git bisect stdout.
+    """
+    process = ["git", "bisect", command]
+    if args:
+        process += args
+    bisect = subprocess.run(process,
+                            cwd=qemu_path,
+                            stdout=subprocess.PIPE,
+                            stderr=subprocess.PIPE,
+                            check=False)
+    if bisect.returncode:
+        clean_exit(qemu_build_path, bisect.stderr.decode("utf-8"))
+
+    return bisect.stdout.decode("utf-8")
+
+
+def git_checkout(commit: str, qemu_path: str, qemu_build_path: str) -> None:
+    """
+    Wrapper function for checking out a given git commit.
+
+    Parameters:
+    commit (str): Commit hash of a git commit
+    qemu_path (str): QEMU path
+    qemu_build_path (str): Path to the build directory with configuration files
+    """
+    checkout_commit = subprocess.run(["git",
+                                      "checkout",
+                                      commit],
+                                     cwd=qemu_path,
+                                     stdout=subprocess.DEVNULL,
+                                     stderr=subprocess.PIPE,
+                                     check=False)
+    if checkout_commit.returncode:
+        clean_exit(qemu_build_path, checkout_commit.stderr.decode("utf-8"))
+
+
+def git_clone(qemu_path: str) -> None:
+    """
+    Wrapper function for cloning QEMU git repo from GitHub.
+
+    Parameters:
+    qemu_path (str): Path to clone the QEMU repo to
+    """
+    clone_qemu = subprocess.run(["git",
+                                 "clone",
+                                 "https://github.com/qemu/qemu.git",
+                                 qemu_path],
+                                stderr=subprocess.STDOUT,
+                                check=False)
+    if clone_qemu.returncode:
+        sys.exit("Failed to clone QEMU!")
+# -------------------------------------------------------------------
+
+
+def check_requirements(tool: str) -> None:
+    """
+    Verify that all script requirements are installed (perf|callgrind & git).
+
+    Parameters:
+    tool (str): Tool used for the measurement (perf or callgrind)
+    """
+    if tool == "perf":
+        check_perf_installation = subprocess.run(["which", "perf"],
+                                                 stdout=subprocess.DEVNULL,
+                                                 check=False)
+        if check_perf_installation.returncode:
+            sys.exit("Please install perf before running the script.")
+
+        # Insure user has previllage to run perf
+        check_perf_executability = subprocess.run(["perf", "stat", "ls", "/"],
+                                                  stdout=subprocess.DEVNULL,
+                                                  stderr=subprocess.DEVNULL,
+                                                  check=False)
+        if check_perf_executability.returncode:
+            sys.exit("""
+        Error:
+        You may not have permission to collect stats.
+        Consider tweaking /proc/sys/kernel/perf_event_paranoid,
+        which controls use of the performance events system by
+        unprivileged users (without CAP_SYS_ADMIN).
+        -1: Allow use of (almost) all events by all users
+            Ignore mlock limit after perf_event_mlock_kb without CAP_IPC_LOCK
+        0: Disallow ftrace function tracepoint by users without CAP_SYS_ADMIN
+            Disallow raw tracepoint access by users without CAP_SYS_ADMIN
+        1: Disallow CPU event access by users without CAP_SYS_ADMIN
+        2: Disallow kernel profiling by users without CAP_SYS_ADMIN
+        To make this setting permanent, edit /etc/sysctl.conf too, e.g.:
+        kernel.perf_event_paranoid = -1
+
+        *Alternatively, you can run this script under sudo privileges.
+        """)
+    elif tool == "callgrind":
+        check_valgrind_installation = subprocess.run(["which", "valgrind"],
+                                                     stdout=subprocess.DEVNULL,
+                                                     check=False)
+        if check_valgrind_installation.returncode:
+            sys.exit("Please install valgrind before running the script.")
+
+    # Insure that git is installed
+    check_git_installation = subprocess.run(["which", "git"],
+                                            stdout=subprocess.DEVNULL,
+                                            check=False)
+    if check_git_installation.returncode:
+        sys.exit("Please install git before running the script.")
+
+
+def clean_exit(qemu_build_path: str, error_message: str) -> None:
+    """
+    Clean up intermediate files and exit.
+
+    Parameters:
+    qemu_build_path (str): Path to the build directory with configuration files
+    error_message (str): Error message to display after exiting
+    """
+    shutil.rmtree(qemu_build_path)
+    sys.exit(error_message)
+
+
+def make(qemu_build_path: str) -> None:
+    """
+    Build QEMU by running the Makefile.
+
+    Parameters:
+    qemu_build_path (str): Path to the build directory with configuration files
+    """
+    run_make = subprocess.run(["make",
+                               "-j",
+                               str(multiprocessing.cpu_count())],
+                              cwd=qemu_build_path,
+                              stdout=subprocess.DEVNULL,
+                              stderr=subprocess.PIPE,
+                              check=False)
+    if run_make.returncode:
+        clean_exit(qemu_build_path, run_make.stderr.decode("utf-8"))
+
+
+def measure_instructions(tool: str, qemu_build_path: str, target: str,
+                         command: List[str]) -> int:
+    """
+    Measure the number of instructions when running an program with QEMU.
+
+    Parameters:
+    tool (str): Tool used for the measurement (perf|callgrind)
+    qemu_build_path (str): Path to the build directory with configuration files
+    target (str): QEMU target
+    command (list): Program path and arguments
+
+    Returns:
+    (int): Number of instructions.
+    """
+    qemu_exe_path = os.path.join(qemu_build_path,
+                                 "{}-linux-user".format(target),
+                                 "qemu-{}".format(target))
+    instructions = 0
+    if tool == "perf":
+        run_perf = subprocess.run((["perf",
+                                    "stat",
+                                    "-x",
+                                    " ",
+                                    "-e",
+                                    "instructions",
+                                    qemu_exe_path]
+                                   + command),
+                                  stdout=subprocess.DEVNULL,
+                                  stderr=subprocess.PIPE,
+                                  check=False)
+        if run_perf.returncode:
+            clean_exit(qemu_build_path, run_perf.stderr.decode("utf-8"))
+
+        else:
+            perf_output = run_perf.stderr.decode("utf-8").split(" ")
+            instructions = int(perf_output[0])
+
+    elif tool == "callgrind":
+        with tempfile.NamedTemporaryFile() as tmpfile:
+            run_callgrind = subprocess.run((["valgrind",
+                                             "--tool=callgrind",
+                                             "--callgrind-out-file={}".format(
+                                                 tmpfile.name),
+                                             qemu_exe_path]
+                                            + command),
+                                           stdout=subprocess.DEVNULL,
+                                           stderr=subprocess.PIPE,
+                                           check=False)
+        if run_callgrind.returncode:
+            clean_exit(qemu_build_path, run_callgrind.stderr.decode("utf-8"))
+
+        else:
+            callgrind_output = run_callgrind.stderr.decode("utf-8").split("\n")
+            instructions = int(callgrind_output[8].split(" ")[-1])
+
+    return instructions
+
+
+def main():
+    """
+    Parse the command line arguments then start the execution.
+
+    Syntax:
+        bisect.py [-h] -s,--start START [-e,--end END] [-q,--qemu QEMU] \
+        --target TARGET --tool {perf,callgrind} -- \
+        <target executable> [<target executable options>]
+
+    Arguments:
+        [-h] - Print the script arguments help message
+        -s,--start START - First commit hash in the search range
+        [-e,--end END] - Last commit hash in the search range
+                (default: Latest commit)
+        [-q,--qemu QEMU] - QEMU path.
+                    (default: Path to a GitHub QEMU clone)
+        --target TARGET - QEMU target name
+        --tool {perf,callgrind} - Underlying tool used for measurements
+
+    Example of usage:
+        bisect.py --start=fdd76fecdd --qemu=/path/to/qemu --target=ppc \
+        --tool=perf coulomb_double-ppc -n 1000
+    """
+
+    # Parse the command line arguments
+    parser = argparse.ArgumentParser(
+        usage="bisect.py [-h] -s,--start START [-e,--end END] [-q,--qemu QEMU]"
+        " --target TARGET --tool {perf,callgrind} -- "
+        "<target executable> [<target executable options>]")
+
+    parser.add_argument("-s", "--start", dest="start", type=str, required=True,
+                        help="First commit hash in the search range")
+    parser.add_argument("-e", "--end", dest="end", type=str, default="master",
+                        help="Last commit hash in the search range")
+    parser.add_argument("-q", "--qemu", dest="qemu", type=str, default="",
+                        help="QEMU path")
+    parser.add_argument("--target", dest="target", type=str, required=True,
+                        help="QEMU target")
+    parser.add_argument("--tool", dest="tool", choices=["perf", "callgrind"],
+                        required=True, help="Tool used for measurements")
+
+    parser.add_argument("command", type=str, nargs="+", help=argparse.SUPPRESS)
+
+    args = parser.parse_args()
+
+    # Extract the needed variables from the args
+    start_commit = args.start
+    end_commit = args.end
+    qemu = args.qemu
+    target = args.target
+    tool = args.tool
+    command = args.command
+
+    # Set QEMU path
+    if qemu == "":
+        # Create a temp directory for cloning QEMU
+        tmpdir = tempfile.TemporaryDirectory()
+        qemu_path = os.path.join(tmpdir.name, "qemu")
+
+        # Clone QEMU into the temporary directory
+        print("Fetching QEMU: ", end="", flush=True)
+        git_clone(qemu_path)
+        print()
+    else:
+        qemu_path = qemu
+
+    # Create the build directory
+    qemu_build_path = os.path.join(qemu_path, "tmp-build-gcc")
+
+    if not os.path.exists(qemu_build_path):
+        os.mkdir(qemu_build_path)
+    else:
+        sys.exit("A build directory with the same name (tmp-build-gcc) used in"
+                 " the script is already in the provided QEMU path.")
+
+    # Configure QEMU
+    configure = subprocess.run(["../configure",
+                                "--target-list={}-linux-user".format(target)],
+                               cwd=qemu_build_path,
+                               stdout=subprocess.DEVNULL,
+                               stderr=subprocess.PIPE,
+                               check=False)
+    if configure.returncode:
+        clean_exit(qemu_build_path, configure.stderr.decode("utf-8"))
+
+    # Do performance measurements for the start commit
+    git_checkout(start_commit, qemu_path, qemu_build_path)
+    make(qemu_build_path)
+    start_commit_instructions = measure_instructions(tool,
+                                                     qemu_build_path,
+                                                     target,
+                                                     command)
+    print("{:<30} {}".format("Start Commit Instructions:",
+                             format(start_commit_instructions, ",")))
+
+    # Do performance measurements for the end commit
+    git_checkout(end_commit, qemu_path, qemu_build_path)
+    make(qemu_build_path)
+    end_commit_instructions = measure_instructions(tool,
+                                                   qemu_build_path,
+                                                   target,
+                                                   command)
+    print("{:<30} {}".format("End Commit Instructions:",
+                             format(end_commit_instructions, ",")))
+
+    # Calculate performance difference between start and end commits
+    performance_difference = \
+        (start_commit_instructions - end_commit_instructions) / \
+        max(end_commit_instructions, start_commit_instructions) * 100
+    performance_change = "+" if performance_difference > 0 else "-"
+    print("{:<30} {}".format("Performance Change:",
+                             performance_change +
+                             str(round(abs(performance_difference), 3))+"%"))
+
+    # Set the custom terms used for progressing in "git bisect"
+    term_old = "fast" if performance_difference < 0 else "slow"
+    term_new = "slow" if term_old == "fast" else "fast"
+
+    # Start git bisect
+    git_bisect(qemu_path, qemu_build_path, "start",
+               ["--term-old", term_old, "--term-new", term_new])
+    # Set start commit state
+    git_bisect(qemu_path, qemu_build_path, term_old, [start_commit])
+    # Set end commit state
+    bisect_output = git_bisect(
+        qemu_path, qemu_build_path, term_new, [end_commit])
+    # Print estimated bisect steps
+    print("\n{:<30} {}\n".format(
+        "Estimated Number of Steps:", bisect_output.split()[9]))
+
+    # Initialize bisect_count to track the number of performed
+    bisect_count = 1
+
+    while True:
+        print("**************BISECT STEP {}**************".
+              format(bisect_count))
+
+        make(qemu_build_path)
+
+        instructions = measure_instructions(tool,
+                                            qemu_build_path,
+                                            target,
+                                            command)
+        # Find the difference between the current instructions and start/end
+        # instructions.
+        diff_end = abs(instructions - end_commit_instructions)
+        diff_start = abs(instructions - start_commit_instructions)
+
+        # If current number of insructions is closer to that of start,
+        # set current commit as term_old.
+        # Else, set current commit as term_new.
+        if diff_end > diff_start:
+            bisect_command = term_old
+        else:
+            bisect_command = term_new
+
+        print("{:<20} {}".format("Instructions:", format(instructions, ",")))
+        print("{:<20} {}".format("Status:", "{} commit".
+                                 format(bisect_command)))
+
+        bisect_output = git_bisect(qemu_path, qemu_build_path, bisect_command)
+
+        # Continue if still bisecting,
+        # else, print result and break.
+        if not bisect_output.split(" ")[0] == "Bisecting:":
+            print("\n*****************BISECT RESULT*****************")
+            commit_message_start = bisect_output.find("commit\n") + 7
+            commit_message_end = bisect_output.find(":040000") - 1
+            print(bisect_output[commit_message_start:commit_message_end])
+            break
+
+        bisect_count += 1
+
+    # Reset git bisect
+    git_bisect(qemu_path, qemu_build_path, "reset")
+
+    # Delete temp build directory
+    shutil.rmtree(qemu_build_path)
+
+
+if __name__ == "__main__":
+    main()
-- 
2.17.1


