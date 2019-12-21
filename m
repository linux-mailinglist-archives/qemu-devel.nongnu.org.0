Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F54128BC8
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Dec 2019 23:27:07 +0100 (CET)
Received: from localhost ([::1]:42548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iinDF-0003VH-9c
	for lists+qemu-devel@lfdr.de; Sat, 21 Dec 2019 17:27:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60377)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <deller@gmx.de>) id 1iin8l-0002eU-LJ
 for qemu-devel@nongnu.org; Sat, 21 Dec 2019 17:22:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <deller@gmx.de>) id 1iin8j-0000yd-8u
 for qemu-devel@nongnu.org; Sat, 21 Dec 2019 17:22:27 -0500
Received: from mout.gmx.net ([212.227.15.19]:58799)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <deller@gmx.de>) id 1iin8i-0000lq-P1
 for qemu-devel@nongnu.org; Sat, 21 Dec 2019 17:22:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1576966928;
 bh=pCn4i1SbTSMHmQJ+dROqb9qAwqfCH02LNepcX5UC92s=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=fCV3mdV0Aye0enS3s105icU1NvviPMfiQt40tk6SffgNTBGg9OJqNB0ZtmLwFUfba
 Ije10yZ1kc0y2Z2tdbdraKpFoOpt0/UllYbPb6AtyaKcxITqEhKXdwen7kdjQhi9MY
 /9aSsMlCK4wkd7uMvWuXUJAt0AxMHcoCo8tWkR3c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.169.139]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPXd2-1iMICY1uUs-00MYvf; Sat, 21
 Dec 2019 23:22:08 +0100
Date: Sat, 21 Dec 2019 23:22:05 +0100
From: Helge Deller <deller@gmx.de>
To: Sven Schnelle <svens@stackframe.org>
Subject: Re: [PATCH v5 0/6] HPPA: i82596, PS/2 and graphics emulation
Message-ID: <20191221222205.GA27749@ls3530.fritz.box>
References: <20191220211512.3289-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191220211512.3289-1-svens@stackframe.org>
X-Provags-ID: V03:K1:UQFhKL07WGl6Myw9Y7tRzTWsOYI8ibAM5/f7CEelecXq/i4Rm/U
 JWYOSb+TbCa/oG4iNcjFcOtoBfYGA4/3GDQZuz6a99WeM9L+LCKnpnB5lRD7zaqZof8DAx9
 wxHTgQK05nBmk8Gn+lbxQAxjxDdmP16IAUXybLdbitQCT3m66a/HIryCGiIHCcpgx5WX3Jl
 jNry54XfKQYuBRHV61DWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KBnMt7RFdp4=:smEoIwZEaY2vDM8ceiciDk
 QDM6wO9AKxvwk4UktaOpvSmlVLcri/K/6UvG/aCJvWPxZNPDqlqO0VoYBEoBnCNwa0xuCd/Ey
 JWChk350jsP5yi10HoMgEDeIZye1M0KYmnCXineYcQQ069aM1pkRj3gWDSx/dITh6B+YnNhJg
 mvpSLbMgmyjIenqDYJeH5mZY6qFoKYZBeu0WUvrQTJYs+4I3Xr8kNclFiZz91M2oTKsV1kSUn
 33hWpVSSGf3qQ2zfZnbg79QMklXFTeiCyLm650SsxEGNTJdHTJGDxlxd9iddV7l7dZk0sfTRS
 D0FZvG260pLaUJLMcPng9OczmHJnvV2OWrf37NO3bH4Xm59nUgvfh2AwW3mqg9Lb7OBAOpnLS
 umQabdCg+eT3uK9Ea3ftFdr0gplCc5uuRibWZm3linrK408BjmV088wFkXSOV57CKtm4bFZB+
 lLCh9iFyiUb2tgztHFEwvflSPZ++sR6kxThy5yWe2BKPDTaBof6/Yv0++kFV7PnYDUNfLeoC5
 Cke4smNwpmXfUMXMkIC2nfsGrh++ZNlGcgaoNiPQlTBSlpnSP1RekV/Lv5IjpGIoNaVwUXG+7
 MCpQs15YmFv22TlGfQDuLkK5OLYcMezfeVHCAqjcgjX5TW3bHp/ci9RMpYMt7CY0bxWIEnRwi
 xue6aolOEvlUF8GbqeLbPCY/Y2S3ygBNJtGdlB7iYGPWV/DbkP8Ohb6P+rs0NQJ+jJjVVqP3U
 cjsuFKsqQxJylW6mkTXAnp184/OgYYf2S1qZiBygeerDIXioTW1Qy0Xo367cBh0CGVEqGNmzm
 oDlJxoK+X6NmYarYZsiQnBvKqjcyWaTjunlODFj2+QKALEGPIzZRMTg1UdHHPKtl2ZaNsnN6l
 erWbeVN8MY4JLxWFdgj7d+IhvwBOD6MC/1238xJwt1OPNuUN/7gBfjdSj83L5eBn9ypdfdwYy
 xOuU/rr0ueM1tMI4tihvz8aFl9pfzjxq3pUhYYK931LE1gDXUlMn0sh88fme/Hk2U0EmccdO5
 Ef+fnitGGsTF5gUl4rpT1ypR6ocsUm5QDLm+OnNSMsp02cgRJrchjis+wvy87jJ6V03EbdYkv
 LA6+m5OSsicod8OSh70goWzBs1ih98ZNfzeY1TNTkbDwr8DnTiwJBhxodCkEcd2K+nH48dYZe
 Vmyl2XSaLF++o8aoOEzB3YbfX+im6KaS2iEUftufLYZVemCCjMCm8jYSA0h2kyypDKsBO9dO3
 cBcM35oEbAjfelCPGwvlXky+wxGIGvmKx6IftBA==
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.15.19
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
Cc: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Sven Schnelle <svens@stackframe.org>:
> these series adds quite a lot to the HPPA emulation in QEMU:
> i82596 emulation from Helge, PS/2 and Artist graphics emulation.
>
> See https://parisc.wiki.kernel.org/index.php/Qemu for a few screenshots
> of QEMU running a X11/CDE session in HP-UX.

Sadly those screenshots were dropped by mistake in the last kernel wiki
migration. It's being worked on to restore them...

Sven or Richard, can you please on top of the patches sent by Sven,
include the next two patches as well? They fix up the serial console
when booting into Linux with the "-nographic" qemu option, and the
second patch switches to tulip network card instead of the e1000.

Helge

