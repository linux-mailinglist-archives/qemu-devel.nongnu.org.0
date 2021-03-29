Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B6C34D339
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 17:03:31 +0200 (CEST)
Received: from localhost ([::1]:54280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQtQQ-00083E-4q
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 11:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lQtN3-0007Eq-4N
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:00:01 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lQtN0-0001FX-3l
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:00:00 -0400
Received: by mail-wm1-x336.google.com with SMTP id g20so6773474wmk.3
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 07:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PqgXvZwROl9lJb2f46KjlXf0vsMEmZxZHeK3PY5eVYg=;
 b=lDVZ8ZykfZCDkQVfbs8KoBdtq9DNS7fyc/mXsABHahLURXWHnm/NvpzMvGwojWmmN1
 37xMpOPSMM+GDmtr8V+4bAq8zqcjKMsdCWmQxOs4aGEPlk1CiYtmdpsHL9kxKsV2gQ8r
 iBtHncnCqkMTIxWtBRvQuPk6n4p2rocASyI8ngEIJqsEg9HZ8aMrR2/XFHr0wj32NAX1
 YsUtedMm0rKHuDTbNeoa9sAVcfCP7eRSozGfZKnDfNd8TyiK5rveRD0lQYSyYGMTlkjs
 9MZVUIUGCHZXdZMZS7+lGMJ0ken51WI6o7ZuvFgol1NdzoeVR7Rv4voPzs6GRXrcpqxK
 pHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PqgXvZwROl9lJb2f46KjlXf0vsMEmZxZHeK3PY5eVYg=;
 b=eTHjUuM5w8fIvvfcNWUmvgQ50VVOVsmAT5v/e56DeKo71WWK9yqKh4wmSUHPssdqfY
 f2u6dBnFAk+9bjtH1p2gSb8pL1cGZW0NVNpfVvlvUkpYFbY+9QwUSKLjRL5xDse5C6TA
 XBYjAEZHc0FWkWsT+VqKj6UWt30Mc7g/JtAGQTmP2C+0AQgM46UKi7IpMatRpO7LyAv5
 g5xmTQIXFf5tsCl3XZXxGpm6wOUGZ+B+pLbcwPF9Vo+QbDFD6mW9GTeUH9Fn+3mvbUfF
 NHDhNgCzUQbHniebn77oO184KVnndJ2wYw0FiHdgwp4n+OpLS3iOWWjF2KGoa/f+d2/y
 wjeg==
X-Gm-Message-State: AOAM532tOd5CQNoXzw96H+7XyoFPpmuNmPpDgFUYcNZumxSqXiEg8zvE
 S+t6z44+2ZWGdHRx/eZIhNfivQ==
X-Google-Smtp-Source: ABdhPJzXiJWI2mN4o9bpVdwMjAu52/CSF6gLuKZqCL0luJcgwXLr0kESvq36coTa9uI7DEVBwS/eeQ==
X-Received: by 2002:a1c:7fd8:: with SMTP id a207mr24474394wmd.40.1617029996108; 
 Mon, 29 Mar 2021 07:59:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j6sm22486657wmq.16.2021.03.29.07.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 07:59:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6AC1D1FF7E;
 Mon, 29 Mar 2021 15:59:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] docs: rst-ify the record/replay documentation
Date: Mon, 29 Mar 2021 15:59:47 +0100
Message-Id: <20210329145947.14280-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No changes to the text, just plain rst-ification of the original
source text. Notably:

  - fixed up indentation of bullet points
  - proper :: escapes for code samples
  - added titles to paper links
  - moved events into a table

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/index.rst                  |   1 +
 docs/{replay.txt => devel/replay.rst} | 211 ++++++++++++++------------
 MAINTAINERS                           |   2 +-
 3 files changed, 120 insertions(+), 94 deletions(-)
 rename docs/{replay.txt => devel/replay.rst} (58%)

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 7c424ea6d7..fc13090523 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -32,6 +32,7 @@ Contents:
    tcg-icount
    tracing
    multi-thread-tcg
+   replay
    tcg-plugins
    bitops
    reset
