Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A5C3DF1DB
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 17:55:29 +0200 (CEST)
Received: from localhost ([::1]:35182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAwlM-0002NG-I7
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 11:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAwkT-0001eb-Nk
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:54:33 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:52998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAwkR-00057l-1U
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:54:33 -0400
Received: by mail-wm1-x32e.google.com with SMTP id n11so12769377wmd.2
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 08:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=nQ7IdDiN71F8+zMWMsO0Z2qztXiy6p932C4DYkvwXdY=;
 b=jy6ynOYDyIZdd/MeU5NwT09mn48d/y/8Q+W9ntXtBoUSQQQJC4wxTqjYRsvquar5Ve
 Yj0KV22jvkucqnQ9i20HNtUylPGGDdssh52BAWUq+JwOzHL7ZkWTg2w0ajVMqHviufB+
 oh4Dz9T541npie1qF1B3A+mYMPRPBFvWx25XghAQN/wzaOaYsPkdnenyVRVW0Jds/nmZ
 +31lRQ7oxxQ9twO47JLTf+v4DYscIHWarHF6uM8UnN7zvDUQWW32pW3Sx9ef6g3vnVqp
 bnY+dZ3XW5UeEjk+LMc9suogr97r1L84iBA3mP5m1JDtZz2ulDmKLfk63/m0amui2zbe
 B/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=nQ7IdDiN71F8+zMWMsO0Z2qztXiy6p932C4DYkvwXdY=;
 b=awPEUXSYP71zAbrno5opGwteL7J4++hg9iksgA1Mr9QVlKznTmGwI31EuZGaylbE1g
 NhdyIjy6NqF4NJgQg6xAjCDvkSxBEnrUaUlMCAvJoHnSucaGfoj3+RsLUB32tk9VEq6n
 Xq67y5z5wYNs41A84FT3/c8mBJ4rRQKY4pMCBP0XnHD3fH9ErcjClfh9vdePAZkHDnvj
 xQ5iuxNcaup9LKa+8K+dvNxx4B8QnnazuiGN2y07Af0V8hICMJGpXdOhunnzzHRSEEl6
 uU4cXo8FVlWjJrx62Fq/p2+FQJMIAD9GQVc4JNGCf6DXcyhsz+ACOgdSS+Rv4GuMlTLc
 7XCA==
X-Gm-Message-State: AOAM530uIBO+V6UR7fo5erj+0h7fgU2GLa+KL694WSgfwnvb+BgtTw5w
 ZP8+m3h2XgaoQ6ByhtVbSHT/Ww==
X-Google-Smtp-Source: ABdhPJy52hoVZAOb47o/t6J6C8t7R0dDNez5kSDwq8y9GFtMD8A2Mc/Si6JnMKT7SPshP8PaLYPucg==
X-Received: by 2002:a05:600c:228e:: with SMTP id
 14mr6213278wmf.141.1628006069557; 
 Tue, 03 Aug 2021 08:54:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l4sm8256508wrw.32.2021.08.03.08.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 08:54:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3299E1FF96;
 Tue,  3 Aug 2021 16:54:28 +0100 (BST)
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-21-richard.henderson@linaro.org>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 20/55] accel/tcg: Report unaligned atomics for user-only
Date: Tue, 03 Aug 2021 16:54:00 +0100
In-reply-to: <20210803041443.55452-21-richard.henderson@linaro.org>
Message-ID: <87lf5ifrrf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Use the newly exposed cpu_unaligned_access for atomic_mmu_lookup,
> which has access to complete alignment info from the TCGMemOpIdx arg.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

<snip>
> -    void *ret =3D g2h(env_cpu(env), addr);
> +
> +    ret =3D g2h(env_cpu(env), addr);
>      set_helper_retaddr(retaddr);
>      return ret;
>  }


--=20
Alex Benn=C3=A9e

