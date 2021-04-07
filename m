Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD00835745F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 20:31:44 +0200 (CEST)
Received: from localhost ([::1]:50298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUCxr-0004Ra-V9
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 14:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUCwA-0003u4-B5
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 14:29:58 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUCw7-0002ew-7l
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 14:29:58 -0400
Received: by mail-ej1-x62c.google.com with SMTP id n2so23035531ejy.7
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 11:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=leELXv5FVxkDo1qW5sohXz8hGCf4cAci2lhWN9QRgDE=;
 b=yjARTOadfsxoIMq6qdvfqmONogSDMxqJgKoSHOhNoSJtSpJwSeD+HLo6BYVJKnnPLB
 lKHKmgEqsTOxh4E1NH3CrCEkX/6gZllvzhF91mkJW3FmeJT+IneIxmF92yo032r6SkCp
 vSNLt3lVjSZhg9hp7yGynUF0Cp47/yfJHnT5QjFtsM6ljMe9iP7Nsdf/zEOR1dg00CGS
 WX0qZ8ho0kHKX3ByBkGjbWG6XbKEKY6yl84N7+JPQk4Za+jqbIAkVF+5by7sdDl3OYev
 g+DPrHMYEG18OtaAgIkFicAyaBwfXvwChx2dPbApmXVsU2jUhZJjM5LRMwYbfFvDI45U
 cSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=leELXv5FVxkDo1qW5sohXz8hGCf4cAci2lhWN9QRgDE=;
 b=r5z8kwrCp47fD45uBHjQ39/1OVHzgVyNK8tqPQc+7SngHi/kw9ADyr/x8an61FlVZn
 PTQyVdfB9jwfOq7BuTwhIOaxm3nd1QbmEUXZyZZH5/xGOw04vBedVV9YWL3/Or5YufyJ
 7PdKj0VF5jyayeoBwrF19YBTq3fUyUP/FSS06WSFuzn/6wXIa9kOEYZQO9hMaG2bKGaX
 pqWy/wvjlaAetHh/h9KiD7JDRVY9VOKvu9ay3m9+hnUhvSlBWF/BR1iOTLiAVxLOxkji
 3F64V4oWZdCf/thch0dU9u4TJrn3W+J7HZntJ/OsfGNRnEQvEU4hZJURyrE1ECNUMVKF
 riJA==
X-Gm-Message-State: AOAM530iHakAERQSf8oJVtOlhMg+YM/lFhV0N+xpvz8K0FM/UszUZInV
 b4MKY+TPFzG1ic9WEGD6mQnFTZFf9qNsTIhy2J6gYw==
X-Google-Smtp-Source: ABdhPJwdxynQ3OA06cQ+b+amxgyYikzkZ1Vg5oqwKcjMWF2coieomkgpRL/RCur8qDGjN7UsoXuUbYmUktXGlio0XDg=
X-Received: by 2002:a17:906:ce32:: with SMTP id
 sd18mr5348406ejb.85.1617820193955; 
 Wed, 07 Apr 2021 11:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-18-clg@kaod.org>
In-Reply-To: <20210407171637.777743-18-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Apr 2021 18:29:14 +0000
Message-ID: <CAFEAcA9LEO2BzghgCvp5hfFvRx1YyL5XZxY70FHPGwHeHxZZhA@mail.gmail.com>
Subject: Re: [PATCH 17/24] aspeed: Remove swift-bmc machine
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Adriana Kobylak <anoo@us.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021 at 18:17, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The SWIFT machine never came out of the lab and we already have enough
> AST2500 based OpenPower machines. Remove it.
>
> Cc: Adriana Kobylak <anoo@us.ibm.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

We've had QEMU releases with this machine in them, right?
If so, then we need to go through the usual deprecate-and-delete
cycle, we can't just drop it immediately.

thanks
-- PMM

