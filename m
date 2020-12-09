Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 281812D3E9C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:24:33 +0100 (CET)
Received: from localhost ([::1]:55022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmvi2-0008NV-J1
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:24:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmvfs-00079N-UK
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:22:16 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmvfo-0006b9-2i
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:22:16 -0500
Received: by mail-wr1-x432.google.com with SMTP id k14so931832wrn.1
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 01:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=95HO/0BZoxpCtYsNzlxIAhEYL3vfeorrBiXgiRlUoNQ=;
 b=cGml8Nz0IZCj+nO6VH5cB+1u2/sRhCjI7Pv+kF+0zBK0Bvp3R++UG3xC/BUOLy5W/W
 AF/DaOP7EA6LCKLLd2iFu6d6DnYBk/yHYC/XtsoQYZt4w98pKDhh80566dXvIj2KfjTt
 xcccKmRh+1sF8kGwarZKnfIXAUBKZY62Inz/lO+dhfEf+rvcuJBd8lajHuRtgx0FmxiH
 7MA9NbxM0pJW2m9jLvJD+2Kl55lgbcTLnkwwul5dgcr8GrRtPXqaepqZui9zlUREdYtA
 KOjDr8LXaoDQvEUwdEyWLJxbdtvaPUaeCGtTmrH3mvOsU01eUCEPXqzpTNVAVhRp+sLK
 8ZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=95HO/0BZoxpCtYsNzlxIAhEYL3vfeorrBiXgiRlUoNQ=;
 b=kfM3B9MgtLZyS39VTUFjCD7X5dylBkNzk9ejERgUzd1the9O1W0M9G7kSzK8SpuKWr
 y37vCb+hGFNyBRTYiNPoJOP4LmCVhkKsYjqJ0KH8DRy0RRuix2bGgPDTWFIC5G9YXA1K
 gC+dgWlDqH1SKGm4AjBeIk7CAqCAh9yHxNdzUUKIxSbbnKw7rtUj11jG3IAKlmzhsdmb
 qLmMzOoAEJDZiwjOjC51Aqzy1owJKHWTwCLN3r8zOg0oaWHglrw6FVFHSp3H8+g7wPcn
 9xsjJqKMDOTWJsHM892q88Y6XptEA00AxkEfmt6fQZsjx+7n02Bpwk5/YKsshOyK1eqJ
 Wq8Q==
X-Gm-Message-State: AOAM531z8fGtV1dOV477LugXl1dqMWKsE/7uxt9kzdOHf0xFdh1YY6UM
 CV9aErxBJlVY+61K3Jk8S6BpGQ==
X-Google-Smtp-Source: ABdhPJwAirOIDdOD75UBMUNrU3v+XsTKkvoS83I0U+HeIAD2rTAqAgUfe7IKT/l02HOdGvh2ecCMxA==
X-Received: by 2002:a5d:4b4c:: with SMTP id w12mr1569084wrs.402.1607505730146; 
 Wed, 09 Dec 2020 01:22:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w17sm2112720wru.82.2020.12.09.01.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 01:22:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D20FA1FF7E;
 Wed,  9 Dec 2020 09:22:07 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-6-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 05/32] i386: move whpx accel files into whpx/
Date: Wed, 09 Dec 2020 09:21:54 +0000
In-reply-to: <20201208194839.31305-6-cfontana@suse.de>
Message-ID: <87k0trfi68.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  MAINTAINERS                           | 5 +----
>  target/i386/meson.build               | 5 +----
>  target/i386/whpx/meson.build          | 4 ++++
>  target/i386/{ =3D> whpx}/whp-dispatch.h | 0
>  target/i386/{ =3D> whpx}/whpx-all.c     | 0
>  target/i386/{ =3D> whpx}/whpx-cpus.c    | 0
>  target/i386/{ =3D> whpx}/whpx-cpus.h    | 0
>  7 files changed, 6 insertions(+), 8 deletions(-)
>  create mode 100644 target/i386/whpx/meson.build
>  rename target/i386/{ =3D> whpx}/whp-dispatch.h (100%)
>  rename target/i386/{ =3D> whpx}/whpx-all.c (100%)
>  rename target/i386/{ =3D> whpx}/whpx-cpus.c (100%)
>  rename target/i386/{ =3D> whpx}/whpx-cpus.h (100%)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b3eced829..20e079f40c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -451,10 +451,7 @@ F: include/sysemu/hvf.h
>  WHPX CPUs
>  M: Sunil Muthuswamy <sunilmut@microsoft.com>
>  S: Supported
> -F: target/i386/whpx-all.c
> -F: target/i386/whpx-cpus.c
> -F: target/i386/whp-dispatch.h
> -F: accel/stubs/whpx-stub.c

heh - we never had a stubs...

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

