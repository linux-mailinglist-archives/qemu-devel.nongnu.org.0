Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 144CB3D0F46
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:11:12 +0200 (CEST)
Received: from localhost ([::1]:58342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6C0E-00017A-Tj
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tomeu.vizoso@collabora.com>)
 id 1m6Byd-0007Vy-ME
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:09:31 -0400
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3]:52708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tomeu.vizoso@collabora.com>)
 id 1m6Byb-0004vv-Pi
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:09:31 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tomeu) with ESMTPSA id A04011F43AE0
To: qemu-devel@nongnu.org
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: vulkan support in qemu with virgil
Message-ID: <22cb9b75-b29b-d824-1327-13092b5a8da9@collabora.com>
Date: Wed, 21 Jul 2021 15:09:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1098:0:82:1000:25:2eeb:e3e3;
 envelope-from=tomeu.vizoso@collabora.com; helo=bhuna.collabora.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

At Collabora we have started looking at Vulkan support in QEMU with Virgil.

We have seen the work that Vivek has submitted to support the new 
virtio-gpu BLOB API (thanks!) and have identified a few holes that are 
still needed for Vulkan support.

We would like to know if anybody else is working on Vulkan support or on 
common tasks such as host-side blobs, CONTEXT_INIT, CROSS_DEVICE, 
HOST_VISIBLE, venus capsets, a new DisplayChangeListenerOps 
implementation, etc.

Thanks,

Tomeu


