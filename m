Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 938275A94A7
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 12:31:52 +0200 (CEST)
Received: from localhost ([::1]:51886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oThUF-000847-Kq
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 06:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oThKl-0008RF-AE; Thu, 01 Sep 2022 06:22:06 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:56620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oThKh-0001oh-Ac; Thu, 01 Sep 2022 06:22:02 -0400
Received: from iva8-c5ee4261001e.qloud-c.yandex.net
 (iva8-c5ee4261001e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a8a6:0:640:c5ee:4261])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 794E72E1363;
 Thu,  1 Sep 2022 13:21:47 +0300 (MSK)
Received: from 2a02:6b8:c0c:1086:0:640:dc79:83bf
 (2a02:6b8:c0c:1086:0:640:dc79:83bf [2a02:6b8:c0c:1086:0:640:dc79:83bf])
 by iva8-c5ee4261001e.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 ULL2s00KR8c1-LlKa0164; Thu, 01 Sep 2022 13:21:47 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1662027707; bh=k/sHKjvPp1+gKOWTWQ/z9IkyHBH9e0ISyyt0tBQ/qwA=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=BDNvRmjGpQLcGaNqzTpuKmirHAPJcPJYNZquvHH/wnbZ/J7itlc44LgX19klylNMS
 mLs57LbdYTKxde1xDv8beT1/d+4hT8OvDLnpg9TsRvc+0vW2lYOHAK40hQDvwJ+edS
 WDadOagU+C/p4FUVZTob+L6imjhS0IQaBi4mYQsk=
Authentication-Results: iva8-c5ee4261001e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from sas1-7f179212b74f.qloud-c.yandex.net
 (sas1-7f179212b74f.qloud-c.yandex.net [2a02:6b8:c08:78a:0:640:7f17:9212])
 by sas2-6a1db1376cb6.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 xKLxk00JfCg1-c0tJecvs
 for <d-tatianin@yandex-team.ru>; Thu, 01 Sep 2022 13:21:37 +0300
Received: by sas1-7f179212b74f.qloud-c.yandex.net with HTTP;
 Thu, 01 Sep 2022 13:21:37 +0300
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 "mst@redhat.com" <mst@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "raphael.norwitz@nutanix.com" <raphael.norwitz@nutanix.com>,
 "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>
In-Reply-To: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
References: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
Subject: Re: [PATCH v2 0/8] vhost-user-blk: dynamically resize config space
 based on features
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 01 Sep 2022 13:21:47 +0300
Message-Id: <292621662027678@mail.yandex-team.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/html
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, BODY_SINGLE_WORD=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, HTML_MIME_NO_HTML_TAG=0.377, MIME_HTML_ONLY=0.1,
 PYZOR_CHECK=1.392, SCC_BODY_SINGLE_WORD=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

<div>ping</div>

