Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0854963E0FE
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 20:47:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0T2L-00084j-UK; Wed, 30 Nov 2022 14:46:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p0T1z-00082o-Gk
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 14:46:07 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p0T1t-0002Hr-RG
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 14:46:06 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id n196so2958492yba.6
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 11:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dCRMhvOeeNotDl7K8MP9/wPyRt5g1nADSNdyF46ocJY=;
 b=FH2rvVPsTubp7IrHhvf67vfEZgj6OzZfrVI3IIX5d4K+gwBmJjMf8Tw3v05R/pl9k7
 5MKfMktQrzGh/fzpnRgr1ox+MtxRSvAu8Uw8VSCiT6kMFTPTcyyhmN2CfFlIO/pIYw5s
 4bMgCXLllR9qejOjkKkYr0c3Dfbvd1OTwJqNhhwiSB5n8+o+3z6XnKzFub8Ascs2DAg0
 CpAx4eBRCWc00tBSjOMmzmrSh6XWteeBTVyjR6eiJdhsbGN1Mk11eQoiXhcHn2ch5chZ
 TYlqdDLhdF7M/7C9OzwDnq4RZfc7rxQYs+wi5gTgZJPI6YvSPCDqeYMUCITmTEigoe+A
 M3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dCRMhvOeeNotDl7K8MP9/wPyRt5g1nADSNdyF46ocJY=;
 b=6M6wKW1yv7WS6f4Ak7YQSeTILtoLkgRAzyd3eLlrBW+iJrSbI4giP69Ic8Sa3evmAu
 21awAg9mXiDt3nyoacrQYhlk8FQp24WGFdRTufJFSPCmOjGljuq9t20qrHmyeLzf+DEm
 tg1j61O66GpyVcwF4gtVNlLK8ZMuYxqO8tO8zPdu77b5nT5S1lUe0HaWZVRCw5SrjSnt
 4wWVGga/EkpoUKhjLz53rNrxsJsxfCzBZgdgp4P6qIfzicD3E0fvtzRzsWzuJ9eKZV2y
 m/5qCD3HrK7wZ3ti2TzrZMdE3is5/rcdtS/Y2E5E7Ks6s8PYAjGOn8hkh4odtrKnvMhD
 brJw==
X-Gm-Message-State: ANoB5pnmauSP758hQmWwCEB69FvkCzdHS4/amYb79Kk4PgSb0Gq2vxjF
 ZYJU7o5JIvYiNMXPbEkK6vJayGtdyE9Gw2ebLD4=
X-Google-Smtp-Source: AA0mqf5LvH8e6O/RTKfX44hft4VlD0jXyxVwjc4CjTYeZC+C0HD3PdVjEO0g+i9YY5othIvb2LxQFoy/8c+0hVO3UUQ=
X-Received: by 2002:a25:a189:0:b0:6ee:f3dc:b8d0 with SMTP id
 a9-20020a25a189000000b006eef3dcb8d0mr40280857ybi.642.1669837560298; Wed, 30
 Nov 2022 11:46:00 -0800 (PST)
MIME-Version: 1.0
References: <20221128202741.4945-1-philmd@linaro.org>
In-Reply-To: <20221128202741.4945-1-philmd@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 30 Nov 2022 14:45:48 -0500
Message-ID: <CAJSP0QWGARqdNPSsMVQtFsh9NKU=1j3hfvgmZidFWLik+tS-3A@mail.gmail.com>
Subject: Re: [RFC PATCH-for-7.2 v3 0/5] hw/display/qxl: Avoid buffer overrun
 in qxl_phys2virt()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2b.google.com
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

On Mon, 28 Nov 2022 at 15:30, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Since v2:
> - Do not abort checking guest-provided addresses (Stefan)
> - Handle chunked QEMUCursor (Gerd)
>
> Since v1:
> - Moved overrun check in qxl_get_check_slot_offset (Marc-Andr=C3=A9)
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

Merged, thanks!

Stefan

