Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CC6689A00
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 14:46:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNwNy-0001F4-DB; Fri, 03 Feb 2023 08:45:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pNwNI-0001Dw-II
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 08:45:08 -0500
Received: from doohan.uni-paderborn.de ([2001:638:502:c003::16])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pNwNF-0006yJ-4n
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 08:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=18vF8qt298Z/otsbMksr1LPuuJzSpWBf26RYqySaCn8=; b=eoP11q5K0Gy8d75Lmklzr860C4
 cMWgFPPVsedSoliO6+B3c0gm9ypUHcJ+JWdCL6a5M3Nvvz4aVX3/JOQo7fFVZ2ZBSH6GNyornDBtJ
 dXROgjv8wMMh55KVAORiAQCCWgrxza0k70AtfdcsE3sIkw/NJMAT9kep5BFeiALPNQSQ=;
Date: Fri, 3 Feb 2023 14:44:59 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Phil =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: tricore container toolchain build broken again
Message-ID: <20230203134459.lh7wwp25ripo6pop@mustique.upb.de>
References: <CAFEAcA-Vr8=br=9jGU1Tr=HTyH6o+S9H79oG=6BqZb8FSp+2Tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-Vr8=br=9jGU1Tr=HTyH6o+S9H79oG=6BqZb8FSp+2Tw@mail.gmail.com>
X-IMT-Source: Intern
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.2.3.133617, AntiVirus-Engine: 5.96.0,
 AntiVirus-Data: 2023.1.24.5960001
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::16;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=doohan.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Peter,

On Fri, Feb 03, 2023 at 01:19:32PM +0000, Peter Maydell wrote:
> The tricore container toolchain build is still not reliable.
> 
> Latest failure:
> https://gitlab.com/qemu-project/qemu/-/jobs/3710561054
> 
> #6 43.63 ldlex.l: In function 'yy_input':
> #6 43.63 ldlex.l:615:7: error: 'yy_current_buffer' undeclared (first
> use in this function); did you mean 'yy_create_buffer'?
> #6 43.63 {
> #6 43.63 ^
> #6 43.63 yy_create_buffer
> 
> Any ideas ?

the binutils version we are using is very old. This year I got my hands on a
newer version (which also includes gcc) [1]. I think upgrading should solve
these build failures.

I'm looking into creating a precompiled binary for this docker image, so we
don't have to build binutils on CI minutes.

Cheers,
Bastian

[1] https://github.com/bkoppelmann/package_940

