Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C4A1DE908
	for <lists+qemu-devel@lfdr.de>; Fri, 22 May 2020 16:33:22 +0200 (CEST)
Received: from localhost ([::1]:44886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jc8jh-0008ON-I4
	for lists+qemu-devel@lfdr.de; Fri, 22 May 2020 10:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jc8iT-0006kZ-NV
 for qemu-devel@nongnu.org; Fri, 22 May 2020 10:32:05 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:37749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jc8iS-0001qc-LF
 for qemu-devel@nongnu.org; Fri, 22 May 2020 10:32:05 -0400
Received: by mail-ot1-x344.google.com with SMTP id x22so8380073otq.4
 for <qemu-devel@nongnu.org>; Fri, 22 May 2020 07:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Os3q5btY6LuVi+A8WytGUb1KrFMmt4muWaugIPZFic=;
 b=SS1aMVKYvF1mJJIOqI+/TLgN19vqtK+ofoBLs7HGoyHWPK6vnD91MZCuFFSzEyszvv
 4wHsFz3uymv04rRzGfC4oCi0+q1b+UwRaz9G3D41pniQVVq8wuGY3NC3Ta4IpwUFncmH
 fHk44QmT0wYYxpoxZ3bqjfCCtA1F6+izvC57QbFo49c7hMKCgF5w9GhE3/K1qtUmVPnr
 dIoc7Ahj2OhRkujUkn3tkiNDQgoAszERqoOqTvTKAgklxD11sR6RAaEev/7d7BRj5eIJ
 kugpP60XqgEAvw4cPd34eDrhwn9l8Kqqzi/3TdaXGnZweZmd+n2qQ6h8rWmRzxKCCGu+
 BGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Os3q5btY6LuVi+A8WytGUb1KrFMmt4muWaugIPZFic=;
 b=pNayBzeZdoW8Zur8H/pav6qL9LpztNu09wxa7rSSfJx24Dqz53NVOsoVBQN9xwagLN
 ZA/jyOcr5A961o4zUrzF1zZ+fGk8trFOEAHBYtPhgYrMdfXkT9hy+ASflLo3l7QHVIbn
 Zy+Qun25zez/Lenvw2mKZ2Ki5vqgjOBzwR88EArQt0+dcoVoyOTNK+DwO6OyqQ1Mu0bA
 3+J3w5fZFqh7chyrrUUBv6cNC/uvg1rTO0QyNk9rQJRlXwWOAJo3o7GYfOqh4zDl86gO
 +r00tbuqTZ1ABUJivY9gtUZDJmDfEVVeJOyGCSl8CdTKjETMqr/biwihRM0aQMQq//5A
 UjCA==
X-Gm-Message-State: AOAM531bY4uvtQoZ567Rifhglw7dJrjkRIeCuQZ5CNYpPfaseJJep5HL
 uKhhTL2AOFUdzonu5aKQx4PKqeM+dP470TeEr/ptEvuu
X-Google-Smtp-Source: ABdhPJyib7sreLGH1T8/fDV6R7rdHQMeiZNx5cdcH6RHvyUeGd+Us4uSv0pJLDHGXMYNNaYlone733FozwM9Ro9rWw4=
X-Received: by 2002:a05:6830:158b:: with SMTP id
 i11mr11464006otr.135.1590157923388; 
 Fri, 22 May 2020 07:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200515142056.21346-1-peter.maydell@linaro.org>
 <20200515142056.21346-11-peter.maydell@linaro.org>
 <96522b6c-8d33-51b4-cbdb-e8973f6487b5@linaro.org>
In-Reply-To: <96522b6c-8d33-51b4-cbdb-e8973f6487b5@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 May 2020 15:31:52 +0100
Message-ID: <CAFEAcA_bpUD0aK4kxpeRofGX2swKBU6OgZhVBvUAhmcnUOH=iQ@mail.gmail.com>
Subject: Re: [PATCH 10/10] target/arm: Convert Neon one-register-and-immediate
 insns to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 16 May 2020 at 03:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
> I wonder if it's worth repeating VORR/VBIC so many times.
> You can just as well do the (cmode & 1) && cmode < 12 check in the trans_ function.

OK; at that point we might as well just have a single
Vimm_1r pattern and distinguish VORR/VBIC/VMOV in the
trans function, rather than having three trans functions
which are all doing decode on cmode/op anyway.

thanks
-- PMM

