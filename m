Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2146822D9A2
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jul 2020 21:49:54 +0200 (CEST)
Received: from localhost ([::1]:35870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jzQB6-0006KI-Tr
	for lists+qemu-devel@lfdr.de; Sat, 25 Jul 2020 15:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jzQA1-0005dG-UJ
 for qemu-devel@nongnu.org; Sat, 25 Jul 2020 15:48:45 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:33153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jzQ9y-0004xE-GB
 for qemu-devel@nongnu.org; Sat, 25 Jul 2020 15:48:45 -0400
Received: by mail-wr1-x443.google.com with SMTP id f18so11218043wrs.0
 for <qemu-devel@nongnu.org>; Sat, 25 Jul 2020 12:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=cF4pHDberAdx270kWmqDktFE0Kkx6oPheUE1eM0/xnQ=;
 b=o+lL28tnujbIWSQxBMy8kYGFJYajZG+PUQbgPuGf1JzL4bPTXT28vWLXUatn/ZYA/W
 B23OHEQMVunrqHX7j+UREMsn/uewVdg7A3a9w1zoD9kKyNR1hVs2A0SWkxsPp1DXxmyt
 TzYi1EKsmDA002HrTRSQn748Ss/2deE3SuNWqpqw3gN7jan8JjoeXYzlmDAtZZ8q7Y4t
 +8naGdKcFln8wgCGr/jhXxkhjSq/t1Wh8X9N6sd4AFhhOSBQ8F5cqBZZ34TdvhyXdTQj
 rK60JW/HH71z7nfuVQFc4E/A20dgh9ZMm2sKPVuh0fJqQ6tc1wFN3vcU4UL5/2+aghYd
 uQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=cF4pHDberAdx270kWmqDktFE0Kkx6oPheUE1eM0/xnQ=;
 b=G/zzQrIVTTVONBonCmo/527fAjS4jvIJkha0reK1PkLSJp6a7mKnwQ6TtOz6gSe3/7
 eVDBQph1giElzVXiT9pdHsEfxGRxU87CFZ1ObzyoG9jnh+IudOc/tSg8UCDZ6WWpq0Bw
 Igb3GA/cZFBpOheDovOgOam7WiqBx1Hn1RPpg8knlbQkvfFRRBqUA8Smid1+Ps9UgOu3
 tW8i/DMR+GrioKu6DAholfqJTbYXNC4V8TEGSNgXYfhDwp8u6mdrBESMToH5hQfsnbuQ
 EBZaM3YLTkH2XC5gZmA80MInIDxMc4CaRMFFqmFS5Jmr2w+o0a+f5xJ4bg8bgFkvmoGT
 hXvQ==
X-Gm-Message-State: AOAM5335cU+3rwQ63R3IL8FbYQQuP4GQxvJDVoDy+n6oklB7fimiBqnu
 35WvWxtDrWVf2KjuJ0t8zFkqcK5UuN9kwsG6MMQ=
X-Google-Smtp-Source: ABdhPJwEpWRJ8ul+oKSmpCxCqE/clceuFQlE97i3W+wOuUMIKroenYAx62o/E9FY91GO4GT41+aSbPAj+pbpVQWxGjw=
X-Received: by 2002:adf:b30c:: with SMTP id j12mr13388066wrd.420.1595706520917; 
 Sat, 25 Jul 2020 12:48:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1c:b407:0:0:0:0:0 with HTTP; Sat, 25 Jul 2020 12:48:40
 -0700 (PDT)
In-Reply-To: <CALTWKrVXZ82BP1rornpd8-uUtZqCUmGhCw4zb5r4kyxtawJx9g@mail.gmail.com>
References: <20200721231536.21604-1-ahmedkhaledkaraman@gmail.com>
 <20200721231536.21604-2-ahmedkhaledkaraman@gmail.com>
 <CAHiYmc4e=8cb4q1Gn5i=Jx=coPQBozXHT=7kK+gKeA=vi16-7g@mail.gmail.com>
 <CALTWKrVXZ82BP1rornpd8-uUtZqCUmGhCw4zb5r4kyxtawJx9g@mail.gmail.com>
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date: Sat, 25 Jul 2020 21:48:40 +0200
Message-ID: <CAHiYmc5zcg7BkYN_GQdXSN88yd0bu6wyeoJ-Knn0O2K2ptebfg@mail.gmail.com>
Subject: Re: [PATCH 1/1] scripts/performance: Add bisect.py script
To: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000585a3e05ab496030"
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: "ldoktor@redhat.com" <ldoktor@redhat.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "jsnow@redhat.com" <jsnow@redhat.com>, "crosa@redhat.com" <crosa@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000585a3e05ab496030
Content-Type: text/plain; charset="UTF-8"

On Saturday, July 25, 2020, Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
wrote:

> On Sat, Jul 25, 2020 at 2:31 PM Aleksandar Markovic <
> aleksandar.qemu.devel@gmail.com> wrote:
>
>>
>> Hi, Ahmed.
>>
>> Yes, somewhat related to John's hints on these comments, it is customary
>> to have just a brief description before "Copyright" lines. This means one
>> sentence, or a short paragraph (3-4 sentences max). The lenghty syntax
>> commemt should be, in my opinion, moved after the license preamble, just
>> before the start of real Python code.
>>
>
> Thanks Mr. John and Aleksandar for your feedback. I will update the script
> accordingly.
>
>
>>
>> One question:
>>
>> What is the behavior in case of the executable architecture and "target"
>> command line option mismatch (for example, one specifies m68k target, but
>> passes hppa executable? Would that be detected before bisect search, or the
>> bisect procedure will be applied even though such cases do not make sense?
>>
>
> The script will exit with an error of something along the lines of
> "Invalid ELF image for this architecture".
> This is done before starting "bisect" and after the initial "configure"
> and "make".
>
>
This is good enough (the moment of detection). However, are all cleanups
done? Is temporary directory deleted?

The same questions for the scenario where the user specifies non-existant
commit ID as the start or the end commit.

Does the script work if user specifies a tag, instead of commit ID? I think
it should work. For example, can the user specify v3.1.0 as start commit,
and v4.2.0 as the end commit, in order to detect degradation/improvement
between QEMU 3.1 and QEMU 4.2? Please test if such scenario works. If it
works, I think you should insert "commit ID or tag ID" instead of "commit"
only in the commit massage and applicable code comments (including also the
user-visible help outputed on "-h").

Lastly, what happens if specified start and end commits are existant, but
in the wrong order (end is "before" start)?

Thanks,
Aleksandar





>
>> Yours, Aleksandar
>>
>>
>>
>>> +#  This program is free software: you can redistribute it and/or modify
>>> +#  it under the terms of the GNU General Public License as published by
>>> +#  the Free Software Foundation, either version 2 of the License, or
>>> +#  (at your option) any later version.
>>> +#
>>> +#  This program is distributed in the hope that it will be useful,
>>> +#  but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> +#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
>>> +#  GNU General Public License for more details.
>>> +#
>>> +#  You should have received a copy of the GNU General Public License
>>> +#  along with this program. If not, see <https://www.gnu.org/licenses/
>>> >.
>>> +
>>> +import argparse
>>> +import multiprocessing
>>> +import tempfile
>>> +import os
>>> +import shutil
>>> +import subprocess
>>> +import sys
>>> +
>>> +
>>> +############################ GIT WRAPPERS ############################
>>> +def git_bisect(qemu_path, command, args=None):
>>> +    """
>>> +    Wrapper function for running git bisect.
>>> +
>>> +    Parameters:
>>> +    qemu_path (str): QEMU path.
>>> +    command (str):   bisect command (start|fast|slow|reset).
>>> +    args (list):     Optional arguments.
>>> +
>>> +    Returns:
>>> +    (str):           git bisect stdout.
>>> +    """
>>> +    process = ["git", "bisect", command]
>>> +    if args:
>>> +        process += args
>>> +    bisect = subprocess.run(process,
>>> +                            cwd=qemu_path,
>>> +                            stdout=subprocess.PIPE,
>>> +                            stderr=subprocess.PIPE)
>>> +    if bisect.returncode:
>>> +        sys.exit(bisect.stderr.decode("utf-8"))
>>> +    return bisect.stdout.decode("utf-8")
>>> +
>>> +
>>> +def git_checkout(commit, qemu_path):
>>> +    """
>>> +    Wrapper function for checking out a given git commit.
>>> +
>>> +    Parameters:
>>> +    commit (str):    Commit hash of a git commit.
>>> +    qemu_path (str): QEMU path.
>>> +    """
>>> +    checkout_commit = subprocess.run(["git",
>>> +                                      "checkout",
>>> +                                      commit],
>>> +                                     cwd=qemu_path,
>>> +                                     stdout=subprocess.DEVNULL,
>>> +                                     stderr=subprocess.PIPE)
>>> +    if checkout_commit.returncode:
>>> +        sys.exit(checkout_commit.stderr.decode("utf-8"))
>>> +
>>> +
>>> +def git_clone(qemu_path):
>>> +    """
>>> +    Wrapper function for cloning QEMU git repo from GitHub.
>>> +
>>> +    Parameters:
>>> +    qemu_path (str): Path to clone the QEMU repo to.
>>> +    """
>>> +    clone_qemu = subprocess.run(["git",
>>> +                                 "clone",
>>> +                                 "https://github.com/qemu/qemu.git",
>>> +                                 qemu_path],
>>> +                                stderr=subprocess.STDOUT)
>>> +    if clone_qemu.returncode:
>>> +        sys.exit("Failed to clone QEMU!")
>>> +######################################################################
>>> +
>>> +
>>> +def check_requirements(tool):
>>> +    """
>>> +    Verify that all script requirements are installed (perf|callgrind &
>>> git).
>>> +
>>> +    Parameters:
>>> +    tool (str): Tool used for the measurement (perf or callgrind).
>>> +    """
>>> +    if tool == "perf":
>>> +        check_perf_installation = subprocess.run(["which", "perf"],
>>> +
>>>  stdout=subprocess.DEVNULL)
>>> +        if check_perf_installation.returncode:
>>> +            sys.exit("Please install perf before running the script.")
>>> +
>>> +        # Insure user has previllage to run perf
>>> +        check_perf_executability = subprocess.run(["perf", "stat",
>>> "ls", "/"],
>>> +
>>> stdout=subprocess.DEVNULL,
>>> +
>>> stderr=subprocess.DEVNULL)
>>> +        if check_perf_executability.returncode:
>>> +            sys.exit("""
>>> +        Error:
>>> +        You may not have permission to collect stats.
>>> +        Consider tweaking /proc/sys/kernel/perf_event_paranoid,
>>> +        which controls use of the performance events system by
>>> +        unprivileged users (without CAP_SYS_ADMIN).
>>> +        -1: Allow use of (almost) all events by all users
>>> +            Ignore mlock limit after perf_event_mlock_kb without
>>> CAP_IPC_LOCK
>>> +        0: Disallow ftrace function tracepoint by users without
>>> CAP_SYS_ADMIN
>>> +            Disallow raw tracepoint access by users without
>>> CAP_SYS_ADMIN
>>> +        1: Disallow CPU event access by users without CAP_SYS_ADMIN
>>> +        2: Disallow kernel profiling by users without CAP_SYS_ADMIN
>>> +        To make this setting permanent, edit /etc/sysctl.conf too, e.g.:
>>> +        kernel.perf_event_paranoid = -1
>>> +
>>> +        *Alternatively, you can run this script under sudo privileges.
>>> +        """)
>>> +    elif tool == "callgrind":
>>> +        check_valgrind_installation = subprocess.run(["which",
>>> "valgrind"],
>>> +
>>>  stdout=subprocess.DEVNULL)
>>> +        if check_valgrind_installation.returncode:
>>> +            sys.exit("Please install valgrind before running the
>>> script.")
>>> +
>>> +    # Insure that git is installed
>>> +    check_git_installation = subprocess.run(["which", "git"],
>>> +                                            stdout=subprocess.DEVNULL)
>>> +    if check_git_installation.returncode:
>>> +        sys.exit("Please install git before running the script.")
>>> +
>>> +
>>> +def make(qemu_build_path):
>>> +    """
>>> +    Build QEMU by running the Makefile.
>>> +
>>> +    Parameters:
>>> +    qemu_build_path (str): Path to the build directory with
>>> configuration files.
>>> +    """
>>> +    run_make = subprocess.run(["make",
>>> +                               "-j",
>>> +                               str(multiprocessing.cpu_count())],
>>> +                              cwd=qemu_build_path,
>>> +                              stdout=subprocess.DEVNULL,
>>> +                              stderr=subprocess.PIPE)
>>> +    if run_make.returncode:
>>> +        sys.exit(run_make.stderr.decode("utf-8"))
>>> +
>>> +
>>> +def measure_instructions(tool, qemu_exe_path, command):
>>> +    """
>>> +    Measure the number of instructions when running an program with
>>> QEMU.
>>> +
>>> +    Parameters:
>>> +    tool (str):          Tool used for the measurement (perf|callgrind).
>>> +    qemu_exe_path (str): Path to the QEMU executable of the equivalent
>>> target.
>>> +    command (list):      Program path and arguments.
>>> +
>>> +    Returns:
>>> +    (int):               Number of instructions.
>>> +    """
>>> +    if tool == "perf":
>>> +        run_perf = subprocess.run((["perf",
>>> +                                    "stat",
>>> +                                    "-x",
>>> +                                    " ",
>>> +                                    "-e",
>>> +                                    "instructions",
>>> +                                    qemu_exe_path]
>>> +                                   + command),
>>> +                                  stdout=subprocess.DEVNULL,
>>> +                                  stderr=subprocess.PIPE)
>>> +        if run_perf.returncode:
>>> +            sys.exit(run_perf.stderr.decode("utf-8"))
>>> +        else:
>>> +            perf_output = run_perf.stderr.decode("utf-8").split(" ")
>>> +            return int(perf_output[0])
>>> +
>>> +    elif tool == "callgrind":
>>> +        with tempfile.NamedTemporaryFile() as tmpfile:
>>> +            run_callgrind = subprocess.run((["valgrind",
>>> +                                             "--tool=callgrind",
>>> +                                             "--callgrind-out-file={}".
>>> format(
>>> +                                                 tmpfile.name),
>>> +                                             qemu_exe_path]
>>> +                                            + command),
>>> +                                           stdout=subprocess.DEVNULL,
>>> +                                           stderr=subprocess.PIPE)
>>> +        if run_callgrind.returncode:
>>> +            sys.exit(run_callgrind.stderr.decode("utf-8"))
>>> +        else:
>>> +            callgrind_output = run_callgrind.stderr.decode("
>>> utf-8").split("\n")
>>> +            return int(callgrind_output[8].split(" ")[-1])
>>> +
>>> +
>>> +def main():
>>> +    # Parse the command line arguments
>>> +    parser = argparse.ArgumentParser(
>>> +        usage="bisect.py [-h] -s,--start START [-e,--end END]
>>> [-q,--qemu QEMU] "
>>> +        "--target TARGET --tool {perf,callgrind} -- "
>>> +        "<target executable> [<target executable options>]")
>>> +
>>> +    parser.add_argument("-s", "--start", dest="start", type=str,
>>> required=True,
>>> +                        help="First commit hash in the search range")
>>> +    parser.add_argument("-e", "--end", dest="end", type=str,
>>> default="master",
>>> +                        help="Last commit hash in the search range")
>>> +    parser.add_argument("-q", "--qemu", dest="qemu", type=str,
>>> default="",
>>> +                        help="QEMU path")
>>> +    parser.add_argument("--target", dest="target", type=str,
>>> required=True,
>>> +                        help="QEMU target")
>>> +    parser.add_argument("--tool", dest="tool", choices=["perf",
>>> "callgrind"],
>>> +                        required=True, help="Tool used for
>>> measurements")
>>> +
>>> +    parser.add_argument("command", type=str, nargs="+",
>>> help=argparse.SUPPRESS)
>>> +
>>> +    args = parser.parse_args()
>>> +
>>> +    # Extract the needed variables from the args
>>> +    start_commit = args.start
>>> +    end_commit = args.end
>>> +    qemu = args.qemu
>>> +    target = args.target
>>> +    tool = args.tool
>>> +    command = args.command
>>> +
>>> +    # Set QEMU path
>>> +    if qemu == "":
>>> +        # Create a temp directory for cloning QEMU
>>> +        tmpdir = tempfile.TemporaryDirectory()
>>> +        qemu_path = os.path.join(tmpdir.name, "qemu")
>>> +
>>> +        # Clone QEMU into the temporary directory
>>> +        print("Fetching QEMU: ", end="", flush=True)
>>> +        git_clone(qemu_path)
>>> +        print()
>>> +    else:
>>> +        qemu_path = qemu
>>> +
>>> +    # Create the build directory
>>> +    qemu_build_path = os.path.join(qemu_path, "tmp-build-gcc")
>>> +    if not os.path.exists(qemu_build_path):
>>> +        os.mkdir(qemu_build_path)
>>> +    else:
>>> +        sys.exit("A build directory with the same name (tmp-build-gcc)
>>> used in "
>>> +                 "the script is already in the provided QEMU path.")
>>> +
>>> +    qemu_exe_path = os.path.join(qemu_build_path,
>>> +                                 "{}-linux-user".format(target),
>>> +                                 "qemu-{}".format(target))
>>> +
>>> +    # Configure QEMU
>>> +    configure = subprocess.run(["../configure",
>>> +                                "--target-list={}-linux-user".
>>> format(target)],
>>> +                               cwd=qemu_build_path,
>>> +                               stdout=subprocess.DEVNULL,
>>> +                               stderr=subprocess.PIPE)
>>> +    if configure.returncode:
>>> +        sys.exit(configure.stderr.decode("utf-8"))
>>> +
>>> +    # Do performance measurements for the start commit
>>> +    git_checkout(start_commit, qemu_path)
>>> +    make(qemu_build_path)
>>> +    start_commit_instructions = measure_instructions(tool,
>>> +                                                     qemu_exe_path,
>>> +                                                     command)
>>> +    print("{:<30} {}".format("Start Commit Instructions:",
>>> +                             format(start_commit_instructions, ",")))
>>> +
>>> +    # Do performance measurements for the end commit
>>> +    git_checkout(end_commit, qemu_path)
>>> +    make(qemu_build_path)
>>> +    end_commit_instructions = measure_instructions(tool,
>>> +                                                   qemu_exe_path,
>>> +                                                   command)
>>> +    print("{:<30} {}".format("End Commit Instructions:",
>>> +                             format(end_commit_instructions, ",")))
>>> +
>>> +    # Calculate performance difference between start and end commits
>>> +    performance_difference = \
>>> +        (start_commit_instructions - end_commit_instructions) / \
>>> +        max(end_commit_instructions, start_commit_instructions) * 100
>>> +    performance_change = "+" if performance_difference > 0 else "-"
>>> +    print("{:<30} {}".format("Performance Change:",
>>> +                             performance_change +
>>> +                             str(round(abs(performance_difference),
>>> 3))+"%"))
>>> +
>>> +    # Set the custom terms used for progressing in "git bisect"
>>> +    term_old = "fast" if performance_difference < 0 else "slow"
>>> +    term_new = "slow" if term_old == "fast" else "fast"
>>> +
>>> +    # Start git bisect
>>> +    git_bisect(qemu_path, "start", [
>>> +               "--term-old", term_old, "--term-new", term_new])
>>> +    # Set start commit state
>>> +    git_bisect(qemu_path, term_old, [start_commit])
>>> +    # Set end commit state
>>> +    bisect_output = git_bisect(qemu_path, term_new, [end_commit])
>>> +    # Print estimated bisect steps
>>> +    print("\n{:<30} {}\n".format(
>>> +        "Estimated Number of Steps:", bisect_output.split()[9]))
>>> +
>>> +    # Initialize bisect_count to track the number of performed
>>> +    bisect_count = 1
>>> +
>>> +    while True:
>>> +        print("**************BISECT STEP {}**************".format(
>>> bisect_count))
>>> +
>>> +        make(qemu_build_path)
>>> +
>>> +        instructions = measure_instructions(tool, qemu_exe_path,
>>> command)
>>> +        # Find the difference between the current instructions and
>>> start/end
>>> +        # instructions.
>>> +        diff_end = abs(instructions - end_commit_instructions)
>>> +        diff_start = abs(instructions - start_commit_instructions)
>>> +
>>> +        # If current number of insructions is closer to that of start,
>>> +        # set current commit as term_old.
>>> +        # Else, set current commit as term_new.
>>> +        if diff_end > diff_start:
>>> +            bisect_command = term_old
>>> +        else:
>>> +            bisect_command = term_new
>>> +
>>> +        print("{:<20} {}".format("Instructions:", format(instructions,
>>> ",")))
>>> +        print("{:<20} {}".format("Status:", "{}
>>> commit".format(bisect_command)))
>>> +
>>> +        bisect_output = git_bisect(qemu_path, bisect_command)
>>> +
>>> +        # Continue if still bisecting,
>>> +        # else, print result and break.
>>> +        if not bisect_output.split(" ")[0] == "Bisecting:":
>>> +            print("\n*****************BISECT RESULT*****************")
>>> +            commit_message_start = bisect_output.find("commit\n") + 7
>>> +            commit_message_end = bisect_output.find(":040000") - 1
>>> +            print(bisect_output[commit_message_start:commit_message_
>>> end])
>>> +            break
>>> +
>>> +        bisect_count += 1
>>> +
>>> +    # Reset git bisect
>>> +    git_bisect(qemu_path, "reset")
>>> +
>>> +    # Delete temp build directory
>>> +    shutil.rmtree(qemu_build_path)
>>> +
>>> +
>>> +if __name__ == "__main__":
>>> +    main()
>>> --
>>> 2.17.1
>>>
>>>

--000000000000585a3e05ab496030
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Saturday, July 25, 2020, Ahmed Karaman &lt;<a href=3D"mailto:ahm=
edkhaledkaraman@gmail.com">ahmedkhaledkaraman@gmail.com</a>&gt; wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>On Sat, Jul 25, 2020 at=
 2:31 PM Aleksandar Markovic &lt;<a href=3D"mailto:aleksandar.qemu.devel@gm=
ail.com" target=3D"_blank">aleksandar.qemu.devel@gmail.<wbr>com</a>&gt; wro=
te:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div><br></div><div>Hi, Ahmed.</div><div><br></div><div>Yes,=
 somewhat related to John&#39;s hints on these comments, it is customary to=
 have just a brief description before &quot;Copyright&quot; lines. This mea=
ns one sentence, or a short paragraph (3-4 sentences max). The lenghty synt=
ax commemt should be, in my opinion, moved after the license preamble, just=
 before the start of real Python code.</div></blockquote><div><br></div><di=
v>Thanks Mr. John and Aleksandar for your feedback. I will update the scrip=
t accordingly.</div><div></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div><br></div><div>One question:</div><div><br></di=
v><div>What is the behavior in case of the executable architecture and &quo=
t;target&quot; command line option mismatch (for example, one specifies m68=
k target, but passes hppa executable? Would that be detected before bisect =
search, or the bisect procedure will be applied even though such cases do n=
ot make sense?</div></blockquote><div><br></div><div>The script will exit w=
ith an error of something along the lines of &quot;Invalid ELF image for th=
is architecture&quot;.</div><div>This is done before starting &quot;bisect&=
quot; and after the initial=C2=A0&quot;configure&quot; and &quot;make&quot;=
.=C2=A0</div><div><br></div></div></div></blockquote><div><br></div><div>Th=
is is good enough (the moment of detection). However, are all cleanups done=
? Is temporary directory deleted?</div><div><br></div><div>The same questio=
ns for the scenario where the user specifies non-existant commit ID as the =
start or the end commit.</div><div><br></div><div>Does the script work if u=
ser specifies a tag, instead of commit ID? I think it should work. For exam=
ple, can the user specify v3.1.0 as start commit, and v4.2.0 as the end com=
mit, in order to detect degradation/improvement between QEMU 3.1 and QEMU 4=
.2? Please test if such scenario works. If it works, I think you should ins=
ert &quot;commit ID or tag ID&quot; instead of &quot;commit&quot; only in t=
he commit massage and applicable code comments (including also the user-vis=
ible help outputed on &quot;-h&quot;).</div><div><br></div><div>Lastly, wha=
t happens if specified start and end commits are existant, but in the wrong=
 order (end is &quot;before&quot; start)?</div><div><br></div><div>Thanks,<=
/div><div>Aleksandar</div><div><br></div><div><br></div><div><br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><br></d=
iv><div>Yours, Aleksandar</div><div><br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
+#=C2=A0 This program is free software: you can redistribute it and/or modi=
fy<br>
+#=C2=A0 it under the terms of the GNU General Public License as published =
by<br>
+#=C2=A0 the Free Software Foundation, either version 2 of the License, or<=
br>
+#=C2=A0 (at your option) any later version.<br>
+#<br>
+#=C2=A0 This program is distributed in the hope that it will be useful,<br=
>
+#=C2=A0 but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+#=C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the<br>
+#=C2=A0 GNU General Public License for more details.<br>
+#<br>
+#=C2=A0 You should have received a copy of the GNU General Public License<=
br>
+#=C2=A0 along with this program. If not, see &lt;<a href=3D"https://www.gn=
u.org/licenses/" target=3D"_blank">https://www.gnu.org/licenses/</a><wbr>&g=
t;.<br>
+<br>
+import argparse<br>
+import multiprocessing<br>
+import tempfile<br>
+import os<br>
+import shutil<br>
+import subprocess<br>
+import sys<br>
+<br>
+<br>
+############################ GIT WRAPPERS ############################<br>
+def git_bisect(qemu_path, command, args=3DNone):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Wrapper function for running git bisect.<br>
+<br>
+=C2=A0 =C2=A0 Parameters:<br>
+=C2=A0 =C2=A0 qemu_path (str): QEMU path.<br>
+=C2=A0 =C2=A0 command (str):=C2=A0 =C2=A0bisect command (start|fast|slow|r=
eset).<br>
+=C2=A0 =C2=A0 args (list):=C2=A0 =C2=A0 =C2=A0Optional arguments.<br>
+<br>
+=C2=A0 =C2=A0 Returns:<br>
+=C2=A0 =C2=A0 (str):=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git bisect st=
dout.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 process =3D [&quot;git&quot;, &quot;bisect&quot;, command]<b=
r>
+=C2=A0 =C2=A0 if args:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 process +=3D args<br>
+=C2=A0 =C2=A0 bisect =3D subprocess.run(process,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cwd=3Dqemu_path,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 stdout=3Dsubprocess.PIPE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 stderr=3Dsubprocess.PIPE)<br>
+=C2=A0 =C2=A0 if bisect.returncode:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(bisect.stderr.decode(<wbr>&quot;utf-8=
&quot;))<br>
+=C2=A0 =C2=A0 return bisect.stdout.decode(&quot;utf-8&quot;)<br>
+<br>
+<br>
+def git_checkout(commit, qemu_path):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Wrapper function for checking out a given git commit.<br>
+<br>
+=C2=A0 =C2=A0 Parameters:<br>
+=C2=A0 =C2=A0 commit (str):=C2=A0 =C2=A0 Commit hash of a git commit.<br>
+=C2=A0 =C2=A0 qemu_path (str): QEMU path.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 checkout_commit =3D subprocess.run([&quot;git&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;checkout&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 commit],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cwd=3Dqemu_path,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stdout=3Dsubproc=
ess.DEVNULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stderr=3Dsubproc=
ess.PIPE)<br>
+=C2=A0 =C2=A0 if checkout_commit.returncode:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(checkout_commit.<wbr>stderr.decode(&q=
uot;utf-8&quot;))<br>
+<br>
+<br>
+def git_clone(qemu_path):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Wrapper function for cloning QEMU git repo from GitHub.<br>
+<br>
+=C2=A0 =C2=A0 Parameters:<br>
+=C2=A0 =C2=A0 qemu_path (str): Path to clone the QEMU repo to.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 clone_qemu =3D subprocess.run([&quot;git&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;clone&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"https://githu=
b.com/qemu/qemu.git" target=3D"_blank">https://github.com/qemu/<wbr>qemu.gi=
t</a>&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_path],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stderr=3Dsubprocess.STDOUT)<br>
+=C2=A0 =C2=A0 if clone_qemu.returncode:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(&quot;Failed to clone QEMU!&quot;)<br=
>
+#############################<wbr>##############################<wbr>#####=
######<br>
+<br>
+<br>
+def check_requirements(tool):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Verify that all script requirements are installed (perf|call=
grind &amp; git).<br>
+<br>
+=C2=A0 =C2=A0 Parameters:<br>
+=C2=A0 =C2=A0 tool (str): Tool used for the measurement (perf or callgrind=
).<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 if tool =3D=3D &quot;perf&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 check_perf_installation =3D subprocess.run([&q=
uot;which&quot;, &quot;perf&quot;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0stdout=3Dsubprocess.DEVNULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if check_perf_installation.<wbr>returncode:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(&quot;Please install pe=
rf before running the script.&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Insure user has previllage to run perf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 check_perf_executability =3D subprocess.run([&=
quot;perf&quot;, &quot;stat&quot;, &quot;ls&quot;, &quot;/&quot;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 stdout=3Dsubprocess.DEVNULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 stderr=3Dsubprocess.DEVNULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if check_perf_executability.<wbr>returncode:<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Error:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 You may not have permission to collect stats.<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Consider tweaking /proc/sys/kernel/perf_event_=
<wbr>paranoid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 which controls use of the performance events s=
ystem by<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unprivileged users (without CAP_SYS_ADMIN).<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -1: Allow use of (almost) all events by all us=
ers<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ignore mlock limit after perf_ev=
ent_mlock_kb without CAP_IPC_LOCK<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 0: Disallow ftrace function tracepoint by user=
s without CAP_SYS_ADMIN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Disallow raw tracepoint access b=
y users without CAP_SYS_ADMIN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 1: Disallow CPU event access by users without =
CAP_SYS_ADMIN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 2: Disallow kernel profiling by users without =
CAP_SYS_ADMIN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 To make this setting permanent, edit /etc/sysc=
tl.conf too, e.g.:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel.perf_event_paranoid =3D -1<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *Alternatively, you can run this script under =
sudo privileges.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;)<br>
+=C2=A0 =C2=A0 elif tool =3D=3D &quot;callgrind&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 check_valgrind_installation =3D subprocess.run=
([&quot;which&quot;, &quot;valgrind&quot;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stdout=3Dsubprocess.DEVNULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if check_valgrind_installation.<wbr>returncode=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(&quot;Please install va=
lgrind before running the script.&quot;)<br>
+<br>
+=C2=A0 =C2=A0 # Insure that git is installed<br>
+=C2=A0 =C2=A0 check_git_installation =3D subprocess.run([&quot;which&quot;=
, &quot;git&quot;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 stdout=3Dsubprocess.DEVNULL)<br>
+=C2=A0 =C2=A0 if check_git_installation.<wbr>returncode:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(&quot;Please install git before runni=
ng the script.&quot;)<br>
+<br>
+<br>
+def make(qemu_build_path):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Build QEMU by running the Makefile.<br>
+<br>
+=C2=A0 =C2=A0 Parameters:<br>
+=C2=A0 =C2=A0 qemu_build_path (str): Path to the build directory with conf=
iguration files.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 run_make =3D subprocess.run([&quot;make&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-j&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str(multiprocessing.cpu_<wbr>count())=
],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cwd=3Dqemu_build_path,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stdout=3Dsubprocess.DEVNULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stderr=3Dsubprocess.PIPE)<br>
+=C2=A0 =C2=A0 if run_make.returncode:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(run_make.stderr.<wbr>decode(&quot;utf=
-8&quot;))<br>
+<br>
+<br>
+def measure_instructions(tool, qemu_exe_path, command):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Measure the number of instructions when running an program w=
ith QEMU.<br>
+<br>
+=C2=A0 =C2=A0 Parameters:<br>
+=C2=A0 =C2=A0 tool (str):=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Tool used for =
the measurement (perf|callgrind).<br>
+=C2=A0 =C2=A0 qemu_exe_path (str): Path to the QEMU executable of the equi=
valent target.<br>
+=C2=A0 =C2=A0 command (list):=C2=A0 =C2=A0 =C2=A0 Program path and argumen=
ts.<br>
+<br>
+=C2=A0 =C2=A0 Returns:<br>
+=C2=A0 =C2=A0 (int):=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Number of instructions.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 if tool =3D=3D &quot;perf&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 run_perf =3D subprocess.run(([&quot;perf&quot;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;stat&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-x&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; &quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-e&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;instructions&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_exe_path]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ command),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stdout=3Dsubprocess.DEVNULL,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stderr=3Dsubprocess.PIPE)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if run_perf.returncode:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(run_perf.stderr.<wbr>de=
code(&quot;utf-8&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perf_output =3D run_perf.stderr.=
decode(&quot;utf-8&quot;<wbr>).split(&quot; &quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return int(perf_output[0])<br>
+<br>
+=C2=A0 =C2=A0 elif tool =3D=3D &quot;callgrind&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with tempfile.NamedTemporaryFile() as tmpfile:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 run_callgrind =3D subprocess.run=
(([&quot;valgrind&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;--tool=3Dcallgrind&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;--callgrind-out-file=3D{}&quot;.<wbr>format(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://tmpfile.name" target=3D"_blank=
">tmpfile.name</a>),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0qemu_exe_path]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 + command),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0stdout=3Dsubprocess.DEVNULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0stderr=3Dsubprocess.PIPE)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if run_callgrind.returncode:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(run_callgrind.stderr.<w=
br>decode(&quot;utf-8&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 callgrind_output =3D run_callgri=
nd.stderr.decode(&quot;<wbr>utf-8&quot;).split(&quot;\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return int(callgrind_output[8].s=
plit(<wbr>&quot; &quot;)[-1])<br>
+<br>
+<br>
+def main():<br>
+=C2=A0 =C2=A0 # Parse the command line arguments<br>
+=C2=A0 =C2=A0 parser =3D argparse.ArgumentParser(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 usage=3D&quot;bisect.py [-h] -s,--start START =
[-e,--end END] [-q,--qemu QEMU] &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;--target TARGET --tool {perf,callgrind} =
-- &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&lt;target executable&gt; [&lt;target ex=
ecutable options&gt;]&quot;)<br>
+<br>
+=C2=A0 =C2=A0 parser.add_argument(&quot;-s&quot;, &quot;--start&quot;, des=
t=3D&quot;start&quot;, type=3Dstr, required=3DTrue,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 help=3D&quot;First commit hash in the search range&quot;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&quot;-e&quot;, &quot;--end&quot;, dest=
=3D&quot;end&quot;, type=3Dstr, default=3D&quot;master&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 help=3D&quot;Last commit hash in the search range&quot;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&quot;-q&quot;, &quot;--qemu&quot;, dest=
=3D&quot;qemu&quot;, type=3Dstr, default=3D&quot;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 help=3D&quot;QEMU path&quot;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&quot;--target&quot;<wbr>, dest=3D&quot;=
target&quot;, type=3Dstr, required=3DTrue,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 help=3D&quot;QEMU target&quot;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&quot;--tool&quot;, dest=3D&quot;tool&qu=
ot;, choices=3D[&quot;perf&quot;, &quot;callgrind&quot;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 required=3DTrue, help=3D&quot;Tool used for measurements&quot;)<=
br>
+<br>
+=C2=A0 =C2=A0 parser.add_argument(&quot;command&quot;, type=3Dstr, nargs=
=3D&quot;+&quot;, help=3Dargparse.SUPPRESS)<br>
+<br>
+=C2=A0 =C2=A0 args =3D parser.parse_args()<br>
+<br>
+=C2=A0 =C2=A0 # Extract the needed variables from the args<br>
+=C2=A0 =C2=A0 start_commit =3D args.start<br>
+=C2=A0 =C2=A0 end_commit =3D args.end<br>
+=C2=A0 =C2=A0 qemu =3D args.qemu<br>
+=C2=A0 =C2=A0 target =3D args.target<br>
+=C2=A0 =C2=A0 tool =3D args.tool<br>
+=C2=A0 =C2=A0 command =3D args.command<br>
+<br>
+=C2=A0 =C2=A0 # Set QEMU path<br>
+=C2=A0 =C2=A0 if qemu =3D=3D &quot;&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Create a temp directory for cloning QEMU<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpdir =3D tempfile.TemporaryDirectory()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_path =3D os.path.join(<a href=3D"http://t=
mpdir.name" target=3D"_blank">tmpdir.name</a>, &quot;qemu&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Clone QEMU into the temporary directory<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;Fetching QEMU: &quot;, end=3D&quot=
;&quot;, flush=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 git_clone(qemu_path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print()<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_path =3D qemu<br>
+<br>
+=C2=A0 =C2=A0 # Create the build directory<br>
+=C2=A0 =C2=A0 qemu_build_path =3D os.path.join(qemu_path, &quot;tmp-build-=
gcc&quot;)<br>
+=C2=A0 =C2=A0 if not os.path.exists(qemu_build_<wbr>path):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.mkdir(qemu_build_path)<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(&quot;A build directory with the same=
 name (tmp-build-gcc) used in &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;the sc=
ript is already in the provided QEMU path.&quot;)<br>
+<br>
+=C2=A0 =C2=A0 qemu_exe_path =3D os.path.join(qemu_build_path,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;{}-linux-user&quot;.form=
at(<wbr>target),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;qemu-{}&quot;.format(tar=
get))<br>
+<br>
+=C2=A0 =C2=A0 # Configure QEMU<br>
+=C2=A0 =C2=A0 configure =3D subprocess.run([&quot;../configure&quot;<wbr>,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;--target-list=3D{}-linux-user&=
quot;.<wbr>format(target)],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cwd=3Dqemu_build_path,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stdout=3Dsubprocess.DEVNULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stderr=3Dsubprocess.PIPE)<br>
+=C2=A0 =C2=A0 if configure.returncode:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(configure.stderr.<wbr>decode(&quot;ut=
f-8&quot;))<br>
+<br>
+=C2=A0 =C2=A0 # Do performance measurements for the start commit<br>
+=C2=A0 =C2=A0 git_checkout(start_commit, qemu_path)<br>
+=C2=A0 =C2=A0 make(qemu_build_path)<br>
+=C2=A0 =C2=A0 start_commit_instructions =3D measure_instructions(tool,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_exe_path,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command)<br>
+=C2=A0 =C2=A0 print(&quot;{:&lt;30} {}&quot;.format(&quot;Start Commit Ins=
tructions:&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format(start_commit_<wbr>instructions, &quot=
;,&quot;)))<br>
+<br>
+=C2=A0 =C2=A0 # Do performance measurements for the end commit<br>
+=C2=A0 =C2=A0 git_checkout(end_commit, qemu_path)<br>
+=C2=A0 =C2=A0 make(qemu_build_path)<br>
+=C2=A0 =C2=A0 end_commit_instructions =3D measure_instructions(tool,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_exe_path,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command)<br>
+=C2=A0 =C2=A0 print(&quot;{:&lt;30} {}&quot;.format(&quot;End Commit Instr=
uctions:&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format(end_commit_<wbr>instructions, &quot;,=
&quot;)))<br>
+<br>
+=C2=A0 =C2=A0 # Calculate performance difference between start and end com=
mits<br>
+=C2=A0 =C2=A0 performance_difference =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (start_commit_instructions - end_commit_instru=
ctions) / \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 max(end_commit_instructions, start_commit_inst=
ructions) * 100<br>
+=C2=A0 =C2=A0 performance_change =3D &quot;+&quot; if performance_differen=
ce &gt; 0 else &quot;-&quot;<br>
+=C2=A0 =C2=A0 print(&quot;{:&lt;30} {}&quot;.format(&quot;Performance Chan=
ge:&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0performance_change +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str(round(abs(performance_<wbr>difference), =
3))+&quot;%&quot;))<br>
+<br>
+=C2=A0 =C2=A0 # Set the custom terms used for progressing in &quot;git bis=
ect&quot;<br>
+=C2=A0 =C2=A0 term_old =3D &quot;fast&quot; if performance_difference &lt;=
 0 else &quot;slow&quot;<br>
+=C2=A0 =C2=A0 term_new =3D &quot;slow&quot; if term_old =3D=3D &quot;fast&=
quot; else &quot;fast&quot;<br>
+<br>
+=C2=A0 =C2=A0 # Start git bisect<br>
+=C2=A0 =C2=A0 git_bisect(qemu_path, &quot;start&quot;, [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;--term-old&qu=
ot;, term_old, &quot;--term-new&quot;, term_new])<br>
+=C2=A0 =C2=A0 # Set start commit state<br>
+=C2=A0 =C2=A0 git_bisect(qemu_path, term_old, [start_commit])<br>
+=C2=A0 =C2=A0 # Set end commit state<br>
+=C2=A0 =C2=A0 bisect_output =3D git_bisect(qemu_path, term_new, [end_commi=
t])<br>
+=C2=A0 =C2=A0 # Print estimated bisect steps<br>
+=C2=A0 =C2=A0 print(&quot;\n{:&lt;30} {}\n&quot;.format(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Estimated Number of Steps:&quot;, bisect=
_output.split()[9]))<br>
+<br>
+=C2=A0 =C2=A0 # Initialize bisect_count to track the number of performed<b=
r>
+=C2=A0 =C2=A0 bisect_count =3D 1<br>
+<br>
+=C2=A0 =C2=A0 while True:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;**************BISECT STEP {}******=
********&quot;.format(<wbr>bisect_count))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 make(qemu_build_path)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 instructions =3D measure_instructions(tool, qe=
mu_exe_path, command)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Find the difference between the current inst=
ructions and start/end<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # instructions.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 diff_end =3D abs(instructions - end_commit_ins=
tructions)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 diff_start =3D abs(instructions - start_commit=
_instructions)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If current number of insructions is closer t=
o that of start,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # set current commit as term_old.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Else, set current commit as term_new.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if diff_end &gt; diff_start:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bisect_command =3D term_old<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bisect_command =3D term_new<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;{:&lt;20} {}&quot;.format(&quot;In=
structions:&quot;, format(instructions, &quot;,&quot;)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;{:&lt;20} {}&quot;.format(&quot;St=
atus:&quot;, &quot;{} commit&quot;.format(bisect_command)<wbr>))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bisect_output =3D git_bisect(qemu_path, bisect=
_command)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Continue if still bisecting,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # else, print result and break.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not bisect_output.split(&quot; &quot;)[0] =
=3D=3D &quot;Bisecting:&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;\n*****************<=
wbr>BISECT RESULT*****************&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 commit_message_start =3D bisect_=
output.find(&quot;commit\n&quot;) + 7<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 commit_message_end =3D bisect_ou=
tput.find(&quot;:040000&quot;) - 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(bisect_output[commit_<wbr>=
message_start:commit_message_<wbr>end])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bisect_count +=3D 1<br>
+<br>
+=C2=A0 =C2=A0 # Reset git bisect<br>
+=C2=A0 =C2=A0 git_bisect(qemu_path, &quot;reset&quot;)<br>
+<br>
+=C2=A0 =C2=A0 # Delete temp build directory<br>
+=C2=A0 =C2=A0 shutil.rmtree(qemu_build_path)<br>
+<br>
+<br>
+if __name__ =3D=3D &quot;__main__&quot;:<br>
+=C2=A0 =C2=A0 main()<br>
-- <br>
2.17.1<br>
<br>
</blockquote>
</blockquote></div></div>
</blockquote>

--000000000000585a3e05ab496030--

