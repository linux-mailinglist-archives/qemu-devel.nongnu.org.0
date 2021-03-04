Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0731032D85E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 18:11:35 +0100 (CET)
Received: from localhost ([::1]:52728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHrVb-0001Gy-Td
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 12:11:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHrSb-0008CO-Oy
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:08:27 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:35630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHrSZ-0005Rv-C6
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:08:25 -0500
Received: by mail-ej1-x62d.google.com with SMTP id dx17so23233989ejb.2
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 09:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vIa0Y0j+K3ee+KNGElpKN4Io+5hKh00A2N7AHFjtFWc=;
 b=e+98gzVVQ2+pXnmFADaUIQ3/VE9w9rPAhWnE/SzHeC9tFHhpKWAO/P3T6niLx76GnM
 TUne7WwUW6qka0ET0ZrwgcP41ovfHEW8PoJj2J5k8OlBTtELVDE2b3SUTK+iFll8EmIM
 x0RDUDq+5rUZHgOSfg5JyCiJHEzymd1jSYLOGQf83QfLJUwgdBypy3aLZqOVWBJ54wE6
 j+NQU4gJdmxFGOC5dLh3CeOGrji6P4EKBjBC9MwsHkhRYpSCsiXj5HdH5B+16HSCbdTB
 BHAHEgedVLY14IS5DSl7a7Hu/R4+ZEQjvy8Wm77cVfB+8vo3jfxSy5w3DwW/41NhRp9r
 056w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vIa0Y0j+K3ee+KNGElpKN4Io+5hKh00A2N7AHFjtFWc=;
 b=jY7viy0MI6JwM6N0yX0xnt+qM4q4gEbpdl1xil/7aG+uy6Zj6PzrAo31KN9EtiiEfp
 psUFvT7NHToJWn9VcJm4BgqihU3JpLhDf4s3tXFmqq6RKar4Ak1pSS20+suRwA9MglWN
 BeQCHk3Nk705uP66mB9vVTFLUvKvOimgAOILGqoiTFeouuDOyYCSgXeLuKku9qLFb0je
 PQumLCYoLczPOiDtvXZsJNWxCoRXWf0/gjgMk4oYAqZlY2zSbrqGjFJIHmzxUtDqq04l
 +uHyP06Jap5YJmzbHpJj4MyDpW//uq47N5sEIxwcweVi6n8qS7Or76S/rQWD29ypRVtN
 qtyw==
X-Gm-Message-State: AOAM530ClBK54dzFukjbOtGsZUtyBxY8NW7XfPi+QMoKs94qfdlVxpzf
 bEIhvyWTa6TKwSdQzfDD4Hop9r4CrAIZ5P7AKS4owQ==
X-Google-Smtp-Source: ABdhPJwT/7FqDUcdLPBpxrmCjFk8r6bZrp35+ycvqqu3+ByH5n/YbyMtAPIQSs9uupI9Hg+DnMitxTyjvrE2zQqLiFc=
X-Received: by 2002:a17:906:66cc:: with SMTP id
 k12mr5174058ejp.382.1614877698932; 
 Thu, 04 Mar 2021 09:08:18 -0800 (PST)
MIME-Version: 1.0
References: <20210304152607.1817648-1-f4bug@amsat.org>
 <20210304152607.1817648-2-f4bug@amsat.org>
In-Reply-To: <20210304152607.1817648-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Mar 2021 17:08:03 +0000
Message-ID: <CAFEAcA_+1QbO9hXMdRH7-CRX2MkrWfHWmU-4FP9-G+PiNBvC9Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] user-mode: Use QEMU_ALIGNED() on TaskState structure
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Mar 2021 at 15:31, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The rest of the codebase uses the QEMU_ALIGNED() introduced in
> commit 911a4d2215b ("compiler.h: add QEMU_ALIGNED() to enforce
> struct alignment"). Use it for the TaskState structure too.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  bsd-user/qemu.h   | 2 +-
>  linux-user/qemu.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index d2bcaab7413..1ec14010216 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -96,7 +96,7 @@ typedef struct TaskState {
>      int signal_pending; /* non zero if a signal may be pending */
>
>      uint8_t stack[];
> -} __attribute__((aligned(16))) TaskState;
> +} QEMU_ALIGNED(16) TaskState;
>
>  void init_task_state(TaskState *ts);
>  extern const char *qemu_uname_release;
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 52c981710b4..d7815bfb845 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -157,7 +157,7 @@ typedef struct TaskState {
>
>      /* This thread's sigaltstack, if it has one */
>      struct target_sigaltstack sigaltstack_used;
> -} __attribute__((aligned(16))) TaskState;
> +} QEMU_ALIGNED(16) TaskState;

Does this struct need to be 16-aligned these days? When it was
first added in commit 851e67a1b46f in 2003, there was
a justification in a comment (still present in the source today):
/* NOTE: we force a big alignment so that the stack stored after is
   aligned too */
because the final field in the struct was "uint8_t stack[0];"
But that field was removed in commit 48e15fc2d in 2010 which
switched us to allocating the stack and the TaskState separately.

So I think that at least for linux-user the alignment attribute
is no longer needed.

bsd-user's struct still has the 'stack' field but as far
as I can tell it is never used, so it and the alignment
could be deleted there too. (bsd-user is missing the changes
that 48e15fc2d makes for linux-user, but less harmfully since
it appears not to implement either threads or fork (?!). In
any case the plan at the moment is to blow away bsd-user/
entirely so spending much thought on it is wasted effort.)

thanks
-- PMM

