Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2FD6D61BF
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 14:59:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjgEz-0004Us-5u; Tue, 04 Apr 2023 08:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pjgEv-0004UH-CZ; Tue, 04 Apr 2023 08:58:21 -0400
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pjgEt-0008B8-QE; Tue, 04 Apr 2023 08:58:21 -0400
Received: from mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c18:1421:0:640:53a0:0])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 1AA945FD65;
 Tue,  4 Apr 2023 15:58:08 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4b1::1:2d] (unknown
 [2a02:6b8:b081:b4b1::1:2d])
 by mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 6wNZpt0OpW20-0u9ZROIX; Tue, 04 Apr 2023 15:58:07 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1680613087; bh=IxWeQ2VhY4xR5ysqH1Dr9EXINbhk2+suKKYCPi53X+8=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=R7skmKBkV1EFV+hCSa6u73ss+FW3whLppc35wAvGXP9XrHsIKwR91zH7MZZsAHtoS
 KMXq6CRn2qHvdCXL2OvqZaqwwFNXCrZ+q2kCqICrl6YoNGzLw+Hlu+pqxYYLXGjQGU
 a7S/SVlsa9igy0ZM4ylJ41iROqDiqlG7gErA6A60=
Authentication-Results: mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <5aa56e46-a411-ce0a-58ca-9695c1215a70@yandex-team.ru>
Date: Tue, 4 Apr 2023 15:58:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 00/16] qapi qga/qapi-schema: Doc fixes
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
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230404115912.2829251-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.925,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 04.04.23 14:58, Markus Armbruster wrote:
> It's always nice to get doc fixes into the release, but if it's too
> late, it's too late.
> 
> Generated code does not change, except for the last patch, which moves
> a bit of code without changing it.


I didn't deeply check the details, but looked through and nothing seems wrong to me. Good cleanup!

all patches:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>


PS: do you plan some automatic checks in build process to avoid similar style/naming problems in future?

-- 
Best regards,
Vladimir


