Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8F9612B2E
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 16:25:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opAAa-0005Mw-Qt; Sun, 30 Oct 2022 11:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1opAAY-0005Mc-Gl
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 11:24:14 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1opAAX-0003MR-1O
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 11:24:14 -0400
Received: by mail-pf1-x42b.google.com with SMTP id 17so4448191pfv.4
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 08:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E54+9wCmHL+4Jy48magVurC+LR5oPmtY60ftTWG0VV8=;
 b=OrX0P+nxEyvwsJ34prEdq71NOuR0qbjuDpXdm+4iMENHGBNMhRHngU1U1HWL8Ul72D
 MOnO1Lt7N2U6/TjVB9399+WCGqxZrabwss9qmZflJEkxPaBRso2B1VZENYs6OmGGsTwk
 uMOY+JOj7k+uvoB5cPym9Chs9bQNH/9JwIX9YLHsW4LeoR7uFliErmd8ypk0tRwribUg
 6UBfqma1U8oeHvh4BBWd6jAU1ozebHFmdjDTpnN6CXI4Zc0UkMdcX2eI8wFcyZpgx8m4
 UZlPmiRC1co7b+zjrjmsPhaRzXebxy+wDje+eVdrSqXWSTcRYNBgjR4QgWHKvhbyGatF
 aOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E54+9wCmHL+4Jy48magVurC+LR5oPmtY60ftTWG0VV8=;
 b=Bt6L9lBcP2ZTgze1J533O/Qb0/79Ui/JmWXZRNR9spZrQWpRH1Bsqd3D+LaQQ5eZ19
 /I34qn9gZWv+Ze0h1n7KXsLn5VUX3Nx7wp7xeG4rZDU+qu37y3ZGyhS15MBRtzE2whO7
 vBaJWGqhS5vEyelKXnJeO4DX6HqlI8Hk1tQYn5wRyNglbVW4onEYExD1cade2BTtjyXd
 lzorj+Ns/ljvxM0yHIo5qNFamEqUXVimO+QGv23D0XLJ7lEOG8oNtSrqB/SR5TcGZ58X
 lFxKanVKoOLqfDMpamlzTGZXbmrB66oRbk/YJXctsvNKeZkgwLg8lkR3eQszjOIRYzdr
 ITxw==
X-Gm-Message-State: ACrzQf1M4rMbLbfc5z40gftw5QDH5TJdqztiEz36mtOlBB8VkOSVsWEp
 I9vcFYxOYLsCx/ot1vepWkPJhoLyqOtNZVjmdtEJpg==
X-Google-Smtp-Source: AMsMyM76qx6CL4/XFDKaphrk1igW+EQjsRQqt93HsfZey8Q2kNrEz3TGGEdwetGWRMLMfh27IonDSiuqJeasE2pC5uI=
X-Received: by 2002:a05:6a00:158d:b0:56d:59f0:d273 with SMTP id
 u13-20020a056a00158d00b0056d59f0d273mr2333974pfk.51.1667143451394; Sun, 30
 Oct 2022 08:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <54930451-d85f-4ce0-9a45-b3478c5a6468@www.fastmail.com>
 <CAFEAcA_bip7nifW-Zq8qrSmZTCUQA1VMpMR8HSHsKVBAeQxy0A@mail.gmail.com>
 <CAMVc7JXPi3kbFyrN9757uKt-cUprKUBLM9nuDMRjawtVePVVAw@mail.gmail.com>
 <5232C333-9F52-455D-A0D5-B1A438800717@nunn.io>
 <a5029b6b-d0a9-a379-09c0-05d6786af0f2@gmail.com>
 <6b2aaf64-1734-2491-1c71-d126d5a3b3f@eik.bme.hu>
In-Reply-To: <6b2aaf64-1734-2491-1c71-d126d5a3b3f@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 30 Oct 2022 15:23:59 +0000
Message-ID: <CAFEAcA9CQ-1MRHxgiPdTWA7e42ngBbk9kWzFEM2JCs3xnZMCQw@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Support hardware cursor interface
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>, Elliot Nunn <elliot@nunn.io>,
 qemu-devel@nongnu.org, f4bug@amsat.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 30 Oct 2022 at 11:20, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> I'm not sure about this and may be wrong but I have a theory that the
> problems with mouse tracking are caused by not taking mouse ponter
> acceleration into account correctly. I did not check it and can't prove it
> but I think the guest and host cursor get out of sync because QEMU does
> not know about pointer acceleration methods and parameters which are
> different for each OS (and also user settable) so it's hard to reproduce
> it in QEMU so it just assumes linear movement and tracks guest cursor
> assuming that. Then it has to correct it when mouse is moved faster and
> the pointer ends up at a different place than expected. Is this a
> plausible theory?

Yes, this is a common problem. The traditional solution is to
make QEMU emulate an absolute-pointing device, usually the USB
tablet. That way we can always provide the guest with the actual
position of the host cursor.

-- PMM

