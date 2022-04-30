Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6886A516042
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 22:08:17 +0200 (CEST)
Received: from localhost ([::1]:59812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nktO4-0005oy-Fy
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 16:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nktMd-0004Yt-Mm
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 16:06:47 -0400
Received: from smtp69.ord1d.emailsrvr.com ([184.106.54.69]:43797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nktMb-0008Gi-Qu
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 16:06:47 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp1.relay.ord1d.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id E1ABF4013E; 
 Sat, 30 Apr 2022 16:06:19 -0400 (EDT)
Date: Sat, 30 Apr 2022 15:06:19 -0500
From: Andrew Deason <adeason@sinenomine.net>
To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 0/5] qga: Implement shutdown/network-get-interfaces
 on Solaris
Message-Id: <20220430150619.f52f8fb0763e7f15458c7b55@sinenomine.net>
In-Reply-To: <20220426195526.7699-1-adeason@sinenomine.net>
References: <20220426195526.7699-1-adeason@sinenomine.net>
Organization: Sine Nomine Associates
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Classification-ID: 36a571b2-19a2-4778-ae63-ab0d9ec3f311-1-1
Received-SPF: pass client-ip=184.106.54.69;
 envelope-from=adeason@sinenomine.net; helo=smtp69.ord1d.emailsrvr.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 14:55:21 -0500
Andrew Deason <adeason@sinenomine.net> wrote:

> This implements the guest agent commands guest-network-get-interfaces and
> guest-shutdown on Solaris. The implementation for these on Solaris is very
> similar as on Linux, since both platforms have a similar getifaddrs() and a
> 'shutdown' command.

Ping?

-- 
Andrew Deason
adeason@sinenomine.net

