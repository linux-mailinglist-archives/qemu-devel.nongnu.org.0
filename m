Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323D8621BB6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 19:19:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osTBI-0002eU-KR; Tue, 08 Nov 2022 13:18:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1osTB5-0002U8-V2
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 13:18:38 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1osTB4-0004AL-4t
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 13:18:27 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-370547b8ca0so141675507b3.0
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 10:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PHEMjDnvh5K3WTlMrUGagmE4uNvk6x1u0dPDDG5t1d4=;
 b=Ccrehnb1tBrZha3uk44DH+a/9POzk+sEKhYUdpjEdRCIvmzpniC0GygC/Q/kYiMoia
 aWirazGaDo74iAS2FRkY+94H2GsTNSEoqIIjl7gZnPvwaZ+zuXtQ/re1TPwUQS1jwfV8
 UcWN9daCBrOF9F5h2vgNqebGi3EHl931PO+fY84SwLsldpxCUwCp1hDWsqpWyMp2evop
 6nTfk8HLmFNLaF0onP2UCLdhd9ZeMyLcKee3LCJXE48fenUxxvrkg1iTLUj1KLrNJbTf
 FDYzp0U2XMPFHL7PH/opomAho6FURbJyL9dGUXY7nYoYHEXD3o4ka9641JzbOM5CrlNs
 WYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PHEMjDnvh5K3WTlMrUGagmE4uNvk6x1u0dPDDG5t1d4=;
 b=ZIk08kxsjzdI7djdiQNkX7v+vUcx1NalalyyIwdrZ6MZ7+uFXuG95MSoKL8rK8eo30
 J8pkZitsXU5RQjupdK68FcNg/WKOFwBjP4QIuOC9hHUzj8uytkUDVqVHmwZBX+KCdEGO
 dLgDXBbZllE+XcWATEZSNfyjcP0JDSY+YS9OuXUkR+S0uLZbgzu/Tzh9n5Gl9AVk1C8B
 weq/soKPdTZ8RdEAL6R+Gy/NSLFW4pT1/BKGpqEJOUTvFIs5eSA0ziEqHozBUlOCeX1h
 rne+51jFBseC2jhhDvFIXiwEpatfhzcsYrJ76Rs886zUJIcMb8qg/UDQ8n2vOHI0GNw/
 rNTA==
X-Gm-Message-State: ACrzQf2bYr8gAcvRIQJ6nah+IiuVxRZEvXum8uD2QmUBFE0rvOwBpdGD
 D+MLH+BpOkPhFtTo6Q8h7AK8evtIn/se38gFVDyob2gA
X-Google-Smtp-Source: AMsMyM52bfqCelMCV0eGMxsqa7okRJhpL9GEF1wHMe/HA5VgaZUd7qAsXYvDKndc8vJouuZM6AMBzSkxX9tvwakVuHM=
X-Received: by 2002:a81:8445:0:b0:36c:c302:8926 with SMTP id
 u66-20020a818445000000b0036cc3028926mr55664425ywf.296.1667931503885; Tue, 08
 Nov 2022 10:18:23 -0800 (PST)
MIME-Version: 1.0
References: <20221108041929.18417-1-jasowang@redhat.com>
In-Reply-To: <20221108041929.18417-1-jasowang@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 8 Nov 2022 13:18:12 -0500
Message-ID: <CAJSP0QX85Eyf0HmKerQ=7K-QHcEwKh+vUyuyugTErcBO-k-xwg@mail.gmail.com>
Subject: Re: [PULL 0/2] Net patches
To: Jason Wang <jasowang@redhat.com>
Cc: stefanha@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112b.google.com
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

On Mon, 7 Nov 2022 at 23:20, Jason Wang <jasowang@redhat.com> wrote:
> Si-Wei Liu (1):
>       vhost-vdpa: fix assert !virtio_net_get_subqueue(nc)->async_tx.elem in virtio_net_reset

I have applied just this patch to the staging tree.

Thanks,
Stefan

