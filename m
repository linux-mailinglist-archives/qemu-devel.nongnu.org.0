Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 265376871F8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 00:32:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNMZj-0001OB-0g; Wed, 01 Feb 2023 18:31:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pNMZf-0001M7-Qe; Wed, 01 Feb 2023 18:31:32 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pNMZa-0006ki-7N; Wed, 01 Feb 2023 18:31:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RDdW638N5JVjc4OZmyTloK10JQKUmgbdBHkjJ+0WGSw=; b=k3IVGnhpfMPR7NOZlFCreRC0dI
 M1Nv6Qisn++W5n60CvqFE853iAMCZsG9pHYdpMl5mOg1KtPoJv3YtSFv6jlgc2ERf/nk8ZSyK+BxL
 hMj+gpogMmyX91HFsw91h9npYcFc2/w/EZ/6aenqmqMaGrWoZvEPdwdfCOBjJmzUr1YJBHl7nK6P4
 a3+FxI2v+UYqP5QYcl4Y4TFicHVoOwDF4+1KMr0/eWcQx/Pt5bpCXk8pLe5+mBlprf3nBscSS36dH
 8AzYHITMQhdMG8b5K5SG9fkLGSfL9QL5KDcSB7GAwRhgZs0bLXjMEaxVtLxmhYCFFz4RFlPu07Wb1
 VDnLwk7cKH0vTqLKPA0aUNkdKJfPazyYGbYISMN68DZmaAXJyPhFBAeJ9r/tQO0NHNYkd8IChCFBu
 qjwKjal/R7vCGsaFP8EGyc8aIvbXfKjI+JNvva5NuIh0l+677ptEQeKzXaqXDLUV72mlEOXR64Hse
 iOUzEqMDeJUBlibKmrh1agC6XafDELVuFCq9gwAzVIiLaV3zrKqW4goPn+H5rGQUycOW2qIejm2n6
 KUtY6MtvLb0PWLGO32BQmHd80iR+358+TMokmE7VYxHrEe/Xdc82YxREnnWK8QZfeMY+ZO1A6ysMq
 tlfIoAJKRUCVnHTwmt4QN7NU/e8G5ue1jJU3T3PhI=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pNMZ5-0005kE-UC; Wed, 01 Feb 2023 23:30:56 +0000
Message-ID: <f3a4fea7-4d85-300e-386d-bca205a50c7a@ilande.co.uk>
Date: Wed, 1 Feb 2023 23:31:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1672868854.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <cover.1672868854.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v7 0/7] Misc ppc/mac machines clean up
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 04/01/2023 21:59, BALATON Zoltan wrote:

> This is the remainder of the series that were postponed to after the
> freeze the last time I've tried to submit them with some new patches
> I did meanwhile.
> 
> BALATON Zoltan (7):
>    input/adb: Only include header where needed
>    mac_{old,new}world: Use local variable instead of qdev_get_machine()
>    mac_{old,new}world: Pass MacOS VGA NDRV in card ROM instead of fw_cfg
>    mac_newworld: Add machine types for different mac99 configs
>    mac_newworld: Deprecate mac99 with G5 CPU
>    mac_newworld: Deprecate mac99 "via" option
>    mac_newworld: Document deprecation
> 
>   docs/about/deprecated.rst    |   7 ++
>   docs/system/ppc/powermac.rst |  12 ++--
>   hw/misc/macio/cuda.c         |   2 -
>   hw/misc/macio/pmu.c          |   3 -
>   hw/misc/mos6522.c            |   1 -
>   hw/ppc/mac_newworld.c        | 130 +++++++++++++++++++++++++++++++----
>   hw/ppc/mac_oldworld.c        |  21 ++----
>   include/hw/misc/mac_via.h    |   1 +
>   include/hw/misc/macio/cuda.h |   1 +
>   include/hw/misc/macio/pmu.h  |   1 +
>   include/hw/misc/mos6522.h    |   3 +-
>   11 files changed, 142 insertions(+), 40 deletions(-)

I've applied patches 1 and 2 to my qemu-macppc branch. Patch 3 isn't the right 
solution to the problem, and the discussion as to how the New World machines should 
be organised in future for patches 4 to 7 still hasn't been clarified.


ATB,

Mark.

