Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BA56FC11E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 10:02:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwIGv-00006b-NN; Tue, 09 May 2023 04:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwIGq-0008Vb-9w
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:00:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwIGl-0008V2-Sp
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683619223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8J1smEZRajAo4vqV0gg5iCIKX8ypimPHm3kU32NwINs=;
 b=ENk4yQoLgoXhtMxXzMAgMKY9wxjjS89KoGHEf92eG8Y1Z42zez4ohQb0X9o0nxwAsBDspX
 w8X5ndb4vchg10vBDlK7s/+if8j7cUCBNDinMxTBQwZuAPWIAGUQ8Jk1gBulDqNBS9PeBy
 WIjxMh0h4Qz9E3PC8WNNxrpSJ5bOTiY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-WsKAk2jdOqyhQe6IYYujLg-1; Tue, 09 May 2023 04:00:22 -0400
X-MC-Unique: WsKAk2jdOqyhQe6IYYujLg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B983E87DC05;
 Tue,  9 May 2023 08:00:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CABFEC15BA0;
 Tue,  9 May 2023 08:00:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4224821F1646; Tue,  9 May 2023 10:00:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Juan Quintela <quintela@redhat.com>
Subject: [PULL 16/17] qga/qapi-schema: Reformat doc comments to conform to
 current conventions
Date: Tue,  9 May 2023 10:00:10 +0200
Message-Id: <20230509080011.3231661-17-armbru@redhat.com>
In-Reply-To: <20230509080011.3231661-1-armbru@redhat.com>
References: <20230509080011.3231661-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Change

    # @name: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
    #        do eiusmod tempor incididunt ut labore et dolore magna aliqua.

to

    # @name: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
    #     do eiusmod tempor incididunt ut labore et dolore magna aliqua.

See recent commit "qapi: Relax doc string @name: description
indentation rules" for rationale.

Reflow paragraphs to 70 columns width, and consistently use two spaces
to separate sentences.

To check the generated documentation does not change, I compared the
generated HTML before and after this commit with "wdiff -3".  Finds no
differences.  Comparing with diff is not useful, as the reflown
paragraphs are visible there.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230428105429.1687850-17-armbru@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 qga/qapi-schema.json | 668 +++++++++++++++++++++++++------------------
 1 file changed, 382 insertions(+), 286 deletions(-)

diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 5a75e81be2..42fb046eb7 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -4,10 +4,10 @@
 ##
 # = General note concerning the use of guest agent interfaces
 #
-# "unsupported" is a higher-level error than the errors that individual
-# commands might document. The caller should always be prepared to receive
-# QERR_UNSUPPORTED, even if the given command doesn't specify it, or doesn't
-# document any failure mode at all.
+# "unsupported" is a higher-level error than the errors that
+# individual commands might document.  The caller should always be
+# prepared to receive QERR_UNSUPPORTED, even if the given command
+# doesn't specify it, or doesn't document any failure mode at all.
 ##
 
 ##
@@ -38,28 +38,27 @@
 ##
 # @guest-sync-delimited:
 #
-# Echo back a unique integer value, and prepend to response a
-# leading sentinel byte (0xFF) the client can check scan for.
+# Echo back a unique integer value, and prepend to response a leading
+# sentinel byte (0xFF) the client can check scan for.
 #
-# This is used by clients talking to the guest agent over the
-# wire to ensure the stream is in sync and doesn't contain stale
-# data from previous client. It must be issued upon initial
-# connection, and after any client-side timeouts (including
-# timeouts on receiving a response to this command).
+# This is used by clients talking to the guest agent over the wire to
+# ensure the stream is in sync and doesn't contain stale data from
+# previous client.  It must be issued upon initial connection, and
+# after any client-side timeouts (including timeouts on receiving a
+# response to this command).
 #
 # After issuing this request, all guest agent responses should be
-# ignored until the response containing the unique integer value
-# the client passed in is returned. Receival of the 0xFF sentinel
-# byte must be handled as an indication that the client's
-# lexer/tokenizer/parser state should be flushed/reset in
-# preparation for reliably receiving the subsequent response. As
-# an optimization, clients may opt to ignore all data until a
-# sentinel value is receiving to avoid unnecessary processing of
-# stale data.
+# ignored until the response containing the unique integer value the
+# client passed in is returned.  Receival of the 0xFF sentinel byte
+# must be handled as an indication that the client's
+# lexer/tokenizer/parser state should be flushed/reset in preparation
+# for reliably receiving the subsequent response.  As an optimization,
+# clients may opt to ignore all data until a sentinel value is
+# receiving to avoid unnecessary processing of stale data.
 #
-# Similarly, clients should also precede this *request*
-# with a 0xFF byte to make sure the guest agent flushes any
-# partially read JSON data from a previous client connection.
+# Similarly, clients should also precede this *request* with a 0xFF
+# byte to make sure the guest agent flushes any partially read JSON
+# data from a previous client connection.
 #
 # @id: randomly generated 64-bit integer
 #
@@ -76,28 +75,27 @@
 #
 # Echo back a unique integer value
 #
-# This is used by clients talking to the guest agent over the
-# wire to ensure the stream is in sync and doesn't contain stale
-# data from previous client. All guest agent responses should be
-# ignored until the provided unique integer value is returned,
-# and it is up to the client to handle stale whole or
-# partially-delivered JSON text in such a way that this response
-# can be obtained.
+# This is used by clients talking to the guest agent over the wire to
+# ensure the stream is in sync and doesn't contain stale data from
+# previous client.  All guest agent responses should be ignored until
+# the provided unique integer value is returned, and it is up to the
+# client to handle stale whole or partially-delivered JSON text in
+# such a way that this response can be obtained.
 #
-# In cases where a partial stale response was previously
-# received by the client, this cannot always be done reliably.
-# One particular scenario being if qemu-ga responses are fed
-# character-by-character into a JSON parser. In these situations,
-# using guest-sync-delimited may be optimal.
+# In cases where a partial stale response was previously received by
+# the client, this cannot always be done reliably.  One particular
+# scenario being if qemu-ga responses are fed character-by-character
+# into a JSON parser.  In these situations, using guest-sync-delimited
+# may be optimal.
 #
