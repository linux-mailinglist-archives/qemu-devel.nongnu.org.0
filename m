Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5F92B5EB3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 12:52:19 +0100 (CET)
Received: from localhost ([::1]:52382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kezX0-0004J4-OG
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 06:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kezTu-0002Ld-BC
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:49:06 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:46423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kezTs-0000kJ-MI
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:49:06 -0500
Received: by mail-ed1-x535.google.com with SMTP id t11so22057120edj.13
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 03:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/zmaQIvmcbkLvOpPz3bq+pmoi+56H1tvlXZNG9w4VaQ=;
 b=EAUtCawjUFFZ5h7e0H3kBGr6mAJw5X2ubyt7iBuxAMJYI/wba5kUo6xc8eQmE+ihof
 pY8g/Ja0lox3CJSEFKaloMaZOXtUvnn6ux+CT8svdqT/WebZjPTX/UW9lGo1v0P8Y3eK
 x1TnGBNKeGAi84G4AhiFhsGB53ID3iqMbQud+QyZA/wy5c6Oz0sYxt3CLKlZYT3HOUnr
 QERobP8QZ2C8F8m2dOP/jdEdxKxhGBA3Aug0SOxWKDFvoX+17+6ZcyHYTtN2UxBEUubM
 bu3j6CGSa9o9m3Ga/IpJYaWEOZEvIi3ZoB3q5uH1X7qjzF9zfhX8mktYYaDppBQ+mCTt
 yPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/zmaQIvmcbkLvOpPz3bq+pmoi+56H1tvlXZNG9w4VaQ=;
 b=JcrWbOK71RW0TQkgrbd00mWu4QOXCXwF6h2Xr/8S4LhFQZeAUFzN4qV2AIYfzQql7D
 b4dDojgvnOUlZBCi5FMUX7x4faqgPOkrPnZ0FCyRFW0lGqpc1AAmuuGbmFeXMb8I/84A
 cqbwyNgx7uicBKqW41X+gde9OpRSfT9oTi80avJ24GdMffWCBr1O/zpdcpVkXm49sPpV
 ISxO7FyTnEDm0CeRP1oOHkT4pFhuxOm993hSwVRQEqpiKPB2AduAZq5vnDfbTAIyWcNU
 A+k6SLPSMZ7WthVyURQ0Jdi3GVHAmiw3rOFmDyBB33YNgl59kcqwGIAjdx0XIlDaEIQQ
 CNDw==
X-Gm-Message-State: AOAM533BfqItu31G27fupB/nmC+Bvossab0HXsFcHsCDepxZ3gHieHEl
 TpC3wm4pQs40VHHqYJXRZ3MJAO7kQUxT8WUTh8NpBQ+Z98M=
X-Google-Smtp-Source: ABdhPJxI1czXQjFZAAmabRZz5Tzo0ee8yk/INM4IuBO4SPqhHtPDm6E6owp/KdoI+XJyMGPmQfksQKdFSCU5RyyCahU=
X-Received: by 2002:aa7:d3cc:: with SMTP id o12mr20631654edr.36.1605613743118; 
 Tue, 17 Nov 2020 03:49:03 -0800 (PST)
MIME-Version: 1.0
References: <20201116205942.109534-1-eblake@redhat.com>
In-Reply-To: <20201116205942.109534-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2020 11:48:52 +0000
Message-ID: <CAFEAcA8OFVpSTk_BSdadp69kUg28-hzkrkc-SaXuoKiR=h3exw@mail.gmail.com>
Subject: Re: [PULL 0/2] NBD patches for -rc2, 2020-11-16
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Nov 2020 at 21:06, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit cb5ed407a1ddadf788fd373fed41c87c9e81e5b0:
>
>   Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2020-11-15' into staging (2020-11-16 17:00:36 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2020-11-16
>
> for you to fetch changes up to 2f3c1fd39668b9e565a4e0ba1d62ff5db05d62a5:
>
>   iotests: Replace deprecated ConfigParser.readfp() (2020-11-16 14:51:12 -0600)
>
> ----------------------------------------------------------------
> nbd patches for 2020-11-16
>
> - silence Coverity false positive
> - modernize iotests python code related to nbd
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

