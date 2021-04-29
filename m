Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2CE36E467
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 07:14:07 +0200 (CEST)
Received: from localhost ([::1]:39000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbz03-0006cW-1g
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 01:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbyzE-0006Ct-V5
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 01:13:16 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:37870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbyzD-0004Og-EQ
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 01:13:16 -0400
Received: by mail-ot1-f47.google.com with SMTP id
 c8-20020a9d78480000b0290289e9d1b7bcso46355041otm.4
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 22:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j6nPWvSJjL6HOsJpDQZq+tyjjgIwPPtybrxTojkBzM0=;
 b=WRlbENidYK4f0Fi2XYos/QxMVC8L2/H2PyCWwGQV2dSh/ZG6yKPdmEy4WLjUaU2g2/
 4U2iWfG2qm9NJ7Rjt4H4QS5gpiidjd9Df6ZvP1Ed6JKT58xkGj9S12/prN2uG/0QWuWn
 HfZMJcVjbMXcHxuqp7daeyk/mn8lcggPFltp4K5cM8XoYTBkywfSl7VAd+fPhmP492AX
 ItxVJ6SUlxnPdodaDSMjWU5GzOqeB7cDb/W32kDy++ZbA9wgcTdEE3UX+wV+3mHgdGxo
 dYI6Qb4Ti48CCjWwHOUFe5WT4lvELOZDr4J+M78KnTCLQqC4zI09unP58nfwcbeveKGT
 2ycw==
X-Gm-Message-State: AOAM5311Gedpk/ouQ69GiJWKDtdV8lpdTBd0umcEmzvnKeZU0VMxbK4s
 El7e4wr0l60pO6+8cj0ksjIaUS6KAdPcveQ6rTw=
X-Google-Smtp-Source: ABdhPJzZ+f8gPI/Vk3rM7oJTwSzjkpLAon26pIrHlVZ2lYms6StiFn2bJ4RDmy4R8UgF7cvalO2TG6Ze0e9yEXPh18I=
X-Received: by 2002:a9d:6212:: with SMTP id g18mr19715504otj.371.1619673194307; 
 Wed, 28 Apr 2021 22:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <1619667142-29636-1-git-send-email-tsimpson@quicinc.com>
 <204e8759-7fda-4e2c-6f30-466272432c78@amsat.org>
In-Reply-To: <204e8759-7fda-4e2c-6f30-466272432c78@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 29 Apr 2021 07:13:02 +0200
Message-ID: <CAAdtpL4vPJhj3+S0Jmae++LQ7ZqG+XC_oUuct-uG3xEfvo42Yw@mail.gmail.com>
Subject: Re: [PATCH] Hexagon (target/hexagon) remove unused functions
To: Taylor Simpson <tsimpson@quicinc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.47;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f47.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Alessandro Di Federico <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 29, 2021 at 6:49 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Hi Taylor,
>
> On 4/29/21 5:32 AM, Taylor Simpson wrote:
> > Remove gen_read_reg and gen_set_byte
> >
> > Reported-by: Richard Henderson <richard.henderson@linaro.org>
> > Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> > ---
>
> To help git-tools (and reviewers), please use the 'Based-on' tag
> the next time you send a patch depending on another one:
> Based-on: <1617930474-31979-1-git-send-email-tsimpson@quicinc.com>

Sorry I forgot to link the explanation:
https://wiki.qemu.org/Contribute/SubmitAPatch#Base_patches_against_current_=
git_master

>
> >  target/hexagon/genptr.c | 11 -----------
> >  1 file changed, 11 deletions(-)

