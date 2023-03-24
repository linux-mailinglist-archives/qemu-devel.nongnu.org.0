Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D53A6C8163
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:37:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfhzX-0003Pz-Al; Fri, 24 Mar 2023 10:02:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=440da7b32=anthony.perard@citrix.com>)
 id 1pfhzR-0003PG-3L
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 10:01:58 -0400
Received: from esa4.hc3370-68.iphmx.com ([216.71.155.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=440da7b32=anthony.perard@citrix.com>)
 id 1pfhzB-0001du-5y
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 10:01:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1679666500;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=etYuVIm3qtpgUcsm+VlPHh9b2LeP3vrVXGfwfPpeWZY=;
 b=E0Erp1jPYlQuqRdQU1lKbV4x9l+gh5vNnd9nb6j1MHkM14D5n5+vKG+9
 6bMWpR9/ueZigrnSXJerQe6HbAP355UyZorN2j5JTUrZ3NdbLpkbZVl2W
 jlbx5WxjNzo/Y+5TPBuTHuF7jR/k1pF4UYxEudHfauIwWyawiqUDZu+sC U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104607686
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:KvO6Iq/KZcqXTvyVVRxgDrUD+36TJUtcMsCJ2f8bNWPcYEJGY0x3y
 mYdWDuEP/7fYTajfdl/btng/R5Sv8WEm9ZnT1dt/yw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqoX5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkll1
 OYyJDUqRSm4pOazwri7EfZOr9oKeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0MxhrG/
 j2YrzqR7hcyH/OAy2W97EiXvPafuXP8cZopE6G/6as/6LGU7jNKU0BHPbehmtGhh1KzQZRaI
 l0Y9y4qhawz8kWxSZ/6RRLQiGeJuwNZV9dOHukS7gaLxazJpQGDCQAsRyZMctU8uOcqRDYh0
 RmCmNaBONB0mOTLEzTHrO7S9G7sf3FPdgfueBPoUyMuwsPJrIQUpSv0bdJmEqS11cLXMC/Zl
 mXiQDcFu1kDsSIa//zlogGZ2W/09sGhoh0dvVuOAD/8hu9tTMv8PtHztwCGhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JAVdoKiN2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa/RIm0CK2MN4QQPvCdkTNrGwkwDXN8Iki3yBR8+U3BE
 c7znTmQ4YYyVv08kWveqxY12r433CEurV7uqWTA503/i9K2PSfFIYrpxXPSNojVGovY+lSKm
 zueXuPWoyhivBrWOXGNq9FIfQ5RfRDWx/ne8qRqSwJKGSI+cElJNhMb6ehJl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:mwZNC6AuX+b5wyXlHelr55DYdb4zR+YMi2TC1yhKOHpom62j9/
 xG+c5x6faaslcssR0b6LW90cq7MArhHPxOkPEs1N6ZNWGI1ldARLsSlrcKqAeQfxEWmNQtsp
 tIQuxSMvC1K35Q5PyX3OC/Kbwd6ejCyoyTwc356FhMYz1QQ5xBySA8MCqne3cGJzVuNN43FJ
 +R/MpVqyDIQxkqR86mHGQCW+TZh/CjruOFXSI7
X-IronPort-AV: E=Sophos;i="5.98,288,1673931600"; d="scan'208";a="104607686"
Date: Fri, 24 Mar 2023 13:47:12 +0000
To: <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>
Subject: Re: [PULL 0/1] xen queue
Message-ID: <758626c4-f46f-471e-81c0-58e82f6623b1@perard>
References: <20230323100200.12986-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230323100200.12986-1-anthony.perard@citrix.com>
Received-SPF: pass client-ip=216.71.155.144;
 envelope-from=prvs=440da7b32=anthony.perard@citrix.com;
 helo=esa4.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 23, 2023 at 10:01:59AM +0000, Anthony PERARD wrote:
> The following changes since commit 60ca584b8af0de525656f959991a440f8c191f12:
> 
>   Merge tag 'pull-for-8.0-220323-1' of https://gitlab.com/stsquad/qemu into staging (2023-03-22 17:58:12 +0000)
> 
> are available in the Git repository at:
> 
>   https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20230323
> 
> for you to fetch changes up to f75e4f2234e7339c16c1dba048bf131a2a948f84:
> 
>   accel/xen: Fix DM state change notification in dm_restrict mode (2023-03-23 09:56:54 +0000)
> 
> ----------------------------------------------------------------
> Xen queue
> 
> - fix guest creation when -xen-domid-restrict is used

Hi Peter,

I'd like to cancel this pull request. I've got another patch to add to
it. Is that fine? If I don't have any reply, I'll create a new PR later
today and consider this one cancel.

Cheers,

-- 
Anthony PERARD

