Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36DB3C7881
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 23:06:13 +0200 (CEST)
Received: from localhost ([::1]:45376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3PbY-0003Sj-Rq
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 17:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m3PZy-0002dv-3C; Tue, 13 Jul 2021 17:04:34 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:36570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m3PZv-00059w-4b; Tue, 13 Jul 2021 17:04:33 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id gh6so5509257qvb.3;
 Tue, 13 Jul 2021 14:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=VuFfjb4r267mT0P22Di3qyI79uul9V4chwKiHPxmysU=;
 b=UR4wEykGPylPBymLpqYMVe4JxA/BeoKG2IZn84uAQc3xm6e0pewUVYtXKEpIfZ6FE8
 R7BSpFZJUSWCcRNzs+EUDyMQ5UQzMzkivOVhEA6ZQHrauHvIAP+kC1h5pKopVkUMGxRv
 pLf8D6p5SvY8HpbVD/hEfby7YgZkbFAknlO/kTbwmPvWUi8IdLIAOiG0J6S0V+ujbjK1
 vje7JsJvT/EeOj6Oc0nKVy1F2xrX+X+PICrnTy/QM2D8uTO3qAcrFbnj8ANx6cJY+u1U
 XG+Me8ML0+ArU9jU0gFmSlWoA2THhFU4FAx+BgOim+MQGLYqrQoKM7/iDL9hhVbQJOC2
 NhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=VuFfjb4r267mT0P22Di3qyI79uul9V4chwKiHPxmysU=;
 b=LH981pagdgjUSrYfDHqFnyXuZl96ZXI1+Glz/v3jMAI/YA9t2/YZ7upeitmz28S4U6
 f0d3A8Z3Wz8yyVSqm3AZdyKJbISJ6p2u2DNfbnHsaqiBfQ/GkksL3mnW3eaz1SjMMmtx
 ohU/XlJYY9YLnpG5+g44n49VDEE3b6/hzKfRZnlTLFDDo4QLwpHdAyNEb6WVoFbJVcGc
 A7gVF33G4hQw4GYQ1N5hW4NehobQZjs6FMEW0YodCsA+igEFwRN8qg29sukSDSAoyhDm
 02ERI2NjVxYTitFE7WhIpQIOnx+AdnHkmDKT9pWVNmsAQ83mebOyFktWGqShEaXOLT4B
 nDtg==
X-Gm-Message-State: AOAM533EIFRZayMIrErn0Y6VkCVrtGjSdfnoQ5RITGja/UOlTb90WaGW
 eYZzbcDQuDlwFKVs0rxlqfk=
X-Google-Smtp-Source: ABdhPJztqPzAM5PVTYDe9wk5PQC3BQAMrU6+imeCuW3oHKqq5xWtl58j5MGe9LTRv0/ieqUG5NLQZw==
X-Received: by 2002:ad4:4e6a:: with SMTP id ec10mr6906492qvb.58.1626210268691; 
 Tue, 13 Jul 2021 14:04:28 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id r4sm3222030qtc.66.2021.07.13.14.04.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Jul 2021 14:04:28 -0700 (PDT)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Host folder sharing via USB issue
Message-Id: <F120718F-C548-47C7-BAF7-ABFEC1F9E8CD@gmail.com>
Date: Tue, 13 Jul 2021 17:04:26 -0400
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Kevin Wolf <kwolf@redhat.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=programmingkidx@gmail.com; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU devel list <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi I have noticed that host folder sharing via USB has recently stopped =
working. After doing some git bisecting I found this as the patch that =
seems to be the issue:

25f78d9e2de528473d52acfcf7acdfb64e3453d4 is the first bad commit
commit 25f78d9e2de528473d52acfcf7acdfb64e3453d4
Author: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Date:   Thu Jun 10 15:05:34 2021 +0300

    block: move supports_backing check to =
bdrv_set_file_or_backing_noperm()
   =20
    Move supports_backing check of bdrv_reopen_parse_backing to called
    (through bdrv_set_backing_noperm()) =
bdrv_set_file_or_backing_noperm()
    function. The check applies to general case, so it's appropriate for
    bdrv_set_file_or_backing_noperm().
   =20
    We have to declare backing support for two test drivers, otherwise =
new
    check fails.
   =20
    Signed-off-by: Vladimir Sementsov-Ogievskiy =
<vsementsov@virtuozzo.com>
    Message-Id: <20210610120537.196183-7-vsementsov@virtuozzo.com>
    Signed-off-by: Kevin Wolf <kwolf@redhat.com>

 block.c                          | 29 +++++++++++++++--------------
 tests/unit/test-bdrv-drain.c     |  1 +
 tests/unit/test-bdrv-graph-mod.c |  1 +
 3 files changed, 17 insertions(+), 14 deletions(-)

To reproduce this issue run this command:
qemu-system-i386 -usb -device usb-storage,drive=3Dfat16 -drive =
file=3Dfat:rw:fat-type=3D16:"<path to host =
folder>",id=3Dfat16,format=3Draw,if=3Dnone

Results:
Unexpected error in bdrv_set_file_or_backing_noperm() at =
../block.c:3159:
qemu-system-i386: -drive file=3Dfat:rw:fat-type=3D16:<host folder =
path>,id=3Dfat16,format=3Draw,if=3Dnone: Driver 'vvfat' of node =
'#block057' does not support backing files
Abort trap: 6

Expected results:
QEMU start running normally.

Please let me know if you need more information.

Thank you.=

