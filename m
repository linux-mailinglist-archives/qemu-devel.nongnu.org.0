Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4663076D8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 14:13:58 +0100 (CET)
Received: from localhost ([::1]:33138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l577V-0003R7-4x
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 08:13:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l575v-0002zh-7J
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:12:19 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l575s-0002HX-Rr
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:12:18 -0500
Received: by mail-wr1-x42e.google.com with SMTP id q7so5309438wre.13
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 05:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=v8J9xCXxmCqs2Y9y+pNzDsMcnA5mc0aUNfGaJGaoKFs=;
 b=uTyT30fjT4QL9PpVbF24CctQGJS7yrfDAPB6LVmmLw50m+NABax/r0sZ2u7kasxsxK
 aVdv0f52rafuf5kjzWtf95WrT7n2mxxQytbOcUUE/9zhHrEn32QjIdYYJQ5QQ4DXD7IP
 QXoKUJkB3wgCvBFuFzsoub/cwEFRPLC5ArOZPlQ+PzyLkXa6S/1bQCx2VAm/dlOP6ua3
 SziaEelpuxSNC/QIjjbV2qqe2dG8IkyvlQQf1mCWI2wp2VLCVOELUlgLUahaqVfpX9ZW
 AK9VDqceIACZPrNjtVJs5Mbw8IBK3hKuavsFWmSbK2GhR5qT8FpqJnTm4gXjamn46xOD
 vJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=v8J9xCXxmCqs2Y9y+pNzDsMcnA5mc0aUNfGaJGaoKFs=;
 b=gnArUyyJUDQ7NVaAeEMaLaorWWhFBUlcT1yFNOzRyw5Ny2mZl2SmOLCTXvlOgGEzdH
 rMVIx5tfJX+u7yOpmfOySUNCKfebIEfYaBrb+VuEB47TDCe4Ukbza6gXBDAwcST+8H5D
 6NPeDlMEG+3KLwHogqzDdL363ZnwCKpukaIM6nJNSzhDz87konwbMyxfp6ha4fLFQ/9M
 fDqCkqs9n3Usi6276UCd915SUDjJhfHDkOQhyKpKY+JLOYKo08mTiFTToq6C/1UguCYI
 J9rLR8ZyycaQrQumY/EsdhCh0rsX4NLkGdE0veHAFkY7GZZE2xro8kjlZSQQx7jH1g3G
 9p0w==
X-Gm-Message-State: AOAM5309RWkMLJpp6k5rfZ7ABcwypfUFLdMkH366XVm7ezFRPJnwFbUF
 vsqS5kwmy7SfqMMEkSqzhP0GBQ==
X-Google-Smtp-Source: ABdhPJyTA9M1Yn0Tji/3xCZcqToZ5+uBlchVeViABlNAlcxBTuRVJ4zv5RDMBuSL9HVrLkjJD5ASUA==
X-Received: by 2002:adf:fb52:: with SMTP id c18mr15949881wrs.186.1611839532876; 
 Thu, 28 Jan 2021 05:12:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h23sm5819640wmi.26.2021.01.28.05.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 05:12:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B35031FF7E;
 Thu, 28 Jan 2021 13:12:10 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-3-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 02/23] tcg: Manage splitwx in tc_ptr_to_region_tree by hand
Date: Thu, 28 Jan 2021 13:09:55 +0000
In-reply-to: <20210128082331.196801-3-richard.henderson@linaro.org>
Message-ID: <87ft2lw6hh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The use in tcg_tb_lookup is given a random pc that comes from the pc
> of a signal handler.  Do not assert that the pointer is already within
> the code gen buffer at all, much less the writable mirror of it.
>
> Fixes: db0c51a3803
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

OK I bisected to this regression while running:

  "cd builds/bisect && rm -rf * && ../../configure --disable-docs --target-=
list=3Dm68k-linux-user && make -j30 && make check-tcg"

which ultimately fails during the threadcount test for m68k-linux-user.
I'm just testing now to see if that also broke my ARM system test
images.

> ---
>
> For TCI, this indicates a bug in handle_cpu_signal, in that we
> are taking PC from the host signal frame.  Which is, nearly,
> unrelated to TCI at all.
>
> The TCI "pc" is tci_tb_ptr (fixed in the next patch to at least
> be thread-local).  We update this only on calls, since we don't
> expect SEGV during the interpretation loop.  Which works ok for
> softmmu, in which we pass down pc by hand to the helpers, but
> is not ok for user-only, where we simply perform the raw memory
> operation.
>
> I don't know how to fix this, exactly.  Probably by storing to
> tci_tb_ptr before each qemu_ld/qemu_st operation, with barriers.
> Then Doing the Right Thing in handle_cpu_signal.  And perhaps
> by clearing tci_tb_ptr whenever we're not expecting a SEGV on
> behalf of the guest (and thus anything left is a qemu host bug).
>
>
> r~
>
> ---
>  tcg/tcg.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 9e1b0d73c7..78701cf359 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -407,11 +407,21 @@ static void tcg_region_trees_init(void)
>      }
>  }
>=20=20
> -static struct tcg_region_tree *tc_ptr_to_region_tree(const void *cp)
> +static struct tcg_region_tree *tc_ptr_to_region_tree(const void *p)
>  {
> -    void *p =3D tcg_splitwx_to_rw(cp);
>      size_t region_idx;
>=20=20
> +    /*
> +     * Like tcg_splitwx_to_rw, with no assert.  The pc may come from
> +     * a signal handler over which the caller has no control.
> +     */
> +    if (!in_code_gen_buffer(p)) {
> +        p -=3D tcg_splitwx_diff;
> +        if (!in_code_gen_buffer(p)) {
> +            return NULL;
> +        }
> +    }
> +
>      if (p < region.start_aligned) {
>          region_idx =3D 0;
>      } else {
> @@ -430,6 +440,7 @@ void tcg_tb_insert(TranslationBlock *tb)
>  {
>      struct tcg_region_tree *rt =3D tc_ptr_to_region_tree(tb->tc.ptr);
>=20=20
> +    g_assert(rt !=3D NULL);
>      qemu_mutex_lock(&rt->lock);
>      g_tree_insert(rt->tree, &tb->tc, tb);
>      qemu_mutex_unlock(&rt->lock);
> @@ -439,6 +450,7 @@ void tcg_tb_remove(TranslationBlock *tb)
>  {
>      struct tcg_region_tree *rt =3D tc_ptr_to_region_tree(tb->tc.ptr);
>=20=20
> +    g_assert(rt !=3D NULL);
>      qemu_mutex_lock(&rt->lock);
>      g_tree_remove(rt->tree, &tb->tc);
>      qemu_mutex_unlock(&rt->lock);
> @@ -453,8 +465,13 @@ TranslationBlock *tcg_tb_lookup(uintptr_t tc_ptr)
>  {
>      struct tcg_region_tree *rt =3D tc_ptr_to_region_tree((void *)tc_ptr);
>      TranslationBlock *tb;
> -    struct tb_tc s =3D { .ptr =3D (void *)tc_ptr };
> +    struct tb_tc s;
>=20=20
> +    if (rt =3D=3D NULL) {
> +        return NULL;
> +    }
> +
> +    s.ptr =3D (void *)tc_ptr;
>      qemu_mutex_lock(&rt->lock);
>      tb =3D g_tree_lookup(rt->tree, &s);
>      qemu_mutex_unlock(&rt->lock);


--=20
Alex Benn=C3=A9e

