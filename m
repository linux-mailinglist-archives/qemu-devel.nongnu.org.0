Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE57667CE7A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 15:42:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL3RI-0003cU-JA; Thu, 26 Jan 2023 09:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pL3RG-0003Zi-Lb
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:41:18 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pL3RF-0001r4-91
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:41:18 -0500
Received: by mail-pg1-x52e.google.com with SMTP id v3so1157568pgh.4
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 06:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mBt1dKvrZnmZJ9r0CY6o8MUXWSw4wsdkbEnbiYAOcnc=;
 b=E8oS3tmHERxPP1yUHkuTCewlzj3mePmUhdpBH8Ns4XDnYQVhgIqU6m673SjVwdV6iN
 Bf+qu9alN2IYkPbtw+Ed1ypOlo97OfFCjyrOjcbHTVpuptzUcpkJ70+/Emln3eJbxs6p
 UHgvFMUwITG8poFRz4aokQZZfLdsyvAVRn8Ke5nCc6gNrSasPwVLzVtdroPyyAoG7aHw
 dcxyRFkThIkpOxGPly2jfcJTfDuKja6jTdMIBFybIAzcixx/gadkF7RPFaOwA799zAec
 ww8rIN2Qn3xtCiDyjCdGO3j6XAZyqsSsD9Bc5mDS+CRlpE0cH9OtFCTQqbf24hLVS/J9
 EkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mBt1dKvrZnmZJ9r0CY6o8MUXWSw4wsdkbEnbiYAOcnc=;
 b=luALWzCyOhoaPiRx48/RgH3gVp4PB/KCWYDT2h/RRGdphb8KPLbt51yO2754w5maNp
 giYv+HDFmsqocPjuYqnMEUWS5Zwa7+Ua3zj+/paj9+pxPrV6hUVODamC+5ww4QY/FCNM
 zjl3GAZALzrx0Fqf8DDbYdgoRavVqj+TLBQ/Np254/tDlsfqTBLOWQ/oOJ88UPFvl5zu
 IfbUAA3EGLt/p8BWKqOO0OqeHl7tpwQoBon3VjKleaInCkerqmDjGxwL08ciZtyI60/x
 4DrKm8Nl2M/5upmx1sYDPBJhY5k8CNsoLOBRfLZX+9K+B2X7UjtrrfeuDXYbQ6w4kkT0
 5TRg==
X-Gm-Message-State: AO0yUKVRNLTGYhY6nqukia0ridiHiGv/C0zuJgeGvD/C3kNawimWC3Tb
 C4MmmfP4gBTbe8O1OXbOaKn3C9+jTfB0O0fL+b9IMA==
X-Google-Smtp-Source: AK7set+sHldrjmjiimopqT9WtY68B8hsTqWwVg6VFN7h4m2YI7gLfECTqEruLA48YWX8U5nmfKLlwPA33o3tBTrW4MM=
X-Received: by 2002:a62:1a4c:0:b0:592:5cbf:c71f with SMTP id
 a73-20020a621a4c000000b005925cbfc71fmr18991pfa.29.1674744074951; Thu, 26 Jan
 2023 06:41:14 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
 <87pmb1pfas.fsf@linaro.org> <Y9KPuOT3NEAjN740@redhat.com>
In-Reply-To: <Y9KPuOT3NEAjN740@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Jan 2023 14:41:03 +0000
Message-ID: <CAFEAcA95Vtn5smOmVTX+WbS9O1Z4WX4H_p6j5iFh338o=Xcp5Q@mail.gmail.com>
Subject: Re: no more pullreq processing til February
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52e.google.com
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

On Thu, 26 Jan 2023 at 14:35, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> I'm confident we can rationalize our jobs, especially the cross
> compilation ones.
>
> For each non-x86 arch we've got two sets of jobs, one for system
> emulators and one for user emulators.
>
> IMHO the most interesting part of non-x86 testing is the TCG
> host target. We don't need 2 jobs to cover that, either system
> or user emulators would cover TCG build / test. Most of the rest
> of code is not heavily host arch dependant.

I'm not super enthusiastic about cutting this down.
I find the non-x86 testing is the most interesting part
of the CI -- most patch submitters and system submaintainers
have already done local compile-and-build with the common
x86_64 recent-distro target, so those parts pretty much
always succeed. The benefit of the auto CI is in keeping
the platforms that aren't so widely used by developers
working (both different-host-arch and different-OS).

thanks
-- PMM

