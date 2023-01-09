Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EA96627A0
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 14:48:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEsLQ-0004NO-PB; Mon, 09 Jan 2023 08:37:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pEsL7-0004H1-Uw
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:37:37 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pEsL6-0003lD-6y
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:37:25 -0500
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 003E75FDF3;
 Mon,  9 Jan 2023 16:37:12 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b685::1:3c] (unknown
 [2a02:6b8:b081:b685::1:3c])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 7bcj582QYa61-kKDqlpC6; Mon, 09 Jan 2023 16:37:10 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1673271431; bh=AfV8sJOJTsNYxLxMrquL2gOSempm8JF4FmvD0Hpd7Qo=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=hDfnQYItp8d37/v1gFvuKN93KrVYoT+0/mQXiE8WfFiqztC9sMXBIJiBKS2mbtb7E
 7pttags7N12SZtpAz/TaR7u6oVsNGDl0FO5G+qHOln/oYhzbkOw3e4sVHBk2hzlIoH
 okl7pnnoS4TeravF3sN3DHoL9DWHdqGBPOpDrdI8=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <73a26dbd-c625-33e8-4b01-8e93422fae61@yandex-team.ru>
Date: Mon, 9 Jan 2023 16:37:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] coverity: physmem: use simple assertions instead of
 modelling
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, david@redhat.com, peterx@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, armbru@redhat.com
References: <20221226220351.754204-1-vsementsov@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221226220351.754204-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

ping

-- 
Best regards,
Vladimir


