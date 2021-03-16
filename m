Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F6E33E0AD
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:38:02 +0100 (CET)
Received: from localhost ([::1]:38000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHO5-0004kb-AP
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMHEh-0005ss-Ua
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:28:19 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:38683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMHEg-0000cq-4g
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:28:19 -0400
Received: by mail-ed1-x52b.google.com with SMTP id h13so23285536eds.5
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 14:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VwzWbvIXgYcPIiliYcQckQScU84iY33E6zO3kbxrpXA=;
 b=YHJfwz0de1nRCaePHLfb6pA+IkBZ9wEr2GWztDQaktRpK8Vh9AObIAgjggEGeY9Fri
 EDw9nZCwJrzF3ew6ricH89ylpmwxUhRmnZIwKCq+0mmq3ZU65zELnzeYg+vWRWOtiQWG
 1xdk1tyTlcNUUMU/jg7eigLu4LbloZheBISXTJ6uxfUAGjVhokS/2KSPFOdGv62K1B3m
 U7qpHg5NvzLdYf0igGMNGqWc50u9WuWbf/avCt4HDae8EjIU/50KOjAmIL9iT1WQYs2p
 ilpn23e1QuHXTdmJ05Hq4q4+e19pkRLwlpZlCYkCHUmC5CbZs8of2/zxvu5U8RS63XjT
 jygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VwzWbvIXgYcPIiliYcQckQScU84iY33E6zO3kbxrpXA=;
 b=tzQI/y2v03aNPVdTrWG2bdHtaHyIlwKmaHBMkRPzy4FLyq0oKiCHQjQwx06OFIPhmi
 wUSWek+Uy5wmOvpQAPQwDJRI/uBwPPpQey6X0xO5KpEOri0tjA57L5OXPga9G9SXc2vU
 4MEFzLjRDy/RyS5JWRHyPMqpiVO+Mtuy0pxx25CLNGbAQkvDYDNzIRn70R5LrzSeouIX
 SbgU52dwJJdB9Slm59Mbpv+UKJ04KKSBuQhNUPRxHlXQ2iHKcNHMxhCYxCLRvbKnV5iW
 /S/bGfRUlqDtrMgaKvi/A6WJSFnOB4dJQ8zWZYss7XkJDYZsEye83bp8MW1Pb2QNtkn0
 41MQ==
X-Gm-Message-State: AOAM533I1yNb3Rn0SnlB2hZfhyIVLSdB5nbnQ9+8e0tnFcFTbH7DDkKO
 cyfhVwcVeUz0kxRgkPr1CaFFLw9GXTJ3d23y6Qrk6g==
X-Google-Smtp-Source: ABdhPJwXz41ipXGSKdfG67B/D2YeJEHHkNLwfSaZbLBQSmo1E3/nyx5sJQAZjqMuwB0cF8XDGM2wccwwqj8BBTYtd0c=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr37985127edv.44.1615930096023; 
 Tue, 16 Mar 2021 14:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
 <1615799673-31549-17-git-send-email-jasowang@redhat.com>
In-Reply-To: <1615799673-31549-17-git-send-email-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Mar 2021 21:27:53 +0000
Message-ID: <CAFEAcA94g-5CEf2n=TiZ4yMK6KNyJY3KNv3YnrfmAaiRTo-w7w@mail.gmail.com>
Subject: Re: [PULL V2 16/20] qapi: net: Add query-netdev command
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: Alexey Kirillov <lekiravi@yandex-team.ru>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 at 09:15, Jason Wang <jasowang@redhat.com> wrote:
>
> From: Alexey Kirillov <lekiravi@yandex-team.ru>
>
> The query-netdev command is used to get the configuration of the current
> network device backends (netdevs).
> This is the QMP analog of the HMP command "info network" but only for
> netdevs (i.e. excluding NIC and hubports).
>
> The query-netdev command returns an array of objects of the NetdevInfo
> type, which are an extension of Netdev type. It means that response can
> be used for netdev-add after small modification. This can be useful for
> recreate the same netdev configuration.
>
> Information about the network device is filled in when it is created or
> modified and is available through the NetClientState->stored_config.
>
> Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>

Hi; Coverity is doubtful (CID 1450841) about this code:

> @@ -668,12 +686,65 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,

> +        if (!stored->has_fds) {
> +            stored->has_fds = true;
> +            stored->fds = g_strdup_printf("%d", fd);
> +        } else {
> +            char *tmp_s = stored->fds;
> +            stored->fds = g_strdup_printf("%s:%d", stored->fds, fd);
> +            g_free(tmp_s);
> +        }

Here we have a bit of code which maintains stored->fds as a
colon-separated string of integers, by tacking the new fd onto
the end of the old string if it's already present.

> @@ -731,6 +813,15 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
>          }
>          options.opaque = (void *)(uintptr_t)vhostfd;
>
> +        if (!stored->has_vhostfds) {
> +            stored->has_vhostfds = true;
> +            stored->vhostfds = g_strdup_printf("%d", vhostfd);
> +        } else {
> +            char *tmp_s = stored->vhostfds;
> +            stored->vhostfds = g_strdup_printf("%s:%d", stored->fds, vhostfd);
> +            g_free(tmp_s);
> +        }

Here we have a bit of code that's kind of similar, except that
the first argument to g_strdup_printf() is 'stored->fds', not
'stored->vhostfds'.

Coverity suspects cut-n-paste error -- is it right ?

thanks
-- PMM

