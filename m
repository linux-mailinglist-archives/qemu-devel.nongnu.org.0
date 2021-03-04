Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EAB32D3CA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 14:02:49 +0100 (CET)
Received: from localhost ([::1]:44508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHncu-00019H-Mt
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 08:02:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHnZ5-0006HB-6S
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:58:51 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:42636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHnZ3-0007dP-D4
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:58:50 -0500
Received: by mail-ej1-x629.google.com with SMTP id c10so22688755ejx.9
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 04:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6MxtkjnAVS9avXsgxtvTsVRFvzO6SApOtcK7fYJMcec=;
 b=GZal2NwL5aNTPD1dHvmctXjFisKwGDh3sND06bOtquyeePgbwEcFR6JM3oRqtDJHXf
 +aYQeXiZB6FLoehzdXhsdoZ5W8bzpOq6KK5pA2J8N9UtC/954rmvq0kwOd9zo8N3m+O9
 DPcJOncgU6yRezvMzefV97lY7t/335/YCUaxh3JUC4gmeclY94h1yIti0PCrDnEsdUa6
 +03h6OCLanib1HB/8PUE3a7/4OQQKHfDpUcIVpHfclM3jtUBGsEJhfj7EvLz7TUkDfjO
 sFYGFNFiWO182rg0hmM1fl5nd7NywbzLHyD6t83rhXP1xqC86z9YFAmLFm717LlBJcuK
 NVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6MxtkjnAVS9avXsgxtvTsVRFvzO6SApOtcK7fYJMcec=;
 b=JvghLEAb321OLJzd4onoFofPlWm2twDe+/c4XPwKtKcoFMKf2nB5SyPZtTUxBnqP/z
 EcCujGl4+4/5yG9mIfMrcp6cLjR6LLtj9ohawn0XVhPNjvJk5HelK8bfKUGfOUwOtR+s
 IlyX3n8eRK2itoqi4fiRh3Rw3/+XI0jctSzfaGPtOwuYF47jmGyKz6vq/+H2rVw0znOv
 5X0K8REzkWGHcJA5dhfDv0Dc9ONfiDD+BjuFHjMFn79XFjkP2QxLG+0Ht6DuvmJAMsoH
 yU94ufXDMVeDOm6yHX54NIZkJ6kPgYUFe5JHJDG8GmWLmTw30l8Xanvw5NPcSX+rtS2C
 u8XA==
X-Gm-Message-State: AOAM532LHt7e0fNbiwOZHL7Iy1tkEmaOrsW0Dv52hvZKjlVsYGpgUfx9
 iXoXvgRY+osfWo4fPRgV2h/ReEOUcUkRUOIGEzKwpQ==
X-Google-Smtp-Source: ABdhPJy3i8cW3KUBXudYoXJG/yYsEz7dZLB2Y9NYgNIecxi/+DAyjfJ7xbAoNITGylCNorHGDoshLLUJUQ3cf324XJA=
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr4193035ejb.56.1614862727336; 
 Thu, 04 Mar 2021 04:58:47 -0800 (PST)
MIME-Version: 1.0
References: <20210304103858.38400-1-dgilbert@redhat.com>
In-Reply-To: <20210304103858.38400-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Mar 2021 12:58:31 +0000
Message-ID: <CAFEAcA_f2LP17R2kG6uYPKvogD+qi5X=q-WCkZ+rMRPbChXAuA@mail.gmail.com>
Subject: Re: [PULL 0/1] virtiofs queue (minor security)
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Mar 2021 at 10:41, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit c40ae5a3ee387b13116948cbfe7824f03311db7e:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-03-03 16:55:15 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20210304
>
> for you to fetch changes up to e586edcb410543768ef009eaa22a2d9dd4a53846:
>
>   virtiofs: drop remapped security.capability xattr as needed (2021-03-04 10:26:16 +0000)
>
> ----------------------------------------------------------------
> virtiofs minor security fix
>
> Fix xattrmap to drop remapped security.capability capabilities.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

