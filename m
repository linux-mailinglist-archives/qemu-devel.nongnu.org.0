Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E125C21683E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 10:22:38 +0200 (CEST)
Received: from localhost ([::1]:50174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsis9-0002SY-W3
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 04:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1jsirD-0001iO-Rp
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 04:21:39 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:45064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1jsirA-0007Yd-Sy
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 04:21:39 -0400
Received: by mail-ed1-f65.google.com with SMTP id d16so30996571edz.12
 for <qemu-devel@nongnu.org>; Tue, 07 Jul 2020 01:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m3PYqF8n5GoN2jqRnfjVJ/OPC4LHTtnjBVWtwlfV3dk=;
 b=EF6KX1PkSeW/z8OfWumPpL4A36V/XijUfe9GCEzMV0EYlyHSQoZQeiwcwE+KKUGWxg
 8D/Qxa0j+DHPCLiRRFo1dPcLitB0WTW5/jCGIgLeCpuSW+PTYZOWgMCrdqyEi0Fin+v/
 3EoPfJXE2vk3r27dQ7AM9vH+z4nUITiENc/MjIead8z+WUg4waYPFQVcd4CAKdYRg0LB
 q9+hRyD1Kui/qVFXSNm643py0JifkFOqnXbAcx7Bh8m72aZsrCA6/MPvFykN/HD5qaY2
 Qz2iWFr7RXPX6suCQ7nmie67WhBfra9uOpddZ+OU9y940CzWFgOioTIZ8mOIeaKN8ryr
 +EPQ==
X-Gm-Message-State: AOAM5320LahUDeHga9Y6n1TMWAeAjENyNV4X4Kn+BpIdCqV88EldBa4K
 fxcVnc6/zALp5TSczdmOdw0=
X-Google-Smtp-Source: ABdhPJz02nx8GYNxG269aweE9mI39FLROZG1OUNsLf8BRzXD2xwc/8I0P7MXBqubajZSgLe75tdNsA==
X-Received: by 2002:a05:6402:203c:: with SMTP id
 ay28mr50929580edb.271.1594110094935; 
 Tue, 07 Jul 2020 01:21:34 -0700 (PDT)
Received: from thl530.multi.box (pd95758fa.dip0.t-ipconnect.de.
 [217.87.88.250])
 by smtp.gmail.com with ESMTPSA id d22sm17693028ejc.90.2020.07.07.01.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 01:21:34 -0700 (PDT)
Date: Tue, 7 Jul 2020 10:21:32 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 1/4] target/avr/cpu: Drop tlb_flush() in avr_cpu_reset()
Message-ID: <20200707102132.679ce497@thl530.multi.box>
In-Reply-To: <20200707070021.10031-2-f4bug@amsat.org>
References: <20200707070021.10031-1-f4bug@amsat.org>
 <20200707070021.10031-2-f4bug@amsat.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.208.65; envelope-from=th.huth@gmail.com;
 helo=mail-ed1-f65.google.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 04:21:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=1,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>, Michael Rolnik <mrolnik@gmail.com>,
 qemu-devel@nongnu.org, Sarah Harris <S.E.Harris@kent.ac.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am Tue,  7 Jul 2020 09:00:18 +0200
schrieb Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>:

> Since commit 1f5c00cfdb tlb_flush() is called from cpu_common_reset().
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/avr/cpu.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> index 4e4dd4f6aa..50fb1c378b 100644
> --- a/target/avr/cpu.c
> +++ b/target/avr/cpu.c
> @@ -78,8 +78,6 @@ static void avr_cpu_reset(DeviceState *ds)
>      env->skip =3D 0;
> =20
>      memset(env->r, 0, sizeof(env->r));
> -
> -    tlb_flush(cs);
>  }
> =20
>  static void avr_cpu_disas_set_info(CPUState *cpu, disassemble_info
> *info)

Reviewed-by: Thomas Huth <huth@tuxfamily.org>

