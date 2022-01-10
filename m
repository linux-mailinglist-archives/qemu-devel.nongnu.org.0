Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7B5489943
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:09:46 +0100 (CET)
Received: from localhost ([::1]:54226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6uQh-000629-9v
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:09:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n6uJV-00033t-Hv
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:02:17 -0500
Received: from [2a00:1450:4864:20::536] (port=38887
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n6uJT-0006bt-Lr
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:02:17 -0500
Received: by mail-ed1-x536.google.com with SMTP id u21so30682403edd.5
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 05:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=FIwQFTFSbvmnwSED8PL3LOR41bS/k+/Jm1Z+ei49ec8=;
 b=OKu6I/c6VoBFm6zXKksWPzn9T0m3dQ49ZWKRssE7LL4lVtEm6jEstdKxVEtXRU7Eou
 +Xn7+ya40OVl/x3QIF+C6P/bKNRsUlymH0Zp8qsc5hSXvBgFqeRtrxFdPjZ9Czkkn77F
 kF1Q08TyVCt0yEjD+jYcX3HOjzfhNAH21UrIR4kfvGSdt05PM4LgYvNz99zt209N1lad
 ES0YkUOjw7Sc4PwAVqFVRove7I0TOjQCUBf9U3dpNKgeT6YDPSUnCAJzK/5H9i7sbiwg
 aY+qnQQh1OJ0y645fe8FViSd888kp0oBRk6gwL7DdXS0WUYOYH5rDjctXd9vg4SHQfb7
 pPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=FIwQFTFSbvmnwSED8PL3LOR41bS/k+/Jm1Z+ei49ec8=;
 b=hSeOjzH5YTO62bahOWzzUIGz342BCN/4z6dWU2RlG3UpMytL+5m94AwS/RXMrkL/WW
 MSZ9xkLGFifuaNY9lZvxLZB8TjvB6UXgN9kpVuiZy1Ucg8K5Ovkuz36HadmAlH4rQSdK
 gn/8AHu+ZvPp5/E5yv2aT9t5K28wdg5wTKFK6ghSJv1Q4xg2oUDYA5mwh8pE2AKAZ1xP
 dsYVGfGySZ+YXyuu2u/RuinMT2/BiZmzOXzQTUU3khD6Q+SEhkUDxdFCRuqJ+APBfV27
 r/MPqWdix7CSND+fw4T8QdNj+bQ69BmfEX5DGzigW35tUTCSg6NwG/6E6LU1PZSoMhcm
 MjjQ==
X-Gm-Message-State: AOAM5319nIsiJy3Wu1tr/wy2dhTouzfKa++Xkzaj47XQvIIEnSZSezxe
 bGtUxd5RRgeIkNqi48Dilz3wcw==
X-Google-Smtp-Source: ABdhPJwmku/Fo3vOPETN9rdNCu4PEqdjrr/ADLf9iVPE0dnKhibkuWcQC9L8k7+F4el0eECU8uERyw==
X-Received: by 2002:a05:6402:4382:: with SMTP id
 o2mr4917792edc.38.1641819729791; 
 Mon, 10 Jan 2022 05:02:09 -0800 (PST)
Received: from smtpclient.apple ([79.115.178.1])
 by smtp.gmail.com with ESMTPSA id b4sm2413471ejl.129.2022.01.10.05.02.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jan 2022 05:02:09 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: /usr/shared/qemu binaries
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <CAKmqyKPBDfxKwqcgzjBDEqoWyjjc3g7PiUOEqptL1vfDfh6H8g@mail.gmail.com>
Date: Mon, 10 Jan 2022 15:02:08 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <D3A93704-3353-4407-9D47-56FF06BDFB87@livius.net>
References: <B9A4B86C-4540-486D-A261-876191FA7424@livius.net>
 <CAKmqyKPBDfxKwqcgzjBDEqoWyjjc3g7PiUOEqptL1vfDfh6H8g@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::536;
 envelope-from=ilg@livius.net; helo=mail-ed1-x536.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 10 Jan 2022, at 14:10, Alistair Francis <alistair23@gmail.com> =
wrote:
>=20
> My guess would be keep *arm*/*aarch64*, keymaps, npcm7xx_bootrom.bin,
> efi-* and linuxboot*/multiboot*. That should ensure that everything
> works for you, but I'm just guessing here.

Do you know if those files are referred internally by QEMU, or the user =
should provide them in various command options explicitly?

About the efi-*.rom files, are they usable on Arm machines too? I =
thought that they are x86 specific.

> If you want to boot Linux on RISC-V QEMU you will need OpenSBI. You
> can either use these or build and supply your own binaries.

I don't know what to say, my first thought was that if those files can =
be supplied by the user, I'd rather not include them in the binary =
distribution.

But if they are referred internally, and in certain configurations QEMU =
does not start without them, I have to reconsider.


Regards,

Liviu


