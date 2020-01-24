Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5C2147D02
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 10:59:13 +0100 (CET)
Received: from localhost ([::1]:39582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuvk8-0004Cs-SS
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 04:59:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37409)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iuvjG-0003LB-9n
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 04:58:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iuvjE-0002go-WD
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 04:58:18 -0500
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:45791)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iuvjE-0002gP-Q3
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 04:58:16 -0500
Received: by mail-ot1-x329.google.com with SMTP id 59so1059664otp.12
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2020 01:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qn/Ml24072IMiMVMgUYsgXluag9ssfwyyCIkQuVwnbI=;
 b=bwg9NtusYdJ/wAwFA8+/BH+UmsZkjSCdG058L4AnfnC4bgXTHhQcI2FQ0smHB2ddsS
 itXFsvpD1C4+xopgAxuJrHNjz4vHR0kWUq/jqcUNZ8+2D1CeWeVYOaBOzxY7vVQYEMFd
 2FQXQObUnRYDSNlVLuBLY5Mq5BKshV/nht512kCQhV8RMbb9sDR4V7/X6GLv9gMLtGuc
 NNwjSd2WpRMYujG/KAH0Iw78Rg3eDkteTG0iuIIetGT0iO3OGm1gcNz3ITTxnR2pTOMq
 UVgwoB/AM+qh9ZRJd+lbx02oeLNY7Lswi1DiCJTcGs3Q6x8AxNXPQRHhxe7ys6W8W4lR
 DBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qn/Ml24072IMiMVMgUYsgXluag9ssfwyyCIkQuVwnbI=;
 b=nqR1QhEPkQK35SKmkGB32Lwj/xRwk60m9hrLSyI7n2E9DTMLAct8em8rU3c5bThmQr
 ORJqfiEDkTxt7myFRAtETDMT4yzY0c+s134yCTOPrvb/DDnKms3+5nCMH5FslTNhSLhX
 CV+VLHYm9f2Pv/U4Odlg6UnOqv/kaSk9wgCcI8548FgV/ilttm8YqQvX62xNsZr8f6XM
 N2JLV/WmBpB/siVHyriWie7GPs1vNjdnFkBztFPtcyZvnCMvB213Q4ZAUAMdhdSj2VWR
 EVtLWIjQDqwueg/xPhQEJAaDzH9+c26p6cOEoY5GL+wG2t4e2/j6muTkPBFRIuvZQfnL
 9olw==
X-Gm-Message-State: APjAAAVXbfh7lUqLwVfjtav/SXBaojjkDwMzsNqXPSZbFDLNTHWOfIk9
 1U2APN13UYtKkaHzKIxVfRB8pJedbgECUEwVpwFkcg==
X-Google-Smtp-Source: APXvYqxjFaN0WKa5gyDYXc/KDgOvQP9SVkBVQvpidRyaIoz5eExfqndMbJzs6BNhHm4Nhms2/IrNU40AVvAdoYNYMZs=
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr1962543otq.97.1579859895926; 
 Fri, 24 Jan 2020 01:58:15 -0800 (PST)
MIME-Version: 1.0
References: <20200123142122.13839-1-kraxel@redhat.com>
In-Reply-To: <20200123142122.13839-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jan 2020 09:58:04 +0000
Message-ID: <CAFEAcA8HjCrXRhEaptgnwbk4vD0TbNgsiQDnFxLsn80gf8KA-A@mail.gmail.com>
Subject: Re: [PULL 0/3] Ui 20200123 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::329
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Jan 2020 at 17:41, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 43d1455cf84283466e5c22a217db5ef4b8197b=
14:
>
>   qapi: Fix code generation with Python 3.5 (2020-01-20 12:17:38 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/ui-20200123-pull-request
>
> for you to fetch changes up to a1e8853ed2acbda29a52533abc91b035b723952e:
>
>   ui/console: Display the 'none' backend in '-display help' (2020-01-21 0=
7:29:40 +0100)
>
> ----------------------------------------------------------------
> vnc: fix zlib compression artifacts.
> ui: add "none" to -display help.
>
> ----------------------------------------------------------------
>
> Cameron Esfahani (1):
>   vnc: prioritize ZRLE compression over ZLIB
>
> Gerd Hoffmann (1):
>   Revert "vnc: allow fall back to RAW encoding"
>
> Philippe Mathieu-Daud=C3=A9 (1):
>   ui/console: Display the 'none' backend in '-display help'


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

