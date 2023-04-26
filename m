Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54516EF383
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 13:40:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prdVG-0004Z1-PV; Wed, 26 Apr 2023 07:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prdVE-0004XE-8N
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 07:40:04 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prdVA-00078m-Bn
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 07:40:03 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:369a:0:640:c31a:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id E69D15F865;
 Wed, 26 Apr 2023 14:39:51 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6525::1:35] (unknown
 [2a02:6b8:b081:6525::1:35])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id odFV420OceA0-duaQvCBg; Wed, 26 Apr 2023 14:39:51 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682509191; bh=FaMqOBX/mTW4T/P2xzzU0cDG1FzCu++gmvTAyVvYa2Y=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=FoxVrBptvsowCpZHnhj56pgjeOVX1RZIPvNhHtB1ic/tSkKKHfNLdZUz8viWwztal
 kop9aT1v3WEgv3WbcAtvBEMx9H36uwwYze4WwvPDHVq6dcUEK+Akbmzkq83upptcvk
 DV6FwcGGG8TIrKupjKfu+L8/YW5OczMd+kq3zP78=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <1127fff1-03e6-c8f1-02b4-dc670e843961@yandex-team.ru>
Date: Wed, 26 Apr 2023 14:39:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] tests/unit/test-blockjob: Re-enable
 complete_in_standby test
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Czenczek <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20230426104009.2571175-1-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230426104009.2571175-1-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26.04.23 13:40, Emanuele Giuseppe Esposito wrote:
> Pause the job while draining so that pause_count will be
> increased and bdrv_drain_all_end() won't reset it to 0, so the
> job will not continue.
> 
> With this fix, the test is not flaky anymore.
> 
> Additionally remove useless aiocontext lock around bdrv_drain_all_end()
> in test_complete_in_standby().
> 
> Fixes: b6903cbe3a2 "tests/unit/test-blockjob: Disable
> complete_in_standby test"
> Suggested-by: Hanna Czenczek<hreitz@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir


