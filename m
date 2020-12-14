Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697182D964E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 11:33:11 +0100 (CET)
Received: from localhost ([::1]:49198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kolAE-00029O-Cw
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 05:33:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kol7Y-00016y-W1; Mon, 14 Dec 2020 05:30:25 -0500
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:45475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kol7X-0001s1-9O; Mon, 14 Dec 2020 05:30:24 -0500
Received: by mail-yb1-xb44.google.com with SMTP id k78so15051885ybf.12;
 Mon, 14 Dec 2020 02:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W1nOVW6vpV4RMIvnGQchOOBYWcL+YJha58w53tValYQ=;
 b=N9N+ewHKNzgW2VXmZT0ljvzFSyWW/DLMbi6xNgBEY2xKxn0wh2jc6YD8PE+YuSdZqB
 /1smFUN0WoRr0yKTwlnp1VXWhkJrqUtd5ta4TXD78EiFNjrWROVl8GYwSaFQdbuDLR/P
 bWXmv4mIEVnMgf8KFVgZwRDRdjnZBPUD1GxdKfPWWvBDxcUFd/8Yg8nwf3U391JIwwTh
 kYzrDnVPC9/Zmmkyjlymhteipv/XkYYC/pgOLewNDBWOU3M148YRydcDRmsOHaDnsW4m
 GM9rTjkwcGbUtOud2FiW5iNEHaoo7EeerB83VwOLf1lfgx/sKo4v5uXGZCmJLbNhINkd
 vzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W1nOVW6vpV4RMIvnGQchOOBYWcL+YJha58w53tValYQ=;
 b=r3uYHtr97tIxbEGWjfcvMCaMW/t/88dc9QBoeTYl6Byl9ky+Bl/QHeOeI96WRJKTyp
 tGAn8Qlu+B8EHNW50o47o7VP6MM7JiClnCgd9a+ImFT1AN8IHD1e3pNsClVK5cKWqG2o
 Jgnr+Fo3cAwAoVWVnzFifD3FWQBT7aJrxjRTBsvGLvlBfYf/omDkmBGjCvCEsFheKaR6
 SlweidvfrABZiX+iTLM5zLwK+p9FZk02civ9T9XiVd7SJ9mO1o2a/yaLjtBpjqUY4qN5
 13u7yfxhCpjU02Lp/GO1jiwH9uStNxko0iK2hGQH0IAa1ACGLMepZFtEBtJsOSBlPapi
 N3BQ==
X-Gm-Message-State: AOAM530HS/gsminIq3JbzkQLRCBLJpDCkp7hPTsTETBDId12LSOrZw9B
 SWG8Ga3l3yON7EhBz4TcHZxznECBYQzdUMAbHO4=
X-Google-Smtp-Source: ABdhPJyod4/KKGKBrSLTlINW1Nrn+IAQNfO9QDuwrDb7N3hKHY+kx+UkfNDqmMOsG623YQ7vnvboshmWOm68gy2lsfE=
X-Received: by 2002:a25:aaee:: with SMTP id
 t101mr33601669ybi.517.1607941821774; 
 Mon, 14 Dec 2020 02:30:21 -0800 (PST)
MIME-Version: 1.0
References: <1607937538-69471-1-git-send-email-bmeng.cn@gmail.com>
 <87eejsvg5k.fsf@linaro.org>
In-Reply-To: <87eejsvg5k.fsf@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 14 Dec 2020 18:30:10 +0800
Message-ID: <CAEUhbmXk379CmfdGB8Ua9-=Gv1cPfih3bu8Z=r_8w+J461tZRQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/arm: sabrelite: Improve emulation fidelity to
 allow booting upstream U-Boot
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b44;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb44.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 6:24 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Bin Meng <bmeng.cn@gmail.com> writes:
>
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > At present the upstream U-Boot (as of today, v2021.01-rc3) does not
> > boot on QEMU sabrelite machine.
>
> Are there any public build artefacts for u-boot on saberlite that could
> be used for an acceptance test?

I am not aware of one. Upstream U-Boot has build pipelines but it does
not publish artifacts.

>
> > This fixes several issues to improve emulation fidelity of the i.MX6
> > sabrelite board. With this series, upstream U-Boot can boot to U-Boot
> > command shell.
> >

Regards,
Bin

