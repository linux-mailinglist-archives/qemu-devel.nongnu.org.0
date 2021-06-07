Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 253E839DBFD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 14:09:41 +0200 (CEST)
Received: from localhost ([::1]:49548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqE4Z-00046Z-NB
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 08:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqE2C-0001z5-1E
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 08:07:12 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqE2A-0001fB-5X
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 08:07:11 -0400
Received: by mail-ed1-x530.google.com with SMTP id f5so15024043eds.0
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 05:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iE2cCnge0PdSYUq/ff18wBR1zjeEPLGjkEeq4i0L6E4=;
 b=Q6JrSJrUtwWlAcFq2aIPxZRXMVj9vpQ4L2IBE+DBW8RgwRMLMo/Yqund6eaMdqKcvt
 kyZAlAaAuGQtjUgUYqLTLVJPskZWKJpZkiILeTGwGfurmdZqEryxF8BzNrhoFnAd3WND
 48ENipkFwpXcJm0XDWMWtfQCtla00A58Gd1tWi9F7rN0dfDweWJ3QVPjgb8Ks/B/n91e
 XdDOg7Utpzj2U0omntmj+imtI1P+8fmDxAtTLrC9lLmxHRjNm9kJquymIQlQV1G3Uekq
 uliFfjFiVVRM2VXsat8uwUNybvWyNXm26sYZmloSBAGknhsaKdnlrztO61S/TvJaduZY
 0fLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iE2cCnge0PdSYUq/ff18wBR1zjeEPLGjkEeq4i0L6E4=;
 b=BIjKgkelqqvM+FEUobqFYCZGMKVJ9nGYtRuV2UQZkBOWYJnRkhuA1kg3CRDp4Ma9sR
 mCnQfcI2UMM6FF1qRYaZ/bw7ta7Pniupl8M50ccTa9dsk1s5Btep3387NN5Gb84H4qKg
 ckND6jt9aqNfQyqBpzStkqerUxCRD/i16v41iJ/bS8+6lGxkJNvx/LsXbryZVG2sfYME
 xNKeoYkwjzTkRTnAMLw0jlxfpMKsVfWko38iC56wIlb9wR4m5jgCurVx/wJmptRTRzm9
 Jl/GA84vDhj/ZcWtv6KdheJ36gasXXctgnC3uyj4OPUt2wtOSscEtRC0QusX+LXoQqmP
 LeGA==
X-Gm-Message-State: AOAM531JyTCXnUiyXkyUiwuOAasLdDQnRZIXKnqR2Ty0D7zDhqBZZEGQ
 Xo5aZgmh7fUTzhb+IBHcdnA+9Q+zLaLjT2+aX+pONA==
X-Google-Smtp-Source: ABdhPJwazdfsqk4mqKNntEZGxm7bHwV5/kxZIJTYsX2D6iIdJzn3UvTz83XM7EEBAkyjDnMPb5C+ybQDoFHM4nfcRaI=
X-Received: by 2002:a50:a413:: with SMTP id u19mr15170376edb.251.1623067627732; 
 Mon, 07 Jun 2021 05:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210607114844.2015685-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210607114844.2015685-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Jun 2021 13:06:34 +0100
Message-ID: <CAFEAcA-sQzZ2DFeqEU19W1h=SL2WsTwnAYSEJUomM_Yxk5Sf3w@mail.gmail.com>
Subject: Re: [PATCH] RFC: net: document "-netdev user" explicitly as unsafe
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Jun 2021 at 12:50, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> libslirp is known to have several security flaws, we should make it
> explicit by warning the users and in the documentation.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -388,6 +388,8 @@ static int net_slirp_init(NetClientState *peer, const=
 char *model,
>      char *end;
>      struct slirp_config_str *config;
>
> +    warn_report("User mode network stack is unsafe!");

Not enthusiastic about generating new warnings for a huge range
of end-users, especially without detailed information about
what they should do about it and suitable new command lines
(including ones which will work for everybody, not just "I'm
on an x86 PC with pluggable network devices").

Also, -net user is perfectly fine for quite a lot of usecases.

thanks
-- PMM

