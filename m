Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C20A13A7E85
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 14:57:27 +0200 (CEST)
Received: from localhost ([::1]:36724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt8dC-0002A5-TC
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 08:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt8bS-0000bv-2h
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 08:55:38 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:37620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt8bO-0000td-Ua
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 08:55:37 -0400
Received: by mail-ej1-x634.google.com with SMTP id ce15so22359464ejb.4
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 05:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kmwbq7fCaR9bueBB4agxnlkDOrnJX8w3X4d5mdJlxXI=;
 b=mcM51RFCOUhvdZ7iO393ins5ABJNpEDwTzioAeGQKHEKtP59hFFYVvRE9PRXr/Zpma
 2xJB/R+Fki1V2ikhA9ngSFYqFFAhOWVktbE5WyhrCeNX18h6mE7h4HM3jNTi/4ZBFCnn
 Dz32TB9GBBtW1BjxToIj6Rj3rIU2QzPbgF/8lNF4lIuaJb1lrl7iI589sV9Hf9JMHvZo
 gyiCuGtq/ffhZP6MhpkhTuytH2MJvdWcp1h9y3NuZ6XXdU6vKbcrJ6M+7k14kw1eOeZj
 +I9JAqDaP7BELMRWxgJNoS1JK/f7B3ozB9ds5z/+st3FfK+B6pOd3fu0GZGwavdPAMMr
 TQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kmwbq7fCaR9bueBB4agxnlkDOrnJX8w3X4d5mdJlxXI=;
 b=LrznHTJUdrgyFGdaoAdBYbPBQEZZO+QleqPXmb60dkF6pZKcavLWmiKPyKp9M1DAVw
 MURdGMxzR6lYyNc9gfvA39Lfpr4a6NwNf8dwJ+OWzVig3C1ZC4jzG4rfBSMlgFgWqe/F
 oWUqVkP8SHoIk185Sfbmg2aKx2WtefjasZTyC+v6BlVuK1H76DR6DVDw6hNAURghrY2q
 nYYoZMAO4bCdx4ozq/1wesiXcufG4GlfM282bC1ONf6erEEHHgSJ10q3+P8rQL/thf/y
 DS7eADIbbJtNyrs8I+H9MoUOyUW5f+0jHe223TOZ3BzaLMef2GNyc9EGMhUlLmfYWD9N
 47/g==
X-Gm-Message-State: AOAM532b3FH8JyT7LgAA4sevItFWRPRWxGO0IKRMdWOFuY91KnkkUjPl
 2rxbpa2z6ZsDzJ17m5BSyOWMxA8KGQO3sj5dr/nd+g==
X-Google-Smtp-Source: ABdhPJxVAUg8/nXI1DiLo8C+YWaV75oPTFx7AxGSPYfpBO8je9T0jJNTuyeJE3TWqrTiMVNRdy1JiOwcFyPV4Q89TFs=
X-Received: by 2002:a17:906:a458:: with SMTP id
 cb24mr20806336ejb.482.1623761733429; 
 Tue, 15 Jun 2021 05:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210519202253.76782-1-agraf@csgraf.de>
 <CAFEAcA8qwTY7OZzZSCqD3CA_wsL9VJEFWkCSNAerQohM4VvMuQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8qwTY7OZzZSCqD3CA_wsL9VJEFWkCSNAerQohM4VvMuQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 13:54:59 +0100
Message-ID: <CAFEAcA_jd-htXgeykbpSDQmv5NwJNhJSP8fi5Zo9xTrTvBnoTA@mail.gmail.com>
Subject: Re: [PATCH v8 00/19] hvf: Implement Apple Silicon Support
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Jun 2021 at 14:43, Peter Maydell <peter.maydell@linaro.org> wrote:
> I haven't had time to review the tail-end of this series yet,
> I'm afraid, but these first 12 patches are clearly all OK, so
> I'm going to put them into target-arm.next so that at least
> that refactoring part is in master and won't go stale.
>
> The last 7 patches are still on my todo list to review.

...and now I've gone through those last 7. Sorry for the delay.

-- PMM