-# For clients that fetch responses line by line and convert them
-# to JSON objects, guest-sync should be sufficient, but note that
-# in cases where the channel is dirty some attempts at parsing the
+# For clients that fetch responses line by line and convert them to
+# JSON objects, guest-sync should be sufficient, but note that in
+# cases where the channel is dirty some attempts at parsing the
 # response may result in a parser error.
 #
-# Such clients should also precede this command
-# with a 0xFF byte to make sure the guest agent flushes any
-# partially read JSON data from a previous session.
+# Such clients should also precede this command with a 0xFF byte to
+# make sure the guest agent flushes any partially read JSON data from
+# a previous session.
 #
 # @id: randomly generated 64-bit integer
 #
@@ -121,8 +119,8 @@
 ##
 # @guest-get-time:
 #
-# Get the information about guest's System Time relative to
-# the Epoch of 1970-01-01 in UTC.
+# Get the information about guest's System Time relative to the Epoch
+# of 1970-01-01 in UTC.
 #
 # Returns: Time in nanoseconds.
 #
@@ -136,23 +134,21 @@
 #
 # Set guest time.
 #
-# When a guest is paused or migrated to a file then loaded
-# from that file, the guest OS has no idea that there
-# was a big gap in the time. Depending on how long the
-# gap was, NTP might not be able to resynchronize the
-# guest.
+# When a guest is paused or migrated to a file then loaded from that
+# file, the guest OS has no idea that there was a big gap in the time.
+# Depending on how long the gap was, NTP might not be able to
+# resynchronize the guest.
 #
-# This command tries to set guest's System Time to the
-# given value, then sets the Hardware Clock (RTC) to the
-# current System Time. This will make it easier for a guest
-# to resynchronize without waiting for NTP. If no @time is
-# specified, then the time to set is read from RTC. However,
-# this may not be supported on all platforms (i.e. Windows).
-# If that's the case users are advised to always pass a
+# This command tries to set guest's System Time to the given value,
+# then sets the Hardware Clock (RTC) to the current System Time.  This
+# will make it easier for a guest to resynchronize without waiting for
+# NTP. If no @time is specified, then the time to set is read from
+# RTC. However, this may not be supported on all platforms (i.e.
+# Windows). If that's the case users are advised to always pass a
 # value.
 #
-# @time: time of nanoseconds, relative to the Epoch
-#        of 1970-01-01 in UTC.
+# @time: time of nanoseconds, relative to the Epoch of 1970-01-01 in
+#     UTC.
 #
 # Returns: Nothing on success.
 #
@@ -171,7 +167,7 @@
 # @enabled: whether command is currently enabled by guest admin
 #
 # @success-response: whether command returns a response on success
-#                    (since 1.7)
+#     (since 1.7)
 #
 # Since: 1.1.0
 ##
@@ -207,15 +203,15 @@
 ##
 # @guest-shutdown:
 #
-# Initiate guest-activated shutdown. Note: this is an asynchronous
+# Initiate guest-activated shutdown.  Note: this is an asynchronous
 # shutdown request, with no guarantee of successful shutdown.
 #
 # @mode: "halt", "powerdown" (default), or "reboot"
 #
-# This command does NOT return a response on success. Success condition
-# is indicated by the VM exiting with a zero exit status or, when
-# running with --no-shutdown, by issuing the query-status QMP command
-# to confirm the VM status is "shutdown".
+# This command does NOT return a response on success.  Success
+# condition is indicated by the VM exiting with a zero exit status or,
+# when running with --no-shutdown, by issuing the query-status QMP
+# command to confirm the VM status is "shutdown".
 #
 # Since: 0.15.0
 ##
@@ -259,7 +255,7 @@
 # Result of guest agent file-read operation
 #
 # @count: number of bytes read (note: count is *before*
-#         base64-encoding is applied)
+#     base64-encoding is applied)
 #
 # @buf-b64: base64-encoded bytes read
 #
@@ -273,13 +269,14 @@
 ##
 # @guest-file-read:
 #
-# Read from an open file in the guest. Data will be base64-encoded.
+# Read from an open file in the guest.  Data will be base64-encoded.
 # As this command is just for limited, ad-hoc debugging, such as log
 # file access, the number of bytes to read is limited to 48 MB.
 #
 # @handle: filehandle returned by guest-file-open
 #
-# @count: maximum number of bytes to read (default is 4KB, maximum is 48MB)
+# @count: maximum number of bytes to read (default is 4KB, maximum is
+#     48MB)
 #
 # Returns: @GuestFileRead on success.
 #
@@ -295,7 +292,7 @@
 # Result of guest agent file-write operation
 #
 # @count: number of bytes written (note: count is actual bytes
-#         written, after base64-decoding of provided buffer)
+#     written, after base64-decoding of provided buffer)
 #
 # @eof: whether EOF was encountered during write operation.
 #
@@ -313,8 +310,8 @@
 #
 # @buf-b64: base64-encoded string representing data to be written
 #
-# @count: bytes to write (actual bytes, after base64-decode),
-#         default is all content in buf-b64 buffer after base64 decoding
+# @count: bytes to write (actual bytes, after base64-decode), default
+#     is all content in buf-b64 buffer after base64 decoding
 #
 # Returns: @GuestFileWrite on success.
 #
@@ -345,7 +342,9 @@
 # Symbolic names for use in @guest-file-seek
 #
 # @set: Set to the specified offset (same effect as 'whence':0)
+#
 # @cur: Add offset to the current location (same effect as 'whence':1)
+#
 # @end: Add offset to the end of the file (same effect as 'whence':2)
 #
 # Since: 2.6
@@ -358,8 +357,9 @@
 # Controls the meaning of offset to @guest-file-seek.
 #
 # @value: Integral value (0 for set, 1 for cur, 2 for end), available
