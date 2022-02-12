Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E974B384E
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 23:06:14 +0100 (CET)
Received: from localhost ([::1]:54888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJ0Wy-0001sT-D7
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 17:06:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJ0Um-00013C-5v
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 17:03:56 -0500
Received: from [2a00:1450:4864:20::433] (port=40950
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJ0Ui-0007Ht-LE
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 17:03:53 -0500
Received: by mail-wr1-x433.google.com with SMTP id j26so10018744wrb.7
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 14:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0VToK0neGECqHpZqzFoUE1VbkLFaPSteDi+66F2tPhg=;
 b=DsYpaxfe5MCUZaMhnujFOWERy2s7a5wtG1px/MXQepCh7iK9WT3TBVLJgWlu79K9rQ
 eqLD1T9gcLtxSbGq08AAsmvEuMMSvR7FbyyTdYTp1YgkTc0T0fGt0yJRJ3rojNAM2sQa
 GZfHp7NsUV+kB21+bu/Zv0k3pyIiyllt19AFBNj9CykHw/YYkOe+2edV0VSZcsPsuCrd
 KHXqjHBBXFJQST2rlMotMkdBDwrYXMLkPZ5W6DSbYYv0hj5UFcA1J0Ddi8Obh1ZB8YDV
 RUfCwAsnusPX6sBBqJ8e0PQ4fNe+aTIK+pkRXra/WaaCPAQMLTggMOgmp9SSg+inseas
 KpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0VToK0neGECqHpZqzFoUE1VbkLFaPSteDi+66F2tPhg=;
 b=mzV8vJkMqlmHHykKFUNZwdYp6QTgGI9BzGwVPm1kTZ0Wh+fPt6+G/O0ktIYcl3AT7F
 k+mAWHdekp9tP4d+25mCmWiRZiBXcz1NgnXnAZkQZ4Em4d5cJgE9oZzmzLkJA+N9p2Cc
 S8ynbCLKnYYNv0oNCd/iSgioO+Etqqtblr2RR7+ZyPYKWSxXzV4x8XAuZnMQn7TXlH92
 6vC2453DYtC3JoyaIuKNf7Lek2aIbfWMiVY4hLJ3K1mP+9vk4S6NLN+UAGtftmt0/D2h
 Tu70aLwfgjZB/pmzBRQw8Pn4gSSomMzvTrRRtMheOM3Zduw0HnUlcMAe1c59Z7xx2Hf7
 +UWA==
X-Gm-Message-State: AOAM5320FecwH2byO359VtS4OV4ctn/rPk4ipXYbb2xRZgGnwUdv0LUj
 xx+nQc1o4NASyT4ndAKFsWguUrW8zESGFLgde7YrbA==
X-Google-Smtp-Source: ABdhPJwzizZdpJ39rHE2xBpw9XwnTDxFS0hkOH3chfBV2RyWOqjNb7lYUMZMSemkmXI+eQPphm8AWjhnYh64FdgqJZE=
X-Received: by 2002:a5d:498d:: with SMTP id r13mr6143096wrq.172.1644703430659; 
 Sat, 12 Feb 2022 14:03:50 -0800 (PST)
MIME-Version: 1.0
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Feb 2022 22:03:39 +0000
Message-ID: <CAFEAcA_Y4KP7M8tmBprD3app1pdWNdUvsth+wCSTxTwGNFcjEQ@mail.gmail.com>
Subject: Re: [PULL 00/28] testing and plugin updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Feb 2022 at 14:15, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The following changes since commit 0a301624c2f4ced3331ffd5bce85b4274fe132=
af:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-202=
20208' into staging (2022-02-08 11:40:08 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-and-plugins-09022=
2-1
>
> for you to fetch changes up to 514f9f8eb64bfd5d6c15024db93f83bd81998de5:
>
>   include/exec: fix softmmu version of TARGET_ABI_FMT_lx (2022-02-09 13:2=
9:38 +0000)
>
> ----------------------------------------------------------------
> Testing and plugin updates:
>
>   - include vhost tests in qtest
>   - clean-up gcov ephemera in clean/.gitignore
>   - lcitool and docker updates
>   - mention .editorconfig in devel notes
>   - switch Centos8 to Centos Stream 8
>   - remove TCG tracing support
>   - add coverage plugin using drcov format
>   - expand abilities of libinsn.so plugin
>   - use correct logging for i386 int cases
>   - move reset of plugin data to start of block
>   - deprecate ppc6432abi
>   - fix TARGET_ABI_FMT_ptr for softmmu builds
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

