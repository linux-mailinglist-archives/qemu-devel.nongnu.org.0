Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852742CD335
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 11:11:00 +0100 (CET)
Received: from localhost ([::1]:45392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kklZj-0000dp-KK
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 05:10:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kklYe-0008Op-5V
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:09:52 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kklYc-0002mK-EM
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:09:51 -0500
Received: by mail-ej1-x62d.google.com with SMTP id jx16so2565607ejb.10
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 02:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jeYClCn1RDRSmPiVYNNBkeTnMadFm3vCsSSiBhTOJoU=;
 b=NdMVLMMcmg0jEJtzQzftQM4VY0MMyTViICgzol8mVO9mjiWEkxvgikrIUmrsMA1d1c
 YpHnarYhttP1LAIQPo9/4ZG6MElq4obd8Xoh59+OztpgS0xcM/0wO38b1BeKmpu0EP3A
 V1m6bPp6qS5K2vDTjo0VdKTcM6hnQSugh9PH4HPt1eZtXbMwZKqZ57xcVCNKIgG96r33
 5CZx8nVIybSejd73+o9oCd0327hsYj5GextvFZggpHJXhkVAr+iH8R33gE1YkawZKuNO
 ySfDfDj3+5dPKNZGeBf21BPMqMlNXih01vqHMwIusDKX5SRs6AvO/BlQDVkGGN+dnK1n
 Oc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jeYClCn1RDRSmPiVYNNBkeTnMadFm3vCsSSiBhTOJoU=;
 b=tlaUpOHTKIyR+NB/XnezgqSR0feyQJnTe4r75T07VR4OlBu1r5DS6toUfiysxypuc5
 Kc1rOkTncElIkDA57VeQGeEtVgnd1Fn66r0Kvc+WXoko9yi97cM5LnJnN0/6KKarBb3J
 +/ZTdqjEuSgLrRgW393L+Yh+oKtaSGhhmU5bXJTVPfhau7YSqdvnkCgNu/Cu+yAMmt5r
 XEHcy2CECP4EcvtVFiLolPSvq8ER7mbsf93N8SE6sb3S0lRnoYmycASlVz/GjUK6fY6d
 /bCQTQGuRF+pvqECqNOKTee2p8gYi2VO272oJhVZTQLOk4m4Rqn7r9v3Pdo/CBiaKwm9
 qr5w==
X-Gm-Message-State: AOAM530JaOXvQlzlIF31uRzKY76PGuxKE5Izh7C65eNeh0DxDKJf2J8p
 ypvmgUG589C9xGIHGVJ6meRStzO0EH5LDZNqB0PZeQ==
X-Google-Smtp-Source: ABdhPJzQE2yPSpBQ05rWd5/lCCq2XAsCQN1xCXHdgjbHryUuU1HjYx1QkMhmeNl6di208BOvNA/83r9RAJRuWhgB6Yc=
X-Received: by 2002:a17:906:4bc6:: with SMTP id x6mr1826999ejv.4.1606990188526; 
 Thu, 03 Dec 2020 02:09:48 -0800 (PST)
MIME-Version: 1.0
References: <20201202215747.2719507-1-crosa@redhat.com>
In-Reply-To: <20201202215747.2719507-1-crosa@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Dec 2020 10:09:37 +0000
Message-ID: <CAFEAcA8o8hCBTJakir4wpE-w_bQCaMmpAiYVYyp=19fqNqmEJw@mail.gmail.com>
Subject: Re: [PATCH-for-5.2? 0/1] Acceptance tests: bump Fedora to 32
To: Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Dec 2020 at 21:57, Cleber Rosa <crosa@redhat.com> wrote:
>
> I believe this may be a candidate for "right now" because the code
> changes here simply sync with external infrastructure changes, that
> is, the retirement of Fedora 31 from the official repository
> locations).

Strong "no" at this point in the release cycle. Only
"this is absolutely critical because QEMU sets users'
machines on fire" bug fixes at this point.

thanks
-- PMM

