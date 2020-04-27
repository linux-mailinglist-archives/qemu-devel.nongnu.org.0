Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B287E1BA410
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Apr 2020 14:54:42 +0200 (CEST)
Received: from localhost ([::1]:44338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jT3HV-0005Tn-P5
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 08:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40690)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT3GZ-0004iq-DX
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 08:53:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT3GY-0004p7-Oq
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 08:53:43 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jT3GY-0004ou-8e
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 08:53:42 -0400
Received: by mail-ot1-x344.google.com with SMTP id j4so25907538otr.11
 for <qemu-devel@nongnu.org>; Mon, 27 Apr 2020 05:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wubDMWGgjendUSojUj77rN75sZbg2fcrCntFM7fbnlU=;
 b=Vhxptzjp3KM1A7Cz46bZ36pKpVRCTiQlshTGCA9TJqfIxniTzap0eSZB5s4m1tVCh1
 U3W3SpLtV5IRXgPt2bkVgdvBGHmlDABlZmUXud5tiwCGA/DHEjoJIL6kckUWCNP8N4f2
 6d0BX6ulL6bE9sejzozMOLYn8VAEMHWvS434FxpJH8BVf8KJdHkjcGKkNnFnkr7HUyUd
 3iQ2cOFig3SGo3fwISEH4zPUI+d1AqashRjzikiNWj0eu3BZjQIr3ijuwR4oZSXyxv1W
 ODD8JPFsepIv25MCA47yAue9TjOHYAIaU6D6gzgk2U1DSUZFnqz3w/t4QvplhBth5qG3
 8C1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wubDMWGgjendUSojUj77rN75sZbg2fcrCntFM7fbnlU=;
 b=JeJC/UYASK+MGbOHjYWMSzzcApdmNLgKTklZQtWRQx65TrKuQh2dE1EJvhV0ofLJRq
 kFUsHgxwWtaVhZ1SHyvdNi6vNyrwtpQj4+JIr57pUDFgNfdn13zy9f7uBb638RCOg4Pd
 Pu/03dItRtiwnF2W/Gloch3j4iPkYVk13uUAxa0Ewm+NG2BMyvyblyuWlHVBfU13fwmg
 4wqXXCHRVQo3SZembwBTSzDIbWhdt+kSfE/JwDMpPzcMR8aWw8jpudQn8D9FGo8636h2
 WAGaAbB6jR/RCdufp7XzsHpA2I5dqpzys2eT5gUdbxO9JuLmwiv3d/NbsJ4TwB74S7nL
 4+7g==
X-Gm-Message-State: AGi0PuboH8AGmq5nphdLa1XgbjMD9i1zs/hj8mruaKxLGlI5JfnAE810
 68NMxRh1Sxo6hrTBhLPHXNT1/T8ICVFPSfGcQCcNmA==
X-Google-Smtp-Source: APiQypI4qGxWX44gWU4r36fKAexEejWf8fkqfJZDzQcO737mo4uDm+gqp8DNhyp8C2yHTiO0e/dEGAmA0mBMhu0xH7E=
X-Received: by 2002:a9d:2c08:: with SMTP id f8mr18559691otb.135.1587992021134; 
 Mon, 27 Apr 2020 05:53:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200422172351.26583-1-pbonzini@redhat.com>
 <20200422172351.26583-9-pbonzini@redhat.com>
In-Reply-To: <20200422172351.26583-9-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2020 13:53:30 +0100
Message-ID: <CAFEAcA8Fcq9qR765rC3n_FjkZKaHzs-kr2RoF8aZxsXaLS9fag@mail.gmail.com>
Subject: Re: [PATCH 8/8] run-coverity-scan: support --update-tools-only
 --docker
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Apr 2020 at 18:26, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Just build the container when run-coverity-scan is invoked with
> --update-tools-only --docker.  This requires moving the "docker build"
> logic into the update_coverity_tools function.
>
> The only snag is that --update-tools-only --docker requires access to
> the dockerfile.  For now just report an error for --src-tarball, and
> "docker build" will fail if not in a source tree.  Another possibility
> could be to host our container images on a public registry, and use
> "FROM qemu:fedora" to make the Dockerfile small enough that it can be
> included directly in the run-coverity-scan script.

FWIW, one reason I didn't use 'FROM qemu:fedora' (or the local
equivalent) was because of your report that newer Fedora versions
broke the coverity tools.

>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

