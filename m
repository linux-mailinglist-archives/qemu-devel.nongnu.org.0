Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2E14A657E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 21:13:31 +0100 (CET)
Received: from localhost ([::1]:38878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEzWo-000219-Tk
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 15:13:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEwJB-0007IZ-FK
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:47:10 -0500
Received: from mx2.freebsd.org ([96.47.72.81]:54836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEwJ8-0002QG-0Q
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:47:08 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 06840825AC
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:47:05 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Jp9nh6Ls8z4j2W
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:47:04 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1643734024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/fl0c52VaG2VLgtkaxpegbb8oLhFuDxBJnG6gvYm+CQ=;
 b=I4vJAmSGqnvdqrArUhxlfLAeWHcD2/KHM7x+dEivKlvSEhQ1fUblLe+iB1OkZ+5f/9Qi2Q
 1s+m3x6bnLy9pCwjOM7nR9B7s0GVc+W/QlnrLGuVCFl9hti26Pr20GcWgNhZXgds0VvCvX
 aZ4RNGdnmS5YqQJxS+xtpgMTah410TMRsEGQ9gNtBD45z+svPTT0DGyG0+eZri6gVCt1IN
 LEZ0A9JQKxUTETcbek9fbAtz/o+UQE+Cc3br4ofcKZuYHhzUflFfkzs9yg+pGEBKJJFPQc
 lGgtTN/i0tzFGvF5x1V6oKK7hn8NlG5VXEbkR3J3MN9WwmiZihGjQxWQmDrmgA==
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id B04FF2F1DD
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:47:04 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f180.google.com with SMTP id k25so9929325qtp.4
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 08:47:04 -0800 (PST)
X-Gm-Message-State: AOAM530Ci9xuu4dVrxOG10ZiSl/Qp2GWSZP41fSwf5fHHXXTOOl6I0u6
 DzhTFrqb6s15ux9gW1uBrrcUYTgszpMwtlLnfKg=
X-Google-Smtp-Source: ABdhPJxMfWfcKhAcrHENpZVQSdea8Mg4HLicsalZ7Hu088TOlqmUGxSOdtxsu6GFa2zp58ilneSzWQ+Q7Z8/kJVn+98=
X-Received: by 2002:ac8:4b59:: with SMTP id e25mr19363831qts.444.1643734024352; 
 Tue, 01 Feb 2022 08:47:04 -0800 (PST)
MIME-Version: 1.0
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-15-imp@bsdimp.com>
In-Reply-To: <20220201111455.52511-15-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 1 Feb 2022 10:46:53 -0600
X-Gmail-Original-Message-ID: <CACNAnaG32hwUuJi8QGO7DoB2aMXP3bvspboNZqqg-pCpbbUXQQ@mail.gmail.com>
Message-ID: <CACNAnaG32hwUuJi8QGO7DoB2aMXP3bvspboNZqqg-pCpbbUXQQ@mail.gmail.com>
Subject: Re: [PATCH 14/22] bsd-user/freebsd/os-syscall.c: lock_iovec
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1643734024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/fl0c52VaG2VLgtkaxpegbb8oLhFuDxBJnG6gvYm+CQ=;
 b=edAIdBeGVk9GC8AZ/1vXY4ocD4AcQKvu7p4LDuvdYYYBgGJtz/RseP1DI3VTyUf1IwP9JO
 XzaviwKQvGRoW2IH7ycx21rme4tFbBh4ZKZ16a3iuZQuQdSTTDWLI7WaA6H2F39OLOcuIZ
 E55ZqXxCJ+8rcyK/gIjz2wkMCNdfphIb9fYU6AtjQAgzSt5xFtCMrGTNgpZJnGvjoAHr6l
 CBUIZG+/3XQYwubspqa0/Z3DHXw9yLH0bpDvmQSuijPO0+5HdHXqc4VX/g/HOAodNs1shz
 RuDgmIoKIkiM3yflp+Kh2Lm8jFVoypHhu8CuVQ3QUbulREncnsXrkHbdc5XK4w==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1643734024; a=rsa-sha256; cv=none;
 b=D2Hpfh2ilPuGxzr91CWXLZCbNsPnDC5Pj3YyRB5I1CTVJMwQJtZqOYhl7lMB4gDp0PAPAh
 55BNQayd0l4CGpxe/pgJocQ5Ah+8iT/R2JMvbMxVHr1IAempubXMQweKCReYaLA6C/Wnu2
 tOYQ32cOB6vCvyZURH3hHTV1rwYiStI0a+efpspuooIXpTYkTUQNffZUSr875B0CEWBY8K
 qHP+HuWCqGvoMORCz/s2gPvsoBULYkxg8zy0MPDtmiLx31v5URELNuHugoSPsAZu9UqNIe
 DPQul4Ufz91DLx6Ok/43rpMlHgGr5DcL3GJOmLZCLodVT46Snq9Jku4PW0CcsQ==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
Received-SPF: pass client-ip=96.47.72.81; envelope-from=kevans@freebsd.org;
 helo=mx2.freebsd.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@freebsd.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, def@freebsd.org,
 Jessica Clarke <jrtc27@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 1, 2022 at 5:15 AM Warner Losh <imp@bsdimp.com> wrote:
>
> lock_iovec will lock an I/O vec and the memory to which it referrs and
> create a iovec in the host space that referrs to it, with full error
> unwinding.
>

s/referrs/refers/ twice

> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/freebsd/os-syscall.c | 92 +++++++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
>

Two typos, otherwise seems to LGTM:

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

> diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
> index 060134a9ecd..c21759ae7ce 100644
> --- a/bsd-user/freebsd/os-syscall.c
> +++ b/bsd-user/freebsd/os-syscall.c
> @@ -75,6 +75,98 @@ bool is_error(abi_long ret)
>      return (abi_ulong)ret >= (abi_ulong)(-4096);
>  }
>
> +struct iovec *lock_iovec(int type, abi_ulong target_addr,
> +        int count, int copy)
> +{
> +    struct target_iovec *target_vec;
> +    struct iovec *vec;
> +    abi_ulong total_len, max_len;
> +    int i;
> +    int err = 0;
> +    bool bad_address = false;
> +
> +    if (count == 0) {
> +        errno = 0;
> +        return NULL;
> +    }
> +    if (count < 0 || count > IOV_MAX) {
> +        errno = EINVAL;
> +        return NULL;
> +    }
> +
> +    vec = calloc(count, sizeof(struct iovec));
> +    if (vec == NULL) {
> +        errno = ENOMEM;
> +        return NULL;
> +    }
> +
> +    target_vec = lock_user(VERIFY_READ, target_addr,
> +                           count * sizeof(struct target_iovec), 1);
> +    if (target_vec == NULL) {
> +        err = EFAULT;
> +        goto fail2;
> +    }
> +
> +    /*
> +     * ??? If host page size > target page size, this will result in a value
> +     * larger than what we can actually support.
> +     */
> +    max_len = 0x7fffffff & TARGET_PAGE_MASK;
> +    total_len = 0;
> +
> +    for (i = 0; i < count; i++) {
> +        abi_ulong base = tswapal(target_vec[i].iov_base);
> +        abi_long len = tswapal(target_vec[i].iov_len);
> +
> +        if (len < 0) {
> +            err = EINVAL;
> +            goto fail;
> +        } else if (len == 0) {
> +            /* Zero length pointer is ignored.  */
> +            vec[i].iov_base = 0;
> +        } else {
> +            vec[i].iov_base = lock_user(type, base, len, copy);
> +            /*
> +             * If the first buffer pointer is bad, this is a fault.  But
> +             * subsequent bad buffers will result in a partial write; this is
> +             * realized by filling the vector with null pointers and zero
> +             * lengths.
> +             */
> +            if (!vec[i].iov_base) {
> +                if (i == 0) {
> +                    err = EFAULT;
> +                    goto fail;
> +                } else {
> +                    bad_address = true;
> +                }
> +            }
> +            if (bad_address) {
> +                len = 0;
> +            }
> +            if (len > max_len - total_len) {
> +                len = max_len - total_len;
> +            }
> +        }
> +        vec[i].iov_len = len;
> +        total_len += len;
> +    }
> +
> +    unlock_user(target_vec, target_addr, 0);
> +    return vec;
> +
> + fail:
> +    while (--i >= 0) {
> +        if (tswapal(target_vec[i].iov_len) > 0) {
> +            unlock_user(vec[i].iov_base, tswapal(target_vec[i].iov_base), 0);
> +        }
> +    }
> +    unlock_user(target_vec, target_addr, 0);
> + fail2:
> +    free(vec);
> +    errno = err;
> +    return NULL;
> +}
> +
>  /*
>   * do_syscall() should always have a single exit point at the end so that
>   * actions, such as logging of syscall results, can be performed.  All errnos
> --
> 2.33.1
>

