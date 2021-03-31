Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F19373469DD
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 21:31:52 +0100 (CET)
Received: from localhost ([::1]:32788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOngu-0003G1-03
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 16:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <afe044a589742961a06563200eec591cb3df8ca6@lizzy.crudebyte.com>)
 id 1lOnf4-0001LH-FW
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:29:58 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:44635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <afe044a589742961a06563200eec591cb3df8ca6@lizzy.crudebyte.com>)
 id 1lOnf0-0005cc-7Q
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:29:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=kFsfCqyhrsmT+unH/DMiZgod1Hjj20HRrbJ/3iGJkvI=; b=Ot3nq
 Yb/H9jilZxiATylNCljBQsqLlRHfZ6JZX/A2hh/nooZm5uMIV3GjohaqlYdKLucun5gPbazwJqlnS
 u0+cb8Mhc7tKWt31oTLqffO9Alc8D6jBl7uaoMqUJJesq9Y/+JuVXLhz5epfd+VWCkd+W5zZJfAEL
 VOFBc7lrK0FTvk2wt6IBK5M4VQa/o9fv/umPu6YoZ7c9Jyhli0GkF5TIdLDohQ94gyAw9lh0bv1vq
 oJUaqUkXtgrVYbaT6TC2WJwrN8DOI+ewwj7TdF4ZXvEN6q+YeHxr4EHUJM8cwQkVzN0VJJ8L4adP4
 ApWPBLVnWDg7FO3pSO8L1xkpsNu0w==;
Message-Id: <afe044a589742961a06563200eec591cb3df8ca6.1616528420.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1616528420.git.qemu_oss@crudebyte.com>
References: <cover.1616528420.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 23 Mar 2021 19:36:13 +0100
Subject: [PATCH 1/4] docs/devel: add 9p.rst
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=afe044a589742961a06563200eec591cb3df8ca6@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.214, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This page has been auto converted from:

  https://wiki.qemu.org/Documentation/9p

by manually grabbing the page's mediawiki source from:

  https://wiki.qemu.org/index.php?title=Documentation/9p&action=edit

and by using 'pandoc' for the actual conversion:

  pandoc -f mediawiki -t rst foo.txt > docs/devel/9p.rst

Unfortunately Mediawiki's API does not allow to grab the wiki source text
automatically in an easy way (i.e. without having to use parse tools).

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 docs/devel/9p.rst | 544 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 544 insertions(+)
 create mode 100644 docs/devel/9p.rst

