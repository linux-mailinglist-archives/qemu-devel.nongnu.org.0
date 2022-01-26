Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212DF49D15F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 19:04:48 +0100 (CET)
Received: from localhost ([::1]:57028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCmf0-0006PC-W6
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 13:04:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <34IvxYQcKCtMK3CIJG35DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--venture.bounces.google.com>)
 id 1nCmZQ-0000Ca-5c
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 12:59:00 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=57213
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <34IvxYQcKCtMK3CIJG35DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--venture.bounces.google.com>)
 id 1nCmZO-0000eH-LQ
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 12:58:59 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 127-20020a250f85000000b00611ab6484abso580138ybp.23
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 09:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=ozz1gQOGH3tMnRNwEK0h+MsqFlpWOqLHEmWTcEJBxt8=;
 b=JbKZZY0cMVfgjCEjC2mK3gQeYa1IIlzpV7w2I97AO031HXynOkdnVuzZuWoK985Pt0
 yfWUmBxTfpaZTOmwhW9ywdGKqcovxkkQwXcQATnr7bnp0vd+kwjh5QJ79XrJ5EY+L831
 6nfk5ga9KXKQaHcmx8XKHSfd6a0szJm4fqKWvSTly+qcxFsxL2f94KkBFqmhx/0iNAHG
 dBTu89AKP86q6JaHiwv8lsq6VKJT6ud5Fi6AuRzo36Y/KpgCBujuVRbi662UTTeihVKz
 KQpykaLGhv7I3+TC1KO30DZKSd3QRqi+NSAPiBdW2zQfJQnTdJz1AFNXQmZur4gbcjN3
 bBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=ozz1gQOGH3tMnRNwEK0h+MsqFlpWOqLHEmWTcEJBxt8=;
 b=dy9RSUmFraSDFJZj7nzwfxGHkPkkuEZ/BG+zlhuGJmuBSn0t4WA0lKBGWKPfNbBMRH
 QHx26lmKuTCyYvpygqchwZXjqZaCcJ1iqOv4kDnPAbo8BzZcx+LYiOV8Avts6MGOT21t
 x87KS63bqWZh0BgqKvpp6CgN7TlWJ8l9svj6hocALycYK5qEeqjf4srqcaW3c2Fl9URV
 YDS8s/+FZrD/C81OMWrmKRhKZrIiUxZtGxY5f/wSOBAiXqEuqEUSfp3LkAVMnpY3iNTH
 tc9pVfhxM5QmIrxyZONwDWcbYdxzFW9uSo1UrZE084HI/AAn7c2CuBuZov5qF6HgTCo0
 M94g==
X-Gm-Message-State: AOAM533VeqNzHfsMlSUdEDzBdIhJ5D/WjVM8RUQUCEbU/62ZeXnw+Asq
 5KGZmxbY5XfAb1TIm7DOxxSFxgFd7idL
X-Google-Smtp-Source: ABdhPJzLyKiyqsLLWuu/i8z6SiBsfgPmR2UTiHDdjPtIP87qfnX1AFvYfU3vbQcsStwH1aDdZHO6KxXG02lb
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:c75c:8ce4:97cf:a279])
 (user=venture job=sendgmr) by 2002:a81:5e43:0:b0:2ca:287c:6c71 with SMTP id
 00721157ae682-2ca287c6ec1mr7584967b3.278.1643219936174; Wed, 26 Jan 2022
 09:58:56 -0800 (PST)
Date: Wed, 26 Jan 2022 09:58:48 -0800
Message-Id: <20220126175850.1904968-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
Subject: [PATCH v2 0/2] linux-user: check read permissions before how
From: Patrick Venture <venture@google.com>
To: laurent@vivier.eu
Cc: qemu-devel@nongnu.org, scw@google.com, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=34IvxYQcKCtMK3CIJG35DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

In sigprocmask check the read permissions first before checking the `how`.

This is done for both: TARGET_NR_sigprocmask and TARGET_NR_rt_sigprocmask

v2:
 * Update code style during code change
 * Also update check order for TARGET_NR_sigprocmask

Patrick Venture (1):
  linux-user: sigprocmask check read perms first

Shu-Chun Weng (1):
  linux-user: rt_sigprocmask, check read perms first

 linux-user/syscall.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

-- 
2.35.0.rc0.227.g00780c9af4-goog


