Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FB231BA84
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:49:18 +0100 (CET)
Received: from localhost ([::1]:34678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBeFZ-0002Cz-Af
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:49:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1lBeCJ-0000qW-LY
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:46:00 -0500
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:21626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1lBeCH-00011u-O6
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:45:55 -0500
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id D9D6F3F739;
 Mon, 15 Feb 2021 14:45:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Score: -1.901
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fSq_Hsp-U2A6; Mon, 15 Feb 2021 14:45:47 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 422753F5D8;
 Mon, 15 Feb 2021 14:45:45 +0100 (CET)
Date: Mon, 15 Feb 2021 14:45:45 +0100
From: Fredrik Noring <noring@nocrew.org>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [RFC PATCH 32/42] docker: Add gentoo-mipsr5900el-cross image
Message-ID: <YCp7Ce6ELbLFvRXZ@sx9>
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-33-f4bug@amsat.org>
 <20210215115957.GG1542881@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210215115957.GG1542881@redhat.com>
Received-SPF: softfail client-ip=213.80.101.71; envelope-from=noring@nocrew.org;
 helo=ste-pvt-msa2.bahnhof.se
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 15, 2021 at 11:59:57AM +0000, Daniel P. Berrangé wrote:
> On Sun, Feb 14, 2021 at 06:59:02PM +0100, Philippe Mathieu-Daudé wrote:
> > Add a Docker image providing cross toolchain for the MIPS R5900 CPU
> > (used on the Sony PS2).
> > 
> > This image is based on Gentoo and the toolchain is built using crossdev.
> 
> Is there any way we can do this with a distro that isn't Gentoo
> so that we can get a container build that is fast enough to be
> useful for CI ?

Is it necessary to rebuild the toolchain every time? Also, perhaps a
generic MIPS suite can be used; it shouldn't to necessary to have one
specifically made for the R5900 (except libc, if needed, I guess).

As an alternative, TobiX at Github made an R5900 Docker image last year
<https://github.com/frno7/linux/issues/33#issuecomment-632284209>,
perhaps it could be useful somehow?

Fredrik

