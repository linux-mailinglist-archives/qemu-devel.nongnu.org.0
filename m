Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57166D95AC
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 13:35:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkNg4-0004hL-Sd; Thu, 06 Apr 2023 07:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fw@strlen.de>) id 1pkNfw-0004gp-Jy
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 07:21:09 -0400
Received: from chamillionaire.breakpoint.cc ([2a0a:51c0:0:237:300::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fw@strlen.de>) id 1pkNfu-0007wb-6E
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 07:21:08 -0400
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
 (envelope-from <fw@strlen.de>)
 id 1pkNfl-0007J1-JS; Thu, 06 Apr 2023 13:20:57 +0200
Date: Thu, 6 Apr 2023 13:20:57 +0200
From: Florian Westphal <fw@strlen.de>
To: =?iso-8859-15?B?THVr4ag=?= Doktor <ldoktor@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Florian Westphal <fw@strlen.de>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: Re: qemu-nbd performance regression in bd2cd4a4
Message-ID: <20230406112057.GA22728@breakpoint.cc>
References: <3ffec0e7-7a4e-f31f-9a80-43eff755d72b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ffec0e7-7a4e-f31f-9a80-43eff755d72b@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a0a:51c0:0:237:300::1; envelope-from=fw@strlen.de;
 helo=Chamillionaire.breakpoint.cc
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Luká¨ Doktor <ldoktor@redhat.com> wrote:
> Fio job (executed via pbench, let me know if you need simplified steps with fio only):

That would be useful, thanks.

I suspect revert is useless because upcoming TCP_NODELAY change will increase
small packet rate too.

