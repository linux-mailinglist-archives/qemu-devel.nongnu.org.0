Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9355610CB3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 11:05:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooLHG-00019X-HO; Fri, 28 Oct 2022 05:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ooLHB-000198-BK; Fri, 28 Oct 2022 05:03:41 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ooLH9-0004aF-Km; Fri, 28 Oct 2022 05:03:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FI4cOoemUgv7dJxDYwVP5svHFckyqUaMDURL265XhDc=; b=DWIYYkbTApltNX/NIy1HpFVY2D
 MA3MwgOZTKhy6oDc2L3aq7Hiyx0GmTicxclN5UtN1qb25QNsyDdgabEuc4+egLCbcLX2yI4lkBc31
 L103eVg0XRqzslKfGtmPO47ZNe7ccQFOMl2aH/cksPL1mQcgj9Ez3/X/A8bGWQNK7xiP7/S33M6mL
 7pIZoIPLNcRMEMVtvGFNMmTNa2q/A9JQL+j9qtiYodpzKoJQYXkNdMKpBy4nuRQuDbI7nCKP6Aizg
 uV785agV6Gn2lqjsxA+NaItQsMfgSSwJECV9Ar/RDtCwoh2HeSPw7osG5Zcsl98FFfpg9p5wQGvld
 Kiqsqpp6K4JlYdnCw+WZLboku2+JuvBb5m0BYCVFJlo0jCs8fVt940ugZ36N8Erv6vTfUhSOwal21
 l4N4/piPThwzYSfTi3msLYihs1g6rff7mZUvgq1jGoJxDVPQl7kudoQzLjNN5vvRu4rAK2VswGpKp
 DahBtzJ94rwCiYWicgfVkJDOVTKsnsmApRZQb3V6uW8BGMVG87rAVs2Xs2KYZ7tPxBsj+yVEJ4/fV
 azm/5B0qMa251KRKt6wuzswsCC8fnPho//sws6vvvak+q15LhPQc2G0GcMNaYFxiOwQdJD7MkpFbK
 28xomWhGTwdc7hMGu+N397pWzGZwx+y3TXkdA7FiA=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ooLH3-0001JT-On; Fri, 28 Oct 2022 10:03:34 +0100
Message-ID: <e540aff1-02d6-6a4f-ca52-1d9fe4b0c921@ilande.co.uk>
Date: Fri, 28 Oct 2022 10:03:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1664827008.git.balaton@eik.bme.hu>
 <923f59f6-5824-26b6-30e0-783060aad888@eik.bme.hu>
 <a229e9f8-35b-a4b1-8166-1c2c28867355@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <a229e9f8-35b-a4b1-8166-1c2c28867355@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 00/13] Misc ppc/mac machines clean up
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/10/2022 12:37, BALATON Zoltan wrote:

> On Tue, 11 Oct 2022, BALATON Zoltan wrote:
>> On Mon, 3 Oct 2022, BALATON Zoltan wrote:
>>> This series includes some clean ups to mac_newworld and mac_oldworld
>>> to make them a bit simpler and more readable, It also removes the
>>> shared mac.h file that turns out was more of a random collection of
>>> unrelated things. Getting rid of this mac.h improves the locality of
>>> device models and reduces unnecessary interdependency.
>>
>> Ping?
> 
> Ping^2 Only patch 4-5 still need a review. This series is a quite simple clean up 
> with no functional change and it's on the list for a month now with this v3 is 
> waiting for the last two weeks. I hoped to do some more changes after this was merged 
> but with this rate of maintainer activity I'm not sure even this simple clean up can 
> make it until the freeze and there seems to be no hope to get in more changes this 
> year, We need to do something about this situation as it hinders development. It 
> should not be so difficult to make even simple changes.

I've had a look at patch 4 in the v3 series and that seems okay to me (I think I may 
have simply missed adding a R-B tag?), so if you can resend a v4 with patch 5 removed 
then I will send a PR for before freeze.

I appreciate that the rate of patch review can be frustrating, but this is something 
that is true for all QEMU developers. Remember there is no commercial sponsorship for 
the Mac PPC machines so the speed of review and testing is often limited by work 
deadlines and/or personal circumstances.


ATB,

Mark.

