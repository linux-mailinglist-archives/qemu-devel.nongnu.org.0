Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9867B3C8BD0
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 21:36:21 +0200 (CEST)
Received: from localhost ([::1]:38908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3kg8-0003kv-4z
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 15:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3keZ-0002Yi-T9
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 15:34:43 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:39772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3keW-00020Z-6f
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 15:34:43 -0400
Received: by mail-ed1-x532.google.com with SMTP id v1so4698685edt.6
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 12:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eh4JgfI4Zpsc/Nbe+Nx0saDA/eOx7RpzBk/3orzO+PM=;
 b=redavrohVXq+q3tp1GIsOI47qUD6g6rU2GSFhBvcT96c9MutGjp5ud/0hEEbq0AcG+
 p8C0Qu2ESP5zO0O7n8Mlw5Xkgu8HeSdXB929Mpt/6r/n4Ssk2nKsfkA8RDtP5ysRy+vV
 5wrdPJviBI60gJP12wqrbvCpGu/WGsq3QUHHSG9hFYeG6L/4geiW4x432AyeGVtRqQxx
 RWwy+0CVVJFYlslZcoOpitrpl6XA9QzvZGZTD6etYpA/Q+Id0TDaM8V4UktCrdEdBsLV
 pYjQ3MpJ+18DqsvtEYNhnvaoh+nfjMkyu4HtiP540aKnk8L8ajYlq9MrOqTe4Jkw9df+
 74WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eh4JgfI4Zpsc/Nbe+Nx0saDA/eOx7RpzBk/3orzO+PM=;
 b=rkCckGmUlsNUIH3rwSsju/LHizcb9e9/z6EwVhNrDtI5qVCAjZjas6dmoPMc9gML1H
 O+HkEYCZlVmuhrIvVLprAP0AsQExqpM+Tjm3QuNC3KOjoADUMwqOW0L6TA1Cud92AeqZ
 tq6sBbEXAtAjKEGyFS+ZnhHUCCQGrGFfoL5dxBpYxC0GRgQq/RQfr8SmRrKes/FlP/T8
 R20pQ4sKvRrhT4b5IUra3jpwMJBIFoOrt05nGbNCqf4MXxlEd8N38OqFCHiZzGLLQyhh
 Q45ic3oJxBEiHGxeREnMWIel85Zkup1Xs62SsBZRipVv8YQQmlb2MGV8j/UQoD14J4sX
 CBEQ==
X-Gm-Message-State: AOAM5321R7mDIMTFhebvSztS3V5pI/sNvb50r8eLfrSJPku7vfNjPAgD
 KtfKpsfxC+J79KMuPfrYdigGTa9QGu2XVxAuhGgLRg==
X-Google-Smtp-Source: ABdhPJwEVSsiOdf1eBCzNA7W3PU4gwpPKHhJUw8Ma5yGysv/1pzInLnfm21mU2iwiHQt/yFzNv7GnzH8ueeKPsBqkDI=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr15654301edt.100.1626291278113; 
 Wed, 14 Jul 2021 12:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210713211923.3809241-1-crosa@redhat.com>
In-Reply-To: <20210713211923.3809241-1-crosa@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Jul 2021 20:33:58 +0100
Message-ID: <CAFEAcA9corAMJPn4oZ13ovrdfdCR1ZFuRHRcfnFVOiDs7pxfPQ@mail.gmail.com>
Subject: Re: [PULL 00/23] Python and Acceptance Tests
To: Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Willian Rampazzo <wrampazz@redhat.com>, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Jul 2021 at 22:19, Cleber Rosa <crosa@redhat.com> wrote:
>
> The following changes since commit 708f50199b59476ec4b45ebcdf171550086d6292:
>
>   Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-07-09-v2' into staging (2021-07-13 14:32:20 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/cleber.gnu/qemu.git/ tags/python-next-pull-request
>
> for you to fetch changes up to c4e2d499c94fb7d6ea43d28e2613559861ef5d79:
>
>   tests/acceptance/cpu_queries.py: use the proper logging channels (2021-07-13 16:27:43 -0400)
>
> ----------------------------------------------------------------
> Python and Acceptance Tests
>
> - New SMMUv3 and Intel IOMMU tests
> - Respect "cpu" tags and reduce boiler plate code
> - Improved logging of qemu execution output
> - Other misc improvements
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

