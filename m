Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B8A56ACA9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 22:26:16 +0200 (CEST)
Received: from localhost ([::1]:44232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Y4l-0002Vu-0P
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 16:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Y3P-0001kJ-BI
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 16:24:51 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:37503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Y3N-0001fH-LI
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 16:24:50 -0400
Received: by mail-yb1-xb33.google.com with SMTP id h132so3769689ybb.4
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 13:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P3CR8mXZKfbsUkfFgCqq+bgQLcXVfEGMQSjlAk4mpnc=;
 b=WxerRco3j+VrgXSUrPoJKOcVpTZspUnwgxU0HBmiWlH/F1saPi/5Jylvwvre6+HRkI
 s4GYo3PbTw23sZNGGGAtuT8CeEllOpxYJcGWEeqytyJg1SaQdDOhUxKwTXIS9BNFeyf9
 EhY3pDy4iglGDtFGJe0dqEEr3v/cbdZml+vPSyfVSJmoHgBZmsbhwyzaTwHbRwaNmJKg
 fP26QJF8/kPSvalJQnghOBaJBJcpEeTJW2xP3T5DDFjU9BekZzN9GD/jhpZ1veaanZ/v
 zGS2MIj4Xak3Qkb3Him4sm6AX2VNNPG2j+qsO4euYsv3B8K1WYlA++5kBBsR6CFPYZ9y
 IFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P3CR8mXZKfbsUkfFgCqq+bgQLcXVfEGMQSjlAk4mpnc=;
 b=xsqtT1zTZKpC8Bi3P4CEpOIu5mimqnW/YhFYrflwSoMD2QvTQmbZ/DkOE5ysI/tyxA
 5tclenGl3rb/p7ZSBUq8oV+LoOVAZt0j+3ibbJC6FPofFlBeBXL8TPyALsqOnzG2pkfv
 k9rnK2jyD6o+fWw9El5cI9Sd/Eo7jJXj8pBFgo+j0ZOURPsyjkaxalWwnkRRg8kGQfM2
 TZlCjFKJuWbCILGYkP722vWU1SGlE8Bnx6mjJ1Hn6h2e8fSsy2Ewk6vpvc0qm1mtAw2o
 g6kr3e6V5likyhFBSPFeSv093CiXY33tzduile7yDdsU5vMLEyNUvZSooBM/BOl8/D5t
 oy8w==
X-Gm-Message-State: AJIora9vNc58KHYlz8r01OGmXGOC+nM+FXjbEsZZqHWuTE+vyJGUiGrB
 J2fZPx4XfAWcKSoEMHfVoac3iaw23wKAfcq/w2vsyw==
X-Google-Smtp-Source: AGRyM1uVkDTOO699GAdlKVs5L2ZHFDgv4PFZp8uVyhtoI2JCmAssNL25jH7amBHjcG8PEde2W9KExuaTZ4KCWI3NqWc=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr50243572ybr.39.1657225488249; Thu, 07
 Jul 2022 13:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211015144640.198044-1-kwolf@redhat.com>
 <20211015144640.198044-15-kwolf@redhat.com>
 <CAFEAcA9jnySMWRD56FF9D7rXhwARiyvqJx+4Ys+smYa2ghdLBg@mail.gmail.com>
 <87wnctzdl9.fsf@pond.sub.org>
In-Reply-To: <87wnctzdl9.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jul 2022 21:24:09 +0100
Message-ID: <CAFEAcA_cYpt_FU5mD+X+BSmQq9e6u1n+nm8EVfdrPeVN0o3Spw@mail.gmail.com>
Subject: Re: [PULL 14/15] qdev: Base object creation on QDict rather than
 QemuOpts
To: Markus Armbruster <armbru@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 4 Jul 2022 at 05:50, Markus Armbruster <armbru@redhat.com> wrote:
> My initial (knee-jerk) reaction to breaking array properties: Faster,
> Pussycat! Kill! Kill!

In an ideal world, what would you replace them with?

thanks
-- PMM

