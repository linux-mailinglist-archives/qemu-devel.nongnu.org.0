Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 398B736B6D8
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 18:31:15 +0200 (CEST)
Received: from localhost ([::1]:39734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb48g-0003h7-4b
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 12:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lb470-0003Ej-De
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 12:29:30 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lb46x-0005th-8r
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 12:29:30 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l189-20020a1cbbc60000b0290140319ad207so3085123wmf.2
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 09:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=NMupNa1KytAJRGk792Jx+QIV0jaVZi7FybgshlHMuCs=;
 b=vCwbpCzHDQgDGyP6rieaJZtwQr5fk5hVwASqz9AFxZWOkbtVBfvD0JtLRLOK8VOHhZ
 UEuL5S6DEP5I7Jax1G4x+t5BL6yJGDlUR/HN3mNZyN6jgkB3k+cIOZna6LXxXPDMA0sJ
 /kU7HLp9xJDvRAjdfpDVby/8+Uc4yfHKOKKuQpi1ub8KPUCXumXKRZ3jLFLYE12Q/bNT
 JF+gTxCU1W9fKzUX+RqZFF9tDpLvhs3CJJUFCevGPMnejEQN8LrDV96Qfu2muVxdWFN7
 a/ryCTjZ/dNDkv3MYhVaZ8jvwgnhYK6OZkCjJLIvGqRbPJ9HK2kQaTaOxciK2JRFs1ch
 UvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=NMupNa1KytAJRGk792Jx+QIV0jaVZi7FybgshlHMuCs=;
 b=pHahHBdyeXOO2tM4O8MndOTFJHqWXyn8ywab8RV7hUh1MOGTHDl8M9EUwwg0OhxQwm
 U1tMlmYDgzhHYzSrOTYxJ+3AIFbJaAbPnZ2xBnmkQv1FCULWe4xZCMjufmkV1Am2hfp1
 Vr2sRjzk2C5MbEOeKyzclv8fFD/sCUMcyCpS5sXJ90RZwsY+AJ0T42+zLQ63WKWL4Hza
 SFfhLkOYTwfPkeNETyDvWDy9vkVnSCiEiCAtEdrh+MHuRvwO5va7QD9fhXti06ddMcBM
 DZquomV3XrEPlIwzywB4SBwBFht/dtWyn3XlFF+1Im45F+Q23mHO0yKCvjcOEQ0e9wKI
 yUzA==
X-Gm-Message-State: AOAM533AJapbZUuuaaZlupInnkEHYOWw9JWvdo7LmCUDxBCQstCOIGOL
 LoX/ZLDXzTT35B2mrXccRE7m9A==
X-Google-Smtp-Source: ABdhPJxLTeToQbrqp+gvr9YGeXsy3FlWcyJmuqAsskiwd41Vori+/xfzusHSh3m93WK/LbQnE8WKWg==
X-Received: by 2002:a05:600c:3515:: with SMTP id
 h21mr21372737wmq.67.1619454565255; 
 Mon, 26 Apr 2021 09:29:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u6sm803005wml.6.2021.04.26.09.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 09:29:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B63ED1FF7E;
 Mon, 26 Apr 2021 17:29:23 +0100 (BST)
References: <20210318185555.434-1-luoyonggang@gmail.com>
 <20210318185555.434-3-luoyonggang@gmail.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Yonggang Luo <luoyonggang@gmail.com>
Subject: Re: [PATCH 2/2] plugins: Move all typedef and type declaration to
 the front of the qemu-plugin.h
Date: Mon, 26 Apr 2021 17:28:15 +0100
In-reply-to: <20210318185555.434-3-luoyonggang@gmail.com>
Message-ID: <87zgxlrov0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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


Yonggang Luo <luoyonggang@gmail.com> writes:

What's the rationale for moving everything around in the file. As it
currently stands the typedefs are create as we get to each new set of
helpers/plugin points. Doing it all up front seems like a lot of churn
for not particular reason.

> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  include/qemu/qemu-plugin.h | 187 ++++++++++++++++++-------------------
>  1 file changed, 92 insertions(+), 95 deletions(-)
>
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index 97cdfd7761..2cb17f3051 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -81,27 +81,6 @@ typedef struct qemu_info_t {
>      };
>  } qemu_info_t;
>=20=20
> -/**
> - * qemu_plugin_install() - Install a plugin
> - * @id: this plugin's opaque ID
> - * @info: a block describing some details about the guest
> - * @argc: number of arguments
> - * @argv: array of arguments (@argc elements)
> - *
> - * All plugins must export this symbol which is called when the plugin
> - * is first loaded. Calling qemu_plugin_uninstall() from this function
> - * is a bug.
> - *
> - * Note: @info is only live during the call. Copy any information we
> - * want to keep. @argv remains valid throughout the lifetime of the
> - * loaded plugin.
> - *
> - * Return: 0 on successful loading, !0 for an error.
> - */
> -QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
> -                                           const qemu_info_t *info,
> -                                           int argc, char **argv);
> -
>  /**
>   * typedef qemu_plugin_simple_cb_t - simple callback
>   * @id: the unique qemu_plugin_id_t
> @@ -135,6 +114,98 @@ typedef void (*qemu_plugin_vcpu_simple_cb_t)(qemu_pl=
ugin_id_t id,
>  typedef void (*qemu_plugin_vcpu_udata_cb_t)(unsigned int vcpu_index,
>                                              void *userdata);
>=20=20
> +/** struct qemu_plugin_tb - Opaque handle for a translation block */
> +struct qemu_plugin_tb;
> +/** struct qemu_plugin_insn - Opaque handle for a translated instruction=
 */
