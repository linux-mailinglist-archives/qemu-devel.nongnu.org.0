Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920433F4008
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 16:37:46 +0200 (CEST)
Received: from localhost ([::1]:49152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHobP-0004Dl-1O
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 10:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mindentropy@gmail.com>)
 id 1mHoaQ-0003Xj-1M
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 10:36:34 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b]:36438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mindentropy@gmail.com>)
 id 1mHoaO-0005Kd-KB
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 10:36:33 -0400
Received: by mail-ua1-x92b.google.com with SMTP id ay4so6606420uab.3
 for <qemu-devel@nongnu.org>; Sun, 22 Aug 2021 07:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=CqA1GoVC6pVPpU4dfQYk+o0yaiOBgEFSKMTzB0m24LQ=;
 b=L6zPnmNd7OLC47iRUXox3JrP8mLS/htd4Btu7elenCIPn40GgzxCnKzIkfyI8hUtPg
 kVO6glKGVXKr7HEUSN3f1qxBQfYKkq24P0TPppGDyGkfHUE85dh35j1Hzlb0ui1acddC
 M5oMkr4fH9m0bx4t+Djc+Yx5vk9tpR789aZdLmaomID6oDzRSDzS2xCAQ+LbN3a02onu
 WVHLoJ+wipvMmtFY3C9M/lWHsxpBPNo3WJ+4alZW5CYYloVUEVlvAAmr/aSsnVjHYtZh
 rmNYmrNe4cGFrEQANXZE7ljk/SxpvZAlRYkI3qG8Bp5qeVE+qYkrV8mQa02jF5awQvSS
 JojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CqA1GoVC6pVPpU4dfQYk+o0yaiOBgEFSKMTzB0m24LQ=;
 b=E+byW96IeVVOyLu+zYydqBDSsNNJHNKblzdPXPU1475TXVp7Uei70UZKtdgELpRoUl
 g/sbLYBVT3z1+WJl2Ir/5xm3WBoahmsIEnsPcQ8lD5F1QGnrI0bU4YADljbszx8Qkqag
 WyHW73rF6P5tsQcJDFO5m4dcsVF6SMVzuq8mwHoZGkonXhN0D0fYeFqv52aVvqwNvq/q
 y4emEk855FKc6HwnLP9Tp4hPqKfJe4ItybjOliOMBvvbkzL6rBwtfSvPWWSBJeRih5xo
 b1NR6ueBvapAv4KBkUFDDrbagrBgTLnt5tD19GusiwO83kjwgtrgUhzxVxsC/JlIt5hR
 uqFA==
X-Gm-Message-State: AOAM530JNkc8O79bItB1V86VlSQ/znj5Mnu6BFp6G7S7bpx/4fA5Le2j
 npWJcx7WfQGwHGcOuAMlJNy2tsJvPkxNMdgmeLSuUfWL
X-Google-Smtp-Source: ABdhPJy96MMZLGxR/t0BKV3ll1VFiEwdRO31B0v6y5TF+XOojT6rb9/MSCUUr0+Sv/C1ya6N7gPTG1Wq52EIC1e0lmE=
X-Received: by 2002:a9f:3e42:: with SMTP id c2mr4645017uaj.120.1629642990661; 
 Sun, 22 Aug 2021 07:36:30 -0700 (PDT)
MIME-Version: 1.0
From: Gautam Bhat <mindentropy@gmail.com>
Date: Sun, 22 Aug 2021 20:06:19 +0530
Message-ID: <CAM2a4uwQ0M=TmFdWaaO-E_2J06fpH1ghXhYJJKBP6s5j90ASLg@mail.gmail.com>
Subject: Testing a microcontroller emulation by loading the binary on
 incomplete Flash emulation
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=mindentropy@gmail.com; helo=mail-ua1-x92b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I am to implement a very simple microcontroller for my understanding
of Qemu development. This microcontroller runs its code from
programmable flash which is bit-, byte- and word addressable. To do
some initial tests of my nascent microcontroller implementation I
would like to load a very simple program binary. Is there a way to
load this binary and start execution without emulating Flash
controller and memory?

Thanks.

