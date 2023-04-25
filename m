Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01D16EE5E6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 18:39:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prLfx-00015f-Rg; Tue, 25 Apr 2023 12:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prLfu-00015E-9u
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 12:37:55 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prLfr-0000Gs-96
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 12:37:54 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:369a:0:640:c31a:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id B77995F53C;
 Tue, 25 Apr 2023 19:37:44 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b440::1:14] (unknown
 [2a02:6b8:b081:b440::1:14])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id hbJjF20OdeA0-axzGZacY; Tue, 25 Apr 2023 19:37:43 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682440663; bh=eoVer081CCM3df2k6TTqGoX8k5J8Y0C/RmbPrVK/yK0=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=ySaRxk2Sop//ng9efJEGfcBkt3fzikK/e9g6Cosi6Kto+ZkaKZl6SeWYpoQ2SIbuy
 UVfairJqLIvg9WZsW1F+oAq0NEGnwsj56tTPgoYGqOecIwBVOJAmM347jAQSM7+4Ts
 JADehIJUqiZh9ykA8syne7gzQnHLEHkNxu8akx4M=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <17200eef-53c0-71c2-6b7b-0f16514b223d@yandex-team.ru>
Date: Tue, 25 Apr 2023 19:37:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 0/3] ROM migration
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: marcel.apfelbaum@gmail.com, mst@redhat.com, philmd@linaro.org,
 david@redhat.com, peterx@redhat.com, pbonzini@redhat.com,
 den-plotnikov@yandex-team.ru, lersek@redhat.com, kraxel@redhat.com
References: <20230425161434.173022-1-vsementsov@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230425161434.173022-1-vsementsov@yandex-team.ru>
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

On 25.04.23 19:14, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> v2: simply ignore romfile on incoming migration when romsize is
> specified.
> 
> Here I suggest a way to solve a problem, when we have existing
> running QEMU with old option ROM of small size and want to migrate to
> new environment where we don't have this ROM file.
> 
> All the details are in patch 03; 01-02 are simple code style
> improvements.
> 
> Vladimir Sementsov-Ogievskiy (3):
>    pci: pci_add_option_rom(): improve style
>    pci: pci_add_option_rom(): refactor: use g_autofree for path variable
>    pci: ROM preallocation for incoming migration
> 
>   hw/pci/pci.c | 101 ++++++++++++++++++++++++++++-----------------------
>   1 file changed, 55 insertions(+), 46 deletions(-)
> 

While being here, could I ask a question:

As I understand, netcard ROM file is needed only for network boot. So, it's absolutely correct to use romfile="" option: network boot will not work, but everything else will work correctly. Is that right?

-- 
Best regards,
Vladimir


