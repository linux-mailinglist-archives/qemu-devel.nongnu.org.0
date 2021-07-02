Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DE03B9F05
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:20:16 +0200 (CEST)
Received: from localhost ([::1]:60458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzGHP-0004LJ-Er
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGE7-0007mj-1e
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:16:51 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:34666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGE3-0002ze-KE
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:16:50 -0400
Received: by mail-ej1-x62c.google.com with SMTP id hr1so11931657ejc.1
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 03:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vi4gLePHRU9tjMwkIE4O51i4/YE2/FbDsXUYqY5qtyk=;
 b=O67s0pw0eZTlIXmbP2r7lwtQtj0Q0OfJ51OSIm5Yrs8RWpgWpqIcX91ls0mZpJ6BN5
 8ODaPCYA9YCBiGJGPJxEfi/dONRjIEjfbWZyyC7eAUgOfVBEC6sCIWz3MZ3RnnbuXFP9
 YJMxwjQAXPaB9dJ2nYjnfQFJdhCL+y3Mv6zLM6+dccfYb8rviCW88kitl2b792jE4qXJ
 ktfsNkkQCswxMUAPVh4mqrqE3vohI1M9AB6FQ+d1I2jDJ9wUckaljxB/zxLWfOrt7lE5
 LRj6HkUJiqSCL7iQWN4nI4hU2810X9A1ko3rHYdML6Kbw2cETLpxk2RLRMeKQsMihlJU
 YL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vi4gLePHRU9tjMwkIE4O51i4/YE2/FbDsXUYqY5qtyk=;
 b=pN11mV/Ayk/AhErhpOuDb+65X1e9JIiY6ZzwfyT5WXoZPYg/nqi/6V1hlyNJridR0i
 iMlwFhgwbsXhacl7SEruy92nrwS3lYvy0QlaoBxhIEnlzRizkTZHCj1Z7tHUH55C9cc5
 MFCQW4WXIkC4odzMGnEy/KucJAExohEIxHXoftCVXi49NUzrsYMa/gNRL9AcGuyGkZ4L
 tY6e+07+2/iB/c7ehH8sdSz10yiv7FlRVIyXRIpcBBqHwVpqTx84gIn+QSG7qc4fZd+V
 DZ1AKbHKQU6kdhzEZvLAEpLl6OOr2AkkBkWwtpTs9JdLGSJdVCwzo2amEpLEtC3g54Zh
 4SXA==
X-Gm-Message-State: AOAM5329MmJYsjCYBzOglVCimADYqJ2PZ8sWwcJqWfXryhTlNj62COVx
 yi2zIFaWC6tZ5FjZ+uZGM3IfOP/oOLHnYZyWXOK6DQ==
X-Google-Smtp-Source: ABdhPJyBWLNwWQbsvmOCCwxeV6/2bnS/BWIqxKzUFGbCsxroiI6xHy+ImvH/1J0rhqKt2hbKvOA5PRyAGgd9dOHTFrA=
X-Received: by 2002:a17:907:a064:: with SMTP id
 ia4mr4605813ejc.482.1625221005240; 
 Fri, 02 Jul 2021 03:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210630115612.827664-1-berrange@redhat.com>
In-Reply-To: <20210630115612.827664-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Jul 2021 11:16:07 +0100
Message-ID: <CAFEAcA_siQoxHoF_p-3FJuRviDMVUOFwbQdvSwz-HncRxbx0Ew@mail.gmail.com>
Subject: Re: [PULL 0/7] crypto patches
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 at 13:02, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> The following changes since commit 13d5f87cc3b94bfccc501142df4a7b12fee3a6=
e7:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-axp-20210628=
' into staging (2021-06-29 10:02:42 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/berrange/qemu tags/tls-deps-pull-request
>
> for you to fetch changes up to 678bcc3c2cf22262d0a72b52da57737c4a40e040:
>
>   crypto: Make QCryptoTLSCreds* structures private (2021-06-29 18:30:24 +=
0100)
>
> ----------------------------------------------------------------
> Hide build time dependancy on gnutls fom non-crypto code
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

