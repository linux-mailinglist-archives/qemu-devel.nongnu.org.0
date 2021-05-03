Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D52A371315
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:37:46 +0200 (CEST)
Received: from localhost ([::1]:54190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldV1N-0006tx-6r
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@walle.cc>) id 1ldUu8-0003Wh-Fw
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:30:17 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:48217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@walle.cc>) id 1ldUu4-0006vo-4m
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:30:16 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3EACC22255;
 Mon,  3 May 2021 11:30:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1620034205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OIjxzKmQjEu1Zd6z8XqlVmwPTlS3QLLg3a3TWrYIHJc=;
 b=F4UlIJMpUdR6UhLLjaF3fQtZOD0Hl5hSHSaokljNIGAA1T4Yz9Xa5abJ2tJoSkQvjytHRE
 Fn9/hI5kJfSttiqAx09wvsiAilTKFyg9hyQR0dFZW0f/+O52rOgy8g/HAxPNFwK/SXvwtB
 lij3H8yJhw9MTpi1/l5ISF9fIQdbKRs=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 03 May 2021 11:30:04 +0200
From: Michael Walle <michael@walle.cc>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/2] Drop the deprecated lm32 target
In-Reply-To: <20210503084034.3804963-2-armbru@redhat.com>
References: <20210503084034.3804963-1-armbru@redhat.com>
 <20210503084034.3804963-2-armbru@redhat.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <c8a153ce872c6df9e9433291dc41edad@walle.cc>
X-Sender: michael@walle.cc
Received-SPF: pass client-ip=176.9.125.105; envelope-from=michael@walle.cc;
 helo=ssl.serverraum.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 2021-05-03 10:40, schrieb Markus Armbruster:
> Target lm32 was deprecated in commit d8498005122, v5.2.0.  See there
> for rationale.
> 
> Some of its code lives on in device models derived from milkymist
> ones: hw/char/digic-uart.c and hw/display/bcm2835_fb.c.

yaay ;)

> Cc: Michael Walle <michael@walle.cc>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Acked-by: Michael Walle <michael@walle.cc>

