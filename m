Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9C92C65E0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 13:47:09 +0100 (CET)
Received: from localhost ([::1]:53472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kid9Y-0002G6-Ri
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 07:47:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kid8A-0001oc-Ol
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 07:45:42 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:43386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kid85-00022u-5B
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 07:45:42 -0500
Received: by mail-ed1-x533.google.com with SMTP id q16so5549599edv.10
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 04:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9+Me+xJQqYeDyQqtZ0BwjIptRq7has6wYn7cRKlg6QM=;
 b=HerGooK25/W1vVP04TgynPI2dIyzp9s9seFw9S6q8rQMEJDKze6YlnioB9ZEmfdSia
 xRv7xYesq8EC5EceUF3ZdL58vYPvGnXimr4ubeL9VMzJ03pTGixZC2HMFF0fUwDzKihZ
 JxfYX2U/vWLDZ2SeY7TdOlTiP/aUvEF4EsoSiH17FVciBIiXz37DIXJJ7Typ5fr4bHVA
 jPUlMlMjNLMjdMZ8vBTqNiD4qJckzeEQZHGSEs5dA35yfE/g/RVTqZhdou/9FW079Bap
 sGU+25ULlBvevHS6jxDTWTwSi+HR3o9bYRGBRAjzmcttyrJlcGOEQZx058bN/UaxLPSC
 Qs6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9+Me+xJQqYeDyQqtZ0BwjIptRq7has6wYn7cRKlg6QM=;
 b=b7Qa4f6HhVbOw/FXmw4yPpIX+Dw0zUTQc5GjdVc6Lv0n03xLTNKeP1YzrhFqAoEuvl
 6OPKizEb6DML3m/lI6Vrv1DtLav05V6Sr10fdlMMR5keL28ElA3M71X8kmBxOZhyWefg
 Dd1n2KaVRJVFe/KUO5SHc+71tgAUQImUK886zauAd7Fp+hb9nQfaqkHfrYJZLAq3jt2y
 Oj4jmuRuqb71wp4S+MFiAhsaqg5CZkprwLvLx6dT+C9YV685f6NWh0aHSISItoG65mIj
 IY814yb6Wdi6QKzcuNchs6DfOu5Sjn0C3muyG27eo9RmO+dZBA8xzDF7+D641K39loLs
 iYYA==
X-Gm-Message-State: AOAM531yljO99BV1wRpH8FBWb7WJBppwzh+3attJh52wBH6RXGkShCUw
 pDWvBodFiBe/qe9lCWq4+0jyE5LSWOpasymVVwJy9g==
X-Google-Smtp-Source: ABdhPJyAuTU6mkCfXjymPqJ4UmcJV2NqfM3/t52T8anl7sznBsw324phcYNZko2+z6Oxi58Mjdd8PherJkwvgTIyAS0=
X-Received: by 2002:a50:fa92:: with SMTP id w18mr7393152edr.44.1606481135327; 
 Fri, 27 Nov 2020 04:45:35 -0800 (PST)
MIME-Version: 1.0
References: <20201127070710.8851-1-kraxel@redhat.com>
In-Reply-To: <20201127070710.8851-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Nov 2020 12:45:24 +0000
Message-ID: <CAFEAcA8itGiHfPg6NJHOmG8eHTyOTf9j9kRf73f9GrvH4F+w4Q@mail.gmail.com>
Subject: Re: [PULL 0/1] Fixes 20201127 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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

On Fri, 27 Nov 2020 at 07:08, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit dd3d2340c4076d1735cd0f7cb61f4d8622b9562d:
>
>   Update version for v5.2.0-rc3 release (2020-11-24 22:13:30 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/fixes-20201127-pull-request
>
> for you to fetch changes up to 6fc5183a65b59d43441296cd2f72f8e55dc5dd04:
>
>   qxl: fix segfault (2020-11-25 12:33:21 +0100)
>
> ----------------------------------------------------------------
> qxl: fix segfault
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