diff --git a/docs/replay.txt b/docs/devel/replay.rst
similarity index 58%
rename from docs/replay.txt
rename to docs/devel/replay.rst
index 5b008ca491..27d7cb839d 100644
--- a/docs/replay.txt
+++ b/docs/devel/replay.rst
@@ -1,8 +1,9 @@
-Copyright (c) 2010-2015 Institute for System Programming
-                        of the Russian Academy of Sciences.
-
-This work is licensed under the terms of the GNU GPL, version 2 or later.
-See the COPYING file in the top-level directory.
+..
+   Copyright (C) 2010-2015, Institute for System Programming
+   of the Russian Academy of Sciences.
+   
+   This work is licensed under the terms of the GNU GPL, version 2 or later.
+   See the COPYING file in the top-level directory.
 
 Record/replay
 -------------
@@ -24,7 +25,8 @@ Deterministic replay has the following features:
    input devices.
 
 Usage of the record/replay:
- * First, record the execution with the following command line:
+ * First, record the execution with the following command line::
+     
     qemu-system-i386 \
      -icount shift=7,rr=record,rrfile=replay.bin \
      -drive file=disk.qcow2,if=none,snapshot,id=img-direct \
@@ -32,7 +34,9 @@ Usage of the record/replay:
      -device ide-hd,drive=img-blkreplay \
      -netdev user,id=net1 -device rtl8139,netdev=net1 \
      -object filter-replay,id=replay,netdev=net1
- * After recording, you can replay it by using another command line:
+
+ * After recording, you can replay it by using another command line::
+     
     qemu-system-i386 \
      -icount shift=7,rr=replay,rrfile=replay.bin \
      -drive file=disk.qcow2,if=none,snapshot,id=img-direct \
@@ -40,8 +44,10 @@ Usage of the record/replay:
      -device ide-hd,drive=img-blkreplay \
      -netdev user,id=net1 -device rtl8139,netdev=net1 \
      -object filter-replay,id=replay,netdev=net1
+
    The only difference with recording is changing the rr option
    from record to replay.
+
  * Block device images are not actually changed in the recording mode,
    because all of the changes are written to the temporary overlay file.
    This behavior is enabled by using blkreplay driver. It should be used
@@ -53,9 +59,16 @@ Usage of the record/replay:
  * Interaction with audio devices and serial ports are recorded and replayed
    automatically when such devices are enabled.
 
-Academic papers with description of deterministic replay implementation:
-http://www.computer.org/csdl/proceedings/csmr/2012/4666/00/4666a553-abs.html
-http://dl.acm.org/citation.cfm?id=2786805.2803179
+Academic papers with description of deterministic replay
+implementation:
+
+  `Deterministic Replay of System's Execution with Multi-target QEMU
+  Simulator for Dynamic Analysis and Reverse Debugging
+  <http://www.computer.org/csdl/proceedings/csmr/2012/4666/00/4666a553-abs.html>`_
+
+  `Don't panic: reverse debugging of kernel drivers
+  <http://dl.acm.org/citation.cfm?id=2786805.2803179>`_
+  
 
 Modifications of qemu include:
  * wrappers for clock and time functions to save their return values in the log
@@ -138,20 +151,21 @@ Timers
 
 Timers are used to execute callbacks from different subsystems of QEMU
 at the specified moments of time. There are several kinds of timers:
- * Real time clock. Based on host time and used only for callbacks that
-   do not change the virtual machine state. For this reason real time
-   clock and timers does not affect deterministic replay at all.
- * Virtual clock. These timers run only during the emulation. In icount
-   mode virtual clock value is calculated using executed instructions counter.
-   That is why it is completely deterministic and does not have to be recorded.
- * Host clock. This clock is used by device models that simulate real time
-   sources (e.g. real time clock chip). Host clock is the one of the sources
-   of non-determinism. Host clock read operations should be logged to
-   make the execution deterministic.
- * Virtual real time clock. This clock is similar to real time clock but
-   it is used only for increasing virtual clock while virtual machine is
-   sleeping. Due to its nature it is also non-deterministic as the host clock
-   and has to be logged too.
+
+* Real time clock. Based on host time and used only for callbacks that
+  do not change the virtual machine state. For this reason real time
+  clock and timers does not affect deterministic replay at all.
+* Virtual clock. These timers run only during the emulation. In icount
+  mode virtual clock value is calculated using executed instructions counter.
+  That is why it is completely deterministic and does not have to be recorded.
+* Host clock. This clock is used by device models that simulate real time
+  sources (e.g. real time clock chip). Host clock is the one of the sources
+  of non-determinism. Host clock read operations should be logged to
+  make the execution deterministic.
+* Virtual real time clock. This clock is similar to real time clock but
+  it is used only for increasing virtual clock while virtual machine is
+  sleeping. Due to its nature it is also non-deterministic as the host clock
+  and has to be logged too.
 
 Checkpoints
 -----------
