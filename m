Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED0335C4C3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 13:13:20 +0200 (CEST)
Received: from localhost ([::1]:58112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVuVL-0007j3-7j
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 07:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVuUN-0007C3-DG
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 07:12:19 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:35610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVuUC-0007Yb-A8
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 07:12:17 -0400
Received: by mail-ej1-x62f.google.com with SMTP id u17so19607881ejk.2
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 04:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hBFnZ+xyl0S4WWqYYuYgFacmQZZgqYTryYuLlGe27ko=;
 b=Tn4A/raAwFys1tvqkg6t2K/KmP3yDXyw41E+94qMDyXMOrXOny3Awgwua0EGq4z4gy
 7ZkbYZKQQ80CLZG3iO4A8AdJNNUxU2KECBBY0UD843oBLXk8TFiJun3Pr6MSr7KnktqU
 M2c9K4rFT2YPdPlgxLwL4M+IZrezQyUiQames1Uz4gbwHgH4w7Qy3/6cTVi3+BSYWJ/3
 nptkyVkdHCEMpjsQhHDuwIQEf2LJguDIzjopP0+6HzWt8Y5a8fCl9g5kXh5863d6DYjs
 Ip3S9F+lyn6yybfcXUCU2HKZuuGHHxzLX2e5sne8MKwHleHBZJgWsDCN5PKEiLRcEEm5
 pC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hBFnZ+xyl0S4WWqYYuYgFacmQZZgqYTryYuLlGe27ko=;
 b=rzcBH3N16IsfBijwNb/SIIOc3ubPsYOV8kOja8OB7SgW+5xTO9Hz05F4jophNfuCBV
 TZMuQORI4bAS5GLcIFkY4jyXKmY5iQRpw6HLEzUmlI6FL7EL4JoU8Mop7m4bGo0LAMns
 iFonjvHz0PP/IGDZTLu/HRjbw8AA/q0tYTjjKi/+PGaSzSwvCTZxGoDmUuk6OcmbL3QT
 bheR6YKCxq/M+XepVZKIhoWUFQ9886/qiFRReo4WSigsIt6H5UOv0YhF+2huj1BMQsu/
 14w0yP9QGxYzCuDFLNdvZ5sOSLw+BZLijOwAIJxpkLpXbzLmvUYKTBvnu+jFgSH4rEEu
 YHEg==
X-Gm-Message-State: AOAM530TFDT6TA+A4boObDvWmLrWVOECCmsoOfth3Z0n1l0ZOqWe+0sF
 y4DpBdVCrFnuxUpNthJ7KuS61ZxpyKBDEmpeYPzIRg==
X-Google-Smtp-Source: ABdhPJx5OjO2u/mtjgoJkJFEpp90/pVZqZU5qk7bwoDEfZp/Yb/okAPB5AXvL6634NrnlVInPnSBfk1yXIdU/pPFDrI=
X-Received: by 2002:a17:906:29ca:: with SMTP id
 y10mr6843402eje.250.1618225926739; 
 Mon, 12 Apr 2021 04:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210412070141.521593-1-its@irrelevant.dk>
In-Reply-To: <20210412070141.521593-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Apr 2021 12:11:22 +0100
Message-ID: <CAFEAcA-h+t+17hecOU3TPt8=C8-+aYtag-9hJ3nfpwNLkFVRXQ@mail.gmail.com>
Subject: Re: [PULL for-6.0 0/4] emulated nvme docs and fixes for -rc3
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Klaus Jensen <k.jensen@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Apr 2021 at 08:01, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Hi Peter,
>
> The following changes since commit 555249a59e9cdd6b58da103aba5cf3a2d45c899f:
>
>   Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request' into staging (2021-04-10 16:58:56 +0100)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/qemu-nvme.git tags/nvme-fixes-20210412-pull-request
>
> for you to fetch changes up to 98f84f5a4eca5c03e32fff20f246d9b4b96d6422:
>
>   hw/block/nvme: drain namespaces on sq deletion (2021-04-12 08:55:23 +0200)
>
> ----------------------------------------------------------------
> emulated nvme docs and fixes for -rc3
>
> - documentation
> - fixes
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

