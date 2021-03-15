Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2F233B134
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:33:38 +0100 (CET)
Received: from localhost ([::1]:48288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlTd-00028e-Jp
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vitaly@cyberhaven.com>)
 id 1lLlPo-0008Uo-I2
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:29:40 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:38644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vitaly@cyberhaven.com>)
 id 1lLlPd-0004UV-E1
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:29:40 -0400
Received: by mail-lj1-x22a.google.com with SMTP id s17so15748211ljc.5
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 04:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cyberhaven.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xuQIaVDgUKudLTwiLbHd09i0hAE0rk2itP9np3mziC0=;
 b=RPUmzrXCKy+SXT3yWkJ1wNyZLxE24JewPgtSArMZ5ijPM/JMklNpFHdX98eD4XRvyv
 VNig1K1LWX4Qc9GAPzYOI5jBb7O6EoJA8QpGXLm3TaonNNyv/pP07b3FfruOcqURLGme
 Z9No0Zx3+4v1iGffygvZtjZRWB11IM42RXZkcB3lT/yF21ZxOJJJLrHeqD6VI4qF1N4R
 tjF1RGqlCC2YNZSNrOsIvmL6WqmVEhNXPKdm1IXyGfTnyLz1zXNM9qW9dXk/1VDy3ndQ
 /1Hj7Dba6XAg1ejHGZaY4Ji/JYEPHRBRgxEEsXbaBBRVDBNcQpl/FeZOEEDL504NVdOC
 w1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xuQIaVDgUKudLTwiLbHd09i0hAE0rk2itP9np3mziC0=;
 b=kUPDUi6V6953TqNoWfVBBwQGgEh4G56k33ZkxBDNBg1cxhqzwEGYW2Xx6UB5yzd1aW
 2WlsWbm5at/eDWRUlEvJXy0mBlbqDPTxxQw+4xq1eVMfCBeqgty1yz3/e/SY0SKrDjED
 ESjZsoKHAKBA2oozQtbZrj+/HlXegz9W0DnSfmBqwKknBs6n3lnY1G4tnWIeO2VirDLG
 VsLxUE9H3orlZgj6LMt+BOwmkemlkf/ZYM9RKjU4QJBWzDyEqMadC+3LWMpsgb7b0S/a
 v9N/G09LfS0rXTGdGfpbsWPWCM4OnnszoVfutMUKGDYzJvxm5WjvmLqkf3BkfWvBOZtf
 +z7w==
X-Gm-Message-State: AOAM530Yd+yeUgsRamZ5yjU7mZv3HJbhRjwqbVc9RMNdyHlROdCuGvUI
 rQfISsCm0S96sO1NlZVUKMPEN/KzDRgUdwfcwnSfUw==
X-Google-Smtp-Source: ABdhPJyuCGvdeUxDweBfynYmrTAJVVFvpLuk/aAPV0UZUEJymczjRq2IYCzf0jPWEkKdI7oKIwKnUoxxYy/E2qiudD0=
X-Received: by 2002:a05:651c:506:: with SMTP id
 o6mr10649996ljp.262.1615807766968; 
 Mon, 15 Mar 2021 04:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210314122314.3201195-1-vitaly@cyberhaven.com>
 <20210315072150.rst46y4l23box7jq@sirius.home.kraxel.org>
In-Reply-To: <20210315072150.rst46y4l23box7jq@sirius.home.kraxel.org>
From: Vitaly Chipounov <vitaly@cyberhaven.com>
Date: Mon, 15 Mar 2021 12:29:16 +0100
Message-ID: <CACjSjcvDNZccKCAeQ5d_E+EiB+5pkHByi7wJJYA+NKhreqqHBg@mail.gmail.com>
Subject: Re: [PATCH] hw/display/virtio-vga: made vga memory size configurable
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=vitaly@cyberhaven.com; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 8:21 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Sun, Mar 14, 2021 at 01:23:14PM +0100, vitaly@cyberhaven.com wrote:
> > From: Vitaly Chipounov <vitaly@cyberhaven.com>
> >
> > This enables higher resolutions.
>
> No.  virtio-vga supports higher resolutions just fine once the guest
> driver is loaded.  The video memory is used at boot only, before the
> guest driver is loaded, and 8MB just for a boot display is more than
> generous.
>
> If your guest has no virtio driver use stdvga instead of running
> virtio-vga permanently in vga compatibility mode.

I tried -device VGA,vgamem_mb=32. I did not see any resolution above
1080p on a Windows 10 guest.
virtio-vga has many more resolutions available, it was just missing 4k.
I have the virtio-win-0.1.190 driver pack installed.
I don't use qxl, because it makes the Windows GUI sluggish for me. I
don't have problems with VGA or virtio-vga.

Best regards,
Vitaly

