Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAEE9B5ED
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 19:55:14 +0200 (CEST)
Received: from localhost ([::1]:60538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1DmL-00080L-05
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 13:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33959)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1Dkr-0006uq-L1
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:53:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1Dkq-0006rR-L5
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:53:41 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34592)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1Dkq-0006qm-Fc
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:53:40 -0400
Received: by mail-oi1-x244.google.com with SMTP id g128so7673954oib.1
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 10:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VTWQI2/bTW6uLdG6CZCLdY+s1uv1OxHm3gcyhTKtWs4=;
 b=uvSPmK5caUX6vLpGTGTPnGGpW/y6UKNkD91CweaIae7ph1Gd5Cf5vppP2bDEWnR4kp
 5028Vbxd+tmuF5GZWDwgoh0YJhcdJbmhTHVTNDyDUAU78EQmU3KUi9gDDZfT5fYKFDYh
 s559BBA2+lDuPwWbl7MgBnxd3CQMEOsQtIhee3B/BOTwHxKJQsPRhTmC37rT1sMx2VXn
 EB5gsjlB7pfUmagz4iNir4tFGc56xHry3QIuTvAVrVHQd4lJd8URPL4mumtRUxgxFVEZ
 GQYbZI84Vt3MHK4i3h8riOqKH68h78e8CxwxqSlR/H+mfjBHFZyUQJZpYNoh1lrvj84U
 UwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VTWQI2/bTW6uLdG6CZCLdY+s1uv1OxHm3gcyhTKtWs4=;
 b=YNxLrnwn/xVvG0pvPeloq2r8VXOUFSxBAVzjs2LkEH13RMM/s8e30q2kc7bS0EEVjw
 QaMyYUA6G+nvEoIRMuSfcAyjZH+oo95jrMzYVIVGUsNThDPpgzVWAeueawBQl+rIJ70i
 VNL0DtYz7h3NrhKgXUhTPoHqfKcRzPf0w5Yh7C7RjwgfOotrCxU5CWTscsnhWG2P7PPK
 dK5XuS3Y2XfT+K9JZXLhAJGaS57Fgh/wEQQXeZdE2HRGJqsWio6MSRARFqENpIVy9KTe
 CA25tUUdr1ZM2xIPBEfGct+zX9Cg5uTCPHy7h8ZvBNRawJRJ6cLasIc5D13AuxWk9cvZ
 DOew==
X-Gm-Message-State: APjAAAUE6yj1hGHmVULP+QDANYKTaGd2ngsi39hei94IGjlUkVESfMiL
 ktgtuBEwtjQLRw3lAzAG6k7Te/uZGme3gqzIzo0fnA==
X-Google-Smtp-Source: APXvYqySPumFNhopAPYGC15MPGIArCyZPTxNHDrOzvIS05sQzB3K6V0ONQNSBkwxEqwhUwPDGPzbe+ihHmJf7b4poBs=
X-Received: by 2002:aca:4b86:: with SMTP id y128mr4033788oia.163.1566582819479; 
 Fri, 23 Aug 2019 10:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-32-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 18:53:28 +0100
Message-ID: <CAFEAcA-Fbey3iz8Vev-hjRxmv0W61h+82BoVQfoo4k0gZikuMA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH v2 31/68] target/arm: Convert B, BL,
 BLX (immediate)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c       | 133 +++++++++++++++--------------------
>  target/arm/a32-uncond.decode |   8 +++
>  target/arm/a32.decode        |   8 +++
>  target/arm/t32.decode        |  81 ++++++++++++---------
>  4 files changed, 123 insertions(+), 107 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

