Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3782227407B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 13:10:42 +0200 (CEST)
Received: from localhost ([::1]:34412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKgC1-0005nn-8Q
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 07:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kKg1X-0004VO-Dc
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 06:59:51 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kKg1V-0002QB-Sa
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 06:59:51 -0400
Received: by mail-wm1-x341.google.com with SMTP id v12so1046538wmh.3
 for <qemu-devel@nongnu.org>; Tue, 22 Sep 2020 03:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=6TnwgfQhpcO4OWA9QREr12A7iMkx5skuSv2pNkPOaGE=;
 b=M+7mvfGHJeE4C41MNfNLr2NMiU99/DjNmWvsrnbAt6lPS5CgtJfO7rrx0M7oPt5BG0
 2OoYQ/lsKeYDGFR+RxOZIJdA3+SqfRJBVWLQ7XunTbznYuVhEZifgYOJYVDbtL1iEkwH
 zLQ0cr51dt/+XZyLFICauVBa5n9m7MlFSwKAR+o8CTskXIL3ACoyzoeoLhhXmjtPRQWw
 8PAHA9DthYwmjYpdfidU1Ne7aFvoXZFFng9zKB9AeOQ6zcCUwHNfdl8uM825Bx55XaB/
 oz4ueFFA55/itqPBwDpafa7utOOCPqowi7mJa9HVzEZsAMA5zEk0T9HkfWnAJsCB7ixh
 lCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=6TnwgfQhpcO4OWA9QREr12A7iMkx5skuSv2pNkPOaGE=;
 b=Jn0HR6dXlQUfGuDCGdtI7wUzEf75foF/XSHlHnB0UihvpZIcBH/vG0v3SubZ6OVAxz
 4BQp3dx9DDm8qzvuW8uKetFqGvMmV4VJkE2ZpHZrQwnZiZyK5XqKUUW2g/EEVA2DtLc1
 312fNX35U7pwF8MNjzbKjToVSUmz7kB1FUBIe0YHPxQ6YR5z6s/szR1G/VoCHYkiUrSF
 p+v6hTwiQRCyEYMbX/oXZ2+VBfrU+RqR1XcYUbURExUTWGg6JuvTymBARgbv/kOKzxwb
 KbhXqcqJ6ak7d0H2F5Kunhl1RmXglzKez/U22dSuVqViS/gXjomJOYcVRZFhsJtc+PXl
 WVmA==
X-Gm-Message-State: AOAM531U+guq2KxioNlxD/4bd69JjzoddzENXXp366yNLp2QZpyR3ySE
 0GuCEwcUshjn+gzsXndCzhw1GQ==
X-Google-Smtp-Source: ABdhPJwJIxBZbQAMvbxhz1CtzXkAnAPbvaaFY2cUso5rlRib0+ELwXD/Q1yOux5k/RbnMtp0sWcalQ==
X-Received: by 2002:a05:600c:221a:: with SMTP id
 z26mr372939wml.131.1600772388353; 
 Tue, 22 Sep 2020 03:59:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k12sm25866655wrn.39.2020.09.22.03.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 03:59:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 937E31FF7E;
 Tue, 22 Sep 2020 11:59:46 +0100 (BST)
References: <20200921174118.39352-1-richard.henderson@linaro.org>
 <20200921174118.39352-12-richard.henderson@linaro.org>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 11/11] disas/capstone: Add skipdata hook for s390x
In-reply-to: <20200921174118.39352-12-richard.henderson@linaro.org>
Date: Tue, 22 Sep 2020 11:59:46 +0100
Message-ID: <87mu1im5zx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> It is always possible to tell the length of an insn, even if the
> actual insn is unknown.  Skip the correct number of bytes, so that
> we stay in sync with the instruction stream.
>
> Acked-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