> +struct qemu_plugin_insn;
> +
> +/**
> + * enum qemu_plugin_cb_flags - type of callback
> + *
> + * @QEMU_PLUGIN_CB_NO_REGS: callback does not access the CPU's regs
> + * @QEMU_PLUGIN_CB_R_REGS: callback reads the CPU's regs
> + * @QEMU_PLUGIN_CB_RW_REGS: callback reads and writes the CPU's regs
> + *
> + * Note: currently unused, plugins cannot read or change system
> + * register state.
> + */
> +enum qemu_plugin_cb_flags {
> +    QEMU_PLUGIN_CB_NO_REGS,
> +    QEMU_PLUGIN_CB_R_REGS,
> +    QEMU_PLUGIN_CB_RW_REGS,
> +};
> +
> +enum qemu_plugin_mem_rw {
> +    QEMU_PLUGIN_MEM_R =3D 1,
> +    QEMU_PLUGIN_MEM_W,
> +    QEMU_PLUGIN_MEM_RW,
> +};
> +
> +/**
> + * typedef qemu_plugin_vcpu_tb_trans_cb_t - translation callback
> + * @id: unique plugin id
> + * @tb: opaque handle used for querying and instrumenting a block.
> + */
> +typedef void (*qemu_plugin_vcpu_tb_trans_cb_t)(qemu_plugin_id_t id,
> +                                               struct qemu_plugin_tb *tb=
);
> +
> +/**
> + * enum qemu_plugin_op - describes an inline op
> + *
> + * @QEMU_PLUGIN_INLINE_ADD_U64: add an immediate value uint64_t
> + *
> + * Note: currently only a single inline op is supported.
> + */
> +
> +enum qemu_plugin_op {
> +    QEMU_PLUGIN_INLINE_ADD_U64,
> +};
> +
> +/**
> + * typedef qemu_plugin_meminfo_t - opaque memory transaction handle
> + *
> + * This can be further queried using the qemu_plugin_mem_* query
> + * functions.
> + */
> +typedef uint32_t qemu_plugin_meminfo_t;
> +/** struct qemu_plugin_hwaddr - opaque hw address handle */
> +struct qemu_plugin_hwaddr;
> +
> +typedef void
> +(*qemu_plugin_vcpu_mem_cb_t)(unsigned int vcpu_index,
> +                             qemu_plugin_meminfo_t info, uint64_t vaddr,
> +                             void *userdata);
> +
> +typedef void
> +(*qemu_plugin_vcpu_syscall_cb_t)(qemu_plugin_id_t id, unsigned int vcpu_=
index,
> +                                 int64_t num, uint64_t a1, uint64_t a2,
> +                                 uint64_t a3, uint64_t a4, uint64_t a5,
> +                                 uint64_t a6, uint64_t a7, uint64_t a8);
> +typedef void
> +(*qemu_plugin_vcpu_syscall_ret_cb_t)(qemu_plugin_id_t id, unsigned int v=
cpu_idx,
> +                                     int64_t num, int64_t ret);
> +
> +/**
> + * qemu_plugin_install() - Install a plugin
> + * @id: this plugin's opaque ID
> + * @info: a block describing some details about the guest
> + * @argc: number of arguments
> + * @argv: array of arguments (@argc elements)
> + *
> + * All plugins must export this symbol which is called when the plugin
> + * is first loaded. Calling qemu_plugin_uninstall() from this function
> + * is a bug.
> + *
> + * Note: @info is only live during the call. Copy any information we
> + * want to keep. @argv remains valid throughout the lifetime of the
> + * loaded plugin.
> + *
> + * Return: 0 on successful loading, !0 for an error.
> + */
> +QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
> +                                           const qemu_info_t *info,
> +                                           int argc, char **argv);
> +
>  /**
>   * qemu_plugin_uninstall() - Uninstall a plugin
>   * @id: this plugin's opaque ID
> @@ -205,41 +276,6 @@ void qemu_plugin_register_vcpu_idle_cb(qemu_plugin_i=
d_t id,
>  void qemu_plugin_register_vcpu_resume_cb(qemu_plugin_id_t id,
>                                           qemu_plugin_vcpu_simple_cb_t cb=
);
>=20=20
> -/** struct qemu_plugin_tb - Opaque handle for a translation block */
> -struct qemu_plugin_tb;
> -/** struct qemu_plugin_insn - Opaque handle for a translated instruction=
 */
