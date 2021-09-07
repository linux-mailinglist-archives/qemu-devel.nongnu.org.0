Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96442402BBE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 17:27:45 +0200 (CEST)
Received: from localhost ([::1]:47156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNd0h-0007M5-CY
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 11:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNcwh-0003B7-B5
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:23:37 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNcwe-0008Hw-MS
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:23:35 -0400
Received: by mail-wr1-x430.google.com with SMTP id i28so3785295wrb.2
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 08:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xjozTuRI+B8ZpWfwKIFoZg4RP89Sc+j7Y6/a7eL6uc0=;
 b=vFBpabDOkpyETIqUXEiVGIHiIMqzbVs8IzaBMo4L5ToIdK3miOrQgtgutzLBGq4qXh
 FgO87oOOfYc88dnCWI8Z603tB25rzJz6jF3/QgjeClW/wO+gxZqbg4iU4mX6HZ+wctON
 +Z7zUUy0ikjCnUOSSTL/H7vrMuNt3VcdKURlgzz6rTmXtVFQP2MC/rF4x+HlH99nOPGZ
 fMPQpgTNP0W4PEXB8IJqoogWWcdYZpQPg/os+WoLZhh9umnDb2eOt9DP0OaLG6afMYLv
 5diM2EKHRZg1lht2Winuu/tdxINrZ1/zKvD2H6o3sNbSDLJYzA1vn2nq+I8/tfXrI2tn
 Uz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xjozTuRI+B8ZpWfwKIFoZg4RP89Sc+j7Y6/a7eL6uc0=;
 b=TJFz8BU+VVN/9V6Xtog8FxO9xYEqKfsGicN52ifL5gMgV7l/P5Bf311QzZK9i1UM4M
 Xmnqo0YDt1oI+CPtvgflcLprufh4dOmT17eNhyhsCMUsjYPZjGH+IurZi3b4ZWp+vWYH
 95iQp03UnRhuJD742w6MdX3JzT9cxLT2w+6A+y1yWP5E48xT4ChcJV2YknaPsuNRDJ4v
 oGcyXf09vN/yIIA5ugI/I71GvR3ZhTiZK7JnbYfAHP+KiBiUgM3o0asmXsl0hfwCwZza
 3LfZ5EY43J3QxUTQKMOsVVABEhk7REhOr5p4BSii2rNQ7bFkcOuyzJd4BFNFhhxBD9TR
 fSDw==
X-Gm-Message-State: AOAM533jvpWfKp0c/yLriTTOBkHbdaqdqg/4GlJYSbypW1V6SyNEbAnt
 k9aGj6wamdE1WX2vBZqH/I2eQUEwVS+fHK0I5zP/Cg==
X-Google-Smtp-Source: ABdhPJzbOd1q18f1i5scNPITP9gTjhsGPhgizn2L32W+ZtUwvVZOG48wr4UGcxtJPQ+awIfyhgoy3UP9gYYwb6nCCrs=
X-Received: by 2002:a5d:4647:: with SMTP id j7mr19685402wrs.149.1631028211149; 
 Tue, 07 Sep 2021 08:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210823174924.201669-1-tong.ho@xilinx.com>
 <20210823174924.201669-10-tong.ho@xilinx.com>
In-Reply-To: <20210823174924.201669-10-tong.ho@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 16:22:42 +0100
Message-ID: <CAFEAcA8TU+YWRtgzM7vBS718v6wU5Lc=ekjNY4Dm_hxu-L+LvA@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] docs/system/arm: xlnx-versal-virt: BBRAM and eFUSE
 Usage
To: Tong Ho <tong.ho@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Aug 2021 at 18:49, Tong Ho <tong.ho@xilinx.com> wrote:
>
> Add BBRAM and eFUSE usage to the Xilinx Versal Virt board
> document.
>
> Signed-off-by: Tong Ho <tong.ho@xilinx.com>
> ---
>  docs/system/arm/xlnx-versal-virt.rst | 49 ++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/docs/system/arm/xlnx-versal-virt.rst b/docs/system/arm/xlnx-versal-virt.rst
> index 27f73500d9..84afac3734 100644
> --- a/docs/system/arm/xlnx-versal-virt.rst
> +++ b/docs/system/arm/xlnx-versal-virt.rst
> @@ -32,6 +32,8 @@ Implemented devices:
>  - OCM (256KB of On Chip Memory)
>  - XRAM (4MB of on chip Accelerator RAM)
>  - DDR memory
> +- BBRAM (36 bytes of Battery-backed RAM)
> +- eFUSE (3072 bytes of one-time field-programmable bit array)
>
>  QEMU does not yet model any other devices, including the PL and the AI Engine.
>
> @@ -175,3 +177,50 @@ Run the following at the U-Boot prompt:
>    fdt set /chosen/dom0 reg <0x00000000 0x40000000 0x0 0x03100000>
>    booti 30000000 - 20000000
>
> +BBRAM File Backend
> +""""""""""""""""""
> +BBRAM can have an optional file backend, which must a seekable

"must be"

> +binary file with a size of 36 bytes or larger. A file with all
> +binary 0s is a 'blank'.
> +
> +To add a file-backend for the BBRAM:
> +
> +.. code-block:: bash
> +
> +  -drive if=pflash,index=0,file=versal-bbram.bin,format=raw
> +
> +To use a different index value, N, from default of 0, add:
> +
> +.. code-block:: bash
> +
> +  -global xlnx,bbram-ctrl.drive-index=N
> +
> +eFUSE File Backend
> +""""""""""""""""""
> +eFUSE can have an optional file backend, which must a seekable

"must be"

> +binary file with a size of 3072 bytes or larger. A file with all
> +binary 0s is a 'blank'.
> +
> +To add a file-backend for the eFUSE:
> +
> +.. code-block:: bash
> +
> +  -drive if=pflash,index=1,file=versal-efuse.bin,format=raw
> +
> +To use a different index value, N, from default of 1, add:
> +
> +.. code-block:: bash
> +
> +  -global xlnx,efuse.drive-index=N
> +
> +.. warning::
> +  In actual physical Versal, BBRAM and eFUSE contain sensitive data.
> +  The QEMU device models do **not** encrypt nor obfuscate any data
> +  when holding them in models' memory or when writing them to their
> +  file backends.
> +
> +  Thus, a file backend should be used with caution, and 'format=luks'
> +  is highly recommended (albeit with usage complexity).
> +
> +  Better yet, do not use actual product data when running guest image
> +  on this Xilinx Versal Virt board.                      |

Stray '|' at the end of the line.

-- PMM

