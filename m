Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACEF6BD645
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 17:49:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcqmp-0005EC-Gc; Thu, 16 Mar 2023 12:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1pcqmm-0005Dv-C2
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 12:49:04 -0400
Received: from forward502a.mail.yandex.net ([178.154.239.82])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1pcqmk-0003ST-8M
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 12:49:04 -0400
Received: from vla1-019acbace3a2.qloud-c.yandex.net
 (vla1-019acbace3a2.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:2197:0:640:19a:cbac])
 by forward502a.mail.yandex.net (Yandex) with ESMTP id CAB665EB01;
 Thu, 16 Mar 2023 19:48:55 +0300 (MSK)
Received: from mail.yandex.ru (2a02:6b8:c0d:282:0:640:476c:0
 [2a02:6b8:c0d:282:0:640:476c:0])
 by vla1-019acbace3a2.qloud-c.yandex.net (mxback/Yandex) with HTTP id
 bmnfTU4Yha61-JGYSJgxK; Thu, 16 Mar 2023 19:48:55 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phystech.edu; s=mail;
 t=1678985335; bh=6Rq4yp7xcZeomGGu9AVpiBMzBsTPKKwVZQkHNeuFV4E=;
 h=Message-Id:References:Date:Cc:Subject:In-Reply-To:To:From;
 b=AdhIYsVqg/HsW0X6X57dT/YMQ8V62/SGZF9TAWiiQI2UUufCYppEPZsHmrSqUgdIx
 kNcwQ3iUH/t7ph8XRQK250pURfwi7C+kdN/++GW3XPuuuYwZogCO3VoLpn3E35YONj
 LAHD9QGfdVJl8poNlgBTTUAi5d2rtw862rspltcY=
Authentication-Results: vla1-019acbace3a2.qloud-c.yandex.net;
 dkim=pass header.i=@phystech.edu
Received: by izsosstglkfltgsl.vla.yp-c.yandex.net with HTTP;
 Thu, 16 Mar 2023 19:48:54 +0300
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: peter.maydell@linaro.org
Cc: pbonzini@redhat.com, yuri.benditovich@daynix.com, yan@daynix.com,
 viktor@daynix.com, annie.li@oracle.com, qemu-devel@nongnu.org
In-Reply-To: <20230222211246.883679-1-viktor@daynix.com>
References: <20230222211246.883679-1-viktor@daynix.com>
Subject: Re: [PATCH v2 0/3] contrib/elf2dmp: Windows Server 2022 support
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 16 Mar 2023 19:48:54 +0300
Message-Id: <386021678985334@izsosstglkfltgsl.vla.yp-c.yandex.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
Received-SPF: pass client-ip=178.154.239.82;
 envelope-from=viktor.prutyanov@phystech.edu; helo=forward502a.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> Hi,
> 
> For now, elf2dmp is unable to convert ELF-dump to DMP-dump made of
> Windows Server 2022 guest. This patch series fixes it.
> 
> v1: improve code-style fix
> v2: don't remove data directory entry RVA print and DOS header size check
> 
> Viktor Prutyanov (3):
> contrib/elf2dmp: fix code style
> contrib/elf2dmp: move PE dir search to pe_get_data_dir_entry
> contrib/elf2dmp: add PE name check and Windows Server 2022 support
> 
> contrib/elf2dmp/addrspace.c | 1 +
> contrib/elf2dmp/main.c | 108 ++++++++++++++++++++++-----------
> contrib/elf2dmp/pe.h | 115 ++++++++++++++++++++----------------
> 3 files changed, 140 insertions(+), 84 deletions(-)
> 
> --
> 2.35.1

Hi Peter,

As we discussed, I would like to ask you to pick up this series.

Thanks,
Viktor Prutyanov

