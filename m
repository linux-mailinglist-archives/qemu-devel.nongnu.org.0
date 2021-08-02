Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD30E3DD517
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:03:47 +0200 (CEST)
Received: from localhost ([::1]:53798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWfa-0000gn-MO
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaO-0000ZG-La
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:24 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaM-0003az-FB
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:24 -0400
Received: by mail-wr1-x434.google.com with SMTP id b13so10310260wrs.3
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 04:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Dg5nApdUFCOrIhZ/JoSJnJ//2SJbZdxUlkIsuGjN9ZI=;
 b=TdV9OYy2qHK6LfHJnZ6XhGbgK2BH++Opqyxc4Xbyf/dIOexeOXIVgw/pBYRQ3jDDVm
 Vkdv/5hyTdPVdBzpCasLBM0plNQqyw5uRRIsHZx1Ja8AK1UN0fHMN98GWQe6zSVZruJM
 E51Y1GgfL4duCTmK+OetPhaG4eJxHYGvAW6FIZTVDGs8wwZHVFqyO6pnJhXjFvVKIW4k
 BPJsw3Rf58NnLaRBCd/FQjSgIGP5g96fabF0xMztSZfNazKlFk+pBguVZboPeRl5q6UQ
 1If0WvwMR1npYOpayTVuBfbiCxFO2IwVyxXsKv0J3P94KyvV8Xo3vPXI8DOjkpC7ZQYW
 BGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dg5nApdUFCOrIhZ/JoSJnJ//2SJbZdxUlkIsuGjN9ZI=;
 b=QTI3bX8pkLQcnBXFOWPIqhqvFsn8TQBLs+1kGkvsJUUh4C1PAQfgszDRO1z+0D14JT
 UMX+isK10svuyT3rGdzXMc1MJN/p9PzZfKRzfs2XU/dQORGwDrItFdpUopDs5sO7Jnwv
 FSAIKK0S0OLGDOidI7NOG8w50w/o5EptpfH27l3e5ckVldvS0lbvtftt156//0JEoAwP
 zXIVyC9IeztCD2sijmz80FtVgJAS8mosjtQMaejYKQ7J510/hUhlda5597WrpadFbloH
 W3RyMl8nxiAOs4yGbvo35PF7cFHKdvJ8r7pptE5rPqHpA9V4GKlyEijtZqZ7V/Y7pvsP
 QtRw==
X-Gm-Message-State: AOAM532d8VmMSLgyHAbMIZIx/aj9MnPTEHImtVsZk73LtT/RGBA/rUTd
 vP3T4gMVjp9NP3rb/YFsBJqCJ+h/SPlDDg==
X-Google-Smtp-Source: ABdhPJzYeMQ8hTjxzccq70BwsGae3iXboSWLoszCt256vRmamCgludWQH3twTXR0QSm9aur6d7EPrg==
X-Received: by 2002:a5d:4b48:: with SMTP id w8mr17321990wrs.109.1627905501034; 
 Mon, 02 Aug 2021 04:58:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm10102772wmy.39.2021.08.02.04.58.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:58:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/21] docs/devel/migration.rst: Format literals correctly
Date: Mon,  2 Aug 2021 12:58:01 +0100
Message-Id: <20210802115812.10731-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802115812.10731-1-peter.maydell@linaro.org>
References: <20210802115812.10731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-id: 20210726142338.31872-5-peter.maydell@linaro.org
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


