Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1B52B41C6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 11:58:43 +0100 (CET)
Received: from localhost ([::1]:43790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kecDa-0005Kr-Cw
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 05:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kecC0-0004lu-LS
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 05:57:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kecBw-0005ZK-Bu
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 05:57:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605524216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bMj3XwWXbSFkG4yXyANi3gbSbjw7wgVq/Qjkf1eDkPg=;
 b=BuadEQ37hT7qqfnZu7IEitA8GV9v4o+6rvLJaWonAwKoQ1+Q9Sc4PuVmNx1jNPGETK7/Mn
 wmQrLgc/V1rc+zUNqN5aPaFXpY3CT9WpNcNX7Z2nJryNl1Jsym20tum0Oi22URrKMcsCOA
 KvriIRqf2gXI6eH5y6ZDJvOXWHG8rZc=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-FgzdNFN6MLiWVU5_Jynvvg-1; Mon, 16 Nov 2020 05:56:54 -0500
X-MC-Unique: FgzdNFN6MLiWVU5_Jynvvg-1
Received: by mail-il1-f199.google.com with SMTP id t14so3872096ilg.9
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 02:56:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bMj3XwWXbSFkG4yXyANi3gbSbjw7wgVq/Qjkf1eDkPg=;
 b=MYi9NL/g0rcyeDStuWkbLBjBaHpVCDfFLLExnCczBGI8fXvCdYobaiqHcyP4LAI4m/
 oeEHWk0chepBkIAt9iBf63pNaa6k/CMzhx/3g6OPLJbxhwfRnE5LA3cTaIua/+BFCx1B
 c8bXyj3NCS3Imk8Mqlk7w8RJXMTvmICXh3QU6Jht77QG8qWJi4UTCD7zLQTD3zi1d5vF
 kiKnN8NXSCvpnF+aXS9Qj9y3HuNHByiNjfZkJy4M5NpDdpmTxl319sS996bYhdh+Fc/z
 XOaVVeSEnf0mpqYamjRvkk01XgptnADYHfnbEi0Niw4LP2rpzn3jBGxKCKxfzW7tdvZd
 Agxg==
X-Gm-Message-State: AOAM530uNuuw7ic51S9CQb4HMVKSBLqpoE/xhso8R8s9h6Hv5eUqRu2x
 tdh75bUzkJM5eSrTc+9NUUMn5X2BVxkAGq7+VNW7zi0a1mditNKXr9Y6Jo7iFvi1lwUK6FMKn86
 ts2hx1IxeYDAz5k14l8wxFOU0L50EHrE=
X-Received: by 2002:a6b:8b0d:: with SMTP id n13mr7916685iod.111.1605524213169; 
 Mon, 16 Nov 2020 02:56:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydSvn4ofOvvORut9VwNK/t+juErHBMFgEjs4ExgNewXo35NHXyHQIBQVyVWEP6PIW7FwXcv3cAo3Kse5prir0=
X-Received: by 2002:a6b:8b0d:: with SMTP id n13mr7916679iod.111.1605524212919; 
 Mon, 16 Nov 2020 02:56:52 -0800 (PST)
MIME-Version: 1.0
References: <20201105160335.1222062-1-marcandre.lureau@redhat.com>
In-Reply-To: <20201105160335.1222062-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 16 Nov 2020 14:56:42 +0400
Message-ID: <CAMxuvayPZ7FR4JCpuNk_9P8NTSo_G=F6c2cWK+gDvv676ibLxQ@mail.gmail.com>
Subject: Re: [PATCH] RFC: sphinx: adopt kernel readthedoc theme
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "P. Berrange,
 Daniel" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Thu, Nov 5, 2020 at 8:03 PM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The default "alabaster" sphinx theme has a couple shortcomings:
> - the navbar moves along the page
> - the search bar is not always at the same place
> - it lacks some contrast and colours
>
> The "rtd" theme from readthedocs.org is a popular third party theme used
> notably by the kernel, with a custom style sheet. I like it better,
> perhaps others do too. It also has features that may come handy, such as
> "Edit on Gitlab".
>
> Tweak the nav header background to match qemu.org style, use the
> QEMU logo, and favicon.
>
> The html_theme_options['description'] workaround doesn't seem necessary.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  docs/conf.py                           |  36 +++----
>  docs/devel/conf.py                     |   4 -
>  docs/interop/conf.py                   |   4 -
>  docs/specs/conf.py                     |   5 -
>  docs/sphinx-static/theme_overrides.css | 137 +++++++++++++++++++++++++
>  docs/system/conf.py                    |   4 -
>  docs/tools/conf.py                     |   5 -
>  docs/user/conf.py                      |   4 -
>  8 files changed, 155 insertions(+), 44 deletions(-)
>  create mode 100644 docs/sphinx-static/theme_overrides.css
>

Am I the only one finding the default sphinx theme inferior to rtd ?

thanks


