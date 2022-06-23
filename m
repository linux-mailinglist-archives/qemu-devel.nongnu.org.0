Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8022C557DFB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 16:38:01 +0200 (CEST)
Received: from localhost ([::1]:44892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Ny4-0001uN-3s
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 10:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu-devel@mq32.de>)
 id 1o4Nwn-00017h-Oq
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:36:41 -0400
Received: from mout-p-101.mailbox.org ([80.241.56.151]:49546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <qemu-devel@mq32.de>)
 id 1o4Nwk-0000n1-Hk
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:36:41 -0400
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4LTN9X46Pmz9sRT;
 Thu, 23 Jun 2022 16:36:32 +0200 (CEST)
Message-ID: <b95df229-3cb9-1646-e7fd-c68ad4f03bfd@mailbox.org>
Date: Thu, 23 Jun 2022 16:36:31 +0200
MIME-Version: 1.0
Subject: Re: [Qemu-devel] [PATCH] gtk: Add show_tabs=on|off command line
 option.
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <56D0203F.5060303@gmail.com>
Cc: kraxel@redhat.com
From: =?UTF-8?Q?Felix_Quei=c3=9fner?= <qemu-devel@mq32.de>
In-Reply-To: <56D0203F.5060303@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4LTN9X46Pmz9sRT
Received-SPF: none client-ip=80.241.56.151; envelope-from=qemu-devel@mq32.de;
 helo=mout-p-101.mailbox.org
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

Heya!

> The patch adds "show_tabs" command line option for GTK ui similar to "grab_on_hover". This option allows tabbed view mode to not have to be enabled by hand at each start of the VM.

It's been a while now, but i was always missing this feature in QEMU and 
i'd love to see that patch land in QEMU one day.

I discovered that patch by searching for "start qemu with tabs visible" 
and found this link:

https://patchwork.ozlabs.org/project/qemu-devel/patch/56D0203F.5060303@gmail.com/

Regards
- Felix


