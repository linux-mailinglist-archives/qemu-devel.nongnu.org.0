Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9208962340B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 20:59:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osrCz-0007Gx-GP; Wed, 09 Nov 2022 14:58:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rowanbhart@gmail.com>)
 id 1osrCx-0007Gl-W0
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 14:58:00 -0500
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rowanbhart@gmail.com>)
 id 1osrCu-0007Vg-08
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 14:57:59 -0500
Received: by mail-vk1-xa2f.google.com with SMTP id g26so11491904vkm.12
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 11:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+q2V++rgkNU5BWflydBVJkWRlS6SJ+pkG7ua/1FKBL4=;
 b=B849J+5aNMDrdQ2CGSiuxpUyR7LNeJz0v2jnekyKcIzNcItmDvqn0cwFDWP8rz8pGb
 RKFFvzLfiIQvlKWbPuwdziizCy0N3IJJUbiZ7MVT5PWsEEgB6qd0T89mh7l8ED6oWFfi
 Wq4zxlVxq2ePovPGcZgV4MGfJKdyyzIs6eeeBTyuWtEUB4tdrZvEy9WwDCRgHfInQApw
 q0soTjH2lBCP62RLvuaPpuQ4A4fzmC5NnAiZtsQ8ESEdWUCgMRwdAwW5K9rS9TBaCqjp
 wAjd+JtponN034N0DYn117nGWX+ZK6grsBaR5oyPkt3gnqCMc1Z1XEEERmx3Tp59fQuW
 CQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+q2V++rgkNU5BWflydBVJkWRlS6SJ+pkG7ua/1FKBL4=;
 b=Cqqv3PLOD7EfQbsWqG7/VqT1i6vQDm6w8MzAao3XB38nmJJIV9jptq+ax4mDAvrJsR
 Wlf1/zfAZJKOyugXcCbyzpD/NJ2wdEE3RUgeKk6f3bKWh8quvpUpmSu39tLT2zwnWy6d
 pKOYgWW9+7SYNSjwFZKj9UKjqqfcutthKwUn+eHVM9EY0GfWbn+N29ury9pG5cNZEMcj
 r9sV3dOa78nyXfw3IkyD+hlhdBE1pqyoWx69zTE2WkDkjjWWVCnVJSDQSnJcLt6ulYzK
 wI2X6ASVBrojh+bI0ijcmw6GUHBj0avlzj7puUKMwhb3cLzTsZ8xlwQ98IQvhkX5f6ZR
 AOqQ==
X-Gm-Message-State: ACrzQf00SxwGSMrFzSaDIsTaRG6uzlJ8e+OBnYGdOCX0Ae+/1CtjYx+J
 YvI2ABK9CNWH9i4d8NJs2rAumnRRbefr1H6EGfTpETceRUCRgQ==
X-Google-Smtp-Source: AMsMyM4/rOXN7ktpd4kTSDmYrmbhLvi4UHl8wDMBOG3atoMSWOhHoKQk3MocE/soc0fuMjPJYc/+sBK7I6uI2MgTxD0=
X-Received: by 2002:a05:6122:179d:b0:3b6:90df:eb0 with SMTP id
 o29-20020a056122179d00b003b690df0eb0mr13579807vkf.30.1668023874308; Wed, 09
 Nov 2022 11:57:54 -0800 (PST)
MIME-Version: 1.0
From: Rowan Hart <rowanbhart+devel@gmail.com>
Date: Wed, 9 Nov 2022 14:57:18 -0500
Message-ID: <CAE5MsNYXB_yFiD07FXf=KD=Zq74mQ9TCtSMBbZB9U-Vk1DE7Tg@mail.gmail.com>
Subject: QEMU Rust Crates + Plugins in Rust
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=rowanbhart@gmail.com; helo=mail-vk1-xa2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi all, this is my first post to the mailing list! I've spent the last
couple weeks building QEMU Rust crates to enable a couple goals:

- Install QEMU binaries using cargo, the Rust package manager
- Use git-latest QEMU binaries in Rust projects as a dependency
- Write QEMU TCG plugins entirely in Rust

The main crate is https://crates.io/crates/qemu, a thin wrapper around
the existing QEMU build system, using crate features to toggle
configure options. There are also crates for each binary build target,
for example https://crates.io/crates/qemu-system-x86_64. These
crates allow users to run `cargo install qemu-system-x86_64`, which
installs a small wrapper binary with a dependency on the built
binaries from the qemu crate. These binary installs run exactly as a
normal QEMU installation via package manager would, and essentially
just provide another alternative distro-agnostic packaging mechanism.

More interesting (I think) is the crate
https://github.com/novafacing/cannonball, which depends on the qemu
crate and enables developers
to write QEMU TCG plugins entirely in Rust. This enables a very nice
workflow for Rust developers interested in building tracers,
profilers, and
other tooling already supported by the TCG Plugin API. The cannonball
repository has one example of such a tracer that outputs various
events
as JSON.

This is a pretty rough implementation I've hacked together over a week
or two, but I've heard from IRC there is some interest in
experimenting
with Rust as part of QEMU and I'm interested in feedback on this
attempt in that direction.

There's a bit more information in my post about this on cohost:
https://cohost.org/novafacing/post/240422-some-qemu-and-plugi

Finally, I am acutely aware in doing this I've taken control of almost
70 crate names the QEMU project might like to use at some point. I'm
not
here to step on toes, so if the decision makers would like the QEMU
project to get control of these crate names, just let me know and I'll
email
the crates.io team about getting them moved. Otherwise, comments,
discussion about Rust-ifying QEMU and its plugins, ideas, and PRs
welcome,
as an author of a decent number of TCG plugins the last few years I'm
pretty excited about what even this rudimentary approach has enabled
with regards to ease of use and development speed.

-Rowan

