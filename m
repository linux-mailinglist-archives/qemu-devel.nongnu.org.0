Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C21667389F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 13:32:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIU5X-0004AY-7V; Thu, 19 Jan 2023 07:32:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pIU5A-0004A4-6I
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:31:52 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pIU57-0006u9-He
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:31:50 -0500
Received: by mail-lj1-x22a.google.com with SMTP id y19so1927618ljq.7
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 04:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=inIKFIjepIsNlCQ0PCpQKJQkzXqVA+lw4YAalkacGcc=;
 b=CdJh2PJ9EWlHRRI11+IiFxMjaz0epfm9EWzSeoVDuhjPrJHVqzB+f+qxC20wHpPfSE
 AUaBqxSvp/zJG/ei6wBM4P1tfyn+3lg6VLNog/xFeAfECfO6+hJWIGfHucgZ7m4kwCm3
 V0XxdzwKuhTNjB6aBxI1OJID1M3wznD2JjDW485B1JJJ/50j3gUMkP8Uc/S9W/EZfNO0
 S0ewuSRmWuL+lOjrDHRk0ME+O7StqyASG9qQct2ufYobvwqHHK31gSNRgi4EUdZUMW25
 sctx1AOiWhJw+li7TegCASrkNAmS0suBipS9JTIFEbi2WXez7RWFHIBji1T7JJ0FPYAX
 FGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=inIKFIjepIsNlCQ0PCpQKJQkzXqVA+lw4YAalkacGcc=;
 b=6Kn2sbTjepUzcqF/HbxmxHVgxsVZKs3nInvbUQf505w20BblsZ06tio0sRRE7vyCS2
 pYus7aTvnKmzgS+VpI1F6/741GYPCwbgdYSDiRqLik1uSLhbwYJ1yFDTysmBTpRbmcF9
 mLJSV3qgPiIEB7ecAF6RKULO3nx1kVeiNUstJtCJfapJQDoIIWWMvsmjehx4TI/HrKoV
 d/eRgUjpcCDyTBiQFGbKESdPC2lxgr6YIhdSjWoG8fVUyvDP8iRW8FGEFYaLvPfTg5l1
 coIZigiIfRhvffUqQPscvnWEAKcsQJY8i7orL294S2cSV9BErkTgYgzjkh5jndMWolhj
 /plQ==
X-Gm-Message-State: AFqh2kr4JtRXJ0tRyIV6EcnOAMAU0W6MWVUVPBfAmPNly8k8phkqtTLC
 IQJDcrETzD8Hh10tQq6unOjnGZmIZ9s9X+jMDcA=
X-Google-Smtp-Source: AMrXdXuRKuk28f3kRez1gnAyQ4QY++g+5m89i/yAhfea98gW5vQTM5DMOnyram83PUgLN5o4By69oNDzQ0sdczDgIew=
X-Received: by 2002:a2e:bba1:0:b0:28b:75e7:c551 with SMTP id
 y33-20020a2ebba1000000b0028b75e7c551mr486475lje.463.1674131507490; Thu, 19
 Jan 2023 04:31:47 -0800 (PST)
MIME-Version: 1.0
References: <20230119120514.28778-1-philmd@linaro.org>
In-Reply-To: <20230119120514.28778-1-philmd@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 19 Jan 2023 16:31:36 +0400
Message-ID: <CAJ+F1CKDPn3z=NstwaJGj_0U5UksXWiAxPWR0CfRGsE138Patw@mail.gmail.com>
Subject: Re: [PATCH 0/3] tests/qtest/vnc-display-test: Silent warnings &
 explicit machine
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Paolo Bonzini <pbonzini@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>, 
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Jan 19, 2023 at 4:05 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> - Silent warnings on Windows
> - Explicit the 'none' machine
> - Disable on Darwin Aarch64 host
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   tests/qtest/vnc-display-test: Suppress build warnings on Windows
>   tests/qtest/vnc-display-test: Use the 'none' machine
>   tests/qtest/vnc-display-test: Disable on Darwin
>
>  tests/qtest/vnc-display-test.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> --
> 2.38.1
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


--=20
Marc-Andr=C3=A9 Lureau

