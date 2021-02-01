Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5F830AA78
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:08:26 +0100 (CET)
Received: from localhost ([::1]:39218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6aoU-0002TX-1B
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:08:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l6anS-0001YO-Pw
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:07:23 -0500
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:44037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l6anR-0005lE-9H
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:07:22 -0500
Received: by mail-qk1-x732.google.com with SMTP id v126so16450653qkd.11
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 07:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=U4qv5GEg6bGJn95dO3jVmN4XDeOfB+haTYnVA/t85y0=;
 b=Oh89Tm3bEZng9d7SIlxKccRg0oHqBT+3JVj45NCf38AH/PiLaYgpF3bgrMNw0oVr23
 KAefKk7Efqm5jpfLJbQd2g1Reu3Nazf736gxQck9ZiG0tOxJYw8AWTYXzPRFzabFb7Ay
 05un7PpnDctfjac4dn1mzNXifWJWdKkOYJt2Hf7GbjcCDUygLw2awsyH8mbP6c7Uni2H
 6drjKXGfWMOioIOzgcstQipIs0RpUnrnYzWF9vWQbE3pWZNL0fLHHAozgMO6oGvMRJD4
 A6QCK/ykkvyOTZOcrDzzEQg4FpK6Z5EjqaeMITLgiY1oCUs7mkBH14D4piwynGNf7XSy
 mh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=U4qv5GEg6bGJn95dO3jVmN4XDeOfB+haTYnVA/t85y0=;
 b=oWryW+fQkFE/3GKZ+jpjGy603WZYdj1ImLqkothR+pPll57aHzuFTdvsFPcsZEl9F7
 4btgdadb+toPZbR2i2mMfMPf/zzQ3R6B8WFzj66Y3A0WHTosWRzOJmrXaER5COc8MqBH
 +um/fsp+B7A9CHm8W7jT4i71obwUwuCOdaYwSAGH7u3HykAZJ7DcWMZR9KTXMawAJJ1h
 q/sKofy+/2g9ziczjUOEgG7cFvMsYhT1K/cczCgt5miL73w6J0FEZYP3WR3VHCUcBY+V
 G2hELgUZ/CxiVKpenbMmC0TimhuAE3/b7J8vej0mcxvDBeSJtjxrcwt7oNfXSb/14Mbt
 rjwQ==
X-Gm-Message-State: AOAM531Ezn3l/7hlg6ZWv+/G9Hbt52CBw0VKpKc4g3ZIflXVwqW4ey7x
 ueoukNYcnFDc/WzYzGiogeE=
X-Google-Smtp-Source: ABdhPJwSbOTJkfZ9psus8VfxhcMSn5ZozkQbi83esdM5t/vAMC+VfVHvcE61tsomXOz8MS/1J6Ihcg==
X-Received: by 2002:ae9:d8c1:: with SMTP id
 u184mr16889022qkf.116.1612192040125; 
 Mon, 01 Feb 2021 07:07:20 -0800 (PST)
Received: from [192.168.0.16] (d149-67-30-58.try.wideopenwest.com.
 [67.149.58.30])
 by smtp.gmail.com with ESMTPSA id p188sm13709547qkf.40.2021.02.01.07.07.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 07:07:19 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Makefile has local changes that will be overwritten
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <CAOZ2QJOq6GNXMWkk_1oxqtT_GYW8FmXT8jYGHzyROXC_yoWfxA@mail.gmail.com>
Date: Mon, 1 Feb 2021 10:07:18 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <E8A5D4D4-265A-4B16-BFBA-18BA068607E8@gmail.com>
References: <B8D9E184-5C5A-4A15-BF48-927F0138F0DE@gmail.com>
 <CAOZ2QJOq6GNXMWkk_1oxqtT_GYW8FmXT8jYGHzyROXC_yoWfxA@mail.gmail.com>
To: Dan Streetman <ddstreet@canonical.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TRACKER_ID=0.1 autolearn=ham autolearn_force=no
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Feb 1, 2021, at 9:48 AM, Dan Streetman <ddstreet@canonical.com> =
wrote:
>=20
> On Mon, Feb 1, 2021 at 9:23 AM Programmingkid =
<programmingkidx@gmail.com> wrote:
>>=20
>> When trying to build QEMU I see this error:
>>=20
>> error: Your local changes to the following files would be overwritten =
by checkout:
>>        Makefile
>> Please commit your changes or stash them before you switch branches.
>> Aborting
>>=20
>> What I do to see this error:
>> ./configure --target-list=3Di386-softmmu
>=20
> Sorry, I don't see that error, what commit are you building from?

7d7dbf9dc15be6e1465c756c2c5ae7f1ab104fc8


