Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DACE9146FFF
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 18:47:57 +0100 (CET)
Received: from localhost ([::1]:33920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iugaC-0001Dn-BX
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 12:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48395)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iueRd-0000Nk-P2
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 10:31:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iueRZ-0003iT-RM
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 10:30:57 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:50266)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iueRZ-0003hp-HF
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 10:30:53 -0500
Received: by mail-wm1-x32f.google.com with SMTP id a5so3022309wmb.0
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 07:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JhkqBy+Vx72L/6CNPvdJNHFbbYv4q6aoxO+OdL5kZIA=;
 b=rHv4yEsnV7/hYyvVsRMGlUZuI9qcYUuo9Bpy6sIVxAlq593GXsXOgTIxEEAWPVGBd4
 ydz9lklCe9MuyKfoPuDfYpEeJ3SBPzsGwM2kZv8YUrHxwtST+V630BHVnstjzSF62LNp
 qs2nDMpYeUJBn1G4J3vv1j4U82hb1tqvpWqu0RsAX/3WCd42mVm/+1k9M3aJ33z87hsF
 pAjY6xTPXHyt4GlMqxpCbSURvLb2nWrp9Zd+Ic7TCHJQ1hrxQ0BWldeQonW4q5x/0c4n
 l6+I3BRV3wpW9+xBSgWEG2b5gg9nqUNEWcQvnBBqkVZugCd0msvXtrpb80GcAYL/QVVs
 6khw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JhkqBy+Vx72L/6CNPvdJNHFbbYv4q6aoxO+OdL5kZIA=;
 b=DCyx5J+RQr+7rByEeewkQpjyjf+aPfTsafPsxSfZuPplRZJEuM0NI7CowGnAAE5TC8
 bxPux4KDW/F9KAGISWPFVheNGbB92fsMFl/O8i1+FUFx3S/cZAj+ra96ak5URJqB2mlU
 CUZ2OINh/W4DicQEIpO+AIXz0nx9cN4/0Ne8v2QZduXeTi5rHoEXvBKfJkJS0M5jgmhB
 sW/+0L6TtyUANuc6b3bICCGOF9llhM5Cxn4jUdnguGiAKF+3ZO4rrf005DqdO54EkMAn
 biAIYIz0MFY7XnHlDmCLg3CFVZZlt9/UZOBDErPk++zFON6R5sfCqebSk1EUL+J/qZKw
 oHWg==
X-Gm-Message-State: APjAAAXBq1nasYwj3EkO9aWxs/bsQg7DGLXhaREeC+ZSlJsNQXZtPN2o
 2udSnFiBzn1cH0MzrADsf/dAdGJgLCKe2Q==
X-Google-Smtp-Source: APXvYqy90Ru3wbmJLSlhzUkaTzqtCYvcdGJxptyTbR4t19Z2gcXFupmxi4SKs3nfdotvJRRfkhHeAQ==
X-Received: by 2002:a05:600c:108a:: with SMTP id
 e10mr4660896wmd.38.1579793451462; 
 Thu, 23 Jan 2020 07:30:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s139sm2903592wme.35.2020.01.23.07.30.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 07:30:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/20] qemu-nbd: Convert invocation documentation to rST
Date: Thu, 23 Jan 2020 15:30:29 +0000
Message-Id: <20200123153041.4248-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200123153041.4248-1-peter.maydell@linaro.org>
References: <20200123153041.4248-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32f
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

The qemu-nbd documentation is currently in qemu-nbd.texi in Texinfo
format, which we present to the user as:
 * a qemu-nbd manpage
 * a section of the main qemu-doc HTML documentation

Convert the documentation to rST format, and present it to the user as:
 * a qemu-nbd manpage
 * part of the interop/ Sphinx manual

This follows the same pattern as commit 27a296fce982 did for the
qemu-ga manpage.

All the content of the old manpage is retained, except that I have
dropped the "This is free software; see the source for copying
conditions.  There is NO warranty..." text that was in the old AUTHOR
section; Sphinx's manpage builder doesn't expect that much text in
the AUTHOR section, and since none of our other manpages have it it
seems easiest to delete it rather than try to figure out where else
in the manpage to put it.

