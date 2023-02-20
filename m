Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE2169C6C6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 09:34:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU1cE-0007rf-99; Mon, 20 Feb 2023 03:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1pU1c6-0007rV-P2
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:33:36 -0500
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1pU1c4-0004vU-IS
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:33:34 -0500
Received: from [10.0.14.212] (business-24-134-228-93.pool2.vodafone-ip.de
 [24.134.228.93])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id E716ADA04BD;
 Mon, 20 Feb 2023 09:33:28 +0100 (CET)
Message-ID: <1dad8e84-25e1-0514-3e9a-c84eabf8a3e7@weilnetz.de>
Date: Mon, 20 Feb 2023 09:33:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] Updated the FSF address to <https://www.gnu.org/licenses/>
To: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>, qemu-devel@nongnu.org
Cc: thuth@redhat.com, ysato@users.sourceforge.jp, alex.bennee@linaro.org,
 pbonzini@redhat.com, fam@euphon.net, peter.maydell@linaro.org,
 philmd@linaro.org, kwolf@redhat.com, hreitz@redhat.com, armbru@redhat.com
References: <576ee9203fdac99d7251a98faa66b9ce1e7febc5.1675941486.git.kkamran.bese16seecs@seecs.edu.pk>
In-Reply-To: <576ee9203fdac99d7251a98faa66b9ce1e7febc5.1675941486.git.kkamran.bese16seecs@seecs.edu.pk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 20.02.23 um 08:01 schrieb Khadija Kamran:
> From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
> 
> The Free Software Foundation moved to a new address and some sources in QEMU referred to their old location.
> The address should be updated and replaced to a pointer to <https://www.gnu.org/licenses/>

... replaced by a pointer ... ?

> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/379
> 
> Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
> ---
>   contrib/gitdm/filetypes.txt     | 3 +--
>   hw/scsi/viosrp.h                | 3 +--
>   hw/sh4/sh7750_regs.h            | 3 +--
>   include/hw/arm/raspi_platform.h | 3 +--
>   include/qemu/uri.h              | 3 +--
>   tests/qemu-iotests/022          | 4 +---
>   tests/unit/rcutorture.c         | 3 +--
>   tests/unit/test-rcu-list.c      | 3 +--
>   util/uri.c                      | 3 +--
>   9 files changed, 9 insertions(+), 19 deletions(-)
> 

Reviewed-by: Stefan Weil <sw@weilnetz.de>


