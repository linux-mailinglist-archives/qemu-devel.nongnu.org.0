Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95788664644
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:38:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFGlK-00030N-Py; Tue, 10 Jan 2023 10:42:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1pFGlE-0002zw-MV
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:42:00 -0500
Received: from forward500b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d500])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1pFGlB-0000vy-Gc
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:42:00 -0500
Received: from myt5-fc73f9af8654.qloud-c.yandex.net
 (myt5-fc73f9af8654.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:2898:0:640:fc73:f9af])
 by forward500b.mail.yandex.net (Yandex) with ESMTP id C7B995F3E5;
 Tue, 10 Jan 2023 18:41:49 +0300 (MSK)
Received: by myt5-fc73f9af8654.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id mffws2GYNGk1-lrqlpr1z; Tue, 10 Jan 2023 18:41:48 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phystech.edu; s=mail;
 t=1673365308; bh=/lb4goLAMOg36oL7YFeXNYTMaX3nyaUmN6Jb7z/eQAE=;
 h=Cc:References:Date:Message-ID:In-Reply-To:From:To:Subject;
 b=HDJrfDQuVtO/vkQPINblTdc+LaJEy+QtNLumqWQaZWvQGoXa+2/xogmuUa2mjYuOY
 sDVjCpIr1knsi/u4CP3VbWeD2aeaUeg1zgbblOLnAeZJ63ELjPlX4xtNd4lLc4fb5j
 DwIdTR6ai0ugjcWANznsYvA9I+89CHV0qopa6xHc=
Authentication-Results: myt5-fc73f9af8654.qloud-c.yandex.net;
 dkim=pass header.i=@phystech.edu
Subject: Re: [PATCH v1 0/3] contrib/elf2dmp: Windows Server 2022 support
To: pbonzini@redhat.com
Cc: Viktor Prutyanov <viktor@daynix.com>, yuri.benditovich@daynix.com,
 yan@daynix.com, qemu-devel@nongnu.org
References: <20221130000320.287976-1-viktor@daynix.com>
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Message-ID: <a7ad8724-af5c-5a38-49a4-a534d8454203@phystech.edu>
Date: Tue, 10 Jan 2023 18:41:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20221130000320.287976-1-viktor@daynix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:d500;
 envelope-from=viktor.prutyanov@phystech.edu; helo=forward500b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/30/22 3:03 AM, Viktor Prutyanov wrote:
> Hi,
> 
> For now, elf2dmp is unable to convert ELF-dump to DMP-dump made of
> Windows Server 2022 guest. This patch series fixes it.
> 
> v1: improve code-style fix
> 
> Viktor Prutyanov (3):
>    contrib/elf2dmp: fix code style
>    contrib/elf2dmp: move PE dir search to pe_get_data_dir_entry
>    contrib/elf2dmp: add PE name check and Windows Server 2022 support
> 
>   contrib/elf2dmp/addrspace.c |   1 +
>   contrib/elf2dmp/main.c      | 103 +++++++++++++++++++++-----------
>   contrib/elf2dmp/pe.h        | 115 ++++++++++++++++++++----------------
>   3 files changed, 135 insertions(+), 84 deletions(-)
> 

Hi Paolo,

Could you please add the series to your branch?
I've sent it from my other email. I can add
Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>

Thanks,
Viktor Prutyanov

