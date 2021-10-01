Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4FE41E992
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 11:23:03 +0200 (CEST)
Received: from localhost ([::1]:60418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWEkw-0007ZE-3P
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 05:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWEjZ-0006q7-Uk
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 05:21:37 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWEjY-0005E1-Hk
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 05:21:37 -0400
Received: by mail-wr1-x429.google.com with SMTP id h15so12795760wrc.3
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 02:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ARSYM6kaVzycBn5QeUC2Y9eb1Eb4FCuunLw8xkOIQ04=;
 b=r1xrTmAlJujJU3pFfuuDgN3JydCTx/lHPVR8/a54fq6cdhsXm041V+wEfD4+yjHdUH
 /MvQOfHBtvyOaG51hlXfv4f2JbYJOic9EPoJ1Hwj6CyUXmj/Acavd6u4q2p600nJJ9Bw
 yagmf96Ft3eBHikG3oUqa2esIoE64iu9qo6VK68JeMLd60F8vuwYkSvebi9wi8blSXBI
 npkAt84DOVV1qrd/gqFxSj2paN1651EvjgqWjuguXQP9OiXhWr8FsQitVvvSyCzjPBOF
 yNgfi8x6WW12oD1PFObTFxGF7ETaWoshRKTNCHNLMV68sp5WhACFFWkgTLJAOht8bypN
 8Tbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ARSYM6kaVzycBn5QeUC2Y9eb1Eb4FCuunLw8xkOIQ04=;
 b=XQMzAI+7odaNguSzyEIxy1UH0vzGNlYW7JffMqcV61mJx61ug+rwdYOX4zP8U2IOm/
 08e6DFIVKRqXYVGVW3x3ydVrWfvuepAPHNFXjINiIEJe6ILdRz2w/tQLJoqsfs+KIYvw
 17/4RkuavNN0dh1+D3FrdkDdlZ3s0hREQdQ5dieUjh2+/LSaZape3uHspNOaKz74HE9I
 e8QbfpXFmjU4gJjnDuptGFd9Z8qRYbq03WzrOUNIqy6M+P5T9vupC071nwlPgJ7LsEd0
 0mg55RMju2bxMOEBoBQsKk/6IWYg9R7pMYA92GSPk8+aRpXDh1ppovEDhwq5ymRsZiFy
 y74g==
X-Gm-Message-State: AOAM531AW02s9EOztnTJmctVNz0yTDGeWo3gaU9mYES/2kunlN0vcJw1
 1t4KU4jsErqXhPICmEkMtRC1twPSKKdVBU9g2Gfr3A==
X-Google-Smtp-Source: ABdhPJxANDGm2zfVeSPaLiCpd06G34jRMPTzxeGEodyB+g7QqJajUxh7HU+8ej2ve+KTa7JEUfaPRZJnDs2QO2dX6nA=
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr10836687wrw.376.1633080094932; 
 Fri, 01 Oct 2021 02:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210930133250.181156-1-pbonzini@redhat.com>
 <20210930133250.181156-2-pbonzini@redhat.com>
 <875yuh2ung.fsf@dusky.pond.sub.org>
In-Reply-To: <875yuh2ung.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Oct 2021 10:20:41 +0100
Message-ID: <CAFEAcA-kOs3dKhh3SRchg6Ne8QL8kwyz+2ihDC6ND2v-seuRfw@mail.gmail.com>
Subject: Re: [PATCH 1/7] docs: name included files ".rst.inc"
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Oct 2021 at 06:15, Markus Armbruster <armbru@redhat.com> wrote:
>
> Emacs recognizes .rst, but doesn't recognize .rst.inc.  Sure we want
> file names that defeat common tooling?

*.rst.inc is the standard convention we have for included
rst file fragments: we already use it for 9 files in docs/.

It also matches with the use of '.c.inc' for included C files
that we use elsewhere. (In that case we are constrained by
Meson, which will not permit us to use '.inc.c'.)

-- PMM

