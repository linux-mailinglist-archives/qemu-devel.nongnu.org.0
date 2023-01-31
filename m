Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5CD682685
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 09:34:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMm5O-0007ss-JR; Tue, 31 Jan 2023 03:33:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pMm5L-0007sL-Kq; Tue, 31 Jan 2023 03:33:47 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pMm5J-0000yR-MT; Tue, 31 Jan 2023 03:33:47 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id CACF45E7B0;
 Tue, 31 Jan 2023 11:33:24 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b42f::1:11] (unknown
 [2a02:6b8:b081:b42f::1:11])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 MXQcqC0QYiE1-xQNVObYN; Tue, 31 Jan 2023 11:33:23 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1675154003; bh=/ZzzXnxJEUhn1s6JzrmNCMDRn/vHMwKPIB2mhIMVEtg=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=UNWvpsrE/NP5qGkRgDHvkICtiAG4GotoGADlg4qZgB1KUoXTKpQBLxJYZlpHXOZvL
 SfZqo1MfuoDmqNsUmsfE55g/WgnmbQdBsDO5I3oZ8/V2oVCRIP6WDf2XFWgRNwUTN6
 bCXU6jO6JIEVahr3oVJOAqXPXuUQbigONyMI7yFQ=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <f37db85a-b0aa-b34a-7d5a-b1ab650f1683@yandex-team.ru>
Date: Tue, 31 Jan 2023 11:33:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3] migration: Remove res_compatible parameter
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Eric Blake <eblake@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Fam Zheng <fam@euphon.net>, David Hildenbrand <david@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 Klaus Jensen <its@irrelevant.dk>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Laurent Vivier <laurent@vivier.eu>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Thomas Huth <huth@tuxfamily.org>,
 Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 virtio-fs@redhat.com
References: <20230130080608.2100-1-quintela@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230130080608.2100-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
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

On 1/30/23 11:06, Juan Quintela wrote:
> It was only used for RAM, and in that case, it means that this amount
> of data was sent for memory.  Just delete the field in all callers.

Could you describe, why it's safe to change the behavior for RAM?

Also, I think it would be a lot better to split the change for RAM (s/res_compatible/res_postcopy) in one patch, and then drop the totally unused res_compatible file in the second patch


-- 
Best regards,
Vladimir


