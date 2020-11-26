Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BA32C53C9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 13:16:15 +0100 (CET)
Received: from localhost ([::1]:52068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiGC5-0005g1-5b
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 07:16:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiG2y-0001IG-93
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:06:48 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:40652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiG2w-0001zj-NN
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:06:48 -0500
Received: by mail-ed1-x543.google.com with SMTP id d18so2013242edt.7
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 04:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=577Bajl1HDxdnAMe0WV9bhfijz9qz2KUpC9G0gToC/o=;
 b=qZK68tfvd9O0PpQEMu7+zcdoCpGRIrqIb3k3jvSYJt0oh/oy26GvlWIvE8qG2Cb23R
 ESz0iONjybVBLiTAzEX7y2F7EI1rXuvcdZPXFYttW8PZhMLes+O6o8fHG7FpYBICBcqB
 XpuegtgeHW3qY+Lk7G4xgMSsHnDra4Vp+d+4qkXUt10bXo6KJKdsknF3h6PKf+71Nn+g
 sVZyWfZ51czJaEEn/NB9Z5mjfcFxJfc8nw8P8P+MOKAbtaahB3Venkw224eWirpPlss9
 p4PR7entRBTdQG53nf0Yl+x73Wsuj5fisMcCGeqF1ksAzOBHEMbGOF+Mwi5AgYvWAl+x
 CXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=577Bajl1HDxdnAMe0WV9bhfijz9qz2KUpC9G0gToC/o=;
 b=k9lBu1PeVvqSKcCc0GLjYueQoVZJhjhMczoqtzG5QZ4EXrrIDUfQm3Xr40WL4k13LQ
 YlLAZFx7yjXQIShOr9/gZpVbzHWYG0yTlsfxyQfl/8j04ak4UeI1sNL3xqjnVs5JesIa
 j/ZGrsqjSyDn5Je5/uHTkRZWBwWF0/n/JS7H5kZUu3ISVl0BZaR1IQHLfHv4mLqftHzy
 GOZVXAcPD3EsTGR5G0jxVxdvJSULOVjUffr4tE4MpuNPyoTcT4YERgYTd2jEmrLhHKkR
 j18zPVOjgNSVqM9wvb2Nf1khjvn6/pMlZXDHtKizit1HfeneZVwRBgjLWfkXr9186gns
 RZiQ==
X-Gm-Message-State: AOAM533IiR0mz+0SL0sNnp3kskcjbY3l/PKWwvsYE1HR5lixsI2Dxh5q
 xztzgG3f7+ITk7apG8Np51Sfc3RvtWn4xiGQiwih/g==
X-Google-Smtp-Source: ABdhPJxwrA+DkY+zc/Mca+c02FT3Goc2jHu12j9WddDcbmh6nb1QusMYwOJURqcI3iMWDKtI5e7jlb+w4TupHPI1rs0=
X-Received: by 2002:aa7:df82:: with SMTP id b2mr2119503edy.251.1606392405064; 
 Thu, 26 Nov 2020 04:06:45 -0800 (PST)
MIME-Version: 1.0
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-11-marcandre.lureau@redhat.com>
In-Reply-To: <20201126112915.525285-11-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 12:06:34 +0000
Message-ID: <CAFEAcA-cLAJAN9UwmyjqRaO4aAvC7ep6gWuJs8NQvfLy6pE_0A@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] poison: remove GNUC check
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 at 11:30, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> QEMU requires Clang or GCC, that define and support __GNUC__ extensions
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/exec/poison.h | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

