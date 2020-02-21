Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BDC168772
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 20:33:36 +0100 (CET)
Received: from localhost ([::1]:35500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5E3L-0006wW-H0
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 14:33:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40266)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1j5E2Q-0006QJ-Si
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 14:32:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1j5E2Q-0000xg-0E
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 14:32:38 -0500
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:36692)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>)
 id 1j5E2P-0000wx-Sr; Fri, 21 Feb 2020 14:32:37 -0500
Received: by mail-qk1-x744.google.com with SMTP id t83so2920963qke.3;
 Fri, 21 Feb 2020 11:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=69qEiYN9UARFutxF8nAG/RaQ2+JSdxzdVa6xcpbOCik=;
 b=UQl5s5F5zgQdVzue+znascwMTF8Dz9oEnL5ZHKG4PNF9ZxvPuK/e8++aLTXKVVP4Fr
 D5gpGJPEew0pbOJyqjuG1qnwvzBmiwiezWvGspx8USI9BpqzueoyKqraMcv+vQswM+xu
 tp94kB+zY94mhtMY2gzrU5LXwmqeqe1xnK7yLFsX1DYImjGSeIDvmnMe3esidu9VoEyb
 62Bc5eHIJpUO2wjsdz8ilm8VzKgH2QnB+s3RlQ8z6VOB8JLExW1MFtuev9nOXYrVCkpZ
 8jBfLosGtCWE3DwmYoIQ8G5FUsuxW2+j5X5OjRYugLtfqw5RoA5z7OwbdRU/oaQkBWe7
 0jyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=69qEiYN9UARFutxF8nAG/RaQ2+JSdxzdVa6xcpbOCik=;
 b=qNx385B65l47aV2fXmxh1MUS5QgrWfSySEBSdzNwRLv9kCTKBQNmupZhnOAn4JSJBQ
 oiKXC7RGJqHv9z+iDZhgAcCpMDqj5H8Z42AlZZkSSYAZn6TWWlrQ4MZ0Gl1Hy/1cJewh
 B7ld7gLbUH0UFSubJnRcX2iisytEGZezWF15tNgptusfut25GvfNA8DLPsrOElLqoECF
 AwR82s5nzwIva3g0KQ/JNy4qG8miTVxOymXwLZf12lWTRnNLhPm/h4PsjlQcoiG6Pi4q
 vdGAdRTJKBEU1ofjhaXp4hbhkzUOV4qVPR4On8lJy4vFZKW09wzyfJjUAjjbVzb4Id1e
 I7UQ==
X-Gm-Message-State: APjAAAX6CXW1+5C0lOmrLLct+ZLEXWKSvay7AdU/ug6VzqFufS2inm/R
 eahzAE5EK3FRXXaxLAzYGQZ2nfxKxt3i/oGS8Rs=
X-Google-Smtp-Source: APXvYqwfMPcl+AeQRpG8qmwU0vuQf3xaQUfAE6BF/oF/323tH6AXTw4P0zzOs1aUjHazssMOXh05RZl0Dshke2AJ+Xc=
X-Received: by 2002:a37:e55:: with SMTP id 82mr36008071qko.370.1582313557161; 
 Fri, 21 Feb 2020 11:32:37 -0800 (PST)
MIME-Version: 1.0
References: <20200218224811.30050-1-andrzej.jakowski@linux.intel.com>
 <20200221134555.GK1484511@stefanha-x1.localdomain>
 <e8aa39fd-b5eb-8ed2-445b-02cce3301748@linux.intel.com>
 <CAJSP0QWXsZXBr_iVJp11FHYYj2Zb1NU62vA6kaR36mOH9B8abA@mail.gmail.com>
In-Reply-To: <CAJSP0QWXsZXBr_iVJp11FHYYj2Zb1NU62vA6kaR36mOH9B8abA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 21 Feb 2020 19:32:26 +0000
Message-ID: <CAJSP0QUFJoBANYO0=42vfcPS8MUZJdKab=g88cpVW6oD_UoV5A@mail.gmail.com>
Subject: Re: [PATCH v1] block/nvme: introduce PMR support from NVMe 1.4 spec
To: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::744
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
Cc: Kevin Wolf <kwolf@redhat.com>, Haozhong Zhang <haozhong.zhang@intel.com>,
 qemu block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <keith.busch@intel.com>,
 Zhang Yi <yi.z.zhang@linux.intel.com>, Junyan He <junyan.he@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Andrzej,
After having looked at the PMRWBM part of the spec, I think that the
Bit 1 mode should be implemented for slightly better performance.  Bit
0 mode is not well-suited to virtualization for the reasons I
mentioned in the previous email.

The spec describes Bit 1 mode as "The completion of a read to the
PMRSTS register shall ensure that all prior writes to the Persistent
Memory Region have completed and are persistent".

Stefan

