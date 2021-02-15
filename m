Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E2231BE51
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 17:08:43 +0100 (CET)
Received: from localhost ([::1]:37190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBgQU-0004gr-J7
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 11:08:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBgPY-0004Fj-Mz
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:07:45 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:44001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBgPX-0006hN-3h
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:07:44 -0500
Received: by mail-ej1-x631.google.com with SMTP id i23so5759477ejg.10
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 08:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lbkE0M2bZ9dMoyxLBrR/DCqdLmd5KLs4erf002V53Kg=;
 b=xfjHLrT0gB01SVXvEpTln2f3z8ufUtDmRgPZwu4byhUdvxftnUhH87NFfFZc5yp8Jo
 DnG8At0cm6aUwZqk2ukCgqwuPVHQk8gOSvuqCA+p9bhMrkoj7jFKr7GrZjc4cp+rzvJG
 gpEQziYkkzGveAmziIVQdsWIDhVPw2BSdsx98khavcNY/mEuCSFsUXvX7nO6PIpqOgj8
 vh29OlMacDGpi4ZRi4trmRxSGtx04THgv/gV8bucJ+4/y5RPc5+IBOlRbCbXrKMPX5aT
 Tx3bYdha58YRgi2NHZJVFxp6pVMgGFqH7UfbJwuEFNPvJwcW2OqSCXAbx4JgkGUusgmQ
 kycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lbkE0M2bZ9dMoyxLBrR/DCqdLmd5KLs4erf002V53Kg=;
 b=aq1ZBUeMJd7qWAEvlXKNg5aRq/5QxDn4VyDrj8KqM+T7TGMqThBJ8wBUJfix1zsdup
 TxtpQYlRYfeTz2qFYgNBQqgd1ZDjh1AGI8dBUc+KU3SW7f6RiZU3QPoeXxkDVUO1zbTY
 ia4BH2wHsn+7NhM2JL5isHpif18FHHM5ZPnYogdSfTLjkH5pC9hE3TUDMcbsH9nHrEPp
 t1Mx6Gqw8r5kKSA1JSXstyZQ7vYGCIagVjTddHHijMxBELNUkD1MlD/YBJ/jEYexA4iY
 VNsm7hR5E9T7qf0SrMvw97VCDDjdlpAO/guz8tRM5WuRAYypCoDi9kwP5+8/HRw2HhI/
 jDMg==
X-Gm-Message-State: AOAM533SCfVf0gPGHBq/TsI3+xu2yO+6tEykdkt4etT7i0i5VkDnyV5g
 2gRL8G889Sh9dzXOHfK1RCeqmWdPU+7nZf2+zt/2xbRHAcI=
X-Google-Smtp-Source: ABdhPJymfUpBtIzg27kQiSr0KIQo83nnC2xEN2RSYPObnV3TAzkU5wECVWGpH8JW01pydj3TlNiVxnDohijxfSvRU4A=
X-Received: by 2002:a17:906:3a89:: with SMTP id
 y9mr16300854ejd.4.1613405261326; 
 Mon, 15 Feb 2021 08:07:41 -0800 (PST)
MIME-Version: 1.0
References: <20210212161311.28915-1-peter.maydell@linaro.org>
In-Reply-To: <20210212161311.28915-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Feb 2021 16:07:30 +0000
Message-ID: <CAFEAcA-ZHGhswRe9mAYCz5eZfZ2hSq78hde-5k_1YULFJ7-DtQ@mail.gmail.com>
Subject: Re: [PATCH] docs/sphinx/qapidoc.py: Handle change of QAPI's builtin
 module name
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Feb 2021 at 16:13, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In commit e2bbc4eaa7f0 we changed the QAPI modules to name the built-in
> module "./builtin" rather than None, but forgot to update the Sphinx
> plugin. The effect of this was that when the plugin generated a dependency
> file it was including a bogus dependency on a non-existent file named
> "builtin", which meant that ninja would run Sphinx and rebuild all
> the documentation every time even if nothing had changed.
>
> Update the plugin to use the new name of the builtin module.
>
> Fixes: e2bbc4eaa7f0
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/sphinx/qapidoc.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master so we can all stop wasting CPU cycles rebuilding
the documentation :-)

thanks
-- PMM

