Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1636F134E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 10:31:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psJV1-0003CV-C8; Fri, 28 Apr 2023 04:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1psJUs-0003Bn-Qz; Fri, 28 Apr 2023 04:30:30 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1psJUm-0001dQ-SH; Fri, 28 Apr 2023 04:30:30 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:369a:0:640:c31a:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id CFCF3609AC;
 Fri, 28 Apr 2023 11:30:11 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b432::1:18] (unknown
 [2a02:6b8:b081:b432::1:18])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 9UEwnD0OmW20-vqhXi7Bu; Fri, 28 Apr 2023 11:30:10 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682670611; bh=EzsavIIpT+SGo8QFTzAPwqwR2+KS/TzoXd41y6bLgFw=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=MaxfyH4toL7HMp42Y2DXB2Iz3OthAQnHne4pP5KZ7RlzwuVz2DBmE+IwloGWcavdl
 6gR0cf90e4IQKMgTl7jFiPUguwdJT1OwZ1qYPFOfE8/RDuRa/TQZM6PclzCBdPJlZK
 9HiFxsO1I5rZWWPihelrtSyBy1I/yDQtpArJrDms=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <570bb94d-ed84-72dc-be94-450a9ee5389a@yandex-team.ru>
Date: Fri, 28 Apr 2023 11:30:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 4/4] configure: add --disable-colo-proxy option
Content-Language: en-US
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, michael.roth@amd.com,
 armbru@redhat.com, eblake@redhat.com, jasowang@redhat.com,
 zhanghailiang@xfusion.com, philmd@linaro.org, thuth@redhat.com,
 berrange@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 dave@treblig.org, hreitz@redhat.com, kwolf@redhat.com, chen.zhang@intel.com,
 lizhijian@fujitsu.com, lukasstraub2@web.de
References: <20230427202946.1007276-1-vsementsov@yandex-team.ru>
 <20230427202946.1007276-5-vsementsov@yandex-team.ru>
 <87ildgbgv9.fsf@secure.mitica>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <87ildgbgv9.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 28.04.23 10:33, Juan Quintela wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
>> Add option to not build filter-mirror, filter-rewriter and
>> colo-compare when they are not needed.
>>
>> There could be more agile configuration, for example add separate
>> options for each filter, but that may be done in future on demand. The
>> aim of this patch is to make possible to disable the whole COLO Proxy
>> subsystem.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> 
> As you have arrived to an agreement about what to do with
> filter-rewriter, the rest of the patch is ok with me.

You mean filter-mirror, precisely this change to the patch:

  @@ -22,7 +22,7 @@ if get_option('replication').allowed() or \
   endif
     if get_option('colo_proxy').allowed()
  -  softmmu_ss.add(files('filter-mirror.c', 'filter-rewriter.c'))
  +  softmmu_ss.add(files('filter-rewriter.c'))
   endif
     softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))

?

> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 

-- 
Best regards,
Vladimir


