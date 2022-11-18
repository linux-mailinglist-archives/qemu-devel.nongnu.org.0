Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F190C62FA18
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 17:20:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow45N-0005te-5g; Fri, 18 Nov 2022 11:19:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ow45L-0005sz-KF
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 11:19:23 -0500
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ow45J-0006XC-Hp
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 11:19:23 -0500
Received: by mail-il1-x135.google.com with SMTP id z15so2748521ilp.4
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 08:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aCgFzlU0dbinsWyamKEVacHr/XS2reEDaPhYVKFCMU4=;
 b=w0qHP0QwTlLcGNgYgCjxtR32XU3pOBvMQyxr98hkKMfNJ0KqQdgXYm5aF2X/36sjmM
 eVQVcGFvUS30JIYR7uaXEeiCPLIXb0VRbprKuHEJP6oSVIwkzHgS5LHcGvmvrp0ELVuT
 +ni8liCW+Q5VSvanop9ifUkv5pGYxZols1Fs+aV7AVRjM9m3UZcKVvsJ+KCBX6Jy2Q6M
 brhnGXiGEf7jLx/8AevONfaSpmnC2/HgO5xQ4Wz7n/yZxVCE0qv9iS88IxeGVvb8BJXc
 xJSCIjFjxWbG2uuM060tp63LekwPy7v1xDtv/R85wkWZk34QSN/YDjAtR91qz8wrzUec
 2mKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aCgFzlU0dbinsWyamKEVacHr/XS2reEDaPhYVKFCMU4=;
 b=3u/PpjZkLQ95sX5Q49OsTQkbEBH+kaAUCrY9W4GdrnV6ZAWEi6/wgSmVOEmi1AeEac
 Q1wFrJoZd6nmSOF4qluUd1BL9PUs+BIRuM/8jvvhBr7u8EcLfcJMm/GZKOGpn9pxUfgT
 LkA0ON+Ph9kLKZRlswqCHewgYIz0ZiVLVa6s4S13oHCQ3iW+rozuCSTrHUhUz1mFlz7b
 nw0icquAbo4TWKCLNC8vRyMXKQxnXPFqh4O6pqc2wAP+X2C07WrVgJuBExoLgrogVi8+
 WXhFXhUSueHApBMyBO/5FD2nRbeUT2QYg2x+6+mNVzq6Vn/GekwVkFtBQn8M+hbjpvMs
 Br8g==
X-Gm-Message-State: ANoB5pnoMo0dDnBR5m55WLU9+o92NV/z6XG3jQWOhuCFiYBCoOJJ1EDw
 KEUAIgOLJLL4UHVz7G5hIuncr9/e0TUIr2Nv9gr21w==
X-Google-Smtp-Source: AA0mqf4Pa4mZ7KQhb/ZZQS0irXAaR3X68ikAWDu0LMUIwcC19C3pbwOx3a5aAwHN10iHKHgpwp3EVaTxgxwWwlnvzm4=
X-Received: by 2002:a92:d80f:0:b0:302:a58c:52ce with SMTP id
 y15-20020a92d80f000000b00302a58c52cemr2281212ilm.54.1668788359698; Fri, 18
 Nov 2022 08:19:19 -0800 (PST)
MIME-Version: 1.0
References: <20221115212759.3095751-1-jsnow@redhat.com>
 <CAARzgwxaVyQf424PeUOO=efyPHdiMK9nF7g+pHuKufqU1cg1-g@mail.gmail.com>
 <CAARzgwzYn8=vsWO+pEfRouJY3PWYn_XEZps9wurpHpVogxcEHg@mail.gmail.com>
 <27365556-af01-1af2-b841-9fabc6a4369a@redhat.com>
In-Reply-To: <27365556-af01-1af2-b841-9fabc6a4369a@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 18 Nov 2022 21:48:56 +0530
Message-ID: <CAARzgwzNsDKrQ2y05K9-oRBBGRTJ5_kMWXHfqrBS6S236TWLTg@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado: configure acpi-bits to use avocado timeout
To: Thomas Huth <thuth@redhat.com>
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x135.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Fri, Nov 18, 2022 at 1:33 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 18/11/2022 05.05, Ani Sinha wrote:
> > On Wed, Nov 16, 2022 at 8:54 AM Ani Sinha <ani@anisinha.ca> wrote:
> >>
> >> On Wed, Nov 16, 2022 at 2:58 AM John Snow <jsnow@redhat.com> wrote:
> >>>
> >>> Instead of using a hardcoded timeout, just rely on Avocado's built-in
> >>> test case timeout. This helps avoid timeout issues on machines where 60
> >>> seconds is not sufficient.
> >>>
> >>> Signed-off-by: John Snow <jsnow@redhat.com>
> >>
> >> Reviewed-by: Ani Sinha <ani@anisinha.ca>
> >>
> >>> ---
> >>>   tests/avocado/acpi-bits.py | 10 ++--------
> >>>   1 file changed, 2 insertions(+), 8 deletions(-)
> >
> > Thomas, since you are picking up my other patch, maybe you want to
> > also pick this one up as well if you have not sent out your PR
> > already?
>
> Sorry, too late, it's already merged:
>
> https://gitlab.com/qemu-project/qemu/-/commit/1b7a07c4414323d985e89c4e7

Ok if you generate another PR with simple misc fixes, please let me know.