> -struct qemu_plugin_insn;
> -
> -/**
> - * enum qemu_plugin_cb_flags - type of callback
> - *
> - * @QEMU_PLUGIN_CB_NO_REGS: callback does not access the CPU's regs
> - * @QEMU_PLUGIN_CB_R_REGS: callback reads the CPU's regs
> - * @QEMU_PLUGIN_CB_RW_REGS: callback reads and writes the CPU's regs
> - *
> - * Note: currently unused, plugins cannot read or change system
> - * register state.
> - */
> -enum qemu_plugin_cb_flags {
> -    QEMU_PLUGIN_CB_NO_REGS,
> -    QEMU_PLUGIN_CB_R_REGS,
> -    QEMU_PLUGIN_CB_RW_REGS,
> -};
> -
> -enum qemu_plugin_mem_rw {
> -    QEMU_PLUGIN_MEM_R =3D 1,
> -    QEMU_PLUGIN_MEM_W,
> -    QEMU_PLUGIN_MEM_RW,
> -};
> -
> -/**
> - * typedef qemu_plugin_vcpu_tb_trans_cb_t - translation callback
> - * @id: unique plugin id
> - * @tb: opaque handle used for querying and instrumenting a block.
> - */
> -typedef void (*qemu_plugin_vcpu_tb_trans_cb_t)(qemu_plugin_id_t id,
> -                                               struct qemu_plugin_tb *tb=
);
> -
>  /**
>   * qemu_plugin_register_vcpu_tb_trans_cb() - register a translate cb
>   * @id: plugin ID
> @@ -269,18 +305,6 @@ void qemu_plugin_register_vcpu_tb_exec_cb(struct qem=
u_plugin_tb *tb,
>                                            enum qemu_plugin_cb_flags flag=
s,
>                                            void *userdata);
>=20=20
> -/**
> - * enum qemu_plugin_op - describes an inline op
> - *
> - * @QEMU_PLUGIN_INLINE_ADD_U64: add an immediate value uint64_t
> - *
> - * Note: currently only a single inline op is supported.
> - */
> -
> -enum qemu_plugin_op {
> -    QEMU_PLUGIN_INLINE_ADD_U64,
> -};
> -
>  /**
>   * qemu_plugin_register_vcpu_tb_exec_inline() - execution inline op
>   * @tb: the opaque qemu_plugin_tb handle for the translation
> @@ -393,16 +417,6 @@ uint64_t qemu_plugin_insn_vaddr(const struct qemu_pl=
ugin_insn *insn);
>   */
>  void *qemu_plugin_insn_haddr(const struct qemu_plugin_insn *insn);
>=20=20
> -/**
> - * typedef qemu_plugin_meminfo_t - opaque memory transaction handle
> - *
> - * This can be further queried using the qemu_plugin_mem_* query
> - * functions.
> - */
> -typedef uint32_t qemu_plugin_meminfo_t;
> -/** struct qemu_plugin_hwaddr - opaque hw address handle */
> -struct qemu_plugin_hwaddr;
> -
>  /**
>   * qemu_plugin_mem_size_shift() - get size of access
>   * @info: opaque memory transaction handle
> @@ -480,11 +494,6 @@ uint64_t qemu_plugin_hwaddr_phys_addr(const struct q=
emu_plugin_hwaddr *haddr);
>   */
>  const char *qemu_plugin_hwaddr_device_name(const struct qemu_plugin_hwad=
dr *h);
>=20=20
> -typedef void
> -(*qemu_plugin_vcpu_mem_cb_t)(unsigned int vcpu_index,
> -                             qemu_plugin_meminfo_t info, uint64_t vaddr,
> -                             void *userdata);
> -
>  void qemu_plugin_register_vcpu_mem_cb(struct qemu_plugin_insn *insn,
>                                        qemu_plugin_vcpu_mem_cb_t cb,
>                                        enum qemu_plugin_cb_flags flags,
> @@ -496,21 +505,9 @@ void qemu_plugin_register_vcpu_mem_inline(struct qem=
u_plugin_insn *insn,
>                                            enum qemu_plugin_op op, void *=
ptr,
>                                            uint64_t imm);
>=20=20
> -
> -
> -typedef void
> -(*qemu_plugin_vcpu_syscall_cb_t)(qemu_plugin_id_t id, unsigned int vcpu_=
index,
> -                                 int64_t num, uint64_t a1, uint64_t a2,
> -                                 uint64_t a3, uint64_t a4, uint64_t a5,
> -                                 uint64_t a6, uint64_t a7, uint64_t a8);
> -
>  void qemu_plugin_register_vcpu_syscall_cb(qemu_plugin_id_t id,
>                                            qemu_plugin_vcpu_syscall_cb_t =
cb);
>=20=20
> -typedef void
> -(*qemu_plugin_vcpu_syscall_ret_cb_t)(qemu_plugin_id_t id, unsigned int v=
cpu_idx,
> -                                     int64_t num, int64_t ret);
> -
>  void
>  qemu_plugin_register_vcpu_syscall_ret_cb(qemu_plugin_id_t id,
>                                           qemu_plugin_vcpu_syscall_ret_cb=
_t cb);


--=20
Alex Benn=C3=A9e

