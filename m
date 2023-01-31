Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C1E68326A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 17:18:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMtJy-0005Ux-69; Tue, 31 Jan 2023 11:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conlanc@csail.mit.edu>)
 id 1pMtFb-0004rd-E2
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 11:12:51 -0500
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conlanc@csail.mit.edu>)
 id 1pMtFX-0003Sr-0j
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 11:12:50 -0500
Received: from pool-98-118-100-52.bstnma.fios.verizon.net ([98.118.100.52]
 helo=[10.0.0.49])
 by outgoing2021.csail.mit.edu with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <conlanc@csail.mit.edu>) id 1pMtFP-0028A9-V2;
 Tue, 31 Jan 2023 11:12:39 -0500
Message-ID: <9c5a6b24-ce6b-b43d-aace-63af74fb6c38@csail.mit.edu>
Date: Tue, 31 Jan 2023 11:12:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4] fcntl: Add 32bit filesystem mode
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>, Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>
Cc: Peter Maydell <peter.maydell@linaro.org>, linux-api@vger.kernel.org,
 qemu-devel@nongnu.org, =?UTF-8?B?572X5YuH5Yia?= <luoyonggang@gmail.com>,
 Florian Weimer <fw@deneb.enyo.de>, Andy Lutomirski <luto@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
References: <20201117233928.255671-1-linus.walleij@linaro.org>
From: Conlan Cesar <conlanc@csail.mit.edu>
In-Reply-To: <20201117233928.255671-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.30.2.78; envelope-from=conlanc@csail.mit.edu;
 helo=outgoing2021.csail.mit.edu
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 31 Jan 2023 11:17:19 -0500
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


> It was brought to my attention that this bug from 2018 was
> still unresolved: 32 bit emulators like QEMU were given
> 64 bit hashes when running 32 bit emulation on 64 bit systems.
>
> Reported-by: 罗勇刚(Yonggang Luo) <luoyonggang@gmail.com>
> Suggested-by: Theodore Ts'o <tytso@mit.edu>
> Link: https://bugs.launchpad.net/qemu/+bug/1805913
> Link: https://lore.kernel.org/lkml/87bm56vqg4.fsf@mid.deneb.enyo.de/
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=205957
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
Sorry to bump an old thread. Just wanted to note that the applicable 
qemu bug has been migrated to GitLab.

Link: https://gitlab.com/qemu-project/qemu/-/issues/263


