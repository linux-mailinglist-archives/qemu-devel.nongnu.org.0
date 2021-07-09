Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEF43C1C90
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 02:16:23 +0200 (CEST)
Received: from localhost ([::1]:39994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1eBq-0002aU-84
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 20:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m1eAp-0001qc-60
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 20:15:19 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:35565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m1eAn-0004iO-8h
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 20:15:18 -0400
Received: by mail-oi1-x22d.google.com with SMTP id s24so10091512oiw.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 17:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/8cFB5xe53QEqolvd7uZjPrpN2EBPwQT6oxw0Qs+H2A=;
 b=KuSXurG18BydC4+SIqAxiA1Kr0t0jndbcZ35DDmbMoyidB7A7srBzn3Gy+EP3P7b15
 KfDzPio9NDNN/Iuq/spBmgLsa41YB3Vq1DL1ihbaRn3KUMKp+3j9TCR3N4FgjrgOh8CA
 5RtMVp5bOlC08WdCuBsi4Wq2yXV+A5i7iBMuHglUUUX2kPBBV7tBtSPYw05KYblMGSXA
 0NPsqCAvynW9LSfiArEnf3hJTB77CrReYT465tczovJmF4thVGgCywNJ5YyhhJGF41TW
 ilajWyjBskwl16AsiDQql08XzedTF3IhLzKbBTZ6iKDYQmLtzQRNwBWbaXYe1BwntgPS
 14rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/8cFB5xe53QEqolvd7uZjPrpN2EBPwQT6oxw0Qs+H2A=;
 b=PLfNJhxYJssdC64VOJJYv8kyJp1M/lA0iGbWNiLGgX+U+u+GeQ6uWmBs7PlVaEqZJV
 NcxCfNtttX3AAosWOn9wwKbgxksWPgI4hnI8eGm9sXu4f5m4G1TWueHH1R8kX+KJrIZR
 uM2W7NCyVbDEh2HQI3QWoJX6sAhjZg2Ll+6ZRGorixZSdoCxvANRiMX/H86070NCK5pW
 aofyp6gvp2cm6KXKK9Ui6zFt6EreiV8fDzGu2AE0r7TfX7d2tUhj/g+O2tGzlYMiaLu6
 D4Aul0VBUNjAJ+nP8YsHSdwnGrKlMTT/uB/mo4dt3/bxGBr0+/iVIZg4heb93zT5HHg3
 1N9Q==
X-Gm-Message-State: AOAM530nV13rYRcpTUXcT+G7tsT44+W0V+4eDdSIzWqmTiNmRmb36Z3F
 vvC8uPHQ9RpyXF23ioV6jpWj2COQ0+CObGR1f5k=
X-Google-Smtp-Source: ABdhPJwJC7+iH0jFsJAOANbdW2mtg5AtUGQCtov6ZSHRg9LXpfsgTlh44bKplNyL4U9XJj9klIaHB+H4AnVnYudXqPQ=
X-Received: by 2002:aca:ef84:: with SMTP id n126mr15328329oih.59.1625789715928; 
 Thu, 08 Jul 2021 17:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <797ADA26-0366-447F-85F0-5E27DC534479@gmail.com>
 <CAMVc7JXgn5ttSEjPB_=rS9CsYiQOFS48hcAbr3NQnom-qk75VA@mail.gmail.com>
 <F9601D44-9866-4CB7-B611-D8930DFBBE15@gmail.com>
 <CAFEAcA-vGe5BQg6HVtub5mDD6CtQN1OKGPE3Q8eJsjqyDCROnw@mail.gmail.com>
In-Reply-To: <CAFEAcA-vGe5BQg6HVtub5mDD6CtQN1OKGPE3Q8eJsjqyDCROnw@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Fri, 9 Jul 2021 09:15:05 +0900
Message-ID: <CAMVc7JULWjm_ME0bO0VAmqw=8Jr-LvqJWxFk1KxSMk2orMDgvQ@mail.gmail.com>
Subject: Re: Picture missing in About dialog on cocoa ui
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oi1-x22d.google.com
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
Cc: Programmingkid <programmingkidx@gmail.com>,
 QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I tried [NSApp applicationIconImage] but had no luck. I suspect it is
because Rez is for Carbon development and deprecated while NSApp is
from AppKit. Loading from the filesystem is inevitable.

By the way, I knew Rez is from Carbon but didn't know it is
deprecated, which I have figured out just now by reading man. Reading
the icon file and assigning it to [NSApp applicationIconImage] is a
possible solution, but it requires modifications for all graphical
backends (cocoa, gtk, and sdl) and of course an external icon file. Do
you think removing the dependency on Rez is worth it?

See "[PATCH 1/4] cutils: Introduce bundle mechanism" for a general fix
of the problem when loading a "bundled" file.

Regards,
Akihiko Odaki


On Fri, Jul 9, 2021 at 2:51 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 8 Jul 2021 at 17:28, Programmingkid <programmingkidx@gmail.com> wrote:
> > The problem with e31746ecf8dd2f25f687c94ac14016a3ba5debfc is it requires a
> > picture file to be found in a certain path. My original code used QEMU's
> > icon to obtain a picture. The reason why the picture in the About dialog
> > stopped appearing was because of the move to the meson build system.
> > A new patch has just been committed that fixes the missing icon issue.
> > Using 'git revert e31746ecf8dd2f25f687c94ac14016a3ba5debfc' fixes the
> > missing picture issue in the About dialog.
>
> If the icon is the same (same resolution, etc) then just using it
> does seem better than loading it off the filesystem. But we should
> also sort out why get_relocated_path() isn't working, because if QEMU.
> can't load files that way then other things will also be broken I think.
>
> -- PMM

