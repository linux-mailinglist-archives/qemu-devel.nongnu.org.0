Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8086548108B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 07:53:57 +0100 (CET)
Received: from localhost ([::1]:54770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2SqS-0005TZ-0w
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 01:53:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n2ShF-00035m-Qn
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 01:44:27 -0500
Received: from mail.xen0n.name ([115.28.160.31]:50030
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n2ShC-0006ww-UX
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 01:44:25 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id D5D8F60091;
 Wed, 29 Dec 2021 14:44:12 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1640760252; bh=3d9cZ+qoYSaNuaQ9+fXC9nVemMjinLU7b1J/UGi55uk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=t6qpcUbpeO3HZROkN5uFKYiPOq6PCSgQsGjiW1QeIPHVBtD1FlrjUvXWnM9rblucK
 aS14bDVbbYSE6IJilhTTaVa694deFyinZZDsTnMZeaw+0eCp3Q7qgKDs9A+UgODrKq
 1VYvBxF3I3xD55dXVnWu9cea6QBhjuNhiaayIKDo=
Message-ID: <77004e2a-86f8-01cb-c76a-4806d360e861@xen0n.name>
Date: Wed, 29 Dec 2021 14:44:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
Subject: Re: [PATCH v2 00/30] tcg/loongarch64: New tcg backend
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211221212558.1835038-1-richard.henderson@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20211221212558.1835038-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
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
Cc: git@xen0n.name
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 12/22/21 05:25, Richard Henderson wrote:
> Version 2: Dropped patch 31, the gitlab-ci change:
>
> Found errors in your .gitlab-ci.yml:
> 'cross-loongarch64-system' job needs 'loongarch64-cross-container' job
> but 'loongarch64-cross-container' is not in any previous stage
> 'cross-loongarch64-user' job needs 'loongarch64-cross-container' job
> but 'loongarch64-cross-container' is not in any previous stage

Sorry for the delay in processing this (busy in end-of-year $DAY_JOB), I 
just noticed you've already pushed the gentoo-loongarch64-cross image to 
qemu-project container registry shortly after sending my revised patch.

The only thing missing in the original patch was two "optional: true" 
declarations in the "needs" section of the two cross build job stanzas; 
due to the long time required to re-build the image, you may just add 
the "optional: true"'s yourself and start to make use of the built 
image, and test the new patch at your leisure.


