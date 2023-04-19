Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E29C6E853A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 00:50:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppGbf-0001in-6p; Wed, 19 Apr 2023 18:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppGbd-0001iX-1D; Wed, 19 Apr 2023 18:48:53 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppGbZ-0007nN-TC; Wed, 19 Apr 2023 18:48:52 -0400
Received: from mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:2cab:0:640:424b:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 3D2F45FB60;
 Thu, 20 Apr 2023 01:48:38 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b583::1:16] (unknown
 [2a02:6b8:b081:b583::1:16])
 by mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id bmmjjm05SOs0-Ap7XKUUL; Thu, 20 Apr 2023 01:48:37 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1681944517; bh=MFJk3+fyurY4mCwJp6SzFlh2abgMZn+kT0Rqn06ae7s=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=UqeOHZbwS0i3dTHxmnS5Wfcc6UEiFhDGVU1cHpWSaNqHysYVVJmYcEtp/xDZhrlkS
 ByaPnpnocQsJ/EDFbs7EnqlYMJnhyqRD1Un2sR14kwp0Rdqg0BllSx/OFrPlrINR9W
 jLf/Q0DChw8UeV9HvbkSiL8FbuiZiRUANyeKreiI=
Authentication-Results: mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <8c34c302-911d-b03c-6cac-f43cccead048@yandex-team.ru>
Date: Thu, 20 Apr 2023 01:48:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] replication: compile out some staff when replication is
 not configured
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, jasowang@redhat.com, dgilbert@redhat.com,
 quintela@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 zhanghailiang@xfusion.com, chen.zhang@intel.com, lizhijian@fujitsu.com,
 wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 den-plotnikov@yandex-team.ru
References: <20230411145112.497785-1-vsementsov@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230411145112.497785-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
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

On 11.04.23 17:51, Vladimir Sementsov-Ogievskiy wrote:
> Don't compile-in replication-related files when replication is disabled
> in config.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>

v2 will be called "[PATCH v2 0/4] COLO: improve build options"

-- 
Best regards,
Vladimir


