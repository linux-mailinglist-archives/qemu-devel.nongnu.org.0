Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4992D6215
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:38:05 +0100 (CET)
Received: from localhost ([::1]:40540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knOxA-0002sx-SD
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knOdY-0006YQ-Nv
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:17:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knOdH-0001XO-Cm
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:17:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607617050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yyFXVCqyvgXpGcQCdumfHMkIW/gDBORKVwMiaKthX3g=;
 b=Vw0/EFsTUYcjBQcp1RLY4E3fj6YqmslZu6lWf0E72peq4XuuIPB3w5G4onkRbuwqi8PDyP
 /sKm/87a/9qu+lKz+F3Raj1KDTBf6xSep7vqg2RrHj+6Oex8SEj3FPtGH48WyKXOTNbQK0
 iW1t7Nx+Xl4VmxzcVQkM4Qbw2vzVAS8=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-H4fyBJVQPAynqM0E6YcnkA-1; Thu, 10 Dec 2020 11:17:29 -0500
X-MC-Unique: H4fyBJVQPAynqM0E6YcnkA-1
Received: by mail-pl1-f199.google.com with SMTP id x11so3527727plv.7
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 08:17:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yyFXVCqyvgXpGcQCdumfHMkIW/gDBORKVwMiaKthX3g=;
 b=quolcyCS05Jj9DsVr3k4uE0AxH0Xn7iAgVGe5wi2mXmZTpUx8JbpEB2LlyXq3zy4cU
 8evYRx5qoIfcpQji2mIoKOQLK4k2KkBubFPgE5GbhF5/mwxJAu5MAm2iOugquKimM1RC
 gYHKsJqt/i74uLJ11CPxKxa6eKebLBzDZxIbWFqWiqz3ooc48B6LAmQM19TeQvYmLE2P
 3rHH2XMQ5mYAxdgzm3eoX4U5c8v4Kju5t+NmY0EsKagi4Oyur8XRRZag2r1eue9MkBDA
 mY9HMDinVuFGoWvtj2QaIdPs1Zw3b0m6OyX1xzk6TzjyX6rd2+MgCbKyFVU//+vVQ4Bl
 Vlog==
X-Gm-Message-State: AOAM5337OqRZTcDGyfYEg+SyLNqef3EP+XpC8naaNxulfuGvR3w1nZB4
 yL+v31U+IfR5t+FX67ft7k21ke6T2r+/n5CwIThjrrg4DrdpffsuKF2italfBVaAp2u+WL3sDSg
 efTf9SuPDaHU2CfwhkjZbeijwV1kXxp0=
X-Received: by 2002:aa7:9388:0:b029:19e:648:6480 with SMTP id
 t8-20020aa793880000b029019e06486480mr7429740pfe.21.1607617048165; 
 Thu, 10 Dec 2020 08:17:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwt0HhH8JfIiTnEhuvV8ANvC0UA51tzHJ28ckW998QG0nY2MIYHFSmFaLMYhz3PJ34ciVklxU0Ybl1uSp1IjE=
X-Received: by 2002:aa7:9388:0:b029:19e:648:6480 with SMTP id
 t8-20020aa793880000b029019e06486480mr7429724pfe.21.1607617047892; Thu, 10 Dec
 2020 08:17:27 -0800 (PST)
MIME-Version: 1.0
References: <20201209180546.721296-1-mst@redhat.com>
 <20201209180546.721296-49-mst@redhat.com>
 <CAFEAcA9tgAJeTVPauNEvRfK8d9_-wAH_aQM6K+bXfweoX78m-Q@mail.gmail.com>
In-Reply-To: <CAFEAcA9tgAJeTVPauNEvRfK8d9_-wAH_aQM6K+bXfweoX78m-Q@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 10 Dec 2020 17:17:16 +0100
Message-ID: <CABgObfbNO8jWz-AR9WumNAh62un3hsHKcGOQBEshSzyQOHjP_g@mail.gmail.com>
Subject: Re: [PULL v2 48/65] libvhost-user: make it a meson subproject
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 10, 2020 at 5:11 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
> Looking at the commit, it's not clear to me why the
> vhost-user changes have resulted in all binaries getting
> a change to their link line. Paolo ?

Because libvhost-user/meson.build is not using the GLIB flags from
QEMU's configure and is not honoring --static, so whatever links
libvhost-user-glib.a will get the shared library copy.  Marc-Andr=C3=A9,
you can try using override_dependency but I wouldn't mind reverting
this instead.

Paolo


