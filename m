Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52D442E53C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 02:24:23 +0200 (CEST)
Received: from localhost ([::1]:36304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbB1L-0002HK-2q
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 20:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1mbAzy-0001Og-CY
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 20:22:58 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:36445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1mbAzm-0007s1-Jf
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 20:22:58 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 z77-20020a1c7e50000000b0030db7b70b6bso1153364wmc.1
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 17:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=RtGSeF18AHbGGCtalx1TjNUR7x+ffLJYG18ZQcneRmI=;
 b=hdueYHs0Jb9+y6x7JU5XK0IT/uYUe6r7+PizXGaqdrgPxKUDXF8FWDsOshR1I61Hmq
 2d1aZMmfY34hJBXaC8BdEcWA9bctP0IaSiJDTJQJhHDnmytve14u9m8CxbbC442tCqyI
 Na0EISaXMeVRt4MIHB4KqV5IG1jhQzSIqT35T7gbbgxpAx4EgEfVsHId9aDvTiGA7pfe
 YGfGgLB0DuR6bS/oSQ8rnI3FRYolElIoNawC3rXulRURySHVeulBpUHyNS3FVEi2xOU4
 QbwqHEuflpCPRrWGnTi3ZJI3Ev9mxBf5ej6Q032J1Dc9Ec4+g793pcAkmjpc4Z34BWZf
 NA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=RtGSeF18AHbGGCtalx1TjNUR7x+ffLJYG18ZQcneRmI=;
 b=6qUuC0ZvarJYiamjDP563H3L06IJ5Gd/oGuS4dRjguazI9ZBQjhSVCXupIrZfYBYSG
 x068T+bEVPB5WoOo9SUfAxvaQN01xKy8N5snFCJ/RAlSIGTFKZ+2Q+odIkT5c8r8FD4a
 C2KRRrvYVI+YJt67tFBDfOmCYRqUj7gtSom+uQS8/qAAXjJZisvgdEp18vZajtOaUvDU
 pMBKqtNcqUY7CZ+A643UePVLMT3O+B5LSsds+res2++yrkZIMbSaSyxhqv2ZSItZLnjr
 L9N0yuhaJqgaFe4bGUdmj4uoncfRboPNLgbmLFYJ+wo11i2iF0H+w4jDoYEJs8fGKV3f
 CBdA==
X-Gm-Message-State: AOAM5320s2fUGzeOj2rN3Yj4+rONG5ZJIq8MdiyE5jjAca6zs0KqYooU
 odZ6TNPJj5rYUxY1QKTLdd2+mw==
X-Google-Smtp-Source: ABdhPJxdNVmfpCEexgyUrrsiIN7LWlPog8Z9m6n4CG80W2VdC2R2bXGi2VxFIdVqmWeWm5ubhJAc3Q==
X-Received: by 2002:a7b:c350:: with SMTP id l16mr22435178wmj.151.1634257363983; 
 Thu, 14 Oct 2021 17:22:43 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk.
 [131.111.5.141])
 by smtp.gmail.com with ESMTPSA id x7sm3453599wrq.69.2021.10.14.17.22.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Oct 2021 17:22:43 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v2] Partially revert "build: -no-pie is no functional
 linker flag"
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <5c3e7913-3a4e-fe78-fd88-ba550e119ddb@linaro.org>
Date: Fri, 15 Oct 2021 01:22:42 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <CD50CA90-5028-487B-A3FD-CF320ECD0949@jrtc27.com>
References: <20210805191430.37409-1-jrtc27@jrtc27.com>
 <20210805192545.38279-1-jrtc27@jrtc27.com>
 <163425424356.2158.16851994446465453609@amd.com>
 <5c3e7913-3a4e-fe78-fd88-ba550e119ddb@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=jrtc27@jrtc27.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Christian Ehrhardt <christian.ehrhardt@canonical.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15 Oct 2021, at 01:12, Richard Henderson =
<richard.henderson@linaro.org> wrote:
>=20
> On 10/14/21 4:30 PM, Michael Roth wrote:
>> Quoting Jessica Clarke (2021-08-05 14:25:45)
>>> This partially reverts commit =
bbd2d5a8120771ec59b86a80a1f51884e0a26e53.
>>>=20
>>> This commit was misguided and broke using --disable-pie on any =
distro
>>> that enables PIE by default in their compiler driver, including =
Debian
>>> and its derivatives. Whilst -no-pie is not a linker flag, it is a
>>> compiler driver flag that ensures -pie is not automatically passed =
by it
>>> to the linker. Without it, all compile_prog checks will fail as any =
code
>>> built with the explicit -fno-pie will fail to link with the implicit
>>> default -pie due to trying to use position-dependent relocations. =
The
>>> only bug that needed fixing was LDFLAGS_NOPIE being used as a flag =
for
>>> the linker itself in pc-bios/optionrom/Makefile.
>>>=20
>>> Note this does not reinstate exporting LDFLAGS_NOPIE, as it is =
unused,
>>> since the only previous use was the one that should not have =
existed. I
>>> have also updated the comment for the -fno-pie and -no-pie checks to
>>> reflect what they're actually needed for.
>>>=20
>>> Fixes: bbd2d5a8120771ec59b86a80a1f51884e0a26e53
>>> Cc: Christian Ehrhardt <christian.ehrhardt@canonical.com>
>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>> Cc: qemu-stable@nongnu.org
>>> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
>> Ping. --disable-pie builds are broken on Ubuntu 20.04 without this =
regression
>> fix. Looking to include it for v6.0.1/v6.1.1.
>=20
> Sorry, missed this the first time around.
>=20
> I think a better fix is to remove the direct invocation of ld in =
pc-bios/optionrom/Makefile, and instead rely on the compiler driver.  =
All of the local ldflags can be passed through via -Wl, but we'd get =
no-pie via CFLAGS_NOPIE.

I am not changing anything about pc-bios/optionrom/Makefile. Whether
you want to remove direct ld invocation or not, these changes are
needed to reinstate --disable-pie support for everything else, which is
currently broken. The only reason to mention pc-bios/optionrom/Makefile
in the commit message is to explain why the original commit did what it
did and what part of it is legitimate (even if there are better ways to
have done it) and thus not reverted in this patch.

Jess


