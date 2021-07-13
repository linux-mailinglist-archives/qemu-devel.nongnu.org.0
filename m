Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680CB3C720F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:22:35 +0200 (CEST)
Received: from localhost ([::1]:47484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3JIw-0007vo-Eo
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ipj-0002Pw-NH
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:52:23 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:36502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Iph-00032b-Tu
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:52:23 -0400
Received: by mail-ej1-x62c.google.com with SMTP id nd37so41618183ejc.3
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IbtSxXy65d93OCAolaSe7Eza2KHxXd9LviRY/7eg6dY=;
 b=PuqW6oA1GM/OU/Xtu5ti0g6BJrBlXjDjxqrWpQwx9go80cKoy+7xj3bQ53G0oPYm1X
 I4yq9zNb1ZD7W2VIO4ec3YMMQqMoI6TdwNaobXaDcJzNjwWa0aBM78w8iiv8tVHW18vS
 fZwAJDriBHprYQyw7kec4MT7XVkVcFGRnaSWSuuicEP6mKLI/w6wWQQ7mLYAks3dYhOQ
 QepTOnXggQ20FcRwxaQgkBmZJv+9ehXp91W08UGOF7XaqtAPBiSrv292Yzm3qIirLoAM
 3LhceqsgPXnFUr3CteAdEhmbqJMWFT7LxB9azwXpef183q5HFxS3Y6CWudvt+yRAio4T
 Q2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IbtSxXy65d93OCAolaSe7Eza2KHxXd9LviRY/7eg6dY=;
 b=iW4bfEY30Of0Df6OV9z7aLVse40GD3RGaItxxFOkSYtZhBAcsxT750YY3hASs9LJZu
 kRH+00mQSNqmi8SFPh883wHtEXMTW88eBStpVd4jFdr1LdKX+sBWGuIOKoLpGr69pg2e
 uUQdDeHNRNo2LgaG5nF4kL+aTTrPQMawea+UYiwNlN3ydiCfXWHMf396EREZKdeS/j+b
 z3yVML8fLD+gPYbrQDxbq1LiFDWI2ZTJCvR/q+ecB/o8IjIhhWR2+qT4louTxOtfAHH6
 hw3S9CnaStso54Q2ssE1xE2XqahJwu8mMCSJlrNsM03FIaXoIXC18zkRZD0eKhJaHSHS
 MhrA==
X-Gm-Message-State: AOAM5325UzU5Nt7wQaQ9x9DWo9VNZj3Ct22CUUVKUxnVUjmmwO5M5dPh
 c7DaBrKHjwll3aHic4oIhoCBguUlian3dnrcAVR6TA==
X-Google-Smtp-Source: ABdhPJzq2pipzxiBsJ5qNhmWu1w98juR7a7hDxrFNUARP/me2Fu7UcNSi+c920b0H5dT5zJYA69uL0Zd13i7Tho94h4=
X-Received: by 2002:a17:906:f9c5:: with SMTP id
 lj5mr5862543ejb.482.1626184338677; 
 Tue, 13 Jul 2021 06:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210712130223.1825930-1-berrange@redhat.com>
 <CAFEAcA8_CaW5aPGt+PD6j5OfY7f=VztL6utk++Wg=OYcoawUqg@mail.gmail.com>
 <YO2Y+IUJ0aGHbgDC@redhat.com>
In-Reply-To: <YO2Y+IUJ0aGHbgDC@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 14:51:39 +0100
Message-ID: <CAFEAcA_zvegPHh0JwX0A8rAOEf+Ns6anFpUVJckBpjkyHFEQ7w@mail.gmail.com>
Subject: Re: [PULL 00/22] Crypto and more patches
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Eduardo Otubo <otubo@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Jul 2021 at 14:45, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> Can you confirm what version of gnutls and nettle you have installed
> and what distro this is

Debian GNU/Linux 11 (bullseye)
libgnutls28-dev:ppc64                  3.7.1-5
libgnutls30:ppc64                      3.7.1-5
nettle-dev:ppc64                       3.7.3-1
libnettle8:ppc64                       3.7.3-1

(If you happen to have an account on the gcc compilefarm, it's
machine gcc203.)

thanks
-- PMM

