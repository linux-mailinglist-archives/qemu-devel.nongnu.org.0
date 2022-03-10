Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B25F4D5359
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 22:03:47 +0100 (CET)
Received: from localhost ([::1]:54902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSPwn-0000gX-BW
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 16:03:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nSPuk-0008In-1s
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 16:01:38 -0500
Received: from [2a00:1450:4864:20::42c] (port=43526
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nSPuh-0005a8-0U
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 16:01:37 -0500
Received: by mail-wr1-x42c.google.com with SMTP id e24so9834281wrc.10
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 13:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NPngQpvjjYYmggdSKWW0l24H2JxS64ygP7EHlkX+SRQ=;
 b=iVPzrq3kwcgkutaI+60VcJCIoUsqYg1KBTUbKVXu3cgiP5qN2gIUPf54p+tK199wa0
 qUFF9EFSir9okRY84G12t2/e0dOGiCFeaC8U+inkFOVR/IvZ3j42aduyfIr2EpvJEaAz
 VK791qF1ZMfPsoOYGE07UbZmXT3h/e2hHvTlyuyc7+wrvsyhXuCdcPSBdgDNkWONFtWu
 2HVfORucHjYrQOiG1yeNbvqXbuvzfUWc+lGfA21fN8dK9sK3z9O2NfuW9guad5Q3OymF
 Bf6hzHAD+xSg1NuabkZjCl6+uIKbVOLCcVIQo2QIZOAZQQqJR+OaAYTIHCjDGZrsu+Qy
 Cfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NPngQpvjjYYmggdSKWW0l24H2JxS64ygP7EHlkX+SRQ=;
 b=iKPPWWmoej8M6g3r6TaBoCqqL3ztBzHZFtyWDiicEnkIaMGnV5GAa2E0VxPPZnjM28
 ZDg6B4G1T5QtKQKWqmNPJyvltN6OsnBFUa+q8AASWMYats1KYeJVzZvbTeYEk1mcEY2a
 vCDbo+Xqavd26T1Um5FkoEsf6ludIG1Jj1hXVAxGHpuBS66rfErZqydolntCoCDHiuVX
 CWyjvQ9Og3+geNiuVQg8Wv/rJxyXfvA1BMn0TrEv0w6KKWYXm9ldPsqJPoxhMY/wQxiw
 1gJixp87ncV96BBi6X5sfGfk03VD7f0gQ3hURkR0sbRvdAGA/Sy8cILDLVPWOTVB+4G6
 lFFQ==
X-Gm-Message-State: AOAM530HwTg1OcV+5Jy7KoSXzT4JLdKqAWrFHeyccBYL8WHvzhTTbtMO
 WV2DUByz0znq8AGl/1IXUlT7kIrJ/lMdGiaW7CVK6ygIeNo=
X-Google-Smtp-Source: ABdhPJyPcvT0aZDFVdQUFwEPNG/shTDsWOXl4aGUPillTSZDKaGNoOc2Biwp0dI9R1uJcQ4lF+8MTOgRxpP41eScMjk=
X-Received: by 2002:a17:907:1ca4:b0:6da:86a4:1ec7 with SMTP id
 nb36-20020a1709071ca400b006da86a41ec7mr5715558ejc.556.1646945636357; Thu, 10
 Mar 2022 12:53:56 -0800 (PST)
MIME-Version: 1.0
References: <20220310115502.3311-1-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220310115502.3311-1-philippe.mathieu.daude@gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 10 Mar 2022 12:53:44 -0800
Message-ID: <CAMo8Bf+9U4O-is7Gb+pOPx1nzrgJQzw4jNOyK97iBKeGctM-EA@mail.gmail.com>
Subject: Re: [PATCH-for-7.0] softmmu: List CPU types again
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: 18
X-Spam_score: 1.8
X-Spam_bar: +
X-Spam_report: (1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 10, 2022 at 3:55 AM Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Commit e0220bb5b2 made cpus.c target-agnostic but didn't notice
> the cpu_list() function is only defined in target-specific code
> in "cpu.h". Extract list_cpus() from the generic cpus.c into a
> new target-specific unit.
>
> Fixes: e0220bb5b2 ("softmmu: Build target-agnostic objects once")
> Reported-by: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  softmmu/cpus.c      |  8 --------
>  softmmu/cpus_list.c | 36 ++++++++++++++++++++++++++++++++++++
>  softmmu/meson.build |  1 +
>  3 files changed, 37 insertions(+), 8 deletions(-)
>  create mode 100644 softmmu/cpus_list.c

Tested-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max

