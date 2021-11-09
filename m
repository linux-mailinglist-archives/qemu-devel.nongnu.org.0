Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCFF44B1BC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 18:06:10 +0100 (CET)
Received: from localhost ([::1]:40948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkUZV-0004iY-7Z
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 12:06:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkUWP-0005zv-B0
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:02:59 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=36657
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkUWM-00056a-93
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:02:57 -0500
Received: by mail-io1-xd2f.google.com with SMTP id e144so23827689iof.3
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 09:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=sender:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=X8ItMeZ37mFVqAtbkIeRdoyGZpHvhmS2LJZhV7uYzQU=;
 b=Kz2F+XlLoNmWnLmLFlu2rxZ9npvH1YjgWENo6D5WnoR2W4W0LkCojrvXTiMTX4f6LE
 anK8qatiaMv+o9H2iWiss5R/lUr8UcINF1zyC3FG7qlm7To2PztmtawOlpoYy7das+8V
 JocaReGLecHXaIdB16Pdc/PcvBx0zLiErJCjijxq2g4+ksfuhVkxr5dEN1PNlD3ObAfB
 Yh+nRX7vlL1HIjpgMn+cLvaB+xNRgXefRvXpqurrLzezEVLUxLkEcgd/601tYHUk9/Q6
 ttL7Rb9l+A6KTAC/dRE4msOm+13dw7T+GhrGMRJBjZSc/bkLGcZt/mdWEZqkIXPiWgTM
 uz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:mime-version:subject:in-reply-to
 :date:cc:content-transfer-encoding:message-id:references:to;
 bh=X8ItMeZ37mFVqAtbkIeRdoyGZpHvhmS2LJZhV7uYzQU=;
 b=StG43SjTeSLnJFuTkoGa/VdJqO0X877SDmaK8djx8kT977kZ64Bso/3H89qF1zOHXD
 o96r1brM1EbX2apRd6CfBHItm0BYaCQ+sUHEjW7jQ+xFfPf7d63RYPJEa1UGmbs6mSpp
 HvBezitN4m/weYubXANBQcR5MAd/JOyk4iE6N+VlKnzvgd7I6ysQDEWFOyxsdGpY5Wlo
 ncxrK0Isk9fU6wC+IoCNcGMlV+4OF6QhQ/LZZDPGXwmdzdZHzXtCV5ICZo7mFHGPw+O7
 eood6hr9v0EAAKxbFkt1iFFt2GYFBb01FZVMCEeZBSh+8SOOOwhyI79hwuP4xrMxyQsn
 JeuQ==
X-Gm-Message-State: AOAM531WHiBV9xHi6iAjLX1jbISXGj/4052TByWQ3o8JtgtSMHyE+38I
 T8HnWn/9j3LlqocGlBgZuK4IaQ==
X-Google-Smtp-Source: ABdhPJxWJ3iAAaLvfsEDnxoXqjWX2u+UNTFhu1kjZ1RQDLlNwve5elmEoAFngV/9FGOdMN8LmI0Riw==
X-Received: by 2002:a02:a91a:: with SMTP id n26mr7016164jam.46.1636477372559; 
 Tue, 09 Nov 2021 09:02:52 -0800 (PST)
Received: from ?IPv6:2603:300b:6:5100:3543:ecc0:2149:6a1b?
 ([2603:300b:6:5100:3543:ecc0:2149:6a1b])
 by smtp.gmail.com with ESMTPSA id c3sm11281825ilj.70.2021.11.09.09.02.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Nov 2021 09:02:51 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
X-Google-Original-From: Warner Losh <bsdimp@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v2 1/2] linux-user: Move the SPDX license identifier to
 first line
In-Reply-To: <YYOkOW/REA0uXG2L@redhat.com>
Date: Tue, 9 Nov 2021 10:02:50 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <DD690B00-40B9-4CCD-9B2B-F72CA59B965D@gmail.com>
References: <20211104071541.3813306-1-f4bug@amsat.org>
 <20211104071541.3813306-2-f4bug@amsat.org> <YYOkOW/REA0uXG2L@redhat.com>
To: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=wlosh@bsdimp.com; helo=mail-io1-xd2f.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>, Taylor Simpson <tsimpson@quicinc.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Nov 4, 2021, at 3:13 AM, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>=20
> On Thu, Nov 04, 2021 at 08:15:40AM +0100, Philippe Mathieu-Daud=C3=A9 =
wrote:
>> Tools consuming SPDX license identifiers benefit from having
>> the SPDX tag in its own comment, not embedded with the license
>> text. Move the tag to the first line.
>=20
> Do you have an example of such a tool which has problems ?
>=20
> AFAIK, guidance for adding SPDX tags merely says they should
> be in a comment near the top of the file.
>=20
> I wouldn't expect license scanners to care about the acutal
> comment syntax. Proper tools would be designed to scan for
> tags in *any* file format, so would be unlikely to be parsing
> the C code comments at all. Rather scanners would be just
> looking for the magic string "SPDX-License-Identifier" in
> the file. Use of comments is merely to stop the C compiler
> interpreting the tag.
>=20
> It makes sense to have the SPDX tag as the first thing in
> the file, but I don't see a compelling need to make it into
> its own dedicated opened + closed comment, separately from
> the license header comment.

The SPDX=E2=80=99s tools don=E2=80=99t require the proposed changes. Nor =
does
the SPDX standard which says that the lines can be anywhere in the
file. The reuse.software additions to this standard add additional
ways to mark binary files, but otherwise says the same thing.

The FreeBSD project has been marking files with SPDX tags for years
and has never once encountered this issue.

Warner

> Regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    =
https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            =
https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    =
https://www.instagram.com/dberrange :|
>=20
>=20


