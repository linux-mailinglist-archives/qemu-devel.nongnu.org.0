Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 840133C2A60
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 22:31:49 +0200 (CEST)
Received: from localhost ([::1]:47868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1xA4-0000Tv-8k
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 16:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1x6y-00066x-Dn; Fri, 09 Jul 2021 16:28:36 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:43969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1x6w-0007UH-I4; Fri, 09 Jul 2021 16:28:36 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MLi4c-1lkQE00oIS-00HdTf; Fri, 09
 Jul 2021 22:28:28 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/9] qemu-option: Drop dead assertion
Date: Fri,  9 Jul 2021 22:28:16 +0200
Message-Id: <20210709202824.578187-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709202824.578187-1-laurent@vivier.eu>
References: <20210709202824.578187-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:C85UoByGekINlbVDkwSfQpHnZimm1VjD1LIr83d6DbrBOeF4xjG
 WyFE4fASbiFJoV3e8ZzKwG49xZQiV6RPsJE0VSiJM7rxVegiQt7arG7uGTn8t5X+Q/ZC1jl
 7sanuohN/pnquftTsMB3O9rqpttjysm2/YlKLxDyoWW/q178g375+wW0+3I5jyE+dv5FlhH
 RUZ1MaqN29Q5zM0d0qGSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wa+IYLq7/vE=:4PYa1i1jXL9JzyckMVveNo
 jCrati/28tczNPfVrA9uL3yQ0DrBhDlyAKjEtDDWgTzL4DrARuPGuvvcjxgMXUKZuqPXXbyT6
 YEzB1ztGNmf5mQG00rCLDlpzzfgrKyxQvAm7/aZneDTGNh9TT2RboaLxshs8OTCWwRJLH3+5A
 R9y06WLJNA5djVhzgOvZ6XJPQxqvulu8Ch5oUS1NGPvS8M5cvinN4KePgoF2Rd8OSWGgzdNN8
 VWGM04gNbN+ppeSoGwpUl+RQbA/dyF4yHtbfhSlmbGecjA6HQ8yzt8G1XVPdihBQ6fe5b4rey
 qcqC9JCSYIt2aQgok3j0zPN+xwn3FBprlUE3ZW9ZIPP0+Rd3UPqG//Zayqyc9oOAPFBxqha1f
 Ojml44VGZ93bN3B9bkWAlLkOImyNlljrobEnBjQOEe8ShAT60yM4r1esYn7omzBY88T9ZKXvg
 i+ogKMatLbI6SaH/mimjAY3zpqGgaO8dYwTE1sDuBLzJwVUnq8u3NlafdzET/5FIUDhbdmcW3
 X8RfRpkz9ZQE+0SvX/UD9sHDCLGAYryN1X9kRl/qJ6b7mcQXbF1g+pWdPk5xUhW9cOA2yjLZH
 ujoLRxdq32YNOqzxvJjCQ/ai2DAwcoqhghnt5JSGfmQgodPRPiqOQfOliQvudOva+G0mQ3Fz5
 WGR+opjEy4pfhT/8b2fJvRO7hf9SCqkGZZX1+8u5oAYCDnoNElYikoiQ5HmzGAZLVeow2TQ2Z
 wPq60EZUGfWXfWZokvgPvJEKqmBZhVXidb1r7P0c/pgSVNNsp06uQVjku56R9K9YHH5hGTxiw
 FDvo4eDb+4asx5v1Hqb1ikpVKHa93RumLgJ6rTBa6rzU6Nq/I3Y0EojTFtjjfcYVE1Z4tng
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

Commit c6ecec43b2 "qemu-option: Check return value instead of @err
where convenient" simplified

    opts = qemu_opts_create(list, qdict_get_try_str(qdict, "id"), 1,
                            &local_err);
    if (local_err) {
        error_propagate(errp, local_err);
        return NULL;
    }

to

    opts = qemu_opts_create(list, qdict_get_try_str(qdict, "id"), 1, errp);
    if (!opts) {
        return NULL;
    }

but neglected to delete

    assert(opts != NULL);

Do that now.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210610085026.436081-1-armbru@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 util/qemu-option.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index ee78e42216cc..61cb4a97bdb6 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -997,8 +997,6 @@ QemuOpts *qemu_opts_from_qdict(QemuOptsList *list, const QDict *qdict,
         return NULL;
     }
 
-    assert(opts != NULL);
-
     for (entry = qdict_first(qdict);
          entry;
          entry = qdict_next(qdict, entry)) {
-- 
2.31.1