diff --git a/docs/devel/9p.rst b/docs/devel/9p.rst
new file mode 100644
index 0000000000..e2a57b77b2
--- /dev/null
+++ b/docs/devel/9p.rst
@@ -0,0 +1,544 @@
+9pfs Developers Documentation
+=============================
+
+This page is intended for developers who want to put their hands on the
+9p passthrough filesystem implementation in QEMU. For regular user
+aspects you rather want to look at the separate page
+`Documentation/9psetup <Documentation/9psetup>`__ instead.
+
+9p Protocol
+-----------
+
+9pfs uses the `Plan 9 Filesystem
+Protocol <https://en.wikipedia.org/wiki/9P_(protocol)>`__ for
+communicating the file I/O operations between guest systems (clients)
+and the `9p server (see below) <#9P_Server>`__. There are a bunch of
+separate documents specifying different variants of the protocol, which
+might be a bit confusing at first, so here is a summary of the
+individual protocol flavours.
+
+Introduction
+~~~~~~~~~~~~
+
+If this is your first time getting in touch with the 9p protocol then
+you might have a look at this introduction by Eric Van Hensbergen which
+is an easy understandable text explaining how the protocol works,
+including examples of individual requests and their response messages:
+`Using 9P2000 Under
+Linux <https://www.usenix.org/legacy/events/usenix05/tech/freenix/full_papers/hensbergen/hensbergen_html/index.html>`__
+
+There are currently 3 dialects of the 9p network protocol called
+"9p2000", "9p2000.u" and "9p2000.L". Note that QEMU's 9pfs
+implementation only supports either "9p2000.u" or "9p2000.L".
+
+9p2000
+~~~~~~
+
+This is the basis of the 9p protocol the other two dialects derive from.
+This is the specification of the protocol: `9p2000
+Protocol <http://ericvh.github.io/9p-rfc/rfc9p2000.html>`__
+
+9p2000.u
+~~~~~~~~
+
+The "9p2000.u" dialect adds extensions and minor adjustments to the
+protocol for Unix systems, especially for common data types available on
+a Unix system. For instance the basic "9p2000" protocol version only
+returns an error text if some error occurred on server side, whereas
+"9p2000.u" also returns an appropriate, common POSIX error code for the
+individual error. `9p2000.u
+Protocol <http://ericvh.github.io/9p-rfc/rfc9p2000.u.html>`__
+
+9p2000.L
+~~~~~~~~
+
+Similar to the "9p2000.u" dialect, the "9p2000.L" dialect adds
+extensions and minor adjustments of the protocol specifically for Linux
+systems. Again this is mostly targeted at specializing for data types of
+system calls available on a Linux system. `9p2000.L
+Protocol <https://github.com/chaos/diod/blob/master/protocol.md>`__
+
+Topology
+--------
+
+The following figure shows the basic structure of the 9pfs
+implementation in QEMU.
+
+`frameless|upright=3.0 <File:9pfs_topology.png>`__
+
+The implementation consists of 3 modular components: 9p server, 9p
+filesystem drivers and 9p transport drivers. The 9p client on guest OS
+side is not part of the QEMU code base. There are a bunch of 9p client
+implementations e.g. for individual OSes. The most commonly used one is
+the client that comes with the stock Linux kernel. `Linux 9p
+Client <https://github.com/torvalds/linux/tree/master/fs/9p>`__
+
+9p Server
+~~~~~~~~~
+
+This is the controller portion of the 9pfs code base which handles the
+raw 9p network protocol handling, and the general high-level control
+flow of 9p clients' (the guest systems) 9p requests. The 9p server is
+basically a full-fledged file server and accordingly it has the highest
+code complexity in the 9pfs code base, most of this is in
+`hw/9pfs/9p.c <https://gitlab.com/qemu-project/qemu/-/blob/master/hw/9pfs/9p.c>`__
+source file.
+
+9p Filesystem Drivers
+~~~~~~~~~~~~~~~~~~~~~
+
+The 9p server uses a
+`VFS <https://en.wikipedia.org/wiki/Virtual_file_system>`__ layer for
+the actual file operations, which makes it flexible from where the file
+storage data comes from and how exactly that data is actually accessed.
+There are currently 3 different 9p file system driver implementations
+available:
+
+1. local fs driver
+
+This is the most common fs driver which is used most often with 9p in
+practice. It basically just maps the individual VFS functions (more or
+less) directly to the host system's file system functions like open(),
+read(), write(), etc. You find this fs driver implementation in
+`hw/9pfs/9p-local.c <https://gitlab.com/qemu-project/qemu/-/blob/master/hw/9pfs/9p-local.c>`__
+source file.
+
+Most of the "local" driver's code deals with remapping of permissions,
+which solves a fundamental problem: a high privileged user like "root"
+(and the kernel itself) on the guest system expects to have full control
+over its filesystems. For instance it needs to be able to change the
+owning user and group of files and directories, be able to add, change
+and remove attributes, changing any file permissions and so forth.
+Without these assumed permissions, it would nearly be impossible to run
+any useful service on guest side ontop of a 9pfs filesystem. The QEMU
+binary on the host system however is usually not running as privileged
+user for security reasons, so the 9pfs server can actually not do all
+those things on the file system it has access to on host side.
+
+For that reason the "local" driver supports remapping of file
+permissions and owners. So when the "remap" driver option of the "local"
+driver is used (like it's usually the case on a production system), then
+the "local" driver pretends to the guest system it could do all those
+things, but in reality it just maps things like permissions and owning
+users and groups as additional data on the filesystem, either as some
+hidden files, or as extended attributes (the latter being recommended)
+which are not directly exposed to the guest OS. With remapping enabled,
+you can actually run an entire guest OS on a single 9pfs root filesystem
+already.
+
+2. proxy fs driver
+
+This fs driver was supposed to dispatch the VFS functions to be called
+from a separate process (by
+`fsdev/virtfs-proxy-helper <https://gitlab.com/qemu-project/qemu/-/blob/master/fsdev/virtfs-proxy-helper.c>`__)
+and increasing security by that separation, however the "proxy" driver
+is currently not considered to be production grade.
+`hw/9pfs/9p-proxy.c <https://gitlab.com/qemu-project/qemu/-/blob/master/hw/9pfs/9p-proxy.c>`__
+
+However the "proxy" fs driver shows some potential of 9pfs. As a fs
+driver for 9pfs is just a thin, lite-weight VFS layer to the actual fs
+data, it would for instance be considerable to implement a fs driver
+that allows the actual filesystem to be kept entirely on a separate
+storage system and therefore increasing security and availability. If an
+attacker would then e.g. be able to gain full control over the 9pfs host
+system, the attacker would still not have access to the raw filesystem.
+So with a separate `COW <https://en.wikipedia.org/wiki/Copy-on-write>`__
+storage system, an attacker might be able to temporarily command data
+changes on storage side, but the uncompromised data before the attack
+would remain available and an immediate rollback would therefore be
+possible. And due to not having direct raw access to the storage
+filesystem, the attack could then be audited later on in detail as the
+attacker would not be able to wipe its traces on the storage logs.
+
+3. synth fs driver
+
+The original ambition for this driver was to allow QEMU subsystems to
+expose a synthetic API to the client, i.e. to expose some stats,
+information or any knob you can think of to the guest *à la* linux
+kernel /sys. This never gained momentum and remained totally unused for
+years, until a new use case was found : use it to implement 9p protocol
+validation tests. This fs driver is now exclusively used for development
+purposes. It just simulates individual filesystem operations with
+specific test scenarios in mind, and therefore is not useful for
+anything on a production system. The main purpose of the "synth" fs
+driver is to simulate certain fs behaviours that would be hard to
+trigger with a regular (production) fs driver like the "local" fs driver
+for instance. Right now the synth fs driver is used by the automated
+`9pfs test cases <#Synth_Tests>`__ and by the automated 9pfs fuzzing
+code. The automated test cases use the "synth" fs driver for instance to
+check the 9p server's correct behaviour on 9p
+`Tflush <http://ericvh.github.io/9p-rfc/rfc9p2000.html#anchor28>`__
+requests, which a client may send to abort a file I/O operation that
+might already be blocking for a long time. In general the "synth" driver
+is very useful for effectively simulating any multi-threaded use case
+scenarios.
+`hw/9pfs/9p-synth.c <https://gitlab.com/qemu-project/qemu/-/blob/master/hw/9pfs/9p-synth.c>`__
+
+9p Transport Drivers
+~~~~~~~~~~~~~~~~~~~~
+
+The third component of the 9pfs implementation in QEMU is the
+"transport" driver, which is the communication channel between host
+system and guest system used by the 9p server. There are currently two
+9p transport driver implementations available in QEMU:
+
+1. virtio transport driver
+
+The 9p "virtio" transport driver uses e.g. a virtual PCI device and
+ontop the
+`virtio <https://docs.oasis-open.org/virtio/virtio/v1.1/virtio-v1.1.html>`__
+protocol to transfer the 9p messages between clients (guest systems) and
+9p server (host system).
+`hw/9pfs/virtio-9p-device.c <https://gitlab.com/qemu-project/qemu/-/blob/master/hw/9pfs/virtio-9p-device.c>`__
+
+2. Xen transport driver
+
+TODO
+`hw/9pfs/xen-9p-backend.c <https://gitlab.com/qemu-project/qemu/-/blob/master/hw/9pfs/xen-9p-backend.c>`__
+
+Threads and Coroutines
+----------------------
+
+Coroutines
+~~~~~~~~~~
+
+The 9pfs implementation in QEMU heavily uses
+`Coroutines <https://en.wikipedia.org/wiki/Coroutine>`__ to handle
+individual 9p requests.
+
+If you haven't used Coroutines before, simply put: a Coroutine manages
+its own stack memory. That's it. So when a thread enters the scope of a
+Coroutine then everything that is usually put on the thread's own stack
+memory (and the latter being always firmly tied to that thread) is
+rather put on the Coroutine's stack memory instead. The advantage is, as
+Coroutines are just data structures, they can be passed from one thread
+to another. So Coroutines allow to use memory stacks that are decoupled
+from specific threads.
+
+Another important aspect to know is that once a thread leaves the scope
+of a Coroutine, then that thread is back at using its own thread-owned
+stack again.
+
+`frameless|upright=2.4 <File:Coroutines_stacks.png>`__
+
+Each coroutine instance usually handles a certain "collaborative" task,
+where "collaborative" means that individual parts of the task usually
+need to be executed by different threads before the overall task
+eventually can be considered as fulfilled. So if a thread knows it has
+to start a new task that may also require other threads to process parts
+of that task, then that thread allocates a Coroutine instance. The
+thread then "enters" the Coroutine scope, which means starting at this
+point every local variable and all following function calls (function
+call stack, including function arguments and their return values) are
+put on the Coroutine's stack memory instead of the thread's own memory
+stack (as it would usually). So now the thread would call arbitrary
+functions, run loops, create local variables inside them, etc. and then
+at a certain point the thread realizes that something of the task needs
+to be handled by a different thread next. At this point the thread
+leaves the Coroutine scope (e.g. by either "yielding" or "awaiting"), it
+then passes the Coroutine instance to another thread which in turn
+enters the Coroutine scope and finds the call stack and all local
+variables exactly as it was left by the previous thread using the
+Coroutine instance before.
+
+It is important to understand that Coroutines are really just covering
+memory stack aspects. They are not dealing with any multi-threading
+aspects by themselves. Which has the advantage that Coroutines can be
+combined with any multi-threading concept & framework (e.g. POSIX
+threads, Grand Central Dispatch, ...).
+
+Control Flow
+~~~~~~~~~~~~
+
+The following figure shows the control flow and relationship of Threads
+and Coroutines of the 9pfs implementation.
+
+`frameless|upright=3.5 <File:9pfs_control_flow.png>`__
+
+Getting back to 9pfs as concrete user of Coroutines, every 9P client
+request that comes in on 9P server side is a task the 9P server needs to
+fulfill on behalf of the client / guest OS. So for every 9P request a
+Coroutine instance is allocated. Then the 9P server's main thread
+"enters" the Coroutine scope to start processing the client's 9P
+request. At a certain point something of that request usually needs to
+be handled by the fs driver which means the fs driver needs to call file
+I/O syscall(s) which might block for a long time. Therefore the 9P
+server leaves the Coroutine at that point and dispatches the Coroutine
+instance to a QEMU worker thread which then executes the fs driver
+function(s) for fulfilling the actual file system I/O task(s). Once the
+worker thread is done with the fs I/O task portion it leaves the
+Coroutine scope and dispatches the Coroutine data structure back to the
+server's main thread, which in turn would re-enter the Coroutine and
+continue processing the request with the result as provided by the
+worker thread. So yet again, main thread finds the call stack and local
+variables exactly as it was left by the worker thread when it
+re-rentered the Coroutine.
+
+The primary major advantages of this design is that the 9P server's main
+thread can continue handling another 9P request while a worker thread
+would do the (maybe long taking) fs driver I/O subtask(s), and yet code
+complexity is reduced substantially in comparison to other
+multi-threaded task handling concepts, which also improves safety.
+
+Main Thread
+~~~~~~~~~~~
+
+Almost the entire 9p server is running on the QEMU main thread, with the
+exception of some worker threads handling fs driver file I/O tasks as
+described above. So basically everything in
+`hw/9pfs/9p.c <https://gitlab.com/qemu-project/qemu/-/blob/master/hw/9pfs/9p.c>`__
+you can assume to run on main thread, except of function calls there
+with the naming scheme \*_co_*(). So if you find a call with such a
+function name pattern you can know immediately that this function
+dispatches the Coroutine at this point to a worker thread (by using the
+macro v9fs_co_run_in_worker(...) inside its function implementation),
+and when the \*_co_*() function call returned, it already dispatched the
+Coroutine back to main thread.
+
+Parallelism
+~~~~~~~~~~~
+
+Incoming 9p requests are processed by the 9p server's main thread in the
+order they arrived. However while 9p requests (i.e. their coroutine) are
+dispatched for filesystem I/O to a worker thread, the 9p server's main
+thread would handle another 9p request (if any) in the meantime. Each 9p
+request (i.e. coroutine) might be dispatched between main thread and
+some worker thread several times (for the same 9p request that is)
+before the 9p request is completed by the server and a 9p response
+eventually been sent to client. So pending 9p requests are therefore
+handled in parallel by the 9p server, and there is no guarantee that 9p
+replies are transmitted in the exact same order as their 9p requests
+originally came in.
+
+Carrying out several 9p requests simultaniously allows higher
+performance, provided that the 9p client implementation supports
+parallelism as well. Apart from performance aspects, the 9p protocol
+requires parallel handling of
+`Tflush <http://ericvh.github.io/9p-rfc/rfc9p2000.html#anchor28>`__
+requests, to allow aborting I/O requests that might be blocking for a
+long time, e.g. to prevent them from hanging for good on server side. We
+do have a test case for this Tflush behaviour by the way.
+
+Test Cases
+----------
+
+Whatever you are doing there on the 9pfs code base, please run the
+automated test cases after you modified the source code to ensure that
+your changes did not break the expected behaviour of 9pfs. Running the
+tests is very simple and does not require any guest OS installation, nor
+is any guest OS booted, and for that reason you can run them in few
+seconds. The test cases are also a very efficient way to check whether
+your 9pfs changes are actually doing what you want them to while still
+coding.
+
+To run the 9pfs tests e.g. on a x86 system, all you need to do is
+executing the following two commands:
+
+| ``    export QTEST_QEMU_BINARY=x86_64-softmmu/qemu-system-x86_64``
+| ``    tests/qtest/qos-test -m slow``
+
+All 9pfs test cases are in
+`tests/qtest/virtio-9p-test.c <https://gitlab.com/qemu-project/qemu/-/blob/master/tests/qtest/virtio-9p-test.c>`__
+source file. If all runs well and all tests pass, you should see an
+output like this:
+
+| ``   ...``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/pci-device/pci-device-tests/nop: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio/virtio-tests/nop: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/config: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/version/basic: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/attach/basic: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/walk/basic: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/walk/no_slash: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/walk/dotdot_from_root: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/lopen/basic: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/write/basic: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/flush/success: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/flush/ignored: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/readdir/basic: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/readdir/split_512: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/readdir/split_256: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/readdir/split_128: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/local/config: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/local/create_dir: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/local/unlinkat_dir: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/local/create_file: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/local/unlinkat_file: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/local/symlink_file: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/local/unlinkat_symlink: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/local/hardlink_file: OK``
+| ``   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/local/unlinkat_hardlink: OK``
+| ``   ...``
+
+If you don't see all test cases appearing on screen, or if some problem
+occurs, try adding --verbose to the command line:
+
+``   tests/qtest/qos-test -m slow --verbose``
+
+Keep in mind that QEMU's qtest framework automatically enables just
+those test cases that are supported by your machine and configuration.
+With the --verbose switch you will see exactly which individual tests
+are enabled and which not at the beginning of the output:
+
+| ``   ...``
+| ``   # ALL QGRAPH NODES: {``
+| ``   #        name='e1000e-tests/rx' type=3 cmd_line='(null)' [available]``
+| ``   #        name='virtio-9p-tests/synth/readdir/basic' type=3 cmd_line='(null)' [available]``
+| ``   #        name='virtio-scsi-pci' type=1 cmd_line=' -device virtio-scsi-pci' [available]``
+| ``   #        name='virtio-9p-tests/synth/readdir/split_128' type=3 cmd_line='(null)' [available]``
+| ``   #        name='virtio-net-tests/vhost-user/multiqueue' type=3 cmd_line='(null)' [available]``
+| ``   #        name='virtio-9p-tests/local/unlinkat_symlink' type=3 cmd_line='(null)' [available]``
+| ``   ...``
+
+And for each test case being executed, you can see the precise QEMU
+command line that is used for that individual test:
+
+| ``   ...``
+| ``   GTest: run: /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/local/unlinkat_dir``
+| ``   # Run QEMU with: '-M pc  -fsdev local,id=fsdev0,path='/home/me/src/qemu/build/qtest-9p-local-ELKQGv',security_model=mapped-xattr -device virtio-9p-pci,fsdev=fsdev0,addr=04.0,mount_tag=qtest'``
+| ``   GTest: result: OK``
+| ``   ...``
+
+You can also just run one or a smaller list of tests to concentrate on
+whatever you are working on. To get a list of all test cases:
+
+``   tests/qtest/qos-test -l``
+
+Then pass the respective test case name(s) as argument -p to run them as
+"partial" tests, e.g.:
+
+``   tests/qtest/qos-test -p /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/readdir/split_128``
+
+Synth Tests
+~~~~~~~~~~~
+
+As you can see at the end of the virtio-9p-test.c file, the 9pfs test
+cases are split into two groups of tests. The first group of tests use
+the "synth" fs driver, so all file I/O operations are simulated and
+basically you can add all kinds of hacks into the synth driver to
+simulate whatever you need to test certain fs behaviours, no matter how
+exotic that behaviour might be. This is the place to validate that the
+9p server in
+`hw/9pfs/9p.c <https://gitlab.com/qemu-project/qemu/-/blob/master/hw/9pfs/9p.c>`__
+honors the 9p protocol, e.g.
+`Tflush <http://ericvh.github.io/9p-rfc/rfc9p2000.html#anchor28>`__
+actually cancels a pending request. Testing of *real life* scenarios
+doesn't belong here : they should be performed with the "local" fs
+driver because this is what is used in production.
+
+Local Tests
+~~~~~~~~~~~
+
+The second group of tests use the "local" fs driver, so they are
+actually operating on real dirs and files in a test directory on the
+host filesystem. Some issues that happened in the past were caused by a
+combination of the 9p server and the actual "local" fs driver that's
+usually used on production machines. For that reason this group of tests
+are covering issues thay may happen across these two components of 9pfs.
+Again, this works without any guest OS, which has the advantage that you
+can test the behaviour independent of third-party 9p client
+implementations.
+
+Roadmap
+-------
+
+This is a rough list of things that are planned to be changed in future.
+
+Implementation Plans
+~~~~~~~~~~~~~~~~~~~~
+
+-  Optimizations:
+
+   -  Reducing thread hops: Right now in
+      `hw/9pfs/9p.c <https://gitlab.com/qemu-project/qemu/-/blob/master/hw/9pfs/9p.c>`__
+      almost every request (its coroutine that is) is dispatched
+      multiple times between 9p server's main thread and some worker
+      thread back and forth. Every thread hop adds latency to the
+      overall completion time of a request. The desired plan is to
+      reduce the amount of thread hops to a minimum, ideally one 9p
+      request would be dispatched exactly one time to a worker thread
+      for all required filesystem related I/O subtasks and then
+      dispatched back exactly one time back to main thread. Some work on
+      this has already been done for
+      `Treaddir <https://github.com/chaos/diod/blob/master/protocol.md#readdir---read-a-directory>`__
+      request handling, as this was the request type suffering the most
+      under large amount of thread hops, and reduction of those hops
+      provided `significant performance improvements for
+      Treaddir <https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg05539.html>`__
+      handling. For other request types similar changes should be
+      applied.
+   -  Making Tflush non-blocking: When handling a
+      `Tflush <http://ericvh.github.io/9p-rfc/rfc9p2000.html#anchor28>`__
+      request, server currently blocks the Tflush request's coroutine
+      until the requested other I/O request was actually aborted. From
+      the specs though Tflush should return immediately, and currently
+      this blocking behaviour has a negative performance impact
+      especially with 9p clients that do not support handling parallel
+      requests.
+
+Protocol Plans
+~~~~~~~~~~~~~~
+
+These are some of the things that we might want to change on 9p protocol
+level in future. Right now this list just serves for roughly collecting
+some ideas for future protocol changes. Don't expect protocol changes in
+near future though, this will definitely take a long time.
+
+-  Fixes:
+
+   -  Increase qid.path Size: The
+      `qid.path <http://ericvh.github.io/9p-rfc/rfc9p2000.html#anchor32>`__
+      (which should not be confused with a filesystem path like
+      "/foo/bar/") is an integer supposed to uniquely identify a file,
+      which is currently a 64-bit number. A filesystem on host often has
+      things like hard links which means different pathes on the
+      filesystem might actually point to the same file and a numeric
+      file ID in general is used to detect that by systems. Certain
+      services like Samba are using this information, and incorrect
+      handling (i.e. collisions) of unique file IDs can cause
+      misbehaviours. The problem though is that 9p might share more than
+      one filesystem anywhere under its 9p share's root path. So a truly
+      unique file ID under Linux for instance is the combination of the
+      mounted filesystem's device ID and the individual file's inode
+      number, which is larger than 64-bit combined and hence would
+      exceed 9p protocol's qid.path field. By default we only pass the
+      file's inode number via qid.path, so we are assuming that only one
+      filesystem is shared per 9p share. If multiple filesystems are
+      detected, a warning is logged at runtime noting that file ID
+      collisions are possible, and suggesting to enable the
+      multidevs=remap option, which (if enabled) remaps file IDs from
+      host to guest in a way that would prevent such collisions. In
+      practice this remapping should happen with no noticable overhead,
+      but obviously in a future protocol change this should be addressed
+      by simply increasing the qid.path e.g. to 128 bits so that we
+      won't need to remap file IDs in future anymore.
+
+-  Cleanup:
+
+   -  Merge Dialects: It might make sense merging the individual 9p
+      dialects to just one protocol version for all systems to reduce
+      complexity and confusion.
+
+-  Optimizations:
+
+   -  Extend Treaddir: To retrieve a list of directory entries a
+      `Treaddir <https://github.com/chaos/diod/blob/master/protocol.md#readdir---read-a-directory>`__
+      request is sent by clients. In practice, this request is followed
+      by a large amount of individual requests for getting more detailed
+      information about each directory entry like permissions, ownership
+      and so forth. For that reason it might make sense for allowing to
+      optionally return such common detailed information already with a
+      single Rreaddir response to avoid overhead.
+
+Contribute
+----------
+
+Please refer to `Contribute/SubmitAPatch <Contribute/SubmitAPatch>`__
+for instructions about how to send your patches.
+
+On doubt, just send a message to
+`qemu-devel <https://lists.nongnu.org/mailman/listinfo/qemu-devel>`__
+first; but as this is a high traffic mailing list, don't forget to add
+"9p" to the subject line to prevent your message from ending up unseen.
+
+`Category:Developer documentation <Category:Developer_documentation>`__
-- 
2.20.1