-#         for historical reasons, and might differ from the host's or
-#         guest's SEEK_* values (since: 0.15)
+#     for historical reasons, and might differ from the host's or
+#     guest's SEEK_* values (since: 0.15)
+#
 # @name: Symbolic name, and preferred interface
 #
 # Since: 2.6
@@ -371,7 +371,7 @@
 # @guest-file-seek:
 #
 # Seek to a position in the file, as with fseek(), and return the
-# current file position afterward. Also encapsulates ftell()'s
+# current file position afterward.  Also encapsulates ftell()'s
 # functionality, with offset=0 and whence=1.
 #
 # @handle: filehandle returned by guest-file-open
@@ -422,10 +422,11 @@
 #
 # Get guest fsfreeze state.
 #
-# Returns: GuestFsfreezeStatus ("thawed", "frozen", etc., as defined below)
+# Returns: GuestFsfreezeStatus ("thawed", "frozen", etc., as defined
+#     below)
 #
-# Note: This may fail to properly report the current state as a result of
-#       some other guest processes having issued an fs freeze/thaw.
+# Note: This may fail to properly report the current state as a result
+#     of some other guest processes having issued an fs freeze/thaw.
 #
 # Since: 0.15.0
 ##
@@ -435,18 +436,18 @@
 ##
 # @guest-fsfreeze-freeze:
 #
-# Sync and freeze all freezable, local guest filesystems. If this
+# Sync and freeze all freezable, local guest filesystems.  If this
 # command succeeded, you may call @guest-fsfreeze-thaw later to
 # unfreeze.
 #
 # Note: On Windows, the command is implemented with the help of a
-#       Volume Shadow-copy Service DLL helper. The frozen state is limited
-#       for up to 10 seconds by VSS.
+#     Volume Shadow-copy Service DLL helper.  The frozen state is
+#     limited for up to 10 seconds by VSS.
 #
-# Returns: Number of file systems currently frozen. On error, all filesystems
-#          will be thawed. If no filesystems are frozen as a result of this call,
-#          then @guest-fsfreeze-status will remain "thawed" and calling
-#          @guest-fsfreeze-thaw is not necessary.
+# Returns: Number of file systems currently frozen.  On error, all
+#     filesystems will be thawed.  If no filesystems are frozen as a
+#     result of this call, then @guest-fsfreeze-status will remain
+#     "thawed" and calling @guest-fsfreeze-thaw is not necessary.
 #
 # Since: 0.15.0
 ##
@@ -456,15 +457,15 @@
 ##
 # @guest-fsfreeze-freeze-list:
 #
-# Sync and freeze specified guest filesystems.
-# See also @guest-fsfreeze-freeze.
+# Sync and freeze specified guest filesystems.  See also
+# @guest-fsfreeze-freeze.
 #
 # @mountpoints: an array of mountpoints of filesystems to be frozen.
-#               If omitted, every mounted filesystem is frozen.
-#               Invalid mount points are ignored.
+#     If omitted, every mounted filesystem is frozen.  Invalid mount
+#     points are ignored.
 #
-# Returns: Number of file systems currently frozen. On error, all filesystems
-#          will be thawed.
+# Returns: Number of file systems currently frozen.  On error, all
+#     filesystems will be thawed.
 #
 # Since: 2.2
 ##
@@ -480,10 +481,9 @@
 # Returns: Number of file systems thawed by this call
 #
 # Note: if return value does not match the previous call to
-#       guest-fsfreeze-freeze, this likely means some freezable
-#       filesystems were unfrozen before this call, and that the
-#       filesystem state may have changed before issuing this
-#       command.
+#     guest-fsfreeze-freeze, this likely means some freezable
+#     filesystems were unfrozen before this call, and that the
+#     filesystem state may have changed before issuing this command.
 #
 # Since: 0.15.0
 ##
@@ -494,8 +494,11 @@
 # @GuestFilesystemTrimResult:
 #
 # @path: path that was trimmed
+#
 # @error: an error message when trim failed
+#
 # @trimmed: bytes trimmed for this path
+#
 # @minimum: reported effective minimum for this path
 #
 # Since: 2.4
@@ -519,15 +522,16 @@
 #
 # Discard (or "trim") blocks which are not in use by the filesystem.
 #
-# @minimum: Minimum contiguous free range to discard, in bytes. Free ranges
-#           smaller than this may be ignored (this is a hint and the guest
-#           may not respect it).  By increasing this value, the fstrim
-#           operation will complete more quickly for filesystems with badly
-#           fragmented free space, although not all blocks will be discarded.
-#           The default value is zero, meaning "discard every free block".
+# @minimum: Minimum contiguous free range to discard, in bytes.  Free
+#     ranges smaller than this may be ignored (this is a hint and the
+#     guest may not respect it).  By increasing this value, the fstrim
+#     operation will complete more quickly for filesystems with badly
+#     fragmented free space, although not all blocks will be
+#     discarded.  The default value is zero, meaning "discard every
+#     free block".
 #
-# Returns: A @GuestFilesystemTrimResponse which contains the
-#          status of all trimmed paths. (since 2.4)
+# Returns: A @GuestFilesystemTrimResponse which contains the status of
+#     all trimmed paths.  (since 2.4)
 #
 # Since: 1.2
 ##
@@ -540,25 +544,26 @@
 #
 # Suspend guest to disk.
 #
-# This command attempts to suspend the guest using three strategies, in this
-# order:
+# This command attempts to suspend the guest using three strategies,
+# in this order:
 #
 # - systemd hibernate
 # - pm-utils (via pm-hibernate)
 # - manual write into sysfs
 #
