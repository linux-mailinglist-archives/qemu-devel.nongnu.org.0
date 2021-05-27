Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A40393063
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:03:44 +0200 (CEST)
Received: from localhost ([::1]:39850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmGbv-0000od-Cd
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmGZb-0007Wo-GN
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:01:19 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmGZX-0006jF-4G
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:01:19 -0400
Received: by mail-wr1-x42c.google.com with SMTP id j14so4870808wrq.5
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 07:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Cr/A6ZqtjGfm5+0Z8Ta2bpQ9xb1tlcVNRdKU53wVMFs=;
 b=eQKioEI6U0UI0NOutgoSHnzKiRWnKA7FcScMB8GKhvdu4XjSDMcfoPDUKpAMj39MLC
 K9lSZFR2W2bAC7O6IGH5p2GICtMqFmDw14rQ2lDPaAQJkTfxv/Ffoa7WtLfsUnOlX6Yf
 HX5dXB8y3wM18V9bw/3v1n65Jn0n3KbbrSDSWF1w5aUxyhDVOjjJ3A5wfOozc38QSfw6
 R5CdWs7vuCY64XicS5tnyhftW4+oNe9hq+2fqWQvw2fsPqLFS/MkrvBTTois6fpdeS0V
 uXTNgBQqcaqEMyIPthoBLAOltFyS65LXK+p5mZm+C+7L6xol+bKP355NkW0DcgpKstdy
 5Z+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Cr/A6ZqtjGfm5+0Z8Ta2bpQ9xb1tlcVNRdKU53wVMFs=;
 b=DCJeCQRrJF5vBBUsv6APP5bz+C9D9fClWNjwpbNAPUbvJJ+aCMWUWON7qNIJHg64fe
 KkER6iDFKXwR2TvgWd+6/UiYxXuKxwpAcuR1+7EL13kt2lP1KF1+epIQzYGSWqsR1j8C
 jcpxmZJR3KBU6ZvoMVan7FFF71wUtae08y9cu+dYy+cKxMAoXvPydS9KOErhcjVEmd6g
 Os1XsDEYRf+4J97X0RrXKlyMO59rLLHLo2msrhBBg7evdsNoINDrFa6ZOkrfIpdi8D60
 bmm7KOxMOL617Qp1boNHOhduiPI3dr0y5Gr/B3AJKKpeHmqqF1Fe1f+1LmAz8rb2ifgp
 0VkQ==
X-Gm-Message-State: AOAM532mmVw31BagN80xs8r1i4qKRjrU8WKTHmIOlngns8x9B9if/V95
 3LpSk4BuSp6IX2CUADJH50aDRQ==
X-Google-Smtp-Source: ABdhPJy+wi9ZAvCEPVYhC6/g8Ed5Lg1tCakgBDib+x0nN3o7sGLTzjVL0Zn7tsbIJkORw8ZzliCNNA==
X-Received: by 2002:adf:bc07:: with SMTP id s7mr686532wrg.301.1622124072230;
 Thu, 27 May 2021 07:01:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 60sm3302861wrq.14.2021.05.27.07.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 07:01:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7DC8A1FF7E;
 Thu, 27 May 2021 15:01:10 +0100 (BST)
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 0/5] stop collection of instruction usage statistics
Date: Thu, 27 May 2021 14:57:51 +0100
In-reply-to: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
Message-ID: <87v9741djt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 lucas.araujo@eldorado.org.br, qemu-devel@nongnu.org,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> writes:

> Based-on: <20210525115355.8254-1-bruno.larsen@eldorado.org.br>
>
> The functionality of counting how many instructions were being executed a=
nd
> being able to show it through the monitor, although neat, was only
> supported by ppc, and now that it is migrating to use decodetree (at
> least partially), those statistics won't be used anymore. Therefore,
> this patch removes that functinality completely.

I have no particular comment to make about the PPC stuff but with the
common translator loop we have hooks across all converted front ends to
identify the start of each instruction. It's needed for the TCG plugin
instrumentation and we could in theory use it for more integrated stats
across the board.

Out of interest what was the main aim of this code - a view of total
executed instructions or something more detailed like a breakdown of
types and ops?

>
> This series was suggested by Richard Henderson
>
> Bruno Larsen (billionai) (5):
>   target/ppc: fixed GEN_OPCODE behavior when PPC_DUMP_CPU is set
>   target/ppc: remove ppc_cpu_dump_statistics
>   target/ppc: removed mentions to DO_PPC_STATISTICS
>   monitor: removed cpustats command
>   hw/core/cpu: removed cpu_dump_statistics function
>
>  hmp-commands-info.hx   | 13 --------
>  hw/core/cpu.c          |  9 ------
>  include/hw/core/cpu.h  | 12 --------
>  monitor/misc.c         | 11 -------
>  target/ppc/cpu.h       |  1 -
>  target/ppc/cpu_init.c  |  3 --
>  target/ppc/translate.c | 69 +++---------------------------------------
>  7 files changed, 5 insertions(+), 113 deletions(-)


--=20
Alex Benn=C3=A9e

