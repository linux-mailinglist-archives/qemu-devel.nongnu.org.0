Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6586132F270
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:24:53 +0100 (CET)
Received: from localhost ([::1]:45858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIF88-0002Ss-Ef
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEaQ-0006Ay-Hb
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:50:02 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEaO-0001GH-VC
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:50:02 -0500
Received: by mail-wr1-x430.google.com with SMTP id d11so3004605wrj.7
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=gDC2mEcPcr1090K3ud1g8KuXnI4KiLkqhQ+FmYxsjLw=;
 b=B0Em6dqEyAatK4HtSl+E/I4X8DpblU4BVBP9LbJrQP6fAjIyDS9cUQco1DdUafCJQ7
 XVcr6UHykvWS/iHss+n7bKQvdXigUY9hTlCkcNQrBX9DKY4EkiADhLl6XDeqR3pBr0Sc
 /7/PI1+YShLT5ytJO8oFlX37Xb8k5kSMcxWf4BHW+hgUceJg9rJLueoVKpF4XYzipf9r
 DG3FBl+MaVfqJgGQjRcbHiB9dUBJ5TiWjIguu8ZSnBI+ES+WsW3V7Erkri1Cu2R+otzs
 L0r41gXf3V+gA1SkPyUMRap1TqdIVnP/Bdq8qTzEljpRekHu7ye+kxSkRYXcQMpf7e2U
 dnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=gDC2mEcPcr1090K3ud1g8KuXnI4KiLkqhQ+FmYxsjLw=;
 b=UpbYCMBNjNTsbqQguVjJDMNJoj9sSHwfFBvpzNrHACi9+LLYkQuDa4P6jiinKgBMJx
 sRkcSfmd87bP2d2EvyLlBiQLvwJB4OojcijwUoxOIP3Q0itZeXgQgdRvtnmQS/+LfNgK
 5jj5YCgXi7PMs0FxfP0nEjt1y9Vvl3rkYb4jlB4+3G7qvOflZ+ZeLLuYnHgjDkUfbeQG
 lb0+b7Pp1YdcqT8R6R9idLfmnpRR+5xVsNv4w6mB/j0nwT0lFCtzJyfSK+IXiFiPColq
 4akORnvUGatqZsP32NdTzDc7yXJbQ/BidmAHB2HyM8j6P4SzNlOrupSpFaSTR3XA1fZR
 LNpA==
X-Gm-Message-State: AOAM532Y4cACCuSoRlqW3sZiVG6KbqxXbl5fwn8Jyww6DVLPUE+pQ2lZ
 3K5jLVr/VAhpRpvtmmQDntx6Rg==
X-Google-Smtp-Source: ABdhPJxXeo7z4771NU3++6QutgKBhV8THZ/ZpzEwRnZIYm+kUQrx/X68oV9hhcTaOTSp9YnawDqqyw==
X-Received: by 2002:a5d:6cab:: with SMTP id a11mr10579527wra.419.1614966599526; 
 Fri, 05 Mar 2021 09:49:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u4sm5705316wrm.24.2021.03.05.09.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:49:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A4DCF1FF7E;
 Fri,  5 Mar 2021 17:49:57 +0000 (GMT)
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
 <20210302175741.1079851-6-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 05/27] tcg: Split out tcg_raise_tb_overflow
Date: Fri, 05 Mar 2021 17:49:52 +0000
In-reply-to: <20210302175741.1079851-6-richard.henderson@linaro.org>
Message-ID: <87im65ebi2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Allow other places in tcg to restart with a smaller tb.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

