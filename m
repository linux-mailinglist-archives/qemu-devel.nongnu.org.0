Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A225FC45A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 13:37:40 +0200 (CEST)
Received: from localhost ([::1]:53702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oia3P-0001WB-FO
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 07:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1oia1o-0006KT-VH
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 07:36:01 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:39659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1oia1n-0000OH-4c
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 07:36:00 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id DA05F44619;
 Wed, 12 Oct 2022 13:35:55 +0200 (CEST)
Message-ID: <22c20908-ead5-7926-2086-1883641fdc11@proxmox.com>
Date: Wed, 12 Oct 2022 13:35:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] migration/channel-block: fix return value for
 qio_channel_block_{readv, writev}
Content-Language: en-US
From: Fiona Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20221012111935.117480-1-f.ebner@proxmox.com>
In-Reply-To: <20221012111935.117480-1-f.ebner@proxmox.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.528,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 12.10.22 um 13:19 schrieb Fiona Ebner:
> in the error case. The documentation in include/io/channel.h states
> that -1 or QIO_CHANNEL_ERR_BLOCK should be returned upon error. Simply
> passing along the return value from the bdrv-functions has the
> potential to confuse the call sides. Non-blocking mode is not
> implemented currently, so -1 it is.
> 
> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
CC-ing dgilbert@redhat.com since I messed up when sending the mail.
Sorry about that!


