Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD03A1F953C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 13:22:54 +0200 (CEST)
Received: from localhost ([::1]:41106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jknCX-0005aR-Qf
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 07:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jknBn-00053Q-3Y
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 07:22:07 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:37776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jknBl-0006er-0A
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 07:22:06 -0400
Received: by mail-oi1-x244.google.com with SMTP id a3so15563781oid.4
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 04:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oLHiHHn5wO2Tihs5EiE56VABBjq6ipTkl1nGQyWrv6o=;
 b=QjQokknKY0K8Ckya6aedOpfnXkKeIGenNyNo2gEU9AXW45ezpqfJABRbFfIsz+Cwrf
 LZE8rLEXJZQj9K0oEdg0jXqBzcnXo7RXF+Ta1nN5/DHrbrvCPW8s+BLdwy8YmQ2ae5mq
 lo/VXlkzrl/TUBG7EeVswMbDnHRXQfO/73Qt0Jr6qYsw/7nApEWctvJ2ahPdPRDhaRL/
 JiSEYXPeSzjQyBYd09THNTauUQxKJOsp1mjq9koeWVr3tRn4irYMf6FpbI4nxUAgbBfN
 jClUpKTxHp5qIh2NmiS92zllvYJsoxawqg+xEYHM6ZtVUFNin7gec33nqNsMCk62oeY1
 xFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oLHiHHn5wO2Tihs5EiE56VABBjq6ipTkl1nGQyWrv6o=;
 b=PEXKBFcOQMZUYbysMCYi0/QqK0RuXpOQdsq9p+sXLnuGIZVmMCTzL5BlIFdmJZlqPB
 0Zc6o2LmZ8PKeSOm7B926EXRiCQl8ZXIwbiHerGt9vQbO1qiA56X34zxJCVh+HIm99jq
 hbiJkRsOt5CG9zsrF8l/GoL86uGgwMB8Kqfw0Kjj39KFUnubiFAGsoGvAVKGUc7bna5L
 ibqmbOR/7t4pKKc84cP+E7a0ecHTTWthGQDeJeZbUWh1n7R2wky+8d0z91jLUSHuiV0N
 n3vz49oiLc2BnNTixSqxj1INZ6ygHyeGyItukZPLk12iygAwFJokJnHJZHvYtdqKlwOK
 lkKA==
X-Gm-Message-State: AOAM530Gy3mEE/jvMGNvIdFoOVaPWspg7joUbWsJA9TJ8KEz89sou4gO
 TLpbdbeQZmbZunWT/DGTGyrp3/cjph/XOlFDVoZHpg==
X-Google-Smtp-Source: ABdhPJzwWzVwQ4GwtXB2eniwtcBRm8OqdpImTSTffTOr8BAZscAa5OWXa8IaYhRV6aOTeQ9cmciLMiqiinPu0KkbT/8=
X-Received: by 2002:aca:568c:: with SMTP id k134mr7847554oib.48.1592220123436; 
 Mon, 15 Jun 2020 04:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <CA+MHfovYq1UAQQ341MnyGas7ScskWyjR=QE0D-RS7+zxF2mtsw@mail.gmail.com>
In-Reply-To: <CA+MHfovYq1UAQQ341MnyGas7ScskWyjR=QE0D-RS7+zxF2mtsw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2020 12:21:52 +0100
Message-ID: <CAFEAcA_5uUXtEfKLT9isq3jWMfoSebx4OW3XbDKXZYhSd6-TgQ@mail.gmail.com>
Subject: Re: [PATCH v2] Implement configurable descriptor size in ftgmac100
To: Erik Smit <erik.lucas.smit@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 6 Jun 2020 at 10:03, Erik Smit <erik.lucas.smit@gmail.com> wrote:
>
> The hardware supports configurable descriptor sizes, configured in the DB=
LAC
> register.
>
> Most drivers use the default 4 word descriptor, which is currently hardco=
ded,
> but Aspeed SDK configures 8 words to store extra data.

Hi; I've applied this to target-arm.next, with the parenthesis
change that C=C3=A9dric suggested; thanks for your contribution.

A couple of minor patch format notes, which are only worth worrying
about if you plan to submit more QEMU patches in future:

> ---

The Signed-off-by: line should go above this '---' divider, because
it wants to go into the commit message in git; anything below '---'
is discarded when the patch is applied.

>  /*
>   * PHY control register
>   */
> @@ -553,7 +563,7 @@ static void ftgmac100_do_tx(FTGMAC100State *s,
> uint32_t tx_ring,

Your email client is wrapping long lines, which corrupts patches.
(You can see that patchew was unable to apply and CI-test it:
https://patchew.org/QEMU/CA+MHfovYq1UAQQ341MnyGas7ScskWyjR=3DQE0D-RS7+zxF2m=
tsw@mail.gmail.com/
)

I fixed this patch up by hand, but if you're planning on sending
more patches in future it would be worth sorting out how to send them
in a way that doesn't wrap them. (Most long-term devs use some form
of the 'git send-email' client.)

thanks
-- PMM

