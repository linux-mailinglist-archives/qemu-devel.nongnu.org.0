Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4FD31BB76
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 15:55:55 +0100 (CET)
Received: from localhost ([::1]:57986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBfI2-0003Ed-FT
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 09:55:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <macro@orcam.me.uk>) id 1lBf96-0008IE-3A
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 09:46:40 -0500
Received: from angie.orcam.me.uk ([2001:4190:8020::4]:44118)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <macro@orcam.me.uk>) id 1lBf94-0002Rs-9f
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 09:46:39 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id D80BC92009D; Mon, 15 Feb 2021 15:46:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id D243E92009C;
 Mon, 15 Feb 2021 15:46:29 +0100 (CET)
Date: Mon, 15 Feb 2021 15:46:29 +0100 (CET)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Fredrik Noring <noring@nocrew.org>
Subject: Re: [RFC PATCH 41/42] tests/acceptance: Test R5900 CPU with BusyBox
 from Sony PS2
In-Reply-To: <YCqE+QCFbsW4MVmJ@sx9>
Message-ID: <alpine.DEB.2.21.2102151541290.1521@angie.orcam.me.uk>
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-42-f4bug@amsat.org> <YCqE+QCFbsW4MVmJ@sx9>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2001:4190:8020::4; envelope-from=macro@orcam.me.uk;
 helo=angie.orcam.me.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 15 Feb 2021 09:53:33 -0500
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Feb 2021, Fredrik Noring wrote:

> For n32, there's a provisional patch that needs reworking to get merged
> (to have libc emulate DMULT etc. rather than the kernel/QEMU).[1]

 FWIW I think standard `-march=mips3' n32 Linux binaries need to work with 
the R5900, and therefore the kernel will have to emulate the missing part 
of the ABI (since years ago we chose to have it in the kernel rather than 
in a SIGILL handler).  The patch proposed only allows building GNU libc 
with `-march=r5900' which I find an optional feature (I don't know offhand
what advantages over `-march=mips3' would be there).

  Maciej

