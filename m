Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D1D3AA8F9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 04:33:05 +0200 (CEST)
Received: from localhost ([::1]:48842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lthq4-0005UP-NZ
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 22:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lthoe-0003jj-TE
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 22:31:36 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:44895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lthod-0001Bg-65
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 22:31:36 -0400
Received: by mail-pg1-x535.google.com with SMTP id t13so3663305pgu.11
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 19:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G86KJPNnyQgLm0Uyhw14p7Uif4sS3BGLfhbQnXZG8a4=;
 b=g0065gsmaUHtOH/ZBoJIDGFIiZQ8Y2a+t/35qoy3NN7zTAjSL2xYwDCQVk5DEgVnRL
 sY7LuZaXKZhqeAAl6eanEHWLl8E81lNWh0bZW0ce4ZEmqSP7xjoPKLu40QP/WvavaiYK
 iQN7fNnTgLMlTbW3Ij+v0UauLDFL3wMlw2PYcrHmEQ+DV9JP6SkljyEAt/P72v9cTKP7
 YZS+deVJCLnv2RNF4Pl62I1+KdEzBRM6ZnkJLAhIkFJZjxLyX8007gAW4gboF2Y2eTw7
 Zz23/Df+GHlkCv9WJ/XJgoVFZkiW5uvr7ruxOVxKpsdN71EvnmNiZ7GZzgHbjS2hwaCP
 YeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G86KJPNnyQgLm0Uyhw14p7Uif4sS3BGLfhbQnXZG8a4=;
 b=uY3D+C0od3pnqPhazkem8/oa42WgwEfe+ToBER28aHuYGEpyRBLlVT+uTJAC9k/+7j
 8Jy8CSDCon5SeuajFAofLw7crWZGDFXwnk7sh/Lxf3hBru5dw93KE6UdXJuAdQ4kYt64
 qY8vq3+WInTsz+zuQvo13FSfD8gYbhlgrmfU+qvisTy1r3kuRIvi9E3bsk2Q+az+f3ah
 13rjN+PIDCCd3bBTcrijvI+YDWzksBsAwBMqmPgp4Sq4QzYosPvSk8HqzJH5fIYMJ5Od
 pU4CAKRS7oqvGmST1OZ1f2Sl05GCvE1shxS3EAX3mcieoqD7yiDdrmpIQxoGHRBqykRV
 Ri6g==
X-Gm-Message-State: AOAM531PkXQcTPe9O0JTTyP8x+os350KYwomQITzCKPTueWIu5o4DZ9Y
 XlWsyzDQ+rFkBgXae25B3MTBBb49yxtXwg==
X-Google-Smtp-Source: ABdhPJxA4huafm+DpCD/XiaAyLuVn6A1q0wKM9gUgBG03mfbcK38QLLBh9xP6sZdBshPWP/4ooR+SA==
X-Received: by 2002:a05:6a00:b95:b029:2ec:81eb:518d with SMTP id
 g21-20020a056a000b95b02902ec81eb518dmr2951711pfj.61.1623897093468; 
 Wed, 16 Jun 2021 19:31:33 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:95b0:bc6c:a6df:1b30])
 by smtp.gmail.com with ESMTPSA id l201sm3352474pfd.183.2021.06.16.19.31.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Jun 2021 19:31:33 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2 0/1] input: Add lang1 and lang2 to QKeyCode
Date: Thu, 17 Jun 2021 11:31:12 +0900
Message-Id: <20210617023113.2441-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds two QKeyCodes. The corresponding path for ui/keycodemapdb
is titled as "Add QEMU QKeyCode 'lang1' and 'lang2'". This patch should be
applied *before* applying the patch for ui/keycodemapdb, or it causes
build failures.

v1 -> v2:

 - Documented the new QKeyCodes as available "since 6.1".

Akihiko Odaki (1):
  input: Add lang1 and lang2 to QKeyCode

 qapi/ui.json | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.30.1 (Apple Git-130)


