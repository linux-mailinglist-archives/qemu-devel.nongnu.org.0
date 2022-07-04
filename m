Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3476D564EB2
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 09:32:30 +0200 (CEST)
Received: from localhost ([::1]:43368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8GZJ-00071r-9n
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 03:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1o8GWr-0004ki-CI; Mon, 04 Jul 2022 03:29:57 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:46930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1o8GWo-0003LJ-U5; Mon, 04 Jul 2022 03:29:56 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-31c89653790so22621757b3.13; 
 Mon, 04 Jul 2022 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tBfysPOI3zFca/Cxtfn6GEHMGMctLXGrBMLzho3Ws3c=;
 b=bYfXdSsVLko59MzJiQo6ZbpGcIHPQN37fKB2I0DzXXeoAl6Nn35Pcn97SAfQ896jo/
 SDCKVQeqpk8n4FoHYfmSwTHEjcpSscCb5GZlcktmAknsGUhkBocmzKjnMJlUy4Tu2/FH
 fZqF0efaO6eXKB+ySTd+bwnkdByAbimTP3d7saQ91yfwmMHXNWMqdeC50NyMuweG5iPt
 nqOj2Ddb+K/8E+NrCxTDNraOYATNcRNqqYf6MpEPs4rIltrykLnhpN1e+XJ1QfdgsFxt
 SOvfhiuBvh6RMtMV/yPkkMh987ghK6JR8+c3JZQ2PelEohd52i00LfLDPufbxetGAyZV
 6GKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tBfysPOI3zFca/Cxtfn6GEHMGMctLXGrBMLzho3Ws3c=;
 b=HriOnI2li6ZmfWSj3tnDPRqyaDDNt/HGLG28mw6pmc9WQGFsDyR39dTNDWYyEvnzOe
 ena3t3TCFsgYfCrtaJWC7uRBAIC/zAuiAV1rALaLty57KsQ/6GnElUu3YStr91Gj2lVv
 6I+g7D9eCQO8xnE2g5ZXbocJzjpFwy/CHCdUtcakF8hRb9uBhu+BUMuDkwBwRS0LwuOX
 HwJwDNfu6PkH8rC6fukwoSHc78Gid4NWuQxdPAO/wozQWat392F8QKy2xs5CU3nF95to
 nAXS+C4RXwXdjYRveMlpHfVFTKZZmj3RITREkatep0BFDm4+FJH2cLu+025lnvf1+8Sa
 y8lQ==
X-Gm-Message-State: AJIora/FrgnOvSo8FnB9ZAK0p2qjP2iNn//EvavPPw1Xys9qWve9O+O8
 BH+qj1ziKWK2H9aB2OgkUcmiU+GUxtl0GYg55OyFNFEG5RM=
X-Google-Smtp-Source: AGRyM1sdZeJ3wSKFBceVkXLEMn4Hpy28SI+FtszWe9hv9r7laNq6ESoJ6AA1R2EDwQt/sk01cCz1AtAOT81xozMFQVA=
X-Received: by 2002:a0d:d694:0:b0:31c:a01d:c40 with SMTP id
 y142-20020a0dd694000000b0031ca01d0c40mr2214741ywd.336.1656919793075; Mon, 04
 Jul 2022 00:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220704064254.18187-1-thuth@redhat.com>
 <20220704064254.18187-4-thuth@redhat.com>
In-Reply-To: <20220704064254.18187-4-thuth@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 4 Jul 2022 08:29:41 +0100
Message-ID: <CAJSP0QUP87pbcod9uAVJv9C3+JRYKnWjarxYy-pFjUQkBuwdXg@mail.gmail.com>
Subject: Re: [PATCH 3/3] scripts/make-release: Remove CI yaml and more git
 files from the tarball
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, 
 Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, 
 Brad Smith <brad@comstyle.com>, Kamil Rytarowski <kamil@netbsd.org>, 
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Jul 2022 at 07:50, Thomas Huth <thuth@redhat.com> wrote:
>
> These files are of no use in a normal tarball and thus should not
> be included here.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  scripts/make-release | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/make-release b/scripts/make-release
> index 176304f30b..61c0fd0bfb 100755
> --- a/scripts/make-release
> +++ b/scripts/make-release
> @@ -61,6 +61,8 @@ https://github.com/open-power/skiboot/archive/${skibootrev}.tar.gz
>  EOF
>  cd ../..
>
> +rm .*.yml
>  popd
> -tar --exclude=.git -cjf ${destination}.tar.bz2 ${destination}
> +
> +tar --exclude=".git*" -cjf ${destination}.tar.bz2 ${destination}

If the excludes become more elaborate in the future we can use tar
--exclude-from=FILE and keep a separate file with all the patterns
instead of using both rm and --exclude= patterns.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

