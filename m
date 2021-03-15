Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B5B33C535
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:05:50 +0100 (CET)
Received: from localhost ([::1]:35232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLrbB-0002WF-Bk
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:05:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lLrT4-0005XL-Gk
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:57:28 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:47085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lLrSy-0006Tn-Fc
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:57:26 -0400
Received: by mail-ej1-x636.google.com with SMTP id r17so67760226ejy.13
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 10:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=xAyGZWeUWFWpI/bBK6E+xlwGFkzbPAhoo1MztT8wvPI=;
 b=mphILpUPO1A6rZ3l78Q987+GARNx61qtrM7mZ9iL/Ccyl1BPqir/mJcwRqIvU/fbdb
 HsW4FRfzPAEZR4TkSIzqdcJZg6YSS+7+Q25OQrVE81n1CyWagY2X/dOitgzDmePH3GPr
 CKMg6VddYtA6RRZzIjS+hRq7r3qMF8fn1PTfFoeEUITVIGIWtFql/EjjTFazm/wkPgaT
 BT5nnJCrAQtNw/9STE4H0J1ldWMt0imWjwNDncw5bun2gwJPRqOWysCV9KUWU3GwvXYc
 KqB3+YiG8pwULkoTFClqh3ggGaIsxnlaHrnIW//4aNiG1W5Oz5ahAYR1rF/Fgmk5umX6
 Lxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=xAyGZWeUWFWpI/bBK6E+xlwGFkzbPAhoo1MztT8wvPI=;
 b=DUFaU0WT5bJ7gN2VbZKjYjZjpnS9vURf5tCN4f09SJFL/LcexW+2/qkLO6DQsOdr8u
 oN8fm/yeG8w2ykUEgL/dmbKbGybWzwpHaMfHzpjTGQCaGDXEAsYdXMhE2ymEkJG+cUUO
 3ByJeIY74r447uJYWUm/Hwu1ZahJx+eO5T/Go3bmeeXcw5a17LBTOd0eJOMHxkKfs/ag
 6XN4iwVOFf03w+zBrTm3+B1qLC1ZEGL72AOlgNdVb2fS+OiDPxLfJg+oxE50Xq7Qrd+R
 wXpzPKIUaUYZVKq1Xi03WXDnmc+bKKqcdJU5iTBw8mkbjEzHvov8FYpN3wcOWEVqOcbM
 2n1g==
X-Gm-Message-State: AOAM5324vR/gmVWxIIWxh5l4M0RtyHnZo+8uu5cbIy6LBWEbnTgOfUk2
 v/oWK/U75RoJeL8BG21EEUBlww==
X-Google-Smtp-Source: ABdhPJwhgvq95XR6qJPuAFb95tlnmC/q4UmrMMbxDwIrGsgfL+U8uGfE8PuyOHa1rc+h5tYC+bwK7A==
X-Received: by 2002:a17:906:7d48:: with SMTP id
 l8mr24698665ejp.108.1615831036456; 
 Mon, 15 Mar 2021 10:57:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 14sm7848354ejy.11.2021.03.15.10.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 10:57:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F342C1FF7E;
 Mon, 15 Mar 2021 17:57:14 +0000 (GMT)
References: <20210314032324.45142-1-ma.mandourr@gmail.com>
 <20210314032324.45142-2-ma.mandourr@gmail.com> <871rcg9z2q.fsf@linaro.org>
 <CAD-LL6hewvhVYrH6XAxouL5x3BK4izoWCVnEw1+h_bAW9bH0kg@mail.gmail.com>
User-agent: mu4e 1.5.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 1/8] bsd-user/elfload.c: Replaced calls to malloc/free
 with GLib variants
Date: Mon, 15 Mar 2021 17:56:21 +0000
In-reply-to: <CAD-LL6hewvhVYrH6XAxouL5x3BK4izoWCVnEw1+h_bAW9bH0kg@mail.gmail.com>
Message-ID: <87mtv48flx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

>  Given this is start-up code I think you could use g_new instead of
>  g_try_new. As it will abort on no memory you can avoid the early return
>  check bellow. Also is elf_phdata never persists beyond this function you
>  could use g_autofree (and use g_steal_pointer on the one case when it is
>  returned if you need it)
>
>  I would also split this patch, one for each function you convert.
>
>=20=20
> Thank you for the valuable suggestions, these are obviously the better=20
> way to go. I will hopefully employ them.
> I'm now busy with my final exams. In a week or so, I will make the=20
> changes again and properly, split the patch, and then send it as a=20
> series regarding this file.

We are also trying to improve the language in the coding style document
if you see the thread:

  Subject: [RFC PATCH] docs/devel: expand style section of memory management
  Date: Mon, 15 Mar 2021 16:53:12 +0000
  Message-Id: <20210315165312.22453-1-alex.bennee@linaro.org>


apologies, I did intend to cc you as well but forgot in my haste to post.

>
> Thanks
> Mahmoud Mandour


--=20
Alex Benn=C3=A9e

