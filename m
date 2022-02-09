Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DFC4AF24C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 14:05:19 +0100 (CET)
Received: from localhost ([::1]:49088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHmer-0007lx-R0
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 08:05:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1nHmQ8-0002jx-8U; Wed, 09 Feb 2022 07:50:04 -0500
Received: from mail.csgraf.de ([85.25.223.15]:35102 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1nHmQ6-0001d9-3t; Wed, 09 Feb 2022 07:50:03 -0500
Received: from [192.168.106.118]
 (dynamic-095-115-119-071.95.115.pool.telefonica.de [95.115.119.71])
 by csgraf.de (Postfix) with ESMTPSA id 26DCC60806B1;
 Wed,  9 Feb 2022 13:50:00 +0100 (CET)
Message-ID: <a3c45c0a-83be-57c5-cab0-98ffdaef00cb@csgraf.de>
Date: Wed, 9 Feb 2022 13:49:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 0/6] target/arm: -cpu host/max KVM and HVF fixes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <20220204165506.2846058-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 04.02.22 17:55, Peter Maydell wrote:
> This patchset fixes various minor bugs in KVM and HVF
> -cpu host and -cpu max:
>
> (1) KVM -cpu max was incorrectly adding a 'sve-max-vq' property
> that wouldn't work and which doesn't exist in KVM -cpu host
>
> (2) HVF -cpu max was using all the TCG ID fields and thus
> promising the guest more than the host CPU can actually do
>
> (3) HVF -cpu host wasn't setting up the PAuth properties, so
> it defaulted to not telling the guest about PAuth support
>
> This series fixes (1) by moving the '-cpu host' code to
> cpu64.c since it's aarch64-specific anyway, which lets us
> reuse it from the '-cpu max' init function. It fixes
> (2) and (3) mostly by making HVF use the same bits of code
> that KVM does for -cpu max and PAuth.


Reviewed-by: Alexander Graf <agraf@csgraf.de>


Alex



