Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A8C1F99D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 May 2019 19:52:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40558 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQy5B-0002pK-Sf
	for lists+qemu-devel@lfdr.de; Wed, 15 May 2019 13:52:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hQy1T-0000WZ-VQ
	for qemu-devel@nongnu.org; Wed, 15 May 2019 13:49:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hQy1S-0007bn-Uj
	for qemu-devel@nongnu.org; Wed, 15 May 2019 13:48:59 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37597)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hQy1S-0007aW-OX
	for qemu-devel@nongnu.org; Wed, 15 May 2019 13:48:58 -0400
Received: by mail-wm1-x343.google.com with SMTP id 7so896490wmo.2
	for <qemu-devel@nongnu.org>; Wed, 15 May 2019 10:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=WGQH/XWx5FNcLXxKJxKRg9e3uQ1KUh4DEQVshiOeoVk=;
	b=OeJ559/gdffWPfotCJNbwuXoCP9Fo2YZP/vK3KXugYTHYpJo4T+i/yTB3GAWVVKZ4R
	2g6ot7vYhYz1iSjZtHx8JuSIqiT5MppbJ7I7eurU16Oi0LOjPHuSNxJBFvWVRKSE4Gb9
	r6xUCQRVsEC7xiqJpC8OSvevhvco3qyaoMlIkAhOJFql6Vbled7D8BJ6jztHDcQjkGsw
	5WFjv+uurZCGId75ZuIVCRnnikEftyZoo//UQcwPM2h6WZBqpWooNZvhqECEz5SvqU78
	u/oQ9Je21H9OwouTkVOlnZFwoBsVgVU4nJYtDHBdb6tySCr/IvfygDIXalRYlFkZxJ9N
	70Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=WGQH/XWx5FNcLXxKJxKRg9e3uQ1KUh4DEQVshiOeoVk=;
	b=EYLGWuHauRyviHaO2Vm+l94iSg4acAcZBuxwBxQ6XEXZrigo9CHOjN8kgfXOkXVbCf
	ligfVkLhowTsH7KS4RA1bnDPXD7iT8BKpQmbjnH+uV44heoqcxjvSvB+2UpSKHir+fa7
	lz6TvcFaDMfOITeVEXWkmGD2MyJ9Jm0snwFUScfozXm29sd3vWlZyqj7SkUA2vclaV5s
	IjU1/BpCw1IFVIP23dPpXoIDly6Fsm5Jxc88++clFUyrSDxoUpW2uGRgvqty/51mVPfP
	++fNwyUCJN52TE/Ne+RfF+YiuDGkKRWQNf7N9aEehADAm1R5ZzIkQBBAFVqStfM5Svsr
	XQWQ==
X-Gm-Message-State: APjAAAXU1dmJ7JNR6VcOCP3u192MgUVHiRLd8VSzxAMSaoJb7qAWW87q
	+fMNlPBi3kcn4TE+t71E11PWhA==
X-Google-Smtp-Source: APXvYqyF6/B7CTd4rVbGtQMdpXO+6QkX2anhlMFDMGnZVK44nggKz+a/OXNG3VjtkzSabvvppE4ZBA==
X-Received: by 2002:a7b:ca47:: with SMTP id m7mr5832867wml.150.1557942536382; 
	Wed, 15 May 2019 10:48:56 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id n4sm3831041wmb.22.2019.05.15.10.48.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 15 May 2019 10:48:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1A8E71FF87;
	Wed, 15 May 2019 18:48:55 +0100 (BST)
References: <20190502081554.5521-1-arilou@gmail.com>
	<20190502081554.5521-27-arilou@gmail.com>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jon Doron <arilou@gmail.com>
In-reply-to: <20190502081554.5521-27-arilou@gmail.com>
Date: Wed, 15 May 2019 18:48:55 +0100
Message-ID: <878sv7mwvs.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-devel] [PATCH v9 26/27] gdbstub: Add support to read a
 MSR for KVM target
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jon Doron <arilou@gmail.com> writes:

> gdb> maint packet qqemu.kvm.Rdmsr:MsrIndex

gdbserver already has a mechanism for exposing system registers see:

  commit 200bf5b7ffea635079cc05fdfb363372b9544ce7
  Author: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
  Date:   Fri May 18 17:48:07 2018 +0100

for an example. As MSR's are very specific to x86 all this should be
handled via target/i386/gdbstub and kept out of the generic code.

>
> Signed-off-by: Jon Doron <arilou@gmail.com>
> ---
>  gdbstub.c | 38 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index 34da10260d..f48c3a2b5f 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -2141,7 +2141,14 @@ static void handle_query_attached(GdbCmdContext *g=
db_ctx, void *user_ctx)
>
>  static void handle_query_qemu_supported(GdbCmdContext *gdb_ctx, void *us=
er_ctx)
>  {
> -    put_packet(gdb_ctx->s, "sstepbits;sstep;PhyMemMode");
> +    snprintf(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf),
> +             "sstepbits;sstep;PhyMemMode");
> +
> +    if (kvm_enabled()) {
> +        pstrcat(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf), ";kvm.Rdmsr"=
);
> +    }
> +
> +    put_packet(gdb_ctx->s, gdb_ctx->str_buf);
>  }
>
>  static void handle_query_qemu_phy_mem_mode(GdbCmdContext *gdb_ctx,
> @@ -2166,6 +2173,29 @@ static void handle_set_qemu_phy_mem_mode(GdbCmdCon=
text *gdb_ctx, void *user_ctx)
>      put_packet(gdb_ctx->s, "OK");
>  }
>
> +static void handle_query_kvm_read_msr(GdbCmdContext *gdb_ctx, void *user=
_ctx)
> +{
> +    uint64_t msr_val;
> +
> +    if (!kvm_enabled()) {
> +        return;
> +    }
> +
> +    if (!gdb_ctx->num_params) {
> +        put_packet(gdb_ctx->s, "E22");
> +        return;
> +    }
> +
> +    if (kvm_arch_read_msr(gdbserver_state->c_cpu, gdb_ctx->params[0].val=
_ul,
> +                          &msr_val)) {
> +        put_packet(gdb_ctx->s, "E00");
> +        return;
> +    }
> +
> +    snprintf(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf), "0x%" PRIx64, m=
sr_val);
> +    put_packet(gdb_ctx->s, gdb_ctx->str_buf);
> +}
> +
>  static GdbCmdParseEntry gdb_gen_query_set_common_table[] =3D {
>      /* Order is important if has same prefix */
>      {
> @@ -2250,6 +2280,12 @@ static GdbCmdParseEntry gdb_gen_query_table[] =3D {
>          .handler =3D handle_query_qemu_phy_mem_mode,
>          .cmd =3D "qemu.PhyMemMode",
>      },
> +    {
> +        .handler =3D handle_query_kvm_read_msr,
> +        .cmd =3D "qemu.kvm.Rdmsr:",
> +        .cmd_startswith =3D 1,
> +        .schema =3D "l0"
> +    },
>  };
>
>  static GdbCmdParseEntry gdb_gen_set_table[] =3D {


--
Alex Benn=C3=A9e

