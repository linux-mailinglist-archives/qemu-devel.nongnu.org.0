Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B16E9C4DE
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Aug 2019 18:30:14 +0200 (CEST)
Received: from localhost ([::1]:43756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1vPB-0002mc-3z
	for lists+qemu-devel@lfdr.de; Sun, 25 Aug 2019 12:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34381)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1vNi-0001qa-6f
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 12:28:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1vNg-0005IL-SZ
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 12:28:42 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42981)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1vNg-0005Hb-Nz
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 12:28:40 -0400
Received: by mail-ot1-x343.google.com with SMTP id j7so13048018ota.9
 for <qemu-devel@nongnu.org>; Sun, 25 Aug 2019 09:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MwSbF/9WJpnXKH997o1IVt/NweMeFi+XXUHsBj+m5Gg=;
 b=f8OBDrGDv7N0G+3BjWZGECy2bwMz4cYdTZ5k9sIKWZquAFJ8jEY60kXjTl+8iNDAYN
 4xSaJFw7Qw7DgwkuihXjA+dUrTPkopR9a9avbHEcR3EWIeBetb6Jg5sVuNWblzyaBsEB
 Tm+7B13TmGMWnR3oCMcZPweTfu/AG2rnM0mCc2ufKiixqNKQZBFF1eQexBjOvwA8LuI6
 8YSbOJMPoHa10GPekYwHEe4GBvcn7vKKs6Iugh6gIpHXdKl2Sny6rz9hUJc6Sg00p1CL
 QDIzn556m8zTdO0gkH8kFA0BeWLSGdL3pnZEw1d8t47Umky2gEB5P+EgwA3mZbbuT+Fk
 gH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MwSbF/9WJpnXKH997o1IVt/NweMeFi+XXUHsBj+m5Gg=;
 b=h5bGnl1Bq4PxPImihSkMoooHqCsCqZPNF1fkEU+yLQ/Scm36sdYSwJNDIQLxFIS111
 yM4h3GU1RO9BLmusArGHLbtdxFOfQn37RBvfbrSbg4egvpVVEC8tIkLxDrv2oz0kmrTS
 RcQDMURR/TnbURYTWHb5LUHqNYj0gG3eo+zIfM0ezAVNj5v2SBNdV8XYiFg7pxua1tsW
 JfQ0zUiOnfm0yP5K1NCwaaMJCVhawhmYZQNpQ8yl6WBJZJKTeOTEsE8GRXQO1469w5A7
 Eq2HDJdRI/OkIg5eho/jomfL9Hb3+p9fea1gf9dJSO+EXLnizck+a74mOKQE3QQWa24E
 udJg==
X-Gm-Message-State: APjAAAXI1cZkUFywXzYscJutgkQoL4Ol9RuBF9AQlxoO3xT9CUoQ3VHd
 KU8cHDV5SaOWJfYrlvNRuGM0vVg7EWeB6X+gXJyMTw==
X-Google-Smtp-Source: APXvYqwwHk3JKD5UQup9uDNCQF2aWujJUsiJchp1E1CZiXUtpBZODHOFe4C/KHcsSGaEnDamS+ig0af4Mwqo4Pviwz8=
X-Received: by 2002:a9d:6a94:: with SMTP id l20mr11518417otq.221.1566750518887; 
 Sun, 25 Aug 2019 09:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-41-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 17:28:27 +0100
Message-ID: <CAFEAcA9aT7yq+_NzfcDWxuS3W3PMVmWLkHJSEmYh=aMkHA4j9w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH v2 40/68] target/arm: Convert SG
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
>  target/arm/translate.c | 51 ++++++++++++++++++++++++------------------
>  target/arm/t32.decode  |  5 ++++-
>  2 files changed, 33 insertions(+), 23 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

