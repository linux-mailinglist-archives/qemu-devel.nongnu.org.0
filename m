Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755DB5A9BED
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 17:43:25 +0200 (CEST)
Received: from localhost ([::1]:45650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTmLk-0007b2-0O
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 11:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1oTmJo-00054C-Nz
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 11:41:24 -0400
Received: from rev.ng ([5.9.113.41]:39123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1oTmJm-0002lU-Sr
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 11:41:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h6Bh1bOw/1mczEhfQY1uBYB8ZcZwNCoVP0ZrDE0OJ30=; b=NFot+HnJrpFLIuxo4nmRVUm61S
 qy5BDaGEgt8PMUj+2xcClmdMfubuAPEasLFnS94VX6GA0qfuuKfvjlSteuuwuh8QmyeE5K/hcuP1e
 uFdfycWGgo5DVw9CM1pkMrOyTxynS2EZXteK5dzzR8UDzY9EU9SOPcSpY3vcGyz0MsYk=;
Date: Thu, 1 Sep 2022 17:41:00 +0200
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Mark Burton
 <mburton@qti.qualcomm.com>, Bill Mills <bill.mills@linaro.org>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Michael Rolnik <mrolnik@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, =?UTF-8?B?Q8OpZHJpYw==?= Le
 Goater <clg@kaod.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair
 Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 David Gibson <david@gibson.dropbear.id.au>, Markus Armbruster
 <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>, Luc Michel
 <luc@lmichel.fr>, Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: Any interest in a QEMU emulation BoF at KVM Forum?
Message-ID: <20220901174100.3297349f@orange>
In-Reply-To: <87a67kphih.fsf@linaro.org>
References: <87a67kphih.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Reply-to:  Alessandro Di Federico <ale@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

I'm very interested too. Thanks for organizing this, Alex!

In particular we're interested in the infrastructure work to enable
having a single build of QEMU using several different TCG frontends,
which is probably preliminary to heterogeneous vCPU emulation.

In fact, I was going to send an RFC about this to qemu-devel, but KVM
Forum + this BoF seemed like a good opportunity to discuss this. I
might share it later, if you're intersted.

Will the BoF pop up in the program or will it be something informal?
According to the schedule, there are BoFs Mon 17.40 and Tue 17.40.

Catch you in Dublin and thanks again for setting this up.

-- 
Alessandro Di Federico
rev.ng Labs

