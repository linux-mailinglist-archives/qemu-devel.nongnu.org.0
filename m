Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1546365B8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 17:26:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxsYy-0000uU-Jx; Wed, 23 Nov 2022 11:25:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oxsYs-0000tc-B6
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 11:25:22 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oxsYp-0006wW-RT
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 11:25:21 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-3a7081e3b95so75230837b3.1
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 08:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eqkorhGH7GJn0qqSGgD88WUh1DwHY4TNhG0P/7q0XEc=;
 b=WG6HSBF+iuyll0lvZB7qvaUWP3OP6GaBsthcGqAMFGxju2IFx6RvPM3CZNH34skTn5
 0q8SaQOEgs+k1Xz+Fye4lZV4b5pg8WadnK6PTO86uS8URo91YbLEi7C7Ary/RgxNwQcN
 azKdUxinwc7kqpZipKGqykeh4KxijHjsKC+TRNdffUF7nTo2DNuVcXVTCbeEn76gww+T
 rJTckbYjDADfZMZ2L83J9buus7TH2Yrl/Jsdjxzbtkm0IFoDK9LnuzBoOjAmrr10+pTD
 36ih8ox6l4mcCJsQBRJNrE3vI+P8FITNyc05MzDWVyB2zBwiIok0y+gr/gaUHXhiJKIW
 vrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eqkorhGH7GJn0qqSGgD88WUh1DwHY4TNhG0P/7q0XEc=;
 b=DyoKzRuHn1+wRFIDDEiSe5xChKk3METqt7Zpgm9BWae6m08DEbynd52jPTcjr+vuP9
 nAdlCgB4FwO0wrs5R9p1J/s+NkZ+4NExAknUfAidI+ZtzE+Jq/cWDdxPslgUEU5uLIiT
 jW7d7gKCyeZWZttZQ6fAXiS9bghfEgVi5fWOMbIb6ccVY1SBhHGhakrEbRtKl9yiuQ9W
 8fqoT1qV4fZY1t+q5ZLB49gvi77S4GsHdgE/PhuNXOkCVZPnJfHdgb6wTgdF+kgCHSkB
 IwWgwNHlDh35IeGk7rJN0qjx7VdDjZZQncEFzYqIvZWan/SKhHRGNQJl6TrK2Z4Cp1My
 axWA==
X-Gm-Message-State: ANoB5pkPBGfyz7BciV7P2rHvlQ7AqGkzEXRgz/yxztmJbAJAXFAkg653
 Kwe5Peq45wKiK8h9m0/biUrHCLq2/ru0eMrlRPY=
X-Google-Smtp-Source: AA0mqf52GJ+Av/rTmA4Y24SW2dqtPD8f2zz0LXVWrfCfMq2yJGe9BO3u8Ej6qzBKmaaMnleTTs8CTA443yL0OOZ1J6I=
X-Received: by 2002:a0d:e807:0:b0:391:a199:fc13 with SMTP id
 r7-20020a0de807000000b00391a199fc13mr18662830ywe.62.1669220713308; Wed, 23
 Nov 2022 08:25:13 -0800 (PST)
MIME-Version: 1.0
References: <20221117064444.20648-1-faithilikerun@gmail.com>
 <CAAAx-8JHmxe=9GuoZ+T1yqtLrrzk+-6_HL5EJ6LBJ+twOKp8sA@mail.gmail.com>
 <CAJSP0QX3j9SbKW7tL6_vc9Ru518qWEG=288gkd+ArkHF05Vgsg@mail.gmail.com>
 <ea14c43b-a740-3ac0-622c-1b6360565946@redhat.com>
 <CAAAx-8+m17O076MPzpQAp9Q-O+_pD9PwUNmXkRHxaSY2EedTvg@mail.gmail.com>
In-Reply-To: <CAAAx-8+m17O076MPzpQAp9Q-O+_pD9PwUNmXkRHxaSY2EedTvg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 23 Nov 2022 11:25:01 -0500
Message-ID: <CAJSP0QVqgaAMefrMfppRRmgimZpibAmiSsV7aLRE4tUUBivZCA@mail.gmail.com>
Subject: Re: [qemu-web PATCH] Add a blog post about zoned storage emulation
To: Sam Li <faithilikerun@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, hare@suse.de, 
 Paolo Bonzini <pbonzini@redhat.com>, dmitry.fomichev@wdc.com, 
 damien.lemoal@opensource.wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1136.google.com
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

Cool, thanks for posting an update.

An short introduction would be nice before diving into the details of ZBDs:
"This summer I worked on adding Zoned Block Device (ZBD) support to
virtio-blk as part of the <a
href="https://www.outreachy.org/">Outreachy</a> internship program.
QEMU hasn't directly supported ZBDs before so this article explains
how they work and how QEMU needed to be extended."

Please include a sample command-line so readers have an idea of how to
use ZBDs. Something like:

"Once the QEMU and Linux patches have been merged it will be possible
to expose a virtio-blk ZBD to the guest like this:
--blockdev zoned_host_device,node-name=zbd0,filename=path/to/zbd,cache.direct=on
\
--device virtio-blk-pci,drive=zbd0"

If you want to include URLs to the patch series, lore.kernel.org is
good for linking:
- https://lore.kernel.org/all/20221027154504.20684-1-faithilikerun@gmail.com/
- https://lore.kernel.org/all/20221030093242.208839-1-faithilikerun@gmail.com/
- https://lore.kernel.org/all/20221110053952.3378990-1-dmitry.fomichev@wdc.com/

Stefan

