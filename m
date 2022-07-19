Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E3F57A448
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 18:42:59 +0200 (CEST)
Received: from localhost ([::1]:51466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDqJF-0005FM-RD
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 12:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDqGt-0003Y1-RN
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 12:40:31 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:36543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDqGr-0007iO-Pi
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 12:40:31 -0400
Received: by mail-yb1-xb30.google.com with SMTP id j67so4881906ybb.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 09:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p8F4+4sIM63Eqtgbe033N4cA2P6/BGXwhiHaQfXEub4=;
 b=iBlH/jMl44q3IYaKgEaOBMHprPJ4kqo66T4M7rTWDwPPKtCXuX2O8LVwWfm63a0ooa
 +dy7XSEijEAZZALCo+WhO8IdHUZhPQ8+dPMMbSUb0S4Ms8nzumPFwEi29bZk2ZbkaVbh
 Nc31JBeN36BnQqx5tsMNlGl1E9yPHbsL14qsfpYHB9u4XBJUywTk0D0xTnl5vfjrKHmL
 frU+rweKad07xrBvihIN55XoeiuI7IJ1BWvjDyRAOvstdjnTwtW5Jk3Jch0znrcnQPdn
 ZnKh5xz2Fq1Nm5YkJDcsSXiGGoKlUTGsZHMeXCUJxRx0OmYCdVssudpbWVqgSkVgjJNd
 oagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p8F4+4sIM63Eqtgbe033N4cA2P6/BGXwhiHaQfXEub4=;
 b=xabOvdskv2QYdx1Qj/eO2Ic2jVxOkkFCkEH2u3ev4icPhBowZuk597/XzL0lpFwtkO
 aRwyNpFTxDmb1pwf+qGQs5lYJErkes7CGoRqd/Pbz28Fz46rd+46w6Z5qRnZKvtFzaP6
 oOJ3lG8OHlfPicLBMtbQ9E7KPEfv9yX0ubTriJqhnA3T1wDU+7eq5Uy+OYNiNoF3+1gF
 wDu3rLASlmiudFaT7v7BA3etAePyqJ8rhGt4+luz5tB2yOGUj8pOFypKflmhsxXXWGOm
 SuoZcv0s8Rme7cdp1baa3PXbn/cj+wWmDphUf8F6kZlIv5hmoyazbbOANBiWgEIDNSv7
 6anA==
X-Gm-Message-State: AJIora89HW71VHsjz+ZCRDSvmiXiUmlwWDASFpy69e7B3dgb8CvUt8G+
 IpS9y2mdCg2zWztUgZeIG1Bar9UizgsTPAU9OCQOMg==
X-Google-Smtp-Source: AGRyM1t5l0gxg050wD/LWA03mD8LzLu5VzO2zay0epBRcXGGfRVDaob8bwMIb6pHbfGFcWgvWJZR5JoMl0nsIvAQgT8=
X-Received: by 2002:a25:bfc7:0:b0:66f:563c:d2e7 with SMTP id
 q7-20020a25bfc7000000b0066f563cd2e7mr32045286ybm.288.1658248828546; Tue, 19
 Jul 2022 09:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220719131637.46131-1-jasowang@redhat.com>
In-Reply-To: <20220719131637.46131-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jul 2022 17:40:17 +0100
Message-ID: <CAFEAcA8Kce5SJeR0_+Mj6a48V6ju+nyT=CWGwrgi4cjPxuby2g@mail.gmail.com>
Subject: Re: [PULL 00/24] Net Patches
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 19 Jul 2022 at 14:17, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit f9d9fff72eed03acde97ea2d66104748dc474b2e:
>
>   Merge tag 'qemu-sparc-20220718' of https://github.com/mcayland/qemu into staging (2022-07-19 09:57:13 +0100)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to f8a9fd7b7ab6601b76e253bbcbfe952f8c1887ec:
>
>   net/colo.c: fix segmentation fault when packet is not parsed correctly (2022-07-19 21:05:20 +0800)
>
> ----------------------------------------------------------------
>
> ----------------------------------------------------------------

Fails to build, many platforms:

eg
https://gitlab.com/qemu-project/qemu/-/jobs/2742242194

libcommon.fa.p/net_vhost-vdpa.c.o: In function `vhost_vdpa_cvq_unmap_buf':
/builds/qemu-project/qemu/build/../net/vhost-vdpa.c:234: undefined
reference to `vhost_iova_tree_find_iova'
/builds/qemu-project/qemu/build/../net/vhost-vdpa.c:242: undefined
reference to `vhost_vdpa_dma_unmap'
/builds/qemu-project/qemu/build/../net/vhost-vdpa.c:247: undefined
reference to `vhost_iova_tree_remove'
libcommon.fa.p/net_vhost-vdpa.c.o: In function `vhost_vdpa_cleanup':
/builds/qemu-project/qemu/build/../net/vhost-vdpa.c:163: undefined
reference to `vhost_iova_tree_delete'
libcommon.fa.p/net_vhost-vdpa.c.o: In function `vhost_vdpa_cvq_map_buf':
/builds/qemu-project/qemu/build/../net/vhost-vdpa.c:285: undefined
reference to `vhost_iova_tree_map_alloc'
/builds/qemu-project/qemu/build/../net/vhost-vdpa.c:291: undefined
reference to `vhost_vdpa_dma_map'
/builds/qemu-project/qemu/build/../net/vhost-vdpa.c:300: undefined
reference to `vhost_iova_tree_remove'
libcommon.fa.p/net_vhost-vdpa.c.o: In function
`vhost_vdpa_net_handle_ctrl_avail':
/builds/qemu-project/qemu/build/../net/vhost-vdpa.c:445: undefined
reference to `vhost_svq_push_elem'
/builds/qemu-project/qemu/build/../net/vhost-vdpa.c:408: undefined
reference to `vhost_svq_add'
/builds/qemu-project/qemu/build/../net/vhost-vdpa.c:422: undefined
reference to `vhost_svq_poll'
/builds/qemu-project/qemu/build/../net/vhost-vdpa.c:434: undefined
reference to `virtio_net_handle_ctrl_iov'
libcommon.fa.p/net_vhost-vdpa.c.o: In function `net_init_vhost_vdpa':
/builds/qemu-project/qemu/build/../net/vhost-vdpa.c:611: undefined
reference to `vhost_iova_tree_new'
libcommon.fa.p/net_vhost-vdpa.c.o: In function
`glib_autoptr_cleanup_VhostIOVATree':
/builds/qemu-project/qemu/hw/virtio/vhost-iova-tree.h:20: undefined
reference to `vhost_iova_tree_delete'
collect2: error: ld returned 1 exit status
[2436/4108] Compiling C object
libqemu-s390x-softmmu.fa.p/meson-generated_.._qapi_qapi-introspect.c.o



Presumably the conditions in the various meson.build files are
out of sync about when to build the net/vhost-vdpa.c code vs
the code that's implementing the functions it's trying to call.

Specifically, the functions being called will only be present
if the target architecture has CONFIG_VIRTIO, which isn't
guaranteed, but we try to link the vhost-vdpa code in anyway.

thanks
-- PMM