-# This command does NOT return a response on success. There is a high chance
-# the command succeeded if the VM exits with a zero exit status or, when
-# running with --no-shutdown, by issuing the query-status QMP command to
-# to confirm the VM status is "shutdown". However, the VM could also exit
-# (or set its status to "shutdown") due to other reasons.
+# This command does NOT return a response on success.  There is a high
+# chance the command succeeded if the VM exits with a zero exit status
+# or, when running with --no-shutdown, by issuing the query-status QMP
+# command to to confirm the VM status is "shutdown". However, the VM
+# could also exit (or set its status to "shutdown") due to other
+# reasons.
 #
 # The following errors may be returned:
 #
 # - If suspend to disk is not supported, Unsupported
 #
-# Notes: It's strongly recommended to issue the guest-sync command before
-#        sending commands when the guest resumes
+# Notes: It's strongly recommended to issue the guest-sync command
+#     before sending commands when the guest resumes
 #
 # Since: 1.1
 ##
@@ -569,21 +574,22 @@
 #
 # Suspend guest to ram.
 #
-# This command attempts to suspend the guest using three strategies, in this
-# order:
+# This command attempts to suspend the guest using three strategies,
+# in this order:
 #
-# - systemd suspend
-# - pm-utils (via pm-suspend)
+# - systemd hibernate
+# - pm-utils (via pm-hibernate)
 # - manual write into sysfs
 #
 # IMPORTANT: guest-suspend-ram requires working wakeup support in
 # QEMU. You should check QMP command query-current-machine returns
-# wakeup-suspend-support: true before issuing this command. Failure in
-# doing so can result in a suspended guest that QEMU will not be able to
-# awaken, forcing the user to power cycle the guest to bring it back.
+# wakeup-suspend-support: true before issuing this command.  Failure
+# in doing so can result in a suspended guest that QEMU will not be
+# able to awaken, forcing the user to power cycle the guest to bring
+# it back.
 #
-# This command does NOT return a response on success. There are two options
-# to check for success:
+# This command does NOT return a response on success.  There are two
+# options to check for success:
 #
 # 1. Wait for the SUSPEND QMP event from QEMU
 # 2. Issue the query-status QMP command to confirm the VM status is
@@ -593,8 +599,8 @@
 #
 # - If suspend to ram is not supported, Unsupported
 #
-# Notes: It's strongly recommended to issue the guest-sync command before
-#        sending commands when the guest resumes
+# Notes: It's strongly recommended to issue the guest-sync command
+#     before sending commands when the guest resumes
 #
 # Since: 1.1
 ##
@@ -605,19 +611,21 @@
 #
 # Save guest state to disk and suspend to ram.
 #
-# This command attempts to suspend the guest by executing, in this order:
+# This command attempts to suspend the guest by executing, in this
+# order:
 #
 # - systemd hybrid-sleep
 # - pm-utils (via pm-suspend-hybrid)
 #
 # IMPORTANT: guest-suspend-hybrid requires working wakeup support in
 # QEMU. You should check QMP command query-current-machine returns
-# wakeup-suspend-support: true before issuing this command. Failure in
-# doing so can result in a suspended guest that QEMU will not be able to
-# awaken, forcing the user to power cycle the guest to bring it back.
+# wakeup-suspend-support: true before issuing this command.  Failure
+# in doing so can result in a suspended guest that QEMU will not be
+# able to awaken, forcing the user to power cycle the guest to bring
+# it back.
 #
-# This command does NOT return a response on success. There are two options
-# to check for success:
+# This command does NOT return a response on success.  There are two
+# options to check for success:
 #
 # 1. Wait for the SUSPEND QMP event from QEMU
 # 2. Issue the query-status QMP command to confirm the VM status is
@@ -627,8 +635,8 @@
 #
 # - If hybrid suspend is not supported, Unsupported
 #
-# Notes: It's strongly recommended to issue the guest-sync command before
-#        sending commands when the guest resumes
+# Notes: It's strongly recommended to issue the guest-sync command
+#     before sending commands when the guest resumes
 #
 # Since: 1.1
 ##
@@ -705,8 +713,8 @@
 #
 # @ip-addresses: List of addresses assigned to @name
 #
-# @statistics: various statistic counters related to @name
-#              (since 2.11)
+# @statistics: various statistic counters related to @name (since
+#     2.11)
 #
 # Since: 1.1
 ##
@@ -719,8 +727,7 @@
 ##
 # @guest-network-get-interfaces:
 #
-# Get list of guest IP addresses, MAC addresses
-# and netmasks.
+# Get list of guest IP addresses, MAC addresses and netmasks.
 #
 # Returns: List of GuestNetworkInterface on success.
 #
@@ -736,10 +743,10 @@
 #
 # @online: Whether the VCPU is enabled.
 #
-# @can-offline: Whether offlining the VCPU is possible. This member
-#               is always filled in by the guest agent when the structure is
-#               returned, and always ignored on input (hence it can be omitted
-#               then).
+# @can-offline: Whether offlining the VCPU is possible.  This member
+#     is always filled in by the guest agent when the structure is
+#     returned, and always ignored on input (hence it can be omitted
+#     then).
 #
 # Since: 1.5
 ##
@@ -755,8 +762,8 @@
 #
 # This is a read-only operation.
 #
-# Returns: The list of all VCPUs the guest knows about. Each VCPU is put on the
-#          list exactly once, but their order is unspecified.
+# Returns: The list of all VCPUs the guest knows about.  Each VCPU is
+#     put on the list exactly once, but their order is unspecified.
 #
 # Since: 1.5
 ##
@@ -766,36 +773,36 @@
 ##
 # @guest-set-vcpus:
 #
-# Attempt to reconfigure (currently: enable/disable) logical processors inside
-# the guest.
+# Attempt to reconfigure (currently: enable/disable) logical
+# processors inside the guest.
 #
