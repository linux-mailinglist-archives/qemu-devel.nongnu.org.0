Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1889407210
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 21:38:08 +0200 (CEST)
Received: from localhost ([::1]:58032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOmLg-0007aT-3M
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 15:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hinkocevar@gmail.com>)
 id 1mOmJR-0005xp-UV
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 15:35:50 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:38652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hinkocevar@gmail.com>)
 id 1mOmJQ-00058M-E7
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 15:35:49 -0400
Received: by mail-qt1-x82e.google.com with SMTP id g11so2494364qtk.5
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 12:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=9YbChwUaOVzluaKAJxo0HfiTf48+crAzPA74v/Y6qGM=;
 b=TGNnXozuaJuKkMhsIkaGaW62wTuECRD98MuK5zBGCSRj0tJdXuZhmrwszGVSBk1i2+
 ZpuMdbZOuhVxP/23QXKD0uvgMyAxsucLOb/KBpcGMHy3tz0l8JAoLfOIeFNZPMKnqJg2
 /hLuqoANyFshi0gHHYkbzTajs0lFjTnk/3owSkykbhnn7YtiwTwuA9YZZ0T+Bwp8SRx4
 Cl9hw1nTD7jUqaNm9n8TOLuzJncZxWAVXBZfKRtuFvUgHDojYA8YVFpFe9JA4MktxBBs
 7rclqNN7ZXqdNZdLW+NsBtUFKkCz7zl3SUHTMh/A/NosWyxuQb7rK5T0uT7nsEehIYBv
 0IzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9YbChwUaOVzluaKAJxo0HfiTf48+crAzPA74v/Y6qGM=;
 b=FxbcaC1XlZLuay22JRzJtJbq5Lls1AWQDhCL9wCN9/uSW0MaTafpyuGisIXDkb4z+0
 bjixrhUjEjCALyFrih7CUiVj+hwfPDtlPXOEdMxoyCmgO2MfxAJeZyu4AkMadhc90B2z
 i0DYRtoPBksQWy7YeSpKhuQH7oHko2iDq0J9cSScik/YbZJkq5X//LC4uRpJBe0xrz5t
 j4ageREPHpCPMvl3GQbLsvoohzJahengSLLSP3PnMecyuK/sArXF2ogQmwYLvOe4SCjt
 kT3kO/TQuqo7b0FDQQKugBayIHz7sBz1DrcuSAn1dZp6IvhEeebqNeLR+HUsGbB6pvSD
 ZkVg==
X-Gm-Message-State: AOAM531j5t352GHbH7Ph3LDpDBHw8PaFB4fwWZ8QrD2EvhEFvLn6BcjL
 sT9ypw/qIX+zXKy4P96nxDJXx0qpLDKp7/LaLsAe/EFzYdEBrw==
X-Google-Smtp-Source: ABdhPJxHi8xe8tKL9ZujNG1r191KcT5VuWUZ054tPvCMXX+ePuQRjfTaWp2JXRTVJUfsjGRFQsJTfNhe6KKTOY0H9SA=
X-Received: by 2002:ac8:489a:: with SMTP id i26mr10019268qtq.372.1631302545729; 
 Fri, 10 Sep 2021 12:35:45 -0700 (PDT)
MIME-Version: 1.0
From: Hinko Kocevar <hinkocevar@gmail.com>
Date: Fri, 10 Sep 2021 21:35:35 +0200
Message-ID: <CACOP0z-muPwpLjimweiACOoSiAeULS_aP16+_9goOZv12gTxug@mail.gmail.com>
Subject: simple serial device emulation
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000c26c5605cba9388f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=hinkocevar@gmail.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c26c5605cba9388f
Content-Type: text/plain; charset="UTF-8"

I have an emulated MMIO area holding couple of registers that deal with
serial UART. Very simple access to the Tx and Rx registers from the
userspace point of view involves polling for a bit in one register and then
writing another; when there is room for another character. When the guest
app does write to a MMIO Tx register, as expected, io_writex() is invoked
and my handler is invoked. At the moment it does not do much. I'm thinking
now that the character needs to be fed to the serial device instance or
something.

Where should I look for suitable examples in the qemu code? I reckon that
other machines exist that do the similar. I found lots of serial_mm_init()
and sysbus_mmio_map() uses around serial port instances but I'm not sure
how to couple my "serial ops" to the "bus" or SerialMM (if that is the way
to go).

Thanks!
//hinko

-- 
.. the more I see the less I believe.., AE AoR

--000000000000c26c5605cba9388f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have an emulated MMIO area holding couple of registers t=
hat deal with serial UART. Very simple access to the Tx and Rx registers fr=
om the userspace point of view involves polling for a bit in one register a=
nd then writing another; when there is room for another character. When the=
 guest app does write to a MMIO Tx register, as expected, io_writex() is in=
voked and my handler is invoked. At the moment it does not do much. I&#39;m=
 thinking now that the character needs to be fed to the serial device insta=
nce or something.<div><br></div><div>Where should I look for suitable examp=
les in the qemu code? I reckon that other machines exist that do the simila=
r. I found lots of serial_mm_init() and=C2=A0sysbus_mmio_map() uses around =
serial port instances but I&#39;m not sure how to couple my &quot;serial op=
s&quot; to the &quot;bus&quot; or SerialMM (if that is the way to go).</div=
><div><br></div><div>Thanks!</div><div>//hinko<br clear=3D"all"><div><br></=
div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gma=
il_signature">.. the more I see the less I believe.., AE AoR</div></div></d=
iv>

--000000000000c26c5605cba9388f--

