Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A518C3D5B88
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 16:26:22 +0200 (CEST)
Received: from localhost ([::1]:52118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m81Yj-0001eq-Ld
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 10:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m81WG-0005Xb-OX
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:23:48 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m81WE-0008QU-D9
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:23:48 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 z8-20020a1c4c080000b029022d4c6cfc37so8294013wmf.5
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 07:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mf2QwxAd+JWIGrDewPwqms3Ysowyr66X8I/eW3Y0/ns=;
 b=L6CVNZ6VcX7oUdX+U1OiuLlhiXZ/SJGoFSk3JhPUXyMqa+0ytdLt/SWKjhugZ7p2uK
 UOI1NVgOAV5vUri9Vlt7stBBPHd69UZJn198NEP1RhKcDIdveY8hLFGQFzlO5J27svdh
 OVYyoIK8uNsnQNMhIVMy91yGFKbgO4OkdMcl2o9kBjftvs2T/AmxRJwhDpF6ygosZNZG
 rPWf5UfRyckvPGKBBR4RkVJIcHynJpH+jD/UF1noAttshsVzveB1Sb83mouK82UnDdLt
 gqruNHBt/g55Sia3UqzJqo1I7rWBHEud1pR9w+eToVMhdNmMcfo2PjFXXhQL33gadIqB
 q2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mf2QwxAd+JWIGrDewPwqms3Ysowyr66X8I/eW3Y0/ns=;
 b=BrCIGlopNISQ80aKIgV/pLsgBCx2ICWvKUC0/ThOievOr6Rg22jrXYqVzwb1DXfDvh
 OsDpiLQWUOJoMZaIAivm/dkI54eKChIx9WJBH2lTTKVd/KRP2Jh/epDnfjzuxGcJ61UR
 LbSbvS/J1dFzElUtcKMTohpGvXTlsI62QE/0qI3qIEABSIKLNvZBNjfZjIlsvSnxWLI4
 sj3BttnFu7DrnpmY8+VKxyeHWGdk0zW14L/tfwkccZbAhrHIkePoGubXptgdVpKyMd7h
 I/erSAcjvGjroL6kd0hSFgMoxl33udresf8uqetOZeXW37lMKCWCBcc8ERmEVFTPIUY6
 053A==
X-Gm-Message-State: AOAM531XrPbx8i65MR/Tp4VjW10BFxiz6crU5g0MIKZQ38jVbLVKH/z1
 QWQ9Xavw6qI8WDMsj6bybBSI1/NqTHBVlw==
X-Google-Smtp-Source: ABdhPJyRoujRVkVhRmonQbCQhdZJL4Q/TOCz1T1x6PjWf2eDsa+kVTaZtBTBLP8IOiMp5kE6svYPbA==
X-Received: by 2002:a05:600c:354e:: with SMTP id
 i14mr17503187wmq.96.1627309424200; 
 Mon, 26 Jul 2021 07:23:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 6sm13823427wmi.3.2021.07.26.07.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:23:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 04/10] docs/devel/migration.rst: Format literals
 correctly
Date: Mon, 26 Jul 2021 15:23:32 +0100
Message-Id: <20210726142338.31872-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210726142338.31872-1-peter.maydell@linaro.org>
References: <20210726142338.31872-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In rST markup, single backticks `like this` represent "interpreted
text", which can be handled as a bunch of different things if tagged
with a specific "role":
https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#interpreted-text
(the most common one for us is "reference to a URL, which gets
hyperlinked").

The default "role" if none is specified is "title_reference",
intended for references to book or article titles, and it renders
into the HTML as <cite>...</cite> (usually comes out as italics).

To format a literal (generally rendered as fixed-width font),
double-backticks are required.

Mostly migration.rst gets this right, but some places incorrectly use
single backticks where double backticks were intended; correct them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/migration.rst | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
index 19c3d4f3eac..24012534827 100644
--- a/docs/devel/migration.rst
+++ b/docs/devel/migration.rst
@@ -53,7 +53,7 @@ savevm/loadvm functionality.
 Debugging
 =========
 
-The migration stream can be analyzed thanks to `scripts/analyze-migration.py`.
+The migration stream can be analyzed thanks to ``scripts/analyze-migration.py``.
 
 Example usage:
 
@@ -75,8 +75,8 @@ Common infrastructure
 =====================
 
 The files, sockets or fd's that carry the migration stream are abstracted by
-the  ``QEMUFile`` type (see `migration/qemu-file.h`).  In most cases this
-is connected to a subtype of ``QIOChannel`` (see `io/`).
+the  ``QEMUFile`` type (see ``migration/qemu-file.h``).  In most cases this
+is connected to a subtype of ``QIOChannel`` (see ``io/``).
 
 
 Saving the state of one device
@@ -166,14 +166,14 @@ An example (from hw/input/pckbd.c)
   };
 
 We are declaring the state with name "pckbd".