The only other textual change is that I have had to give the
--nocache option its own description ("Equivalent to --cache=none")
because Sphinx doesn't have an equivalent of using item/itemx
to share a description between two options.

Some minor aspects of the formatting have changed, to suit what is
easiest for Sphinx to output. (The most notable is that Sphinx
option section option syntax doesn't support '--option foo=bar'
with bar underlined rather than bold, so we have to switch to
'--option foo=BAR' instead.)

The contents of qemu-option-trace.texi are now duplicated in
docs/interop/qemu-option-trace.rst.inc, until such time as we complete
the conversion of the other files which use it; since it has had only
3 changes in 3 years, this shouldn't be too awkward a burden.
(We use .rst.inc because if this file fragment has a .rst extension
then Sphinx complains about not seeing it in a toctree.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20200116141511.16849-2-peter.maydell@linaro.org
---
 Makefile                               |  16 +-
 MAINTAINERS                            |   1 +
 docs/interop/conf.py                   |   4 +-
 docs/interop/index.rst                 |   1 +
 docs/interop/qemu-nbd.rst              | 263 +++++++++++++++++++++++++
 docs/interop/qemu-option-trace.rst.inc |  30 +++
 qemu-doc.texi                          |   6 -
 qemu-nbd.texi                          | 214 --------------------
 qemu-option-trace.texi                 |   4 +
 9 files changed, 313 insertions(+), 226 deletions(-)
 create mode 100644 docs/interop/qemu-nbd.rst
 create mode 100644 docs/interop/qemu-option-trace.rst.inc
 delete mode 100644 qemu-nbd.texi

diff --git a/Makefile b/Makefile
index 6562b0dc970..b4a6c28107d 100644
--- a/Makefile
+++ b/Makefile
@@ -339,7 +339,9 @@ MANUAL_BUILDDIR := docs
 endif
 
 ifdef BUILD_DOCS
-DOCS=qemu-doc.html qemu-doc.txt qemu.1 qemu-img.1 qemu-nbd.8 $(MANUAL_BUILDDIR)/interop/qemu-ga.8
+DOCS=qemu-doc.html qemu-doc.txt qemu.1 qemu-img.1
+DOCS+=$(MANUAL_BUILDDIR)/interop/qemu-nbd.8
+DOCS+=$(MANUAL_BUILDDIR)/interop/qemu-ga.8
 DOCS+=docs/interop/qemu-qmp-ref.html docs/interop/qemu-qmp-ref.txt docs/interop/qemu-qmp-ref.7
 DOCS+=docs/interop/qemu-ga-ref.html docs/interop/qemu-ga-ref.txt docs/interop/qemu-ga-ref.7
 DOCS+=docs/qemu-block-drivers.7
@@ -829,7 +831,7 @@ ifdef CONFIG_POSIX
 ifeq ($(CONFIG_TOOLS),y)
 	$(INSTALL_DATA) qemu-img.1 "$(DESTDIR)$(mandir)/man1"
 	$(INSTALL_DIR) "$(DESTDIR)$(mandir)/man8"
-	$(INSTALL_DATA) qemu-nbd.8 "$(DESTDIR)$(mandir)/man8"
+	$(INSTALL_DATA) $(MANUAL_BUILDDIR)/interop/qemu-nbd.8 "$(DESTDIR)$(mandir)/man8"
 endif
 ifdef CONFIG_TRACE_SYSTEMTAP
 	$(INSTALL_DATA) scripts/qemu-trace-stap.1 "$(DESTDIR)$(mandir)/man1"
@@ -1007,7 +1009,9 @@ sphinxdocs: $(MANUAL_BUILDDIR)/devel/index.html $(MANUAL_BUILDDIR)/interop/index
 # a single doctree: https://github.com/sphinx-doc/sphinx/issues/2946
 build-manual = $(call quiet-command,CONFDIR="$(qemu_confdir)" sphinx-build $(if $(V),,-q) -W -b $2 -D version=$(VERSION) -D release="$(FULL_VERSION)" -d .doctrees/$1-$2 $(SRC_PATH)/docs/$1 $(MANUAL_BUILDDIR)/$1 ,"SPHINX","$(MANUAL_BUILDDIR)/$1")
 # We assume all RST files in the manual's directory are used in it
-manual-deps = $(wildcard $(SRC_PATH)/docs/$1/*.rst) $(SRC_PATH)/docs/$1/conf.py $(SRC_PATH)/docs/conf.py
+manual-deps = $(wildcard $(SRC_PATH)/docs/$1/*.rst) \
+              $(wildcard $(SRC_PATH)/docs/$1/*.rst.inc) \
+              $(SRC_PATH)/docs/$1/conf.py $(SRC_PATH)/docs/conf.py
 
 $(MANUAL_BUILDDIR)/devel/index.html: $(call manual-deps,devel)
 	$(call build-manual,devel,html)
@@ -1021,6 +1025,9 @@ $(MANUAL_BUILDDIR)/specs/index.html: $(call manual-deps,specs)
 $(MANUAL_BUILDDIR)/interop/qemu-ga.8: $(call manual-deps,interop)
 	$(call build-manual,interop,man)
 
+$(MANUAL_BUILDDIR)/interop/qemu-nbd.8: $(call manual-deps,interop)
+	$(call build-manual,interop,man)
+
 $(MANUAL_BUILDDIR)/index.html: $(SRC_PATH)/docs/index.html.in qemu-version.h
 	@mkdir -p "$(MANUAL_BUILDDIR)"
 	$(call quiet-command, sed "s|@@VERSION@@|${VERSION}|g" $< >$@, \
@@ -1048,7 +1055,6 @@ qemu.1: qemu-doc.texi qemu-options.texi qemu-monitor.texi qemu-monitor-info.texi
 qemu.1: qemu-option-trace.texi
 qemu-img.1: qemu-img.texi qemu-option-trace.texi qemu-img-cmds.texi
 fsdev/virtfs-proxy-helper.1: fsdev/virtfs-proxy-helper.texi
-qemu-nbd.8: qemu-nbd.texi qemu-option-trace.texi
 docs/qemu-block-drivers.7: docs/qemu-block-drivers.texi
 docs/qemu-cpu-models.7: docs/qemu-cpu-models.texi
 scripts/qemu-trace-stap.1: scripts/qemu-trace-stap.texi
@@ -1059,7 +1065,7 @@ pdf: qemu-doc.pdf docs/interop/qemu-qmp-ref.pdf docs/interop/qemu-ga-ref.pdf
 txt: qemu-doc.txt docs/interop/qemu-qmp-ref.txt docs/interop/qemu-ga-ref.txt
 
 qemu-doc.html qemu-doc.info qemu-doc.pdf qemu-doc.txt: \
-	qemu-img.texi qemu-nbd.texi qemu-options.texi \
+	qemu-img.texi qemu-options.texi \
 	qemu-tech.texi qemu-option-trace.texi \
 	qemu-deprecated.texi qemu-monitor.texi qemu-img-cmds.texi \
 	qemu-monitor-info.texi docs/qemu-block-drivers.texi \
diff --git a/MAINTAINERS b/MAINTAINERS
index 2c768ed3d8d..d9798c20c06 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2519,6 +2519,7 @@ F: include/block/nbd*
 F: qemu-nbd.*
 F: blockdev-nbd.c
 F: docs/interop/nbd.txt
+F: docs/interop/qemu-nbd.rst
 T: git https://repo.or.cz/qemu/ericb.git nbd
 
 NFS
diff --git a/docs/interop/conf.py b/docs/interop/conf.py
index e87b8c22bec..40b1ad811de 100644
--- a/docs/interop/conf.py
+++ b/docs/interop/conf.py
@@ -18,5 +18,7 @@ html_theme_options['description'] = u'System Emulation Management and Interopera
 # (source start file, name, description, authors, manual section).
 man_pages = [
     ('qemu-ga', 'qemu-ga', u'QEMU Guest Agent',
-     ['Michael Roth <mdroth@linux.vnet.ibm.com>'], 8)
+     ['Michael Roth <mdroth@linux.vnet.ibm.com>'], 8),
+    ('qemu-nbd', 'qemu-nbd', u'QEMU Disk Network Block Device Server',
+     ['Anthony Liguori <anthony@codemonkey.ws>'], 8)
 ]
diff --git a/docs/interop/index.rst b/docs/interop/index.rst
index 049387ac6de..c28f7785a55 100644
--- a/docs/interop/index.rst
+++ b/docs/interop/index.rst
@@ -18,5 +18,6 @@ Contents:
    live-block-operations
    pr-helper
    qemu-ga
+   qemu-nbd
    vhost-user
    vhost-user-gpu
diff --git a/docs/interop/qemu-nbd.rst b/docs/interop/qemu-nbd.rst
new file mode 100644
index 00000000000..873bb9e17d5
--- /dev/null
+++ b/docs/interop/qemu-nbd.rst
@@ -0,0 +1,263 @@
+QEMU Disk Network Block Device Server
+=====================================
+
+Synopsis
+--------
+
+**qemu-nbd** [*OPTION*]... *filename*
+
+**qemu-nbd** -L [*OPTION*]...
+
+**qemu-nbd** -d *dev*
+
+Description
+-----------
+
+Export a QEMU disk image using the NBD protocol.
+
+Other uses:
+
+- Bind a /dev/nbdX block device to a QEMU server (on Linux).
+- As a client to query exports of a remote NBD server.
+
+Options
+-------
+
+.. program:: qemu-nbd
+
+*filename* is a disk image filename, or a set of block
+driver options if ``--image-opts`` is specified.
+
+*dev* is an NBD device.
+
+.. option:: --object type,id=ID,...props...
+
+  Define a new instance of the *type* object class identified by *ID*.
+  See the :manpage:`qemu(1)` manual page for full details of the properties
+  supported. The common object types that it makes sense to define are the
+  ``secret`` object, which is used to supply passwords and/or encryption
+  keys, and the ``tls-creds`` object, which is used to supply TLS
+  credentials for the qemu-nbd server or client.
+
+.. option:: -p, --port=PORT
+
+  TCP port to listen on as a server, or connect to as a client
+  (default ``10809``).
+
+.. option:: -o, --offset=OFFSET
+
+  The offset into the image.
+
+.. option:: -b, --bind=IFACE
+
+  The interface to bind to as a server, or connect to as a client
+  (default ``0.0.0.0``).
+
+.. option:: -k, --socket=PATH
+
+  Use a unix socket with path *PATH*.
+
+.. option:: --image-opts
+
+  Treat *filename* as a set of image options, instead of a plain
+  filename. If this flag is specified, the ``-f`` flag should
+  not be used, instead the :option:`format=` option should be set.
+
+.. option:: -f, --format=FMT
+
+  Force the use of the block driver for format *FMT* instead of
+  auto-detecting.
+
+.. option:: -r, --read-only
+
+  Export the disk as read-only.
+
+.. option:: -P, --partition=NUM
+
+  Deprecated: Only expose MBR partition *NUM*.  Understands physical
+  partitions 1-4 and logical partition 5. New code should instead use
+  :option:`--image-opts` with the raw driver wrapping a subset of the
+  original image.
+
+.. option:: -B, --bitmap=NAME
+
+  If *filename* has a qcow2 persistent bitmap *NAME*, expose
+  that bitmap via the ``qemu:dirty-bitmap:NAME`` context
+  accessible through NBD_OPT_SET_META_CONTEXT.
+
+.. option:: -s, --snapshot
+
+  Use *filename* as an external snapshot, create a temporary
+  file with ``backing_file=``\ *filename*, redirect the write to
+  the temporary one.
+
+.. option:: -l, --load-snapshot=SNAPSHOT_PARAM
+
+  Load an internal snapshot inside *filename* and export it
+  as an read-only device, SNAPSHOT_PARAM format is
+  ``snapshot.id=[ID],snapshot.name=[NAME]`` or ``[ID_OR_NAME]``
+
+.. option:: --cache=CACHE
+
+  The cache mode to be used with the file.  See the documentation of
+  the emulator's ``-drive cache=...`` option for allowed values.
+
+.. option:: -n, --nocache
+
+  Equivalent to :option:`--cache=none`.
+
+.. option:: --aio=AIO
+
+  Set the asynchronous I/O mode between ``threads`` (the default)
+  and ``native`` (Linux only).
+
+.. option:: --discard=DISCARD
+
+  Control whether ``discard`` (also known as ``trim`` or ``unmap``)
+  requests are ignored or passed to the filesystem. *DISCARD* is one of
+  ``ignore`` (or ``off``), ``unmap`` (or ``on``).  The default is
+  ``ignore``.
+
+.. option:: --detect-zeroes=DETECT_ZEROES
+
+  Control the automatic conversion of plain zero writes by the OS to
+  driver-specific optimized zero write commands.  *DETECT_ZEROES* is one of
+  ``off``, ``on``, or ``unmap``.  ``unmap``
+  converts a zero write to an unmap operation and can only be used if
+  *DISCARD* is set to ``unmap``.  The default is ``off``.
+
+.. option:: -c, --connect=DEV
+
+  Connect *filename* to NBD device *DEV* (Linux only).
+
+.. option:: -d, --disconnect
+
+  Disconnect the device *DEV* (Linux only).
+
+.. option:: -e, --shared=NUM
+
+  Allow up to *NUM* clients to share the device (default
+  ``1``). Safe for readers, but for now, consistency is not
+  guaranteed between multiple writers.
+
+.. option:: -t, --persistent
+
+  Don't exit on the last connection.
+
+.. option:: -x, --export-name=NAME
+
+  Set the NBD volume export name (default of a zero-length string).
+
+.. option:: -D, --description=DESCRIPTION
+
+  Set the NBD volume export description, as a human-readable
+  string.
+
+.. option:: -L, --list
+
+  Connect as a client and list all details about the exports exposed by
+  a remote NBD server.  This enables list mode, and is incompatible
+  with options that change behavior related to a specific export (such as
+  :option:`--export-name`, :option:`--offset`, ...).
+
+.. option:: --tls-creds=ID
+
+  Enable mandatory TLS encryption for the server by setting the ID
+  of the TLS credentials object previously created with the --object
+  option; or provide the credentials needed for connecting as a client
+  in list mode.
+
+.. option:: --fork
+
+  Fork off the server process and exit the parent once the server is running.
+
+.. option:: --pid-file=PATH
+
+  Store the server's process ID in the given file.
+
+.. option:: --tls-authz=ID
+
+  Specify the ID of a qauthz object previously created with the
+  :option:`--object` option. This will be used to authorize connecting users
+  against their x509 distinguished name.
+
+.. option:: -v, --verbose
+
+  Display extra debugging information.
+
+.. option:: -h, --help
+
+  Display this help and exit.
+
+.. option:: -V, --version
+
+  Display version information and exit.
+
+.. option:: -T, --trace [[enable=]PATTERN][,events=FILE][,file=FILE]
+
+  .. include:: qemu-option-trace.rst.inc
+
+Examples
+--------
+
+Start a server listening on port 10809 that exposes only the
+guest-visible contents of a qcow2 file, with no TLS encryption, and
+with the default export name (an empty string). The command is
+one-shot, and will block until the first successful client
+disconnects:
+
+::
+
+  qemu-nbd -f qcow2 file.qcow2
+
+Start a long-running server listening with encryption on port 10810,
+and whitelist clients with a specific X.509 certificate to connect to
+a 1 megabyte subset of a raw file, using the export name 'subset':
+
+::
+
+  qemu-nbd \
+    --object tls-creds-x509,id=tls0,endpoint=server,dir=/path/to/qemutls \
+    --object 'authz-simple,id=auth0,identity=CN=laptop.example.com,,\
+              O=Example Org,,L=London,,ST=London,,C=GB' \
+    --tls-creds tls0 --tls-authz auth0 \
+    -t -x subset -p 10810 \
+    --image-opts driver=raw,offset=1M,size=1M,file.driver=file,file.filename=file.raw
+
+Serve a read-only copy of just the first MBR partition of a guest
+image over a Unix socket with as many as 5 simultaneous readers, with
+a persistent process forked as a daemon:
+
+::
+
+  qemu-nbd --fork --persistent --shared=5 --socket=/path/to/sock \
+    --partition=1 --read-only --format=qcow2 file.qcow2
+
+Expose the guest-visible contents of a qcow2 file via a block device
+/dev/nbd0 (and possibly creating /dev/nbd0p1 and friends for
+partitions found within), then disconnect the device when done.
+Access to bind qemu-nbd to an /dev/nbd device generally requires root
+privileges, and may also require the execution of ``modprobe nbd``
+to enable the kernel NBD client module.  *CAUTION*: Do not use
+this method to mount filesystems from an untrusted guest image - a
+malicious guest may have prepared the image to attempt to trigger
+kernel bugs in partition probing or file system mounting.
+
+::
+
+  qemu-nbd -c /dev/nbd0 -f qcow2 file.qcow2
+  qemu-nbd -d /dev/nbd0
+
+Query a remote server to see details about what export(s) it is
+serving on port 10809, and authenticating via PSK:
+
+::
+
+  qemu-nbd \
+    --object tls-creds-psk,id=tls0,dir=/tmp/keys,username=eblake,endpoint=client \
+    --tls-creds tls0 -L -b remote.example.com
+
+See also
+--------
+
+:manpage:`qemu(1)`, :manpage:`qemu-img(1)`
diff --git a/docs/interop/qemu-option-trace.rst.inc b/docs/interop/qemu-option-trace.rst.inc
new file mode 100644
index 00000000000..23cfcb48537
--- /dev/null
+++ b/docs/interop/qemu-option-trace.rst.inc
@@ -0,0 +1,30 @@
+..
+  The contents of this file must be kept in sync with qemu-option-trace.texi
+  until all the users of the texi file have been converted to rst and
+  the texi file can be removed.
+
+Specify tracing options.
+
+.. option:: [enable=]PATTERN
+
+  Immediately enable events matching *PATTERN*
+  (either event name or a globbing pattern).  This option is only
+  available if QEMU has been compiled with the ``simple``, ``log``
+  or ``ftrace`` tracing backend.  To specify multiple events or patterns,
+  specify the :option:`-trace` option multiple times.
+
+  Use :option:`-trace help` to print a list of names of trace points.
+
+.. option:: events=FILE
+
+  Immediately enable events listed in *FILE*.
+  The file must contain one event name (as listed in the ``trace-events-all``
+  file) per line; globbing patterns are accepted too.  This option is only
+  available if QEMU has been compiled with the ``simple``, ``log`` or
+  ``ftrace`` tracing backend.
+
+.. option:: file=FILE
+
+  Log output traces to *FILE*.
+  This option is only available if QEMU has been compiled with
+  the ``simple`` tracing backend.
diff --git a/qemu-doc.texi b/qemu-doc.texi
index 39f950471f2..617485d1461 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -633,7 +633,6 @@ encrypted disk images.
 * disk_images_snapshot_mode:: Snapshot mode
 * vm_snapshots::              VM snapshots
 * qemu_img_invocation::       qemu-img Invocation
-* qemu_nbd_invocation::       qemu-nbd Invocation
 * disk_images_formats::       Disk image file formats
 * host_drives::               Using host drives
 * disk_images_fat_images::    Virtual FAT disk images
@@ -724,11 +723,6 @@ state is not saved or restored properly (in particular USB).
 
 @include qemu-img.texi
 
-@node qemu_nbd_invocation
-@subsection @code{qemu-nbd} Invocation
-
-@include qemu-nbd.texi
-
 @include docs/qemu-block-drivers.texi
 
 @node pcsys_network
diff --git a/qemu-nbd.texi b/qemu-nbd.texi
deleted file mode 100644
index 7f55657722b..00000000000
--- a/qemu-nbd.texi
+++ /dev/null
@@ -1,214 +0,0 @@
-@example
-@c man begin SYNOPSIS
-@command{qemu-nbd} [OPTION]... @var{filename}
-
-@command{qemu-nbd} @option{-L} [OPTION]...
-
-@command{qemu-nbd} @option{-d} @var{dev}
-@c man end
-@end example
-
-@c man begin DESCRIPTION
-
-Export a QEMU disk image using the NBD protocol.
-
-Other uses:
-@itemize
-@item
-Bind a /dev/nbdX block device to a QEMU server (on Linux).
-@item
-As a client to query exports of a remote NBD server.
-@end itemize
-
-@c man end
-
-@c man begin OPTIONS
-@var{filename} is a disk image filename, or a set of block
-driver options if @option{--image-opts} is specified.
-
-@var{dev} is an NBD device.
-
-@table @option
-@item --object type,id=@var{id},...props...
-Define a new instance of the @var{type} object class identified by @var{id}.
-See the @code{qemu(1)} manual page for full details of the properties
-supported. The common object types that it makes sense to define are the
-@code{secret} object, which is used to supply passwords and/or encryption
-keys, and the @code{tls-creds} object, which is used to supply TLS
-credentials for the qemu-nbd server or client.
-@item -p, --port=@var{port}
-The TCP port to listen on as a server, or connect to as a client
-(default @samp{10809}).
-@item -o, --offset=@var{offset}
-The offset into the image.
-@item -b, --bind=@var{iface}
-The interface to bind to as a server, or connect to as a client
-(default @samp{0.0.0.0}).
-@item -k, --socket=@var{path}
-Use a unix socket with path @var{path}.
-@item --image-opts
-Treat @var{filename} as a set of image options, instead of a plain
-filename. If this flag is specified, the @var{-f} flag should
-not be used, instead the '@code{format=}' option should be set.
-@item -f, --format=@var{fmt}
-Force the use of the block driver for format @var{fmt} instead of
-auto-detecting.
-@item -r, --read-only
-Export the disk as read-only.
-@item -P, --partition=@var{num}
-Deprecated: Only expose MBR partition @var{num}.  Understands physical
-partitions 1-4 and logical partition 5. New code should instead use
-@option{--image-opts} with the raw driver wrapping a subset of the
-original image.
-@item -B, --bitmap=@var{name}
-If @var{filename} has a qcow2 persistent bitmap @var{name}, expose
-that bitmap via the ``qemu:dirty-bitmap:@var{name}'' context
-accessible through NBD_OPT_SET_META_CONTEXT.
-@item -s, --snapshot
-Use @var{filename} as an external snapshot, create a temporary
-file with backing_file=@var{filename}, redirect the write to
-the temporary one.
-@item -l, --load-snapshot=@var{snapshot_param}
-Load an internal snapshot inside @var{filename} and export it
-as an read-only device, @var{snapshot_param} format is
-'snapshot.id=[ID],snapshot.name=[NAME]' or '[ID_OR_NAME]'
-@item -n, --nocache
-@itemx --cache=@var{cache}
-The cache mode to be used with the file.  See the documentation of
-the emulator's @code{-drive cache=...} option for allowed values.
-@item --aio=@var{aio}
-Set the asynchronous I/O mode between @samp{threads} (the default)
-and @samp{native} (Linux only).
-@item --discard=@var{discard}
-Control whether @dfn{discard} (also known as @dfn{trim} or @dfn{unmap})
-requests are ignored or passed to the filesystem.  @var{discard} is one of
-@samp{ignore} (or @samp{off}), @samp{unmap} (or @samp{on}).  The default is
-@samp{ignore}.
-@item --detect-zeroes=@var{detect-zeroes}
-Control the automatic conversion of plain zero writes by the OS to
-driver-specific optimized zero write commands.  @var{detect-zeroes} is one of
-@samp{off}, @samp{on} or @samp{unmap}.  @samp{unmap}
-converts a zero write to an unmap operation and can only be used if
-@var{discard} is set to @samp{unmap}.  The default is @samp{off}.
-@item -c, --connect=@var{dev}
-Connect @var{filename} to NBD device @var{dev} (Linux only).
-@item -d, --disconnect
-Disconnect the device @var{dev} (Linux only).
-@item -e, --shared=@var{num}
-Allow up to @var{num} clients to share the device (default
-@samp{1}). Safe for readers, but for now, consistency is not
-guaranteed between multiple writers.
-@item -t, --persistent
-Don't exit on the last connection.
-@item -x, --export-name=@var{name}
-Set the NBD volume export name (default of a zero-length string).
-@item -D, --description=@var{description}
-Set the NBD volume export description, as a human-readable
-string.
-@item -L, --list
-Connect as a client and list all details about the exports exposed by
-a remote NBD server.  This enables list mode, and is incompatible
-with options that change behavior related to a specific export (such as
-@option{--export-name}, @option{--offset}, ...).
-@item --tls-creds=ID
-Enable mandatory TLS encryption for the server by setting the ID
-of the TLS credentials object previously created with the --object
-option; or provide the credentials needed for connecting as a client
-in list mode.
-@item --fork
-Fork off the server process and exit the parent once the server is running.
-@item --pid-file=PATH
-Store the server's process ID in the given file.
-@item --tls-authz=ID
-Specify the ID of a qauthz object previously created with the
---object option. This will be used to authorize connecting users
-against their x509 distinguished name.
-@item -v, --verbose
-Display extra debugging information.
-@item -h, --help
-Display this help and exit.
-@item -V, --version
-Display version information and exit.
-@item -T, --trace [[enable=]@var{pattern}][,events=@var{file}][,file=@var{file}]
-@findex --trace
-@include qemu-option-trace.texi
-@end table
-
-@c man end
-
-@c man begin EXAMPLES
-Start a server listening on port 10809 that exposes only the
-guest-visible contents of a qcow2 file, with no TLS encryption, and
-with the default export name (an empty string). The command is
-one-shot, and will block until the first successful client
-disconnects:
-
-@example
-qemu-nbd -f qcow2 file.qcow2
-@end example
-
-Start a long-running server listening with encryption on port 10810,
-and whitelist clients with a specific X.509 certificate to connect to
-a 1 megabyte subset of a raw file, using the export name 'subset':
-
-@example
-qemu-nbd \
-  --object tls-creds-x509,id=tls0,endpoint=server,dir=/path/to/qemutls \
-  --object 'authz-simple,id=auth0,identity=CN=laptop.example.com,,\
-            O=Example Org,,L=London,,ST=London,,C=GB' \
-  --tls-creds tls0 --tls-authz auth0 \
-  -t -x subset -p 10810 \
-  --image-opts driver=raw,offset=1M,size=1M,file.driver=file,file.filename=file.raw
-@end example
-
-Serve a read-only copy of just the first MBR partition of a guest
-image over a Unix socket with as many as 5 simultaneous readers, with
-a persistent process forked as a daemon:
-
-@example
-qemu-nbd --fork --persistent --shared=5 --socket=/path/to/sock \
-  --partition=1 --read-only --format=qcow2 file.qcow2
-@end example
-
-Expose the guest-visible contents of a qcow2 file via a block device
-/dev/nbd0 (and possibly creating /dev/nbd0p1 and friends for
-partitions found within), then disconnect the device when done.
-Access to bind qemu-nbd to an /dev/nbd device generally requires root
-privileges, and may also require the execution of @code{modprobe nbd}
-to enable the kernel NBD client module.  @emph{CAUTION}: Do not use
-this method to mount filesystems from an untrusted guest image - a
-malicious guest may have prepared the image to attempt to trigger
-kernel bugs in partition probing or file system mounting.
-
-@example
-qemu-nbd -c /dev/nbd0 -f qcow2 file.qcow2
-qemu-nbd -d /dev/nbd0
-@end example
-
-Query a remote server to see details about what export(s) it is
-serving on port 10809, and authenticating via PSK:
-
-@example
-qemu-nbd \
-  --object tls-creds-psk,id=tls0,dir=/tmp/keys,username=eblake,endpoint=client \
-  --tls-creds tls0 -L -b remote.example.com
-@end example
-
-@c man end
-
-@ignore
-
-@setfilename qemu-nbd
-@settitle QEMU Disk Network Block Device Server
-
-@c man begin AUTHOR
-Copyright (C) 2006 Anthony Liguori <anthony@codemonkey.ws>.
-This is free software; see the source for copying conditions.  There is NO
-warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-@c man end
-
-@c man begin SEEALSO
-qemu(1), qemu-img(1)
-@c man end
-
-@end ignore
diff --git a/qemu-option-trace.texi b/qemu-option-trace.texi
index 7d1b7f05c54..162f1528d21 100644
--- a/qemu-option-trace.texi
+++ b/qemu-option-trace.texi
@@ -1,3 +1,7 @@
+@c The contents of this file must be kept in sync with qemu-option-trace.rst.inc
+@c until all the users of the texi file have been converted to rst and
+@c the texi file can be removed.
+
 Specify tracing options.
 
 @table @option
-- 
2.20.1


