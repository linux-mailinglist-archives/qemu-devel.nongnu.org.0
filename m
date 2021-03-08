Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7413311E1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 16:15:09 +0100 (CET)
Received: from localhost ([::1]:40784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJHbA-000060-G6
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 10:15:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJHZR-00076L-8i
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:13:21 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJHZP-00044I-3b
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:13:20 -0500
Received: by mail-ed1-x535.google.com with SMTP id h10so15254043edl.6
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 07:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T3Kaq6eJZBRNU0SxWs6NohsNuJ9foXdU7TucNLkClUQ=;
 b=rnbJoMqvPVxAIRmM7udbY31FCal9sAnO+owDego8dNihK5lfiMu8cKND/sje7Qkh1s
 snS/KGMGmUv+JBcrE9LVRszPBMVtIELf+C/BPGb7mSE3XDsMc5TKp49PG+iGO0qymMIn
 HT/Rmotlf0LTHF/MLCmPA2cwRfta2tme9Wb9gOGp2/nDQUhvWbi5i8N/5DVrafiXHfTD
 /5GWK1iAR2k6FSlfiCFXZlrm8Ko+6suFnl6/ez3X0qGzPtBm08u7UwpEdeWngyR4fgDS
 9StSRLSgaS93BmhRWZ1TlvF1HxicG79kxrSIaDBSRkS/TVK08VXUdA8JyRUbEjQb0Oo6
 86cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T3Kaq6eJZBRNU0SxWs6NohsNuJ9foXdU7TucNLkClUQ=;
 b=RiRXh0tCgqIfsQiOMtxT+EfFk8MvaRVSAAz2rrUJ2S5/Jn+Sb3YHxwUXMKv0+pwJEC
 oWBa+cae/L9DqIK66abE3Q2uKWk7srcWMB8j7FSWuPN/Lb81mAsBjKpNBO1qFtmXGcuW
 SmIEsAlWVftzpbaB3mU8FozoLYR5xSoYQQvrF741HtxMzN7to6ZLJ9Z9FuM9vxYOQ8I7
 I7aPhMo7kXUaU3sjZiAFG1AkE4pD79wwft4Ab2g9h2Wzx1dO/F7YTyDfCshoY/4YuDd+
 7d+iuxPObhPJXu/ghyEaEHFLh8Ssv0SCwHrAerLjBykbhHwhpGCPQFQp3cIrtYWE+j3p
 tQ7w==
X-Gm-Message-State: AOAM531tVBqtr5suneev4KCS3GFrfyy7Dk9919WTIAxPjnLppts06U4x
 nO1j5LM+rtH/zrRxVvQBpte8G/6VmfusnnP250t4+g==
X-Google-Smtp-Source: ABdhPJxjKS8NPWtAhRSUm4ScLTF0QiL0o66kl+7ZO+V6Au8vOu0E52Dny1E6QoJ2/f9ZL8xrb++dGTTHvlOA2VUBJhg=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr3285929edt.36.1615216397629; 
 Mon, 08 Mar 2021 07:13:17 -0800 (PST)
MIME-Version: 1.0
References: <20210307113403.11028-1-thuth@redhat.com>
 <878s6xam83.fsf@linaro.org>
 <e9809c0e-1dc1-bb42-475d-ac1c032bd075@redhat.com>
In-Reply-To: <e9809c0e-1dc1-bb42-475d-ac1c032bd075@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 15:12:59 +0000
Message-ID: <CAFEAcA_xERAsjXX_NRtFxrONrsmwQH4v_r24cwYPLV+-apgK5g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Merge the Gitlab-CI section into the generic
 CI section
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Mar 2021 at 12:33, Thomas Huth <thuth@redhat.com> wrote:
> Sure, it certainly makes sense to have multiple maintainers, but I think in
> this section, it might be better to also have someone who's also a
> maintainer of the qemu-project at gitlab (in case there's something to
> fix/setup with a custom runner for example, and to avoid wrong
> expectations)? Maybe Peter finally wants to join here to get finally away
> from his exclusive merge tests?

The idea with moving away from my local merge scripts is specifically
that I *do not* want to be maintaining CI related stuff :-)
I'm happy that we give the person who does want to be doing that work
the necessary rights on the qemu-project at gitlab.

thanks
-- PMM

