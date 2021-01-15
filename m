Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB8C2F7E6B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:43:07 +0100 (CET)
Received: from localhost ([::1]:37262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0QJe-0008Gj-48
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:43:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0PfI-0001rW-Ej
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 09:01:24 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0PfG-0002yz-JB
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 09:01:24 -0500
Received: by mail-ej1-x62c.google.com with SMTP id f4so13424579ejx.7
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 06:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=mHSNZD+eqCjHFpin/cCmIc7G03hQ2Wq6GrFOVgMl+r4=;
 b=GwLmTQn6WdZBMZgaRcPE8FN0w33GbB9eKIzHgI0YE9aMe02vu+gXDAnspIVi4wpSs6
 QdJ1BjBymxEB1SUhwenhRXn6G6pUV4ELuNIqqYzbSCA7g0CfDQTs8McoRtamlcLEUJWf
 UfWqHEoQyZdYtIGGu9+P6g2n5e/OgnxHwPSUsdKvDoVQgJ8AGiFOBBEZkdZabTbBhak7
 irukKQj8jVCgPZOqOt+aHHDoRNERTlbX8rzEz+S8Kk5IBkA73V0HTpg4TYDL7tIHJ69l
 M5F5E/a2lpCQ9SwA8AM9hDKWKeC6TAeMfJ9mpT622+DPXA1nfG7nJgq+B9ZLu6qOqCKs
 PzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=mHSNZD+eqCjHFpin/cCmIc7G03hQ2Wq6GrFOVgMl+r4=;
 b=f0Rm5UfM3UwGtYz/8cp3XF+B3Jo/NAjaIpitrZbxJ8QmCdVi9egrTRgTlkbOroDn4o
 cGiQro6AJ8oAFxX7wksrfmZoF+WBXJRt5HpY44rkpX2gDuQ3QT3QqahuPdA4AnExENlM
 N0J0fpMN4GIoo1k8tl2iDXbpjlgTx6/ezyCKN3PPZhNa+PiwCNq+LLco4/SdPaDfUDKl
 6pluw5m3jaeAKIj5LwfPvMaddJuTSCOO6wKIhnP6BKh5j2DHPvoY1LvL2hRIaRZpUO76
 l+A2Rpy3jfEA8TvIS5PwfXZmwa+TuO1/M9iJ5zhghRGHRtOPD0/E4VnAGlRZ9Eo66YH9
 dsVQ==
X-Gm-Message-State: AOAM533rQGftgfHyX9/YdqwLRqNfM5bu5FiH4p3XM9+fScbRBDGe90qZ
 wij43oea3VWw8An2B8cGdNy26e/xWhgH2QZCzXxqeOK/z6iFAA==
X-Google-Smtp-Source: ABdhPJypcyFTcbiHIiJ2YDMe8xmHmFO4c/XE5OoT+twejgXHwm/Waib1dP0IWxm+gvvO6jpom+kOgEuYn86VmesMOnk=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr5641265ejt.56.1610719280378; 
 Fri, 15 Jan 2021 06:01:20 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2021 14:01:09 +0000
Message-ID: <CAFEAcA8ozrnbh8XVZa8OF9C9SnNKb4Wb-=gZianHPPp5zcKjmw@mail.gmail.com>
Subject: Windows installer builds apparently broken since October?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I was just trying to see what updates the qemu.nsi file needed for
the merge-all-the-manuals-into-one-place change, and I discovered
that it's been broken since October when we removed the Changelog file:

File: "/tmp/qemu-test/src\Changelog" -> no files found.
Usage: File [/nonfatal] [/a] ([/r] [/x filespec [...]] filespec [...] |
   /oname=outfile one_file_only)
Error in script "../src/qemu.nsi" on line 119 -- aborting creation process

You can reproduce that with:

make -C my-build-dir docker-image-fedora V=1 NETWORK=1
make -C my-build-dir docker-test-mingw@fedora J=8 NETWORK=1

This used to be in CI (patchew ran this config) but it clearly can't
be being CI'd any more, or we'd have noticed.

Stefan, I see you have more recent installer binaries on your
site than that -- do you have some local patches for this?

thanks
-- PMM

