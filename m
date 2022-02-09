Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2FA4AEF22
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 11:19:25 +0100 (CET)
Received: from localhost ([::1]:52944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHk4L-0005Qy-1o
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 05:19:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nHjyG-0000Z9-Ds
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:13:08 -0500
Received: from [2a00:1450:4864:20::632] (port=36388
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nHjyD-00046F-Ul
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:13:08 -0500
Received: by mail-ej1-x632.google.com with SMTP id u20so1487336ejx.3
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 02:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=eK7Z0oZG9SQaQpzWRs08gC6bdY6ABdoSJTxL8CPVJeo=;
 b=QLbCgvCk+SgxlJwZ2Tf37gsDDEYgs25BWAeBNhWgZ/cclhew2CA81xd/nCoU+h5rIa
 Du7+POJYgnf4v1TpgqcQZ670HEKWajRwNW9FxtiefsyoPSLU9sQpCmJQJPSVtJ73lDW1
 2Us+tvYW4uZLM0Yo6c6kpIMVUfvGV9lYtrPuS5QLRlVWdbRupIdlDa02/JJG9W6YX6mP
 s1s5PD4B05GtPvza9uzEraUp9LbZdSPAw1eCHnqLRpo5m4FWBmaHBsfOhath1hlA6e3c
 dgBLVu9qE8yLZK+2iHvz+AB1sY6nlZ62s7JHKKpqUHMKEBkmN4mxHqCga1My4FR3fljh
 vH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=eK7Z0oZG9SQaQpzWRs08gC6bdY6ABdoSJTxL8CPVJeo=;
 b=zXfiv2pqYCFROSfMZPEsb3enfRgWR1uHW3bh6ZHpMwe5Loy3s/CIWpAvhKIo8e/oUs
 pzojcIrhh7DII5KxWUYoPaILbsD4qXT/0YLI2qgX9pJwkoKPVImCtmSm8MgPVCn+FN4G
 pMpIyh7sN3cOnRh/9Wmi0OavuQqjAbOSPgOpG1jgpNswfEIvQzbr6T64iH0RbOd1/fTy
 ce+QOo5n4j55j3gMSzOyIzSpW/T4sm3fj5v4e6Zgjgw1sUiv+kfeOOD+p/98RjXeif8U
 535DhZpWwzH1nlE3ed6KEhM1yMjJmx0WUNyKNewoX6f7icoknwR0HaIA3Ob1MACXbXXi
 x1NQ==
X-Gm-Message-State: AOAM532ZAojVOuDVYs/vuwPqOzLj9rYdIHO494vgESc60Aa19lRyMioc
 pcU58oQ3VbqVjFctKmMwzvYM/g==
X-Google-Smtp-Source: ABdhPJwpB19pN9uYWiCIEAvLJNQa7EIklws1XKSEvBbpVa4ERlENhkN6beMHaWFVrNx6xACtLN49ww==
X-Received: by 2002:a17:906:94d0:: with SMTP id
 d16mr1219960ejy.412.1644401584279; 
 Wed, 09 Feb 2022 02:13:04 -0800 (PST)
Received: from smtpclient.apple ([188.25.251.197])
 by smtp.gmail.com with ESMTPSA id q10sm5869841ejn.3.2022.02.09.02.13.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Feb 2022 02:13:03 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH] Add --with-branding-prefix and QEMU_BRANDING_PREFIX
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <YgOQF0W78MVVsDw6@stefanha-x1.localdomain>
Date: Wed, 9 Feb 2022 12:13:02 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <BB942F04-BF20-4531-A356-DDF7931B1DEB@livius.net>
References: <20220120113545.55820-1-ilg@livius.net>
 <8A1E1B8F-ADA0-4966-A4E9-C0A08EB0A327@livius.net>
 <D6833D18-344A-473E-AC4D-89A64F8AA0EC@livius.net>
 <CAFEAcA91q2t9sVvaW6h3BwFMExgyCdVsb3TozH52EM70aPJt4w@mail.gmail.com>
 <DEEEEB34-BF47-4AD3-99BC-EAB791508D27@livius.net>
 <YgOQF0W78MVVsDw6@stefanha-x1.localdomain>
To: Stefan Hajnoczi <stefanha@redhat.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::632;
 envelope-from=ilg@livius.net; helo=mail-ej1-x632.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 9 Feb 2022, at 11:57, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
>=20
> Is the existing ./configure --with-pkgversion=3D option not enough?

My understanding of --with-pkgversion=3D, based on the fact that in QEMU =
this string is appended to the version, was that it is a suffix that =
describes a specific version.

Most GNU tools, including GCC, binutils, etc, use a similar option, but =
the string is prepended to the greeting message.

In my use case, --with-branding-prefix does the same, QEMU presents =
itself with:

.../xpack-qemu-arm-6.2.0-1/bin/qemu-system-arm --version
xPack QEMU emulator version 6.2.0 (v6.2.0-1-xpack-arm)
Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers

All other binary xPacks (https://github.com/xpack-dev-tools/) do the =
same.

In my opinion, a prefix is preferred, and is consistent with the GNU =
behaviour.

Anyway, having both does not break any backward compatibility and does =
not add any significant overhead/complexity.


Liviu


