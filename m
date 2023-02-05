Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FD768B2DC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 00:33:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOoV5-0006IY-8p; Sun, 05 Feb 2023 18:32:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOoV0-0006Hz-VX; Sun, 05 Feb 2023 18:32:43 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOoUz-0000Kj-HI; Sun, 05 Feb 2023 18:32:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=swV9CZqHOmSyHSHRmGDKRKfDUI19XgCsenFN7kdixsc=; b=kiiE3aqc/EdkVuUP24yTrQEYYR
 ZLmlhElSbONVhTeuXVwxAdxcEW1oNi+3Q37DD10lkXQzfKhr2IYNeHjhs5su/ol9lp8Jbk4jRf2kQ
 lG30zyKgP68pbfHMriM6xJ5VXaVLYEEMV0y/7RdcTEJRwlykABAH7hAr2G1KMmaQLJK4aa0KYLSny
 pIKVKMBEo4sEuYQlna9KJ5v9Hm2lpBGWLQl3+X4am8N8WAZ2Nf0/0loa9q6p57nXmfYbwKC0Q9104
 3AxlzKqe/9XxlDqmOtfq6ShRp4HP2U8JSHVzOhAVOV1WoOhUCOufxoSR0m4E5aemdDDggC7pgMrFr
 gJRjO0VtmpIK5Fl3inyH8xifZ0YdFvquhJgm9Pg7YAHhsy8saN/7Oa4viET93ofgFDny0YXo8mHRs
 WJK+x41y0MzEWMWGON7wUji3Pg2hnEfBZtUEQThnoQGB1ZPS3HXSS10KEC14Yc39+lYkBAYdp3xyQ
 cQxtZyXox0bgKjMFFhjhlWysZidOs5Lim98UJBDGEorxZH/QlAwl5ItU+IO4U5Vhw6CYDaWpfS0x4
 Lpe/jOZs4oIhghq37s6f/GnxH88m0u2KiEsNKGyUemBa4JE8RGaiTu7PZES6LibALgkGLE2oAS/E3
 N7IaoSogcBKw6fvrdKa3b23J1Es5a42f2BbT/jtJI=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOoUQ-0008SV-9c; Sun, 05 Feb 2023 23:32:10 +0000
Message-ID: <7ee99649-4afc-c4dc-f692-58d9bb2929af@ilande.co.uk>
Date: Sun, 5 Feb 2023 23:32:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1675297286.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <cover.1675297286.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 0/2] mac_nvram: Add block backend to persist NVRAM
 contents
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 02/02/2023 00:24, BALATON Zoltan wrote:

> Same as v1 just split in two patches as suggested by Mark.
> 
> Regards,
> BALATON Zoltan
> 
> BALATON Zoltan (2):
>    mac_nvram: Add block backend to persist NVRAM contents
>    mac_oldworld: Allow specifying nvram backing store
> 
>   hw/nvram/mac_nvram.c         | 28 ++++++++++++++++++++++++++++
>   hw/ppc/mac_oldworld.c        |  8 +++++++-
>   include/hw/nvram/mac_nvram.h |  1 +
>   3 files changed, 36 insertions(+), 1 deletion(-)

This seems okay to me so:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

There was no further comment from Cédric regarding blk_check_size_and_read_all() so 
I've applied this to my qemu-macppc branch.


ATB,

Mark.

