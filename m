Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044AC55A3EE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 23:50:30 +0200 (CEST)
Received: from localhost ([::1]:60436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4rC9-0005XB-2q
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 17:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r99-0002bX-7Z
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:23 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:37681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r97-0007Um-BT
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:22 -0400
Received: by mail-io1-xd30.google.com with SMTP id h85so4031698iof.4
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 14:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rlVCbX0G0c18zZ2OLMLh/NfmjEai5rSDTy0njSdMwAE=;
 b=0txoSJHbJJdz4OskXnoG2YJrILMcJcDHXa3OMmffaF+GFIUYp1BfdS6Ia6AzRAYZ/u
 0VUWk8oktt5fkr0aW6qn4sKxG8loTVSsZs1v6ilusYcnQ0a03LaS1e8XlxvoHNely9Ia
 hKoBjeEOJTOCOCw3mB/VgpAXqFPRY25Fq7za+yX0hODvilCuoCh7zZ5ptpNYQuPttcpk
 Uu8Fv4kN8a7zF+MIpRi6XaBeGdSbcDXWEBmk4PeXE7PyeOUXZCDPnSXjOS0eXpWGhf+1
 e41eXfMEgyf88cGWOxDs9b8x/sXKI/Uh/0LuxGx/a0938gQS0DVItSQ15pX3ixN1A6V6
 9H0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rlVCbX0G0c18zZ2OLMLh/NfmjEai5rSDTy0njSdMwAE=;
 b=iXVGVqcVgnlMIk6oeDFWVxnEa4BZ8KrWFEw84kUO9wlX4uVP1+/h0JsDGjDuyElsWW
 I92eGEcZfrrGH7Xi6V/p/JlqhWAGBY8zF5ABvqC3hxBx1uorHfyS4pIPEwcg8ytKBXM/
 2XZQ17X86y4M2xop5CDV1WnS346/TIn2W54DWCTvKCyNdZ+V+wjPUZB8weGUXfiLjfQG
 ya0xBM5ZV0EojCeymEw0lLDz/6q48fZm/SxJ8zNpOFpVq4Tt0pIU/d0m6xLjLmV0/t4k
 dJs/kVwCm87q8q4c0XINODF+c1TxMwv/Z1uu9M08JmJDia9Z3FwadpQeyZoElQ8eehCr
 X8hg==
X-Gm-Message-State: AJIora/Ut1u+kDdzE3bqdABUao3+yKv11gjNOj3FJn7QMGvYh214CHPI
 YS7uIXjwCR5l3R4QpD4Rw7FzW2J2k9zAjQ==
X-Google-Smtp-Source: AGRyM1umtTsyTEO8VMrgmslkFSOD8E+paU5ulrojwVvun2uGwaT4sBVp/dIxu7fhaX6QC39cyhz+mg==
X-Received: by 2002:a5d:9948:0:b0:669:a41d:6ee8 with SMTP id
 v8-20020a5d9948000000b00669a41d6ee8mr538235ios.24.1656107239207; 
 Fri, 24 Jun 2022 14:47:19 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q45-20020a056638346d00b00331563be3ecsm1553561jav.121.2022.06.24.14.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 14:47:18 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>,
	Warner Losh <imp@bsdimp.com>
Subject: [PATCH v2 00/11] bsd-user: More file-related system calls
Date: Fri, 24 Jun 2022 15:47:31 -0600
Message-Id: <20220624214742.89229-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

A second round of mostly BSD-independent filesystem calls: mount, unmount,
nmount, symlink, symlinkat, readlink, readlinkat, chmod, fchmod, lchmod,
fchmodat, freebsd11_mknod, freebsd11_monodat, mknodat, chown, fchown, lchown,
fchownat, chflags, lchflags, fchflags, chroot, flock, mkfifo, mkfifoat,
pathconf, lpathconf, fpathconf, undelete.

These are all non-reentrant system calls, so these wrappers are pretty simple
and no safe_* versions need to be created.

In addition, a small correction to an earlier series is included.

V2: Updated with review comments.
    Reworked freebsd11_mknod* stuff after unifdef BSD_HAVE_INO64
    Fixed comments that had too many words
    Added one more hunk to remove a stary 'inline' that slipped through earlier

Need reviews on:
       bsd-user: Implement symlink, symlinkat, readlink and readlinkat
       bsd-user: Implement freebsd11_mknod, freebsd11_mknodat and mknodat
       bsd-user: Remove stray 'inline' from do_bsd_close

Warner Losh (11):
  bsd-user: Implement mount, umount and nmount
  bsd-user: Implement symlink, symlinkat, readlink and readlinkat
  bsd-user: implement chmod, fchmod, lchmod and fchmodat
  bsd-user: Implement freebsd11_mknod, freebsd11_mknodat and mknodat
  bsd-user: Implement chown, fchown, lchown and fchownat
  bsd-user: Implement chflags, lchflags and fchflags
  bsd-user: Implement chroot and flock
  bsd-user: Implement mkfifo and mkfifoat
  bsd-user: Implement pathconf, lpathconf and fpathconf
  bsd-user: Implement undelete
  bsd-user: Remove stray 'inline' from do_bsd_close

 bsd-user/bsd-file.h           | 392 +++++++++++++++++++++++++++++++++-
 bsd-user/freebsd/os-syscall.c | 118 ++++++++++
 2 files changed, 509 insertions(+), 1 deletion(-)

-- 
2.33.1


