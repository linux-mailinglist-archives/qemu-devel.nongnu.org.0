Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAACE32B58A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 08:34:07 +0100 (CET)
Received: from localhost ([::1]:43172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHM1G-00038i-D2
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 02:34:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHLx2-0001IO-Ld; Wed, 03 Mar 2021 02:29:45 -0500
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:45061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHLx1-0007YI-4R; Wed, 03 Mar 2021 02:29:44 -0500
Received: by mail-qk1-x72a.google.com with SMTP id z128so23062969qkc.12;
 Tue, 02 Mar 2021 23:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JMnvIiW/mMBFb38uQvytSuCAH+0f+HgolVspU2+lxzU=;
 b=EmCQLZCmTqN3nMO0+6OV1GQJVLMWqtX/sNlzMflF3ZZkhp3LWziCiZ+G/6nqEoD3BL
 RNiDvPKiXyvxpkNtdHhd2Kliuq3Ikpp8hzzbY4w0RtXEMfwbEPYdY1rk5CYKdSD+FNDg
 6IVQGKmA+xHrsOncznvz/JtK57GqsIJI/daV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JMnvIiW/mMBFb38uQvytSuCAH+0f+HgolVspU2+lxzU=;
 b=gmhVV0LNm+zu1Jv8+Eboy3C2SblGvqN5zMg0FKepwHXJ0apn8m5xITMUqws6JyAYj2
 ImrY22j2MpomtnL64eu0nwIA+Q3/2wWowncFQ4Jw54D9dB/b5KXKB0trvxEWQMv9VEKB
 kXbwdlWEMJqwxpykUE+piQ74CK6+HtefAfx9kSRtDIMKxhVXeTiWXMAQ2SkWh0n2GwK2
 ZTjjVFKF4ghFmYaLRGWRBrozBN0r5Je74buwge0ByJCj18ZNnfXISwt+vENVW+7gPI25
 f8coILKYmZ8KvcTw1WE2l/DjFmbmjo8uy3qdVT1J4ruLO22huokF8U0BypYnre2UHI0A
 ClLQ==
X-Gm-Message-State: AOAM532S4uh2HzoKC3+zbuFWwQu4ndoNO42SKS0RXHS+khj52Xq2CP96
 iaDzkauda0kidNox0teDfT/TZBc1h7ZiRI86mi8=
X-Google-Smtp-Source: ABdhPJwK/T3p0IvMVBSVDlj7SWah+HG0uiol8xqBt16dROgmLxvJrUQB3NkxC6KUSKH0JJeTLbJBr7+r8TpKKpS5E6U=
X-Received: by 2002:a05:620a:c11:: with SMTP id
 l17mr5278103qki.487.1614756581699; 
 Tue, 02 Mar 2021 23:29:41 -0800 (PST)
MIME-Version: 1.0
References: <20210303072743.1551329-1-clg@kaod.org>
In-Reply-To: <20210303072743.1551329-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 3 Mar 2021 07:29:29 +0000
Message-ID: <CACPK8XdOQoEdx=n=zUAH74GNFN2G63WbMSx+uWPPXmJyo78CzQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/aspeed: Fix location of firmware images in
 documentation
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Mar 2021 at 07:28, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Firmware images can be found on the OpenBMC jenkins site and on the
> OpenBMC GitHub release page.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

