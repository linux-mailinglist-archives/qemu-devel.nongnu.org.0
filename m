Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE8B68FB36
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 00:33:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPtuU-000395-GZ; Wed, 08 Feb 2023 18:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pPtuN-00038a-6B
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 18:31:23 -0500
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pPtuL-0005ps-Ja
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 18:31:22 -0500
Received: by mail-qt1-x82e.google.com with SMTP id m12so210531qth.4
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 15:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y0VoMb5LKRZn1sREeyuooTRGjooxlrZhXzYyToK86h4=;
 b=aJ7Ot9QqokvZ5YpXBWlG4++vePcWke7iZ/r2q6k4or7UQb+8x0wEP8N2cY1uglJ/BB
 /qLz4BWw3xC9mC28dkyPPHQH76QCeDMnUyVyiwshy+ZQ1My59xbO8cPOmYROFK6XyKZs
 knx4bdqxwlHnzskULD0Q1kPz1ldDB0a4UAtJa4vPja+ceaYH2iAy/y/ZfpJNmmtrf+C/
 0WPDWUmA6J1DX5Jb3IerzIXCwyb0X8th2gIWFXQZI4T2QJHdlyf6bIdSIFSggki+WnRq
 DnZYdKW1C6aQ+zaTZJXNPQDJv7VC6ffEIQzMBKBSkDIP+EPWNTSF1XMUAGpt5EDd/Z44
 AqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y0VoMb5LKRZn1sREeyuooTRGjooxlrZhXzYyToK86h4=;
 b=L+f0Lagkmy+unSGrTSfFqXK1kfqjTloLkCjTK0e2dCqWdB18ANkyDu2+bPHHG5tkg/
 LgxjxKhC7igmWp7F2Xe2YwxMBogAh1tTNPyIp5MB3zl5ZKUbr1Uvvd0MZUJQ3/GoTJaG
 rw4L1mx9YWGIZn6a+9YjZZd9HGg/urf76gsSyQ7Tafn8hh8y6qt4jopUhhfyDgZW9DmA
 1aP9lWSqHVOfOmeoFK7nZkDbmG4pBXNBBHaeoswXEgALnW4QAGSCWG3ISyt7/S2kDzOS
 PJEK++J4YkzKdxla6NsdrJMolI9e1eEh1e+b/W1IBwCqApxA9Ob4+34HnBWopfhAxr6p
 uRng==
X-Gm-Message-State: AO0yUKX/SJLQoWXo9Lkrr6Iqpqv2MKg9eoUgPuEh7QNz47IE5nNf7dhQ
 PC5wJEwLuboiBfYn4c9cuKQe3V03Ghs=
X-Google-Smtp-Source: AK7set82dujN+J9HF5hw2OcHPizFmhuUbmIIiO3Anpw0jsBKGICw9r2uBefrtvsBr22HxvfR+Pslcw==
X-Received: by 2002:ac8:7f0e:0:b0:3b4:d5be:a2e0 with SMTP id
 f14-20020ac87f0e000000b003b4d5bea2e0mr17046103qtk.20.1675899079023; 
 Wed, 08 Feb 2023 15:31:19 -0800 (PST)
Received: from debian.hsd1.ma.comcast.net ([2601:182:cc00:77b0::2bf5])
 by smtp.gmail.com with ESMTPSA id
 s63-20020a37a942000000b0071c9eea2056sm168048qke.14.2023.02.08.15.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 15:31:18 -0800 (PST)
From: Dinah Baum <dinahbaum123@gmail.com>
To: qemu-devel@nongnu.org
Cc: Dinah Baum <dinahbaum123@gmail.com>
Subject: [PATCH 0/2] *** configure: Add 'mkdir build' check ***
Date: Wed,  8 Feb 2023 18:31:09 -0500
Message-Id: <20230208233111.398577-1-dinahbaum123@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=dinahbaum123@gmail.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

QEMU configure script goes into an infinite error printing loop
when in read only directory due to 'build' dir never being created.

1 - Checking if 'mkdir dir' succeeds and if the directory is
writeable prevents this error.

2 - Since we exit early on error in (1), code for reading in
arguments has been moved before that

Changes since v1:
- Fix review comments from Peter Maydell 

Dinah Baum (2):
  configure: Add 'mkdir build' check
  configure: './configure --help' should work

 configure | 691 +++++++++++++++++++++++++++---------------------------
 1 file changed, 348 insertions(+), 343 deletions(-)

-- 
2.30.2


