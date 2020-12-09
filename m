Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F6B2D4050
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 11:51:08 +0100 (CET)
Received: from localhost ([::1]:37092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmx3o-0005EL-OC
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 05:51:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmx2Z-0004Xc-7u
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:49:48 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmx2W-0002yx-RZ
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:49:46 -0500
Received: by mail-wm1-x343.google.com with SMTP id a3so1150312wmb.5
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 02:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+isKnzEPdeZ32cOZ/ZbwORZbWAyIgrtDt6GJNZjHPA0=;
 b=uTyREvVfTqLirLeeKNbf2z4DTmNNqcWOyP4mc6ymYGG6Fb0VW5aUNHxI2z6El1ePdO
 BU5ySdO19Q69M+bexQDD6rIyRk83ckjT3UaUzxU/GnwmlatRu1J8eo3ElWC/QeaCS3u1
 NLrt0VpYt9TggcuFy7Qz3CVJP+EIdECOjUO+L0ZlPOOHxKWVZvz7VIxAyoxD8zGKDhVm
 iEOce5xw69VjyNxbrShhW1HuD9vwMPRIxd+6RcPWqLGeLjhp7JmtM6ZQCjMJCJFtrMQx
 d7aCmI0yaiT00n6lxx+1FB0YpJZrLuED3A4RjWZaNSptvi3jDq+cuXHMytn/xI7Qunp1
 tMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+isKnzEPdeZ32cOZ/ZbwORZbWAyIgrtDt6GJNZjHPA0=;
 b=cGcnY7Lq//ExwtUDoTNKxr3+2JWtyoGEY7E2HmbjwW0DWFA/XcmPkQ34Ze1nE2dL+W
 WN7sPAE8aNy0rhDS+AalrHt/ophVlarmNZkBCFtqiI6rRLs0oYkHBpB211GrCxFaRL+z
 bGtNLaDYEKemg7CI8gD5t7NUR5Qz7tzih1gOPiNLzRgzj5dJ5iAV7rdeaqKk8y8OKZUf
 hupXf5U/Hb2njoqWhCoDYI3oDjyzBZrTNTk9rywrSqmRMzPaIhJAa/KMhu7ubX9VB8LB
 vMi/6ZL21uYLJ5gQCu0ioIc6ckls3xlN4WcPwaRxDHJbhDccOBKjSD+tinE0d5sblBfB
 DpLg==
X-Gm-Message-State: AOAM533oM6I9WKkdOBR0iWtObYMsrSc+vI4ugylfu6vj89jtUl4AOQ7f
 bhvEW1ZhzvUyplesGKewV6glWg==
X-Google-Smtp-Source: ABdhPJzP5CWNqhHQuYDbEMTq6Tu4TD84Ccci+O19eiUkSXa9rDjtcpvy7cIvp+gTgRaN6Eq9+ErRYg==
X-Received: by 2002:a1c:2316:: with SMTP id j22mr2127977wmj.82.1607510982299; 
 Wed, 09 Dec 2020 02:49:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r13sm2565253wrm.25.2020.12.09.02.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 02:49:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3E5451FF7E;
 Wed,  9 Dec 2020 10:49:40 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-18-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 17/32] accel/tcg: split TCG-only code from
 cpu_exec_realizefn
Date: Wed, 09 Dec 2020 10:42:54 +0000
In-reply-to: <20201208194839.31305-18-cfontana@suse.de>
Message-ID: <87lfe7dzjv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> move away TCG-only code, make it compile only on TCG.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  accel/tcg/cpu-exec.c  | 28 +++++++++++++++++
>  cpu.c                 | 70 ++++++++++++++++++++-----------------------
>  hw/core/cpu.c         |  6 +++-
>  include/hw/core/cpu.h |  8 +++++
>  4 files changed, 74 insertions(+), 38 deletions(-)
>
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 64cba89356..436dfbf155 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -801,6 +801,34 @@ int cpu_exec(CPUState *cpu)
>      return ret;
>  }
>=20=20
> +void tcg_exec_realizefn(CPUState *cpu, Error **errp)
> +{
> +    static bool tcg_target_initialized;
> +    CPUClass *cc =3D CPU_GET_CLASS(cpu);
> +
> +    if (!tcg_target_initialized) {
> +        tcg_target_initialized =3D true;
> +        cc->tcg_ops.initialize();

nit: it makes no difference but stylistically it makes sense to set
tcg_target_initialized after we have in fact initialised.

Also we've dropped the tcg_enabled() check, if indeed it will always be
true should we not assert it to ensure the statement for tcg_exec_init
remains the case: "Must be called before using the QEMU cpus."

Otherwise LGTM:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

