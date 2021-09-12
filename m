Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF0A407D67
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 14:56:31 +0200 (CEST)
Received: from localhost ([::1]:36392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPP26-0001s2-Rw
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 08:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mPOwb-0002Bu-9k
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:50:49 -0400
Received: from mailout09.t-online.de ([194.25.134.84]:44236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mPOwZ-0007SL-7O
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:50:49 -0400
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout09.t-online.de (Postfix) with SMTP id 550D01C476;
 Sun, 12 Sep 2021 14:50:43 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.16.31]) by fwd84.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mPOwR-1PY9Qn0; Sun, 12 Sep 2021 14:50:40 +0200
To: Gerd Hoffmann <kraxel@redhat.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH 0/3] ui/console: chardev backend improvements
Message-ID: <23041f12-b405-7dbc-b098-e9c48802e29c@t-online.de>
Date: Sun, 12 Sep 2021 14:50:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TOI-EXPURGATEID: 150726::1631451040-00014E39-91C6AF10/0/0 CLEAN NORMAL
X-TOI-MSGID: 088f3719-d275-4cf1-bd2a-284bc2d6ae1e
Received-SPF: none client-ip=194.25.134.84; envelope-from=vr_qemu@t-online.de;
 helo=mailout09.t-online.de
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A few things I learnt while writing a fix for a chardev bug
in the GTK backend.

Volker Rümelin (3):
   ui/console: replace QEMUFIFO with Fifo8
   ui/console: replace kbd_timer with chr_accept_input callback
   ui/console: remove chardev frontend connected test

  ui/console.c | 109 ++++++++++++++-------------------------------------
  1 file changed, 29 insertions(+), 80 deletions(-)

-- 
2.31.1

