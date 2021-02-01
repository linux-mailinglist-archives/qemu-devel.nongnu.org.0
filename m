Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FB530A673
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:25:45 +0100 (CET)
Received: from localhost ([::1]:42132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6XKw-0001GL-TJ
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6XJE-0008Uq-VY
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:23:57 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6XJD-0005nT-2b
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:23:56 -0500
Received: by mail-wr1-x435.google.com with SMTP id c12so16155901wrc.7
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 03:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=VG2MkLTxQ8I9Lh2My8ckgoRpl+QGsj89Svq3u+71jtM=;
 b=uqhLBTJXxZ3pjNuqmMtA4g6zVtYAgI0jUn7/LjW/N48ZRU4eCupg9bC33xdJH2i8CE
 e7yDcvj2QjqJ5I/8q/kf+1ZetXr1n3KGJCDF3+Ka3xe+mzSUMtFQnNtb8XPce19Xlc86
 HYM11n4fpVvF0zvgYDZ0/ZtK17aGEFhJnR+PsuZ9mOwiwGbp/aBfFrAgcs85MF4wn4Un
 W21I7UZf8KuwQv34WkxUhdFHVRclbshgEjn9vchDsiPo4G16RAwicRUN+ZTEMjLvtjBm
 lUSCreb+RTcmu7mYiij77Yr5dU3xJBK+eiEtmZV/TW59KEjAOePru1kTchhQw400YQ16
 BsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=VG2MkLTxQ8I9Lh2My8ckgoRpl+QGsj89Svq3u+71jtM=;
 b=iQ7Eyg5vASeJmbmO8twKr1dTeOal7IWk44Ywhb2qAYVi/X3+rCfv7xcVgTCzwEpif8
 m2BbmYjzre5+ur7B77V6Zkyla3YQ0C32JSPOw1ZdVPwX9gumFLR08JjBsfB2J4d/zvcU
 OxAbaKu6vn4KEJAAI8UBTFqhQ0efD0cnv/xHISgEwoaXIbzUmjXT5/T4v+PtY3heFPnz
 sFk4/SatEhE6caPfieo4ckWcJseRjGu8CVExNon4MiOMH03V2EF1xnxhgBylmggxVldv
 iJs9I3wImQGdc2XLQT1mL79p+Mr41sThxyup3xisWLN7j+vaqNF2W95Sweug0JskZA1U
 Bvaw==
X-Gm-Message-State: AOAM5322678bQzj2fRead6+izrAxLiY8ZclNkjgn2Drbx8psbi+rKPl+
 e5ci2SUaM+Hh2uFBG9ry85TWmw==
X-Google-Smtp-Source: ABdhPJw6TPMyi3QFNqPL/uipqnujiOz6+tjmGAeo8OnvCOHoEflC3JwnExynghCm0BKPzq5/PNm5AA==
X-Received: by 2002:adf:dd92:: with SMTP id x18mr17893772wrl.4.1612178633587; 
 Mon, 01 Feb 2021 03:23:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u3sm28397960wre.54.2021.02.01.03.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:23:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 93CBE1FF7E;
 Mon,  1 Feb 2021 11:23:51 +0000 (GMT)
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-7-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 06/10] target/i386: Move SEV feature to target Kconfig
Date: Mon, 01 Feb 2021 11:20:31 +0000
In-reply-to: <20210131111316.232778-7-f4bug@amsat.org>
Message-ID: <87h7mwvxo8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Mar?= =?utf-8?Q?c-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> SEV is an architecture feature, move its declaration to target/i386/.

In docs/devel/kconfig.rst we make the distinction between:

  **subsystems**, of which **buses** are a special case
  **devices**
  **device groups**
  **boards**
  **internal elements**

Are we treating architecture features as internal elements or should we
add some additional words to the kconfig document before we starting to
move stuff there. In fact I realise this is better directed at 5/10 so
for this patch:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/i386/Kconfig     | 4 ----
>  target/i386/Kconfig | 4 ++++
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index 7f91f30877f..3d67c172dab 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -1,7 +1,3 @@
> -config SEV
> -    bool
> -    depends on KVM
> -
>  config PC
>      bool
>      imply APPLESMC
> diff --git a/target/i386/Kconfig b/target/i386/Kconfig
> index ce6968906ee..27c76c554c7 100644
> --- a/target/i386/Kconfig
> +++ b/target/i386/Kconfig
> @@ -3,3 +3,7 @@ config I386
>=20=20
>  config X86_64
>      bool
> +
> +config SEV
> +    bool
> +    depends on KVM && I386


--=20
Alex Benn=C3=A9e

