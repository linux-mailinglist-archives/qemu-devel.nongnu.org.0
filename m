Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782E83D7F6C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 22:44:57 +0200 (CEST)
Received: from localhost ([::1]:49616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Twe-0002qr-I0
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 16:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8TtC-00064P-En
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 16:41:23 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Tt7-00054q-SX
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 16:41:22 -0400
Received: by mail-wr1-x42d.google.com with SMTP id h14so8717342wrx.10
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 13:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9d6gfoZxYgBNbt9fSr3gTvhM0n8xYZyWqIyN0lRy3ek=;
 b=t/6VRPAAcRCsRCcppAnE2K1fKnyaZ6bfhrZOTY0IzJKTulfoJAwX0Otpp8STZ9qX6+
 i+w4It7jGNFxxMEUjoYUTCyxUzUUkkGSQXYymb5oYLO6g42ZOa4UDj7FyDuLTOrjBjW4
 SFdv/MSXVxkJFoQTKV4HQufDIQvcr+0wShUFMlYeFSz6xs+RL/gthen+JiZqj62fFtGo
 vpt1/9rHemtfuqnIqPXzbm3gqj1ua69p6jT9oivrgSiuj0PvIz4iXraGNCdiiIgaTGkG
 9V4Yq5oRC+etxj7Be03gOmONGE+KieMvHDdv4t8P//V4wdCltYsQs+WIEaETGBtZjo3z
 itfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9d6gfoZxYgBNbt9fSr3gTvhM0n8xYZyWqIyN0lRy3ek=;
 b=sBVTvY1Fd8OgMQzYAvDo3vfGjBsWadUpx9j1ijPIgfVOvvUPBGEKkAiCCNQAz95zaV
 euYN9BHl42hpxjXdwWgvJD8yu+rFFb53tM4MpzP37AfMMyxGFWfU0/BghsQT9Lid+bhx
 sJUFrqXuP1N5AZ+RiPfdE9MR7QYz2PjHr3aDhcJrU8yQ2/WrrdLRb5/QXZ+n2lIn/Iao
 KnUZdjr/H3uLUZli9B8VNJ62FPYeSRRNGcqZ5A+WsBXfvU16h1grruEqcq01AgWWkTBA
 YAsEUEXyeRBSFQdk9a2KMA277fseRMgWuIm6xr90gSXl0s51FB4y/Hr9GAAi4QIjUFnr
 +kTw==
X-Gm-Message-State: AOAM531Ojh4KqvgQPzbAALzkzQ2fxlZH0gx+9jrjnj0TFS4nwbTpwqmj
 eKMQZNJMc+WlvvOSbtrpd7z468Ap1aJ12A==
X-Google-Smtp-Source: ABdhPJxtGbSerCJwVctcQtgodckSxoq5hNbmMvnOKNKR9T0r2/hxGeHS26BQ5kq90UqN5jSVgD/WJw==
X-Received: by 2002:adf:e409:: with SMTP id g9mr27813342wrm.66.1627418475751; 
 Tue, 27 Jul 2021 13:41:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h16sm4276302wre.52.2021.07.27.13.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 13:41:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] docs: Move the protocol part of barrier.txt into interop
Date: Tue, 27 Jul 2021 21:41:10 +0100
Message-Id: <20210727204112.12579-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727204112.12579-1-peter.maydell@linaro.org>
References: <20210727204112.12579-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most of docs/barrier.txt is describing the protocol implemented
by the input-barrier device. Move this into the interop
section of the manual, and rstify it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/barrier.txt         | 318 -----------------------------
 docs/interop/barrier.rst | 426 +++++++++++++++++++++++++++++++++++++++
 docs/interop/index.rst   |   1 +
 3 files changed, 427 insertions(+), 318 deletions(-)
 create mode 100644 docs/interop/barrier.rst

diff --git a/docs/barrier.txt b/docs/barrier.txt
index b21d15015d9..376d0b2d709 100644
--- a/docs/barrier.txt
+++ b/docs/barrier.txt
@@ -45,324 +45,6 @@
 
         (qemu) object_del barrier0
         (qemu) object_add input-barrier,id=barrier0,name=VM-1
