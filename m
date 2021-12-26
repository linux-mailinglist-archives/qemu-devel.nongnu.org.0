Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8015C47F825
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Dec 2021 16:43:23 +0100 (CET)
Received: from localhost ([::1]:40924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1VgA-00033y-Lp
	for lists+qemu-devel@lfdr.de; Sun, 26 Dec 2021 10:43:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1n1Ve4-00010J-Vl
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 10:41:12 -0500
Received: from mailout09.t-online.de ([194.25.134.84]:51392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1n1Ve3-0008F8-99
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 10:41:12 -0500
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout09.t-online.de (Postfix) with SMTP id 0521813499;
 Sun, 26 Dec 2021 16:38:25 +0100 (CET)
Received: from [192.168.211.200] ([46.86.48.20]) by fwd77.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1n1VbL-3qnKDp0; Sun, 26 Dec 2021 16:38:24 +0100
Message-ID: <cf516f2a-fea8-2000-1b80-a5465d0e1ee6@t-online.de>
Date: Sun, 26 Dec 2021 16:38:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH 0/3] misc. audio fixes
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1640533104-0001606D-65B1DD36/0/0 CLEAN NORMAL
X-TOI-MSGID: e6936845-db61-4689-83b0-bed28c512c1c
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Three unrelated audio fixes.

The first one is a build fix for the Jack Audio backend on Windows and 
MacOS.

Volker Rümelin (3):
   jackaudio: use ifdefs to hide unavailable functions
   dsoundaudio: fix crackling audio recordings
   hw/audio/intel-hda: fix stream reset

  audio/dsoundaudio.c  | 7 +++----
  audio/jackaudio.c    | 4 ++++
  hw/audio/intel-hda.c | 2 +-
  3 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.31.1


