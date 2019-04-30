Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E69FDE7
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 18:30:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49827 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLVds-00046U-UP
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 12:30:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLVF1-0000NN-HM
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 12:04:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLVF0-00078C-AJ
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 12:04:23 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:32916)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hLVF0-00073t-3p
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 12:04:22 -0400
Received: by mail-oi1-x243.google.com with SMTP id l1so9835368oib.0
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 09:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HGs5yFmrBguiRLBs8otD+yjmRKaEtHfPS4Kfu4FjCxk=;
	b=IYiNjvqbK3Wuec1Zax+ndDu/tN8da9lxGcnuM1+DmvB7Z1+oKHr64+7UFErsUgvbng
	Jk8Z2X4ebbVdfxvsB10m9uJfHqOP6A4twdORIkXEGsC+HRNRjxXKGnmKhxygzVIM+Z32
	goEeXdhM4EDnjKuP3LyIi9oUD0C178l6KTmNyF4kLbiLJaqg0zouQLXcXOBbnbEOF7II
	3NAjTK6ImpEx/wl2PeX4V9AwkrM8LvGN+ukirqlsoZm1jrp2GtKcMOUT8HWY1iVwhnRw
	X7WMtX7kEc3fFz2Q0sMTfgBtEpa4TmgxIcRDot1aaJn6SbwPFmcc+QkFY483Va90gdxd
	uJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HGs5yFmrBguiRLBs8otD+yjmRKaEtHfPS4Kfu4FjCxk=;
	b=axjF6BjvVKTUDhSfq/Q9cJYa0sNDqpt8XINNXeDbx8FLBj9VLci3u9VPpZDjYl9ikC
	RF9S5IGCFN9b5FeNosMcDQ+MXYpaav9urIuknuTALzCkgzDXtVwPiG38HYpObRjf+q8f
	PkM2peBHyxWWu3Ttw+fWaYqJwtAXgKVr/UggqdHm/MdZEv96l9rJJ3+R4eAJt6nFMajt
	MmY2ECCT5qg2tR+TJP4uNmqAPRVUurAkLi9SHCU7wJRYKgoX1QoiJvxqx2fLRtCuv4TZ
	wtzcq1CWApfQEuF5+O8WrrDz78CnfQmxGHjvW3VQsSh2pCm2+WN7PsOVL2t9bMRfo/JH
	2Mdw==
X-Gm-Message-State: APjAAAXVe2oyEcpsyWhvVMbNf7vnvojOxhPPqrLzjFdz+oolKKCilWR+
	PQazpP0VBbYBZyalRKiOCVYklJKS16tmLL3swwzLEQ==
X-Google-Smtp-Source: APXvYqzLDy/M1Ic1wOB89dwkzMr4U6yO8MYfdtNrJFAnoz4yCW9KDyGSp6OkQrNVSoxnXtYx5mmIXF9TijQMpWK3Wx4=
X-Received: by 2002:aca:4b04:: with SMTP id y4mr3341601oia.170.1556640254517; 
	Tue, 30 Apr 2019 09:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1556515687.git.alistair@alistair23.me>
	<PSXP216MB0277192E4A6C255E30EFE627DD390@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
In-Reply-To: <PSXP216MB0277192E4A6C255E30EFE627DD390@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Apr 2019 17:04:03 +0100
Message-ID: <CAFEAcA_rJT3NxMAyoVFCbxNi0vNfCRg1bhHTsOmd5pa1pb_DzA@mail.gmail.com>
To: Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH v1 1/5] armv7m: Allow entry information to
 be returned
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Apr 2019 at 06:34, Alistair Francis <alistair@alistair23.me> wrote:
>
> Allow the kernel's entry point information to be returned when loading a
> kernel.
>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  hw/arm/armv7m.c      | 6 +++---
>  hw/arm/microbit.c    | 2 +-
>  hw/arm/mps2-tz.c     | 3 ++-
>  hw/arm/mps2.c        | 2 +-
>  hw/arm/msf2-som.c    | 2 +-
>  hw/arm/musca.c       | 3 ++-
>  hw/arm/netduino2.c   | 2 +-
>  hw/arm/stellaris.c   | 3 ++-
>  include/hw/arm/arm.h | 4 +++-
>  9 files changed, 16 insertions(+), 11 deletions(-)

> -void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
> +void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size,
> +                        uint64_t *entry)

If we need to return the entry point, why not just return it
as the return value of the function rather than having the
caller pass in a pointer which we fill in ?

thanks
-- PMM

