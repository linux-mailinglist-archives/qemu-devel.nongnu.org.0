Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFC54D323A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 16:54:13 +0100 (CET)
Received: from localhost ([::1]:33874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRydg-0006qP-9Q
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 10:54:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRyaE-0005JN-Vt
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 10:50:39 -0500
Received: from [2607:f8b0:4864:20::b32] (port=34649
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRyaD-0004yA-2m
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 10:50:38 -0500
Received: by mail-yb1-xb32.google.com with SMTP id h126so5289771ybc.1
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 07:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NQHPvLerZ0gEKud3t8xCcCgKSR7zpUkpNogBVwptMUE=;
 b=E3lmKFkpea7CWIBUVuUaEcmwJ5m71uxc0Uf59zp8A0PZRnLT8I8NlV/jSCMrA/Fukl
 RfGeI9wITHYg/qC9HT9sMYwH/puOJ8D5HMVxdZSm5M361ys5GDmbArcBC0CBE7dpC5YM
 JNmMJ90i2Bo0wtx/ZIA4aQRI6yAQluw1BZugJ4yQ8zMVrNUyCP6s8j6bAHLcMHSOFC4E
 6Eu9PfkJDZ5tIDpuFYZWdKckQ6QZMr65yWc0sRPWjRcSUQKeWmonVRkt2lxfREdcOxYG
 vRYroPFiL1f7nDJfC9oYIbuxdKuG/B+LIVPNzMgMYkJCkLNSgpmX0b7W8RcEySxEZzz2
 VH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NQHPvLerZ0gEKud3t8xCcCgKSR7zpUkpNogBVwptMUE=;
 b=fkAfxSFyjrWPT3vTY6Qm1k31x5zJgfcUNTV2dA0tTWOPCeWS8/SXCkfcBmPKDfwx8g
 rRWJYDftySOYaNsHywmVzVpNB8cAGBJLFYUjjWxdGlXF7C03VcTwF4Oc3QY2V3Al/ASE
 7YUksbiCsf5kh1FF+IFHAdQjW7x+yEDU+1e3A5iLzKESZIQwpV1Iz0LY5nq+2bJRMg5P
 R6uDepTHYKsvUVewJpj1O/jiQvRFptxmjhG2AfB8JbWGszrknQ9Qy1D1+RvM9G+xVntx
 4wEfz/lboEfYQc0XbvvB8RY4yW+VHQc3PrQvaqUU5m+j+9Rco7IZcr3zyu8lAJv3T8aS
 cuTQ==
X-Gm-Message-State: AOAM530K0yAsAzGdnTwO4wb43/6z5QZiztC/R18MIN37wTPV9YWz9Kf2
 n4bBJHcax2pr2Otli2ih6SXTRYloA73Aeg0Rs/HLZQ==
X-Google-Smtp-Source: ABdhPJxD9nkwwFH5MDltfGQ1F8ie8E+oQxf/cLIbZCIDDaZTLdXGxiJliHl3o9bHUSTW2JXBYnIcVUlvglSV7p28Rg8=
X-Received: by 2002:a25:32c6:0:b0:629:130:a037 with SMTP id
 y189-20020a2532c6000000b006290130a037mr244105yby.193.1646841035947; Wed, 09
 Mar 2022 07:50:35 -0800 (PST)
MIME-Version: 1.0
References: <20220308014419.3056549-1-eblake@redhat.com>
In-Reply-To: <20220308014419.3056549-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Mar 2022 15:50:24 +0000
Message-ID: <CAFEAcA9D0__GbiARWDg4+O9RAS=iEHFf5bUZyi8akL+CmZwdDA@mail.gmail.com>
Subject: Re: [PULL 00/15] NBD patches for 7.0-rc0
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 01:49, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit b49872aa8fc0f3f5a3036cc37aa2cb5c92866f33:
>
>   Merge remote-tracking branch 'remotes/hreitz-gitlab/tags/pull-block-2022-03-07' into staging (2022-03-07 17:14:09 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2022-03-07
>
> for you to fetch changes up to 395aecd037dc35d110b8e1e8cc7d20c1082894b5:
>
>   qemu-io: Allow larger write zeroes under no fallback (2022-03-07 19:28:00 -0600)
>
> I'm also trying to get v3 patches posted for my NBD_CAN_MULTI_CONN
> patch series, but given the close proximity of soft freeze, getting
> that into 7.0 may not be feasible.
>
> ----------------------------------------------------------------
> nbd patches for 2022-03-07
>
> - Dan Berrange: Allow qemu-nbd to support TLS over Unix sockets
> - Eric Blake: Minor cleanups related to 64-bit block operations
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

