Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD0C406CEC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 15:33:10 +0200 (CEST)
Received: from localhost ([::1]:51062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOgeS-00009M-Lv
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 09:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mOgdb-0007wN-P2
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:32:15 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:42762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mOgdY-000838-S5
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:32:15 -0400
Received: by mail-qt1-x830.google.com with SMTP id w17so1379610qta.9
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 06:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IhFy1vVa1iRLlyUQXEFqfDX5t0aNVyqMeD1eYbI+ng0=;
 b=S4cMMCoZjuC/F8xOwmGfDAUKy2wpRWnVccUn4b2qUWnZx7ESMLlBzpXf7FIYP83r5g
 X76+7YN6/jzeU8/L0XbmFQ0i9WXiOMP40+po78j3jlmmA5JqlOPkrPYowtphSOTMs13J
 KiFssZIl4hIgdQz8MYZG4qaaDzOVsQTbLVYXBsAY8OVr1CfoC4mrB9WoRFAtr8b1+9DU
 wcE8tREVqng2TKenqmaYuAT9KIMW3KHPZRQZQUCXf06zXrpzbu/deSU18pxajo+SVUjk
 vt7N15uPajp/ELOVW5V4EMQTTH5B0ekq0pHTSK/l4Ke9+kyetp1ukeOBkE0SO+7CetGw
 jbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IhFy1vVa1iRLlyUQXEFqfDX5t0aNVyqMeD1eYbI+ng0=;
 b=CGxQ1x1upSOMLhKYh3/8tCIvgXM4+GF3VlXkqqY/qCb9cU2KkRwhgUZWG/8Zm9GKKw
 xqecxSMgsZlxGWjGK9LKoqST4/yCF01e9CH7wFzDf9fmH6WEoUXu9NQdl+NjhWacp6tm
 utVf9PURN4NsbKLEQEcV0jiOwbnD1PUWcWA6bSnIi3ra7wtZVab4PhV1hRqS9ei0J+vd
 TVpj2fNV1gid2RGmf9qqplhfw5eRLJWQ+OfWfVp8F0WZj1dV0YAk6aG/tetLhszAYhhF
 LlL3SV9UmMndJJWj2YE88vfzUADMsfcZWjum85dLUaSuVcvk0SpI0dpeEPp+tVVszxyt
 0fmA==
X-Gm-Message-State: AOAM5319irls4RmYJQHYOT3rmqrj1demqQGmGE8msH7OWJekPTN4WWUq
 o2xZuxsWsK+xdJrBj64zbXxQ8A==
X-Google-Smtp-Source: ABdhPJwYOfZlh9PYT3NMVir1GOrKISeGg4hlz+mK0uHJn90Q1YdLXJ2tWx0D9v71+wIi1hV4HTi8Xw==
X-Received: by 2002:ac8:4454:: with SMTP id m20mr7822423qtn.64.1631280731291; 
 Fri, 10 Sep 2021 06:32:11 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.gmail.com with ESMTPSA id l22sm3075029qtk.80.2021.09.10.06.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 06:32:11 -0700 (PDT)
Message-ID: <e8ccd74e89ba9d30d8588f0aa6966dc71d0ae923.camel@linaro.org>
Subject: Re: SMMU Stage 2 translation in QEMU
From: shashi.mallela@linaro.org
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Sep 2021 09:32:09 -0400
In-Reply-To: <CAFEAcA8=7-hHEHyABS-FFPtacYvhFpwa7_PLVsC7-x_5rxjicg@mail.gmail.com>
References: <bac0b38fc7c5f7a5a1c91784eb7236de39b6f18a.camel@linaro.org>
 <CAFEAcA-k8=M5KQWoJ=yurAZuHt9=F9mb002Z=7T_EC6x5EP95w@mail.gmail.com>
 <909bcf70ba8d88d485ec0b36371633e54edef81c.camel@linaro.org>
 <CAFEAcA8=7-hHEHyABS-FFPtacYvhFpwa7_PLVsC7-x_5rxjicg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x830.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eric Auger <eric.auger@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So that would be the driver code running in guest OS because i see
tables being setup by arm-smmu driver code in linux,which is similar to
what happens with ITS(table base addresses programmed in registers by
linux driver).

On Fri, 2021-09-10 at 13:54 +0100, Peter Maydell wrote:
> On Fri, 10 Sept 2021 at 13:39, <shashi.mallela@linaro.org> wrote:
> > I am referring to the latter,"purely emulated QEMU with an emulated
> > SMMU that handles accesses to emulated devices"
> 
> In that case, the stage 2 tables are set up by the guest
> code (running at emulated EL2), just as they would be if
> it were running on real hardware.
> 
> -- PMM


