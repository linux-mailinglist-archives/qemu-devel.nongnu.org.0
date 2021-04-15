Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEE03607FE
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 13:08:03 +0200 (CEST)
Received: from localhost ([::1]:54416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWzqs-0000o8-TG
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 07:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWzos-0000Mw-EX
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 07:05:58 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:33641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWzoq-0007OY-LA
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 07:05:58 -0400
Received: by mail-ed1-x52c.google.com with SMTP id w18so27597366edc.0
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 04:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MUU4DeVITecOAZV1FZJt/ToP6zc6+Qg631em3kKKQu8=;
 b=WaPcKXIJMrGuXDsEHvD4FcMPkpReM/sTWuBBGbGoKtWR/n2KdTN92Ug3XONnSo0CtN
 vS/HU9mG8GtiQtWrdreH4c79KN/AQ+cupVkGbeS5sw+KjCulzB2BwQp3di41lgj+jKcC
 p488QjvvOOeXO7WfAgKuhdnA2KHj66l5eL1hlFloM9CmbR4wdmuNb1IRqgd3E8bZ7AoM
 yQn9yNcDvI/izorQCv+QDKnMo6KvDz8VWmrv/FD43SI66Yj52ocdVUUF59ByYYf0RF3U
 HWx9XWOCZ6nfY8NZIi12JunQzbXUXXzooBo7bxrrWHblINl/5S+xVct5JmjOeNNkHai3
 3ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MUU4DeVITecOAZV1FZJt/ToP6zc6+Qg631em3kKKQu8=;
 b=qPpetdMNjleeKy5SUDkaUdvdqI2mEUbviUV5Xwnhp9mOsn9kFbstC66FM+YiJ7dCJA
 5O8kysdzSjSsiJqGYQbO+m1S74sKIbCy37hmSrkk+VuaXmoxxk1KaBB3sfSI7l2oChVd
 UVJeySYn9AOwVJE/rvWbAcwG5GTq8fLgfqVdT+L26+UW1zk3xTPxojJnkTIL6vQxXp5v
 Ff4XptPvUui3m22k8WMGo76MUVq31FPhx1y8eq8OMhK19fkuckvMETe22F3veyUY/z0D
 coOvoyqxuN05LNTc3dYkM/0sJAJ/gQwUk6EoqNgyyf8D1EXP/A9sJkKZAeOIkgUy5L3q
 6hvQ==
X-Gm-Message-State: AOAM53003jde3GvEsRxSGnWMtWPCZ1xayeAJn4H9t8uDgkMxSZ4DlRRR
 f5MVnzav2h/pVBbO6TfnUgllBkDS4eaxcqQ4Y/3E7g==
X-Google-Smtp-Source: ABdhPJy7zdPzUa1ueo0iiD7bqNwNHxcwJOZYSU/fTLPDory4Wk+xQJ/k7jJfkbRnJhW/v5PesxJoCJ688ixHXZaFbX4=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr3472674edb.204.1618484754551; 
 Thu, 15 Apr 2021 04:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210415100409.3977971-1-philmd@redhat.com>
 <20210415100409.3977971-2-philmd@redhat.com>
 <20210415110047.ku3uqj5evcprs77r@steredhat>
In-Reply-To: <20210415110047.ku3uqj5evcprs77r@steredhat>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Apr 2021 12:05:07 +0100
Message-ID: <CAFEAcA9=hGVPgN0bCcgkRmqGG-ouHwz09VxXHBH-eyToWugRPA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] exec/memory: Extract address_space_set() from
 dma_memory_set()
To: Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Apr 2021 at 12:00, Stefano Garzarella <sgarzare@redhat.com> wrot=
e:
>
> On Thu, Apr 15, 2021 at 12:04:08PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> >dma_memory_set() does a DMA barrier, set the address space with
> >a constant value. The constant value filling code is not specific
> >to DMA and can be used for AddressSpace. Extract it as a new
> >helper: address_space_set().

> >
> >+MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
> >+                              uint8_t c, hwaddr len, MemTxAttrs attrs)
> >+{
> >+#define FILLBUF_SIZE 512
> >+    uint8_t fillbuf[FILLBUF_SIZE];
> >+    int l;
> >+    MemTxResult error =3D MEMTX_OK;
> >+
> >+    memset(fillbuf, c, FILLBUF_SIZE);
> >+    while (len > 0) {
>
> What about return immediately if there is an error?
> I mean:
>      while (len > 0 && result =3D=3D MEMTX_OK) {

I think that (a) we're just moving code here so we don't want to also
change semantics; (b) there's a comment in memattrs.h that says
 * A zero (MEMTX_OK) response means success; anything else is a failure
 * of some kind. The memory subsystem will bitwise-OR together results
 * if it is synthesizing an operation from multiple smaller accesses.

so in this function "keep going but merge errors" is in keeping with that
principle.

thanks
-- PMM

