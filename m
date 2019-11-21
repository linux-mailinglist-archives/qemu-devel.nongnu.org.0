Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2219A105383
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 14:50:26 +0100 (CET)
Received: from localhost ([::1]:40684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXmqn-0000k0-3j
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 08:50:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33617)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iXmp6-0008CO-Eu
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 08:48:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iXmp5-0008Q7-GS
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 08:48:40 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:42749)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iXmp5-0008Ov-Ar
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 08:48:39 -0500
Received: by mail-oi1-x244.google.com with SMTP id o12so3179460oic.9
 for <qemu-devel@nongnu.org>; Thu, 21 Nov 2019 05:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dSfT+bYzEH10v/vu0I5+enZjfZ3bAlhfsUSRV3gp0hk=;
 b=hoWPUjSrOrFIlaUjH+6XO55JpB49s0SOO4F20G/6afN9GXXeTjUXhaw4ZbAYt8FsoV
 8gRq6POpXOSfz9gl2CmialZYx9cQAvZzTtWOaaYR0/7PGhe8yKEE8FEQrZsSm4Y0QES+
 OG25q1a3klYdcZA8f4NVnBjSqF6d1/uvDjm8Chkv645UcqSXjSP675B9Qk8ir2PUQ6Ip
 LhCfjjk1gNFy1WONgzgIvJANgGJczm+hjmNVfwh0/Br5oX8KNzjeHpwC7drbVa3fGwvz
 VCgGNiMDLPSsmy3pzdCWeofYJCa6h3IQ/60glPTW++1B3Us6xP778WVHoz/A81WsFvx3
 lifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dSfT+bYzEH10v/vu0I5+enZjfZ3bAlhfsUSRV3gp0hk=;
 b=dlH9xQigYQ86etSyb0dwvyQ2jNgfQ41Zd4Tv+m22CR1fJiXo5WkDhXNmHGhj79faXi
 BgypZA7bCFQRI1BtW//znt2O7I06hUz59gf9P//RoosvyCCxMQkc9QP9Va/3Ni6hS+Ex
 UU+SLJdfnW1aXz/Qgs8WUOTxOfMo5vKmDVASeYZ64nbYaaKaDasU+dxQnNn2/QYIvgBY
 5dr5t5FZk539ZaoiRvW6X/iPLu3YdeE9jZocxpKiGkAYz1/cZiwVMKPYHZiVVIJ56AVR
 x8yXW4vjSf9heAQOFHg/cT6epyLWoh2MFD2Xfp0icCI9q6CR7Tv0YKyoxMkkB1iPmKpQ
 wmCw==
X-Gm-Message-State: APjAAAX07Qn+922gh7LXiLdeb8ZpdQ4O0gv8ZG4xHANDGfBe9JsnAa+r
 TpHVUngpBZKn5JE+rq9ouqDSEWHZvE1kMsFJfKQe8g==
X-Google-Smtp-Source: APXvYqykW3A2v8N0y9YAb+1gnTCzFstP+xI697NS/24PU3SjyWMcvF22aidu2r80jrs23/0RIl2vlQdqNb4bhMMAnTE=
X-Received: by 2002:aca:451:: with SMTP id 78mr7900954oie.170.1574344117346;
 Thu, 21 Nov 2019 05:48:37 -0800 (PST)
MIME-Version: 1.0
References: <20191120152442.26657-1-marcandre.lureau@redhat.com>
 <20191120152442.26657-21-marcandre.lureau@redhat.com>
In-Reply-To: <20191120152442.26657-21-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Nov 2019 13:48:26 +0000
Message-ID: <CAFEAcA9r5AQr2mZNgeHUQnNcy-qOC54n-_NsN8hBZQ1jEGhGCw@mail.gmail.com>
Subject: Re: [PATCH v4 20/37] mips: use sysbus_mmio_get_region() instead of
 internal fields
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Nov 2019 at 15:28, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Register the memory region with sysbus_init_mmio() and look it up with
> sysbus_mmio_get_region() to avoid accessing internal device fields.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/char/serial.c       | 1 +
>  hw/mips/mips_mipssim.c | 3 ++-

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

