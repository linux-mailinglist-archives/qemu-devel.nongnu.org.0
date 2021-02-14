Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3E231B0FA
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 16:47:59 +0100 (CET)
Received: from localhost ([::1]:50170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBJcs-0007vp-AU
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 10:47:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBJZi-0006wr-04
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 10:44:42 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:40089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBJZc-0008A0-RK
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 10:44:41 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id i71so4728786ybg.7
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 07:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DQK+jaG5sQgJM80WiGtoN2plyV5VGVxcX9hV9ofYhXo=;
 b=FE2dl/u0oZ7OB/9stUZIehuXz8Vq6Ymp7MUx0Nrxz0vKMwMbwLilCV1116on0Tup4b
 sjf8tf8yBktTcnoJlVp7rUypkBYGYz0OE0m0gs2D7cBN7+avjbUxMeYESp+fH+Tfi+c1
 ED7SD6/4yMen8CRKKze34BxOZQzQ8aqcGrAM5SDWHpNUBTMt5YsqlXkxFq+UQTUb01qy
 OsS+DS+Mr8dsFmg2FGVn8qZpdYUUTpCeJZrQ79sk4igUAfCiRSHVw6QDzmPyj7c5gmeK
 wbEJEvK3mnO+aBLcf+pZ6rGlr/w16bTUMThGC2zmQqu6ezTSGqhkLemQ79+B58FZwKx5
 pVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DQK+jaG5sQgJM80WiGtoN2plyV5VGVxcX9hV9ofYhXo=;
 b=dvry3h8bqN8eIOqR+jTXh8aBxAz+mUrdo9GqZ7T6oNTUMbo0UINBXfov/qALskylBA
 s5pyGoux2Qk6hV0JWCFAtwXXSUjikYk6bGdvd8UDuM3s3e1UgX8evzH3aXOKBOnqWqyi
 iEplteUxTkxCPA7MfjybQ4Xe0Ss8LZ0q4rzcNhT882F6FceTTD146SvEQEsEcMTTjN38
 snVsPVW6gsdVRf0Y8v8g93oy6VhmhAeIao/xCh/mhH+5/pFF9HGmHk7kSM9SnxWcItL/
 g6jTquI6tsks/Sod0KOu3mtR2nJ5aPdv1fcHZY4azIUC9TBxSRZ0ZpCfuwo2geRXJ1nM
 B5Lw==
X-Gm-Message-State: AOAM533DwytjQJyMfwsmmj7gUlXTqtDfg0t03nQIaXdFT8JFX//1vHHZ
 o1awqYdZrm0wqei9DMRgYZQvPvRV/+fX3rQWzHI=
X-Google-Smtp-Source: ABdhPJzIbHzScNnTUij7FjFMN+mJO6AGJK8ZQ3OiA95o+lcXBMZfG6uRvY7oFDKYJdfHKvWyhFyQVg4/OkZQHpvG2zk=
X-Received: by 2002:a25:3387:: with SMTP id
 z129mr18077501ybz.239.1613317475512; 
 Sun, 14 Feb 2021 07:44:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1541701393.git.noring@nocrew.org>
 <5bea109f0c140da6a821aa7f9705d4b3717e86dc.1541701393.git.noring@nocrew.org>
 <CAAdtpL4B-19ZrtkLcfY0PY7RUMrEVWsH310jZ6CGHB-K+nKCQQ@mail.gmail.com>
In-Reply-To: <CAAdtpL4B-19ZrtkLcfY0PY7RUMrEVWsH310jZ6CGHB-K+nKCQQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 14 Feb 2021 23:44:24 +0800
Message-ID: <CAEUhbmWQd6WXzLQ-9VSMtjgLyS8CQ=7TA6g8BCrbFug9HU3dzQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] linux-user/mips: Support the n32 ABI for the R5900
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>,
 "Maciej W. Rozycki" <macro@linux-mips.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 =?UTF-8?Q?J=C3=BCrgen_Urban?= <JuergenUrban@gmx.de>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 14, 2021 at 11:17 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> On Thu, Nov 8, 2018 at 7:45 PM Fredrik Noring <noring@nocrew.org> wrote:

Oops, an old patch from 2018 and was never applied?

> >
> > Recognise the R5900, which reports itself as MIPS III, as a 64-bit CPU
> > supporting the n32 ABI.
> >
> > Signed-off-by: Fredrik Noring <noring@nocrew.org>
> > ---
> >  linux-user/mips64/target_elf.h | 3 +++
> >  1 file changed, 3 insertions(+)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Regards,
Bin

