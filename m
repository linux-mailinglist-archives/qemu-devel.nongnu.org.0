Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AAB487A22
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 17:09:56 +0100 (CET)
Received: from localhost ([::1]:51396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5roR-0007h4-5n
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 11:09:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5rm8-0005it-10
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 11:07:32 -0500
Received: from [2a00:1450:4864:20::42f] (port=33365
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5rm6-00011W-AU
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 11:07:31 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r9so10160786wrg.0
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 08:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CTC6dEYobxL2vFnx/5s6horzEnZBb7dvCTGl+Eb7VIo=;
 b=EXhAB7dibPJ7oX9ajTV/S/CK52NIwj/lW/ofk/gK83GPn048sY5tFbIIfFefsPfvud
 fQYfZSeVgjNvq9ETS+n/3WP8tCmXoEqEle/KX4A9aibKGodB7B0ew8GyrAwPMjBwV0l8
 fhJ9H2J4On1IAEGD9mu29nAd1Ws8xmF6EckjkoBFuyuDv8D61Fi/rUwqvEnrUPqnusAf
 wCAQKOHmbbqPeLyUCCt1H+FoiuAA2DaHLsdKtu2zgdHd4MOscC/X65jNBXu1jHeSY2oj
 CoRBOttlGPWtxQcJKh6OlF01t1GXKb4qkwutPHhbMQrf9Vka0G/RiPviXXJiFlemMvoZ
 7Meg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CTC6dEYobxL2vFnx/5s6horzEnZBb7dvCTGl+Eb7VIo=;
 b=GLZODePmVUiXIrE5B44zsaWu5Faohhg9dHU4/BsEG9Q7H4VO+vnTWxktgtM6EbhjzL
 I2hTSqebobM2JWtG/NKdcj/55FRQcTnj3uhk3upIyqbmTApT3A+d68TU5EZEd/Wez51d
 3u4Ridx+m+QZDmBa1vdFR8H3VqTePCA9bmyD5ho4uJQEQ9lJhIS6oMFi9/Pyn5v1j1yN
 Zn2U3UF9QIiDhmDKn6msyQHh+ezA8gtGO2KNs7jSxUM7+rn+uE6Qnq7nwb/CKm6UnKpv
 bZnko/BJfttIcUOUOCEaKKYWrbjFvvwzzklqXPHi/9TafTdE6HMkRZXkvD1plzdNp0Gh
 CNLQ==
X-Gm-Message-State: AOAM5305EqpYpxjtjAp8F7W591R2xn2b+RM5IAlTy/z0Xj8C7H1WGVDa
 HMaupWjkMWpfqN7Yf+4u/2UUoz0+vUwYYHQRIGUmhQ==
X-Google-Smtp-Source: ABdhPJxfvCaCw0puR5/oebEm29Nn/2yU4Fzyj9TdaiQ5yxOAlgF5b9kV/ctGr4Csfi7nlmGxCZgtymWkX1xSf4iqOcc=
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr53855814wri.295.1641571648734; 
 Fri, 07 Jan 2022 08:07:28 -0800 (PST)
MIME-Version: 1.0
References: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
 <20211214110354.21816-13-francisco.iglesias@xilinx.com>
In-Reply-To: <20211214110354.21816-13-francisco.iglesias@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jan 2022 16:07:17 +0000
Message-ID: <CAFEAcA8wykmf4ZkpEbj_DrJkmSTU0JSfsar7ysDHcHEg4AzinA@mail.gmail.com>
Subject: Re: [PATCH v5 12/12] docs/devel: Add documentation for the DMA
 control interface
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Dec 2021 at 11:04, Francisco Iglesias
<francisco.iglesias@xilinx.com> wrote:
>
> Also, since being the author, list myself as maintainer for the file.
>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>


> +DmaCtrlIfClass
> +--------------
> +
> +The ``DmaCtrlIfClass`` contains the interface methods that can be
> +implemented by a DMA engine.
> +
> +.. code-block:: c
> +
> +    typedef struct DmaCtrlIfClass {
> +        InterfaceClass parent;
> +
> +        /*
> +         * read: Start a read transfer on the DMA engine implementing the DMA
> +         * control interface
> +         *
> +         * @dma_ctrl: the DMA engine implementing this interface
> +         * @addr: the address to read
> +         * @len: the number of bytes to read at 'addr'
> +         */

The prototype seems to be missing here.

> +    } DmaCtrlIfClass;
> +
> +
> +dma_ctrl_if_read
> +----------------------------
> +
> +The ``dma_ctrl_if_read`` function is used from a model embedding the DMA engine
> +for starting DMA read transfers.
> +
> +.. code-block:: c
> +
> +    /*
> +     * Start a read transfer on a DMA engine implementing the DMA control
> +     * interface.
> +     *
> +     * @dma_ctrl: the DMA engine implementing this interface
> +     * @addr: the address to read
> +     * @len: the number of bytes to read at 'addr'
> +     */
> +    void dma_ctrl_if_read(DmaCtrlIf *dma, hwaddr addr, uint32_t len);

The method says it "starts" the transfer. How does the thing on the
end of the DMA control interface find out when the transfer completes,
or if there were any errors ?

thanks
-- PMM