-
-* Message format
-
-    Message format between the server and client is in two parts:
-
-        1- the payload length is a 32bit integer in network endianness,
-        2- the payload
-
-    The payload starts with a 4byte string (without NUL) which is the
-    command. The first command between the server and the client
-    is the only command not encoded on 4 bytes ("Barrier").
-    The remaining part of the payload is decoded according to the command.
-
-* Protocol Description (from barrier/src/lib/barrier/protocol_types.h)
-
-    - barrierCmdHello          "Barrier"
-
-      Direction:  server -> client
-      Parameters: { int16_t minor, int16_t major }
-      Description:
-
-          Say hello to client
-          minor = protocol major version number supported by server
-          major = protocol minor version number supported by server
-
-    - barrierCmdHelloBack      "Barrier"
-
-      Direction:  client ->server
-      Parameters: { int16_t minor, int16_t major, char *name}
-      Description:
-
-          Respond to hello from server
-          minor = protocol major version number supported by client
-          major = protocol minor version number supported by client
-          name  = client name
-
-    - barrierCmdDInfo          "DINF"
-
-      Direction:  client ->server
-      Parameters: { int16_t x_origin, int16_t y_origin, int16_t width, int16_t height, int16_t x, int16_t y}
-      Description:
-
-          The client screen must send this message in response to the
-          barrierCmdQInfo message.  It must also send this message when the
-          screen's resolution changes.  In this case, the client screen should
-          ignore any barrierCmdDMouseMove messages until it receives a
-          barrierCmdCInfoAck in order to prevent attempts to move the mouse off
-          the new screen area.
-
-    - barrierCmdCNoop          "CNOP"
-
-      Direction:  client -> server
-      Parameters: None
-      Description:
-
-          No operation
-
-    - barrierCmdCClose         "CBYE"
-
-      Direction:  server -> client
-      Parameters: None
-      Description:
-
-          Close connection
-
-    - barrierCmdCEnter         "CINN"
-
-      Direction:  server -> client
-      Parameters: { int16_t x, int16_t y, int32_t seq, int16_t modifier }
-      Description:
-
-          Enter screen.
-          x,y      = entering screen absolute coordinates
-          seq      = sequence number, which is used to order messages between
-                     screens.  the secondary screen must return this number
-                     with some messages
-          modifier = modifier key mask.  this will have bits set for each
-                     toggle modifier key that is activated on entry to the
-                     screen.  the secondary screen should adjust its toggle
-                     modifiers to reflect that state.
-
-    - barrierCmdCLeave         "COUT"
-
-      Direction:  server -> client
-      Parameters: None
-      Description:
-
-          Leaving screen.  the secondary screen should send clipboard data in
-          response to this message for those clipboards that it has grabbed
-          (i.e. has sent a barrierCmdCClipboard for and has not received a
-          barrierCmdCClipboard for with a greater sequence number) and that
-          were grabbed or have changed since the last leave.
-
-    - barrierCmdCClipboard     "CCLP"
-
-      Direction:  server -> client
-      Parameters: { int8_t id, int32_t seq }
-      Description:
-
-          Grab clipboard. Sent by screen when some other app on that screen
-          grabs a clipboard.
-          id  = the clipboard identifier
-          seq = sequence number. Client must use the sequence number passed in
-                the most recent barrierCmdCEnter.  the server always sends 0.
-
-    - barrierCmdCScreenSaver   "CSEC"
-
-      Direction:  server -> client
-      Parameters: { int8_t started }
-      Description:
-
-          Screensaver change.
-          started = Screensaver on primary has started (1) or closed (0)
-
-    - barrierCmdCResetOptions  "CROP"
-
-      Direction:  server -> client
-      Parameters: None
-      Description:
-
-          Reset options. Client should reset all of its options to their
-          defaults.
-
-    - barrierCmdCInfoAck       "CIAK"
-
-      Direction:  server -> client
-      Parameters: None
-      Description:
-
-          Resolution change acknowledgment. Sent by server in response to a
-          client screen's barrierCmdDInfo. This is sent for every
-          barrierCmdDInfo, whether or not the server had sent a barrierCmdQInfo.
-
-    - barrierCmdCKeepAlive     "CALV"
-
-      Direction:  server -> client
-      Parameters: None
-      Description:
-
-          Keep connection alive. Sent by the server periodically to verify
-          that connections are still up and running.  clients must reply in
-          kind on receipt.  if the server gets an error sending the message or
-          does not receive a reply within a reasonable time then the server
-          disconnects the client.  if the client doesn't receive these (or any
-          message) periodically then it should disconnect from the server.  the
-          appropriate interval is defined by an option.
-
-    - barrierCmdDKeyDown       "DKDN"
-
-      Direction:  server -> client
-      Parameters: { int16_t keyid, int16_t modifier [,int16_t button] }
-      Description:
-
-          Key pressed.
-          keyid    = X11 key id
-          modified = modified mask
-          button   = X11 Xkb keycode (optional)
-
-    - barrierCmdDKeyRepeat     "DKRP"
-
-      Direction:  server -> client
-      Parameters: { int16_t keyid, int16_t modifier, int16_t repeat [,int16_t button] }
-      Description:
-
-          Key auto-repeat.
-          keyid    = X11 key id
-          modified = modified mask
-          repeat   = number of repeats
-          button   = X11 Xkb keycode (optional)
-
-    - barrierCmdDKeyUp         "DKUP"
-
-      Direction:  server -> client
-      Parameters: { int16_t keyid, int16_t modifier [,int16_t button] }
-      Description:
-
-          Key released.
-          keyid    = X11 key id
-          modified = modified mask
-          button   = X11 Xkb keycode (optional)
-
-    - barrierCmdDMouseDown     "DMDN"
-
-      Direction:  server -> client
-      Parameters: { int8_t button }
-      Description:
-
-          Mouse button pressed.
-          button = button id
-
-    - barrierCmdDMouseUp       "DMUP"
-
-      Direction:  server -> client
-      Parameters: { int8_t button }
-      Description:
-
-          Mouse button release.
-          button = button id
-
-    - barrierCmdDMouseMove     "DMMV"
-
-      Direction:  server -> client
-      Parameters: { int16_t x, int16_t y }
-      Description:
-
-          Absolute mouse moved.
-          x,y = absolute screen coordinates
-
-    - barrierCmdDMouseRelMove  "DMRM"
-
-      Direction:  server -> client
-      Parameters: { int16_t x, int16_t y }
-      Description:
-
-          Relative mouse moved.
-          x,y = r relative screen coordinates
-
-    - barrierCmdDMouseWheel    "DMWM"
-
-      Direction:  server -> client
-      Parameters: { int16_t x , int16_t y } or { int16_t y }
-      Description:
-
-          Mouse scroll. The delta should be +120 for one tick forward (away
-          from the user) or right and -120 for one tick backward (toward the
-          user) or left.
-          x = x delta
-          y = y delta
-
-    - barrierCmdDClipboard     "DCLP"
-
-      Direction:  server -> client
-      Parameters: { int8_t id, int32_t seq, int8_t mark, char *data }
-      Description:
-
-          Clipboard data.
-          id  = clipboard id
-          seq = sequence number. The sequence number is 0 when sent by the
-                server.  Client screens should use the/ sequence number from
-                the most recent barrierCmdCEnter.
-
-    - barrierCmdDSetOptions    "DSOP"
-
-      Direction:  server -> client
-      Parameters: { int32 t nb, { int32_t id, int32_t val }[] }
-      Description:
-
-          Set options. Client should set the given option/value pairs.
-          nb  = numbers of { id, val } entries
-          id  = option id
-          val = option new value
-
-    - barrierCmdDFileTransfer  "DFTR"
-
-      Direction:  server -> client
-      Parameters: { int8_t mark, char *content }
-      Description:
-
-          Transfer file data.
-          mark = 0 means the content followed is the file size
-                 1 means the content followed is the chunk data
-                 2 means the file transfer is finished
-
-    - barrierCmdDDragInfo      "DDRG" int16_t char *
-
-      Direction:  server -> client
-      Parameters: { int16_t nb, char *content }
-      Description:
-
-          Drag information.
-          nb      = number of dragging objects
-          content = object's directory
-
-    - barrierCmdQInfo          "QINF"
-
-      Direction:  server -> client
-      Parameters: None
-      Description:
-
-          Query screen info
-          Client should reply with a barrierCmdDInfo
-
-    - barrierCmdEIncompatible  "EICV"
-
-      Direction:  server -> client
-      Parameters: { int16_t nb, major *minor }
-      Description:
-
-          Incompatible version.
-          major = major version
-          minor = minor version
-
-    - barrierCmdEBusy          "EBSY"
-
-      Direction:  server -> client
-      Parameters: None
-      Description:
-
-          Name provided when connecting is already in use.
-
-    - barrierCmdEUnknown       "EUNK"
-
-      Direction:  server -> client
-      Parameters: None
-      Description:
-
-          Unknown client. Name provided when connecting is not in primary's
-           screen configuration map.
-
-    - barrierCmdEBad           "EBAD"
-
-      Direction:  server -> client
-      Parameters: None
-      Description:
-
-          Protocol violation. Server should disconnect after sending this
-          message.
-
 * TO DO
 
     - Enable SSL
