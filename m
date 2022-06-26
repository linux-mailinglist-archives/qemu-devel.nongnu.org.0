Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5549B55B336
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 19:42:52 +0200 (CEST)
Received: from localhost ([::1]:35530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WHb-0007lf-37
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 13:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WE6-0006si-3S
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:39:14 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WE4-0004r8-Hq
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:39:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VfNrdhH0koarwNWZXWlsrYCj4Jx/CZhKzOQB2tQXWuQ=; b=t+hyEe/kvcMN/3pQuIR/1iWIpD
 jPyY8Kz14/nYCdN5gvhM5z6cTaGdy3qKgIokn+tYpT9x4rXAeyJEDAVUbwJUh61ajc6z9QG74p5xl
 AvnKg1PReDMJt22bHrthnROk4SrZzOTBD8XJ/sAdDlmlneP3E76gx7tTs5SeJ3SyblsbujV4nENts
 GtfJXtEBq6Inh5emVhfoCOnE+4f7MpFXlqaYZs8AMwi1W0aDfNVqu+7xeJOStJNzU0PuVqZ/0S+wC
 LmZFRSJHTzcpwlBQloRhskihhRAz86ne0Peu7MfvVV4PMomDEMIcqXG35kg9SakWswryDGU6t36U7
 weVFtDzkODMXB1mkNnO6U/mxsnsx5ABrKeZ1zadzFU6Ifv202B/Dv8Vi8R7rl9DJ2r/MT1Carg/Zf
 w6pcK+ywu/hLq6fjD35E5AeTIQb+l1JxDeTtMp50TdqBz31fIn2gv0qIIYtrwQPqh3dtfxdrNSlI5
 kWY9HUHXtTodOtKt3VRA6pHSsjfFeYiXREeJDTR1DRSRsId/J6yLVokIr4nmjI7Vw+s3S5vvvKoBi
 pLg0Q6V6ddDkySLgLaCfeDjqt2xJHm4ARQfW+Qojxfs+j1Sfr5pMS9drGHBlVeLaApo2kb3Aj1AlC
 Q9me7BsME2eviTq5aeGLbA+dLTR3W/lYwoGyd8G2I=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WCo-0007IS-Ad; Sun, 26 Jun 2022 18:37:58 +0100
Message-ID: <6de3fd4b-c82f-1626-7ac0-c8b96a70ea2d@ilande.co.uk>
Date: Sun, 26 Jun 2022 18:39:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, svens@stackframe.org, qemu-devel@nongnu.org
References: <20220624160839.886649-1-mark.cave-ayland@ilande.co.uk>
 <62edb200-5989-3d8e-9570-e47ed7f1db69@gmx.de>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <62edb200-5989-3d8e-9570-e47ed7f1db69@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] artist: set memory region owners for buffers to the
 artist device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/06/2022 12:15, Helge Deller wrote:

> On 6/24/22 18:08, Mark Cave-Ayland wrote:
>> This fixes the output of "info qom-tree" so that the buffers appear as children
>> of the artist device, rather than underneath the "unattached" container.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> Reviewed-by: Helge Deller <deller@gmx.de>
> 
> Thanks!
> 
> Helge

Thanks Helge.

I'll queue this to my qemu-sparc branch along with the ps2 QOM patches given that 
it's a trivial patch, and I'm already touching the lasips2 device which requires 
testing the HPPA B160L machine anyhow.


ATB,

Mark.

