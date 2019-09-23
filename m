Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 756F4BBF2D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 01:55:49 +0200 (CEST)
Received: from localhost ([::1]:37534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCYBI-0001kB-Ho
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 19:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42976)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iCY9s-0000VP-Px
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 19:54:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iCY9q-0007n2-RF
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 19:54:20 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39360)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iCY9q-0007mn-KK
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 19:54:18 -0400
Received: by mail-wr1-x443.google.com with SMTP id r3so15825710wrj.6
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 16:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=XSFsQLA/L6lpGeM0WSpNhPc4CXLyyTbzWOZ2MezQ2ns=;
 b=FKd0C/Eb01sJsaKPhUsl/9AJ61i4l447qBkKdM0fCXQwCWH72xoA8emDogAy97/1qm
 O7xmAZ+TKnaUqw7vzP1nRgFYYD2d0Fz5Ea3/l8qgeus2woqw5GrosvmuTfnaq6lmpsol
 4puUz7bIIl/2ZQKBjEfNokO5THmb/ZzxtmZUem9/266hNHuykqFtySY7hqxutGVGePEb
 0UeUyFWiEIxv0Zz0u70ZJXBmeuih2O9BEUTr9Xksns9a+bgvJJJZ6ho2uTQR9Lx3ot6k
 oow66JB26LMsOTx+8gEI2jaBhrrYjRbt1HRz6otTQmMt8IXFD7HBsr9lcBzZWagpCvPg
 zyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=XSFsQLA/L6lpGeM0WSpNhPc4CXLyyTbzWOZ2MezQ2ns=;
 b=b6G5vuHwKNDTYCJ4NQhoEgx0L5m8W3T1sMRZaOB1nJNJVMig5g+zr1yvCDN7VnN7Qj
 JXFcpF8LS1jedKvdb3l0WaFWP0eJhtwGGnI2NbUpkkH5ZeqB2N5tsPNQ6lPXostL/ocn
 IEwkg9RSvRokcfdakeJes91UzAJLmJfDZhV8ur25EXBm8VDfYAoy0cxTw/1ctkGw06tN
 WmEHybyVMFByeQV3DSjxJQdlMFzATQzHJBXIq84g1QWuCphCAxxTRHjak6jj09yHzCCb
 l8Q1ZH+pEyBYvbI+ICoI7SpXVyOBSW/fdZ35VwQ9mHDo0349PoWzSGUPGSrvNYuPgXH+
 X1PA==
X-Gm-Message-State: APjAAAWY+3rNWB7G4oq/zp1iO2zC+7/pf2I0xxRSjRw3qb78hP9yRCKL
 A0/v9ODtsC9n2oRfXax5kSg8VQ==
X-Google-Smtp-Source: APXvYqxtE3yuM6VXB3XRhNXwPX0C4jww4aZT/0gN0kUAuvX0nbTC0ak/r7NfrXZROUbDHmrqOmx2lQ==
X-Received: by 2002:a5d:6108:: with SMTP id v8mr1272191wrt.28.1569282857387;
 Mon, 23 Sep 2019 16:54:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z142sm24532149wmc.24.2019.09.23.16.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 16:54:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3FB3A1FF87;
 Tue, 24 Sep 2019 00:54:16 +0100 (BST)
References: <20190910095610.4546-1-beata.michalska@linaro.org>
 <20190910095610.4546-2-beata.michalska@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [PATCH 1/4] tcg: cputlb: Add probe_read
In-reply-to: <20190910095610.4546-2-beata.michalska@linaro.org>
Date: Tue, 24 Sep 2019 00:54:16 +0100
Message-ID: <87ef06bmc7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: peter.maydell@linaro.org, Beata Michalska <beata.michalska@linaro.org>,
 quintela@redhat.com, richard.henderson@linaro.org, dgilbert@redhat.com,
 shameerali.kolothum.thodi@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Beata Michalska <beata.michalska@linaro.org> writes:

> Add probe_read alongside the write probing equivalent.
>
> Signed-off-by: Beata Michalska <beata.michalska@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  include/exec/exec-all.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 81b02eb2fe..e1785700c3 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -319,6 +319,12 @@ static inline void *probe_write(CPUArchState *env, t=
arget_ulong addr, int size,
>      return probe_access(env, addr, size, MMU_DATA_STORE, mmu_idx, retadd=
r);
>  }
>
> +static inline void *probe_read(CPUArchState *env, target_ulong addr, int=
 size,
> +                               int mmu_idx, uintptr_t retaddr)
> +{
> +    return probe_access(env, addr, size, MMU_DATA_LOAD, mmu_idx, retaddr=
);
> +}
> +
>  #define CODE_GEN_ALIGN           16 /* must be >=3D of the size of a ica=
che line */
>
>  /* Estimated block size for TB allocation.  */


--
Alex Benn=C3=A9e

