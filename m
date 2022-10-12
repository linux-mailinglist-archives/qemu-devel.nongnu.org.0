Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14A55FC6A8
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 15:41:14 +0200 (CEST)
Received: from localhost ([::1]:40932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oibyz-0002jD-UL
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 09:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oibtH-0002iX-Lt
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 09:35:19 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136]:54872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oibtG-0004CP-0e
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 09:35:19 -0400
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 41E6C5FC72;
 Wed, 12 Oct 2022 16:24:16 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b656::1:1e] (unknown
 [2a02:6b8:b081:b656::1:1e])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 2yuXYtdnEv-OEOmBRHn; Wed, 12 Oct 2022 16:24:15 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1665581055; bh=cu1MJzO4/XYe7j33VFgBOei0KF3DOAk1Xbtn+uyM018=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=XMwbwY8cpmWcjUDSz5T3mtCMgg8U4p/4RtXnR0t+HFvxB8ZWLTH+hhD4v8YnSbbq+
 BAy0eaU1+N5uRsB4qRdbHehWkviQyYNHiBBMFbpq5p9vY0+GcRgLl8w/bQdlCGRzw9
 3e7DIMm8dgHL9uNINK6VP9hgq5+ufLpajxcxAl+g=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <a89bcb13-f302-09de-fe3c-18bd84b9e071@yandex-team.ru>
Date: Wed, 12 Oct 2022 16:24:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] virtio: add VIRTQUEUE_ERROR QAPI event
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, mst@redhat.com,
 rvkagan@yandex-team.ru, yc-core@yandex-team.ru
References: <20220919194805.195952-1-vsementsov@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220919194805.195952-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.528,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

ping

On 9/19/22 22:48, Vladimir Sementsov-Ogievskiy wrote:
> For now we only log the vhost device error, when virtqueue is actually
> stopped. Let's add a QAPI event, which makes possible:
> 
>   - collect statistics of such errors
>   - make immediate actions: take coredums or do some other debugging
> 
> The event could be reused for some other virtqueue problems (not only
> for vhost devices) in future. For this it gets a generic name and
> structure.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir


