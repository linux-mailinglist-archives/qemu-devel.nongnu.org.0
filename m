Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2916A53E54C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:09:03 +0200 (CEST)
Received: from localhost ([::1]:58502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyELm-00046Y-96
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrJ-0002XY-J9
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr4-0000Xt-PH
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LXa79UGDmSIsbmtfVzhaW15N3u2B1s7XlJaLffWJM6E=;
 b=IpelED9orosmYIui31InE7fZe/HGQ+ORbY3OBHtk23yRKfvyqekxQryM422sgeT0HLMx52
 S5JuKAFTgy6T0oPZFi43hS2OC5RNl6yI6L9CYGaJTKZ9D8KG7DazVk87eY9MSWO+La8efb
 6cH4zqjp1dCEo8Uevm5kMYNiG/l3CTA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-Lfzy5ZcXOi-U8FGIIgMvoA-1; Mon, 06 Jun 2022 10:37:12 -0400
X-MC-Unique: Lfzy5ZcXOi-U8FGIIgMvoA-1
Received: by mail-wm1-f70.google.com with SMTP id
 be12-20020a05600c1e8c00b0039c506b52a4so877043wmb.1
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LXa79UGDmSIsbmtfVzhaW15N3u2B1s7XlJaLffWJM6E=;
 b=btgO5NkWQjR/oNxKCT39bUr2yqUzh812mDgAHXBXQNTUQi/qxec1u/+eAaz0WvAph9
 vtXMaQmwe5JM2EbXi5KP59bb/xIrKRWle6gRGSDQbgQhzv9UKB2TBee9VKL2pjKKuwwa
 84BxbFNI82SFMiJwwVPw5IpQ0xg2icu3/p9yF/dS73Gs4LA22CmIOY3/aviNYge078rq
 MyqP6Tc+8dIQh3U35RToMseHLjAuZm+9+73Az3J1eCr3dbLd/K9pcEqZagY3Sef7zSmX
 ycyrOIuPdOwMtg02WjWxoJbR6Whi9re+UH0sGTSoePYeuTzBRRkP3csCrNvA7vZT3r/W
 NNug==
X-Gm-Message-State: AOAM530K8mrkO8Ai6hJqWmUssF8j6A/hktzC5vpE17svD69kgk7gdZ5t
 EYDJBtgERYDJ787T4i7dvvfarhU6kDSDpvpbtRBCYjHginKizsCKzmgfa1kg/QwFl/Zitj8cRA3
 PeSZcWhWx9BiV+HMuIqlD7hqFsLoAUOpCRRvcFEMXKSJXZ8zs8bxhziCtLdBw7+UYLak=
X-Received: by 2002:a05:600c:1d99:b0:397:482b:429 with SMTP id
 p25-20020a05600c1d9900b00397482b0429mr51572675wms.130.1654526229701; 
 Mon, 06 Jun 2022 07:37:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtbgZohiJrCr6CfH/d9vvSYDMSKkxxFihG/65t2axBASB41I0yzwjII5WY4vufqZK48Zd11w==
X-Received: by 2002:a05:600c:1d99:b0:397:482b:429 with SMTP id
 p25-20020a05600c1d9900b00397482b0429mr51572549wms.130.1654526228194; 
 Mon, 06 Jun 2022 07:37:08 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 h1-20020a5d4fc1000000b0020fc4cd81f6sm15321524wrw.60.2022.06.06.07.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 11/29] docs: move replay docs to docs/system/replay.rst
Date: Mon,  6 Jun 2022 16:36:26 +0200
Message-Id: <20220606143644.1151112-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
References: <20220606143644.1151112-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch adds replay description page, converting prior
text from docs/replay.txt.
The text was also updated and some sections were moved
to devel part of the docs.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <165364839601.688121.5131456980322853233.stgit@pasha-ThinkPad-X280>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/replay.rst  | 264 +++++++++++++++++++++++++-
 docs/replay.txt        | 407 -----------------------------------------
 docs/system/index.rst  |   1 +
 docs/system/replay.rst | 237 ++++++++++++++++++++++++
 4 files changed, 496 insertions(+), 413 deletions(-)
 delete mode 100644 docs/replay.txt
 create mode 100644 docs/system/replay.rst

diff --git a/docs/devel/replay.rst b/docs/devel/replay.rst
index dd8bf3b195..0244be8b9c 100644
--- a/docs/devel/replay.rst
+++ b/docs/devel/replay.rst
@@ -1,20 +1,149 @@
 ..
    Copyright (c) 2022, ISP RAS
-   Written by Pavel Dovgalyuk
+   Written by Pavel Dovgalyuk and Alex Bennée
 
 =======================
 Execution Record/Replay
 =======================
 
-Record/replay mechanism, that could be enabled through icount mode, expects
-the virtual devices to satisfy the following requirements.
+Core concepts
+=============
 
-The main idea behind this document is that everything that affects
+Record/replay functions are used for the deterministic replay of qemu
+execution. Execution recording writes a non-deterministic events log, which
+can be later used for replaying the execution anywhere and for unlimited
+number of times. Execution replaying reads the log and replays all
+non-deterministic events including external input, hardware clocks,
+and interrupts.
+
+Several parts of QEMU include function calls to make event log recording
+and replaying.
+Devices' models that have non-deterministic input from external devices were
+changed to write every external event into the execution log immediately.
+E.g. network packets are written into the log when they arrive into the virtual
+network adapter.
+
+All non-deterministic events are coming from these devices. But to
+replay them we need to know at which moments they occur. We specify
+these moments by counting the number of instructions executed between
+every pair of consecutive events.
+
+Academic papers with description of deterministic replay implementation:
+
+* `Deterministic Replay of System's Execution with Multi-target QEMU Simulator for Dynamic Analysis and Reverse Debugging <https://www.computer.org/csdl/proceedings/csmr/2012/4666/00/4666a553-abs.html>`_
+* `Don't panic: reverse debugging of kernel drivers <https://dl.acm.org/citation.cfm?id=2786805.2803179>`_
+
+Modifications of qemu include:
+
+ * wrappers for clock and time functions to save their return values in the log
+ * saving different asynchronous events (e.g. system shutdown) into the log
+ * synchronization of the bottom halves execution
+ * synchronization of the threads from thread pool
+ * recording/replaying user input (mouse, keyboard, and microphone)
+ * adding internal checkpoints for cpu and io synchronization
+ * network filter for recording and replaying the packets
+ * block driver for making block layer deterministic
+ * serial port input record and replay
+ * recording of random numbers obtained from the external sources
+
+Instruction counting
+--------------------
+
+QEMU should work in icount mode to use record/replay feature. icount was
+designed to allow deterministic execution in absence of external inputs
+of the virtual machine. We also use icount to control the occurrence of the
+non-deterministic events. The number of instructions elapsed from the last event
+is written to the log while recording the execution. In replay mode we
+can predict when to inject that event using the instruction counter.
+
+Locking and thread synchronisation
+----------------------------------
+
+Previously the synchronisation of the main thread and the vCPU thread
+was ensured by the holding of the BQL. However the trend has been to
+reduce the time the BQL was held across the system including under TCG
+system emulation. As it is important that batches of events are kept
+in sequence (e.g. expiring timers and checkpoints in the main thread
+while instruction checkpoints are written by the vCPU thread) we need
+another lock to keep things in lock-step. This role is now handled by
+the replay_mutex_lock. It used to be held only for each event being
+written but now it is held for a whole execution period. This results
+in a deterministic ping-pong between the two main threads.
+
+As the BQL is now a finer grained lock than the replay_lock it is almost
+certainly a bug, and a source of deadlocks, to take the
+replay_mutex_lock while the BQL is held. This is enforced by an assert.
+While the unlocks are usually in the reverse order, this is not
+necessary; you can drop the replay_lock while holding the BQL, without
+doing a more complicated unlock_iothread/replay_unlock/lock_iothread
+sequence.
+
+Checkpoints
+-----------
+
+Replaying the execution of virtual machine is bound by sources of
+non-determinism. These are inputs from clock and peripheral devices,
+and QEMU thread scheduling. Thread scheduling affect on processing events
+from timers, asynchronous input-output, and bottom halves.
+
+Invocations of timers are coupled with clock reads and changing the state
+of the virtual machine. Reads produce non-deterministic data taken from
+host clock. And VM state changes should preserve their order. Their relative
+order in replay mode must replicate the order of callbacks in record mode.
+To preserve this order we use checkpoints. When a specific clock is processed
+in record mode we save to the log special "checkpoint" event.
+Checkpoints here do not refer to virtual machine snapshots. They are just
+record/replay events used for synchronization.
+
+QEMU in replay mode will try to invoke timers processing in random moment
+of time. That's why we do not process a group of timers until the checkpoint
+event will be read from the log. Such an event allows synchronizing CPU
+execution and timer events.
+
+Two other checkpoints govern the "warping" of the virtual clock.
+While the virtual machine is idle, the virtual clock increments at
+1 ns per *real time* nanosecond.  This is done by setting up a timer
+(called the warp timer) on the virtual real time clock, so that the
+timer fires at the next deadline of the virtual clock; the virtual clock
+is then incremented (which is called "warping" the virtual clock) as
+soon as the timer fires or the CPUs need to go out of the idle state.
+Two functions are used for this purpose; because these actions change
+virtual machine state and must be deterministic, each of them creates a
+checkpoint. ``icount_start_warp_timer`` checks if the CPUs are idle and if so
+starts accounting real time to virtual clock. ``icount_account_warp_timer``
+is called when the CPUs get an interrupt or when the warp timer fires,
+and it warps the virtual clock by the amount of real time that has passed
+since ``icount_start_warp_timer``.
+
+Virtual devices
+===============
+
+Record/replay mechanism, that could be enabled through icount mode, expects
+the virtual devices to satisfy the following requirement:
+everything that affects
 the guest state during execution in icount mode should be deterministic.
 
 Timers
 ------
 
+Timers are used to execute callbacks from different subsystems of QEMU
+at the specified moments of time. There are several kinds of timers:
+
+ * Real time clock. Based on host time and used only for callbacks that
+   do not change the virtual machine state. For this reason real time
+   clock and timers does not affect deterministic replay at all.
+ * Virtual clock. These timers run only during the emulation. In icount
+   mode virtual clock value is calculated using executed instructions counter.
+   That is why it is completely deterministic and does not have to be recorded.
+ * Host clock. This clock is used by device models that simulate real time
+   sources (e.g. real time clock chip). Host clock is the one of the sources
+   of non-determinism. Host clock read operations should be logged to
+   make the execution deterministic.
+ * Virtual real time clock. This clock is similar to real time clock but
+   it is used only for increasing virtual clock while virtual machine is
+   sleeping. Due to its nature it is also non-deterministic as the host clock
+   and has to be logged too.
+
 All virtual devices should use virtual clock for timers that change the guest
 state. Virtual clock is deterministic, therefore such timers are deterministic
 too.
@@ -26,14 +155,50 @@ but its speed depends on the guest execution. This clock is used by
 the virtual devices (e.g., slirp routing device) that lie outside the
 replayed guest.
 
+Block devices
+-------------
+
+Block devices record/replay module (``blkreplay``) intercepts calls of
+bdrv coroutine functions at the top of block drivers stack.
+
+All block completion operations are added to the queue in the coroutines.
+When the queue is flushed the information about processed requests
+is recorded to the log. In replay phase the queue is matched with
+events read from the log. Therefore block devices requests are processed
+deterministically.
+
 Bottom halves
 -------------
 
 Bottom half callbacks, that affect the guest state, should be invoked through
-replay_bh_schedule_event or replay_bh_schedule_oneshot_event functions.
+``replay_bh_schedule_event`` or ``replay_bh_schedule_oneshot_event`` functions.
 Their invocations are saved in record mode and synchronized with the existing
 log in replay mode.
 
+Disk I/O events are completely deterministic in our model, because
+in both record and replay modes we start virtual machine from the same
+disk state. But callbacks that virtual disk controller uses for reading and
+writing the disk may occur at different moments of time in record and replay
+modes.
+
+Reading and writing requests are created by CPU thread of QEMU. Later these
+requests proceed to block layer which creates "bottom halves". Bottom
+halves consist of callback and its parameters. They are processed when
+main loop locks the global mutex. These locks are not synchronized with
+replaying process because main loop also processes the events that do not
+affect the virtual machine state (like user interaction with monitor).
+
+That is why we had to implement saving and replaying bottom halves callbacks
+synchronously to the CPU execution. When the callback is about to execute
+it is added to the queue in the replay module. This queue is written to the
+log when its callbacks are executed. In replay mode callbacks are not processed
+until the corresponding event is read from the events log file.
+
+Sometimes the block layer uses asynchronous callbacks for its internal purposes
+(like reading or writing VM snapshots or disk image cluster tables). In this
+case bottom halves are not marked as "replayable" and do not saved
+into the log.
+
 Saving/restoring the VM state
 -----------------------------
 
@@ -42,7 +207,7 @@ should be restored by loadvm to the same values they had before savevm.
 
 Avoid accessing other devices' state, because the order of saving/restoring
 is not defined. It means that you should not call functions like
-'update_irq' in post_load callback. Save everything explicitly to avoid
+``update_irq`` in ``post_load`` callback. Save everything explicitly to avoid
 the dependencies that may make restoring the VM state non-deterministic.
 
 Stopping the VM
@@ -52,3 +217,90 @@ Stopping the guest should not interfere with its state (with the exception
 of the network connections, that could be broken by the remote timeouts).
 VM can be stopped at any moment of replay by the user. Restarting the VM
 after that stop should not break the replay by the unneeded guest state change.
