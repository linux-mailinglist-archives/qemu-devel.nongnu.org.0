Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AFF419230
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 12:23:25 +0200 (CEST)
Received: from localhost ([::1]:53790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUnnA-0002Q7-RS
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 06:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1mUnlE-0000PV-BL
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:21:24 -0400
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3]:60328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1mUnlC-000234-8M
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:21:23 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: fahien) with ESMTPSA id 937751F42AFD
To: qemu-devel@nongnu.org
From: Antonio Caggiano <antonio.caggiano@collabora.com>
Subject: virtio-gpu: Get FD for texture
Message-ID: <968fd181-3f7d-4639-3265-9e4b36a6de61@collabora.com>
Date: Mon, 27 Sep 2021 12:21:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1098:0:82:1000:25:2eeb:e3e3;
 envelope-from=antonio.caggiano@collabora.com; helo=bhuna.collabora.co.uk
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
Cc: kraxel@redhat.com, vivek.kasireddy@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I am trying to support a Vulkan application in the guest 
(GTKGlArea+VirGL+venus) which needs to import a GL texture from a GL 
context.

Before doing that, I need to get a FD for that texture, therefore I 
tried with calling egl-helpers.h:egl_get_fd_for_texture() but I get an 
epoxy error:

 > No provider of eglCreateImageKHR found.  Requires one of:

 >   EGL_KHR_image

 >   EGL_KHR_image_base

This is a bit weird to me as I am sure I am running QEMU with iris and 
according to eglinfo both of these extensions are available.

Do you think my approach makes sense or I am doing something wrong 
somewhere?


Kind regards,
Antonio Caggiano

