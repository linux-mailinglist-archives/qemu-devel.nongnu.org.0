Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7336F7154
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:42:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucq4-0003CC-Ad; Thu, 04 May 2023 13:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puaH3-00011e-ET
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:49:37 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puaH1-0005PU-11
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:49:37 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50bc0117683so1064419a12.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 07:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683211772; x=1685803772;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GstM3uCHYYNhP7vLiPGJkNr4X7whCpAksFGwpTC8qGk=;
 b=L2l7e6kwZ1zye5vBA5JdgavpVPQ7GTz44lHYC6AEIk7v0AEJrm8IPT7kjZw8AqEuha
 Oeq743CGnnivzMnMGw/pjN3kQG3GSGepO2aLIduH91A3a4nQIMD2zYF3SySSykXhaKPm
 GWRMdCZmB4sNTmFIB069ufP85Q24wiNjo0fKaH1vMW6D7kniTS1r3OGUvSCKX9nmgDEN
 cv4NF+vI04OzZH+/t8FZBzrKuIfVfOO44Z+yT/ibj6SFd/xTtBHcibj0wC6xVJRQxev+
 tzGkG+cAqyEl9513J5JVBXHYIC1Stbzm9TKnaLRra4xU72y4ouH2AYbs/pRz01xh6tgq
 VQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683211772; x=1685803772;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GstM3uCHYYNhP7vLiPGJkNr4X7whCpAksFGwpTC8qGk=;
 b=MfhrdJnWjnR+BcXNgmGVEXvv//uJQAXvDezlMybtHDNyOjhUGp8B5wrxYc8MBwqlnJ
 KQd0U6DS4H0xMpLsI12K2xJBDxTLYvM9Pm0RqK0CVsOWr9TZS+b+dvzQBXvsheN03bwo
 0FlgXOLXtjT/v1WmpU7raWl96zBfMQYLAUcMwBp6+3AUGv1ey17z2nJohs/5hMfsCLkB
 4mP9RnzG+cPOfoi8NPLwRItmcPbo4uecFppGviI4ZDwRo8+n7UsuN7iFEdJ+gehB7+bO
 eYhUsfGU/217zGdK+yfTbT88tBg3yyfxDfNjBiHqf/j1k59jrx5aGQYO4ICI5d80USwM
 u7ww==
X-Gm-Message-State: AC+VfDxXHRZv5cCw+YUBRQImeJzzrrCkrY5KB4CPcMOdVPXAhX1sE2Gm
 pPZZB7+1kYYEzvjchbHJC5mOhkVrVjLIe6JxPd378A==
X-Google-Smtp-Source: ACHHUZ7BNquxS80Ct2PDV2DD4UP2fAat2wEb/hwwhGO/o0Jjj7xWdEBC6yBmBLMujI/zpMysprCXfKe6IscCnjLz56I=
X-Received: by 2002:aa7:cc11:0:b0:50b:dcf6:8e6d with SMTP id
 q17-20020aa7cc11000000b0050bdcf68e6dmr1429493edt.18.1683211772386; Thu, 04
 May 2023 07:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-2-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 May 2023 15:49:21 +0100
Message-ID: <CAFEAcA8k-4Obf9njjX9zcBTLhS3vdUNyeYYLSb3wTiy5nJyS7w@mail.gmail.com>
Subject: Re: [PATCH v4 01/57] include/exec/memop: Add bits describing atomicity
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 at 08:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These bits may be used to describe the precise atomicity
> requirements of the guest, which may then be used to
> constrain the methods by which it may be emulated by the host.
>
> For instance, the AArch64 LDP (32-bit) instruction changes
> semantics with ARMv8.4 LSE2, from
>
>   MO_64 | MO_ATMAX_4 | MO_ATOM_IFALIGN
>   (64-bits, single-copy atomic only on 4 byte units,
>    nonatomic if not aligned by 4),
>
> to
>
>   MO_64 | MO_ATMAX_SIZE | MO_ATOM_WITHIN16
>   (64-bits, single-copy atomic within a 16 byte block)
>
> The former may be implemented with two 4 byte loads, or
> a single 8 byte load if that happens to be efficient on
> the host.  The latter may not, and may also require a
> helper when misaligned.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/memop.h | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/include/exec/memop.h b/include/exec/memop.h
> index 25d027434a..04e4048f0b 100644
> --- a/include/exec/memop.h
> +++ b/include/exec/memop.h
> @@ -81,6 +81,42 @@ typedef enum MemOp {
>      MO_ALIGN_32 =3D 5 << MO_ASHIFT,
>      MO_ALIGN_64 =3D 6 << MO_ASHIFT,
>
> +    /*
> +     * MO_ATOM_* describes that atomicity requirements of the operation:

"the atomicity requirements"

> +     * MO_ATOM_IFALIGN: the operation must be single-copy atomic if and
> +     *    only if it is aligned; if unaligned there is no atomicity.

Is this really "and only if", ie "must *not* be single-copy-atomic if
non aligned"? Plain old "if" seems more likely...

> +     * MO_ATOM_NONE: the operation has no atomicity requirements.
> +     * MO_ATOM_SUBALIGN: the operation is single-copy atomic by parts
> +     *    by the alignment.  E.g. if the address is 0 mod 4, then each
> +     *    4-byte subobject is single-copy atomic.
> +     *    This is the atomicity of IBM Power and S390X processors.
> +     * MO_ATOM_WITHIN16: the operation is single-copy atomic, even if it
> +     *    is unaligned, so long as it does not cross a 16-byte boundary;
> +     *    if it crosses a 16-byte boundary there is no atomicity.
> +     *    This is the atomicity of Arm FEAT_LSE2.
> +     *
> +     * MO_ATMAX_* describes the maximum atomicity unit required:
> +     * MO_ATMAX_SIZE: the entire operation, i.e. MO_SIZE.
> +     * MO_ATMAX_[248]: units of N bytes.
> +     *
> +     * Note the default (i.e. 0) values are single-copy atomic to the
> +     * size of the operation, if aligned.  This retains the behaviour
> +     * from before these were introduced.
> +     */
> +    MO_ATOM_SHIFT    =3D 8,
> +    MO_ATOM_MASK     =3D 0x3 << MO_ATOM_SHIFT,
> +    MO_ATOM_IFALIGN  =3D 0 << MO_ATOM_SHIFT,
> +    MO_ATOM_NONE     =3D 1 << MO_ATOM_SHIFT,
> +    MO_ATOM_SUBALIGN =3D 2 << MO_ATOM_SHIFT,
> +    MO_ATOM_WITHIN16 =3D 3 << MO_ATOM_SHIFT,
> +
> +    MO_ATMAX_SHIFT =3D 10,
> +    MO_ATMAX_MASK  =3D 0x3 << MO_ATMAX_SHIFT,
> +    MO_ATMAX_SIZE  =3D 0 << MO_ATMAX_SHIFT,
> +    MO_ATMAX_2     =3D 1 << MO_ATMAX_SHIFT,
> +    MO_ATMAX_4     =3D 2 << MO_ATMAX_SHIFT,
> +    MO_ATMAX_8     =3D 3 << MO_ATMAX_SHIFT,
> +

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

