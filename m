Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFF2557E70
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 17:07:50 +0200 (CEST)
Received: from localhost ([::1]:57756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4OQv-0005eO-AL
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 11:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu-devel@mq32.de>)
 id 1o4OP2-0004EN-Qv
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:05:52 -0400
Received: from mout-p-202.mailbox.org ([80.241.56.172]:55070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <qemu-devel@mq32.de>)
 id 1o4OP0-0005PA-Vm
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:05:52 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4LTNqG1Q66z9sQH
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 17:05:46 +0200 (CEST)
Message-ID: <020edc4f-32b2-fa76-12b8-cc0a455a8233@mailbox.org>
Date: Thu, 23 Jun 2022 17:05:45 +0200
MIME-Version: 1.0
Subject: Re: [Qemu-devel] [PATCH] gtk: Add show_tabs=on|off command line
 option.
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <56D0203F.5060303@gmail.com>
 <b95df229-3cb9-1646-e7fd-c68ad4f03bfd@mailbox.org>
 <51e36301-d056-85bf-447a-2d0b9e6ad251@redhat.com>
From: =?UTF-8?Q?Felix_Quei=c3=9fner?= <qemu-devel@mq32.de>
In-Reply-To: <51e36301-d056-85bf-447a-2d0b9e6ad251@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4LTNqG1Q66z9sQH
Received-SPF: none client-ip=80.241.56.172; envelope-from=qemu-devel@mq32.de;
 helo=mout-p-202.mailbox.org
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


> Not sure why it was never picked up
> 
> That patch certainly needs a re-spin since it won't apply as-is anymore. 
> Want to have a try?

I guess the semantics of the code stay the same, but the boilerplate 
might change a bit?

If so, i guess i can give it a try tomorrow and see if i can make it work.

- Felix


