Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A5830FBE0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:48:04 +0100 (CET)
Received: from localhost ([::1]:38050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jff-0004zQ-K9
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7inG-0008F9-7u
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:51:50 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7inD-000341-U8
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:51:50 -0500
Received: by mail-ed1-x533.google.com with SMTP id s3so5264159edi.7
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 09:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xkFGOL3pCQUixJJfq0LPrKjf2gkPKEbH3I5K4ncFJCs=;
 b=ZSfhlIkZUbFRPBfxTi9XolE+B1wgz3mboHJvGarc1i7l88VHLnzIHdTGJZyUC2MzzD
 E2Wi+YPznfe8QpbL4y5KelCqvnflwLJXdoNiRsJI6X8AzAR1CpNunSxHQqrLUvsBfJTu
 3EDjI0E/Gm4X2dZBpa+yOGYeYHvL0e8qKgQa1hMlu4rnTi9I8FuMfUhNNTt5okFYGvdK
 /FJ4QyDYqkSJzd7J/JQtwQC3M+IjjV4P4vRRmkxzbxc9Hab8YaFbaR6aD/jrbpNn9sQY
 k0ffYmFpeV0uPcWqZRRIDVVd7O83YDGGHOYXwwEMX+kQ4Ja/KesMnkAihnCLgqmC8nNl
 Wzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xkFGOL3pCQUixJJfq0LPrKjf2gkPKEbH3I5K4ncFJCs=;
 b=GmyRQKbBxdsymzCjXP6kZktucV8YMcUlZF/aXsGpgc489STbNoHBlHzYRhdf7SjtMV
 arh2vkxk6w2lzLcPQfIBtGCN5Fmx2/Ln4oL/JLsxiczUh/Vw0PWQz4xDF83VS6q6EOvb
 xy77ZUfd/RMHhrGfWfZIH9jMjlHtaBtla3YqbSeQhimRrYPcaYO3okkPEBwfMK/uscj5
 fhd2YZQj+uC8evm7KUxjiMpXwQWlvzNpiEc8bt/8uprrKGYwzrRPn50053RaEqGCVeew
 NtWFf2J3LFmKSdtAcNAst6Mz9euB+WF+Hq/XEzSKkALhyd/LHXd2EdpnZFqb/o79Nk0a
 peQw==
X-Gm-Message-State: AOAM530DB+nUot3YHB0gmUW1SXaVvpehRHAIZyy1is63F2TtUAbZ/0Ha
 aM4SQo92YVsh19RDldwsseHcAn7tijwamruXGon8CQ==
X-Google-Smtp-Source: ABdhPJyxvZzOHXq5SvRM79AKGxNDOIYM+iEGNtdPBg7A7xDVOT6sO9gIN+dgkUPvVyINLfJBaSLMDc94SW2GFuACKMc=
X-Received: by 2002:a50:e80d:: with SMTP id e13mr96207edn.251.1612461106232;
 Thu, 04 Feb 2021 09:51:46 -0800 (PST)
MIME-Version: 1.0
References: <818b08af-3077-7003-63eb-614fa459d01c@redhat.com>
In-Reply-To: <818b08af-3077-7003-63eb-614fa459d01c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Feb 2021 17:51:35 +0000
Message-ID: <CAFEAcA9LJMS+qZRn9H97cnderDm8LRg7wyy+dgz3nXGLF_QQeA@mail.gmail.com>
Subject: Re: iotest 30 failing
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Feb 2021 at 17:48, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> Hi,
>
> Based on commit 1ed9228f63e (ericb/tags/pull-nbd-2021-02-02-v2)
> I got:
>
>   TEST   iotest-qcow2: 030 [fail]

Yes; see also this thread:
https://lore.kernel.org/qemu-devel/9e71568c-ce4a-f844-fbd3-a4a59f850d74@red=
hat.com/

Can somebody write a simple patch to disable the test entirely,
please? It's too unreliable to be in our CI set.

thanks
-- PMM

