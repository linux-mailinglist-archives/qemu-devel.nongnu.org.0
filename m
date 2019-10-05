Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7D3CC9C1
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Oct 2019 13:57:22 +0200 (CEST)
Received: from localhost ([::1]:55838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGiga-0003EV-K7
	for lists+qemu-devel@lfdr.de; Sat, 05 Oct 2019 07:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49016)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucienmp.qemu@gmail.com>) id 1iGifW-0002ly-Hs
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 07:56:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lucienmp.qemu@gmail.com>) id 1iGifV-0005C2-Hr
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 07:56:14 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:37499)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <lucienmp.qemu@gmail.com>)
 id 1iGifV-0005Bm-Bz
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 07:56:13 -0400
Received: by mail-qk1-x734.google.com with SMTP id u184so8377925qkd.4
 for <qemu-devel@nongnu.org>; Sat, 05 Oct 2019 04:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=D8ZyBRrCoK+KYzusWDOXGYuynlOWE1aRO7qs+J8A6iI=;
 b=Pom8CbpdbMnWvrn8Yf4Ox2PAXNYJN73BlVxBpKVOOGQDVvvZEF48AydMx/QZW+inhr
 K2RM0tZ75533HCBMDE7ZWEJZyXf8SafSdD60X8rhHTA6uIKGlkrTCEUZQrcr0xUsWJAO
 TPUU9aCe2VmE15a+2pjZx7E0kivWBGBiX+hSg6hEBUokCa5DBfHXrTgPWMuWAk4d39pV
 6itHtzisbID5bLQ1kNjA8235LCh9CQZTuW2A7PGIVgS3o5T6H6JPg7E+SXZhZ2C7vuP2
 c56aHxciedkgDfi3iHncgAnX+Ot/FYVMF9F/c6e8A3NTwP83urkXUgSWrcgSJZemr/hx
 M8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=D8ZyBRrCoK+KYzusWDOXGYuynlOWE1aRO7qs+J8A6iI=;
 b=eYVeWMnHqHl86ZelNMQSedfL+Z0LdEvxNDX0yFcmrxAtwCMIutrZV4N7r4kRD0Gn+b
 J1JtDS8rz4BJ+o7Kbl7nRfU3HYomAQZAmy+KBZBIbrD/SFAgoMpKvjgNbCSQH2SIh642
 lwJs1H3BqwB6z23rNviPK+rWUqib/jopM9P4mBMZkWITdFbuyVVEe+DiXCj7NM0akoe7
 WhwV5qBuwogB0W1u/TDWC+dqcu3jYPWes4kjMw2SW7bQSpEHssDlhV9qm7QflV3svlcL
 x7gOkcqJxrwKm5Wqiylszf9DVCs/YnKRaEJ/j1PU6YjZlYvGEbgJvFE1RT5GC2Jg75uu
 UpeQ==
X-Gm-Message-State: APjAAAXUmZTSBTPityB4q7PCIG/6MY7Pp0mz46R/ke8xntSxlt6tURtd
 dFDyrrFFTfRCVuiMdSGqXpm/IerE+dNWmvg7tabE5Iq8
X-Google-Smtp-Source: APXvYqxzgs2LwvPKg8CMK80NPnxhCClTrVxjvirl8xK/Zgw0iqsQg4MU+sZjQxkvJrzUwYme/qheV5QXP1Q5i8jc56Y=
X-Received: by 2002:a37:48c8:: with SMTP id v191mr14912852qka.64.1570276572634; 
 Sat, 05 Oct 2019 04:56:12 -0700 (PDT)
MIME-Version: 1.0
From: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Date: Sat, 5 Oct 2019 20:55:54 +0900
Message-ID: <CALvKS=EoaNnNQCmdp3rjjbaAYOoow8txsn1KX=Mb37Vk3he5Kw@mail.gmail.com>
Subject: Peculiar reply from mail list handler???
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::734
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

Hey folks,

The last message I sent came back with a weird reply from
*mailer@lists.sr.ht*, claiming the list didnt support "HTML" formatted
mail (which is the default) for gmail, and then saying it couldnt be
delivered.

Thats a confusing mail as it would imply failure in delivery.    Was I
supposed to get this mail?

Cheers,
Luc

