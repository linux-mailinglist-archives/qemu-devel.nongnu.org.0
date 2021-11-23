Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5290845A460
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 15:07:00 +0100 (CET)
Received: from localhost ([::1]:59548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpWRn-0006x5-58
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 09:06:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mpWLb-0001Ik-K8; Tue, 23 Nov 2021 09:00:35 -0500
Received: from mail.csgraf.de ([85.25.223.15]:43424 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mpWLV-0006Gg-Q6; Tue, 23 Nov 2021 09:00:35 -0500
Received: from [192.168.24.189]
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with ESMTPSA id 9632B6080235;
 Tue, 23 Nov 2021 15:00:26 +0100 (CET)
Message-ID: <5c36aaa3-158b-815f-3e71-badfe2d12632@csgraf.de>
Date: Tue, 23 Nov 2021 15:00:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] hw/arm/virt: Extend nested and mte checks to hvf
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211123122859.22452-1-agraf@csgraf.de>
 <CAFEAcA9ceorf5YK+yKS8KGfHPgFDTxWkLyfva0NDmkrHV5zz2A@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <CAFEAcA9ceorf5YK+yKS8KGfHPgFDTxWkLyfva0NDmkrHV5zz2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.515,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 saar amar <saaramar5@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 23.11.21 13:34, Peter Maydell wrote:
> On Tue, 23 Nov 2021 at 12:29, Alexander Graf <agraf@csgraf.de> wrote:
>> The virt machine has properties to enable MTE and Nested Virtualization
>> support. However, its check to ensure the backing accel implementation
>> supports it today only looks for KVM and bails out if it finds it.
>>
>> Extend the checks to HVF as well as it does not support either today.
>>
>> Reported-by: saar amar <saaramar5@gmail.com>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Without this check, what happens if you try to enable
> both eg virtualization and hvf? Crash, unhelpful error
> message, something else?


The guest just never gets either feature enabled. No crash, no error 
message.


Alex



