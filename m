Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DEA9C631
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Aug 2019 23:08:06 +0200 (CEST)
Received: from localhost ([::1]:48018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1zk5-0000ak-Dm
	for lists+qemu-devel@lfdr.de; Sun, 25 Aug 2019 17:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54431)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1ziq-0008UW-Iz
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 17:06:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1zip-0007er-HE
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 17:06:48 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:40396)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1zip-0007eU-BQ
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 17:06:47 -0400
Received: by mail-oi1-x244.google.com with SMTP id h21so10686057oie.7
 for <qemu-devel@nongnu.org>; Sun, 25 Aug 2019 14:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kYa0+BniVg5HYZJqQ93aPKiuqjqbj3g8vhP2i3RlpWI=;
 b=TXIlIYVUAaiO9ZJTGk2wPcLzlSfRLbliYAWsmE9B0u7UAgj/1B+bfzlqvnboDtJXfa
 GnDULToW+UaCAlwiZcSe++AfiB1Ujg8eT+ECpUGQtW2W414lRhR9rIVa42Qb1Gle5gG9
 eGnLdMiEItqnOQbHh9nZfhsQ6S/Cnn5hbGplKnG/WzM4RyES6borA4yyFctDHtkyLF2F
 d4uClZSlm+4UC7mGZAiPTOX2pUToj70PsdaduAs+1O6pcG+Z/molQ9PLLBxumKe6R1E1
 FpO4s+VlO9sNUt1WrhdlMrum2ELh22/vzZIKmPw6TjRxM6qXW5ixa0KEmtpkO8afNSVz
 sM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kYa0+BniVg5HYZJqQ93aPKiuqjqbj3g8vhP2i3RlpWI=;
 b=lRBDZ0lu5t6zd83l9/eIJ7I4Fj+AKBPz200tKrHcqwMeN9dy6VCq3CUX+Bipq8y6I9
 HApqpvnLK/ujxJFc/9atIey+GYjFO13OUR2NHuEPlWRG0pLOLeC/tUNzFP3hejRjwaWs
 hSZ07lo6SdXMq9lr1/Wv5PyBB0/Djkydzne6US5Rt4wAOzVs0KoTED6yD7OYnwlITDuZ
 C71LhGn0tItjZWY/47uDBDNbNJD7YdJlel03ITFDcIGOn7/0c/bWl7JnvlYVmAsLHAJR
 tVWuojlD6nioYlP4hBpXdYcTjr2rlZQ+yGV3x/yP3D2rRNJKzDcYdkSR0+QzVJtUuLrb
 m4SA==
X-Gm-Message-State: APjAAAXhOa8X2xZPmppwvleOfeI0ApuIdpBI9a3kXV+ugjtoYJVc9T4H
 rAwysfom/j1T9HwAKfENvWANZjUpecMuJzfYhiiVnA==
X-Google-Smtp-Source: APXvYqxNGzbh7yRiQGScV0dosJQrbjNGb+IL7oY6OgwHko0gwqAu8oZpURav5U875PnowtnQYX8wvs8/vLbR0BzSNig=
X-Received: by 2002:aca:50cb:: with SMTP id e194mr9510414oib.48.1566767206415; 
 Sun, 25 Aug 2019 14:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-46-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-46-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 22:06:35 +0100
Message-ID: <CAFEAcA9Q9KJ7agTXN8LL_-+G69-kAUQMJV90Oh6QiFrRfdxCpg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH v2 45/68] target/arm: Convert T16
 data-processing (two low regs)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 152 ++---------------------------------------
>  target/arm/t16.decode  |  36 ++++++++++
>  2 files changed, 43 insertions(+), 145 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

