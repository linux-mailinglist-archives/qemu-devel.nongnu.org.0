Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD6E689E59
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 16:34:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNy3c-0000bQ-Kf; Fri, 03 Feb 2023 10:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNy3a-0000Zy-SV
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:32:54 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNy3W-0007KB-Kd
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:32:54 -0500
Received: by mail-pf1-x42f.google.com with SMTP id o68so2581688pfg.9
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 07:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IduNa3R3rT4qpuefkuUYoR7/xojvFtY7ochTaTOAVvw=;
 b=RotKPMwICHqaUYua8nF3ECV4m+8tbI1thuN7A6xQ/YgmvSpvemb7n0HeYfNIiyhRJM
 qYDkdvf3yMkgGQSjPXJPp+pRzhlIFAK9FSNdcc2CsorfXtIdmfABg/2LesGEylSzyvTk
 hKjrLEECz/1Xj+YOhwWMqHWWlMPeN3w7VTWXOeqO9TiwGAsTZjtgC2Mu2R32KBXfYeSq
 qA/x9+688f7oonAnxFfZBh/JUf5S/QK6VKQonnZxAvEdv1arlT+g9RmpRygEL0vT0At0
 TacO0u/jhafd9o8oz39AP38CvimdpggIC5o2XISlv6KwgfZVJuPsk6P+gE6sqa7hCd1/
 pEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IduNa3R3rT4qpuefkuUYoR7/xojvFtY7ochTaTOAVvw=;
 b=1qzSjTkdG8kZkKWSewxKJVDAtsSoMqgW8Q4LAy46Pga2dnNAQZKt5ysy9biwuSW66k
 FONlSw/MoslB3xK22oJ/QGPowxgnLfiACisbNky+hyBCLcltfRyE2RZXxJ1Cs3Ml16DT
 sS9YpPMrIoGXawnjY/gTuG670K34XABtsHjDh11ugaf45o1dyN+NL3b8y7atS+s0f8Js
 NWlRfBTEuNHSSaD/+PmISrvklPKW2EAm2AQYNGhThYGb2y0ejGyBGKVYg5inxM/TLnXa
 0seUaPxlJkYgxyqrmChXFYeyJMIgLzUDabzZXwuPvtMy0nsKt31amCfKV0y2DAto4Yqz
 7W3A==
X-Gm-Message-State: AO0yUKWXSqdmVlqE6iQi1FDxv8ENKb/XY30zNJ1sqZHx4UjVoeJ9NCmD
 FatFXuiKKJ31+A5uHfOZ9dBTK3eOxsp74FQV7jjd7g==
X-Google-Smtp-Source: AK7set8TdynR/O9QmmcTde3mpAwfwyuLXNuonGXw98J+aAiAe6GMZW0aNlKuPvHT7bM7aCNvFUIqjp1QzADiBKSnvRc=
X-Received: by 2002:a05:6a00:1490:b0:593:dc7d:a31d with SMTP id
 v16-20020a056a00149000b00593dc7da31dmr2533341pfu.23.1675438368340; Fri, 03
 Feb 2023 07:32:48 -0800 (PST)
MIME-Version: 1.0
References: <20230203084549.2622302-1-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2023 15:32:36 +0000
Message-ID: <CAFEAcA_VV=_rc3tgYOVsYaHNyQs=WbKN4h4EA53wH+V-sRXKwQ@mail.gmail.com>
Subject: Re: [PULL 00/35] Monitor patches for 2023-02-03
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42f.google.com
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

On Fri, 3 Feb 2023 at 08:45, Markus Armbruster <armbru@redhat.com> wrote:
>
>
> The following changes since commit deabea6e88f7c4c3c12a36ee30051c62095611=
65:
>
>   Merge tag 'for_upstream' of https://git.kernel.org/pub/scm/virt/kvm/mst=
/qemu into staging (2023-02-02 10:10:07 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/armbru.git tags/pull-monitor-2023-02-03
>
> for you to fetch changes up to 3a1cecf486ee97d5750931f81706c6d447615f17:
>
>   monitor: Rename misc.c to hmp-target.c (2023-02-03 09:14:17 +0100)
>
> ----------------------------------------------------------------
> Monitor patches for 2023-02-03
>
> ----------------------------------------------------------------

Compile failures, multiple jobs, eg:
https://gitlab.com/qemu-project/qemu/-/jobs/3711453887

../monitor/monitor.c:292:5: error: no previous prototype for
=E2=80=98error_vprintf=E2=80=99 [-Werror=3Dmissing-prototypes]
int error_vprintf(const char *fmt, va_list ap)
^~~~~~~~~~~~~
../monitor/monitor.c: In function =E2=80=98error_vprintf=E2=80=99:
../monitor/monitor.c:297:9: error: function =E2=80=98error_vprintf=E2=80=99=
 might be a
candidate for =E2=80=98gnu_printf=E2=80=99 format attribute
[-Werror=3Dsuggest-attribute=3Dformat]
return monitor_vprintf(cur_mon, fmt, ap);
^~~~~~
../monitor/monitor.c:299:5: error: function =E2=80=98error_vprintf=E2=80=99=
 might be a
candidate for =E2=80=98gnu_printf=E2=80=99 format attribute
[-Werror=3Dsuggest-attribute=3Dformat]
return vfprintf(stderr, fmt, ap);
^~~~~~

The cross-win32-system job has more issues:
https://gitlab.com/qemu-project/qemu/-/jobs/3711453827

../monitor/hmp.c:1203:5: error: unknown type name 'DIR'
../monitor/hmp.c:1225:11: error: implicit declaration of function
'opendir'; did you mean 'open'?
[-Werror=3Dimplicit-function-declaration]

etc -- looks like some POSIX-only code is being built
when it shouldn't?

thanks
-- PMM

