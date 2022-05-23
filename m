Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CB953115B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 16:37:32 +0200 (CEST)
Received: from localhost ([::1]:36754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt9Bb-0000Fj-AZ
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 10:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geoff@hostfission.com>)
 id 1nt9A5-00080G-Rv
 for qemu-devel@nongnu.org; Mon, 23 May 2022 10:36:02 -0400
Received: from mail1.hostfission.com ([118.127.8.195]:33296)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geoff@hostfission.com>) id 1nt9A4-0003Zc-8s
 for qemu-devel@nongnu.org; Mon, 23 May 2022 10:35:57 -0400
Received: from www1.hostfission.com (www1.hostfission.com [118.127.8.179])
 by mail1.hostfission.com (Postfix) with ESMTP id 31F691E0032;
 Tue, 24 May 2022 00:35:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1653316550;
 bh=zoF9h7iBxUJqBI26CnH5C2II8dNPZ/4zFEJnC2eCYGE=;
 h=Date:From:To:Cc:Subject:From;
 b=Kutz96j2f2ATvk/LoLTckUHkx+rs8o5xTrKqAMTa4Le+YXrbEevaEuA+v/OZxDxMG
 GasebWU5xM9R2XwIaxu+Pv1ext6ImY6+01F1xKcgBRp0Dw462zWv5KE8sMZ9VYRI1G
 uCFpY8nS89XGu4H5Myu6c/q0O621dKylZ+nkaz0I=
Received: from mail.hostfission.com (www1.hostfission.com [127.0.0.1])
 by www1.hostfission.com (Postfix) with ESMTP id C701228C62;
 Tue, 24 May 2022 00:35:49 +1000 (AEST)
MIME-Version: 1.0
Date: Tue, 24 May 2022 00:35:49 +1000
From: Geoffrey McRae <geoff@hostfission.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Windows QXL Display Driver
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <0c317d39fa81e000a1b7717ab4fde75d@hostfission.com>
X-Sender: geoff@hostfission.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=118.127.8.195; envelope-from=geoff@hostfission.com;
 helo=mail1.hostfission.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Gerd,

Over the past few weeks I have been adding spice display support to 
Looking Glass as a fallback mechanism for during system boot (or diags) 
before our application is loaded in the guest VM. The idea is to have 
the VFIO GPU duplicate it's output to the QXL device, which works fine 
until you load the QXL display driver.

The issue is that once the driver is loaded windows removes the option 
to duplicate the output. Is this something that needs to be tweaked in 
the driver to allow this? or is there a technical reason why this can't 
be done?

Kind Regards,
Geoffrey McRae

