Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D9269E633
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 18:47:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUWi4-0001P3-2j; Tue, 21 Feb 2023 12:45:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUWi2-0001OQ-8F
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:45:46 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUWi0-0004Up-RU
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:45:46 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 na9-20020a17090b4c0900b0023058bbd7b2so5477059pjb.0
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 09:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IhD83yxvzDaHbqeI26AP+r9/NfMFFQ9TlhAHai+e6DY=;
 b=UsLtMC0njip9tDsoOPmx6FVGidNP7m6Sgmka3Qa81vtkgFchjcnTF+J7z5ewovt4xm
 2AVqOZGcZ4hTMKAaBIjCtZ5AfsCZAmGLGIPqlzM/7e9yBtc8XmcwWkpmMHujyOLBItw4
 glDPQfw/8cWfASCVam8+8g15VpQ8Z+Lkx/5lFytDcBirvKkgdavrzseXN7GgRWg7Ggzg
 PmHGpZj3VauCZ7eNofdIrRASUVirsIx4B1xRamCF1t2o3dmEeEDO1/NCwWWEEvtAELYt
 W2fQx+dbIrdgjEB+FpNSbYRgI7UrtG48rMFSwx8mMlizVK4CbehukLnpzY3gX0TYnjX7
 VJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IhD83yxvzDaHbqeI26AP+r9/NfMFFQ9TlhAHai+e6DY=;
 b=ZM4tg1XZ7uMC/pCuIGWGKE0ZvRJKdZXY3eZX4gTRvNICGvjI6hNcp8lzXCyaWlDeyl
 3ld/QrtoBxuFm0cMGmN+wKFnPfykmks6ErVIIofVsM857XNDQCIANjQEN1yZS6SS1aPS
 GK9xL7z7RigrfOuPF1NX1OIHfE/asm9oAXU+CGWeF/T6+PG65TrVsgy8VPw2JMKgE5Cw
 ds31H/nn0bIW50KSiaJ1gCApoJTUmjib2qk7zuqcZsfWZvRat3uadIxL3ZwmFOdfv7ms
 3C3hI3NFAmDI7uURecL++MHVtjvrnt/jsy7Ex/Llv0K3f2FZMDDm9sKS2N/RvuxpQCn7
 L1zQ==
X-Gm-Message-State: AO0yUKUJmBUrW3Ukfr4oHJN0oV1HLdKvO0cvCFrwUppW54Yl7wtokHH3
 oHqtoXevVi7XOayzFyXxqyYhM3SbfweyNLxPyFe3mA==
X-Google-Smtp-Source: AK7set8Mmn837QaoFjzsjBTnHcQY7FW4zVBaX+9I0S14rO3u6jTTdVCLXNccL8hK0Fqmq0KgjD+TebrEG9CCQOqUEhM=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1939456pjb.92.1677001543194; Tue, 21
 Feb 2023 09:45:43 -0800 (PST)
MIME-Version: 1.0
References: <20230220115114.25237-1-philmd@linaro.org>
In-Reply-To: <20230220115114.25237-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 17:45:32 +0000
Message-ID: <CAFEAcA-FT8aLaOzH96Zmvw9yZH5L37TnWpirFwVFC8QUdZqAVA@mail.gmail.com>
Subject: Re: [PATCH 0/8] hw/arm: Cleanups around QOM style
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 20 Feb 2023 at 11:51, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> - Reduce "hw/qdev-properties.h" inclusions
> - Open-code various QDev helpers used few times
> - Use QOM cast macro when relevant
>



Applied to target-arm.next, thanks.

-- PMM

