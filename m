Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAC46D61B9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 14:56:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjgC9-0002ZL-DY; Tue, 04 Apr 2023 08:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pjgC6-0002Yr-EG; Tue, 04 Apr 2023 08:55:26 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pjgC4-0007EX-4q; Tue, 04 Apr 2023 08:55:26 -0400
Received: from mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c08:19a8:0:640:4e87:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 19B0E5FD32;
 Tue,  4 Apr 2023 15:55:11 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4b1::1:2d] (unknown
 [2a02:6b8:b081:b4b1::1:2d])
 by mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 8tNSUd0Oh0U0-aiibzom9; Tue, 04 Apr 2023 15:55:10 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1680612910; bh=XOIpGoFuMpJKHAKHhu6BJBPMJ/iPNFCUKSkICmllneM=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=GP2Llkj9ZfUgAKt7PTT+R4EJABOqcIRPRS1T3ApTAlgF1FOt4FOsM7iJBIlIycBIG
 ADuEmeQbzx7G10HWSBsekattqHwcIeq4wHLJKXyM/nQTbzO9UdIcrA3fX9GmCj+Cdk
 FFzdtjzRn4BdKMhKJquqyIwAD3tG3CN3Bhhkv/g4=
Authentication-Results: mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <1c067573-9eab-fa70-8c49-a4085d150134@yandex-team.ru>
Date: Tue, 4 Apr 2023 15:55:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 15/16] qapi: Format since information the conventional
 way: (since X.Y)
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, eblake@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 arei.gonglei@huawei.com, pizhenwei@bytedance.com, jsnow@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 quintela@redhat.com, jasowang@redhat.com, yuval.shaia.ml@gmail.com,
 stefanha@redhat.com, kraxel@redhat.com, kkostiuk@redhat.com,
 qemu-block@nongnu.org
References: <20230404115912.2829251-1-armbru@redhat.com>
 <20230404115912.2829251-16-armbru@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230404115912.2829251-16-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.925,
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

On 04.04.23 14:59, Markus Armbruster wrote:
> @@ -2741,7 +2741,7 @@
>   #
>   # @on-error: the action to take on an error (default report).
>   #            'stop' and 'enospc' can only be used if the block device
> -#            supports io-status (see BlockInfo).  Since 1.3.
> +#            supports io-status (see BlockInfo).  (Since 1.3)
>   #
>   # @filter-node-name: the node name that should be assigned to the
>   #                    filter driver that the stream job inserts into the graph
> diff --git a/qapi/stats.json b/qapi/stats.json
> index f17495ee65..36d5f4dc94 100644
> --- a/qapi/stats.json
> +++ b/qapi/stats.json
> @@ -69,7 +69,7 @@
>   #
>   # @vcpu: statistics that apply to a single virtual CPU.
>   #
> -# @cryptodev: statistics that apply to a crypto device. since 8.0
> +# @cryptodev: statistics that apply to a crypto device (since 8.0)
>   #
>   # Since: 7.1
>   ##
> diff --git a/qapi/tpm.json b/qapi/tpm.json
> index 4e2ea9756a..eac87d30b2 100644
> --- a/qapi/tpm.json
> +++ b/qapi/tpm.json
> @@ -44,8 +44,7 @@
>   # An enumeration of TPM types
>   #
>   # @passthrough: TPM passthrough type
> -# @emulator: Software Emulator TPM type
> -#            Since: 2.11
> +# @emulator: Software Emulator TPM type (since 2.11)

Seems, we don't have any preference between "some text (since VER)" vs "some text. (Since VER)" ?

-- 
Best regards,
Vladimir


