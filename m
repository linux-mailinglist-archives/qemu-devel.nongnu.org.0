Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15C8143A9A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 11:14:28 +0100 (CET)
Received: from localhost ([::1]:51022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itqYF-0001fI-GU
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 05:14:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34359)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1itqX5-0000i0-OJ
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 05:13:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1itqX1-0006gA-MS
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 05:13:15 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:32805)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1itqX1-0006fa-F2
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 05:13:11 -0500
Received: by mail-wr1-x444.google.com with SMTP id b6so2517806wrq.0
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 02:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=8UjBupd1uftTAC0kLGMY4kQ09uRIfrD58RCMmj7paO8=;
 b=Q72JE4Qe0yzF1hgsMHWiEYsYQQ2yyjfrcCSeVHFKCC4BqpYRVCHBCBZQS6QjEjfeRt
 MqR+kKVcWCb5FkkLD+eAiMlFz3TAwu0DyD+1VlCyyuzZmJNGmXU7xx3xu4VLQnInccul
 hCajS0CVtbJ0o4V7jS9nEFwJaPKl4oDmHubq+n9GTqJ9ghBdsi+1EnHy3qmbk/pX0kLX
 xcGLuZ6eHrtBSA5Xck4p2+kBa4PNwOGQ0Qr9HC/yebLEeP6QpnWp094DMl5ut78P0QEW
 DTf4wSUuaKxC1EbzcGmHIgrZGslBUm156xHcaN6mAEHJpqnJ9ZP88n+aWYxbg7tcU4LD
 qAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=8UjBupd1uftTAC0kLGMY4kQ09uRIfrD58RCMmj7paO8=;
 b=BbmAbYoVK3jEZK7ikoNmtsvuSXGWbz9BJMDNTbprNACsr1QRuPUGbwtSnNCym9dEs8
 Ctpl6anXccSyDcINlpDspmzi/4z57/6Vwvd8/8cgEyRlUYpeNFOBrF5bKgUW8a3ZQ/DK
 7Cb3tHVksyyhrbgzu+kcuhK08lwySzD19n3aZabz0t8VT2uw0zd5ZZiq1Kt8BOednEt6
 c9KDZH2sMOzkmAD3g4qexwZYWxPD2PrwpkCSdq4RRRoFj3FIYtvGX1QHqdj2cOFe4jmR
 M/tiu+JR6AkbCh8zTY4h15jHutqetxG2pBmqHxcn+A2mqKEfBx9jVf77YjPBFRmpPwoT
 72Aw==
X-Gm-Message-State: APjAAAVetJYZ6xIIdgaJz92wvMhBCP28B03Ay76rZEC3hd/VpzmRJMmQ
 obpKIZ/F3beju2LuldQmg09jFg==
X-Google-Smtp-Source: APXvYqy/xPSOXBdmbyB+FOnFdq4MMEU4vVTEnifgPTJRUdyAKOMP+Qj573NxAwuEsXo8+8GZtbiZvg==
X-Received: by 2002:a5d:50d2:: with SMTP id f18mr4297258wrt.366.1579601589795; 
 Tue, 21 Jan 2020 02:13:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x7sm50416552wrq.41.2020.01.21.02.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 02:13:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B9E861FF87;
 Tue, 21 Jan 2020 10:13:07 +0000 (GMT)
References: <20200116194341.402-1-richard.henderson@linaro.org>
 <20200116194341.402-4-richard.henderson@linaro.org>
 <87v9p62vt5.fsf@linaro.org>
 <e384935c-7fc2-77eb-352d-90aa95ba89a9@linaro.org>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 3/5] linux-user/i386: Emulate x86_64 vsyscalls
In-reply-to: <e384935c-7fc2-77eb-352d-90aa95ba89a9@linaro.org>
Date: Tue, 21 Jan 2020 10:13:07 +0000
Message-ID: <87r1zt15jg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/20/20 1:48 AM, Alex Benn=C3=A9e wrote:
>>> +    default:
>>> +    sigsegv:
>>=20
>> this label looks a little extraneous.
>>=20
>> Otherwise:
>>=20
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>=20
>
> Look a little further down:
>
>> +    default:
>> +    sigsegv:
>> +        /* Like force_sig(SIGSEGV).  */
>> +        gen_signal(env, TARGET_SIGSEGV, TARGET_SI_KERNEL, 0);
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * Validate the return address.
>> +     * Note that the kernel treats this the same as an invalid entry po=
int.
>> +     */
>> +    if (get_user_u64(caller, env->regs[R_ESP])) {
>> +        goto sigsegv;
>> +    }

Wouldn't this read better:

    /*
     * Validate the entry point.  We have already validated the page
     * during translation, now verify the offset.
     */
    switch (env->eip & ~TARGET_PAGE_MASK) {
    case 0x000:
        syscall =3D TARGET_NR_gettimeofday;
        break;
    case 0x400:
        syscall =3D TARGET_NR_time;
        break;
    case 0x800:
        syscall =3D TARGET_NR_getcpu;
        break;
    default:
        syscall =3D -1;
        break;
    }

    /*
     * If we have an invalid entry point or an invalid return address we
     * generate a SIGSEG.
     */
    if (syscall < 0 || get_user_u64(caller, env->regs[R_ESP])) {
        gen_signal(env, TARGET_SIGSEGV, TARGET_SI_KERNEL, 0);
        return;
    }

--=20
Alex Benn=C3=A9e

