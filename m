Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7FC35E322
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 17:48:48 +0200 (CEST)
Received: from localhost ([::1]:33152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLHT-0006eL-FR
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 11:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lWLGd-00066p-85
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:47:55 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:43597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lWLGb-00048I-ND
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:47:54 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id i11so2757488qvu.10
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 08:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=y7J/fBirApy78iLSgXTfuV1e6gzXBUyIlvX5q0pbZ1E=;
 b=O2rw5KqLRFWHUGy8vZELNtbKhvdX3uZFaDFiBMZUjvQvrp4Z4aLp6Kqv9C0IVTKwpd
 GXHOSxkQ+O7GxxTLiStzQ6iPY05vCO2bYOZRG5q+U0qM6FX53MMKR0Hau1UXhq6cClXX
 2xMQinSM8E8VPRHxVULfvyUug/YJ9ORXTk8S9e1weWs/Cmy2zCXZsB3SgmYcUkD0M7eR
 tcndWSU58/qdpL3rgedSj/8r69YOrr1Al7mAuMWRIJkA76Us65NRFZQSZuPV65FytZee
 EKqiFQ3y8el7nO6+YoJQsaDiUitPQljvQTcWanp1hjv7yNAtA/UiQiHRxihB87DMxFPh
 qZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=y7J/fBirApy78iLSgXTfuV1e6gzXBUyIlvX5q0pbZ1E=;
 b=YK8s40FfOYmAkaVGxvl7+KtfIupT4iA6/mMpU43gNTEnAxXVKJhaiTPzA3yyNn36jw
 EL9U16bJygv2dF65W0GhEE7QaEuH4uCve9LM/PVSdFtxNv3JYL9WsXGjqTQDdHpjiogH
 IypVd1MC2KolqthUnfEsisITqYp4fayr3zh+IGu9KsrLuxyrVSjMEWktCc73d+/D6kP2
 uaxFuOwyGi0cJubD76lc5WqJaTSdVcadYns81bz5nxmPGyNO9HtinQEQliPpqJaShubY
 JWot0S++kqwT20Y3+U3xRQWob2I7lXeeiiCrabE0qhX8jWKr+Rey+Momm1BfIhIjepSN
 a1qg==
X-Gm-Message-State: AOAM531TaOuj7m9lakC85FLuQ1s0TJH7s2oOqllZACiArva8OnvU9Dfn
 blEOgg82KgxftLJsu64a0ho/NA+DF1nGBKv8GwuQMw==
X-Google-Smtp-Source: ABdhPJyBDb4uhlRaDXG+Zpkl6C7kJYBjtjnh6Guc6dX5VWv6CnJQWXXdXTZDf3aRdVAIipXX124Q3dhZ3v/69EtZqVg=
X-Received: by 2002:a0c:8148:: with SMTP id 66mr33766485qvc.55.1618328871536; 
 Tue, 13 Apr 2021 08:47:51 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 13 Apr 2021 08:47:40 -0700
Message-ID: <CAO=notxyM2Xu5e-iYKGHXEhgwWOb+CFmES8XjaBrx7JZcs+4sQ@mail.gmail.com>
Subject: RFC: Adding new system, quanta-q71l
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, peter.maydell@linaro.org,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=venture@google.com; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

HI;

My team is actively engaged now in producing Qemu support for new
devices and boards, and I previously worked on the quanta-q71l board
for OpenBmc.  I'm currently fixing up the configuration to build
again, and I'd like to introduce a board for it in Aspeed.  The
palmetto doesn't really represent it, there's only 128MiB of RAM for
it, for instance, and it has its own idiosyncrasies.

To introduce a new board to the Aspeed Qemu, do I also need to send
over a firmware for acceptance testing?

Thanks,
Patrick

