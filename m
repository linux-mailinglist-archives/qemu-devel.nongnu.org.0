Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7167A6920F4
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 15:40:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQUYu-0008Gc-Kc; Fri, 10 Feb 2023 09:39:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQUYt-0008G7-4J
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:39:39 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQUYr-0002C4-Ae
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:39:38 -0500
Received: by mail-pg1-x52b.google.com with SMTP id q9so3835647pgq.5
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 06:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZeS6cET6lOBNmWTRydZpAT15MUwnqq2DFp3U3yxTmic=;
 b=FDQshhILE9b20GQrNCJzdZE6HsoXMeOUMzyvFrll0+sE9xdqwhWTJWefYeXU0PgzG/
 q0e9KwCO7rUBwuzqcDTIaMO0bxQ+Gzq/3LttiKI36NRZVGihaG0C9kJykrSEESo2LZOi
 ST9Oyxskq0ypVke1M8LxTLyzIIT//rxQIr18tSfXhCY19I2d3BVwgmTUC2QgIv1qR0p8
 3lkD/MVXkz2pmfBGgTgM+umFDu8KpzYaeUFa2NrnXQ4pgYi2+rLIVKcKypxeXoxiAp3W
 ffOqHHEt/st7atNyQrdk2cr5iYlbcBeePnEo30ng8F67l/AFVk/4Zu6kBnug2DnBjT6F
 zykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZeS6cET6lOBNmWTRydZpAT15MUwnqq2DFp3U3yxTmic=;
 b=S9bltJB3+pYZ5+ZRjZYXCksQTOdvNJS17ext8E8P2RAM2Sefpc+KHnR7znBbO5eLJP
 GVGEnozB+xtQ2KpW4DebrjkUtXDjuq9rMujiuu3ukTm1mVsCr7xGk/XXImcF/WGvVQBc
 eXnyzoAVs7w3mrwjxJVCEE4gj74npx5c2EstPXh3aBemPvoMsglC7wSY5OSkibreAoxa
 LVuCDkPveak/xU53aCYIFv6xgQIuedUIXdnb5l1rQ1ennigme+McidB46psUrsihvRtk
 eXe460lqv/zbYg2Z10C73cZLzikqE30pW1KaDY6Wxi2YaQvc1WLS1cMgmdE3FZb2dHXs
 ooaA==
X-Gm-Message-State: AO0yUKX57sJdADyaa6dqR12GNsTAplX/dTumBJeoOi1ZMOJ3B7L0s9YL
 1ZDAoOnNXFDvBWe7TIUEwBDtEjhvENJV5gUF0oVa7Q==
X-Google-Smtp-Source: AK7set++hAX+p9VxQkTSHomt7MF1bLHB/7TRAzo488FVHK5B0WSN9MTq0droGOHxnmnBF0YtW5o+vRpcP4D9r6LqE9c=
X-Received: by 2002:a63:9356:0:b0:4db:3747:ff55 with SMTP id
 w22-20020a639356000000b004db3747ff55mr2993399pgm.110.1676039974836; Fri, 10
 Feb 2023 06:39:34 -0800 (PST)
MIME-Version: 1.0
References: <20230203100551.2445547-1-alex.bennee@linaro.org>
 <87cz6loahb.fsf@suse.de> <877cwtpl1v.fsf@linaro.org>
 <87k00p7gwt.fsf@pond.sub.org>
In-Reply-To: <87k00p7gwt.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 14:39:23 +0000
Message-ID: <CAFEAcA_tRKUpBXkrzaZneX4NUgzvE3P1Kb8roGYRVHbjEkLNkg@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: disable FEAT_SME if we turn off SVE
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 10 Feb 2023 at 14:07, Markus Armbruster <armbru@redhat.com> wrote:
> cpu_arm_set_sve() is the setter for property "sve".  Checking the value
> of another property in such a setter is usually wrong, as Fabiano
> pointed out for this case.  Check in the realize() method instead.

Yep. Compare what we do with the "must have both VFP and Neon or neither"
check on those two properties, for instance.

thanks
-- PMM

