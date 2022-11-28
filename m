Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A0563AC10
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 16:20:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozfvJ-0007zx-K8; Mon, 28 Nov 2022 10:19:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozfv1-0007s3-RX
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:19:42 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozfuz-0008Gd-V9
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:19:39 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-3691e040abaso108776337b3.9
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 07:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V604oTnuPqfMqoA7vqfqvEVTij7zT0AqkcffsYanVPw=;
 b=Yic6Gp2YzuiRByqqweKdP85X2h9ImwUDdZ5GjnpcS/Nht9BSU2M9J6EyjFWFOnLWum
 BA1EwfC7UdYgxNmJsCDo+uIm3/GDIOldHCmtfcxrWe3p/ZR4PVBfPatYkRKOuAUtVTCd
 sOotBYdg+nklo7On/gsMQSJJ4CMJIWDhWldnVg/WYLDz7r6dnE0PGGFDW37VacuSEIwd
 YpgR5rVkzyscIqOOBhLJ9Z0xiENIAYlnXb4vIxQ/YnthdJ95iDPF6GJVyZHv9wSYaT04
 tWJ1imr2lJOxIUeCs2yH9w0eP8qJsHOCr73BnVp21OWXoh6vdnG/xiOi9lq10wcmaUoq
 /viw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V604oTnuPqfMqoA7vqfqvEVTij7zT0AqkcffsYanVPw=;
 b=xCVnhisPe7PJRxJiEZC9yoWb+zrkgL2Xr1tfdMprGUjqezS6MHsgbZu829ZXmXoMC5
 18Rbep9jhUqBzTBC3a5NFaz/UUYtOKV6r7Er5l/rzKK/gf6jg015+XVoHWvMcGUe+5Ch
 nYJzSRHu8KBLMxW41NSBmtpFNr7u7biOr/hPx0BGxCzPFTSEw0BHCyBXAuEipdx26nql
 P99UtE7tXTga/qPXgjSgE+5SCyj6A0Qb6lSqkfFeoyeA+HCgxpd9RRZvIFRpeAhS9LN2
 beNVo+ZWdecw7/4tzFkB0340wDZCiN9/95Dw23t16Hsx1baqzIiglanZAJMh7ZfRNIeC
 Z+OQ==
X-Gm-Message-State: ANoB5plN3ROGIhGAczwxK12cItyQrQfIutnRjF13FTTL/CYmdHlfLQqt
 Dx4Z3BEdTnr6nqMK3dlLsfhn7kxWwJ10mWQnQLM=
X-Google-Smtp-Source: AA0mqf76p/fwbrWhDExPDDjvhg+xvJPUUQe8N6SYHfhGyCLi9bGhQQKNHTznNM4+WJgqqB0pA/XbTDQVlYIgkz4/UxQ=
X-Received: by 2002:a0d:ca93:0:b0:3c3:7a3e:b56c with SMTP id
 m141-20020a0dca93000000b003c37a3eb56cmr8166293ywd.239.1669648776943; Mon, 28
 Nov 2022 07:19:36 -0800 (PST)
MIME-Version: 1.0
References: <20221128134832.84867-1-philmd@linaro.org>
In-Reply-To: <20221128134832.84867-1-philmd@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 28 Nov 2022 10:19:25 -0500
Message-ID: <CAJSP0QUo-Lg1s19yRe7wQNYjrrL68RUinhPPQXVv2391tv3cjA@mail.gmail.com>
Subject: Re: [RFC PATCH-for-7.2 0/5] hw/display/qxl: Avoid buffer overrun in
 qxl_phys2virt()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1135.google.com
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

On Mon, 28 Nov 2022 at 08:50, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Since v1:
> - Addressed Marc-Andr=C3=A9 review comments
> - Moved overrun check in qxl_get_check_slot_offset()
>
> memory_region_get_ram_ptr() returns a host pointer for a
> MemoryRegion. Sometimes we do offset calculation using this
> pointer without checking the underlying MemoryRegion size.
>
> Wenxu Yin reported a buffer overrun in QXL. This series
> aims to fix it. I haven't audited the other _get_ram_ptr()
> uses (yet). Eventually we could rename it _get_ram_ptr_unsafe
> and add a safer helper which checks for overrun.
>
> Worth considering for 7.2?

Yes, please. If Gerd is happy I'll merge it.

Stefan

>
> Regards,
>
> Phil.
>
> Philippe Mathieu-Daud=C3=A9 (5):
>   hw/display/qxl: Have qxl_log_command Return early if no log_cmd
>     handler
>   hw/display/qxl: Document qxl_phys2virt()
>   hw/display/qxl: Pass requested buffer size to qxl_phys2virt()
>   hw/display/qxl: Avoid buffer overrun in qxl_phys2virt (CVE-2022-4144)
>   hw/display/qxl: Assert memory slot fits in preallocated MemoryRegion
>
>  hw/display/qxl-logger.c | 22 +++++++++++++++++++---
>  hw/display/qxl-render.c | 12 ++++++++----
>  hw/display/qxl.c        | 37 ++++++++++++++++++++++++++++---------
>  hw/display/qxl.h        | 23 ++++++++++++++++++++++-
>  4 files changed, 77 insertions(+), 17 deletions(-)
>
> --
> 2.38.1
>
>