@@ -223,10 +237,11 @@ Block devices
 Block devices record/replay module intercepts calls of
 bdrv coroutine functions at the top of block drivers stack.
 To record and replay block operations the drive must be configured
-as following:
- -drive file=disk.qcow2,if=none,snapshot,id=img-direct
- -drive driver=blkreplay,if=none,image=img-direct,id=img-blkreplay
- -device ide-hd,drive=img-blkreplay
+as following::
+  
+  -drive file=disk.qcow2,if=none,snapshot,id=img-direct
+  -drive driver=blkreplay,if=none,image=img-direct,id=img-blkreplay
+  -device ide-hd,drive=img-blkreplay
 
 blkreplay driver should be inserted between disk image and virtual driver
 controller. Therefore all disk requests may be recorded and replayed.
@@ -246,18 +261,21 @@ are associated with the moment of time in the replay scenario.
 After recovering the VM state replay will start from that position.
 
 Default starting snapshot name may be specified with icount field
-rrsnapshot as follows:
- -icount shift=7,rr=record,rrfile=replay.bin,rrsnapshot=snapshot_name
+rrsnapshot as follows::
+  
+  -icount shift=7,rr=record,rrfile=replay.bin,rrsnapshot=snapshot_name
 
 This snapshot is created at start of recording and restored at start
 of replaying. It also can be loaded while replaying to roll back
 the execution.
 
 'snapshot' flag of the disk image must be removed to save the snapshots
-in the overlay (or original image) instead of using the temporary overlay.
- -drive file=disk.ovl,if=none,id=img-direct
- -drive driver=blkreplay,if=none,image=img-direct,id=img-blkreplay
- -device ide-hd,drive=img-blkreplay
+in the overlay (or original image) instead of using the temporary
+overlay. For example::
+  
+  -drive file=disk.ovl,if=none,id=img-direct
+  -drive driver=blkreplay,if=none,image=img-direct,id=img-blkreplay
+  -device ide-hd,drive=img-blkreplay
 
 Use QEMU monitor to create additional snapshots. 'savevm <name>' command
 created the snapshot and 'loadvm <name>' restores it. To prevent corruption
@@ -267,7 +285,7 @@ overlays and the original image remains unchanged.
 
 When you need to use snapshots with diskless virtual machine,
 it must be started with 'orphan' qcow2 image. This image will be used
-for storing VM snapshots. Here is the example of the command line for this:
+for storing VM snapshots. Here is the example of the command line for this::
 
   qemu-system-i386 -icount shift=3,rr=replay,rrfile=record.bin,rrsnapshot=init \
     -net none -drive file=empty.qcow2,if=none,id=rr
@@ -279,9 +297,10 @@ Network devices
 ---------------
 
 Record and replay for network interactions is performed with the network filter.
-Each backend must have its own instance of the replay filter as follows:
- -netdev user,id=net1 -device rtl8139,netdev=net1
- -object filter-replay,id=replay,netdev=net1
+Each backend must have its own instance of the replay filter as follows::
+
+  -netdev user,id=net1 -device rtl8139,netdev=net1
+  -object filter-replay,id=replay,netdev=net1
 
 Replay network filter is used to record and replay network packets. While
 recording the virtual machine this filter puts all packets coming from
@@ -293,8 +312,8 @@ Audio devices
 -------------
 
 Audio data is recorded and replay automatically. The command line for recording
-and replaying must contain identical specifications of audio hardware, e.g.:
- -soundhw ac97
+and replaying must contain identical specifications of audio hardware,
+e.g. `-soundhw ac97`
 
 Serial ports
 ------------
@@ -325,13 +344,14 @@ the required instruction is met.
 
 Reverse continue may include several passes of examining the execution
 between the snapshots. Each of the passes include the following steps:
