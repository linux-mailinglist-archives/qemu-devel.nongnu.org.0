Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AE1321E07
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:24:46 +0100 (CET)
Received: from localhost ([::1]:35852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEEwv-0003wL-FV
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEEuY-0001zx-2U
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:22:18 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:35911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEEuW-0005w6-GM
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:22:17 -0500
Received: by mail-ej1-x630.google.com with SMTP id do6so30697741ejc.3
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 09:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6K94wB4Qv8wrweioaOnQmQy4CCLWMLM8EfxfnL59HMI=;
 b=PHCQEC1aUp90Dq8VuMRhQAwmdsaRqK4wNGNrs8kRd7RNwYTm9pRy7MRtKwtw15Oxat
 ZZ/lzlecz2yudy6HAJRtFbZS4lHJ1ldRAYVFcT8ls8dZbx8lYrqQU0NtB5dQX/U+F1h6
 erRnaKx67cDVq2Zx847rSNJ9diBDc1zp+wyLyg4KRkcD6syf79L0qgpo119TQsxxE1Mx
 RILnYIm4+0wepLERiqBZPdNeNhub8lkCNtuKtyFV+9ujBJy5IOR1INbXGkofT0SFYeY0
 uMhln2dq5MW5/q6ZW8UqjwHOxdfGPtPH30bmzlgrq1lmdVxfZFoP6ukv0sRKNjF0dTaI
 0dJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6K94wB4Qv8wrweioaOnQmQy4CCLWMLM8EfxfnL59HMI=;
 b=iDxNitE5e2ksGZ6tWN1jwzHabKenwchyy+zN+9dvSgBFQTmHFz9RqBPzvdqjxEEQqU
 acuL+A7j/DMrjUGi8eiBIJiCMDQexfvBFbrhbwWfq2sH1WtTxATB3eJb+mtO76HoqRMD
 TyoBFVhWR6Nk+LItwK6zKA+Bj/P+0I6YAmjPosgImm8xHu9PtEtFmV6dQh8T7fsnfEiv
 v/i6VWZxP8Rh5dT+SXJ2MtY9acgyGThsxyzBibSZju+peqPIaoqjDE5S4XsfF0a8Acfx
 DxcXWKVBoVxYkhB5JF51DGAo3zSDVZlmKzc8Fy1bei2wz2G7z2NWjU9SUYNJ2LiH64PG
 Z1cw==
X-Gm-Message-State: AOAM531o5AIpMoeX7RaA5uHtdaYCObeLDxrIpNYB59gdKSXsvhMuYpHf
 +HOqn5TQ7osfAOVpvc+tefLjFDSr4xErWTBlf0+WFw==
X-Google-Smtp-Source: ABdhPJzOpUirDCGI2oEm1L19m4y6M7wTkCVaXCtacHTPWs5xMUzFFBhV3bTpzTaezz9tjkPYfNZQYrdWEg+K568G4Xk=
X-Received: by 2002:a17:906:184e:: with SMTP id
 w14mr22339894eje.56.1614014534586; 
 Mon, 22 Feb 2021 09:22:14 -0800 (PST)
MIME-Version: 1.0
References: <6E9673F8-73FA-4AF9-9BDB-75143B4DD57C@icloud.com>
 <20210222171102.GP6669@xz-x1>
In-Reply-To: <20210222171102.GP6669@xz-x1>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Feb 2021 17:22:03 +0000
Message-ID: <CAFEAcA882=On9mXVRNhTm6pQydbqU_+7H9y0PwU5P4KbuecDQw@mail.gmail.com>
Subject: Re: Any reason we need memoryregionsection
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: qemu-discuss <qemu-discuss@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?5rKI5qKm5aej?= <shen.mengjiao3@icloud.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Feb 2021 at 17:19, Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, Feb 22, 2021 at 10:55:15PM +0800, =E6=B2=88=E6=A2=A6=E5=A7=A3 wro=
te:
> > Usually when we add memory region in the platform init process, the cor=
responding address range in address space will not overlap with others, I=
=E2=80=99m not sure in which case we should use MemoryRegionSection? Thanks
> >
>
> Memory regions can overlap, see memory_region_add_subregion_overlap() and=
 the
> comment above its definition.  memory_region_add_subregion() is actually
> similar to that, but just set the MR priority to zero as default.
>
> IMHO MemoryRegion is the major abstraction layer of the address range in =
QEMU
> along with the bigger AddressSpace idea, while MemoryRegionSection is mos=
tly
> used as a temporarly variable to describe part of a MemoryRegion in many
> contexts, so that this partial range information can be further consumed =
by
> callers of a lot of memory APIs.

Yes. You only really need to care about MemoryRegionSections if you're
using an API that deals with them (notably if you're working with a
MemoryListener, or if you're using memory_region_find()). Most code,
and in particular almost all device and board code, works with
MemoryRegions.

-- PMM

