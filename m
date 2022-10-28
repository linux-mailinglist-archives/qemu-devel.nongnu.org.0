Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 737C6610CBB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 11:08:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooLLB-0002ft-II; Fri, 28 Oct 2022 05:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ooLKn-0002ZA-3R; Fri, 28 Oct 2022 05:07:43 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ooLKh-00055n-Db; Fri, 28 Oct 2022 05:07:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BnjoptiUKhXSFfZM/LUoWhDyJ4pRN5QCmfzqCCfDaeU=; b=W96MzJWHHdF4YHbS9qFfq3VeQC
 /5/y4zqy0Si7TIS7MbduULlk1GEpcP03WpG/t7zB4Zx8yChm9jD5Ds4ch2XRF3YU4H2OuEPGmd1fh
 dRRKU0o5hKpn+Q2TJ+l6RLS7Y2N8FNV2Jiwhrl7ukjQBtDIjDsAeW2BLMnm9IUtlrmiWuOSRP+wBo
 IVT8BlG8K8XmLwruKdBjfS+XfEG02BagCZIdgFJX9dAgAQhsmNJ8mb7g49N6Jij64IPQhHd9dcd21
 WDoKmQoWvPZmPKrhPkC7BmrB4CaBmLywQFNy4lVDg/uotSNg8F9HuWeYWuHeVbpUVXVp+Vsu6VHHi
 jyMlhVlYPYQwKNZBNq1bOzTrUsi6XlANemoHEk2jDpAkcQiB7Yc3I8X0rpIqS3S1PFuAiokLAi7Om
 aIbU3WxsAFzSqvV+GAGD/QSa9w3J0htDl6GLYy4Rwj2CZVrx7Z1UQt+e/UmAvIlk9qNoUdKXH4q8t
 yFvc2Kx2wN33F/5F/iGB0bzBptUnoDPStiikgD1cZIpnEkCwn+ddoQRdjZIiwxrsIJII3gZLKyjCQ
 wSlC7ouA7QTEpjFeQqRyfPpAyae1VZMsi8RM1QNpTV8D/Zo0U/uQKfMPvuALzz3PXM10GyEjlLWay
 67MMpBQDTofQJ0NsDEaWUZ/icGOqSJ1XNeetIAy+M=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ooLKY-0001mC-4P; Fri, 28 Oct 2022 10:07:10 +0100
Message-ID: <557fdfb3-cd05-948b-03f8-6347d7436532@ilande.co.uk>
Date: Fri, 28 Oct 2022 10:07:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1666715145.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <cover.1666715145.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v4 00/19] Misc ppc/mac machines clean up
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

On 25/10/2022 17:44, BALATON Zoltan wrote:

> Since only one week is left until freeze starts I've included some
> more patches in this version that I've intended to submit after the
> clean ups but we're running out of time now. The last 3 patches could
> be squashed together, I've just split these up because I expect
> resistence from Mark to any changes so maybe it's easier to digest
> piece by piece and can cherry pick parts easier this way but ideally
> these should be in one patch.
> 
> I'd appreciate very much if this series would get in before the
> freeze, it is very discouraging to spend time with something that gets
> ignored and then postponed for the rest of the year just to start
> again the same in January. This might be a reason why not many people
> contribute to this part of QEMU besides that maybe only a few people
> are still interested so those who are interested should be served
> better to not scare them off even more.
> 
> Regards,
> BALATON Zoltan
> 
> v4: Add some more patches that I've found since v3 or was intended in
> separate series
> v3: Some more patch spliting and changes I've noticed and address more
> review comments
> v2: Split some patches and add a few more I've noticed now and address
> review comments

Oh wait, there's already a v4 with even more changes in? This is really confusing as 
a reviewer...


ATB,

Mark.