+
+Replay log format
+=================
+
+Record/replay log consists of the header and the sequence of execution
+events. The header includes 4-byte replay version id and 8-byte reserved
+field. Version is updated every time replay log format changes to prevent
+using replay log created by another build of qemu.
+
+The sequence of the events describes virtual machine state changes.
+It includes all non-deterministic inputs of VM, synchronization marks and
+instruction counts used to correctly inject inputs at replay.
+
+Synchronization marks (checkpoints) are used for synchronizing qemu threads
+that perform operations with virtual hardware. These operations may change
+system's state (e.g., change some register or generate interrupt) and
+therefore should execute synchronously with CPU thread.
+
+Every event in the log includes 1-byte event id and optional arguments.
+When argument is an array, it is stored as 4-byte array length
+and corresponding number of bytes with data.
+Here is the list of events that are written into the log:
+
+ - EVENT_INSTRUCTION. Instructions executed since last event. Followed by:
+
+   - 4-byte number of executed instructions.
+
+ - EVENT_INTERRUPT. Used to synchronize interrupt processing.
+ - EVENT_EXCEPTION. Used to synchronize exception handling.
+ - EVENT_ASYNC. This is a group of events. When such an event is generated,
+   it is stored in the queue and processed in icount_account_warp_timer().
+   Every such event has it's own id from the following list:
+
+     - REPLAY_ASYNC_EVENT_BH. Bottom-half callback. This event synchronizes
+       callbacks that affect virtual machine state, but normally called
+       asynchronously. Followed by:
+
+        - 8-byte operation id.
+
+     - REPLAY_ASYNC_EVENT_INPUT. Input device event. Contains
+       parameters of keyboard and mouse input operations
+       (key press/release, mouse pointer movement). Followed by:
+
+        - 9-16 bytes depending of input event.
+
+     - REPLAY_ASYNC_EVENT_INPUT_SYNC. Internal input synchronization event.
+     - REPLAY_ASYNC_EVENT_CHAR_READ. Character (e.g., serial port) device input
+       initiated by the sender. Followed by:
+
+        - 1-byte character device id.
+        - Array with bytes were read.
+
+     - REPLAY_ASYNC_EVENT_BLOCK. Block device operation. Used to synchronize
+       operations with disk and flash drives with CPU. Followed by:
+
+        - 8-byte operation id.
+
+     - REPLAY_ASYNC_EVENT_NET. Incoming network packet. Followed by:
+
+        - 1-byte network adapter id.
+        - 4-byte packet flags.
+        - Array with packet bytes.
+
+ - EVENT_SHUTDOWN. Occurs when user sends shutdown event to qemu,
+   e.g., by closing the window.
+ - EVENT_CHAR_WRITE. Used to synchronize character output operations. Followed by:
+
+    - 4-byte output function return value.
+    - 4-byte offset in the output array.
+
+ - EVENT_CHAR_READ_ALL. Used to synchronize character input operations,
+   initiated by qemu. Followed by:
+
+    - Array with bytes that were read.
+
+ - EVENT_CHAR_READ_ALL_ERROR. Unsuccessful character input operation,
+   initiated by qemu. Followed by:
+
+    - 4-byte error code.
+
+ - EVENT_CLOCK + clock_id. Group of events for host clock read operations. Followed by:
+
+    - 8-byte clock value.
+
+ - EVENT_CHECKPOINT + checkpoint_id. Checkpoint for synchronization of
ussian Academy of Sciences.
-
-This work is licensed under the terms of the GNU GPL, version 2 or later.
-See the COPYING file in the top-level directory.
-
-Record/replay
--------------
-
-Record/replay functions are used for the deterministic replay of qemu execution.
-Execution recording writes a non-deterministic events log, which can be later
-used for replaying the execution anywhere and for unlimited number of times.
-It also supports checkpointing for faster rewind to the specific replay moment.
-Execution replaying reads the log and replays all non-deterministic events
-including external input, hardware clocks, and interrupts.
-
-Deterministic replay has the following features:
- * Deterministically replays whole system execution and all contents of
-   the memory, state of the hardware devices, clocks, and screen of the VM.
- * Writes execution log into the file for later replaying for multiple times
-   on different machines.
- * Supports i386, x86_64, and Arm hardware platforms.
- * Performs deterministic replay of all operations with keyboard and mouse
-   input devices.
-
-Usage of the record/replay:
- * First, record the execution with the following command line:
-    qemu-system-i386 \
-     -icount shift=7,rr=record,rrfile=replay.bin \
-     -drive file=disk.qcow2,if=none,snapshot,id=img-direct \
-     -drive driver=blkreplay,if=none,image=img-direct,id=img-blkreplay \
-     -device ide-hd,drive=img-blkreplay \
-     -netdev user,id=net1 -device rtl8139,netdev=net1 \
-     -object filter-replay,id=replay,netdev=net1
- * After recording, you can replay it by using another command line:
-    qemu-system-i386 \
-     -icount shift=7,rr=replay,rrfile=replay.bin \
-     -drive file=disk.qcow2,if=none,snapshot,id=img-direct \
-     -drive driver=blkreplay,if=none,image=img-direct,id=img-blkreplay \
-     -device ide-hd,drive=img-blkreplay \
-     -netdev user,id=net1 -device rtl8139,netdev=net1 \
-     -object filter-replay,id=replay,netdev=net1
-   The only difference with recording is changing the rr option
-   from record to replay.
- * Block device images are not actually changed in the recording mode,
-   because all of the changes are written to the temporary overlay file.
-   This behavior is enabled by using blkreplay driver. It should be used
-   for every enabled block device, as described in 'Block devices' section.
- * '-net none' option should be specified when network is not used,
-   because QEMU adds network card by default. When network is needed,
-   it should be configured explicitly with replay filter, as described
-   in 'Network devices' section.
- * Interaction with audio devices and serial ports are recorded and replayed
-   automatically when such devices are enabled.
-
-Academic papers with description of deterministic replay implementation:
-http://www.computer.org/csdl/proceedings/csmr/2012/4666/00/4666a553-abs.html
-http://dl.acm.org/citation.cfm?id=2786805.2803179
-
-Modifications of qemu include:
- * wrappers for clock and time functions to save their return values in the log
- * saving different asynchronous events (e.g. system shutdown) into the log
- * synchronization of the bottom halves execution
- * synchronization of the threads from thread pool
- * recording/replaying user input (mouse, keyboard, and microphone)
- * adding internal checkpoints for cpu and io synchronization
- * network filter for recording and replaying the packets
- * block driver for making block layer deterministic
- * serial port input record and replay
- * recording of random numbers obtained from the external sources
-
-Locking and thread synchronisation
-----------------------------------
-
-Previously the synchronisation of the main thread and the vCPU thread
-was ensured by the holding of the BQL. However the trend has been to
-reduce the time the BQL was held across the system including under TCG
-system emulation. As it is important that batches of events are kept
-in sequence (e.g. expiring timers and checkpoints in the main thread
-while instruction checkpoints are written by the vCPU thread) we need
-another lock to keep things in lock-step. This role is now handled by
-the replay_mutex_lock. It used to be held only for each event being
-written but now it is held for a whole execution period. This results
-in a deterministic ping-pong between the two main threads.
-
-As the BQL is now a finer grained lock than the replay_lock it is almost
-certainly a bug, and a source of deadlocks, to take the
-replay_mutex_lock while the BQL is held. This is enforced by an assert.
-While the unlocks are usually in the reverse order, this is not
-necessary; you can drop the replay_lock while holding the BQL, without
-doing a more complicated unlock_iothread/replay_unlock/lock_iothread
-sequence.
-
-Non-deterministic events
-------------------------
-
-Our record/replay system is based on saving and replaying non-deterministic
-events (e.g. keyboard input) and simulating deterministic ones (e.g. reading
-from HDD or memory of the VM). Saving only non-deterministic events makes
-log file smaller and simulation faster.
-
-The following non-deterministic data from peripheral devices is saved into
-the log: mouse and keyboard input, network packets, audio controller input,
-serial port input, and hardware clocks (they are non-deterministic
-too, because their values are taken from the host machine). Inputs from
-simulated hardware, memory of VM, software interrupts, and execution of
-instructions are not saved into the log, because they are deterministic and
-can be replayed by simulating the behavior of virtual machine starting from
-initial state.
-
-We had to solve three tasks to implement deterministic replay: recording
-non-deterministic events, replaying non-deterministic events, and checking
-that there is no divergence between record and replay modes.
-
-We changed several parts of QEMU to make event log recording and replaying.
-Devices' models that have non-deterministic input from external devices were
-changed to write every external event into the execution log immediately.
-E.g. network packets are written into the log when they arrive into the virtual
-network adapter.
-
-All non-deterministic events are coming from these devices. But to
-replay them we need to know at which moments they occur. We specify
-these moments by counting the number of instructions executed between
-every pair of consecutive events.
-
-Instruction counting
---------------------
-
-QEMU should work in icount mode to use record/replay feature. icount was
-designed to allow deterministic execution in absence of external inputs
-of the virtual machine. We also use icount to control the occurrence of the
-non-deterministic events. The number of instructions elapsed from the last event
-is written to the log while recording the execution. In replay mode we
-can predict when to inject that event using the instruction counter.
-
-Timers
-------
-
-Timers are used to execute callbacks from different subsystems of QEMU
-at the specified moments of time. There are several kinds of timers:
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
-
-Checkpoints
------------
-
-Replaying of the execution of virtual machine is bound by sources of
-non-determinism. These are inputs from clock and peripheral devices,
-and QEMU thread scheduling. Thread scheduling affect on processing events
-from timers, asynchronous input-output, and bottom halves.
-
-Invocations of timers are coupled with clock reads and changing the state
-of the virtual machine. Reads produce non-deterministic data taken from
-host clock. And VM state changes should preserve their order. Their relative
-order in replay mode must replicate the order of callbacks in record mode.
-To preserve this order we use checkpoints. When a specific clock is processed
-in record mode we save to the log special "checkpoint" event.
-Checkpoints here do not refer to virtual machine snapshots. They are just
-record/replay events used for synchronization.
-
-QEMU in replay mode will try to invoke timers processing in random moment
-of time. That's why we do not process a group of timers until the checkpoint
-event will be read from the log. Such an event allows synchronizing CPU
-execution and timer events.
-
-Two other checkpoints govern the "warping" of the virtual clock.
-While the virtual machine is idle, the virtual clock increments at
-1 ns per *real time* nanosecond.  This is done by setting up a timer
-(called the warp timer) on the virtual real time clock, so that the
-timer fires at the next deadline of the virtual clock; the virtual clock
-is then incremented (which is called "warping" the virtual clock) as
-soon as the timer fires or the CPUs need to go out of the idle state.
-Two functions are used for this purpose; because these actions change
-virtual machine state and must be deterministic, each of them creates a
-checkpoint.  icount_start_warp_timer checks if the CPUs are idle and if so
-starts accounting real time to virtual clock.  icount_account_warp_timer
-is called when the CPUs get an interrupt or when the warp timer fires,
-and it warps the virtual clock by the amount of real time that has passed
-since icount_start_warp_timer.
-
-Bottom halves
--------------
-
-Disk I/O events are completely deterministic in our model, because
-in both record and replay modes we start virtual machine from the same
-disk state. But callbacks that virtual disk controller uses for reading and
-writing the disk may occur at different moments of time in record and replay
-modes.
-
-Reading and writing requests are created by CPU thread of QEMU. Later these
-requests proceed to block layer which creates "bottom halves". Bottom
-halves consist of callback and its parameters. They are processed when
-main loop locks the global mutex. These locks are not synchronized with
-replaying process because main loop also processes the events that do not
-affect the virtual machine state (like user interaction with monitor).
-
-That is why we had to implement saving and replaying bottom halves callbacks
-synchronously to the CPU execution. When the callback is about to execute
-it is added to the queue in the replay module. This queue is written to the
-log when its callbacks are executed. In replay mode callbacks are not processed
-until the corresponding event is read from the events log file.
-
-Sometimes the block layer uses asynchronous callbacks for its internal purposes
-(like reading or writing VM snapshots or disk image cluster tables). In this
-case bottom halves are not marked as "replayable" and do not saved
-into the log.
-
-Block devices
--------------
-
-Block devices record/replay module intercepts calls of
-bdrv coroutine functions at the top of block drivers stack.
-To record and replay block operations the drive must be configured
-as following:
- -drive file=disk.qcow2,if=none,snapshot,id=img-direct
- -drive driver=blkreplay,if=none,image=img-direct,id=img-blkreplay
- -device ide-hd,drive=img-blkreplay
-
-blkreplay driver should be inserted between disk image and virtual driver
-controller. Therefore all disk requests may be recorded and replayed.
-
-All block completion operations are added to the queue in the coroutines.
-Queue is flushed at checkpoints and information about processed requests
-is recorded to the log. In replay phase the queue is matched with
-events read from the log. Therefore block devices requests are processed
-deterministically.
-
-Snapshotting
-------------
-
-New VM snapshots may be created in replay mode. They can be used later
-to recover the desired VM state. All VM states created in replay mode
-are associated with the moment of time in the replay scenario.
-After recovering the VM state replay will start from that position.
-
-Default starting snapshot name may be specified with icount field
-rrsnapshot as follows:
- -icount shift=7,rr=record,rrfile=replay.bin,rrsnapshot=snapshot_name
-
-This snapshot is created at start of recording and restored at start
-of replaying. It also can be loaded while replaying to roll back
-the execution.
-
-'snapshot' flag of the disk image must be removed to save the snapshots
-in the overlay (or original image) instead of using the temporary overlay.
- -drive file=disk.ovl,if=none,id=img-direct
- -drive driver=blkreplay,if=none,image=img-direct,id=img-blkreplay
- -device ide-hd,drive=img-blkreplay
-
-Use QEMU monitor to create additional snapshots. 'savevm <name>' command
-created the snapshot and 'loadvm <name>' restores it. To prevent corruption
-of the original disk image, use overlay files linked to the original images.
-Therefore all new snapshots (including the starting one) will be saved in
-overlays and the original image remains unchanged.
-
-When you need to use snapshots with diskless virtual machine,
-it must be started with 'orphan' qcow2 image. This image will be used
-for storing VM snapshots. Here is the example of the command line for this:
-
-  qemu-system-i386 -icount shift=3,rr=replay,rrfile=record.bin,rrsnapshot=init \
-    -net none -drive file=empty.qcow2,if=none,id=rr
-
-empty.qcow2 drive does not connected to any virtual block device and used
-for VM snapshots only.
-
-Network devices
----------------
-
-Record and replay for network interactions is performed with the network filter.
-Each backend must have its own instance of the replay filter as follows:
- -netdev user,id=net1 -device rtl8139,netdev=net1
- -object filter-replay,id=replay,netdev=net1
-
-Replay network filter is used to record and replay network packets. While
-recording the virtual machine this filter puts all packets coming from
-the outer world into the log. In replay mode packets from the log are
-injected into the network device. All interactions with network backend
-in replay mode are disabled.
-
-Audio devices
--------------
-
-Audio data is recorded and replay automatically. The command line for recording
-and replaying must contain identical specifications of audio hardware, e.g.:
- -soundhw ac97
-
-Serial ports
-------------
-
-Serial ports input is recorded and replay automatically. The command lines
-for recording and replaying must contain identical number of ports in record
-and replay modes, but their backends may differ.
-E.g., '-serial stdio' in record mode, and '-serial null' in replay mode.
-
-Reverse debugging
------------------
-
-Reverse debugging allows "executing" the program in reverse direction.
-GDB remote protocol supports "reverse step" and "reverse continue"
-commands. The first one steps single instruction backwards in time,
-and the second one finds the last breakpoint in the past.
-
-Recorded executions may be used to enable reverse debugging. QEMU can't
-execute the code in backwards direction, but can load a snapshot and
-replay forward to find the desired position or breakpoint.
-
-The following GDB commands are supported:
- - reverse-stepi (or rsi) - step one instruction backwards
- - reverse-continue (or rc) - find last breakpoint in the past
-
-Reverse step loads the nearest snapshot and replays the execution until
-the  - replaying to the required breakpoint
- 4. else
-    - proceeding to the p.1 with the earlier snapshot
-
-Therefore usage of the reverse debugging requires at least one snapshot
-created in advance. This can be done by omitting 'snapshot' option
-for the block drives and adding 'rrsnapshot' for both record and replay
-command lines.
-See the "Snapshotting" section to learn more about running record/replay
-and creating the snapshot in these modes.
-
-Replay log format
------------------
-
-Record/replay log consists of the header and the sequence of execution
-events. The header includes 4-byte replay version id and 8-byte reserved
-field. Version is updated every time replay log format changes to prevent
-using replay log created by another build of qemu.
-
-The sequence of the events describes virtual machine state changes.
-It includes all non-deterministic inputs of VM, synchronization marks and
-instruction counts used to correctly inject inputs at replay.
-
-Synchronization marks (checkpoints) are used for synchronizing qemu threads
-that perform operations with virtual hardware. These operations may change
-system's state (e.g., change some register or generate interrupt) and
-therefore should execute synchronously with CPU thread.
-
-Every event in the log includes 1-byte event id and optional arguments.
-When argument is an array, it is stored as 4-byte array length
-and corresponding number of bytes with data.
-Here is the list of events that are written into the log:
-
- - EVENT_INSTRUCTION. Instructions executed since last event.
-   Argument: 4-byte number of executed instructions.
- - EVENT_INTERRUPT. Used to synchronize interrupt processing.
- - EVENT_EXCEPTION. Used to synchronize exception handling.
- - EVENT_ASYNC. This is a group of events. When such an event is generated,
-   it is stored in the queue and processed in icount_account_warp_timer().
-   Every such event has it's own id from the following list:
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
-   CPU, internal threads, and asynchronous input events.
- - EVENT_END. Last event in the log.
diff --git a/docs/system/index.rst b/docs/system/index.rst
index 23e30e26e5..e3695649c5 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -27,6 +27,7 @@ or Hypervisor.Framework.
    secrets
    authz
    gdb
