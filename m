Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8785C2613DE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 17:53:55 +0200 (CEST)
Received: from localhost ([::1]:51410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFfwQ-0001T7-KC
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 11:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1kFfvZ-0000VS-OX
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 11:53:01 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:58134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1kFfvX-0003M4-SY
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 11:53:01 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id C02912E1610;
 Tue,  8 Sep 2020 18:52:56 +0300 (MSK)
Received: from localhost (localhost [::1])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 7As8k8DEoC-qswqc1qX; Tue, 08 Sep 2020 18:52:56 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1599580376; bh=5+Y0mS8u3OdOFxfX9h+zljoTzxwlkCuP2mdFBeXQEg8=;
 h=References:Date:Message-Id:Cc:Subject:To:From;
 b=mrGPsLLXIIaL9PEYOu7SL8zRO/Y0Q5vSHC3D7DnKUtumk9OQSy/2i3Hwad/kx6EeK
 rHM3U5Vv7FEIBVEz7qEdX2Cj9K4lsIt2tEKI5cH6RAbtkpHFMey7fp52LBDFolrmus
 Et6W94HhNuxYs1K/iKNMHFTu3Ty/GZW0K2o1Sch4=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000161690
Received: by myt4-457577cc370d.qloud-c.yandex.net with HTTP;
 Tue, 08 Sep 2020 18:52:54 +0300
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Markus Armbruster <armbru@redhat.com>
References: <20200901182326.59633-1-lekiravi@yandex-team.ru>
 <20200901182326.59633-2-lekiravi@yandex-team.ru>
 <87v9go7352.fsf@dusky.pond.sub.org>
Subject: Re: [PATCH v3 1/4] qapi: net: Add query-netdevs command
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 08 Sep 2020 18:52:54 +0300
Message-Id: <22141599580159@mail.yandex-team.ru>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=lekiravi@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 11:52:57
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>, Luigi Rizzo <rizzo@iet.unipi.it>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

08.09.2020, 17:29, "Markus Armbruster" <armbru@redhat.com>:
> Alexey Kirillov <lekiravi@yandex-team.ru> writes:
>
>>  Add a qmp command that provides information about currently attached
>>  backend network devices and their configuration.
>>
>>  Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>
>
> One more: name it query-netdev for consistency with query-chardev and
> query-memdev.

Yes, it make sense. Thank you, I'll rename it.

-- 
Alexey Kirillov
Yandex.Cloud

