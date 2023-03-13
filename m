Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905BE6B7EE7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 18:10:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pblfy-0008PR-Pm; Mon, 13 Mar 2023 13:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pblfw-0008Oq-W4
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 13:09:33 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pblfu-0002oI-4P
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 13:09:32 -0400
Received: by mail-pj1-x102c.google.com with SMTP id kb15so12757932pjb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 10:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678727368;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=03IQcUsRg7qASUmrF84Q3wh2BxDd5m4j8ye3VrsXtVA=;
 b=gcgiXaJoyPtvXyi7fGs/gX/RuWlo5k1MTekBtjKlnWcKmPxtu+wq2KvSmO9kvnvIJn
 m6TnWAZCM9kDfX5DhouxGHKn11wJva8dmApIS0mMsbJNSntUMUSIBsJuzeJr9lsIjhsC
 MMrEOmBTgN1sU5jIOH4SoBTZx8Fs+64BOWE3kHvhgowncRFMWiehF3HiQgokUJWZHbmn
 opg9cm2SbEYZsxrkNSoxf6PzAeyp9oSVn9k8Se06qq2HC/I5+AcOEnZ/in3CpEZYXnw6
 GTOk9yLSGGicr6v+gk6p5mtbPBuea+DRPmGkYqi1qYVVoPNYE6tBToXLtnmr7nC+YuKj
 F+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678727368;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=03IQcUsRg7qASUmrF84Q3wh2BxDd5m4j8ye3VrsXtVA=;
 b=4PUJwZ31uic/LOZwiLeKXOkjMhFVjM1PfIDpvHF3KGGLyZmIPzbrEPHzgZdFRSC/01
 It2oegy8PjpIl2AxGbVFMs1qoVzbvnrbvenS9u1OgyJ/DbZ7JNHOPHYsQ+65MBeDAhUt
 kKLytv+o2v4IowW2JJY4VvPwg1e2XZvA8f388/ps5y9/AaeFnFkGiepw2cHqTEtxXDpi
 5NNLkjSRMIypN+MKzUjcLKLMBInXMhBB4UR1Lb77VsaZofjDMmjIcxoWUy0CJQFwEBc3
 paxiCYfUmeqfDyY4Fj21GZFIiOn9kyHjuLs2B5BQiBm03rNjdbw0+Bt5vT6wlC8XZzU0
 WvYQ==
X-Gm-Message-State: AO0yUKXlxfSA9CZMqYGKJPq459/EcmhCUgKXQMyFrNzuH4oEiTXcbyXL
 YB+9H9WxP17q8yteUXQj3uXstWZ1SapW5tcvDWfZug==
X-Google-Smtp-Source: AK7set/4d7hQmuZDoG5vUjUiFeuGELCFVp0ln3zUzjXs2zx2X9XrDdSOpKsjUt7LWWA3qBf1YE0ixkdh7oG9Q98u70U=
X-Received: by 2002:a17:903:807:b0:19f:87b5:186d with SMTP id
 kr7-20020a170903080700b0019f87b5186dmr2134515plb.9.1678727368487; Mon, 13 Mar
 2023 10:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Mar 2023 17:09:17 +0000
Message-ID: <CAFEAcA9WO57pN2bD47wgV0W3o3pUr26N1-iEbkXmDxgFCztpfA@mail.gmail.com>
Subject: Re: [PULL v2 00/25] Win socket patches
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Eric Blake <eblake@redhat.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Thomas Huth <thuth@redhat.com>, 
 Fam Zheng <fam@euphon.net>, Beraldo Leal <bleal@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-arm@nongnu.org, 
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 13 Mar 2023 at 11:46, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit 29c8a9e31a982874ce4e2c15f2bf82d5f8dc35=
17:
>
>   Merge tag 'linux-user-for-8.0-pull-request' of https://gitlab.com/laure=
nt_vivier/qemu into staging (2023-03-12 10:57:00 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/marcandre.lureau/qemu.git tags/win-socket-pull-reque=
st
>
> for you to fetch changes up to 4bf21c7f748bee42b6f4692f8c37a11d1033b2d1:
>
>   monitor: restrict command getfd to POSIX hosts (2023-03-13 15:46:09 +04=
00)
>
> ----------------------------------------------------------------
> QMP command to import win32 sockets
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

