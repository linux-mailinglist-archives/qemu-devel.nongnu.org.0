Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6E42D8EE6
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 17:58:08 +0100 (CET)
Received: from localhost ([::1]:49238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koUhD-0005Sl-Tz
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 11:58:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1koUfl-0004PC-W4
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 11:56:39 -0500
Received: from mailout04.t-online.de ([194.25.134.18]:46810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1koUfj-00032c-Pi
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 11:56:37 -0500
Received: from fwd20.aul.t-online.de (fwd20.aul.t-online.de [172.20.26.140])
 by mailout04.t-online.de (Postfix) with SMTP id 0AC4641EE938;
 Sun, 13 Dec 2020 17:56:32 +0100 (CET)
Received: from [192.168.211.200]
 (VTwmWaZcohANvlixAMQlUCzrK9lK3Y2fTd1F6Q-3nXP8Jd-AjnI-RxL9fM6DhUAgZ3@[79.208.17.59])
 by fwd20.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1koUfd-0chloW0; Sun, 13 Dec 2020 17:56:29 +0100
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH 0/3] ui/gtk: paper over a gtk bug on Windows
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <d5f2e3c5-b6d0-db4e-70c2-9de47fd8fefd@t-online.de>
Date: Sun, 13 Dec 2020 17:56:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ID: VTwmWaZcohANvlixAMQlUCzrK9lK3Y2fTd1F6Q-3nXP8Jd-AjnI-RxL9fM6DhUAgZ3
X-TOI-EXPURGATEID: 150726::1607878589-000053CC-9485F3FF/0/0 CLEAN NORMAL
X-TOI-MSGID: 3044615d-8cd8-46b7-a810-b5d46842386b
Received-SPF: none client-ip=194.25.134.18; envelope-from=vr_qemu@t-online.de;
 helo=mailout04.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Nikola Pavlica <pavlica.nikola@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch dc26435edb "ui/gtk: Update refresh interval after widget
is realized" exposed a bug in gtk on Windows. The monitor refresh
rate reported by gtk may be much smaller than the real refresh
rate leading to an unusable guest screen refresh rate.

Details can be found in [PATCH 3/3] ui/gtk: limit virtual console
max update interval

There will be a merging conflict with Nikola's patches.
https://lists.nongnu.org/archive/html/qemu-devel/2020-12/msg02604.html
https://lists.nongnu.org/archive/html/qemu-devel/2020-12/msg02633.html
One of us has to do a simple rebase.

Volker Rümelin (3):
  ui/gtk: don't try to redefine SI prefixes
  ui/gtk: rename variable window to widget
  ui/gtk: limit virtual console max update interval

 include/ui/gtk.h |  2 --
 ui/gtk.c         | 25 +++++++++++++------------
 2 files changed, 13 insertions(+), 14 deletions(-)

-- 
2.26.2

