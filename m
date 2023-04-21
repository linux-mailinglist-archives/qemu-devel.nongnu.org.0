Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4336EA9D7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 14:01:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pppQQ-0003te-AC; Fri, 21 Apr 2023 07:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pppQN-0003qS-GO; Fri, 21 Apr 2023 07:59:35 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pppQL-00050H-7S; Fri, 21 Apr 2023 07:59:34 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:7f29:0:640:9a2b:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 8994D616EC;
 Fri, 21 Apr 2023 14:59:20 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:8816::1:4] (unknown
 [2a02:6b8:b081:8816::1:4])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id JxdHjT1OiuQ0-xvlUK7Zq; Fri, 21 Apr 2023 14:59:19 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682078359; bh=ZRyZ+7ySCEr+Y/PTlqpQTCf59bvaki66RWgbbe5bjAU=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=RODDUAt8hbRf+2Zew5e+VRh18sR4pbAVFxm6Uv4hl5nDi2APvS0JMxk1Y3kyiw7jo
 YFdUqr9Ue4opRvnxv7lE8esE+WCj3j9er8K6xhxx6TN9EG1kF7aD8SOwRKg8CxRaSq
 AC/QJrGFKVepZk5nZz+qoq7G0vXCH6A8wETnENdY=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <7366eb2b-5fee-e7b9-e82d-2cf0bd950b9b@yandex-team.ru>
Date: Fri, 21 Apr 2023 14:59:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 00/16] iotests: use vm.cmd()
Content-Language: en-US
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, crosa@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com
References: <20230215132547.1620575-1-vsementsov@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230215132547.1620575-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 15.02.23 16:25, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> Let's get rid of pattern
> 
>      result = self.vm.qmp(...)
>      self.assert_qmp(result, 'return', {})
> 
> And switch to just
> 
>      self.vm.cmd(...)
> 
> v5:
> - include fixups by John
> - fix 'make check-dev'
> - split first patch into several [Daniel]

Ping.

Patches 1-2 (or their equivalence) are already merged, patches 03-16 are applicable on current master, I don't think it worth resending a v6 just to drop 1-2.

-- 
Best regards,
Vladimir


