Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE094B503E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 13:34:11 +0100 (CET)
Received: from localhost ([::1]:41456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJaYU-0006p7-To
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 07:34:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nJaB0-00075d-Cl
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:09:55 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:56467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nJaAy-0007pV-5i
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=toDLzzpMh/lT4emu+V1iaG7LqW7+vzP/Y3AugarSpGQ=; b=ANgf/urMF5cNoFW2pzV0ULlSUK
 +uJVDKFtdrk8fFNqGTsRKk2iBe1wlIzBQO3mpUa5S7yCbnojiECcgasDFm0eLKS2C3t8guj/oocSP
 VtUKQa8qtYl7rKVOl6vang6YTy8jshtf9gyiVJVxzToSnK+xljWwq/uS36u2oLzz0c+tq9JrmOMWT
 US1DkHebOfH/5rM9/DvhailIf2/Gb8Wu8Pkn3AdfyoqD1wBKTWOWk+Rj8t4idagVtxeAiV4W7tRom
 092ueBtZ85nXZVpR+MHfMHjvziE7uvm8GzyphH9QrPponDgz6KR9mKJRRqUbFjnNBsvktkudmUep0
 CTCjcX4U94UAzmcYp8IzJvzNGBfwsLG1GTQkTaoXzD0/pubdTxilh5Nx0lRbEIneOnqZzOjPaHfgN
 FVixu6ILPTNrR2F1+Lx44cOqyQJicxFT0iodIwVdwxv8WEl4U4SlAxw5qn7QzxqNTbCRSgdkalO1g
 l2l1rc3jD/Lh+scmYXjlfrU0434slYffqMtfRrmIvy0zmzgdrY2xzFS/wqjupmUhfIUl74Dc7hTCs
 yoUTsAwEkAdbUOyCCLF9TrVkSiFKZTy+gIpRuF4apkoSO0BJ87HGfRWsE0kGKja2i52XCR4EFQTY7
 wl15fBpTGYKOXbyPAeG+sHL8XLkeg55MDxL0K64nY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Vitaly Chikunov <vt@altlinux.org>,
 "Dmitry V . Levin" <ldv@altlinux.org>, Greg Kurz <groug@kaod.org>
Subject: Re: [PULL 0/5] 9p queue 2022-02-10
Date: Mon, 14 Feb 2022 13:09:48 +0100
Message-ID: <2563382.p5drSlMS5x@silver>
In-Reply-To: <CAFEAcA9vHYw=hKaRqw4LBk7dHReR43duoCCEpH-VC2sEXoQKHA@mail.gmail.com>
References: <cover.1644492115.git.qemu_oss@crudebyte.com>
 <2037112.271zI61438@silver>
 <CAFEAcA9vHYw=hKaRqw4LBk7dHReR43duoCCEpH-VC2sEXoQKHA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 14. Februar 2022 10:55:17 CET Peter Maydell wrote:
> On Mon, 14 Feb 2022 at 09:47, Christian Schoenebeck
> 
> <qemu_oss@crudebyte.com> wrote:
> > So this is about the 'dirent' patch:
> > https://github.com/cschoenebeck/qemu/commit/de19c79dad6a2cad54ae04ce754d47
> > c07bf9bc93
> > 
> > In conjunction with the 9p fuzzing tests:
> > https://wiki.qemu.org/Documentation/9p#Fuzzing
> > 
> > I first thought it might be a false positive due to the unorthodox
> > handling of dirent duplication by that patch, but from the ASan output
> > below I am not really sure about that.
> > 
> > Is there a way to get the content of local variables?
> 
> Yes. You can build locally with the clang sanitizers enabled and then
> run under gdb and with the appropriate environment variables to tell the
> sanitizer to abort() on failures.

Well, it does no longer matter for this particular issue here, but it would be 
useful if the CI scripts would already dump the local variables to the logs. 

E.g. because the patch in question was about system dependant variations.

Another reason is the random data nature of fuzzing tests. Even though the 
latter could probably be reproduced with an appropriate seed.

Best regards,
Christian Schoenebeck



