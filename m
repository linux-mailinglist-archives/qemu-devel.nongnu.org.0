Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129A8595B30
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 14:04:17 +0200 (CEST)
Received: from localhost ([::1]:33788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNvIu-0006A0-6O
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 08:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNvFU-0003gF-20
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:00:45 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:41573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNvFO-0006M6-5U
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:00:42 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-32868f43dd6so144332467b3.8
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 05:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=u1dhiB2SC8GHcO9W0t6A1JacXYNhw25ojDn0rEoil6k=;
 b=K7+p+lGGgNk8Nf9BWZ+VEIDMofIPca/oReR45lfewlJGwL6Sf7PFNn1TlLyJL9yZxJ
 uXhunZifEm0nK5XHVWGjotsLEPetHWAwdrqh7zEfywjbVkR+i3Xdj3CzvP8lBl7h8+sw
 SYt+ivQBp9qXo5hrphNBc8UBk21bbganSR4ZGfpALL+VwyneXxXfAV7LdU2fZSlpctZO
 w34b3ascvYk1YXybzk4fZNsdQiWkW0qr41yKM95g7fi6/+pOXclMTVcD2/tRsEKOk0Oe
 jx5cm9vGd5WpcdGHXXZElPyDSSnom1MCoCZ/Z1pLTj7oHyGrSB1ejUbdjbCl2zFWz5Ph
 9fGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=u1dhiB2SC8GHcO9W0t6A1JacXYNhw25ojDn0rEoil6k=;
 b=J5ufEQgjAHIqTXacqva1+0QOoKkZGuJVt9cVwCrKfEXt4gjjrf6Ev5BHw88PoI8j8i
 p01VmMUiLtZZPcREKslgKCkrPLQ05+/LuBj3hTBtC8IfYkRbJQW66g/uOUxx28eUoUbk
 LXKuNAq4mrlGAkDk3545GllBX8dNPUYYiPtBZ+cZubkiI2HE4Q94bfP3USr+VbMTfP9V
 oerFZ3xpeWG6mEBJtkGehGiqHhHOuvFS2aP2pqC3JI3dEA2D6NxXBgzR4dYqPh13K/A1
 C/VZhqlmHIR8v8vdxswZTdhQrMxzIEszDCxcBTNygpmBZGMq6QUGsVCBHxrxV7hWNPVl
 /jCw==
X-Gm-Message-State: ACgBeo1AX5QpIo1Th6xkPZwOArKpy6m9rbNGD2OrKnnFiA8Q0ufP3YLX
 CLJbOwdZL2okAUzs18NcP3+4MvgsCB3L8RA4S5CqCR0a8k05IA==
X-Google-Smtp-Source: AA6agR5fLWsU+/L7o+jyyn25Ya71/ZoWWjowqS6bmxVphgn/6RQgiQEOc20O2PO2GvHn3PXvO6wGu+loYH6v30GAfw8=
X-Received: by 2002:a81:7bd6:0:b0:328:297a:f31f with SMTP id
 w205-20020a817bd6000000b00328297af31fmr16682496ywc.469.1660651236005; Tue, 16
 Aug 2022 05:00:36 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Aug 2022 12:59:54 +0100
Message-ID: <CAFEAcA-tmBFyNNyQ3g4wwf7whX+nNN=HEWmSL+Z0E0k2U5J-+g@mail.gmail.com>
Subject: KVM Forum gpg key signing
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi; we haven't had an in-person KVM Forum for a while. This seems
like a good opportunity for people who are or who expect to be
submitting pull requests to get their GPG key signed, if it's
not been signed by anybody else yet or it's a bit low on signatures.

If that's you, and you're planning to be at KVM Forum, please let
me know, and send me your key ID, key type, fingerprint, and key size
(the output of "gpg --fingerprint your-key-id" is best). Please
do this *before the 28th August* as I won't have access to a printer
after that.

Depending on numbers I will either arrange ad-hoc to meet
up with people, or else organise a larger-group "keysigning party":
https://wiki.qemu.org/KeySigningParty
Either way you'll need to bring with you:
 a) positive (government-issued) photo ID, eg a passport
 b) a printed out copy of your key info
    (independently of what you send me)
 c) a pen or pencil

thanks
-- PMM

