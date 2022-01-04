Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19A7483F17
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:21:41 +0100 (CET)
Received: from localhost ([::1]:51020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4g0i-0005be-UH
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:21:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n4fzj-0004dY-QQ; Tue, 04 Jan 2022 04:20:40 -0500
Received: from [2a00:1450:4864:20::330] (port=39459
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n4fzi-0008FG-2j; Tue, 04 Jan 2022 04:20:39 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 g7-20020a7bc4c7000000b00345c4bb365aso19607881wmk.4; 
 Tue, 04 Jan 2022 01:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=GCPLuPwSXoVEGZ8BAJ3WOKIPJnETmpVk7myN2twz94Y=;
 b=o2UtxdpsFXbiivKYe8V8zPgku/6U9TQP+DVqrsdcsCzjMpqJu5P4ERJlw7MiTQsIKJ
 hqz6ubPieTSlxLoBhYM8g2ebfiwp3zx5pPnhCOqXhNCWYK6UYJZdeb8+BgkUaz/h8zf/
 sMEefynurZMHlqEP60e4L8SZ5yxnp8twv32khDu0cJWFlcsHzJrWav3rCmmvaathm/Al
 KLxyOjPTMDMxfLXvEaNqigpZlFCHga0twDe9ZBqaBylc2lm0LwtKfT43P2K+OKgWUk+0
 GMGgenrkvuBcDbvlN6r253ESXf6W0IBsWn3RZYqA6TDArsKydrkN5CaMexaSwCSk+7pK
 3m9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=GCPLuPwSXoVEGZ8BAJ3WOKIPJnETmpVk7myN2twz94Y=;
 b=tZ2s5K4kd1zfmLXSjABcP7wDPIqnBGwTm4foe8bMDTy2kdNbpGifxBd1uzIM4IbPrw
 cKmKCEP9WMz+pEtR8Uc2Hye88ChLEdKkD3WRT7Eri8gG9eI1j6Qy8y2fZUAtRiEj3pQy
 VF1iX9dUqt6TdmKE0JSlNN3XoWoqlDqVB/K0mf9m24GTCB6+W+k2fitzrcA86NBSXT+0
 hFmCw/mD8tEBv0cVoP/HxuCaoHsMBDf1epcv3+FFiVdQAr33V6EAB/nnQaKOLsMCxLau
 oNwnNXt0eFWYTg/TOgRNQxvcotkwrIueNG5lx4C0qRop/2P3XnBcf1fk8uBjT7OQ9rKp
 yTXg==
X-Gm-Message-State: AOAM533hjjG+o4s1Ef/iyPDZyiScfc0k/+nFaiEfStuKnlnSWsQPYkhZ
 PblOlgbgy9sLgDZLtwK3nsk=
X-Google-Smtp-Source: ABdhPJwnkABgMKkv3g1Zi8bZSs7ORwFXCyVYIAna2Uz7kKsfYfhJxrQThpAVsE4nswAAzEB6KU1SCA==
X-Received: by 2002:a05:600c:4998:: with SMTP id
 h24mr41042217wmp.188.1641288035740; 
 Tue, 04 Jan 2022 01:20:35 -0800 (PST)
Received: from smtpclient.apple (201.11.75.194.dyn.plus.net. [194.75.11.201])
 by smtp.gmail.com with ESMTPSA id
 c7sm41754536wri.21.2022.01.04.01.20.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jan 2022 01:20:35 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH 1/2] hw/display/vmware_vga: only show debug output if
 DEBUG enabled
From: Carwyn Ellis <carwynellis@gmail.com>
In-Reply-To: <5be97a9e-8df4-621a-8875-56979448a777@vivier.eu>
Date: Tue, 4 Jan 2022 09:20:34 +0000
Content-Transfer-Encoding: quoted-printable
Message-Id: <5DC1E921-4166-45E4-8EBE-BA07A2708956@gmail.com>
References: <20220104091135.61226-1-carwynellis@gmail.com>
 <20220104091135.61226-2-carwynellis@gmail.com>
 <5be97a9e-8df4-621a-8875-56979448a777@vivier.eu>
To: Laurent Vivier <laurent@vivier.eu>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=carwynellis@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey,

Thanks for getting back to me.

Yeah will take a look and update when I have a mo.

Cheers
Carwyn

> On 4 Jan 2022, at 09:18, Laurent Vivier <laurent@vivier.eu> wrote:
>=20
> Le 04/01/2022 =C3=A0 10:11, Carwyn Ellis a =C3=A9crit :
>> Debug output was always being sent to STDERR. This has been replaced =
by
>> a define that will only show this output when DEBUG is set to true.
>> Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
>> ---
>>  hw/display/vmware_vga.c | 26 ++++++++++++++++----------
>>  1 file changed, 16 insertions(+), 10 deletions(-)
>> diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
>> index e2969a6c81..8080e085d1 100644
>> --- a/hw/display/vmware_vga.c
>> +++ b/hw/display/vmware_vga.c
>> @@ -43,6 +43,12 @@
>>    /* See http://vmware-svga.sf.net/ for some documentation on VMWare =
SVGA */
>>  +#ifdef DEBUG
>> +#define VMWARE_VGA_DEBUG(...) { (void) fprintf(stdout, __VA_ARGS__); =
}
>> +#else
>> +#define VMWARE_VGA_DEBUG(...) ((void) 0)
>> +#endif
>> +
>=20
> Could you replace this macro by adding some trace-events instead.
>=20
> See =
https://qemu-project.gitlab.io/qemu/devel/tracing.html#using-trace-events
>=20
> Thanks,
> Laurent
>=20
>>  struct vmsvga_state_s {
>>      VGACommonState vga;
>>  @@ -297,45 +303,45 @@ static inline bool =
vmsvga_verify_rect(DisplaySurface *surface,
>>                                        int x, int y, int w, int h)
>>  {
>>      if (x < 0) {
>> -        fprintf(stderr, "%s: x was < 0 (%d)\n", name, x);
>> +        VMWARE_VGA_DEBUG("%s: x was < 0 (%d)\n", name, x);
>>          return false;
>>      }
>>      if (x > SVGA_MAX_WIDTH) {
>> -        fprintf(stderr, "%s: x was > %d (%d)\n", name, =
SVGA_MAX_WIDTH, x);
>> +        VMWARE_VGA_DEBUG("%s: x was > %d (%d)\n", name, =
SVGA_MAX_WIDTH, x);
>>          return false;
>>      }
>>      if (w < 0) {
>> -        fprintf(stderr, "%s: w was < 0 (%d)\n", name, w);
>> +        VMWARE_VGA_DEBUG("%s: w was < 0 (%d)\n", name, w);
>>          return false;
>>      }
>>      if (w > SVGA_MAX_WIDTH) {
>> -        fprintf(stderr, "%s: w was > %d (%d)\n", name, =
SVGA_MAX_WIDTH, w);
>> +        VMWARE_VGA_DEBUG("%s: w was > %d (%d)\n", name, =
SVGA_MAX_WIDTH, w);
>>          return false;
>>      }
>>      if (x + w > surface_width(surface)) {
>> -        fprintf(stderr, "%s: width was > %d (x: %d, w: %d)\n",
>> +        VMWARE_VGA_DEBUG("%s: width was > %d (x: %d, w: %d)\n",
>>                  name, surface_width(surface), x, w);
>>          return false;
>>      }
>>        if (y < 0) {
>> -        fprintf(stderr, "%s: y was < 0 (%d)\n", name, y);
>> +        VMWARE_VGA_DEBUG("%s: y was < 0 (%d)\n", name, y);
>>          return false;
>>      }
>>      if (y > SVGA_MAX_HEIGHT) {
>> -        fprintf(stderr, "%s: y was > %d (%d)\n", name, =
SVGA_MAX_HEIGHT, y);
>> +        VMWARE_VGA_DEBUG("%s: y was > %d (%d)\n", name, =
SVGA_MAX_HEIGHT, y);
>>          return false;
>>      }
>>      if (h < 0) {
>> -        fprintf(stderr, "%s: h was < 0 (%d)\n", name, h);
>> +        VMWARE_VGA_DEBUG("%s: h was < 0 (%d)\n", name, h);
>>          return false;
>>      }
>>      if (h > SVGA_MAX_HEIGHT) {
>> -        fprintf(stderr, "%s: h was > %d (%d)\n", name, =
SVGA_MAX_HEIGHT, h);
>> +        VMWARE_VGA_DEBUG("%s: h was > %d (%d)\n", name, =
SVGA_MAX_HEIGHT, h);
>>          return false;
>>      }
>>      if (y + h > surface_height(surface)) {
>> -        fprintf(stderr, "%s: update height > %d (y: %d, h: %d)\n",
>> +        VMWARE_VGA_DEBUG("%s: update height > %d (y: %d, h: %d)\n",
>>                  name, surface_height(surface), y, h);
>>          return false;
>>      }
>=20


