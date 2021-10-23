Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE40438493
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 19:50:01 +0200 (CEST)
Received: from localhost ([::1]:49490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meL9c-0005en-9e
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 13:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1meL78-0004ij-72
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 13:47:26 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1meL76-0004Fq-5I
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 13:47:25 -0400
Received: by mail-wr1-x435.google.com with SMTP id d13so1587726wrf.11
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 10:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=x3nJx3i/ymRaIWbAmzYiDl5l+/PUnvso+x4f//vgvyE=;
 b=arl96Tl8cBVBWh1L+s3/wpFgY2dgZG+CBSY8mfYYwBzykp3sbeSUCGzMuL6oPIzAW6
 t73k2bGZOpbw4dnJFxNuK6vzbkZ9ik79Vo1lRJz1WMc79Y/FbtYQ83qapxH46mv8CuWH
 5P9MPBpC4OIlCboI4ugHG6YZJyRUttwp71h6N8HUd5FvbfiG8XaojbAL+UZAuGVMdX0a
 lvFfX7EPz8EfV4Nso/Xv2XW63wR2wOp1DZwK0hkKuYk7JrE1dVxqmY6iTYfHQipRDEU7
 aKIOXM+QqblTDBzGtlFV0yqDA824wmoN/M8AD6IB3zwZ8JI8cnb0vygKUP5jjykbVWqV
 CcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=x3nJx3i/ymRaIWbAmzYiDl5l+/PUnvso+x4f//vgvyE=;
 b=vQXdyGhswrthYetbMECiYUiyyt6guHdz13ho/IPb4rR31UYbWhYsslhX475xQCdyXj
 UfIW11OxpuU1Qb51i9PFG/ptycd6OKBHh67osewypSBmk2nzm/HiEmkMOjVIj1c6HAYW
 1j96N1NMLjNWpAzNi8bxpEcc74RFifsmmtC6VpdruSZ75ayNhJq3jFIy2cQC5c3mZoHS
 ENUItf/+bkNPtJccVP/xCaSSNUt0yXAXQ35EznbG0zs3gjUEVa5X4W2avfh/5DhZQv7j
 hFhjlRJJ4Yx8psl67Kb8RzIW7FTvKWrq1fjCv2EOvxNJ6F/DtDrNUWjiVz/5FNVXoPD7
 Bp0w==
X-Gm-Message-State: AOAM532xiUIEEXSFsAf7RWBFFWl2HUYgcYsl87FSYk1js2L8/XwoNLaq
 Yh1TYQoPuNjJHHgN8ubJTy4ycQ==
X-Google-Smtp-Source: ABdhPJxiZ8aDh8jYYKCANU2fAsNXuCwPzZCtt6V2Mlwsc4iFbGDr8sxjzsNLp8OswUWbEB+kRdqpMA==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr9493640wrs.84.1635011241285;
 Sat, 23 Oct 2021 10:47:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f10sm12545858wri.84.2021.10.23.10.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 10:47:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1AA651FF96;
 Sat, 23 Oct 2021 18:47:19 +0100 (BST)
References: <20211023164329.328137-1-f4bug@amsat.org>
User-agent: mu4e 1.7.3; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] tests/tcg: Fix some targets default cross compiler path
Date: Sat, 23 Oct 2021 18:47:12 +0100
In-reply-to: <20211023164329.328137-1-f4bug@amsat.org>
Message-ID: <875ytnd461.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> We do not want a shell command substitution, but a parameter
> substitution (with assignment). Replace $() -> ${}, otherwise
> the expanded command return an empty string and the $cross_cc
> variable is not set.

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

