Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222D521F241
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 15:16:39 +0200 (CEST)
Received: from localhost ([::1]:36046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvKnW-0008Oh-69
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 09:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jvKls-00070J-2R
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 09:14:56 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jvKlp-0005vu-Om
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 09:14:55 -0400
Received: by mail-wr1-x444.google.com with SMTP id b6so21517150wrs.11
 for <qemu-devel@nongnu.org>; Tue, 14 Jul 2020 06:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=76PmwpSiLGGc8xE3DMIELQ1jOAfg60DhOAxfHd9V1Fw=;
 b=Kpa256h0+LwCHqGJzjPuz4GeS2GfsUGP4zGStQ6ms0/REQWegVPAk0EFecWNGZgQ0K
 +BknYghABec8z9i7WRr66r/32kVyERHAhG8VKPDDD8wJvjCjuWsMsd2jxma1LPjsuBiR
 6zB7yco2XWUVwIwG8eqU/MWvBCR98nUvq7FGRAMHESEwKnHDemy8DhDwJCUMDQHDL9AX
 ML9UrtU1VtobCItkeU/qBwYd+KcI34UYgK4+/KVZhW+4UywVB/ameGvbbQEin4uSfThs
 PwiJ23mlA4FaBfy5mxkJF6Ht5cQhtFANws5M7vzHSPh2D76uvzdHe3Eb8etmUUIyKVh6
 dhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=76PmwpSiLGGc8xE3DMIELQ1jOAfg60DhOAxfHd9V1Fw=;
 b=V0T33LL5xpcEqyyt9IWou/zoYHgC2L6p/5yxRuO2+Y/SnwhJ8qt6dWCzynp0J18pGP
 PnZZGXmb//tiHQear8hwrhTixwLSMBYNHn6QBrBaSTMOi2pOfQaOu3CrhJ5UvmLwfwOY
 grsXobyO+QfggEDUCfzuylrUEY+17gd1zTnfq0er6FF6eVzmMagOyH7YdTuMxaWen7p9
 f4wsb9qqEMlNNh9En83S+fmoEGHg5/Vl8oYbQCluBvQjiqQzaDVBv2KWVF8ZRO4STFaW
 oJkUHaD2oD3SisnJtNCZYWHgj+W4gd8I8xbIGGe6qrsIaCvPsNobrnJyJSTZdxGP+aaL
 cpMg==
X-Gm-Message-State: AOAM530t/mefywd+7ucYSEmPwdoqGl7UXIayncN0YntV7EW9s2Xvz/Va
 SkKMpVu9PImBUaUJQrzwmQlB4g==
X-Google-Smtp-Source: ABdhPJzegQujOlhd1fa8cZjcW1IsG+7AozNfczhjF99PaIKbRSX97DKwEIpHlnOK8NqWNvwdNGZPFg==
X-Received: by 2002:adf:e48f:: with SMTP id i15mr5089091wrm.327.1594732490876; 
 Tue, 14 Jul 2020 06:14:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p25sm4143156wmg.39.2020.07.14.06.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 06:14:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1D1221FF7E;
 Tue, 14 Jul 2020 14:14:49 +0100 (BST)
References: <20200713175746.5936-1-peter.maydell@linaro.org>
 <20200713175746.5936-2-peter.maydell@linaro.org>
User-agent: mu4e 1.5.4; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-5.1 1/4] docs/system: Briefly document canon-a1100
 board
In-reply-to: <20200713175746.5936-2-peter.maydell@linaro.org>
Date: Tue, 14 Jul 2020 14:14:49 +0100
Message-ID: <87a702z19y.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Add skeletal documentation of the canon-a1100 board.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

