Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C859442EDCC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:36:50 +0200 (CEST)
Received: from localhost ([::1]:58810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJdx-00020u-St
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mbJVo-00088U-V7; Fri, 15 Oct 2021 05:28:24 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:43391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mbJVl-00032l-9V; Fri, 15 Oct 2021 05:28:24 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 80E47748F58;
 Fri, 15 Oct 2021 11:28:16 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 67142748F57; Fri, 15 Oct 2021 11:28:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 65FB1748F56;
 Fri, 15 Oct 2021 11:28:16 +0200 (CEST)
Date: Fri, 15 Oct 2021 11:28:16 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 0/6] Misc pegasos2 patches
In-Reply-To: <YWjzgU8pGtqykYji@yekko>
Message-ID: <24aebbeb-ff35-7658-4eee-382e8ff7d257@eik.bme.hu>
References: <cover.1634241019.git.balaton@eik.bme.hu> <YWjzgU8pGtqykYji@yekko>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Oct 2021, David Gibson wrote:
> On Thu, Oct 14, 2021 at 09:50:19PM +0200, BALATON Zoltan wrote:
>> Some small clean ups and improvements for the pegasos2 machine.
>>
>> BALATON Zoltan (6):
>>   ppc/pegasos2: Restrict memory to 2 gigabytes
>>   ppc/pegasos2: Warn when using VOF but no kernel is specified
>>   ppc/pegasos2: Implement get-time-of-day RTAS function with VOF
>>   ppc/pegasos2: Access MV64361 registers via their memory region
>>   ppc/pegasos2: Add constants for PCI config addresses
>>   ppc/pegasos2: Implement power-off RTAS function with VOF
>
> Do you use git send-email to send out your patches, or something else?
>
> For some reason your patchsets, unlike most people's end up with the
> order completely jumbled in my inbox, which makes applying them a bit
> annoying.

I'm sending mails with something else but may try to add a delay between 
mails to try to force them to be ordered.

