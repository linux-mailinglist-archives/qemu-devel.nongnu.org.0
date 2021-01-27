Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE010306259
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 18:43:09 +0100 (CET)
Received: from localhost ([::1]:48464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4oqS-00067y-AO
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 12:43:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l4onq-0005WQ-OW
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 12:40:27 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:42827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l4onk-0000Ym-IN
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 12:40:25 -0500
Received: by mail-ed1-x535.google.com with SMTP id z22so3442529edb.9
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 09:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zDeKlJnnadH5PCMmkfgrkKJIx37sdfDmj/4RV6KzgAk=;
 b=g2ldM/sWUREFtBIanc0JILPr46OpnL3CR62Av507TlBVI5mKnmVzyS38+gajVIcdxX
 QNiYtGUBjH4yf5Pw83ag6MlaRAafNF79SXmAFKZ11xIIDeYyVkMqjL3xmdcReyJOt6mD
 UFRhtu6l54ERNMDkY1qlkpAzJbC8VYLj2/tsNTG8RLjJ/kaGigACL/1viUB+9xKbgx45
 kLyUzXTx0BY67gB3BWguAt9ge7S4u7RkidgfdMLAIyOkedLarS8Iwc79LOR+sWwAP7ZT
 FTZBLU1PX0Aex/KpUxkZsdKA99bFejFcxZxLaOLvHieS5H2IqjRPYeDOXdIdoMONORhN
 EFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zDeKlJnnadH5PCMmkfgrkKJIx37sdfDmj/4RV6KzgAk=;
 b=GFw5JrMnuj/ungh1dvEeBm6SNhe08E1tTYCIg2N124sQtSexKTvxhBZ7veijq5t1I5
 5TGoZKlDXRf8Ja53PCItdS3GLMOw/PoEhi6SCQzczH3GRALFh0fl0NrWBP+SRZcnmVTZ
 8TGHXO+HC6tmX/guzmp1vq448L5xGRfqvqSivOv4mQzaRqXJTN8WrVdhX6xI+0vQ428o
 j30ny3Kz62AczwFXkfGS0JbCM1KRU1Y4xqbAkCNx+eNWl1aFqZgvFO2eGlrxxeRsZGnn
 RmRdta5nAiFVqvk+OoK0N1JSFaqP8gBk9dAf/v7853xXI0FrWelePr1bcWcbUnTa5Pl7
 HxYg==
X-Gm-Message-State: AOAM5330l+ykPXtN1VgiBAvaHCmeU0mQPGa4jEvWopSyOP7D9cMJ5c9L
 HxdunK7ySQTnRLRbyZpi3YnYnq3yLRC9PwyKsyrDag==
X-Google-Smtp-Source: ABdhPJz7oJjHnzg50GZY5VHEcZrMc2mmg4lwPYkW+aI4cEFD/lVVOwwF4BFX+1tVOeHFUR1qXCllwa7862z0sG6Xpck=
X-Received: by 2002:aa7:dd12:: with SMTP id i18mr9944588edv.36.1611769218224; 
 Wed, 27 Jan 2021 09:40:18 -0800 (PST)
MIME-Version: 1.0
References: <20210126142016.806073-1-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 Jan 2021 17:40:06 +0000
Message-ID: <CAFEAcA-Vus5BZ-m_jOuTW=-2Dw5icL_wADU-wGMwqnF6kR4KJw@mail.gmail.com>
Subject: Re: [PULL 00/53] Block patches
To: Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Jan 2021 at 14:20, Max Reitz <mreitz@redhat.com> wrote:
>
> The following changes since commit 31ee895047bdcf7387e3570cbd2a473c6f744b=
08:
>
>   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' i=
nto staging (2021-01-25 15:56:13 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/XanClic/qemu.git tags/pull-block-2021-01-26
>
> for you to fetch changes up to bb24cdc5efee580e81f71c5ff0fd980f2cc179d0:
>
>   iotests/178: Pass value to invalid option (2021-01-26 14:36:37 +0100)
>
> ----------------------------------------------------------------
> Block patches:
> - Make backup block jobs use asynchronous requests with the block-copy
>   module
> - Use COR filter node for stream block jobs
> - Make coroutine-sigaltstack=E2=80=99s qemu_coroutine_new() function thre=
ad-safe
> - Report error string when file locking fails with an unexpected errno
> - iotest fixes, additions, and some refactoring
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

