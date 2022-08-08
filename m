Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDFE58CD61
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 20:10:08 +0200 (CEST)
Received: from localhost ([::1]:35876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL7CY-0001iU-Lx
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 14:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oL75l-0004ZP-Ii
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 14:03:06 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:44895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oL75k-0002bo-1c
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 14:03:05 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id g5so14810663ybg.11
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=2xwJ0b39ue5yOrzP0z1qgthjGBsrgkQfgDilgQG3d28=;
 b=YmeHabAntfOLH9bc2FZooJRgRrGcWBRn87iZPZozc6CIU6qGp2p2fe+X/K7LhSg+6v
 k8yA7lcB9EyLOPrqdhyLVjF0pp71Tgnc5WjwuiV8QLdYqYKnenCp7l3eLzTROkHw8Std
 DC8atrpVT6p/re5zUM4ac0c1FVSwePPQf5+QV0SY/9UI4Cm0DRwgc994ZuW6Zuqhr+6y
 2BU9nJaS5nPZFV6Mpyr1f6zxSWeC6SvC1ka5aWRoUzyjb0ZaMJlvELf2WkYxxLUSmEQx
 GLNlFexmQmSTcdFWFw4KwmUl4Ws4CFd1by0v5S3I/+XEjfL1aJEbELfEmr7DMkA5A1/I
 OUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=2xwJ0b39ue5yOrzP0z1qgthjGBsrgkQfgDilgQG3d28=;
 b=vQ6p83HAxQHpmEXPKy2y81PUq11+FqvOEn1auTMX/xwx2CltiWNTAaF9+VLqVwqn4I
 r1QOeWepIfwrDJqq5UIGjEN20DxD8ABGhsnr2hUA4g797fuMKwB3dyFfeJLlqVseNcLQ
 vkF6D4q03amPGmQAk75nfNYCIbJKlP5gI3tx6Pbigg7YESEkYFpxHpzV9eyHDxkqnk8j
 Ah1+L032QhjWaR8Rdz3OKCBnb3hwSDsDg0mwFsAJOLF2vR1W/1o+x/DlvzPYp/LuIT1a
 iqgcf7r2dV9cnlExdztmtJfiXaUHlTIjMOQv60W0pBkzmEsQKHuFAnPN6U6aN085j6YH
 WcTw==
X-Gm-Message-State: ACgBeo25BN8Tu9XUkbGA+h7LBl4Nagoiwh80Urh/3NiYsqG5S4Kn0/1S
 rjZcM63tKtR8EFnswnkVLp7hXmiKIlkt1GOfsrE2xA==
X-Google-Smtp-Source: AA6agR4+hZod27yitz4T38Ep2WruR8VgRJkgUlrRz+WK6beTNDG4zbKbAx+lnaP6F54lH35ppecuG9elfBiHC7FjZ+E=
X-Received: by 2002:a25:d4a:0:b0:671:6d11:d14e with SMTP id
 71-20020a250d4a000000b006716d11d14emr18053461ybn.479.1659981782068; Mon, 08
 Aug 2022 11:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220728115034.1327988-1-imammedo@redhat.com>
 <CAFEAcA95sRW8u2NFDa1BX7uNg2t85Yr_kPgWWC+5QnJobygwMA@mail.gmail.com>
 <20220728151627.119d57d5@redhat.com>
 <769cfc18-9585-5ddf-de46-52aa64328cea@amsat.org>
 <CAG4p6K53y=Oe9vynXgGYTZ9CfHewsDeE3mFDkEb-_us7rgaBcg@mail.gmail.com>
 <20220808141540.317e018e@redhat.com>
 <E4A796B6-AA0E-4266-8698-E894A51A7807@gmail.com>
In-Reply-To: <E4A796B6-AA0E-4266-8698-E894A51A7807@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Aug 2022 19:02:50 +0100
Message-ID: <CAFEAcA_m-8j-v-X2ZhpOPpAC=SkSKwz6_tNaORzSi0wfx-7xLQ@mail.gmail.com>
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features of
 PIIX4_PM
To: BB <shentey@gmail.com>
Cc: Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Aug 2022 at 18:57, BB <shentey@gmail.com> wrote:
> Am 8. August 2022 14:15:40 MESZ schrieb Igor Mammedov <imammedo@redhat.com>:
> >On Wed, 3 Aug 2022 19:26:30 +0200
> >While refactoring we should keep migration stream compatible with older
> >QEMU versions (we must not regress widely x86 code path). Which might be
> >tricky in this case.
>
> Does this particular fix make future compatibility harder or easier or is it that hard already? IIUC it omits the hotplug bits in the vm state for Malta which is what one would expect there, right?

This patch's fix only affects Malta. It is (I suspect but have
not tested) a migration compat break on Malta, but we don't
care about cross-version migration compat for that board anyway.
Migration compat matters (to a first approximation) only for
those boards which have versioned machine types (eg pc-7.0,
pc-7.1, etc). For all other machine types we retain compat
only if it's easy.

thanks
-- PMM

