Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D5530AC55
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:12:41 +0100 (CET)
Received: from localhost ([::1]:43220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6boe-0000pZ-Oy
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l6bkv-0006qb-Em
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:08:53 -0500
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:33433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l6bkt-0000G3-SY
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:08:49 -0500
Received: by mail-qv1-xf31.google.com with SMTP id 2so8380150qvd.0
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 08:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=k/6hU/YRp/WRayf4kqQHviwm/7JIej3WiJ6ds5XzrOE=;
 b=Uh9++KPM2oSE5hwtXKx+ThJeTU/sVaoREIx+h0Z+CCxSVXOqacAg5UAYCiJD8OdDjG
 gCq5MlHHLWA7FUPmw2RED1hJSg0SDPRqBMRTbfZCtNpgU5F9FAF4lKd/UY8Y780RkxkL
 l1KTKlHxT1ioAi63gOnWZZo3GLF84PtGNVjRlCH8dh0Zp/NGg4ja6JxZlwzm/p4MRkBr
 en9ollDY1cs4PAqrLsnUqqXpO/dwk+pipnJBpaTfa27+7ftKDnlf25/bHG5sQYOLc9E5
 iNyvvSl5dQyGng1wQwQWy2SzAH5czBQzWwnsimh19mep2CoZF/Vw15v1SLPb+2rp/fsz
 SMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=k/6hU/YRp/WRayf4kqQHviwm/7JIej3WiJ6ds5XzrOE=;
 b=qd+oEYjWz4t6YV25s0rdPo/3h8DRYImfj1vtMDzxb4xWamCk+uLMjKX404/Og0y5pq
 YDyaMsEtus2pTpjbDRvHDHU4RGuPWFjFrKenVoCb4A51B0YpMcsNv0oP7I68bL0XDLsJ
 SArEboZ/8nAgXA09Oub0Mgrp+ursYwKaCmgAFtJyAufe9CoXbJIkzeCWVfrb1AbrVy+J
 SI671xOPAHsdai40LUUK7CaFEtulcstlqZvM2fo1/iMgMX7jVJmtVt0NPxQ4xJ0Gjspp
 MARnAtXNodpBhMBvi6PtQnjXpA7+1tmdV7dJf+rynYd1UZ3n6S4QMOUpaemHt9CVJnBa
 HMig==
X-Gm-Message-State: AOAM531SLX4AxWSBHJJwX+nlgJkF6nMHsqI/1Mp922sAV/qpKnFD52XM
 9UIc+w4h7uCaPtgWEGnwlA0=
X-Google-Smtp-Source: ABdhPJw6SmxY8RIXdw4LivDt2RoABPbHFKIxo9oZdtC1otWzT9a3WCByvg5EAbuxXkYCyuevfw7lNA==
X-Received: by 2002:a0c:9122:: with SMTP id q31mr15916507qvq.23.1612195726929; 
 Mon, 01 Feb 2021 08:08:46 -0800 (PST)
Received: from [192.168.0.16] (d149-67-30-58.try.wideopenwest.com.
 [67.149.58.30])
 by smtp.gmail.com with ESMTPSA id z8sm14074619qtu.10.2021.02.01.08.08.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 08:08:46 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Makefile has local changes that will be overwritten
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <b8717d48-4ba3-7dbc-6848-4e2cbd8f8b38@weilnetz.de>
Date: Mon, 1 Feb 2021 11:08:45 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <25F8D741-F0D3-42E0-8961-56F15D74C5A1@gmail.com>
References: <B8D9E184-5C5A-4A15-BF48-927F0138F0DE@gmail.com>
 <e18f2bd3-fcfd-2804-91d0-b4ecdb450bdc@weilnetz.de>
 <03FB77FD-2C50-40E5-8BE3-2F005D5056AA@gmail.com>
 <b8717d48-4ba3-7dbc-6848-4e2cbd8f8b38@weilnetz.de>
To: Stefan Weil <stefan.weil@weilnetz.de>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=programmingkidx@gmail.com; helo=mail-qv1-xf31.google.com
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
Cc: ddstreet@canonical.com, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Feb 1, 2021, at 11:04 AM, Stefan Weil <stefan.weil@weilnetz.de> =
wrote:
>=20
> Am 01.02.21 um 16:36 schrieb Programmingkid:
>=20
>> Thank you for the suggestion. I tried it but didn't seem to help. I =
should report this is what I see when I try to build QEMU:
>> Disabling PIE due to missing toolchain support
>> error: Your local changes to the following files would be overwritten =
by checkout:
>> 	Makefile
>> Please commit your changes or stash them before you switch branches.
>> Aborting
>> Unable to checkout '85e5d839847af54efab170f2b1331b2a6421e647' in =
submodule path 'dtc'
>> =
/Users/john/Documents/Development/Projects/Qemu/qemu-git/scripts/git-submo=
dule.sh: failed to update modules
>>=20
>> Unable to automatically checkout GIT submodules ' ui/keycodemapdb =
tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 meson dtc =
capstone slirp'.
>=20
> So dtc/Makefile is causing the problem.
>=20
> What does "git -C dtc diff" show?

diff --git a/Makefile b/Makefile
old mode 100644
new mode 100755

> "git -C dtc reset --hard" might fix the problem for you.

This does make configure work now :)  Thank you.=

