Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB599397479
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 15:39:44 +0200 (CEST)
Received: from localhost ([::1]:32842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo4cR-0005iV-OY
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 09:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lo4Vi-000353-Hh
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:32:46 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lo4Vb-0003v4-Ar
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:32:46 -0400
Received: by mail-wr1-x42a.google.com with SMTP id c5so3172226wrq.9
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 06:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jVHGwZV9tUn5TYMiH2Iw7LjRsjNZ9Xy06FGVeXptkPA=;
 b=qFGuVwQVShwKQTi8+hZXp8bLNS106F7PLHEHOeXsYv95z1XtDaKB/18jdiskqFGMHO
 bIYHemlkGSRmnHvdPmMWwsvH0T1j3kSfwQP9C8yAwXu2mq5M9QG9zvaTnVGECERxV4m9
 K6a5vd9b69lSkkPFxTdBZWkk3hSUcsN3ExGIi6D9C3Ksu9CCGynmuW/eUS9Re/2omzYI
 w/ijlYiI9DYMDeBNgW3W+bpGW0jUAIERF8/C0JAMM8FOyxAtD1MFCrJb+9YHwW644XuD
 Vwq/a63vp8OkOo8v9WbDZQTCGoKLyydYtXG7w5Dm9pb8pXKsMEnEMmstfACqjt+3EBeS
 6BJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jVHGwZV9tUn5TYMiH2Iw7LjRsjNZ9Xy06FGVeXptkPA=;
 b=Nsjk8vPZVk02WlpQoVcMfPJ8MEPjrUttlzkS4Kv1fm1cLKowKWQzByH30gIs5vdKTv
 WGnLZPNP40tjlgxf3yTDOM47nFKE/jj0wOMlVzzPpB4IhAY0ua7z9wPAKYFgmlAk4Qhf
 yPrwQSBnPGp52DHBFTMrCOe7ymfva813kr7u4Xww64eoVD3df5i83OioDpXZRMT0tycL
 0/q4yK9cIf/LlNTa5MIG7bqCwekoAngmk84GcOM3xcHy0MJs4IDm77CF+FsrSXqu1a/1
 0zyWWR/ZRNQMyRvlic6e3vZ5n1JbBKZiHSPYyZ9FURSb6Vxw5ST8TMjVgBdvv2lmj3Nl
 bYVA==
X-Gm-Message-State: AOAM530UIwYgq1NGLJvfuy7zza11VTfUAGTmoMrFnITHtwKi/4L1OBcG
 CxYpem/Hbc8miv2t/aI10uvhGA==
X-Google-Smtp-Source: ABdhPJytkikfF+e89/tA226ae0mvMfVr22icVQZAt5HUivyBFhivSSx/t3roZpsJuGngKrrnAfRF1g==
X-Received: by 2002:a5d:4dc2:: with SMTP id f2mr16654386wru.124.1622554357768; 
 Tue, 01 Jun 2021 06:32:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h6sm3301800wrt.6.2021.06.01.06.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 06:32:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 19B811FF7E;
 Tue,  1 Jun 2021 14:32:36 +0100 (BST)
References: <20210530063712.6832-1-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [RFC PATCH v2 0/3] Cache modelling TCG plugin
Date: Tue, 01 Jun 2021 14:30:31 +0100
In-reply-to: <20210530063712.6832-1-ma.mandourr@gmail.com>
Message-ID: <871r9ld823.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> In this RFC patch series, I propose an initial cache modelling TCG
> plugin. As of now, it models separate L1 data cache and L1 instruction
> cache. It supports three eviction policies: LRU, random, and FIFO. Once
> a policy is chosen, it's used for both instruction and data caches.
>
> v1 -> v2: Unlocked dmtx on early return in vcpu_mem_access & removed a
>           (probably?) bad InsnData free.
>           This is probably still problematic since it does not free the
>           ``idata`` allocated for the vcpu_mem_access callback even
>           once, but if it's placed, it would double-free it.
>           How do I mitigate this? I need to free the InsnData passed to
>           vcpu_mem_access only once if we find out that it's an IO
>           access since we do not need it anymore and it will early
>           return every time.

OK I've done my review, sorry I reviewed 1/3 from the previous series.
I've made some comments inline in those patches but I think this is an
excellent start to the project. I think we can get the core plugin
up-streamed fairly quickly and then spend some time examining better
integration and possibly enhancing the plugin API.

--=20
Alex Benn=C3=A9e