- 1. loading the snapshot
- 2. replaying to examine the breakpoints
- 3. if breakpoint or watchpoint was met
-    - loading the snapshot again
-    - replaying to the required breakpoint
- 4. else
-    - proceeding to the p.1 with the earlier snapshot
+
+1. loading the snapshot
+2. replaying to examine the breakpoints
+3. if breakpoint or watchpoint was met
+   - loading the snapshot again
+   - replaying to the required breakpoint
+4. else
+   - proceeding to the p.1 with the earlier snapshot
 
 Therefore usage of the reverse debugging requires at least one snapshot
 created in advance. This can be done by omitting 'snapshot' option
@@ -362,49 +382,54 @@ When argument is an array, it is stored as 4-byte array length
 and corresponding number of bytes with data.
 Here is the list of events that are written into the log:
 
- - EVENT_INSTRUCTION. Instructions executed since last event.
-   Argument: 4-byte number of executed instructions.
- - EVENT_INTERRUPT. Used to synchronize interrupt processing.
- - EVENT_EXCEPTION. Used to synchronize exception handling.
- - EVENT_ASYNC. This is a group of events. They are always processed
-   together with checkpoints. When such an event is generated, it is
-   stored in the queue and processed only when checkpoint occurs.
-   Every such event is followed by 1-byte checkpoint id and 1-byte
-   async event id from the following list:
-     - REPLAY_ASYNC_EVENT_BH. Bottom-half callback. This event synchronizes
-       callbacks that affect virtual machine state, but normally called
-       asynchronously.
-       Argument: 8-byte operation id.
-     - REPLAY_ASYNC_EVENT_INPUT. Input device event. Contains
-       parameters of keyboard and mouse input operations
-       (key press/release, mouse pointer movement).
-       Arguments: 9-16 bytes depending of input event.
-     - REPLAY_ASYNC_EVENT_INPUT_SYNC. Internal input synchronization event.
-     - REPLAY_ASYNC_EVENT_CHAR_READ. Character (e.g., serial port) device input
-       initiated by the sender.
-       Arguments: 1-byte character device id.
-                  Array with bytes were read.
-     - REPLAY_ASYNC_EVENT_BLOCK. Block device operation. Used to synchronize
-       operations with disk and flash drives with CPU.
-       Argument: 8-byte operation id.
-     - REPLAY_ASYNC_EVENT_NET. Incoming network packet.
-       Arguments: 1-byte network adapter id.
-                  4-byte packet flags.
-                  Array with packet bytes.
- - EVENT_SHUTDOWN. Occurs when user sends shutdown event to qemu,
-   e.g., by closing the window.
- - EVENT_CHAR_WRITE. Used to synchronize character output operations.
-   Arguments: 4-byte output function return value.
-              4-byte offset in the output array.
- - EVENT_CHAR_READ_ALL. Used to synchronize character input operations,
-   initiated by qemu.
-   Argument: Array with bytes that were read.
- - EVENT_CHAR_READ_ALL_ERROR. Unsuccessful character input operation,
-   initiated by qemu.
-   Argument: 4-byte error code.
- - EVENT_CLOCK + clock_id. Group of events for host clock read operations.
-   Argument: 8-byte clock value.
- - EVENT_CHECKPOINT + checkpoint_id. Checkpoint for synchronization of
-   CPU, internal threads, and asynchronous input events. May be followed
-   by one or more EVENT_ASYNC events.
- - EVENT_END. Last event in the log.
++----------------------------------+-----------------------------------------------------------------------+---------------------------------------------------------+
+| Event                            | Description                                                           | Arguments                                               |
++==================================+=======================================================================+=========================================================+
+| EVENT_INSTRUCTION                | Instructions executed since last event                                | 4-byte number of executed instructions                  |
++----------------------------------+-----------------------------------------------------------------------+---------------------------------------------------------+
+| EVENT_INTERRUPT                  | Used to synchronize interrupt processing                              |                                                         |
++----------------------------------+-----------------------------------------------------------------------+---------------------------------------------------------+
+| EVENT_EXCEPTION                  | Used to synchronize exception handling                                |                                                         |
++----------------------------------+-----------------------------------------------------------------------+---------------------------------------------------------+
+| EVENT_ASYNC                      | This is a group of events. They are always processed                  |                                                         |
+|                                  | together with checkpoints. When such an event is generated, it is     |                                                         |
+|                                  | stored in the queue and processed only when checkpoint occurs.        |                                                         |
+|                                  | Every such event is followed by 1-byte checkpoint id and 1-byte       |                                                         |
+|                                  | async event id from the following list:                               |                                                         |
++----------------------------------+-----------------------------------------------------------------------+---------------------------------------------------------+
+| REPLAY_ASYNC_EVENT_BH            | Bottom-half callback. This event synchronizes                         | 8-byte operation id                                     |
+|                                  | callbacks that affect virtual machine state, but normally called      |                                                         |
+|                                  | asynchronously.                                                       |                                                         |
++----------------------------------+-----------------------------------------------------------------------+---------------------------------------------------------+
+| REPLAY_ASYNC_EVENT_INPUT         | Input device event. Contains                                          |                                                         |
+|                                  | parameters of keyboard and mouse input operations                     |                                                         |
+|                                  | (key press/release, mouse pointer movement).                          | 9-16 bytes depending of input event                     |
++----------------------------------+-----------------------------------------------------------------------+---------------------------------------------------------+
+| REPLAY_ASYNC_EVENT_CHAR_READ     | Character (e.g., serial port) device input initiated by the sender    | 1-byte character device id. Array with bytes were read. |
++----------------------------------+-----------------------------------------------------------------------+---------------------------------------------------------+
+| REPLAY_ASYNC_EVENT_INPUT_SYNC    | Internal input synchronization event.                                 |                                                         |
++----------------------------------+-----------------------------------------------------------------------+---------------------------------------------------------+
+| REPLAY_ASYNC_EVENT_BLOCK         | Block device operation. Used to synchronize                           | 8-byte operation id.                                    |
+|                                  | operations with disk and flash drives with CPU.                       |                                                         |
++----------------------------------+-----------------------------------------------------------------------+---------------------------------------------------------+
+| REPLAY_ASYNC_EVENT_NET           | Incoming network packet                                               | 1-byte network adapter id,  4-byte packet flags,        |
+|                                  |                                                                       | Array with packet bytes                                 |
++----------------------------------+-----------------------------------------------------------------------+---------------------------------------------------------+
+| EVENT_SHUTDOWN                   | Occurs when user sends shutdown event to qemu,                        |                                                         |
+|                                  | e.g., by closing the window.                                          |                                                         |
++----------------------------------+-----------------------------------------------------------------------+---------------------------------------------------------+
+| EVENT_CHAR_WRITE                 | Used to synchronize character output operations                       | 4-byte output function return value.                    |
+|                                  |                                                                       | 4-byte offset in the output array.                      |
++----------------------------------+-----------------------------------------------------------------------+---------------------------------------------------------+
+| EVENT_CHAR_READ_ALL              | Used to synchronize character input operations, initiated by qemu.    | Array with bytes that were read.                        |
++----------------------------------+-----------------------------------------------------------------------+---------------------------------------------------------+
+| EVENT_CHAR_READ_ALL_ERROR        | Unsuccessful character input operation, initiated by qemu.            | 4-byte error code.                                      |
++----------------------------------+-----------------------------------------------------------------------+---------------------------------------------------------+
+| EVENT_CLOCK + clock_id           | Group of events for host clock read operations.                       | 8-byte clock value.                                     |
++----------------------------------+-----------------------------------------------------------------------+---------------------------------------------------------+
+| EVENT_CHECKPOINT + checkpoint_id | Checkpoint for synchronization of                                     |                                                         |
+|                                  | CPU, internal threads, and asynchronous input events. May be followed |                                                         |
+|                                  | by one or more EVENT_ASYNC events.                                    |                                                         |
++----------------------------------+-----------------------------------------------------------------------+---------------------------------------------------------+
+| EVENT_END                        | Last event in the log.                                                |                                                         |
++----------------------------------+-----------------------------------------------------------------------+---------------------------------------------------------+
diff --git a/MAINTAINERS b/MAINTAINERS
index 554be84b32..602a2f9f02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2852,7 +2852,7 @@ F: replay/*
 F: block/blkreplay.c
 F: net/filter-replay.c
 F: include/sysemu/replay.h
-F: docs/replay.txt
+F: docs/devel/replay.rst
 F: stubs/replay.c
 F: tests/acceptance/replay_kernel.py
 F: tests/acceptance/reverse_debugging.py
-- 
2.20.1


