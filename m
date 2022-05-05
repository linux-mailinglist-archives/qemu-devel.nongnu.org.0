Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429FC51C5AB
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:04:12 +0200 (CEST)
Received: from localhost ([::1]:45494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmete-0002uw-FA
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmej8-0001F7-0G; Thu, 05 May 2022 12:53:18 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:46795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmej6-0006GD-C4; Thu, 05 May 2022 12:53:17 -0400
Received: by mail-ej1-x62e.google.com with SMTP id j6so9829114ejc.13;
 Thu, 05 May 2022 09:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=Msiwtik8tFyyUA5/qnFh0wN4ESwSdwAjl499C0bOXzM=;
 b=DZh73zKh5p05y4YQ7ba5dZ7rZ9itSo0q3HWpQGCglBV6eWx0WLnc0sc4BuAAqv6f7c
 FQLi6ToMTm70uevfdhD/37gULU7fvslX9kRTlCcFtPlzg3tFqrLJl7x4NATA40ynof62
 2gdiTmwmidPGvi+SikTzry0ojB+jufGa1M1qrh7Cd1FvaBwa1myek42nVqNhY4+6VLeP
 6OgbDMUdInRgWSmEa7DvbI6XwOQJMtYwUKV9c8H4TbjeEYHjbXNKB+b3ZOqptS1FM9YB
 FA+1oVkaw6aIeKj1bom/L9gGxbvtTnVc0BgugBWafMp1hXQLJHzNpyIwk3hZ3YzT9l/x
 DzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=Msiwtik8tFyyUA5/qnFh0wN4ESwSdwAjl499C0bOXzM=;
 b=5R2JZGxaknAbSrR0tFA8ELuuqZ6aCYbZ+/cF6+874xYU2toi84Y0tvTTAFWWS5jAuZ
 vec4shsitvQmBYxc8ki7B1jeufonlm14BNxY9U9y6cYMe7QPangeu/rg1/ev6Ldq0bne
 PDGTZK2+oLE71EJFAqps5dGT5EkfNm+UKqYDbHCj8HR1kxfX8af0pSftWSHCrJleQrBL
 +wzoRRdjaOmFo0O/sfMUCsplkasCcMQPQG7vvVDZDFAIYfPVvHfNK+vM4tUxnFUSVFdp
 0u0LrtzhUy0EHhgvGzIEBBVbbu+m6YLGNxoO2XwMfxOVPfAlgbwbC+eekkMfftk2HbN8
 /FDQ==
X-Gm-Message-State: AOAM530YIdfqhj29OKtBIjVArtx0TP648T1gGDPMsSmUeYIRpvprwjWk
 5EP2vasEaI6DJAC+ekih46b3IneZ7q8=
X-Google-Smtp-Source: ABdhPJwjw6aOeC8L0JIoD8ewlvq7U86CwW30zhsRlNghG1fpYJJM5Pymiz8vCbxMcSp72+C8j4Z3hQ==
X-Received: by 2002:a17:907:60cf:b0:6f4:4240:849 with SMTP id
 hv15-20020a17090760cf00b006f442400849mr21995415ejc.566.1651769594098; 
 Thu, 05 May 2022 09:53:14 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-078-054-123-159.78.54.pool.telefonica.de.
 [78.54.123.159]) by smtp.gmail.com with ESMTPSA id
 cf11-20020a170906b2cb00b006f3ef214da7sm945564ejb.13.2022.05.05.09.53.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 May 2022 09:53:13 -0700 (PDT)
Date: Thu, 05 May 2022 16:52:13 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: qemu-trivial@nongnu.org
Subject: Re: [PATCH RESEND 0/2] Resolve some redundant property accessors
In-Reply-To: <20220301225220.239065-1-shentey@gmail.com>
References: <20220301225220.239065-1-shentey@gmail.com>
Message-ID: <A987D65D-940B-4827-B547-92D27FBBA46E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 1=2E M=C3=A4rz 2022 22:52:18 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>No changes=2E Just also CC'ed to qemu-trivial=2E
>
>The QOM API already provides appropriate accessors, so reuse them=2E
>
>Testing done:
>
>  :$ make check
>  Ok:                 570
>  Expected Fail:      0
>  Fail:               0
>  Unexpected Pass:    0
>  Skipped:            178
>  Timeout:            0
>
>
>Bernhard Beschow (2):
>  hw/vfio/pci-quirks: Resolve redundant property getters
>  hw/riscv/sifive_u: Resolve redundant property accessors
>
> hw/riscv/sifive_u=2Ec  | 24 ++++--------------------
> hw/vfio/pci-quirks=2Ec | 34 +++++++++-------------------------
> 2 files changed, 13 insertions(+), 45 deletions(-)
>

Ping

First round of trivial patches went already in for 7=2E1, hence a reminder=
=2E

Best regards,
Bernhard