-# The input list is processed node by node in order. In each node @logical-id
-# is used to look up the guest VCPU, for which @online specifies the requested
-# state. The set of distinct @logical-id's is only required to be a subset of
-# the guest-supported identifiers. There's no restriction on list length or on
-# repeating the same @logical-id (with possibly different @online field).
-# Preferably the input list should describe a modified subset of
-# @guest-get-vcpus' return value.
+# The input list is processed node by node in order.  In each node
+# @logical-id is used to look up the guest VCPU, for which @online
+# specifies the requested state.  The set of distinct @logical-id's is
+# only required to be a subset of the guest-supported identifiers.
+# There's no restriction on list length or on repeating the same
+# @logical-id (with possibly different @online field). Preferably the
+# input list should describe a modified subset of @guest-get-vcpus'
+# return value.
 #
-# Returns: The length of the initial sublist that has been successfully
-#          processed. The guest agent maximizes this value. Possible cases:
+# Returns: The length of the initial sublist that has been
+#     successfully processed.  The guest agent maximizes this value.
+#     Possible cases:
 #
-#          - 0:
-#            if the @vcpus list was empty on input. Guest state
-#            has not been changed. Otherwise,
-#          - Error:
-#            processing the first node of @vcpus failed for the
-#            reason returned. Guest state has not been changed.
-#            Otherwise,
-#          - < length(@vcpus):
-#            more than zero initial nodes have been processed,
-#            but not the entire @vcpus list. Guest state has
-#            changed accordingly. To retrieve the error
-#            (assuming it persists), repeat the call with the
-#            successfully processed initial sublist removed.
-#            Otherwise,
-#          - length(@vcpus):
-#            call successful.
+#     - 0:
+#       if the @vcpus list was empty on input.  Guest state has not
+#       been changed.  Otherwise,
+#     - Error:
+#       processing the first node of @vcpus failed for the reason
+#       returned.  Guest state has not been changed.  Otherwise,
+#     - < length(@vcpus):
+#       more than zero initial nodes have been processed, but not the
+#       entire @vcpus list.  Guest state has changed accordingly.  To
+#       retrieve the error (assuming it persists), repeat the call
+#       with the successfully processed initial sublist removed.
+#       Otherwise,
+#     - length(@vcpus):
+#       call successful.
 #
 # Since: 1.5
 ##
@@ -809,24 +816,43 @@
 # An enumeration of bus type of disks
 #
 # @ide: IDE disks
+#
 # @fdc: floppy disks
+#
 # @scsi: SCSI disks
+#
 # @virtio: virtio disks
+#
 # @xen: Xen disks
+#
 # @usb: USB disks
+#
 # @uml: UML disks
+#
 # @sata: SATA disks
+#
 # @sd: SD cards
+#
 # @unknown: Unknown bus type
+#
 # @ieee1394: Win IEEE 1394 bus type
+#
 # @ssa: Win SSA bus type
+#
 # @fibre: Win fiber channel bus type
+#
 # @raid: Win RAID bus type
+#
 # @iscsi: Win iScsi bus type
+#
 # @sas: Win serial-attaches SCSI bus type
+#
 # @mmc: Win multimedia card (MMC) bus type
+#
 # @virtual: Win virtual bus type
+#
 # @file-backed-virtual: Win file-backed bus type
+#
 # @nvme: NVMe disks (since 7.1)
 #
 # Since: 2.2; 'Unknown' and all entries below since 2.4
@@ -841,8 +867,11 @@
 # @GuestPCIAddress:
 #
 # @domain: domain id
+#
 # @bus: bus id
+#
 # @slot: slot id
+#
 # @function: function id
 #
 # Since: 2.2
@@ -855,8 +884,11 @@
 # @GuestCCWAddress:
 #
 # @cssid: channel subsystem image id
+#
 # @ssid: subchannel set id
+#
 # @subchno: subchannel number
+#
 # @devno: device number
 #
 # Since: 6.0
@@ -870,13 +902,21 @@
 ##
 # @GuestDiskAddress:
 #
-# @pci-controller: controller's PCI address (fields are set to -1 if invalid)
+# @pci-controller: controller's PCI address (fields are set to -1 if
+#     invalid)
+#
 # @bus-type: bus type
+#
 # @bus: bus id
+#
 # @target: target id
+#
 # @unit: unit id
+#
 # @serial: serial number (since: 3.1)
+#
 # @dev: device node (POSIX) or device UNC (Windows) (since: 3.1)
+#
 # @ccw-address: CCW address on s390x (since: 6.0)
 #
 # Since: 2.2
@@ -891,8 +931,8 @@
 ##
 # @GuestNVMeSmart:
 #
-# NVMe smart informations, based on NVMe specification,
-# section <SMART / Health Information (Log Identifier 02h)>
+# NVMe smart informations, based on NVMe specification, section
+# <SMART / Health Information (Log Identifier 02h)>
 #
 # Since: 7.1
 ##
@@ -941,13 +981,18 @@
 # @GuestDiskInfo:
 #
 # @name: device node (Linux) or device UNC (Windows)
+#
 # @partition: whether this is a partition or disk
-# @dependencies: list of device dependencies; e.g. for LVs of the LVM this will
-#                hold the list of PVs, for LUKS encrypted volume this will
-#                contain the disk where the volume is placed.     (Linux)
+#
+# @dependencies: list of device dependencies; e.g. for LVs of the LVM
+#     this will hold the list of PVs, for LUKS encrypted volume this
+#     will contain the disk where the volume is placed.  (Linux)
+#
 # @address: disk address information (only for non-virtual devices)
-# @alias: optional alias assigned to the disk, on Linux this is a name assigned
-#         by device mapper
+#
+# @alias: optional alias assigned to the disk, on Linux this is a name
+#     assigned by device mapper
+#
 # @smart: disk smart information (Since 7.1)
 #
 # Since: 5.2
@@ -960,10 +1005,10 @@
 ##
 # @guest-get-disks:
 #
-# Returns: The list of disks in the guest. For Windows these are only the
-#          physical disks. On Linux these are all root block devices of
-#          non-zero size including e.g. removable devices, loop devices,
-#          NBD, etc.
+# Returns: The list of disks in the guest.  For Windows these are only
+#     the physical disks.  On Linux these are all root block devices
+#     of non-zero size including e.g. removable devices, loop devices,
+#     NBD, etc.
 #
 # Since: 5.2
 ##
