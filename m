Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477CB565A5A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:50:11 +0200 (CEST)
Received: from localhost ([::1]:55154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8OKs-00074p-Iy
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8OIB-0004xV-45
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:47:19 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:34805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8OHx-0006SQ-42
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:47:17 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-31c86fe1dddso38149707b3.1
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 08:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G2VviwhKH4cea/lMKAVP9MoNHjWdTPuT0MZL4l0dZNU=;
 b=klJg/2rOPWSgP5nixVbB1EYt6D3S3yWsJ8PmD6i6FaG0C51hLCypP+5KENHrG4HJo8
 oqI5zD/cd2NhWGsNVSA8zW2ZPJ+VKiW4vdQDYFuwh6sbNnrcR1XJSrZ5AdAZekIggcC+
 wOzw5l7sxJGSP/6x7JU+LuLu3sA2it5sRsBveXtHD4TuE9MkapseBzXnLavWcgIMAcEa
 WL0SBGI3M92mucitSrpQAR9+eBgPcTqIXOyJ0xTR+5PwDKp7GLK0igrLFHXe/Ns5srLP
 pfL/a4eEJ7K2QiUnGRhbs9UIDWR+6kz2uw2/nvzEYpC3t/5DQfD28q+1Fo9c0DLRxXJ8
 rM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G2VviwhKH4cea/lMKAVP9MoNHjWdTPuT0MZL4l0dZNU=;
 b=pA7iGvOAea06ieKNYfKuBiJ/gv3bKy8qbWVnOzjiiZg69e0CFjHTCHtbB8kVkCHtka
 b0MG0EmXJy/8vxc1kQdwu+7O0y73Il2nHIljQzfMGCyLePqJ15hWSXxmbyyqAroETNrF
 l+y/TmWkBf7MZYffXn+n8aPFKpFcLPogtVh7Zs6fH3bjLUXVxZc1jjDQbuLV5iZMlB90
 +tUyx8gjxmQZPrF0nSyyG5lzdxkBhUYEo+/mMuqXr7Xc37ALfI1VJEH82Mmxg3X6IvT/
 ALhNdtDzlRa6eu/M2dhyKqFMDdmvhcriMDc3c24t9cFeP0fc5YjWvNBoAUQW3K1Ac6bK
 GL7w==
X-Gm-Message-State: AJIora9kysBl2tbSJEFyr9Yt72q/VpLAGb6uVC0YdCu1ZaQRlF+47vao
 l4+S3skdPdse2TBN6hHTndgy2787DAVL16vPshmFnA==
X-Google-Smtp-Source: AGRyM1uFQQJPodLyZazfDzKCdPvcbFMiWCZVBN1tmiGSMCKI4y8sknto7y6sWmrUg2TKxJjsxEgtpnyqNl7EQW9RRe0=
X-Received: by 2002:a81:6585:0:b0:31c:b55b:dd36 with SMTP id
 z127-20020a816585000000b0031cb55bdd36mr1600012ywb.469.1656949623924; Mon, 04
 Jul 2022 08:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220704152303.760983-1-berrange@redhat.com>
 <20220704152303.760983-2-berrange@redhat.com>
In-Reply-To: <20220704152303.760983-2-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 16:46:53 +0100
Message-ID: <CAFEAcA__aTeaeB8JbMQdUz=4_6W8J5m0wOsYWBgj3RLrm=G_uQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] tests: introduce tree-wide code style checking
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 4 Jul 2022 at 16:23, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> Historically QEMU has used the 'scripts/checkpatch.pl' script to
> validate various style rules but there are a number of issues:

>  meson.build              |   3 +
>  tests/Makefile.include   |   3 +-
>  tests/meson.build        |  19 +++
>  tests/style-excludes.mak |   4 +
>  tests/style-infra.mak    | 265 +++++++++++++++++++++++++++++++++++++++
>  tests/style.mak          |  24 ++++

From my point of view the main issue with checkpatch.pl is
that nobody in the QEMU developers particularly understands
it or is enthusiastic about trying to add more tests to it
or adjust the existing ones where QEMU style diverges from
the kernel style (but nor are we tracking and upgrading to
newer versions of the kernel's script).

This seems to be aiming to replace a complex and hard to
understand perl script with a complex and hard to understand
makefile. I can't say I'm terribly enthusiastic :-/

thanks
-- PMM