-The `version_id` is 3, and the fields are 4 uint8_t in a KBDState structure.
+The ``version_id`` is 3, and the fields are 4 uint8_t in a KBDState structure.
 We registered this with:
 
 .. code:: c
 
     vmstate_register(NULL, 0, &vmstate_kbd, s);
 
-For devices that are `qdev` based, we can register the device in the class
+For devices that are ``qdev`` based, we can register the device in the class
 init function:
 
 .. code:: c
@@ -210,9 +210,9 @@ another to load the state back.
                            SaveVMHandlers *ops,
                            void *opaque);
 
-Two functions in the ``ops`` structure are the `save_state`
-and `load_state` functions.  Notice that `load_state` receives a version_id
-parameter to know what state format is receiving.  `save_state` doesn't
+Two functions in the ``ops`` structure are the ``save_state``
+and ``load_state`` functions.  Notice that ``load_state`` receives a version_id
+parameter to know what state format is receiving.  ``save_state`` doesn't
 have a version_id parameter because it always uses the latest version.
 
 Note that because the VMState macros still save the data in a raw
@@ -385,18 +385,18 @@ migration of a device, and using them breaks backward-migration
 compatibility; in general most changes can be made by adding Subsections
 (see above) or _TEST macros (see above) which won't break compatibility.
 
-Each version is associated with a series of fields saved.  The `save_state` always saves
-the state as the newer version.  But `load_state` sometimes is able to
+Each version is associated with a series of fields saved.  The ``save_state`` always saves
+the state as the newer version.  But ``load_state`` sometimes is able to
 load state from an older version.
 
 You can see that there are several version fields:
 
-- `version_id`: the maximum version_id supported by VMState for that device.
-- `minimum_version_id`: the minimum version_id that VMState is able to understand
+- ``version_id``: the maximum version_id supported by VMState for that device.
+- ``minimum_version_id``: the minimum version_id that VMState is able to understand
   for that device.
-- `minimum_version_id_old`: For devices that were not able to port to vmstate, we can
+- ``minimum_version_id_old``: For devices that were not able to port to vmstate, we can
   assign a function that knows how to read this old state. This field is
-  ignored if there is no `load_state_old` handler.
+  ignored if there is no ``load_state_old`` handler.
 
 VMState is able to read versions from minimum_version_id to
 version_id.  And the function ``load_state_old()`` (if present) is able to
@@ -454,7 +454,7 @@ data and then transferred to the main structure.
 
 If you use memory API functions that update memory layout outside
 initialization (i.e., in response to a guest action), this is a strong
-indication that you need to call these functions in a `post_load` callback.
+indication that you need to call these functions in a ``post_load`` callback.
 Examples of such memory API functions are:
 
   - memory_region_add_subregion()
@@ -823,12 +823,12 @@ Postcopy migration with shared memory needs explicit support from the other
 processes that share memory and from QEMU. There are restrictions on the type of
 memory that userfault can support shared.
 
-The Linux kernel userfault support works on `/dev/shm` memory and on `hugetlbfs`
-(although the kernel doesn't provide an equivalent to `madvise(MADV_DONTNEED)`
+The Linux kernel userfault support works on ``/dev/shm`` memory and on ``hugetlbfs``
+(although the kernel doesn't provide an equivalent to ``madvise(MADV_DONTNEED)``
 for hugetlbfs which may be a problem in some configurations).
 
 The vhost-user code in QEMU supports clients that have Postcopy support,
-and the `vhost-user-bridge` (in `tests/`) and the DPDK package have changes
+and the ``vhost-user-bridge`` (in ``tests/``) and the DPDK package have changes
 to support postcopy.
 
 The client needs to open a userfaultfd and register the areas
-- 
2.20.1


