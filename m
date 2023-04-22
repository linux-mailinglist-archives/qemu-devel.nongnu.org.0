Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF256EB7B2
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 08:39:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pq6t9-0007WX-0k; Sat, 22 Apr 2023 02:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ray90514@gmail.com>)
 id 1pq6t6-0007WE-VB
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 02:38:25 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ray90514@gmail.com>)
 id 1pq6t5-0000GN-G6
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 02:38:24 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-95316faa3a8so430760566b.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 23:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682145501; x=1684737501;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T4rFLPYuKPUznYfKBuz5blrNHzyxR6NGIufAKh/8Bl4=;
 b=H+IIhucJs+5exsFM35nuSPLJYwnCmyh5FRTwYKiLmKEwTDn0yhkYaEwnVDDFwd7iHB
 oyM1ymsXkYxpzVKvz7wD/dK3Ufa2jwdbmeO8LEgRsvAPyh8pPKLs1hR1P2HGuK7n6VlU
 /lfo/NVgpGIDelaf9RiR2n9WSK5uiXN2JHN1CJbVWafV6PgV1Z5dwW+Ehta1boLqYbql
 eRQuTxE3mV69dREestFfeRNaxMGmkC+Op1wu8Shqo+FbyLljWxnpefV6sOg69Icexwb7
 0MChUSu6f/h4p9uJioz8w1AOcDOZuY+EKfrD36SGRGSJxA98JSwgON0sXnM+qGt19B4D
 mBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682145501; x=1684737501;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T4rFLPYuKPUznYfKBuz5blrNHzyxR6NGIufAKh/8Bl4=;
 b=OcCiTbjVdGHtPVvrlZEZaCzg6TlJ2b/6El+kNW2yR9WIQrc3vL0ZCLDwML+M6vTJiV
 ZP8i4lo3FYGJdwtfWfFlE+zaf/qmtLf3DsiucfhLBamrYvolwMuj5zVyvRbj2d7v62tu
 +i6l/Z8822jmBAnQPEyNBdLFQdfiqyTOvIbQlPIRxwCEDMgaJmIrIVJPqcemqgla9244
 58+jmgkse7ELNgqtQ1UCAjjjWrCyXFhEOExl3TD3dVCF1aLF6L2ONR+ii3FwWeJNly61
 xtR93vxbfuZYN1x3VHz641J7uUlqX71Jx//NiuAg4oDCCKD0xgYkHVyL6AEAjewN99ZN
 Idcw==
X-Gm-Message-State: AAQBX9f5RdAbnGvjGJDNQLtGtaVYHbfuni4wI5ieFC+h1Xj1pxl7Yo9/
 +DHCC4ZnFw+K9B1DGPTbyCRuZk1bikEfhlWuDvLrNyq1CGs=
X-Google-Smtp-Source: AKy350by8OhmLxkfcCCVLZWptA/CNgJPkCE99FwvRZwS0JTj5B5gjrNUDUJv01O4+PQy7rFc4hrWspamI/lOMT21knE=
X-Received: by 2002:a17:907:3103:b0:94f:19b5:bafd with SMTP id
 wl3-20020a170907310300b0094f19b5bafdmr3936564ejb.42.1682145501199; Fri, 21
 Apr 2023 23:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1681819697.git.ray90514@gmail.com>
In-Reply-To: <cover.1681819697.git.ray90514@gmail.com>
From: Shao-Chien Chiang <ray90514@gmail.com>
Date: Sat, 22 Apr 2023 14:38:09 +0800
Message-ID: <CAJnb5S18+w9QX+W7CjnmB_eeo9RXsE-43otg1XRrvZJXP7EypA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/2] vhost-vdpa: cache Virtio states
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=ray90514@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

I found a problem about cache.

If there are several devices operating the same backend device, the
cache might be inconsistent.

I think we could handle this by checking if a device is the first
device, but I'm not sure it will be feasible.

Is there any better approach to this problem?

Thank you!

