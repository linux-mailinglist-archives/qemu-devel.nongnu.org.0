Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3008F69D232
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 18:44:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUACb-0003y7-C6; Mon, 20 Feb 2023 12:43:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pUACa-0003xx-19
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:43:48 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pUACW-0001iY-Co
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:43:47 -0500
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 832815F451;
 Mon, 20 Feb 2023 20:43:35 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b590::1:36] (unknown
 [2a02:6b8:b081:b590::1:36])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 YhtOiF0SYCg1-C40kiAWn; Mon, 20 Feb 2023 20:43:34 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676915014; bh=OJ1c2NLeLBfgHpJza2G5mJH6NjfjKMA/2Gk+ewntX4g=;
 h=Subject:From:Cc:To:Date:Message-ID;
 b=xlP9tql7EMX3A51Yq4Eaae8ZSMVMCc0GRgS3ScDajHiXgRaZ7MhBddrmfVeQE1H+y
 bnOYImB/nr0AYCDlSKlLcGVF+fd037CE10c8bSmhUFW3K0c4pnt3lc9naGY/LwuIIl
 eHAwMbiyD2cU7+6ySJunuV8sYJ0UnVpUhj++pdmo=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <7709a093-a366-0c74-c875-bcbb08841210@yandex-team.ru>
Date: Mon, 20 Feb 2023 20:43:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jeff Cody <codyprime@gmail.com>, "Denis V. Lunev" <den@openvz.org>,
 ptikhomirov@virtuozzo.com, Denis Plotnikov <den-plotnikov@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: git check-rebase - compare branches
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Hi all!

I'd like to share my script for comparing branches, which is a bit like git range-diff and a bit like codyprime/git-scripts/git-backport-diff, and still provide a lot more options.

  - provide a table of summary, with changed/removed commits between two (or more) branches (like git backport-diff)
  - interactive comparison of pair-by-pair, where you compare the patches ignoring some hashes to make the difftool happier (like git range-diff. I'd say range-difftool, but it doesn't exist unfortunately)
  - parse meta information from commits and allow a separate file with meta information

I use it for

  - track changes between versions of my feature branches I send to the mailing list
  - check backporting
  - handle rebasing of big "downstream tail" to a new usptream release
  - [recent] check the "downstream tail" for status of "upstreaming" of downstream features

Actually, I use and develop the script for years, but never had time (and patience) to put it in some order and publish. Three months ago I finally published it at gitlab, but still didn't write a letter, postponing until some good pictures for documentation are prepared. Now I'm afraid it may never happen :)

Anyway, hope it may be useful (and any comments are welcome)

https://git-check-rebase.readthedocs.io
https://gitlab.com/vsementsov/git-check-rebase

-- 
Best regards,
Vladimir

