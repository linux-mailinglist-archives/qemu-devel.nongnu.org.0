Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CA047A0ED
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 15:27:45 +0100 (CET)
Received: from localhost ([::1]:37504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myxA7-0000ha-Sn
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 09:27:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx0F-0006cy-GN
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:31 -0500
Received: from [2a00:1450:4864:20::532] (port=39703
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx0A-0005yC-OY
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:31 -0500
Received: by mail-ed1-x532.google.com with SMTP id f5so4729815edq.6
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 06:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fdbRXvNu+/Gyf5YRvbOWHKtUQ4glJaVOj/ojGkMfKGo=;
 b=qqU02y/sHS3C4Tk4eRSJCrSK8cFnWeVHNoUEwGBzUxMjprCoG93Bsay4t7Q0NqH46L
 9/kKUx2fxZmNqGdBylQEmysWx5QZmlo65tI6XIGVpOOJlfApdKmjxFGyx7hZGFd2xVUq
 ERWLaN9bf2a0CrlJP9dvybtfJtkUimTJng1IdyTW3kJngL/qeD7bWAhBgynr5JLYFDO+
 QXKNGyFCH7YjxTcTS798vWkS0VqbfMXCVX+1zskjlQHMHbFSRZsuuEN40ZvJY+u6BYJc
 EKmbX57U7pFrJc0LEoEUmO4WCFcvvu4oFHqaMpFeRSWLVIe5+HBPHD5HNoy5UKM3E06S
 qjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fdbRXvNu+/Gyf5YRvbOWHKtUQ4glJaVOj/ojGkMfKGo=;
 b=QTVLxglVpJN5X9fc8Ywi6jjcVZAeFSzQynkhVLPTZle5dVbzsXrMU0Tveaxfy7DYl1
 c4dklTrd3pPnv1wZBEQWmob/QZ/N+g1+BfoMYF1nftPxYdsMxadMlvfAEpOIl8Aw841J
 KxhbREP3PoSKaa45b5dwqOHlER/KH0YbGnzxo69Ea/pYfhOKrH8j8gGOpdWecDdx+9NT
 FZWyJV79Y54jYJtge35gDeoW2jiPdAu2+w2pEkVfTohSLLU5FMO+tWWAmrL4P8CwGdli
 lYnNlfj3U8iTO/PI3iR4J1UXCwQ3MC05SeeHwsrZk50fOzPzsPrqz7TLUd+gsXIhCvoL
 +wVw==
X-Gm-Message-State: AOAM532649PYfrkqWHgxBwDFENURU2gcSlCp3+jCbczJWSwVRXRujkw7
 Qhyoq6dmA8IVr4s0xIwKg5fo3tbICMk=
X-Google-Smtp-Source: ABdhPJyWa2jD2w4pZLDn6ANCagSYNNkQBDz1zYAC9sNwPiCs7LFn77Xf7yqA91Q1HIjeOJODsQWIkQ==
X-Received: by 2002:a17:907:2da3:: with SMTP id
 gt35mr2302882ejc.704.1639923445524; 
 Sun, 19 Dec 2021 06:17:25 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.gmail.com with ESMTPSA id hq9sm4570665ejc.119.2021.12.19.06.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 06:17:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/16] configure: remove DIRS
Date: Sun, 19 Dec 2021 15:17:04 +0100
Message-Id: <20211219141711.248066-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211219141711.248066-1-pbonzini@redhat.com>
References: <20211219141711.248066-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DIRS is used to create the directory in which the LINKS symbolic links
reside, or to create directories for object files.  The former can
be done directly in the symlinking loop, while the latter is done
by Meson already, so DIRS is not necessary.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/configure b/configure
index ba85bbb54b..8ccfe51673 100755
--- a/configure
+++ b/configure
@@ -3762,7 +3762,6 @@ if test "$safe_stack" = "yes"; then
 fi
 
 # If we're using a separate build tree, set it up now.
-# DIRS are directories which we simply mkdir in the build tree;
 # LINKS are things to symlink back into the source tree
 # (these can be both files and directories).
 # Caution: do not add files or directories here using wildcards. This
@@ -3774,12 +3773,6 @@ fi
 # UNLINK is used to remove symlinks from older development versions
 # that might get into the way when doing "git update" without doing
 # a "make distclean" in between.
-DIRS="tests tests/tcg tests/qapi-schema tests/qtest/libqos"
-DIRS="$DIRS tests/qtest tests/qemu-iotests tests/vm tests/fp tests/qgraph"
-DIRS="$DIRS docs docs/interop fsdev scsi"
-DIRS="$DIRS pc-bios/optionrom pc-bios/s390-ccw"
-DIRS="$DIRS roms/seabios"
-DIRS="$DIRS contrib/plugins/"
 LINKS="Makefile"
 LINKS="$LINKS tests/tcg/Makefile.target"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
@@ -3807,9 +3800,9 @@ for bios_file in \
 do
     LINKS="$LINKS pc-bios/$(basename $bios_file)"
 done
-mkdir -p $DIRS
 for f in $LINKS ; do
     if [ -e "$source_path/$f" ]; then
+        mkdir -p `dirname ./$f`
         symlink "$source_path/$f" "$f"
     fi
 done
-- 
2.33.1



