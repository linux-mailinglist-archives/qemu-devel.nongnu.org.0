Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E872D4281
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 13:59:58 +0100 (CET)
Received: from localhost ([::1]:33818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmz4W-0007mA-A7
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 07:59:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmz1M-00072p-1s
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:56:40 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:54497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmz1J-0005zv-DX
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:56:39 -0500
Received: by mail-wm1-x344.google.com with SMTP id d3so1386794wmb.4
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 04:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=855NnMYWSGty9ZAdl8fVwOqoVX0fLBlPvNyCHLUBmC8=;
 b=XfiTBTe7NOsGLF6Bjx2B3SWcmJQWRDA8hA+TIgwGfRI+vJhJEke8GO0oEdulaYGlCq
 1SSgIaa5rw+aT9c1LPdE8EZaars333UVZnSA8BHh4qonnbIUFudaSh79DLvFRdIp4qTt
 Q1E/Nzk+xAqcKpkKasVD+79MoblbCfKY/0+uJO6qDVGuAZF11366nfpYMYIUSpfBvM7V
 p44sKnsh9PbvGI8VbhXhzfPdnEySEJP+aUCl4yE8+0/ttaKtK35221pYXhSiNN+in7Dz
 R20gkBKwfZ9FgMEqIsvhVqCu+SDabAzuB6Yg3sRUAFjr+ec/G+fMddI3oq43Cb5zDG4f
 XlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=855NnMYWSGty9ZAdl8fVwOqoVX0fLBlPvNyCHLUBmC8=;
 b=LK5zfTNDb2rHwxHMSfZqTOShkqHGeGya/iM2nmd3eMT9e2dTW4psfGKz7kfWQ0MeLh
 5gE222I6H+e8VXYBx8LLlNqSQMeCHj7CEjvEi6AD1s3JkyDOiruTkJWmQKgelHHKFXT0
 kCWeTQNa7kf5tSdP76xX3CivU1LYZP2X8ZSoVa7vFx1TtYP7NBV0Da10VAUTUttwsjRj
 aQBlChNvI1w+B0thT1Vig3PQqQ2oJLTOEAfF0lEscepCJFvTrIDhHnO/uL65L0WMt8Jh
 IqImWdCeYUAxBbPghS94tLa+7HdMLyzp9X7rHUWdPijCuWWj5yy/lGVmZnMlnVDu4HY6
 e4VA==
X-Gm-Message-State: AOAM5303kcTmkCCqd8aAl05dfY+yyVvegwNxNdKF4k348+yZUTcu/v/T
 j5hUM7YCbrpNbs5BMJ/RGKYg9g==
X-Google-Smtp-Source: ABdhPJy9kcZDLSH5hH6Ig7PqNgg8O6xUjmzkoWHXM1ryYil/EaDf4ZU0XdeEGB752xo4Eb3weIgW8w==
X-Received: by 2002:a1c:5605:: with SMTP id k5mr2657891wmb.99.1607518594793;
 Wed, 09 Dec 2020 04:56:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 90sm3304947wrl.60.2020.12.09.04.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 04:56:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CF52B1FF7E;
 Wed,  9 Dec 2020 12:56:32 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-28-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 27/32] accel: replace struct CpusAccel with AccelOpsClass
Date: Wed, 09 Dec 2020 12:54:47 +0000
In-reply-to: <20201208194839.31305-28-cfontana@suse.de>
Message-ID: <87sg8fcf3z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x344.google.com
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

> centralize the registration of the cpus.c module
> accelerator operations in accel/accel-softmmu.c
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
<snip>
> diff --git a/accel/tcg/tcg-cpus.c b/accel/tcg/tcg-cpus.c
> index e335f9f155..38a58ab271 100644
> --- a/accel/tcg/tcg-cpus.c
> +++ b/accel/tcg/tcg-cpus.c
> @@ -35,6 +35,9 @@
>  #include "hw/boards.h"
>=20=20
>  #include "tcg-cpus.h"
> +#include "tcg-cpus-mttcg.h"
> +#include "tcg-cpus-rr.h"
> +#include "tcg-cpus-icount.h"
>=20=20
>  /* common functionality among all TCG variants */
>=20=20
> @@ -80,3 +83,43 @@ void tcg_cpus_handle_interrupt(CPUState *cpu, int mask)
>          qatomic_set(&cpu_neg(cpu)->icount_decr.u16.high, -1);
>      }
>  }
> +
> +static void tcg_cpus_ops_init(AccelOpsClass *ops)
> +{
> +    if (qemu_tcg_mttcg_enabled()) {
> +        ops->create_vcpu_thread =3D mttcg_start_vcpu_thread;
> +        ops->kick_vcpu_thread =3D mttcg_kick_vcpu_thread;
> +        ops->handle_interrupt =3D tcg_cpus_handle_interrupt;
> +
> +    } else if (icount_enabled()) {
> +        ops->create_vcpu_thread =3D rr_start_vcpu_thread;
> +        ops->kick_vcpu_thread =3D rr_kick_vcpu_thread;
> +        ops->handle_interrupt =3D icount_handle_interrupt;
> +        ops->get_virtual_clock =3D icount_get;
> +        ops->get_elapsed_ticks =3D icount_get;
> +
> +    } else {
> +        ops->create_vcpu_thread =3D rr_start_vcpu_thread;
> +        ops->kick_vcpu_thread =3D rr_kick_vcpu_thread;
> +        ops->handle_interrupt =3D tcg_cpus_handle_interrupt;
> +    }
> +}

Aren't we going backwards here by having a global function aware of the
different accelerator types rather than encapsulating this is the
particular accelerator machinery?

<snip>

--=20
Alex Benn=C3=A9e

