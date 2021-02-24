Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C78B0323F2D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 15:40:34 +0100 (CET)
Received: from localhost ([::1]:40174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvL6-0003lB-Dt
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 09:40:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEvJa-00035h-6M
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:38:58 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEvJY-0000LB-14
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:38:57 -0500
Received: by mail-ed1-x531.google.com with SMTP id j9so2827504edp.1
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 06:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v7ZxfvyazaMbxfOpvm9Hc3mGSr/aJWUBHGkiYF3e+HI=;
 b=cXlMAFU8H9EUUOeOcNiodUkiaUXA++7FxiWmgKMPifJ+rhdtm21wv95qzUPWAjmNtQ
 b+pBwhpCEMFvO0S5MwdtkgJN+K9gAsO7LcTN0Nm7zMxnz+7HGk/ctM8RdWQOkkmZ7Z3A
 vs01iwzhnpcL8sERjJqWcI647jCf+t5wHixl32LSwhew2FjDeklYEG8d9O0sxxJujUzJ
 l2ry4oX+LWhm2tv+kGXsDH3kUO669092tCg7QJAKzxQ6gbzZ2xmkaeYaWiw1eCXA5DrB
 RbMZDWfUDBmBcItQ0SwLug6jBWlDLYRWKjiuqkzt3TUzDwGH0tI+7kGgdwkC8/emlBPH
 l/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v7ZxfvyazaMbxfOpvm9Hc3mGSr/aJWUBHGkiYF3e+HI=;
 b=hE8eWIiZ7X9tYC/5I29E5VtNm2qu9eitdpcQYK4MUoW9TPhzHvtWeOvLVsTIACUf0X
 73jHEcbqnCiR9z8s5nwZBdve9CmXi1ZP4kLcVYdxB1IRKF5h55RFjklp72MURmpJxp6F
 Q467tTzvMVyf7P+IzFEN7W/HPpGerN8OARA/G5NS/jBKOGv6+D+hOZzCm9ZJjHd7SQmF
 JtaRtuxJyXOBdNBzOr6vrtZSvB425LV0HsMrgnvv8h03B1lpPHyzsENV9/ovEzZhI1R9
 Q0zirNirYL+45CL4PvqHjYacrEFCQthRHM4D+D8ga+giv8taYFB1UzprE3nBXi5gLgZQ
 QMAw==
X-Gm-Message-State: AOAM5311qRXP0u1VNTSNMeMB/pjcFX+LINKLRbOpjvAG/iFikT/cOOB6
 K+8Cz1dJGusxQuRgEr3cOrEbIb+7mFaiawx3n+dBjQ==
X-Google-Smtp-Source: ABdhPJzQQ+FjSvaealcu4IPsCG0DRu/ImMPxaWxwP2KzbxTUQP+K/uqv60AJmQ2/NgGaAT83RWezxDJ05V5LAINIKWY=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr2693760edt.251.1614177534422; 
 Wed, 24 Feb 2021 06:38:54 -0800 (PST)
MIME-Version: 1.0
References: <20210224131142.1952027-1-berrange@redhat.com>
In-Reply-To: <20210224131142.1952027-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Feb 2021 14:38:43 +0000
Message-ID: <CAFEAcA-Dvdg3L8rZT=yxjct-EkYcUzWAu2AZY67dKO6cRcvXzA@mail.gmail.com>
Subject: Re: [PATCH 00/14] deprecations: remove many old deprecations
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Libvirt <libvir-list@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Feb 2021 at 13:21, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> The following features have been deprecated for well over the 2
> release cycle we promise
>
>   ``-usbdevice`` (since 2.10.0)
>   ``-drive file=3D3Djson:{...{'driver':'file'}}`` (since 3.0)
>   ``-vnc acl`` (since 4.0.0)
>   ``-mon ...,control=3D3Dreadline,pretty=3D3Don|off`` (since 4.1)

Are the literal '=3D3D' here intended ?


thanks
-- PMM

