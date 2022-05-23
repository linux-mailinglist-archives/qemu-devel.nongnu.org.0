Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF8D530EAE
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 14:34:08 +0200 (CEST)
Received: from localhost ([::1]:34928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt7GB-0000qh-Iy
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 08:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt7CH-0006j4-Qp
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:30:08 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:37499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt7CF-0004TG-Jv
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:30:05 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ff90e0937aso71305987b3.4
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 05:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JqyyCqMA72dZNAZbcC8RLmbGpUM94xQI56dVpZ/5fNw=;
 b=B+JQzCoRNa/UBacheyVJh3OJFiqodFNcditMqyQW9BX6lpIntiLebaewSqd1WDVo19
 lzx7g6PhK+gTdm3fVh6Wpjaasq23zxjlfISG2EdaHhGGMIXwjHU55+bOL1TAt8i5UCxk
 ZT6sLYvEm6Ac0mqaooer0PNyDFxnI4Tm6EPxLsmbn4rIZjoXJXf+JydnH54bsTaL3CQ7
 Z/S9u6SteW8VTq+flm+nB4ATfJrvjOA2phlDetbsLacELSsItl6XLQu0TaiuLG1nPMtr
 65cFb1dOL5SV1/ncmqnuhp+J0yt1CyDr7BoqU1LjGsmaj4o6qUQjRTD0wMhxkmzH7YHO
 Zt3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JqyyCqMA72dZNAZbcC8RLmbGpUM94xQI56dVpZ/5fNw=;
 b=FLQsGTcbHl8ZO4/NUKGHF3J8dkCkcSjpkJ1KC8m2pUgBovWbMe5+pgVQcz2EooLdI2
 WC1UU6N6Hyz9wWN1AwqFfp8LRE/NWVleDmiUaC7mSzMwHVDKvcmHy6AaKPixKTXoxdgp
 jskf9eKtqg+R3AP0ckRlO9s5D3s3Ef9PAc1cBfPdAruBQkR64/JPY6a3tQV4pr/VCkpx
 WlEUIBoIwyA+k1M8XsX8f9ACsN37b5ZAIGcp1HRICHRkob7/gi+y5TRP/gpPGE3Ybpe1
 RY8KwmG3rahw20nEGZnFvIoxDWGnYAhDkW3KfNISaakOORL0hxt/dkCfOdKOWzzV2xXw
 O1og==
X-Gm-Message-State: AOAM532AY5JeHgERYo0x+GvtZorSouY4Qnl3Kv6Wj+KkDckMAr5UIp9X
 Iu35ZshCi9oFYNX068kwMXixZLYNOQpRwu9ikPpTYg==
X-Google-Smtp-Source: ABdhPJwKf4VmxX4KJ88xkkLpZm/rd8zuubsa9OyBJIHIqI9xhW7sm7A9NC2oekMdT62aBdAc8LxuS1DFmTTexTzYyBM=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr23460836ywf.347.1653309002010; Mon, 23
 May 2022 05:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220513180821.905149-1-marcandre.lureau@redhat.com>
 <20220513180821.905149-6-marcandre.lureau@redhat.com>
In-Reply-To: <20220513180821.905149-6-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 13:29:51 +0100
Message-ID: <CAFEAcA-k2Z+NtQSUn2KkDa_VBn=P7JB6kBk2bOJ_CJTphBfGzg@mail.gmail.com>
Subject: Re: [PATCH v3 05/15] osdep: export qemu_open_cloexec()
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 13 May 2022 at 19:16, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Used in the next patch, to simplify qga code.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/osdep.h |  1 +
>  util/osdep.c         | 10 ++++++++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 67cc465416..64f51cfb7a 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -489,6 +489,7 @@ void sigaction_invoke(struct sigaction *action,
>   */
>  int qemu_open_old(const char *name, int flags, ...);
>  int qemu_open(const char *name, int flags, Error **errp);
> +int qemu_open_cloexec(const char *name, int flags, mode_t mode, Error **=
errp);
>  int qemu_create(const char *name, int flags, mode_t mode, Error **errp);
>  int qemu_close(int fd);
>  int qemu_unlink(const char *name);

Where we make a function global and put it in a header
we should generally add a documentation comment describing it,
please.

thanks
-- PMM