diff --git a/docs/interop/barrier.rst b/docs/interop/barrier.rst
new file mode 100644
index 00000000000..055f2c1aef3
--- /dev/null
+++ b/docs/interop/barrier.rst
@@ -0,0 +1,426 @@
+Barrier client protocol
+=======================
+
+QEMU's ``input-barrier`` device implements the client end of
+the KVM (Keyboard-Video-Mouse) software
+`Barrier <https://github.com/debauchee/barrier>`__.
+
+This document briefly describes the protocol as we implement it.
+
+Message format
+--------------
+
+Message format between the server and client is in two parts:
+
+#. the payload length, a 32bit integer in network endianness
+#. the payload
+
+The payload starts with a 4byte string (without NUL) which is the
+command. The first command between the server and the client
+is the only command not encoded on 4 bytes ("Barrier").
+The remaining part of the payload is decoded according to the command.
+
+Protocol Description
+--------------------
+
+This comes from ``barrier/src/lib/barrier/protocol_types.h``.
+
+barrierCmdHello  "Barrier"
+^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  ``{ int16_t minor, int16_t major }``
+Description:
+  Say hello to client
+
+  ``minor`` = protocol major version number supported by server
+
+  ``major`` = protocol minor version number supported by server
+
+barrierCmdHelloBack  "Barrier"
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  client ->server
+Parameters:
+  ``{ int16_t minor, int16_t major, char *name}``
+Description:
+  Respond to hello from server
+
+  ``minor`` = protocol major version number supported by client
+
+  ``major`` = protocol minor version number supported by client
+
+  ``name``  = client name
+
+barrierCmdDInfo  "DINF"
+^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  client ->server
+Parameters:
+  ``{ int16_t x_origin, int16_t y_origin, int16_t width, int16_t height, int16_t x, int16_t y}``
+Description:
+  The client screen must send this message in response to the
+  barrierCmdQInfo message.  It must also send this message when the
+  screen's resolution changes.  In this case, the client screen should
+  ignore any barrierCmdDMouseMove messages until it receives a
+  barrierCmdCInfoAck in order to prevent attempts to move the mouse off
+  the new screen area.
+
+barrierCmdCNoop  "CNOP"
+^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  client -> server
+Parameters:
+  None
+Description:
+  No operation
+
+barrierCmdCClose "CBYE"
+^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  None
+Description:
+  Close connection
+
+barrierCmdCEnter "CINN"
+^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  ``{ int16_t x, int16_t y, int32_t seq, int16_t modifier }``
+Description:
+  Enter screen.
+
+  ``x``, ``y``  = entering screen absolute coordinates
+
+  ``seq``  = sequence number, which is used to order messages between
+  screens.  the secondary screen must return this number
+  with some messages
+
+  ``modifier`` = modifier key mask.  this will have bits set for each
+  toggle modifier key that is activated on entry to the
+  screen.  the secondary screen should adjust its toggle
+  modifiers to reflect that state.
+
+barrierCmdCLeave "COUT"
+^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  None
+Description:
+  Leaving screen.  the secondary screen should send clipboard data in
+  response to this message for those clipboards that it has grabbed
+  (i.e. has sent a barrierCmdCClipboard for and has not received a
+  barrierCmdCClipboard for with a greater sequence number) and that
+  were grabbed or have changed since the last leave.
+
+barrierCmdCClipboard "CCLP"
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  ``{ int8_t id, int32_t seq }``
+Description:
+  Grab clipboard. Sent by screen when some other app on that screen
+  grabs a clipboard.
+
+  ``id``  = the clipboard identifier
+
+  ``seq`` = sequence number. Client must use the sequence number passed in
+  the most recent barrierCmdCEnter.  the server always sends 0.
+
+barrierCmdCScreenSaver   "CSEC"
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  ``{ int8_t started }``
+Description:
+  Screensaver change.
+
+  ``started`` = Screensaver on primary has started (1) or closed (0)
+
+barrierCmdCResetOptions  "CROP"
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  None
+Description:
+  Reset options. Client should reset all of its options to their
+  defaults.
+
+barrierCmdCInfoAck   "CIAK"
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  None
+Description:
+  Resolution change acknowledgment. Sent by server in response to a
+  client screen's barrierCmdDInfo. This is sent for every
+  barrierCmdDInfo, whether or not the server had sent a barrierCmdQInfo.
+
+barrierCmdCKeepAlive "CALV"
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  None
+Description:
+  Keep connection alive. Sent by the server periodically to verify
+  that connections are still up and running.  clients must reply in
+  kind on receipt.  if the server gets an error sending the message or
+  does not receive a reply within a reasonable time then the server
+  disconnects the client.  if the client doesn't receive these (or any
+  message) periodically then it should disconnect from the server.  the
+  appropriate interval is defined by an option.
+
+barrierCmdDKeyDown   "DKDN"
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  ``{ int16_t keyid, int16_t modifier [,int16_t button] }``
+Description:
+  Key pressed.
+
+  ``keyid`` = X11 key id
+
+  ``modified`` = modified mask
+
+  ``button`` = X11 Xkb keycode (optional)
+
+barrierCmdDKeyRepeat "DKRP"
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  ``{ int16_t keyid, int16_t modifier, int16_t repeat [,int16_t button] }``
+Description:
+  Key auto-repeat.
+
+  ``keyid`` = X11 key id
+
+  ``modified`` = modified mask
+
+  ``repeat``   = number of repeats
+
+  ``button``   = X11 Xkb keycode (optional)
+
+barrierCmdDKeyUp "DKUP"
+^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  ``{ int16_t keyid, int16_t modifier [,int16_t button] }``
+Description:
+  Key released.
+
+  ``keyid`` = X11 key id
+
+  ``modified`` = modified mask
+
+  ``button`` = X11 Xkb keycode (optional)
+
+barrierCmdDMouseDown "DMDN"
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  ``{ int8_t button }``
+Description:
+  Mouse button pressed.
+
+  ``button`` = button id
+
+barrierCmdDMouseUp   "DMUP"
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  ``{ int8_t button }``
+Description:
+  Mouse button release.
+
+  ``button`` = button id
+
+barrierCmdDMouseMove "DMMV"
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  ``{ int16_t x, int16_t y }``
+Description:
+  Absolute mouse moved.
+
+  ``x``, ``y`` = absolute screen coordinates
+
+barrierCmdDMouseRelMove  "DMRM"
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  ``{ int16_t x, int16_t y }``
+Description:
+  Relative mouse moved.
+
+  ``x``, ``y`` = r relative screen coordinates
+
+barrierCmdDMouseWheel "DMWM"
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  ``{ int16_t x , int16_t y }`` or ``{ int16_t y }``
+Description:
+  Mouse scroll. The delta should be +120 for one tick forward (away
+  from the user) or right and -120 for one tick backward (toward the
+  user) or left.
+
+  ``x`` = x delta
+
+  ``y`` = y delta
+
+barrierCmdDClipboard "DCLP"
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  ``{ int8_t id, int32_t seq, int8_t mark, char *data }``
+Description:
+  Clipboard data.
+
+  ``id``  = clipboard id
+
+  ``seq`` = sequence number. The sequence number is 0 when sent by the
+  server.  Client screens should use the/ sequence number from
+  the most recent barrierCmdCEnter.
+
+barrierCmdDSetOptions "DSOP"
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  ``{ int32 t nb, { int32_t id, int32_t val }[] }``
+Description:
+  Set options. Client should set the given option/value pairs.
+
+  ``nb``  = numbers of ``{ id, val }`` entries
+
+  ``id``  = option id
+
+  ``val`` = option new value
+
+barrierCmdDFileTransfer "DFTR"
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  ``{ int8_t mark, char *content }``
+Description:
+  Transfer file data.
+
+  * ``mark`` = 0 means the content followed is the file size
+  * 1 means the content followed is the chunk data
+  * 2 means the file transfer is finished
+
+barrierCmdDDragInfo  "DDRG"
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  ``{ int16_t nb, char *content }``
+Description:
+  Drag information.
+
+  ``nb``  = number of dragging objects
+
+  ``content`` = object's directory
+
+barrierCmdQInfo  "QINF"
+^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  None
+Description:
+  Query screen info
+
+  Client should reply with a barrierCmdDInfo
+
+barrierCmdEIncompatible  "EICV"
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  ``{ int16_t nb, major *minor }``
+Description:
+  Incompatible version.
+
+  ``major`` = major version
+
+  ``minor`` = minor version
+
+barrierCmdEBusy  "EBSY"
+^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  None
+Description:
+  Name provided when connecting is already in use.
+
+barrierCmdEUnknown   "EUNK"
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  None
+Description:
+  Unknown client. Name provided when connecting is not in primary's
+  screen configuration map.
+
+barrierCmdEBad   "EBAD"
+^^^^^^^^^^^^^^^^^^^^^^^
+
+Direction:
+  server -> client
+Parameters:
+  None
+Description:
+  Protocol violation. Server should disconnect after sending this
+  message.
+
diff --git a/docs/interop/index.rst b/docs/interop/index.rst
index b1bab81e2ee..f9801a9c202 100644
--- a/docs/interop/index.rst
+++ b/docs/interop/index.rst
@@ -7,6 +7,7 @@ are useful for making QEMU interoperate with other software.
 .. toctree::
    :maxdepth: 2
 
+   barrier
    bitmaps
    dbus
    dbus-vmstate
-- 
2.20.1


