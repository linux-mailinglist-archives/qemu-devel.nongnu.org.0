Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BC46A3FB8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 11:55:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWb9K-0007eG-Pq; Mon, 27 Feb 2023 05:54:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pWb9H-0007e4-Dc
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:54:27 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pWb9F-0006Ha-Kw
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:54:27 -0500
Received: by mail-lf1-x134.google.com with SMTP id f41so7901530lfv.13
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 02:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O64y4A8y3oJUTJ4dBf2XXfcwtfosjsn9dguBnxrQHyg=;
 b=GbW5mnQ19r7xlKdPaZgdcOkGFeQcsqZprS74M9iie71ld5xq5maPgYu57w5AUiFSvx
 /aOdVv0wR8Q5j3KNRkE+WEJiIg8zUq4ev32qrTBH491q+fubhLMydPxYC9B0S7uAWs65
 9e1rIiQvfB3PoPoqXWAIiDZ9mPwKIPdPJ1qwKH5vImn9NEy2n2KMouPol5PmJsvFFlLb
 jYKpeC0Z+zGsGCWm5XTlRBlMjzBQmbGvfBtcbZ7cWSzMTgBjAdcsIDFYTHCEwXAaIpUc
 nDBfuCjUHSWMyImcLS2IcktVHsDz1EBrjGyjNoYCR1xsixDLksN2cmAFerJuIzqbg7Et
 0Qkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O64y4A8y3oJUTJ4dBf2XXfcwtfosjsn9dguBnxrQHyg=;
 b=slTUYnTzVMk6IrQWytn1cYRoUcnG34fWxqB8F119OSgr34S/0svZ6bUEPnzu7ZV7vB
 FTvSAE3bGgQaP2hsBOORcmGQ3TnX9oAA4OwIUkJFnZxTPfdX4zDYk+TWJdq4cKdpc7vU
 FkuuNOcRF9iL1KUsj9mpAH1v1iuZ3e1b7rejbTAL/OyJ0tY/rlbWWHrY+VNqfKZGZT5u
 VHZbxOP1wNog2lb9bpWatjk02Gp5Sk156/nzb4b5S/lDfOwa2o4kGAc9RPsrzR3nmZJP
 7KPQs5V9bpnLHY5SzeB+KApFc1pLgthqCf5UYOMm4lD+l3IsL2i88D7z2pPkWb6SOl3I
 keJw==
X-Gm-Message-State: AO0yUKWSaqTLNFCx6G2lWgkqLA24quXpCiPVEbC2JgRFQq/1/7nUBTtn
 qwZwDxy0dvu2qGALEzai5M15QqNsR+TYjI/9gmg=
X-Google-Smtp-Source: AK7set+5iTCMfeUsl2U5TAeg9LojpUpQglTboKmhT9gpBpx7zXbAf+7ZHEZ4+cSLVx45Fc4q5ZV7qsQ2ENuXOUo6s5c=
X-Received: by 2002:ac2:5204:0:b0:4dd:a025:d8c with SMTP id
 a4-20020ac25204000000b004dda0250d8cmr4698315lfl.5.1677495263306; Mon, 27 Feb
 2023 02:54:23 -0800 (PST)
MIME-Version: 1.0
References: <20221130135241.85060-1-philmd@linaro.org>
 <20221130135241.85060-2-philmd@linaro.org>
In-Reply-To: <20221130135241.85060-2-philmd@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 27 Feb 2023 14:54:10 +0400
Message-ID: <CAJ+F1CJu-5OYJHCtQ1dRAOUs4O4h2CrxS_eLNV_Qs8GeQpJx1w@mail.gmail.com>
Subject: Re: [PATCH-for-8.0 1/5] cpu: Remove capstone meson dependency
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x134.google.com
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

On Wed, Nov 30, 2022 at 5:55 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Only disas.c requires capstone CFLAGS, not cpu.c.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  meson.build | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meson.build b/meson.build
> index 5c6b5a1c75..92d449f854 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3097,11 +3097,12 @@ if have_block
>  endif
>
>  common_ss.add(files('cpus-common.c'))
> +specific_ss.add(files('cpu.c'))
>
>  subdir('softmmu')
>
>  common_ss.add(capstone)
> -specific_ss.add(files('cpu.c', 'disas.c'), capstone)
> +specific_ss.add(files('disas.c'), capstone)
>
>  # Work around a gcc bug/misfeature wherein constant propagation looks
>  # through an alias:
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

