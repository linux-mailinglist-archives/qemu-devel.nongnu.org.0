Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C2A30A567
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 11:33:48 +0100 (CET)
Received: from localhost ([::1]:44924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6WWh-0000gE-Sc
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 05:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6WS1-0004Nj-CI
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:28:57 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6WRy-0005dr-3d
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:28:57 -0500
Received: by mail-wm1-x32f.google.com with SMTP id m2so12151278wmm.1
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 02:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=JwTn4WzoMydrdklxTHj1fMbf6umpjkFoaoU7rlX4/7I=;
 b=sb9jKvCMu8zczYxsyRq02LBBti/ZOdH5Zwm3f4LD/HySVWzbn5CZ8DcEkI75DEsZCu
 3uJDhUb82cZy5Q89Bvkxv8STJA05I7pthmCvwP8C+tooJiZBXM+J0MQpKODXv1a7cP41
 xDIaCA7AhfsR7Ubos9t4Kehvn/B/B/otolc3khYTg2PYgYDM130LE0tMmtzhgw7V9Lng
 IcHlCE5o+/s/cxUpjYK7jvPHsCNUiqtaEz4+CbcMvHg2w9rkfbtGZHX6UUfPV4GP9GTa
 InAKMaHzZ7OcIMw0SM+KEq2PiF5Prio0S4z2h3S2DOEsRf2PDEFL2A+wNo5xnFagfdgv
 ojbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=JwTn4WzoMydrdklxTHj1fMbf6umpjkFoaoU7rlX4/7I=;
 b=l94DO0Lb4X+qP+pDEmlS6ROqFI8trcR8S8Z8EFfLSH6pXAzEbGqdZZEYFT/qjxUhqS
 vq6T8YGBTNK4eT3wxr1CnZ0hfhB0W+nWzEYLIYkMNJ7r5I8q29I8gyfxwx74Pz6yxgQj
 kgGibGpcyUSy4TjbMJ2Sgkq7BgcoxPBq7m95snwq5+flbqu4490iFE7g9yjTMArW5RL/
 YaP+QN0HNDUBTBl2mHxNCV7HNUaAVQ+ozWtBxv9D7S6ehXHYKXZ1tp+VNUMjOtf3L0ZY
 1P1iIC1KWwEzNNigdvUMibRHgpsjQ7W+fTfwRUbD3gdBlAGN9yXHcme+ct1OHa/o5jZs
 qs9A==
X-Gm-Message-State: AOAM531XDFTIYHfSCClOp/e5Qs9EYzhLVDPt5vNujyUb5brODmicG4YC
 yQNvhTavoGYBAni0QbblMfKsWw==
X-Google-Smtp-Source: ABdhPJwl3fFzG7nkZmHc4chDesPBwhjVp5hsHJfAWjAqUQNDmaCHfGwDeOnlgNadntyr/m+LW2Ciaw==
X-Received: by 2002:a1c:9cc5:: with SMTP id
 f188mr13983865wme.171.1612175332590; 
 Mon, 01 Feb 2021 02:28:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v25sm21131150wmh.4.2021.02.01.02.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 02:28:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AC81D1FF7E;
 Mon,  1 Feb 2021 10:28:50 +0000 (GMT)
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-3-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 02/10] hw/lm32/Kconfig: Introduce CONFIG_LM32_EVR for
 lm32-evr/uclinux boards
Date: Mon, 01 Feb 2021 10:28:44 +0000
In-reply-to: <20210131111316.232778-3-f4bug@amsat.org>
Message-ID: <87pn1kw07x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Mar?= =?utf-8?Q?c-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> We want to be able to use the 'LM32' config for architecture
> specific features. Introduce CONFIG_LM32_EVR to select the
> lm32-evr / lm32-uclinux boards.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

