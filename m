Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889304909AD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 14:44:26 +0100 (CET)
Received: from localhost ([::1]:57788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9SJ7-0000gz-Ag
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 08:44:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n9Ri6-0006OM-FF
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:06:11 -0500
Received: from [2a00:1450:4864:20::529] (port=37760
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n9Rhx-0005Pr-LF
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:06:06 -0500
Received: by mail-ed1-x529.google.com with SMTP id j7so16873481edr.4
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 05:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=6MkfaMCh2MDkpUiFGTUWW3xB1cslD/ksNGP3W9LXGcU=;
 b=pqrnGSwWg093QZyDWBRus9M892BHk4mggJ/e4jp3x/h9NaukenjejPtWoQpdRb807t
 f+L/tiwch+3RA5eys9V3h8tAt6VKZlQPBlXsocpo8buYDf3svHlJ2X6vChpGe+tuhcau
 z9c3gcNgwyq29uZKR+IPY8fNSJlkxoDNlIuSaiPrCv7+iw/J6aXJpHlJgfoceA8LycWS
 puFYukskax8utJWOuof74a0VUGRHQGKwpzz1VSFLROjit+njeuki/vcCTfCa94l/SJv2
 SfI8UaCuIT542wq2yus9x9Zd+zDi+6zq9fBlezP/oSDACmIBRExVPLjrclwv4eOawI0P
 3+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=6MkfaMCh2MDkpUiFGTUWW3xB1cslD/ksNGP3W9LXGcU=;
 b=KZ6rtPWDQvvbxc4qAcpan5w0q4mHYKgHYpqyUdqyBr5ad8qk2MoWIfZGt/pvtWkwt8
 knDG0SKb1kjVK8qtO1tD4YjX0xLiY0quEyw8Qqx8fGr46cQF2GY3KlFrZrnuEdcbi8lI
 cObz758uceOT3NnZQoYAJL56r7yl34sAvmnrZ28L/27ci6gFTHgJK/dI0hapnfyYvw90
 HXXEyNzWOq9F7KcxH0Jp+8T1cxY25KcnvmPW/rkmTPMdYefZSwGh7zt6pJ0rIQCax0fp
 FhRVVh97ksDs5ZP4u3r6vBlsqjABXjanbnGpxRu1XxoNQGnRkiGmpeVHh4TKUin62dKv
 +1/w==
X-Gm-Message-State: AOAM532K3aSByq5OhyhnjA9a4z4p8sCD60aQ5UbgvxX6EEo22iVUoNOF
 FX+b3rO/a6wpAf0Xn8wni9JAyA==
X-Google-Smtp-Source: ABdhPJwSPRSV7LdGp2H/2DA3U222PBZyOoHileV/nLeWDXbOqkSnjtCYN/JwSJLPOLvm1gvfq+BaAg==
X-Received: by 2002:a05:6402:518c:: with SMTP id
 q12mr20369860edd.312.1642424758837; 
 Mon, 17 Jan 2022 05:05:58 -0800 (PST)
Received: from smtpclient.apple ([79.115.178.1])
 by smtp.gmail.com with ESMTPSA id by26sm2995597edb.31.2022.01.17.05.05.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jan 2022 05:05:58 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: ui/cocoa.m compile error (Cocoa -> SDL)
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <CAFEAcA9sNksi2=xiFUp_r0_NeCuUKXYU6sd1LDvX=j0+Mh3gYQ@mail.gmail.com>
Date: Mon, 17 Jan 2022 15:05:56 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <E0050B48-D285-415E-8CD9-4824C1F05AF1@livius.net>
References: <586FEC07-844C-4E1B-88E0-93B97FFC9010@livius.net>
 <CAFEAcA_=jn1G==9R1=LuU7GF0=LWPz92f1Qx9xO7w+m+TqL1Tw@mail.gmail.com>
 <F140E9AC-F44C-44A9-8670-F60E33046B83@livius.net>
 <574D1950-B892-430B-A450-23262C258950@livius.net>
 <ef5e98d4-d8b2-fc6e-2735-53c075db3f3b@redhat.com>
 <CCB6E84E-5F90-4FC6-BEEB-42A7C591BDBF@livius.net>
 <CAFEAcA9sNksi2=xiFUp_r0_NeCuUKXYU6sd1LDvX=j0+Mh3gYQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::529;
 envelope-from=ilg@livius.net; helo=mail-ed1-x529.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 17 Jan 2022, at 13:35, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> ... the macOS host support in QEMU is not very well
> maintained, so the default is "it doesn't change"

BTW, my main development platform is macOS, both Intel and Apple =
Silicon, so if someone is willing to improve macOS host support in QEMU, =
I can help with testing.

My experience with Cocoa is close to none, but with SDL2 I had a light =
contact when I implemented the animated LEDs in =
qemu-system-gnuarmeclipse.


Regards,

Liviu


