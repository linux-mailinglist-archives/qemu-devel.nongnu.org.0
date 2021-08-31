Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5013FCED5
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 22:54:08 +0200 (CEST)
Received: from localhost ([::1]:44640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLAlj-0005XE-3F
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 16:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mLAkW-0004gi-5r; Tue, 31 Aug 2021 16:52:52 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:39519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mLAkU-0007Sp-5w; Tue, 31 Aug 2021 16:52:51 -0400
Received: by mail-qk1-x736.google.com with SMTP id y144so769967qkb.6;
 Tue, 31 Aug 2021 13:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ZbZiGEyZvFWCiwUUvshrP9GiEZqAxD/VpFiHfyJQekA=;
 b=V9OzWsM+Ah48oPEDPhueUTu+GgblvNTFlBQV8Fixozk7zxyqvcNII6CdsPA0saUcEI
 EwWYLEwoYcXazFO0mXsydFTkTSfLFrHbJfad11FTQ4yyI8P8GResC/q19dHmFD5b1eHE
 DoKyLhLmg67Q/CiHjo8XEuJJma3VXvBSMft+IuUkTmwnQmE2BPxy9FC74zTbGCaURkoN
 42uSEYSjndaB7Xt01To0u342qlE7t+Ds1S2X309wux6rrmF+Fk82MIk/obC3x2CEy9er
 T7odGK3hbx6LJ1ETPIWvP9ktmN1FryhddFOH5UYpYHicIJLKhEq1J5ag7j9ksEquGthD
 UloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ZbZiGEyZvFWCiwUUvshrP9GiEZqAxD/VpFiHfyJQekA=;
 b=WT9wX6mCTx2EWAP4QbrKPVR296tbZAPRqLldKnfXUJEpCXqSJJQaLMEZljUEF0gt/G
 6bO5utN09aCi7c0p3stBzf0ku83ws3nu5TQB2FBwoUd7SYs8fBay+CBIQPgZy5CvPYDl
 C25kFtpBVSLest6X7PqWRNAg4jXO9iOyMOk1zCwWW58NBmR8whPRWuzqV9IoLKC8kKp0
 buImb1tRpR9EAT5XFI3I1O9xRlc/HiEcY3mRJrdbf/L38MiPRk0YyMs9YUts5Uj4GoMi
 ckujClHct6h+/hsuMepSQAs0JYjTUlHlxLWuCHKKtjVfnSeF2cTUBhC1/q+ZmHY/1oct
 52cA==
X-Gm-Message-State: AOAM533LhdDDYSQ9zIEuqEebSCWMqYA4dhrscU1lyN3mJzhAXSWRiik8
 Rsmg1d0VihqX9Ov0efeXEu8=
X-Google-Smtp-Source: ABdhPJxLZ/OlxsD+jDZPuj8l124M83QTU6NvTC5y3wHgG6IH20jE7Z4RAxHFMjxHRKj10SX3YB9FBw==
X-Received: by 2002:a05:620a:4094:: with SMTP id
 f20mr5126616qko.488.1630443168016; 
 Tue, 31 Aug 2021 13:52:48 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id t64sm14815975qkd.71.2021.08.31.13.52.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Aug 2021 13:52:47 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH] Add qemu_vga.ndrv to build/pc-bios folder
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <694bebbe-9920-c110-4331-47cefbdfde51@ilande.co.uk>
Date: Tue, 31 Aug 2021 16:52:46 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <B8D898FD-3C06-4086-8BB2-C3A414E8E504@gmail.com>
References: <20210831165020.84855-1-programmingkidx@gmail.com>
 <694bebbe-9920-c110-4331-47cefbdfde51@ilande.co.uk>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x736.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, hsp.cat7@gmail.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Aug 31, 2021, at 4:33 PM, Mark Cave-Ayland =
<mark.cave-ayland@ilande.co.uk> wrote:
>=20
> On 31/08/2021 17:50, John Arbuckle wrote:
>=20
>> Currently the file qemu_vga.ndrv is not copied into the =
/build/pc-bios folder. This makes all video resolution choices disappear =
from a PowerPC Mac OS guest. This patch has the qemu_vga.ndrv file =
copied into the build/pc-bios folder giving users back their video =
resolution choices.
>> Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
>> ---
>>  configure | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>> diff --git a/configure b/configure
>> index 9a79a004d7..281577e46f 100755
>> --- a/configure
>> +++ b/configure
>> @@ -5056,7 +5056,9 @@ for bios_file in \
>>      $source_path/pc-bios/openbios-* \
>>      $source_path/pc-bios/u-boot.* \
>>      $source_path/pc-bios/edk2-*.fd.bz2 \
>> -    $source_path/pc-bios/palcode-*
>> +    $source_path/pc-bios/palcode-* \
>> +    $source_path/pc-bios/qemu_vga.ndrv
>> +
>>  do
>>      LINKS=3D"$LINKS pc-bios/$(basename $bios_file)"
>>  done
>=20
> I think the patch looks correct, however the commit message and =
subject aren't quite right. How about something like:
>=20
> [PATCH] configure: add missing pc-bios/qemu_vga.ndrv symlink in build =
tree
>=20
> Ensure that a link to pc-bios/qemu_vga.ndrv is added to the build =
tree, otherwise the optional MacOS client driver will not be loaded by =
OpenBIOS when launching QEMU directly from the build directory.
>=20
>=20
> ATB,
>=20
> Mark.

Ok. I will create a new patch with these changes.=

