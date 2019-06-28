Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915BF5A55C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 21:49:39 +0200 (CEST)
Received: from localhost ([::1]:35974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgwsM-0002Vh-OE
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 15:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34392)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <danielhb413@gmail.com>) id 1hgwoP-0000cG-Gb
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 15:45:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <danielhb413@gmail.com>) id 1hgwoM-0000vy-Nf
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 15:45:33 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:36858)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <danielhb413@gmail.com>)
 id 1hgwoK-0000sC-EI
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 15:45:28 -0400
Received: by mail-qt1-x843.google.com with SMTP id p15so7681995qtl.3
 for <qemu-devel@nongnu.org>; Fri, 28 Jun 2019 12:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1SwVU18ARN5GY7vLoHwvz2yEvR6Sr/nDSSFaZ3x64xA=;
 b=XtH45xt3dhrCnGi1TJNjh68R29f6n8RjPT76fxfhnLMaVIAUc+bsI4XXg8VLoghy84
 DV6VID6TCbPk4lVz+Y9tFW1oJzcj55qjJaAs3v1iG50O3GX/Dn28Y/NlXLmyqA74LpbG
 caecqa5GD07eaSUTGo96DUuCYqHjm9jpSOnwKra0jTCITkcjOIb6dUszcAeoIjytqGd8
 DHoCDwcIBcSUW1fwSf98ta5viCRbAMuzd4rJNon/Eh7DlTomNZeF0EDcCv+hetZJda6b
 8X4qjUTy5oxFHptG9uYO3zn89B//tHiwL6Vz3rotRR6W3Bz9pXVEn2/zxEFQEnN8KTr9
 3mcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1SwVU18ARN5GY7vLoHwvz2yEvR6Sr/nDSSFaZ3x64xA=;
 b=DllfyTZgrcp0k7i0LkNFROPUfcmjapTxbTFsxEWkPY8yj8NXezsY6CJ0+pUxC5KVOs
 P9jVy8SUhk5qAVPasXGHN0LSnoRiyk6vbOSSK7oGm6w0DtmntkQ1YZnifoMkU7xGCynM
 HlqL6j2wG8EOwugwo0DstN5CDicfbHn/EGcutzxtwB7x6YZW1pc3t1LPnOM6G2xD9+rY
 tmRZPDlklmk+o2uOFfMjbdRj3LKDU2NLjdyOj3Wl1d92VFRxWHWRGVghIb3xb6jBynEM
 wSPcaFtABSeZwiyG5uDffHheyiKhAJZqpoNOrlD6OfMhOENpi7ePa2yRo6ofZnlY2CcH
 4kJA==
X-Gm-Message-State: APjAAAUyxloNV7BkgQo3r5+yBwr2OhowgR4tKRSNjSca3z0tCooUiypx
 jUJNTQ5d8DRXLj+u1ZNZoLVQ6xeP
X-Google-Smtp-Source: APXvYqxH566JMWkaqkqCaJvTqMxpJdSbXdKEKHYd0A7r0icxp1GTUsvxEdAXHw/JEzHf1UbZstS95A==
X-Received: by 2002:ac8:32ec:: with SMTP id a41mr9776030qtb.375.1561751123768; 
 Fri, 28 Jun 2019 12:45:23 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:927e:501b:7135:21ca:8a87])
 by smtp.gmail.com with ESMTPSA id b69sm1602288qkg.105.2019.06.28.12.45.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 12:45:23 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 28 Jun 2019 16:45:08 -0300
Message-Id: <20190628194512.21311-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::843
Subject: [Qemu-devel] [PATCH v4 0/4] delete created files when
 block_crypto_co_create_opts_luks fails
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
Cc: kwolf@redhat.com, jsnow@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>, berrange@redhat.com,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes from previous version [1]:
- added an extra patch including a new qemu-iotest to exercise the fix


[1] https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg07159.html

Daniel Henrique Barboza (4):
  block: introducing 'bdrv_co_delete_file' interface
  block.c: adding bdrv_delete_file
  crypto.c: cleanup created file when block_crypto_co_create_opts_luks
    fails
  qemu-iotests: adding LUKS cleanup for non-UTF8 secret error

 block.c                    | 82 ++++++++++++++++++++++++++++++++++++++
 block/crypto.c             | 31 ++++++++++++++
 block/file-posix.c         | 28 +++++++++++++
 include/block/block.h      |  3 ++
 include/block/block_int.h  |  6 +++
 tests/qemu-iotests/257     | 67 +++++++++++++++++++++++++++++++
 tests/qemu-iotests/257.out | 11 +++++
 tests/qemu-iotests/group   |  1 +
 8 files changed, 229 insertions(+)
 create mode 100755 tests/qemu-iotests/257
 create mode 100644 tests/qemu-iotests/257.out

-- 
2.20.1


