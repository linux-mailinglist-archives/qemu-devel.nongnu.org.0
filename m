Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28706B5FD3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 11:09:25 +0200 (CEST)
Received: from localhost ([::1]:56296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAVxj-0000md-Vy
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 05:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46311)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <i.maratos@gmail.com>) id 1iAVBL-0001zw-NK
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 04:19:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <i.maratos@gmail.com>) id 1iAVBK-0005f7-ML
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 04:19:23 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:42352)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <i.maratos@gmail.com>) id 1iAVBK-0005e0-FG
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 04:19:22 -0400
Received: by mail-lf1-x12f.google.com with SMTP id c195so4990023lfg.9
 for <qemu-devel@nongnu.org>; Wed, 18 Sep 2019 01:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=f+/mTsEKdtvDNH0uPjSuI9MN5hmFW2IdVLVORRmJWfk=;
 b=K0GrL65rO2jc9zF3RMIfzs3yIlsB9PH6ahEhheMSOEalZnzHTH9qTX68SOsi4mwEXj
 14bI+6Bk4qSCnCY+rfj8fmHtGvMotrJfS8HP840IRl46wszble/Bi1899EB2qui9fe/8
 /Js1XyQwIT6T+5Dtt4upuSct5SYPYbWroRJgdLBdM4U0w3NtHWiVr17VHDhuZ5trjv33
 AoIlZx7EmQVdQC0Mfyf6e+HRBbB5rnp/Uc7o2Nr73eIJCdf8i93RtziqqjKK4bmbTSNj
 g7ECbzOWAoESEZAo+i64c8pNCkfczvGWZh1AOyP77mTB79tmdy5npKLJvobna1I5rJ6p
 ZkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=f+/mTsEKdtvDNH0uPjSuI9MN5hmFW2IdVLVORRmJWfk=;
 b=SDy/ZELmbxZqVf41eSgEvPGlt/1+P0gO4yv/pJC04e6K8zVRI4DeB9QF4CkhYcXE1b
 jazqIRWegFBlLyeB6yveF3LbF5WaxW5AQ/KEDOvU9bB/JdvTJG3p4xqNemPIzqq27hYM
 JYD12aWN/cAX3J8exH4JDUrONPI2M3AfU3ezmBh9XQrn/9oLqCdql+LLdIe99M9n8yoM
 103uWA/8GBUyynNmdnGXIcZlNLkuJS3HZehgc4FHpjYB3fE5aKpbJ8ubDTkxz7Bt9wuZ
 eslQux8ae3f5+1Ct0x8UNsV0dWoX7tHhoUnYGjUjfU266WDMcMidM+rBbAwItFGbEbHQ
 vFHA==
X-Gm-Message-State: APjAAAWas5VM1Y2DZ+0NHpYi6scj+AUK3bfB3KktwnZFL0sBy57SC6U6
 8sB5+bbaop4i9TTzl6J3IUOVvgaPgwwCdo8/UzK1mA9C
X-Google-Smtp-Source: APXvYqxHBqJSsp1aWgCNznKuLmZ9/qSa4wq2tW2VOOj1zcx+5IpZJihjvn6e4zyUXXPvD9q9k/xwcejDuubxdi2lTmY=
X-Received: by 2002:a19:c191:: with SMTP id r139mr1400298lff.23.1568794760382; 
 Wed, 18 Sep 2019 01:19:20 -0700 (PDT)
MIME-Version: 1.0
From: Ilias <i.maratos@gmail.com>
Date: Wed, 18 Sep 2019 09:19:10 +0100
Message-ID: <CANP-_LDVvnbXnk1GpNRbQ3zKBsh-z6_w1qn-t9LKbtGEEKUV-A@mail.gmail.com>
To: qemu-devel@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::12f
X-Mailman-Approved-At: Wed, 18 Sep 2019 05:08:03 -0400
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: [Qemu-devel] qemu patches
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

Hi,

Your recent patch

https://github.com/qemu/qemu/commit/12e9493df9242a2051701e7eb64175d4e904acba#diff-d98f9b48cc332d226892f0db74a86b87

to the file

target/i386/whpx-all.c
<https://github.com/qemu/qemu/blob/master/target/i386/whpx-all.c>

breaks compilation when WHPX is enabled.

Please add

#include "hw/boards.h"

to the #include section of the above file again to fix it.
