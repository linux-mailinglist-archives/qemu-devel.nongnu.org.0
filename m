Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E11DC383DD8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:53:31 +0200 (CEST)
Received: from localhost ([::1]:45442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lijIx-0007oX-1v
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1lijB2-0004dX-Ke
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:45:22 -0400
Received: from mailout05.t-online.de ([194.25.134.82]:34054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1lijAy-00082A-Fl
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:45:20 -0400
Received: from fwd08.aul.t-online.de (fwd08.aul.t-online.de [172.20.26.151])
 by mailout05.t-online.de (Postfix) with SMTP id F307B1A4FD;
 Mon, 17 May 2021 21:45:12 +0200 (CEST)
Received: from [192.168.211.200]
 (bKAwcGZ-rh2OwkGaYRBVIiH9uG40w6MMBMZ-sCLXGxNzmWnsdvrnHGj2wfy5n23ZrL@[79.208.18.63])
 by fwd08.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1lijAn-4B9lku0; Mon, 17 May 2021 21:45:05 +0200
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH 0/4] Misc. audio patches
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <b461d71c-a062-b85d-378d-53c0b5857b52@t-online.de>
Date: Mon, 17 May 2021 21:45:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ID: bKAwcGZ-rh2OwkGaYRBVIiH9uG40w6MMBMZ-sCLXGxNzmWnsdvrnHGj2wfy5n23ZrL
X-TOI-EXPURGATEID: 150726::1621280705-0000AFFF-A9044183/0/0 CLEAN NORMAL
X-TOI-MSGID: 07eb016c-3535-4d82-9960-f51215e44c7a
Received-SPF: none client-ip=194.25.134.82; envelope-from=vr_qemu@t-online.de;
 helo=mailout05.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A small collection of patches for the audio subsystem.

It took me one evening to get a working audio system with JACK.
I never associated the in-(NULL) and out-(NULL) devices in the
patch bay with qemu.

With best regards,
Volker

Volker Rümelin (4):
   alsaaudio: remove #ifdef DEBUG to avoid bit rot
   paaudio: remove unused stream flags
   audio: move code to audio/audio.c
   jackaudio: avoid that the client name contains the word (NULL)

  audio/alsaaudio.c | 10 ++++------
  audio/audio.c     |  9 +++++++++
  audio/audio_int.h |  2 ++
  audio/jackaudio.c |  3 +--
  audio/paaudio.c   | 10 ++--------
  5 files changed, 18 insertions(+), 16 deletions(-)

-- 
2.26.2


