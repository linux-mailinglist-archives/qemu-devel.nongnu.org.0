Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3302D632ECB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 22:26:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxEIs-0005Ji-PK; Mon, 21 Nov 2022 16:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxEIP-00059S-G8
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 16:25:48 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxEIK-0008MX-3K
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 16:25:40 -0500
Received: by mail-pl1-x62d.google.com with SMTP id k7so11738724pll.6
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 13:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wTbYPztvLqxAmFM6Y7c5upJNK8OZaT5GK4OrKnPHppA=;
 b=qck8hi1rEfXsQ2Qk4rtUJQSMRx1IS3RLNjz3r8/kegboQB9yyms+YCHD4vq4HgE1Ui
 jDb+qP4WukEac0gsiOpqS68e4KVfFhNNlkjqGwztX1tDOkIr05hwwK9J7bTHXJH1h3tS
 VcZ67j3tiYwGWrLzmriqNwHiDdH9xb7P5/euKuprTnF0YlOSMjNI3f6iJbvmYDDSa8HW
 XOaYGRtSPCsmktjpEjNR/x8KnUwbGC0Mv5wj9aVUu5bzHtqBXvGLtEgwEzFzsfrkmR0s
 AF/0eaY/q1p1j35Hd3WBuxHGftKLfKi06vo24GdkNAeYficgXI1/MqKd69V575hhn4Sm
 eHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wTbYPztvLqxAmFM6Y7c5upJNK8OZaT5GK4OrKnPHppA=;
 b=jE6NArz7vIZ3+Bdn/1A1tPO5yrin7S5iBrn09NpRnnU8jDN+TB5LJYANJtG4rGmQUu
 ifStPpSxBfa7EuYoJdySTgOzSI8cio6Ct+TNgSjBUfzVp4VoCrp77g4Cfbmsv83k2IMb
 H8lsj3/4+7G+txwRUYE6LsH/U6Xghj/1jiKqYctA6/04+7j8wWjCdFn0U97tG9a5dhzO
 949Gyr7qP0sglzifhcW+iVGmTVJJnlnHcIlyYdg38NBoUqAJ8pU1AEXiM0faCoGoQ2Ik
 FDtpLWDJOEaY88xHmoK4WPwZRjOZ5cUimgHfgGshR58KLYQ6Sbc/g1zzw+JbfzqPakcJ
 rWJw==
X-Gm-Message-State: ANoB5pltHJvk2qmAiel39PH6n3ODB/VM6nOluNV8H3m/FlIuSeo17oP1
 fHAEmvXu2Qr3LqHGQqE/LSP3OGQws1ui1EX66CH1rA==
X-Google-Smtp-Source: AA0mqf6hLZZIjFduiaquzg6Y7yIn/UPD4SdHv7fL9utwyQbjVkHrrVfrNW+c0HNOTekJ1k75z7DeVAmvNxL8HzFGgog=
X-Received: by 2002:a17:902:6505:b0:185:4ec3:c708 with SMTP id
 b5-20020a170902650500b001854ec3c708mr3582817plk.60.1669065934601; Mon, 21 Nov
 2022 13:25:34 -0800 (PST)
MIME-Version: 1.0
References: <20221117172532.538149-1-alex.bennee@linaro.org>
 <20221117172532.538149-13-alex.bennee@linaro.org>
In-Reply-To: <20221117172532.538149-13-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Nov 2022 21:25:23 +0000
Message-ID: <CAFEAcA8pUJ6vVw0SEKg3tZ5jy-xcB-qd9_nXz2OTMNWP4yZdGQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/13] tests/avocado/boot_linux.py: Bump aarch64 virt
 test timeout to 720s
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com, 
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com, 
 stefanha@redhat.com, crosa@redhat.com, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62d.google.com
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

On Thu, 17 Nov 2022 at 17:25, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> From: Peter Maydell <peter.maydell@linaro.org>
>
> The two tests
> tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2
> tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3
>
> take quite a long time to run, and the current timeout of 240s
> is not enough for the tests to complete on slow machines:
> we've seen these tests time out in the gitlab CI in the
> 'avocado-system-alpine' CI job, for instance. The timeout
> is also insufficient for running the test with a debug build
> of QEMU: on my machine the tests take over 10 minutes to run
> in that config.
>
> Push the timeout up to 720s so that the test definitely has
> enough time to complete.

Just to let you know, this patch is now upstream via target-arm.next,
so you can drop it from your queue.

thanks
-- PMM

