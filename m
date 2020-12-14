Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 535662D9168
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 01:34:44 +0100 (CET)
Received: from localhost ([::1]:57152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kobp5-0006I1-B1
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 19:34:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobmY-0004gT-Gh
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:32:06 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobmX-0003BI-19
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:32:06 -0500
Received: by mail-ot1-f65.google.com with SMTP id q25so14139962otn.10
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 16:32:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OTE06U7lgDfHNHnX8rwP6vj+K1rfLI05xjfC+tXLYT0=;
 b=pz1SmO4KnmHlcXUEfCokLJxxFQljnrgVHg7nON/x0v8a2Ko+WvCDRRpfmFhfETJS9e
 GXM75VroWAdyMdilmpGVOyHYdvCLa5lzqiW416vAvsv8eTveYlU/+PVtUtRK8K4mBN0H
 PmzJDzyHxUJGxSqhr+ApRt26xZESRuUuyMyJbxQx224hudZn2wVjDN7lervNQE57sYbu
 yp7jU73wXS+FQePA/YufP/xNUW3IKwKDYU7eDOz4yo5KZoPTWl70VnXhe8tnnOGapZnU
 InllE75f4fPtzS9I87sPCTlWRvnPfFWYcMEenMT0IaI0KcBoLpPRV67QmwtPGQxcd1G2
 PYsw==
X-Gm-Message-State: AOAM533LsGfWEjfOVsxKGodieVK2J5jzd4jDo/4e9SnHK7dFdv+SwKAa
 mQ+gEGmcYKipHvKHK6s09HS2q+LjtjwO150BZFtOl/CQ
X-Google-Smtp-Source: ABdhPJyY9lroYCR62F2SpRCj2FxiQzr/BJgjzDz0D0MCD+VTL4M6dPHFOGpF61ZdyxfdC6rIYQHvl43KlyguEWlF2pI=
X-Received: by 2002:a9d:63cd:: with SMTP id e13mr18074535otl.37.1607905923585; 
 Sun, 13 Dec 2020 16:32:03 -0800 (PST)
MIME-Version: 1.0
References: <20201214002928.343686-1-f4bug@amsat.org>
 <20201214002928.343686-2-f4bug@amsat.org>
In-Reply-To: <20201214002928.343686-2-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 14 Dec 2020 01:31:52 +0100
Message-ID: <CAAdtpL6DE4+T4p0pwkTn0Z5RuwFdAoSsRgEGVBQPGp_f10kWDg@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] MAINTAINERS: chenhc@lemote.com ->
 chenhuacai@kernel.org
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.65;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f65.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <zltjiangshi@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 1:29 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> From: Huacai Chen <zltjiangshi@gmail.com>
>
> Use @kernel.org address as the main communications end point. Update the
> corresponding M-entries and .mailmap (for git shortlog translation).
>
> Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Message-Id: <1607160121-9977-1-git-send-email-chenhuacai@kernel.org>
> ---
>  .mailmap    | 2 ++
>  MAINTAINERS | 8 ++++----
>  2 files changed, 6 insertions(+), 4 deletions(-)

Wrong series... Already sent pull request for this one, sorry for the noise=
.