@@ -974,12 +1019,17 @@
 # @GuestFilesystemInfo:
 #
 # @name: disk name
+#
 # @mountpoint: mount point path
+#
 # @type: file system type string
+#
 # @used-bytes: file system used bytes (since 3.0)
+#
 # @total-bytes: non-root file system total bytes (since 3.0)
-# @disk: an array of disk hardware information that the volume lies on,
-#        which may be empty if the disk type is not supported
+#
+# @disk: an array of disk hardware information that the volume lies
+#     on, which may be empty if the disk type is not supported
 #
 # Since: 2.2
 ##
@@ -992,9 +1042,9 @@
 # @guest-get-fsinfo:
 #
 # Returns: The list of filesystems information mounted in the guest.
-#          The returned mountpoints may be specified to
-#          @guest-fsfreeze-freeze-list.
-#          Network filesystems (such as CIFS and NFS) are not listed.
+#     The returned mountpoints may be specified to
+#     @guest-fsfreeze-freeze-list.  Network filesystems (such as CIFS
+#     and NFS) are not listed.
 #
 # Since: 2.2
 ##
@@ -1005,21 +1055,23 @@
 # @guest-set-user-password:
 #
 # @username: the user account whose password to change
+#
 # @password: the new password entry string, base64 encoded
+#
 # @crypted: true if password is already crypt()d, false if raw
 #
-# If the @crypted flag is true, it is the caller's responsibility
-# to ensure the correct crypt() encryption scheme is used. This
-# command does not attempt to interpret or report on the encryption
-# scheme. Refer to the documentation of the guest operating system
-# in question to determine what is supported.
+# If the @crypted flag is true, it is the caller's responsibility to
+# ensure the correct crypt() encryption scheme is used.  This command
+# does not attempt to interpret or report on the encryption scheme.
+# Refer to the documentation of the guest operating system in question
+# to determine what is supported.
 #
-# Not all guest operating systems will support use of the
-# @crypted flag, as they may require the clear-text password
+# Not all guest operating systems will support use of the @crypted
+# flag, as they may require the clear-text password
 #
 # The @password parameter must always be base64 encoded before
-# transmission, even if already crypt()d, to ensure it is 8-bit
-# safe when passed as JSON.
+# transmission, even if already crypt()d, to ensure it is 8-bit safe
+# when passed as JSON.
 #
 # Returns: Nothing on success.
 #
@@ -1031,14 +1083,15 @@
 ##
 # @GuestMemoryBlock:
 #
-# @phys-index: Arbitrary guest-specific unique identifier of the MEMORY BLOCK.
+# @phys-index: Arbitrary guest-specific unique identifier of the
+#     MEMORY BLOCK.
 #
 # @online: Whether the MEMORY BLOCK is enabled in guest.
 #
-# @can-offline: Whether offlining the MEMORY BLOCK is possible.
-#               This member is always filled in by the guest agent when the
-#               structure is returned, and always ignored on input (hence it
-#               can be omitted then).
+# @can-offline: Whether offlining the MEMORY BLOCK is possible.  This
+#     member is always filled in by the guest agent when the structure
+#     is returned, and always ignored on input (hence it can be
+#     omitted then).
 #
 # Since: 2.3
 ##
@@ -1054,9 +1107,9 @@
 #
 # This is a read-only operation.
 #
-# Returns: The list of all memory blocks the guest knows about.
-#          Each memory block is put on the list exactly once, but their order
-#          is unspecified.
+# Returns: The list of all memory blocks the guest knows about.  Each
+#     memory block is put on the list exactly once, but their order is
+#     unspecified.
 #
 # Since: 2.3
 ##
@@ -1068,12 +1121,17 @@
 #
 # An enumeration of memory block operation result.
 #
-# @success: the operation of online/offline memory block is successful.
-# @not-found: can't find the corresponding memoryXXX directory in sysfs.
+# @success: the operation of online/offline memory block is
+#     successful.
+#
+# @not-found: can't find the corresponding memoryXXX directory in
+#     sysfs.
+#
 # @operation-not-supported: for some old kernels, it does not support
-#                           online or offline memory block.
-# @operation-failed: the operation of online/offline memory block fails,
-#                    because of some errors happen.
+#     online or offline memory block.
+#
+# @operation-failed: the operation of online/offline memory block
+#     fails, because of some errors happen.
 #
 # Since: 2.3
 ##
@@ -1088,10 +1146,9 @@
 #
 # @response: the result of memory block operation.
 #
-# @error-code: the error number.
-#              When memory block operation fails, we assign the value of
-#              'errno' to this member, it indicates what goes wrong.
-#              When the operation succeeds, it will be omitted.
+# @error-code: the error number.  When memory block operation fails,
+#     we assign the value of 'errno' to this member, it indicates what
+#     goes wrong.  When the operation succeeds, it will be omitted.
 #
 # Since: 2.3
 ##
@@ -1103,24 +1160,25 @@
 ##
 # @guest-set-memory-blocks:
 #
-# Attempt to reconfigure (currently: enable/disable) state of memory blocks
-# inside the guest.
+# Attempt to reconfigure (currently: enable/disable) state of memory
+# blocks inside the guest.
 #
-# The input list is processed node by node in order. In each node @phys-index
-# is used to look up the guest MEMORY BLOCK, for which @online specifies the
-# requested state. The set of distinct @phys-index's is only required to be a
-# subset of the guest-supported identifiers. There's no restriction on list
-# length or on repeating the same @phys-index (with possibly different @online
-# field).
+# The input list is processed node by node in order.  In each node
+# @phys-index is used to look up the guest MEMORY BLOCK, for which
+# @online specifies the requested state.  The set of distinct
+# @phys-index's is only required to be a subset of the guest-supported
+# identifiers.  There's no restriction on list length or on repeating
+# the same @phys-index (with possibly different @online field).
 # Preferably the input list should describe a modified subset of
 # @guest-get-memory-blocks' return value.
 #
