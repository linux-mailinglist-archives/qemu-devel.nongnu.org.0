Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1C6334216
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 16:51:53 +0100 (CET)
Received: from localhost ([::1]:55612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK17o-0001hW-9f
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 10:51:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lK15F-0000CV-3x
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:49:13 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:44160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lK15D-0005oo-Bb
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:49:12 -0500
Received: by mail-ed1-x533.google.com with SMTP id w9so28728829edc.11
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 07:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k1b047uSdTPiAqcAifKZoBuW20qhSqmbMF6qTDXJ+r0=;
 b=U3IaiJVE1jAWIO0oIV9smwkvfNeCsyVw687nniaQwr1uT1TgGQYOB7aJdBztwiROEo
 qh8J+muDBgrPrY9hXAd3JOcMHf9GEBhXZ7yXcEQtBfpacwyXRKLT8jGnwRY8qlbF3/hD
 8yFCDQdDc2/dkSmfvRAzRQ+MOlY7kjTi7MIVbL9kJ/Iz2We+0KdrCAXwAUNk0u6W0PDr
 o1VGGMs/gA/zG2lan1Kjg3z4mpVEsn5oGi5AhPQ7m/6KuQp6GeA0kHwO+SwVwyqwXObv
 7SADtoWDHlDnOQCERiM+9y9IphuxjbQNt++cpXhASkjYs9kKHc4t5jnNK7i1DH+LN3N1
 qWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k1b047uSdTPiAqcAifKZoBuW20qhSqmbMF6qTDXJ+r0=;
 b=Hg0sH+jZof0ftJHZVWU80W8Nk3erh+bCiCLxkjel+eqBZTYS39ZWt+c64W6dPjZ+SZ
 d5T2VPlO5njAsguLDaOhauCVh2p2Ijos07W8P/oPs8JxZcFlZCHpdNDs4Wcvotst8wZt
 K7rsmWeDWGneOLbQgx2Re4jQ2rz+9iKzGtyfaw2PLoiA3a/emVStKhCOCO3yPDaj5k30
 ZiD6oconNskLi75WW0xa8Zem8VL1pJFEh2uU2+Ugjk3ZTi5W0K0p/sYqJQ8LuY1uJGVW
 Ts3vpg2yi+G1WbdiWED9r4a2hmv8h7bTLcGC2+nGCtJGQCVAcIfQuJ/ypQ7yPaKDUuRL
 3G0g==
X-Gm-Message-State: AOAM533Zzp7XtTlJ3FGB1HER0XdSRqCI1OecPb8EcEGDtFJEbbWjzKhA
 Tk7SUQAyhRVWNSJ7hOoXlSigD8UcwpO8DgDFljsULg==
X-Google-Smtp-Source: ABdhPJwCw0cFog3t99K9jKWvLjV8PziGTO/Q7EaYomFXgYpGED+chIQC6J1iI9w6Np508t8jirf6Py33S5NK9s+UjVs=
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr4019359edr.52.1615391349435; 
 Wed, 10 Mar 2021 07:49:09 -0800 (PST)
MIME-Version: 1.0
References: <20210216161658.29881-1-peter.maydell@linaro.org>
 <20210216161658.29881-19-peter.maydell@linaro.org>
 <ec051472-7511-62da-d485-17f7573aa460@vivier.eu>
In-Reply-To: <ec051472-7511-62da-d485-17f7573aa460@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Mar 2021 15:48:50 +0000
Message-ID: <CAFEAcA87oLDyFJovHvppa+zwO=XJoFOt3Q5V9Y5+7BU+zDQsVw@mail.gmail.com>
Subject: Re: [PULL 18/40] linux-user: Fix types in uaccess.c
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Feb 2021 at 09:21, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Hi Richard,
>
> I think this commit is the cause of CID 1446711.
>
> There is no concistancy between the various declarations of unlock_user():
>
> bsd-user/qemu.h
>
> static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
>                                long len)
>
> include/exec/softmmu-semi.h
>
> static void softmmu_unlock_user(CPUArchState *env, void *p, target_ulong addr,
>                                 target_ulong len)
> ...
> #define unlock_user(s, args, len) softmmu_unlock_user(env, s, args, len)
>
> linux-user/qemu.h
>
> #ifndef DEBUG_REMAP
> static inline void unlock_user(void *host_ptr, abi_ulong guest_addr, size_t len)
> { }
> #else
> void unlock_user(void *host_ptr, abi_ulong guest_addr, long len);
> #endif
>
> To take a signed long here allows to unconditionnaly call the unlock_user() function after the
> syscall and not to copy the buffer if the value is negative.

Hi; what was the conclusion here about how best to fix the Coverity issue?

To save people looking it up, Coverity complains because in the
TARGET_NR_readlinkat case for linux-user we do:
            void *p2;
            p  = lock_user_string(arg2);
            p2 = lock_user(VERIFY_WRITE, arg3, arg4, 0);
            if (!p || !p2) {
                ret = -TARGET_EFAULT;
            } else if (is_proc_myself((const char *)p, "exe")) {
                char real[PATH_MAX], *temp;
                temp = realpath(exec_path, real);
                ret = temp == NULL ? get_errno(-1) : strlen(real) ;
                snprintf((char *)p2, arg4, "%s", real);
            } else {
                ret = get_errno(readlinkat(arg1, path(p), p2, arg4));
            }
            unlock_user(p2, arg3, ret);
            unlock_user(p, arg2, 0);

and in the "ret = -TARGET_EFAULT" and also the get_errno(readlinkat(...))
codepaths we can set ret to a negative number, which Coverity thinks
is suspicious given that unlock_user()'s new prototype says it
is an unsigned value. It's correct to be suspicious, because we really
did change from doing a >=0 to a !=0 check on the length.

Unless we really want to audit all the unlock_user() callsites,
going back to the previous semantics seems sensible.

thanks
-- PMM

