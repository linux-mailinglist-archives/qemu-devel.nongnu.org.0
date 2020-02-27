Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F106417162E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 12:40:34 +0100 (CET)
Received: from localhost ([::1]:57780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7HWs-000520-0a
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 06:40:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43892)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7HVG-0003gQ-7N
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 06:38:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7HVF-0000I9-4h
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 06:38:53 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:33999)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7HVE-0000GP-Va
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 06:38:53 -0500
Received: by mail-oi1-x243.google.com with SMTP id l136so2990416oig.1
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 03:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PqOtJqkV58ZIscjJS1hPys5Cmx0isyL4PEcXThnmNgA=;
 b=qO0IIXHoIJvwvgYz83BKFw83byH1lwPBbP2YlcFQJGU3gFtZcV0Ld3PvlA+teGK19l
 DoKCNcVISWK+Ty/lItLNkj26k2VXACZbFD2vlstv91D3c2i6loc3mJvHr9vpDEAhqaUK
 XPAh0UZTF48UTYh/2vYT6P8AL2NEPrIAOBzUNJmWYEV2F1vF/BxLbltCpQs7ocnxajo7
 1ibUU9/3Oe3xDf0ZbohXoVfSd7aR68pc1+6SBsPhBP4LPNT0lfjV1WaKxjm/AG47M7uQ
 bGWATZknRsI3Y8RSXNPtCRZBYDYkg6U8IVbohOZGA46/Sr3hpJlJkqeN+d/RuNlxLiXG
 wv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PqOtJqkV58ZIscjJS1hPys5Cmx0isyL4PEcXThnmNgA=;
 b=U99Cs4qjeNMypQWkrLCvq1Mh1s+fLIR0c2Ge5F+aqVypTFHFvPyLgYVf+yVhsNCR3r
 n4N9ifvpOuq4j/SGwuOWt7CyioEYgQak/C9/TroYb3zRj9V2USVwoFRY2gnNp+C1IKBz
 wc/69i6XFNGjFWHpbxYRTTaNktUMa2VFqOAVkRE/dCj6Tqh/SmIUTUUquPsUBPhGkLTH
 1t0CrVScvNomjUFmyhALV3ET3eT8Q6aFS1sg4Vi2CjBgmIdFSU64TDQOiF9LAPKEjWnY
 zp6VoeR1zXVTOohe47IuvfYFnBYSZu+xsXTbShT42ODaA/i79CJX+ZbRbgoj6qlRWCI5
 NdcQ==
X-Gm-Message-State: APjAAAWfzud54kaxTVS/4hNBSDDC0NI/uIbssrB7A6CmlY63ccEgWxB+
 3EAGIGR1AzeVZRnYUPrpWWrEApuqI3L3aSNoakVfZk8y
X-Google-Smtp-Source: APXvYqz5dunF/DDZNzwTe8BZ3d2QSAZPvMKxLkQ7i9BS9wwHZkNI2YlhHSyRWgzlqv+y1CpZsES+W22YdsxRYT/4uo0=
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr2859834oic.48.1582803532256; 
 Thu, 27 Feb 2020 03:38:52 -0800 (PST)
MIME-Version: 1.0
References: <20200226113034.6741-1-pbonzini@redhat.com>
 <20200226113034.6741-6-pbonzini@redhat.com>
In-Reply-To: <20200226113034.6741-6-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Feb 2020 11:38:41 +0000
Message-ID: <CAFEAcA9T=1iMJJSOK6YEBoN84Bq0uMqAbHdCFS976uJgtxZf=g@mail.gmail.com>
Subject: Re: [PATCH 05/18] qemu-doc: split qemu-doc.texi in multiple files
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 Feb 2020 at 11:30, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> In order to facilitate the reorganization of qemu-doc.texi content,
> as well as the conversion to rST/Sphinx, split it in multiple .texi
> files that are included from docs/system.
>
> The "other devices" section is renamed to ivshmem and placed last.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(used git's colorMoved feature to check nothing accidentally
changed during the reshuffle and eyeballed the table of
contents in the generated HTML to confirm it's all still
there and in the same order.)

thanks
-- PMM