-# Returns: The operation results, it is a list of @GuestMemoryBlockResponse,
-#          which is corresponding to the input list.
+# Returns: The operation results, it is a list of
+#     @GuestMemoryBlockResponse, which is corresponding to the input
+#     list.
 #
-#          Note: it will return NULL if the @mem-blks list was empty on input,
-#          or there is an error, and in this case, guest state will not be
-#          changed.
+#     Note: it will return NULL if the @mem-blks list was empty on
+#     input, or there is an error, and in this case, guest state will
+#     not be changed.
 #
 # Since: 2.3
 ##
@@ -1131,9 +1189,9 @@
 ##
 # @GuestMemoryBlockInfo:
 #
-# @size: the size (in bytes) of the guest memory blocks,
-#        which are the minimal units of memory block online/offline
-#        operations (also called Logical Memory Hotplug).
+# @size: the size (in bytes) of the guest memory blocks, which are the
+#     minimal units of memory block online/offline operations (also
+#     called Logical Memory Hotplug).
 #
 # Since: 2.3
 ##
@@ -1156,17 +1214,23 @@
 # @GuestExecStatus:
 #
 # @exited: true if process has already terminated.
+#
 # @exitcode: process exit code if it was normally terminated.
-# @signal: signal number (linux) or unhandled exception code
-#          (windows) if the process was abnormally terminated.
+#
+# @signal: signal number (linux) or unhandled exception code (windows)
+#     if the process was abnormally terminated.
+#
 # @out-data: base64-encoded stdout of the process
-# @err-data: base64-encoded stderr of the process
-#            Note: @out-data and @err-data are present only
-#            if 'capture-output' was specified for 'guest-exec'
-# @out-truncated: true if stdout was not fully captured
-#                 due to size limitation.
-# @err-truncated: true if stderr was not fully captured
-#                 due to size limitation.
+#
+# @err-data: base64-encoded stderr of the process Note: @out-data and
+#     @err-data are present only if 'capture-output' was specified for
+#     'guest-exec'
+#
+# @out-truncated: true if stdout was not fully captured due to size
+#     limitation.
+#
+# @err-truncated: true if stderr was not fully captured due to size
+#     limitation.
 #
 # Since: 2.5
 ##
@@ -1177,8 +1241,9 @@
 ##
 # @guest-exec-status:
 #
-# Check status of process associated with PID retrieved via guest-exec.
-# Reap the process and associated metadata if it has exited.
+# Check status of process associated with PID retrieved via
+# guest-exec.  Reap the process and associated metadata if it has
+# exited.
 #
 # @pid: pid returned from guest-exec
 #
@@ -1240,11 +1305,15 @@
 # Execute a command in the guest
 #
 # @path: path or executable name to execute
+#
 # @arg: argument list to pass to executable
+#
 # @env: environment variables to pass to executable
+#
 # @input-data: data to be passed to process stdin (base64 encoded)
-# @capture-output: bool flag to enable capture of
-#                  stdout/stderr of running process. defaults to false.
+#
+# @capture-output: bool flag to enable capture of stdout/stderr of
+#     running process.  defaults to false.
 #
 # Returns: PID on success.
 #
@@ -1271,9 +1340,9 @@
 #
 # Return a name for the machine.
 #
-# The returned name is not necessarily a fully-qualified domain name, or even
-# present in DNS or some other name service at all. It need not even be unique
-# on your local network or site, but usually it is.
+# The returned name is not necessarily a fully-qualified domain name,
+# or even present in DNS or some other name service at all.  It need
+# not even be unique on your local network or site, but usually it is.
 #
 # Returns: the host name of the machine on success
 #
@@ -1287,10 +1356,13 @@
 # @GuestUser:
 #
 # @user: Username
+#
 # @domain: Logon domain (windows only)
-# @login-time: Time of login of this user on the computer. If multiple
-#              instances of the user are logged in, the earliest login time is
-#              reported. The value is in fractional seconds since epoch time.
+#
+# @login-time: Time of login of this user on the computer.  If
+#     multiple instances of the user are logged in, the earliest login
+#     time is reported.  The value is in fractional seconds since
+#     epoch time.
 #
 # Since: 2.10
 ##
@@ -1299,6 +1371,7 @@
 
 ##
 # @guest-get-users:
+#
 # Retrieves a list of currently active users on the VM.
 #
 # Returns: A unique list of users.
@@ -1311,10 +1384,11 @@
 ##
 # @GuestTimezone:
 #
-# @zone: Timezone name. These values may differ depending on guest/OS and
-#        should only be used for informational purposes.
-# @offset: Offset to UTC in seconds, negative numbers for time zones west of
-#          GMT, positive numbers for east
+# @zone: Timezone name.  These values may differ depending on guest/OS
+#     and should only be used for informational purposes.
+#
+# @offset: Offset to UTC in seconds, negative numbers for time zones
+#     west of GMT, positive numbers for east
 #
 # Since: 2.10
 ##
@@ -1337,45 +1411,56 @@
 # @GuestOSInfo:
 #
 # @kernel-release:
-# * POSIX: release field returned by uname(2)
-# * Windows: build number of the OS
+#     * POSIX: release field returned by uname(2)
+#     * Windows: build number of the OS
+#
 # @kernel-version:
-# * POSIX: version field returned by uname(2)
-# * Windows: version number of the OS
+#     * POSIX: version field returned by uname(2)
+#     * Windows: version number of the OS
+#
 # @machine:
-# * POSIX: machine field returned by uname(2)
-# * Windows: one of x86, x86_64, arm, ia64
+#     * POSIX: machine field returned by uname(2)
+#     * Windows: one of x86, x86_64, arm, ia64
+#
 # @id:
-# * POSIX: as defined by os-release(5)
-# * Windows: contains string "mswindows"
+#     * POSIX: as defined by os-release(5)
+#     * Windows: contains string "mswindows"
+#
 # @name:
