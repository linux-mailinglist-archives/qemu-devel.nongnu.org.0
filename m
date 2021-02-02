Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FC830C537
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:18:37 +0100 (CET)
Received: from localhost ([::1]:42620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yNw-00033l-67
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:18:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1l6yBR-0008PQ-Ml; Tue, 02 Feb 2021 11:05:44 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1l6yBP-0006G3-6O; Tue, 02 Feb 2021 11:05:41 -0500
Received: by mail-wm1-x32c.google.com with SMTP id m2so2989734wmm.1;
 Tue, 02 Feb 2021 08:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=J50FcM9Xuz2nuuwVsOHs0CLSxTRB3uDXE4eudLz4aM4=;
 b=qrkMLA3seqJMHuNgODSKDXHuSLKmDH4p0dzA+rUEshoDC415nUII4P9GE1STh27f4/
 72kl//YpdRAIuvKDs1mEk7BbsfL7S5xTun5vZZPk3dmLKpchZs0BSl2XDQovFGb+7UG3
 uVtrec0d7u2clCaYr35vEp0axF/0YlD542ZFt1ktuWb92AME8HtioZodSbf4yomxsrY3
 tRUcvaV8p4B5mjRdGk02H7PaE9P+xTvAyCTTwDSOFln81v34tU+Z7iyaLlXBFAkNttg7
 E6WSCLUJeXLo0R6dYyxd3QAoVzoyQ0cp2Eot03Mzwdrm+UDkUEalcL2/6hYem1S1yqlG
 85Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=J50FcM9Xuz2nuuwVsOHs0CLSxTRB3uDXE4eudLz4aM4=;
 b=OcwphN+ArEulQ/3d94dfJKQr8pFSScZ34G+ZA51IOXusXdbyWGP9+bRBitwVBoss4P
 Cn03ihUXTaBw2gNUwd6cXK4XUNWrRIf5/3ik8fJFkNjrl8dsIbLmoc3R6G5bHct9SUOs
 0u5wWml1AF/Zm0pHg2wUqESjpxIqj/NJi0gmzQNJMtlqjgDvIxIk1QXYuwla3BkKqCvs
 1ycU9wqJXGrA6YHbT8gpMS9uPq+sPXysnkwBiDpd+pe+rBgU2KjWZuP/BgNCMa0RLUgJ
 XE0GzfJIlf5HEHvuBNRY7FPygBhftq9lHiiCKYyw1oGjl63312vM+rjH5jkvYQ3COEHw
 Ht+w==
X-Gm-Message-State: AOAM530p1kPDXfGiFYzvTtDEv2iGD7p72wqVYqexzibkCSe67D3mOfVv
 btp8KHSfpIyykm+NGOKCprM=
X-Google-Smtp-Source: ABdhPJy/49XXN1Evx6YRHjuIWKhFBSVJHREEYrjkPlVJuxjo9IsapchrbzDO3/D4W+gHE9tR0TboIw==
X-Received: by 2002:a1c:1d8b:: with SMTP id d133mr4412376wmd.172.1612281936831; 
 Tue, 02 Feb 2021 08:05:36 -0800 (PST)
Received: from CBGR90WXYV0 (host86-190-149-163.range86-190.btcentralplus.com.
 [86.190.149.163])
 by smtp.gmail.com with ESMTPSA id c62sm3845103wmd.43.2021.02.02.08.05.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Feb 2021 08:05:35 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20210202155644.998812-1-philmd@redhat.com>
In-Reply-To: <20210202155644.998812-1-philmd@redhat.com>
Subject: RE: [PATCH] hw/i386/xen: Remove dead code
Date: Tue, 2 Feb 2021 16:05:34 -0000
Message-ID: <036801d6f97d$3d9f0bf0$b8dd23d0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHU213CX1E5gjnLtJG8R95suaIaVKpJQttA
Content-Language: en-gb
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Eduardo Habkost' <ehabkost@redhat.com>,
 "'Michael S. Tsirkin'" <mst@redhat.com>, qemu-trivial@nongnu.org,
 'Richard Henderson' <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, 'Anthony Perard' <anthony.perard@citrix.com>,
 'Paolo Bonzini' <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Sent: 02 February 2021 15:57
> To: qemu-devel@nongnu.org
> Cc: Richard Henderson <richard.henderson@linaro.org>; Paolo Bonzini =
<pbonzini@redhat.com>; Eduardo
> Habkost <ehabkost@redhat.com>; qemu-trivial@nongnu.org; Michael S. =
Tsirkin <mst@redhat.com>; Marcel
> Apfelbaum <marcel.apfelbaum@gmail.com>; =
xen-devel@lists.xenproject.org; Paul Durrant <paul@xen.org>;
> Anthony Perard <anthony.perard@citrix.com>; Stefano Stabellini =
<sstabellini@kernel.org>; Philippe
> Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Subject: [PATCH] hw/i386/xen: Remove dead code
>=20
> 'drivers_blacklisted' is never accessed, remove it.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

FTR this is a vestige of an ancient mechanism that's not used any more =
(see =
https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Ddocs/misc/hvm-em=
ulated-unplug.pandoc step 5).

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
>  hw/i386/xen/xen_platform.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
>=20
> diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
> index 7c4db35debb..01ae1fb1618 100644
> --- a/hw/i386/xen/xen_platform.c
> +++ b/hw/i386/xen/xen_platform.c
> @@ -60,7 +60,6 @@ struct PCIXenPlatformState {
>      MemoryRegion bar;
>      MemoryRegion mmio_bar;
>      uint8_t flags; /* used only for version_id =3D=3D 2 */
> -    int drivers_blacklisted;
>      uint16_t driver_product_version;
>=20
>      /* Log from guest drivers */
> @@ -245,18 +244,10 @@ static void platform_fixed_ioport_writeb(void =
*opaque, uint32_t addr, uint32_t v
>=20
>  static uint32_t platform_fixed_ioport_readw(void *opaque, uint32_t =
addr)
>  {
> -    PCIXenPlatformState *s =3D opaque;
> -
>      switch (addr) {
>      case 0:
> -        if (s->drivers_blacklisted) {
> -            /* The drivers will recognise this magic number and =
refuse
> -             * to do anything. */
> -            return 0xd249;
> -        } else {
> -            /* Magic value so that you can identify the interface. */
> -            return 0x49d2;
> -        }
> +        /* Magic value so that you can identify the interface. */
> +        return 0x49d2;
>      default:
>          return 0xffff;
>      }
> --
> 2.26.2



