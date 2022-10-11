Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC7A5FABE0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 07:23:24 +0200 (CEST)
Received: from localhost ([::1]:37522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi7jf-0003mI-GV
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 01:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oi7dj-0000A3-D7
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 01:17:19 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:36765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oi7dg-0005hz-Ky
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 01:17:14 -0400
Received: by mail-oi1-x235.google.com with SMTP id y72so8079416oia.3
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 22:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MnlJJQ+OTZgC3sli8LWwnmi9LDzvjZgsISyb9OT3Rjs=;
 b=E6hhy8EDuZQCwyhQ1vcGJeL9Q+9XCyRZsymOnGhU90blhE8PqN0c2qkjhZqewxT4JR
 glGNTOBF1Iw2PVsghEs+l8PsENs9oTyMYvRa5XZhZ0YpcPPTjTnocy8Ee7eWqjEBQSF1
 4i72wtjvgt8VuyH4ZTctfRJKfh/NcDxtJhmnsvRUF7kp8iYXLVYrTbypKuBMfE8dRDjS
 mqu3cBhYcazVIM1bEP5KvBgFwMcOnK8BE3Ff7Vtck5C9Sl5U6kv34oHdiOC2L000V8KG
 YV/l2HfsUzmI2Iiy6oAiAFL45D9TpgR9VtJyGdNAbAgwUtXRWU2mEUn7E6HUST6VGdri
 b7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MnlJJQ+OTZgC3sli8LWwnmi9LDzvjZgsISyb9OT3Rjs=;
 b=uVfbOust808X+ui1dOzw4g5rc25qdemM/YhsiCiW+7u0wMc0xDK/WNb9Vu0BS5K5N0
 nBfkphnCLm+Q5lGsNlgls969G9gRN254FkfZidNIb7JIeSrEx4mQnU7BYFUXoN2h67qf
 dU54FVvbXnAxEdS/LtANUbn0kZvHPoPJr6fcWKMvVE8aC3VvPDRfjVtTKgioTe2birKw
 7lnTKx0DQ4+e7OFvDcRc9JW3n5CEpJo14jYcqAz7KpF4/aWhvWaVoaMZeZ+KoxsI3XeB
 wslCpIpSNHH6dTuE77+DXyDksRpO3+vZiNcHex5dnex4oTq0gjw4LRtvxPAypEsVzRW5
 24mA==
X-Gm-Message-State: ACrzQf2P1hfZ0ZGOYLa05yfF3fsHvW2PjlVn2mzzwx2D7RQobArh80PT
 a6aMtQUM7lXbXR0tlUKGfEXRdlVCTnt9c4Wp0LWaKSyHCb8=
X-Google-Smtp-Source: AMsMyM4mwO+qYUSxx4F6l/ig5bb10xLGA+EOw6uc5diLEt1zwrohqz+D22Fy2zv/dIjjVZxeB/AXNlEVssla54A9ccY=
X-Received: by 2002:a05:6808:1244:b0:353:c8f3:9928 with SMTP id
 o4-20020a056808124400b00353c8f39928mr11101188oiv.152.1665465427437; Mon, 10
 Oct 2022 22:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221003041440.2320-1-jim.shu@sifive.com>
In-Reply-To: <20221003041440.2320-1-jim.shu@sifive.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Tue, 11 Oct 2022 13:16:54 +0800
Message-ID: <CALw707rXdhbeYiWQTb-fGDR56CfnzbY7eoacLS8hKvgded+Kew@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Enhance maximum priority support of PLIC
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, chigot@adacore.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=jim.shu@sifive.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gentle ping.

It's a patch for fix and spec alignment of PLIC.


On Mon, Oct 3, 2022 at 12:14 PM Jim Shu <jim.shu@sifive.com> wrote:
>
> This patchset fixes hard-coded maximum priority of interrupt priority
> register and also changes this register to WARL field to align the PLIC
> spec.
>
> Changelog:
>
> v3:
>   * fix opposite of power-of-2 max priority checking expression.
>
> v2:
>   * change interrupt priority register to WARL field.
>
> Jim Shu (2):
>   hw/intc: sifive_plic: fix hard-coded max priority level
>   hw/intc: sifive_plic: change interrupt priority register to WARL field
>
>  hw/intc/sifive_plic.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>
> --
> 2.17.1
>