+   replay
    managed-startup
    bootindex
    cpu-hotplug
diff --git a/docs/system/replay.rst b/docs/system/replay.rst
new file mode 100644
index 0000000000..3105327423
--- /dev/null
+++ b/docs/system/replay.rst
@@ -0,0 +1,237 @@
+.. _replay:
+
+..
+    Copyright (c) 2010-2022 Institute for System Programming
+                        of the Russian Academy of Sciences.
+
+    This work is licensed under the terms of the GNU GPL, version 2 or later.
+    See the COPYING file in the top-level directory.
+
+Record/replay
+=============
+
+Record/replay functions are used for the deterministic replay of qemu execution.
+Execution recording writes a non-deterministic events log, which can be later
+used for replaying the execution anywhere and for unlimited number of times.
+It also supports checkpointing for faster rewind to the specific replay moment.
+Execution replaying reads the log and replays all non-deterministic events
+including external input, hardware clocks, and interrupts.
+
+Deterministic replay has the following features:
+
+ * Deterministically replays whole system execution and all contents of
+   the memory, state of the hardware devices, clocks, and screen of the VM.
+ * Writes execution log into the file for later replaying for multiple times
+   on different machines.
+ * Supports i386, x86_64, ARM, AArch64, Risc-V, MIPS, MIPS64, S390X, Alpha,
+   PowerPC, PowerPC64, M68000, Microblaze, OpenRISC, Nios II, SPARC,
+   and Xtensa hardware platforms.
+ * Performs deterministic replay of all operations with keyboard and mouse
+   input devices, serial ports, and network.
+
+Usage of the record/replay:
+
+ * First, record the execution with the following command line:
+
+    .. parsed-literal::
+        |qemu_system| \\
+        -icount shift=auto,rr=record,rrfile=replay.bin \\
+        -drive file=disk.qcow2,if=none,snapshot,id=img-direct \\
+        -drive driver=blkreplay,if=none,image=img-direct,id=img-blkreplay \\
+        -device ide-hd,drive=img-blkreplay \\
+        -netdev user,id=net1 -device rtl8139,netdev=net1 \\
+        -object filter-replay,id=replay,netdev=net1
+
+ * After recording, you can replay it by using another command line:
+
+    .. parsed-literal::
+        |qemu_system| \\
+        -icount shift=auto,rr=replay,rrfile=replay.bin \\
+        -drive file=disk.qcow2,if=none,snapshot,id=img-direct \\
+        -drive driver=blkreplay,if=none,image=img-direct,id=img-blkreplay \\
+        -device ide-hd,drive=img-blkreplay \\
+        -netdev user,id=net1 -device rtl8139,netdev=net1 \\
+        -object filter-replay,id=replay,netdev=net1
+
+   The only difference with recording is changing the rr option
+   from record to replay.
+ * Block device images are not actually changed in the recording mode,
+   because all of the changes are written to the temporary overlay file.
+   This behavior is enabled by using blkreplay driver. It should be used
+   for every enabled block device, as described in :ref:`block-label` section.
+ * ``-net none`` option should be specified when network is not used,
+   because QEMU adds network card by default. When network is needed,
+   it should be configured explicitly with replay filter, as described
+   in :ref:`network-label` section.
+ * Interaction with audio devices and serial ports are recorded and replayed
+   automatically when such devices are enabled.
+
+Core idea
+---------
+
+Record/replay system is based on saving and replaying non-deterministic
+events (e.g. keyboard input) and simulating deterministic ones (e.g. reading
+from HDD or memory of the VM). Saving only non-deterministic events makes
+log file smaller and simulation faster.
+
+The following non-deterministic data from peripheral devices is saved into
+the log: mouse and keyboard input, network packets, audio controller input,
+serial port input, and hardware clocks (they are non-deterministic
+too, because their values are taken from the host machine). Inputs from
+simulated hardware, memory of VM, software interrupts, and execution of
+instructions are not saved into the log, because they are deterministic and
+can be replayed by simulating the behavior of virtual machine starting from
+initial state.
+
+Instruction counting
+--------------------
+
+QEMU should work in icount mode to use record/replay feature. icount was
+designed to allow deterministic execution in absence of external inputs
+of the virtual machine. Record/replay feature is enabled through ``-icount``
+command-line option, making possible deterministic execution of the machine,
+interacting with user or network.
+
+.. _block-label:
+
+Block devices
+-------------
+
+Block devices record/replay module intercepts calls of
+bdrv coroutine functions at the top of block drivers stack.
+To record and replay block operations the drive must be configured
+as following:
+
+.. parsed-literal::
+    -drive file=disk.qcow2,if=none,snapshot,id=img-direct
+    -drive driver=blkreplay,if=none,image=img-direct,id=img-blkreplay
+    -device ide-hd,drive=img-blkreplay
+
+blkreplay driver should be inserted between disk image and virtual driver
+controller. Therefore all disk requests may be recorded and replayed.
+
+.. _snapshotting-label:
+
+Snapshotting
+------------
+
+New VM snapshots may be created in replay mode. They can be used later
+to recover the desired VM state. All VM states created in replay mode
+are associated with the moment of time in the replay scenario.
+After recovering the VM state replay will start from that position.
+
+Default starting snapshot name may be specified with icount field
+rrsnapshot as follows:
+
+.. parsed-literal::
+    -icount shift=auto,rr=record,rrfile=replay.bin,rrsnapshot=snapshot_name
+
+This snapshot is created at start of recording and restored at start
+of replaying. It also can be loaded while replaying to roll back
+the execution.
+
+``snapshot`` flag of the disk image must be removed to save the snapshots
+in the overlay (or original image) instead of using the temporary overlay.
+
+.. parsed-literal::
+    -drive file=disk.ovl,if=none,id=img-direct
+    -drive driver=blkreplay,if=none,image=img-direct,id=img-blkreplay
+    -device ide-hd,drive=img-blkreplay
+
+Use QEMU monitor to create additional snapshots. ``savevm <name>`` command
+created the snapshot and ``loadvm <name>`` restores it. To prevent corruption
+of the original disk image, use overlay files linked to the original images.
+Therefore all new snapshots (including the starting one) will be saved in
+overlays and the original image remains unchanged.
+
+When you need to use snapshots with diskless virtual machine,
+it must be started with "orphan" qcow2 image. This image will be used
+for storing VM snapshots. Here is the example of the command line for this:
+
+.. parsed-literal::
+    |qemu_system| \\
+      -icount shift=auto,rr=replay,rrfile=record.bin,rrsnapshot=init \\
+      -net none -drive file=empty.qcow2,if=none,id=rr
+
+``empty.qcow2`` drive does not connected to any virtual block device and used
+for VM snapshots only.
+
+.. _network-label:
+
+Network devices
+---------------
+
+Record and replay for network interactions is performed with the network filter.
+Each backend must have its own instance of the replay filter as follows:
+
+.. parsed-literal::
+    -netdev user,id=net1 -device rtl8139,netdev=net1
+    -object filter-replay,id=replay,netdev=net1
+
+Replay network filter is used to record and replay network packets. While
+recording the virtual machine this filter puts all packets coming from
+the outer world into the log. In replay mode packets from the log are
+injected into the network device. All interactions with network backend
+in replay mode are disabled.
+
+Audio devices
+-------------
+
+Audio data is recorded and replay automatically. The command line for recording
+and replaying must contain identical specifications of audio hardware, e.g.:
+
+.. parsed-literal::
+    -soundhw ac97
+
+Serial ports
+------------
+
+Serial ports input is recorded and replay automatically. The command lines
+for recording and replaying must contain identical number of ports in record
+and replay modes, but their backends may differ.
+E.g., ``-serial stdio`` in record mode, and ``-serial null`` in replay mode.
+
+Reverse debugging
+-----------------
+
+Reverse debugging allows "executing" the program in reverse direction.
+GDB remote protocol supports "reverse step" and "reverse continue"
+commands. The first one steps single instruction backwards in time,
+and the second one finds the last breakpoint in the past.
+
+Recorded executions may be used to enable reverse debugging. QEMU can't
+execute the code in backwards direction, but can load a snapshot and
+replay forward to find the desired position or breakpoint.
+
+The following GDB commands are supported:
+
+ - ``reverse-stepi`` (or ``rsi``) - step one instruction backwards
+ - ``reverse-continue`` (or ``rc``) - find last breakpoint in the past
+
+Reverse step loads the nearest snapshot and replays the execution until
+the required instruction is met.
+
+Reverse continue may include several passes of examining the execution
+between the snapshots. Each of the passes include the following steps:
+
+ #. loading the snapshot
+ #. replaying to examine the breakpoints
+ #. if breakpoint or watchpoint was met
+
+    * loading the snapshot again
+    * replaying to the required breakpoint
+
+ #. else
+
+    * proceeding to the p.1 with the earlier snapshot
+
+Therefore usage of the reverse debugging requires at least one snapshot
+created. This can be done by omitting ``snapshot`` option
+for the block drives and adding ``rrsnapshot`` for both record and replay
+command lines.
+See the :ref:`snapshotting-label` section to learn more about running record/replay
+and creating the snapshot in these modes.
+
+When ``rrsnapshot`` is not used, then snapshot named ``start_debugging``
+created in temporary overlay. This allows using reverse debugging, but with
+temporary snapshots (existing within the session).
-- 
2.36.1



