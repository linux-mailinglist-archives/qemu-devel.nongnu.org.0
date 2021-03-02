Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98BA329696
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 08:08:03 +0100 (CET)
Received: from localhost ([::1]:45468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGz8T-0000ks-6i
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 02:08:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.lamprecht@proxmox.com>)
 id 1lGz5r-0008FS-OE; Tue, 02 Mar 2021 02:05:19 -0500
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:13778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.lamprecht@proxmox.com>)
 id 1lGz5k-0002CQ-SG; Tue, 02 Mar 2021 02:05:19 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 6BF2B418FD;
 Tue,  2 Mar 2021 08:05:08 +0100 (CET)
Message-ID: <f90f6a34-0c8b-c620-6906-18c12f2332d0@proxmox.com>
Date: Tue, 2 Mar 2021 08:05:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Content-Language: en-US
To: Vitaly Cheptsov <cheptsov@ispras.ru>, qemu-devel@nongnu.org
References: <20210301195919.9333-1-cheptsov@ispras.ru>
From: Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: Re: [PATCH] i386/acpi: restore device paths for pre-5.1 vms
In-Reply-To: <20210301195919.9333-1-cheptsov@ispras.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=t.lamprecht@proxmox.com; helo=proxmox-new.maurer-it.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-stable@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.03.21 20:59, Vitaly Cheptsov wrote:
> After fixing the _UID value for the primary PCI root bridge in
> af1b80ae it was discovered that this change updates Windows
> configuration in an incompatible way causing network configuration
> failure unless DHCP is used. More details provided on the list:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg08484.html
> 
> This change reverts the _UID update from 1 to 0 for q35 and i440fx
> VMs before version 5.2 to maintain the original behaviour when
> upgrading.
> 
> Cc: qemu-stable@nongnu.org
> Cc: qemu-devel@nongnu.org
> Reported-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Vitaly Cheptsov <cheptsov@ispras.ru>

Thanks for sending this! Works as advertised and can be cleanly cherry-picked
on top of the v5.2.0 tag.

Tested-by: Thomas Lamprecht <t.lamprecht@proxmox.com>



