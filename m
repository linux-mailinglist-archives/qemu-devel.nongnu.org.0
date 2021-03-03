Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7058C32B7B4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 13:07:05 +0100 (CET)
Received: from localhost ([::1]:43096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHQHQ-0004g8-Do
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 07:07:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHQFo-000338-7Q
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:05:24 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHQFk-0002R4-1u
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:05:23 -0500
Received: by mail-wr1-x429.google.com with SMTP id d15so8154303wrv.5
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 04:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=0gn+5qV0bx0SmqEnggEs6bR99RiLdR60zuGQvIhoG7M=;
 b=uNtCw3c//xSOcAxly3l6QhZfgHxZsBo6F3BH73z/+ZIyxAu/DyVNq/J6BmIgWp1AsI
 qjr0+zJ9jvKdSPo8tNOxq9N8Fl6qnCdOrItsUlZtZ7LqM8T/ztFRZbH9zZo70/frzKqC
 wpxhu5iQNcgzeH03dFM8VoCiMCD8++yj0beEqKaI+tw09S7t3001Ds1MZfo+QElE27HF
 dUz+1MoCja4uLrCJUODjO0NySXJBTqo+lWB4BDgzpwyZRgQc1LC4Y7L37wvYm56WYSPp
 zcolA29Qm/hnc4SalH9x3WnZBkGS96cXwcfT36RboZD3unI8bu7fXnndvxopAk0Pd8kD
 9UZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=0gn+5qV0bx0SmqEnggEs6bR99RiLdR60zuGQvIhoG7M=;
 b=SsLTUdVo1nwscY/8Tccvdb5MSLVJovJR4PWyo2KNfya2Ogro6Tcjuc+VHDx+sdEdGt
 E2lCc74KLakn8kI6L/ZtncLKSPtR8vIXaC34wi7vyPOSFA7XGF72I0p/bxcHsb5jtZnl
 yirndXLTulQ0YlJJERoZO0gSutl+oXeOix7eVQwtAxQCiZIlrDoU0fsi0bKUi43pmBij
 O69n5p6Amfe12N6EdXECH1c+E/7Z2GGUz8Ve5k4cJUguaWx6CVgWco1LsSoNtQr8NWAo
 fl7njMZJgHwPIz9eNrTFyQXS4ljV4anl9XRmnBdufSWwkhtt4PS0Hrr0hWhi9YaeS3aR
 6kKQ==
X-Gm-Message-State: AOAM530KDnIOocdnfgzGQGcETiFgQ8PSLH8RwrP/LatMddELndEWlVBP
 QmEPoPVCR5sgq+VbN3cAt0fjEQ==
X-Google-Smtp-Source: ABdhPJw6+VsoTQi01ichx6XeiIlpgJEfT+zj9gtpedwkNNQ1vB+pL9g2OrIuUIL+llGFebDVVY5Mdg==
X-Received: by 2002:a5d:4cd1:: with SMTP id c17mr27307067wrt.168.1614773116223; 
 Wed, 03 Mar 2021 04:05:16 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k4sm41530633wrd.9.2021.03.03.04.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 04:05:15 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B16F71FF7E;
 Wed,  3 Mar 2021 12:05:14 +0000 (GMT)
References: <20210205171817.2108907-1-philmd@redhat.com>
 <20210205171817.2108907-4-philmd@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 3/8] scripts/tracetool: Replace the word 'whitelist'
Date: Wed, 03 Mar 2021 12:05:09 +0000
In-reply-to: <20210205171817.2108907-4-philmd@redhat.com>
Message-ID: <8735xcigsl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the words "whitelist"
> appropriately.
>
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