-# * POSIX: as defined by os-release(5)
-# * Windows: contains string "Microsoft Windows"
+#     * POSIX: as defined by os-release(5)
+#     * Windows: contains string "Microsoft Windows"
+#
 # @pretty-name:
-# * POSIX: as defined by os-release(5)
-# * Windows: product name, e.g. "Microsoft Windows 10 Enterprise"
+#     * POSIX: as defined by os-release(5)
+#     * Windows: product name, e.g. "Microsoft Windows 10 Enterprise"
+#
 # @version:
-# * POSIX: as defined by os-release(5)
-# * Windows: long version string, e.g. "Microsoft Windows Server 2008"
+#     * POSIX: as defined by os-release(5)
+#     * Windows: long version string, e.g. "Microsoft Windows Server
+#       2008"
+#
 # @version-id:
-# * POSIX: as defined by os-release(5)
-# * Windows: short version identifier, e.g. "7" or "20012r2"
+#     * POSIX: as defined by os-release(5)
+#     * Windows: short version identifier, e.g. "7" or "20012r2"
+#
 # @variant:
-# * POSIX: as defined by os-release(5)
-# * Windows: contains string "server" or "client"
+#     * POSIX: as defined by os-release(5)
+#     * Windows: contains string "server" or "client"
+#
 # @variant-id:
-# * POSIX: as defined by os-release(5)
-# * Windows: contains string "server" or "client"
+#     * POSIX: as defined by os-release(5)
+#     * Windows: contains string "server" or "client"
 #
-# Notes:
+# Notes: On POSIX systems the fields @id, @name, @pretty-name,
+#     @version, @version-id, @variant and @variant-id follow the
+#     definition specified in os-release(5). Refer to the manual page
+#     for exact description of the fields.  Their values are taken
+#     from the os-release file.  If the file is not present in the
+#     system, or the values are not present in the file, the fields
+#     are not included.
 #
-# On POSIX systems the fields @id, @name, @pretty-name, @version, @version-id,
-# @variant and @variant-id follow the definition specified in os-release(5).
-# Refer to the manual page for exact description of the fields. Their values
-# are taken from the os-release file. If the file is not present in the system,
-# or the values are not present in the file, the fields are not included.
-#
-# On Windows the values are filled from information gathered from the system.
+#     On Windows the values are filled from information gathered from
+#     the system.
 #
 # Since: 2.10
 ##
@@ -1408,6 +1493,7 @@
 # @GuestDeviceIdPCI:
 #
 # @vendor-id: vendor ID
+#
 # @device-id: device ID
 #
 # Since: 5.2
@@ -1418,8 +1504,7 @@
 ##
 # @GuestDeviceId:
 #
-# Id of the device
-# - @pci: PCI ID, since: 5.2
+# Id of the device - @pci: PCI ID, since: 5.2
 #
 # Since: 5.2
 ##
@@ -1432,8 +1517,11 @@
 # @GuestDeviceInfo:
 #
 # @driver-name: name of the associated driver
+#
 # @driver-date: driver release date, in nanoseconds since the epoch
+#
 # @driver-version: driver version
+#
 # @id: device ID
 #
 # Since: 5.2
@@ -1477,8 +1565,8 @@
 #
 # @username: the user account to add the authorized keys
 #
-# Return the public keys from user .ssh/authorized_keys on Unix systems (not
-# implemented for other systems).
+# Return the public keys from user .ssh/authorized_keys on Unix
+# systems (not implemented for other systems).
 #
 # Returns: @GuestAuthorizedKeys
 #
@@ -1493,7 +1581,10 @@
 # @guest-ssh-add-authorized-keys:
 #
 # @username: the user account to add the authorized keys
-# @keys: the public keys to add (in OpenSSH/sshd(8) authorized_keys format)
+#
+# @keys: the public keys to add (in OpenSSH/sshd(8) authorized_keys
+#     format)
+#
 # @reset: ignore the existing content, set it with the given keys only
 #
 # Append public keys to user .ssh/authorized_keys on Unix systems (not
@@ -1511,11 +1602,13 @@
 # @guest-ssh-remove-authorized-keys:
 #
 # @username: the user account to remove the authorized keys
-# @keys: the public keys to remove (in OpenSSH/sshd(8) authorized_keys format)
 #
-# Remove public keys from the user .ssh/authorized_keys on Unix systems (not
-# implemented for other systems). It's not an error if the key is already
-# missing.
+# @keys: the public keys to remove (in OpenSSH/sshd(8) authorized_keys
+#     format)
+#
+# Remove public keys from the user .ssh/authorized_keys on Unix
+# systems (not implemented for other systems). It's not an error if
+# the key is already missing.
 #
 # Returns: Nothing on success.
 #
@@ -1560,7 +1653,8 @@
 #
 # @total-ticks: time spent doing I/Os (ms)
 #
-# @weight-ticks: weighted time spent doing I/Os since the last update of this field(ms)
+# @weight-ticks: weighted time spent doing I/Os since the last update
+#     of this field(ms)
 #
 # Since: 7.1
 ##
@@ -1603,6 +1697,7 @@
 # @guest-get-diskstats:
 #
 # Retrieve information about disk stats.
+#
 # Returns: List of disk stats of guest.
 #
 # Since: 7.1
@@ -1645,8 +1740,8 @@
 #
 # @steal: Stolen time by host (since Linux 2.6.11)
 #
-# @guest: ime spent running a virtual CPU for guest operating systems under
-#         the  control of the Linux kernel (since Linux 2.6.24)
+# @guest: ime spent running a virtual CPU for guest operating systems
+#     under the  control of the Linux kernel (since Linux 2.6.24)
 #
 # @guestnice: Time spent running a niced guest (since Linux 2.6.33)
 #
@@ -1684,6 +1779,7 @@
 # @guest-get-cpustats:
 #
 # Retrieve information about CPU stats.
+#
 # Returns: List of CPU stats of guest.
 #
 # Since: 7.1
-- 
2.39.2


