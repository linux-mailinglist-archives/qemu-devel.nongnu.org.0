Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66B41BE6A9
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 20:53:40 +0200 (CEST)
Received: from localhost ([::1]:46588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTrpz-0006ZO-IR
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 14:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38170)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vr_qemu@t-online.de>) id 1jTreF-0007eF-No
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 14:41:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <vr_qemu@t-online.de>) id 1jTreD-0008Sk-KP
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 14:41:31 -0400
Received: from mailout02.t-online.de ([194.25.134.17]:57388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1jTreC-0007zr-VE
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 14:41:29 -0400
Received: from fwd36.aul.t-online.de (fwd36.aul.t-online.de [172.20.26.137])
 by mailout02.t-online.de (Postfix) with SMTP id 598CF41CC422;
 Wed, 29 Apr 2020 20:41:24 +0200 (CEST)
Received: from [192.168.211.200]
 (ZBm+Y6ZD8hq+-X-XA-uSvMvAjSFYdZAPgFhMtwuDZxlncs2oaQUASOPr54LsZfHZs9@[46.86.59.135])
 by fwd36.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1jTre6-1PVOwS0; Wed, 29 Apr 2020 20:41:22 +0200
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH 0/1] Patch for keycodemapdb
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Message-ID: <1862f332-a40e-2416-5ab4-37d885f87337@t-online.de>
Date: Wed, 29 Apr 2020 20:41:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ID: ZBm+Y6ZD8hq+-X-XA-uSvMvAjSFYdZAPgFhMtwuDZxlncs2oaQUASOPr54LsZfHZs9
X-TOI-MSGID: ed0fd5c3-5de6-466b-b00d-fc8c118afc5e
Received-SPF: none client-ip=194.25.134.17; envelope-from=vr_qemu@t-online.de;
 helo=mailout02.t-online.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 14:41:24
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Received-From: 194.25.134.17
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Daniel,

here is a patch for keycodemapdb. With this patch I have a working '<' key (the key right of the left shift key on my german keyboard) in my qemu -display gtk guests on Windows.

With best regards,
Volker

