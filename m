Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81164415C11
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:38:50 +0200 (CEST)
Received: from localhost ([::1]:34556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTM7t-0000Ie-Fa
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTM4X-0004Sf-K2
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:35:24 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:43173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTM4W-0000gS-1S
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:35:21 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N2lv2-1mqYJe2mwm-0136oy; Thu, 23 Sep 2021 12:35:18 +0200
Subject: Re: [PATCH v5 13/20] nubus-bridge: introduce separate NubusBridge
 structure
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-14-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <80ea6b09-6517-1965-18d0-1c05e6f7dd8f@vivier.eu>
Date: Thu, 23 Sep 2021 12:35:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210923091308.13832-14-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9bx5HurRCErBCOXaUFNCP5uodUACd8gmL+LpIcxxcBZ9rSWTrWh
 OfN71eki8aStGb4Ran9Q+gxWzUKXXzeOJ/Z7svaDG9hAh3cDtHVRQQtqwSJoX58R0+O/O1N
 wBPlKDXFDj2+nGsTzBsVHX1gDxxTJv1pZCRLku7qoSo2ybiBiGo5YZc/k3Cin7s4RvJs26U
 9PwxIyf289cT6n9bNZRgw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dN9y3hTXsP0=:4xmO5uljgmm31y6Ht5FNBO
 6SWtfqOjUrpLntM6z6lDohlGo6xslg/tIYzdo29u4Xgi2HUFZELPlXmlyB2vfl00XnqvsRavI
 42ODCFItIXPOgfczeyKLcj18ZEVy/YGpg9xBxvrRKj+ywPB+Gn9Zt+r6fsMHhAs86IKgzmV4d
 0owBWhpU6WDStkCrsPvFNHH7mS2xGZ4ufm5Zm2JYfk91pzX7zbWiGtnl2rLV8Z3mD+7GYGJZ4
 noLELySgLilmHgVqNiVTVjz1e70tVAg7HfztXZRTs2vkAfCN9PzNOYQO3V/qsDd691sMisoMd
 2FH4Wk1pH7aG2ttmUrBzYMVKk40wcvW7k3KLzQJFGDO4KUN6ASH9vLpzit9srSqsVVLxiJeoU
 xaAgcISPS3h8kTjrrlU4iaMdXUHFP9MwO5esNgqdG16ojYltBau/3OFSoKcZYeq4XNN9HX5XW
 /O2vVjV+go+wB37JGDW48mN8mDRetElRtCsy+zcDpKsnnb56baEDfa3q7KCy7gK1lufblkRit
 DlyuOz0HYvAHTYoKy/RTnViA/PiWye/PZDuU0eeJKmbr8PNps8JkVYcM2VlQvQfr78BvXNEHD
 OdBcZwSsbrB/QevjZsOcxBfbbcIquLs3PmRACwozlTV0AgT1st51/QWXQw0Dte0IIqUdC774z
 sf0zNi/L1wfOvCBAqGTVeQeWr7dAvxGe6M/qgNCbgRP2GqW724Aw8lAqkT0wQIyDRGEIiRxYF
 M2e7DTzdIvLswhMjj5rrYdcf1SyZtOkN/yzcSw==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 23/09/2021 à 11:13, Mark Cave-Ayland a écrit :
> This is to allow the Nubus bridge to store its own additional state. Also update
> the comment in the file header to reflect that nubus-bridge is not specific to
> the Macintosh.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/nubus/nubus-bridge.c             | 4 ++--
>  include/hw/nubus/mac-nubus-bridge.h | 2 +-
>  include/hw/nubus/nubus.h            | 6 ++++++
>  3 files changed, 9 insertions(+), 3 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

I think it could be merged with next patch.


