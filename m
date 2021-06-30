Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AA73B7BF6
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 05:06:21 +0200 (CEST)
Received: from localhost ([::1]:44694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyQYO-0006qd-IE
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 23:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lyQXd-0006Ax-Lo
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 23:05:33 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:16011
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lyQXc-0000kt-8f
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 23:05:33 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4GF5nR3CWwz8PbR;
 Tue, 29 Jun 2021 23:05:31 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=3ccG558Qq
 j4F36m38muc5SjukGY=; b=RmgpPmCIXAPl7mCTv/z9mF0ldGPf83vcHBBP0UdgX
 raJon9YiEOXf5PoU5mZHFPkHUnzh/4sUwjclLVTDWAsySRNqsG8GQ8dpJvCM0C7o
 vK2o6IV3HADurp3OKKo5rUH0g3z2sbGrmOgE5vsBu+HRM2a5hoBuKZMQDAJChueF
 c4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=Izx
 LynF1tiNwqGsfFUQhGQNWvIdw2iMCXX8/7ziTrRDmIRmLeIxscrZ9pqEVItaWRrO
 tENMOXwUfwwYRy5T1c1Fz7uHMbQQgZP08F1Zwti1ezFf611ZEd55wb497FgNb8WE
 Dc9eL9yo0aGia//UVjnLfZ1WlBZhgcjFNfZaB5dw=
Received: from [IPV6:2001:470:b050:6:c431:eb5a:d46:c0fa] (unknown
 [IPv6:2001:470:b050:6:c431:eb5a:d46:c0fa])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4GF5nR2wdjz8PbK;
 Tue, 29 Jun 2021 23:05:31 -0400 (EDT)
Message-ID: <31ac508b-7482-f37a-0027-8f55ccc51fe6@comstyle.com>
Date: Tue, 29 Jun 2021 23:05:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101
 Thunderbird/90.0
Subject: Re: [PATCH] tests/vm: update openbsd to release 6.9
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <YLRDeJV8qBrt9++c@humpty.home.comstyle.com>
 <20210531045541.aut6wbga7x4tn6p3@sirius.home.kraxel.org>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <20210531045541.aut6wbga7x4tn6p3@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping.

On 5/31/2021 12:55 AM, Gerd Hoffmann wrote:
> On Sun, May 30, 2021 at 10:01:28PM -0400, Brad Smith wrote:
>> tests/vm: update openbsd to release 6.9
>>
>> Signed-off-by: Brad Smith <brad@comstyle.com>
> Tested-by: Gerd Hoffmann <kraxel@redhat.com>
>

