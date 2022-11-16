Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A980462C463
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 17:28:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovLGj-0000cu-Bw; Wed, 16 Nov 2022 11:28:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ovLGf-0000bE-Cx
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 11:28:05 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ovLGb-00067P-O3
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 11:28:04 -0500
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id F0A075ECEC;
 Wed, 16 Nov 2022 19:27:43 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:8128::1:3] (unknown
 [2a02:6b8:b081:8128::1:3])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 yE4cK9Mto5-RgNqPgTI; Wed, 16 Nov 2022 19:27:43 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1668616063; bh=QQoR1nk3UzmnGnp2OXiWFLkXkm3qFF3oIswsbALRHcU=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=fDc7V0VCn55dGkllSPen1ODFhXHtx4WlsdT6AnxhBogAROnqhA2xveKyNA9nlUBIZ
 oGpKpQBX06Gp5R26KOmoQOYaCm2/CRarfpvhJbNCIv72e8s7rpCuuGHjIlvks2p3Id
 CzGfDA+zrakRETlwlE91ACrkr+lLluGpXuIpU26g=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <b76380ca-4420-168b-11ff-ba331a057f77@yandex-team.ru>
Date: Wed, 16 Nov 2022 19:27:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH RFC 0/2] add SHPC hotplug event
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, eduardo@habkost.net, berrange@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 marcel.apfelbaum@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 den-plotnikov@yandex-team.ru
References: <20221116161234.44206-1-vsementsov@yandex-team.ru>
 <20221116112145-mutt-send-email-mst@kernel.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221116112145-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
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

On 11/16/22 19:23, Michael S. Tsirkin wrote:
> On Wed, Nov 16, 2022 at 07:12:32PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all! Please look at 02 for the details.
> 
> In the future, pls use --subject-prefix='PATCH RFC' with git-format-patch to
> add same prefix to all patches.
> If you are resending, add 'resend' in the subject, or increase the
> version #.
> 

OK, yes, will do next time. Sorry for the inconvenience :/

-- 
Best regards,
Vladimir


