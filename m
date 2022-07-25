Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0797C57F7E9
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 03:25:36 +0200 (CEST)
Received: from localhost ([::1]:46862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFmqk-0003hM-JW
	for lists+qemu-devel@lfdr.de; Sun, 24 Jul 2022 21:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oFmpc-0002Kl-7A
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 21:24:24 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:45782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oFmpX-0002CD-5C
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 21:24:23 -0400
Received: by mail-qt1-x832.google.com with SMTP id b21so7263529qte.12
 for <qemu-devel@nongnu.org>; Sun, 24 Jul 2022 18:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NIPEZ9vppOXx9vEPrXuz/VCJ2UjpYMCM5qD0y6qevT0=;
 b=IkGSlg2CH5nMkU/oYxsBWndlqBYlzQrvtdKXi+QR7qxuUaUsxrXqcJpsuYedbdguFq
 2M8owhPNbHdLFCVPmzdya4cRIbQ6DBeVseMIv3+moqf3XdqLn4AYODvGKZEtAvQ9UCq2
 Xi+nAFHsT80texK+Jry8HvMYcMGSHURjAXh9QjonLEH4ASpS8lBFfJ9WiAn+T7ECHDI/
 fLhqfQ+XVCdDIb0tW2xJGKBEJufBElenM5Oko4aW5tjmZkdkbyMR1yv/EzHybNp/AmHT
 YM9j8zq5cMVB2mwgOyD+LnY5OsWe/wpb0264tubbt+sDp9TKBDblywrGubFo0GniIqBc
 Z/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NIPEZ9vppOXx9vEPrXuz/VCJ2UjpYMCM5qD0y6qevT0=;
 b=PCvZOh6T5+yHp6ZNbi615ftfy+asBlRwRTbMyGzJwgmLTT4UoakJ5HHLMl/R5/wwni
 KQ6yvTgLFMe6xDauLm6doP6Hmnu9UV++6qk6GtYcskpU7Zd4a04HxgjpwJiSNtBqUMji
 wqH+9F12pamVA4GYa7TOcWVTqMnB5GAhFkWZKj1ZFIBUGp6a21NV4nn9AWEJu1Kqj8Jx
 IcrHElu5Nz3JkgjyAGlzQfJJQU+4zoPejqeN6N58esITDUwejzfT2rLj4s/62GmFHHDC
 Ppqjxby6aL1nci5pPdmloXIKkrv81Zu1ODDTXEKISB+2gBzmUonJPbYBYPiiChgi6j2m
 ZMtg==
X-Gm-Message-State: AJIora85G+T8bKrwWTYUY/MwisIjjzL8aDNHnzO1FLnpLojHWV4vR07e
 5me4b2QVWC5JkwdrZj0rMiuhoPtsAYjIXhjc0XA=
X-Google-Smtp-Source: AGRyM1ugz6KKsc1l34rzOH9zdqvQii55fPYInMC/7yfDCzSSQUxfWeBNyfFQortqoFEL0J5++Kldt8gY06rFAfJ4m/g=
X-Received: by 2002:a05:622a:343:b0:31f:3383:3971 with SMTP id
 r3-20020a05622a034300b0031f33833971mr5060308qtw.276.1658712257973; Sun, 24
 Jul 2022 18:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220719161230.766063-1-bmeng.cn@gmail.com>
In-Reply-To: <20220719161230.766063-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 25 Jul 2022 09:24:06 +0800
Message-ID: <CAEUhbmV85bb-q8Q_Oda6EngJsRdpJq9fhSej-By6jHu390SEow@mail.gmail.com>
Subject: Re: [PATCH] .cirrus.yml: Change winsymlinks to 'native'
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Thomas Huth <thuth@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x832.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Wed, Jul 20, 2022 at 12:12 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> At present winsymlinks is set to 'nativestrict', and its behavior is:
>
>   a) if native symlinks are enabled and <target> exists, creates
>      <destination> as a native Windows symlink;
>   b) else if native symlinks are not enabled or if <target> does
>      not exist, 'ln -s' fails.
>
> This causes the following error message was seen during the configure:
>
>   "ln: failed to create symbolic link
>   'x86_64-softmmu/qemu-system-x86_64.exe': No such file or directory"
>
> Change winsymlinks to 'native' whose behavior is most similar to the
> behavior of 'ln -s' on *nix, that is:
>
>   a) if native symlinks are enabled, and whether <target> exists
>      or not, creates <destination> as a native Windows symlink;
>   b) else if native symlinks are not enabled, and whether <target>
>      exists or not, 'ln -s' creates as a Windows shortcut file.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  .cirrus.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Ping?

