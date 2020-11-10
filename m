Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA9F2ACA5A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 02:23:32 +0100 (CET)
Received: from localhost ([::1]:51136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcINf-0003kB-GI
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 20:23:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kcIMB-0003Iw-27
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 20:21:59 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:40841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kcIM9-00085F-5l
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 20:21:58 -0500
Received: by mail-lj1-x233.google.com with SMTP id x9so324598ljc.7
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 17:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wxwpX7sy/+Wt7in8tob/pjnG8tum+T/MDfLSgHqayEE=;
 b=Q4c1WbPJjr6sftqaZ6O33L74yF+q2QWZ6d6wmrQ/SbAoaag51QMWhqn3cXORkjabLb
 1HmG6L5nY/erCpphKvsZsHb4cE5YCZuOL95ot9T1WIam8Zjnoq/JTIGsRParIv7hHXp4
 XQrdbQkbtdf10xABrKbndJBw5gO4IkilwiwqKq0LAQ9BcdGdsHTR48qnS7Gq8zdlQDB3
 bi7RbO2LmJWyxjKEq0kxA7W6nrGhH/sA0eeAEd/OCALZ23/KZE4NOV4brtvZYu7UmOuN
 rMTEctM8o3r47lBWR0/gb/GEUXaGd3lEuKXA9vOS/eP+yo005MObsl9dn5MGHsH8NgDq
 tkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wxwpX7sy/+Wt7in8tob/pjnG8tum+T/MDfLSgHqayEE=;
 b=t0SqQre0GhbswY0seAWqp7cgm69e3MU8HMYeHyBYdl4SGk80Q6QTECPoflDqTpk+Lj
 3a6oUMaesoT7NtnLeLerTW5Z46YDfrOiM/8KezmARHhqe7BRwJEmoA4gaMQ//zwyiRAJ
 XLJKc6L9gE3GdkKrP55L1TPcibkgXq0UvN0mIyFTmCvuQByZgbjFHk2JSRsFO5NS1+kO
 R7M0yX+fxEj3QCE2Y37L3H8tePqJisU0ZJDyv3d+xbOxG0Nlx/jpP4dV/97lph7Mqnfg
 6le4E6mTApULqa+/2qaiFyoOsmh22PuAq4AX1w5R3He/dTlOKxXsizvT8wlzkfISmlIa
 o/DA==
X-Gm-Message-State: AOAM530BzUapmqIgLk7NFB4puJUKQNzaBt73oDourr35M8ixQog4r9jn
 0DXOGdQKtKAMvNYiPx5Mv1praDqSZG7Lhmdzigo=
X-Google-Smtp-Source: ABdhPJw0/TehYUQs8xkGS9QWndT6itYbVoZS+7B36GSpUROTRZ9gQlyxLsAsb6asaBF02uktViGOD6kijLLpzvD6M60=
X-Received: by 2002:a2e:9a0c:: with SMTP id o12mr6901337lji.104.1604971314678; 
 Mon, 09 Nov 2020 17:21:54 -0800 (PST)
MIME-Version: 1.0
References: <20201109090422.2445166-1-f4bug@amsat.org>
 <ffdaefd0-b887-5116-628e-5a303aa2389f@linaro.org>
In-Reply-To: <ffdaefd0-b887-5116-628e-5a303aa2389f@linaro.org>
From: chen huacai <zltjiangshi@gmail.com>
Date: Tue, 10 Nov 2020 09:21:43 +0800
Message-ID: <CABDp7VrHETF1bmjfLD8M8hnBvQ5o2hVHokiOyiCCvzh-vzvg0w@mail.gmail.com>
Subject: Re: [PATCH-for-6.0 0/2] target/mips: CP0 housekeeping patches for Nov
 2020
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=zltjiangshi@gmail.com; helo=mail-lj1-x233.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-level <qemu-devel@nongnu.org>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Huacai Chen <chenhc@lemote.com>

On Tue, Nov 10, 2020 at 1:37 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/9/20 1:04 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Based-on: <20201108234234.2389789-1-f4bug@amsat.org>
> >
> > Philippe Mathieu-Daud=C3=A9 (2):
> >   target/mips: Replace magic values by CP0PM_MASK or
> >     TARGET_PAGE_BITS_MIN
> >   target/mips: Do not include CP0 helpers in user-mode emulation
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> r~
>


--=20
Huacai Chen

