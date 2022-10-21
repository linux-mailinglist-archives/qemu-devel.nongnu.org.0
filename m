Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9E26082E4
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 02:34:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om0CM-00046J-J5; Fri, 21 Oct 2022 18:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bjorn.forsman@gmail.com>)
 id 1olxmm-0003IN-C4
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 15:34:28 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bjorn.forsman@gmail.com>)
 id 1olxml-00065q-0V
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 15:34:28 -0400
Received: by mail-pl1-x632.google.com with SMTP id n7so3256652plp.1
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 12:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jGLRZeQCEKrpYmmrX5ulyMqkM4XX3BjcnzH3CfSUfOQ=;
 b=fOyLTBOJMXFxplp83k3G3EO7uB39pnIunmapLvlf9FWXq5jL8/P+3w5Dr+tnBhjto0
 ECeFU1zxJE9YJSOJXzjQuy+64R/Xzz1qeAPRUdIlypMbWmEj0KINu+HhVlT9sA5Mc9hV
 TUHH9C2wwmtph1Loxm9+OWCnAv1gnj9dYQp+xuyv5f/SPI81w2ChUOYbQSBR0bP9oYBr
 jrilAp/aXrsVJ8GAY5cJaDraJSLY/WYzuyaoi26RIK/T2GAZkLzhGibsczdTaha0TC1W
 3Tet/ezOCYF7mn5I5/003yyDlpJF52pAtb0BCkBmvgxcGCWWFGcVY4CgCgu7rhHU3heI
 9brQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jGLRZeQCEKrpYmmrX5ulyMqkM4XX3BjcnzH3CfSUfOQ=;
 b=6fBX+oD6zOMuyTVClXUhDzN8fH9XOYmDwC/xG138cP/cww4xtL9nOroeGrdx2dLd9Z
 5nVlj3S+VA7xDJUNoaApmhgh84mr2Ik/m4mYEA1oFJ9GJmitBh4eIN8Wi2vS4zzZM6U+
 d63SSBSSbz3nDBouq8tWXn8XqxVES0spK5vo8sjq6KM4VsluFFXAYVvjXoAmip2VcFn0
 uqbBlh0wnNy3rgsS9xD+AWKqgg5AJlvAvV+InsTFj0kSVL1NwkgvMMaqlq9MZ2cfyioH
 nJjziYK97/xC9seNj21EvJpAGNLV2iZ5hG/PoPTG4Ev1fyYi0RmZzJmaUro/JdLo5Bfv
 5FpA==
X-Gm-Message-State: ACrzQf0/HKvFm/we24LfDKHh16b6vPzZjCIvgEdrGr15VuGScP26GLO9
 wb1X4qxC8MXEq2AxdnpNJofBrj0cI9xEr8HKlg==
X-Google-Smtp-Source: AMsMyM6FpUGrS9PKufXcYbTCfXbxiLQGzMHEu8T0MacJAPiLWnzAbzqXHP+CUoSbL09J3cHXWDL8VoefVM/oXBvEZEg=
X-Received: by 2002:a17:902:ea0c:b0:181:61d1:ac1c with SMTP id
 s12-20020a170902ea0c00b0018161d1ac1cmr21084938plg.120.1666380865511; Fri, 21
 Oct 2022 12:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221020220346.124381-1-bjorn.forsman@gmail.com>
 <CAJ+F1CKhatwA0i-KUF0pkS+8GxaP7v0cox1rpEj6KCVCR9e9bg@mail.gmail.com>
In-Reply-To: <CAJ+F1CKhatwA0i-KUF0pkS+8GxaP7v0cox1rpEj6KCVCR9e9bg@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Fri, 21 Oct 2022 21:34:12 +0200
Message-ID: <CAEYzJUEuWx5LfypYQLANuQSE+6p_m1somtrWXvONwhLr9B-5fA@mail.gmail.com>
Subject: Re: [PATCH] qga: add channel path to error messages
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com, kkostiuk@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=bjorn.forsman@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 21 Oct 2022 at 08:53, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
> [...]
> Wouldn't it be simpler to modify the g_critical() in ga_channel_new() ins=
tead?
>
>     if (!ga_channel_open(c, path, method, listen_fd, &err)) {
>         g_critical("Failed to open %s: %s", path, error_get_pretty(err));

Sounds like a good idea -- it's a more central place.

However, I'm hesitant about doing that now:
* This patch just syncs channel-posix.c up with channel-win32.c.
* I don't have a way to test the windows code so I'd rather not touch
it (which I think one should do to keep the win32/posix files mostly
in sync).
* My test iteration time on this code is quite slow.
* I'm a noob -- first time submitter.

Can we merge as-is please?

/Bj=C3=B8rn

