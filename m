Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A40644D7EE
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:14:59 +0100 (CET)
Received: from localhost ([::1]:39246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlAqv-0006n0-JE
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:14:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1mlAoC-00053e-Ha
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:12:08 -0500
Received: from [2a00:1450:4864:20::533] (port=41806
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1mlAnx-000654-Eb
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:11:55 -0500
Received: by mail-ed1-x533.google.com with SMTP id t18so5306448edd.8
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 06:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W5WspFbwrSw0/1ZlfPJP5K9X5S3MYIiQ1ckZHM0xIyU=;
 b=t4Dhoc6dWb2MVgg+eKDt5lLos+4NFL1uFFWkerA3F87EMtQfNQqug655XY5MQhNdAR
 +FaHYht3gycsDYT/jXG41/2YCOataby9+NpK6EbaCOBMm6fuwM9aRFAlQW0TDdK1jIWN
 dzu5HHSHoyKPjb7/2fZBkYMIgGd5ULvvWCcoFOHxSSt7RQFr+O99ccWmAzdhGRjdsQdi
 I19i7qz4/H9LNkxyYfMP5VPf6rAYp3Q0c+8yv8jAPgPLXbe77+I/juO6CbyaOuDpEgOI
 N3FaEFLRtMz6JJsYgWP3bB26ylk7mb6ezy4P8SSpry5IDqp5YUx3Xl80PYHuoYhA8MWJ
 PSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W5WspFbwrSw0/1ZlfPJP5K9X5S3MYIiQ1ckZHM0xIyU=;
 b=3dgadwZGnqwQfa/BVL2P5/l68uywQ/zCIgQltoebhrDh6k90oEYt/zoSMJsps0KA6m
 5Ohbv9OHhsDaqNthtILYv3uKsRVTO5EHRhaly49vCXCL85mlTTYbniaHSCtxuVZUY89n
 baRXaYcwG0Cj2+6mKDQEn41iq7O6u1tif8xTX4RdM2IYnucZ2dDIdrEp+GOQ4NKnNKyn
 uLpY836JWQRjFqAav9/eq5PBwWvCJXubc9UhfZ39A2sgW2lv4lZbnnomCAn4pvouiGIK
 2dMLA5XLx3azqjwIfnLWR0WL3vjKY1t7osL/CyEu6fJDJo0r0BzfHkN6gju9uMsLByig
 VxDA==
X-Gm-Message-State: AOAM533nw27EHMeFLDUzGRt/0xYlPRYtf5l4k4FG7fDS0TDLphngZVIp
 MQDAxm/ReDstWw8Yjow2RAXbjZ56X4ypf0EzD5suj6FysWKKlj1vuTE/xSVa9laiyIFlUUA9Aen
 nysMufXbUIh/ksZY8CwtRH2347n55FPC+0QSnZQVRegfsUzDDndUBksx3SRCURnzwwkS2
X-Google-Smtp-Source: ABdhPJx6NSJD4ruFQR20Gu0mWZmDVQ+D0DAHgtT6/ORWrz0KGE3vy8dNYZCf582fr2/mwXiTp2l0jg==
X-Received: by 2002:aa7:dbc1:: with SMTP id v1mr10393641edt.49.1636639909250; 
 Thu, 11 Nov 2021 06:11:49 -0800 (PST)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id gs15sm1459350ejc.42.2021.11.11.06.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 06:11:48 -0800 (PST)
From: Jamie Iles <jamie@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Fix integer overflows in loading of large images
Date: Thu, 11 Nov 2021 14:11:39 +0000
Message-Id: <20211111141141.3295094-1-jamie@nuviainc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=jamie@nuviainc.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Jamie Iles <jamie@nuviainc.com>, lmichel@kalray.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most of the loader code currently uses a ssize_t or 64 bit integer type  
to store image lengths, but many functions that handle loading return an 
int with a negative value on error or length on success.  Once an image 
exceeds 2GB this will cause an integer overflow and so can end up 
loading truncated images, silently failing to load an image (a 4GB image 
would be interpreted as 0 bytes long).

This is unlikely to affect many deployments, but can manifest when 
preloading RAM disks for example.

This builds upon 8975eb891fb6 ("hw/elf_ops.h: switch to ssize_t for elf 
loader return type") to cover more of the generic loader.

Jamie Iles (2):
  hw/core/loader: return image sizes as ssize_t
  hw/core/loader: workaround read() size limit.

 hw/arm/armv7m.c          |   2 +-
 hw/arm/boot.c            |   8 +--
 hw/core/generic-loader.c |   2 +-
 hw/core/loader.c         | 121 ++++++++++++++++++++++++---------------
 hw/i386/x86.c            |   2 +-
 hw/riscv/boot.c          |   5 +-
 include/hw/loader.h      |  55 +++++++++---------
 7 files changed, 114 insertions(+), 81 deletions(-)

-- 
2.30.2


