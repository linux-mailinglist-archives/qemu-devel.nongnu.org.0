Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F7466DF83
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 14:54:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHmPN-0003Z0-2B; Tue, 17 Jan 2023 08:53:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmP9-0003Qz-MT
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:53:35 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmP8-00064b-0V
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:53:35 -0500
Received: by mail-pg1-x52f.google.com with SMTP id 78so21993403pgb.8
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 05:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DYozhatT+WcpZOG8EnzAsfPGZqcMiXKBoQwfIL333SM=;
 b=EUjLXwsWL7gqpd3WvGZkdmNx8LglLR/Rws9nJJTR+cBnm0bieS+YBSms5ud+oVC70+
 Xx5K5Iq1aj/5GvpV180BDMaLsd2/raDeqoOqroEzzatvgXusojXMSq87tEGfYLxcGmal
 Sct62Ll4ivqR7A5cy8qr4Y7LyHH5e5aUcYGJC+gqtO1/psPm4k6L5DZFmPE3yi5LtUsp
 2Qim5DmRM3C4SrNtGMysvmvskte4lVU0yHh/g9Qc7hbL8DyJvYvzUfsTXYkj29HJscmC
 CdzBOZfS8WrXWVXFBHM2Ma7KXQhBN3RpvDBgxI4SY06Y8R4EUSnE8TfUu8IB8EW0ImZ7
 r+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DYozhatT+WcpZOG8EnzAsfPGZqcMiXKBoQwfIL333SM=;
 b=UKJ/+Amc/2XHBaAsSJDOHHVHSZ7uM9jazpXt5h83Tqb6ZBMtgGG0urgyJcviKe978n
 wiPffoXiEBx7S3G7S0hn8LeHzaosppy46OWQJfMZcNDnGu4rvd5FT/M4TpB48ANnkU7j
 m4V0tmOwiCLRKxT0ISJax1pPo1GCnDMb8RooK5J8EfLzNI2ytwI8xPzdd6fl3hlJXZOG
 rNatKQuAyRwaxKkNnIUxbpdJew3ZGZVt4C3nQNxNmJZpha80VH+kkxvMFCsUFehA+a77
 ZtZALNdWxZqtJuHgy5fh7R9MJxgkxqAqahJUUjY5sQJMPQKeyKMvRUnY/3QBJwYRpRDd
 SDKw==
X-Gm-Message-State: AFqh2kqN/fOB4gC+zYRTOjr5ftLojWV1fpuuCXLLUTC+W3kr7sch6ncZ
 XcIvOF/zGRlQcbDy+DAGdUEOLCwxp4AyMesBJjUabQ==
X-Google-Smtp-Source: AMrXdXut6XjzeNqUJEy/m22YPEcYt0z71FrHzOxoOGPT4wypVrwvfKcpeQFFOjRl9Vt0SrPrj3Jd2iz/2gFRThBGO40=
X-Received: by 2002:a63:234d:0:b0:4ce:ca5c:c472 with SMTP id
 u13-20020a63234d000000b004ceca5cc472mr217428pgm.105.1673963612484; Tue, 17
 Jan 2023 05:53:32 -0800 (PST)
MIME-Version: 1.0
References: <20230113133923.1642627-1-alex.bennee@linaro.org>
 <20230113133923.1642627-2-alex.bennee@linaro.org>
In-Reply-To: <20230113133923.1642627-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 13:53:21 +0000
Message-ID: <CAFEAcA8F9CH57-qJ9J6VFViawSiocp_R=d_a61Mp3QCmmK5ZYA@mail.gmail.com>
Subject: Re: [PATCH 1/4] docs: add hotlinks to about preface text
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>, 
 Markus Armbruster <armbru@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 John G Johnson <john.g.johnson@oracle.com>, 
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Jagannathan Raman <jag.raman@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 13 Jan 2023 at 13:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Make it easier to navigate the documentation.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  docs/about/index.rst  | 16 ++++++++--------
>  docs/system/index.rst |  2 ++
>  docs/tools/index.rst  |  2 ++
>  docs/user/index.rst   |  2 ++
>  4 files changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/docs/about/index.rst b/docs/about/index.rst
> index 5bea653c07..bae1309cc6 100644
> --- a/docs/about/index.rst
> +++ b/docs/about/index.rst
> @@ -5,19 +5,19 @@ About QEMU
>  QEMU is a generic and open source machine emulator and virtualizer.
>
>  QEMU can be used in several different ways. The most common is for
> -"system emulation", where it provides a virtual model of an
> +:ref:`System Emulation`, where it provides a virtual model of an
>  entire machine (CPU, memory and emulated devices) to run a guest OS.



> -In this mode the CPU may be fully emulated, or it may work with
> -a hypervisor such as KVM, Xen, Hax or Hypervisor.Framework to
> -allow the guest to run directly on the host CPU.
> +In this mode the CPU may be fully emulated, or it may work with a
> +hypervisor such as KVM, Xen, Hax or Hypervisor.Framework to allow the
> +guest to run directly on the host CPU.

Any particular reason for this change? As far as I can tell it's just
rewrapping these there lines?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

