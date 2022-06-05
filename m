Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3E753DAE8
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jun 2022 10:54:40 +0200 (CEST)
Received: from localhost ([::1]:47196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxm1v-0005T1-8A
	for lists+qemu-devel@lfdr.de; Sun, 05 Jun 2022 04:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1nxlxy-00048F-Hg
 for qemu-devel@nongnu.org; Sun, 05 Jun 2022 04:50:34 -0400
Received: from mailout03.t-online.de ([194.25.134.81]:47632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1nxlxw-0003Fx-KX
 for qemu-devel@nongnu.org; Sun, 05 Jun 2022 04:50:34 -0400
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout03.t-online.de (Postfix) with SMTP id A8C9E62D4;
 Sun,  5 Jun 2022 10:50:28 +0200 (CEST)
Received: from [192.168.211.200] ([84.175.233.215]) by fwd75.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1nxlxs-14j6oL0; Sun, 5 Jun 2022 10:50:28 +0200
Message-ID: <e0db9981-fe2f-67ec-63df-ff0c8e4cd690@t-online.de>
Date: Sun, 5 Jun 2022 10:50:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH 0/2] Fixes for ui/gtk-gl-area
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1654419028-01433199-B9827A3A/0/0 CLEAN NORMAL
X-TOI-MSGID: 95ece1d4-c2b0-488b-8b23-3ad27ffddb0c
Received-SPF: none client-ip=194.25.134.81; envelope-from=vr_qemu@t-online.de;
 helo=mailout03.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The first patch fixes a GL context leak.

The second patch fixes a black guest screen on Wayland with OpenGL 
accelerated QEMU graphics devices. This bug doesn't seem to be related 
to issues #910, #865, #671 or #298.

Volker Rümelin (2):
   ui/gtk-gl-area: implement GL context destruction
   ui/gtk-gl-area: create the requested GL context version

  ui/gtk-gl-area.c | 39 +++++++++++++++++++++++++++++++++++++--
  ui/trace-events  |  2 ++
  2 files changed, 39 insertions(+), 2 deletions(-)

-- 
2.35.3


