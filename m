Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269C631CCDC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:24:50 +0100 (CET)
Received: from localhost ([::1]:43734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC2DZ-0008G3-8O
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lC2B0-0006yj-JP
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:22:15 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lC2Ax-0008JP-SS
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:22:10 -0500
Received: by mail-wr1-x42d.google.com with SMTP id n4so10564635wrx.1
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 07:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version:content-transfer-encoding;
 bh=YBsxjlXjlQAODSDZ0pXAR17GD22Gx+AANhmStiVFbaA=;
 b=K+CnLB7Eqj15BheuS4XfTJDcZMLUtF/x1QTDug2aCpOI2L16Kp+Pdr8IwKj6pBXNKd
 tV3nz7Gms823fm9ii1x4eB73oFDWx6PV/d+UPstVZwTF2ccs65tJrWsSyWzJZ+tLiHgi
 KLE4dvU9tydoTxEXOp3wAYdexiM/bGuaL2lTmYR4eeodpyBqLW61B/VHKnRaz/4nuchZ
 5MokCmxn5XOSx5xm7gjOk2TSSq1y6BywUjlkvoVO+cTckEIINPTjPrpVA6f+Idl5P2I6
 yl1v+sIjUICNGcmQEZXgCX+ywxCt+cw6O7zTB+DrI7lgpUZ52XIq0Pw0RzM3xmqfZmE7
 KG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version:content-transfer-encoding;
 bh=YBsxjlXjlQAODSDZ0pXAR17GD22Gx+AANhmStiVFbaA=;
 b=OEfMvIdb4yFYuXPnUsgyiRAL3VOPMuth/NZ1CrhhXxFW3VPZYqhavwXw2Ux/FSpmP4
 CajJmdTWo6gMTcT6eZbXAv2paxz94fufw99t+sehLtLEJriN1Wnfg686o5dpNGvTL1D9
 Dhv9zbTtFf8BFFjweF59zXRmfWuwdNEhy09z+G9dLKQxuVwvvecg8tX3whghxdsdhWUj
 CGywuwdi2mIOn00GZEHmUA3q0LkNj94DP5QdYg+K94Dwf1ks4VtfC1YF+GCuZMzcFFqd
 oMezvHNrsA7UXZf5eFnOwu02LYgM+vePECxuygmV/2HOnIL74sEOD3Sk2qU1RpeM3ZAq
 RD1g==
X-Gm-Message-State: AOAM533aadWptUYi83a2EkQsILhh1sXeK7Iy0otL3ILstdETAnC+ZLaV
 hlUaCWq+bqQcOlXj2XHCnSwN7w==
X-Google-Smtp-Source: ABdhPJxE0mSZVe6RPXoltk+sf5l8dosueDnzVZQaGGX8D2FBpJi2QMxBOujechlEUPhXOEUksLuHNQ==
X-Received: by 2002:adf:f591:: with SMTP id f17mr24367402wro.60.1613488925437; 
 Tue, 16 Feb 2021 07:22:05 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id o129sm4190138wme.21.2021.02.16.07.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 07:22:05 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 817d484e;
 Tue, 16 Feb 2021 15:22:04 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org
Subject: Re: [RFC PATCH 0/3] hw/pflash_cfi01: Reduce memory consumption when
 flash image is smaller than region
In-Reply-To: <df4db595-c2db-4fa8-0a4b-1403117dcc76@redhat.com>
References: <20210216142721.1985543-1-david.edmondson@oracle.com>
 <df4db595-c2db-4fa8-0a4b-1403117dcc76@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Tue, 16 Feb 2021 15:22:04 +0000
Message-ID: <cunh7mcjaw3.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=2a00:1450:4864:20::42d;
 envelope-from=dme@dme.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2021-02-16 at 16:03:05 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> I am not a block expert, but I wonder if something like this could
> be used:
>
> - create a raw (parent) block image of 64MiB
>
> - add a raw (child) block with your 768kB of VARS file
>
> - add a null-co (child) block of 63Mib + 256kiB
>
> - pass the parent block to the pflash device

I'm not clear how this would behave if there is a write to the device at
(say) 1MiB.

More philosophically, how should it behave?

My expectation was that if the machine says that there is 64MiB of
writable flash, we have to allow writes throughout the full 64MiB and
(significantly) persist them to the backing block device.

Just because the backing block device started out 768KiB big doesn't
mean that we should not write to the remaining extent if that's what the
VM attempts.

Would the above approach achieve that? (It doesn't sound like it.)

dme.
--=20
No visible means of support and you have not seen nothing yet.

