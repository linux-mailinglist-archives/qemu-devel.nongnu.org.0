Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA483C72A5
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:50:37 +0200 (CEST)
Received: from localhost ([::1]:37826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Jk4-00062P-3u
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m3Jio-0004Xq-RT
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:49:19 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:37498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m3Jim-0002If-IZ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:49:18 -0400
Received: by mail-qk1-x731.google.com with SMTP id s193so1062800qke.4
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 07:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=MxzlLlQQGuWtBszQx3e6iN8Qmq7su5T0ghycF4kVBG8=;
 b=d8N4+F84ZSXZsgm0RSMBKm39+7bVd0MIIpAUkV8QldXBCAwSJ+s7PmMpaPODrHmxJc
 7aorddrpXfhARa+y+w77jlrOk+d4gVsd+JY4vV5lyB9ba2zl6U8kss2K5jmTNIFmnPbQ
 iE4EVQivgA90sgfvEtu8ozz4lQsJ69adOQvPYOryY0mzvkeSMVLK6jg9+RrN3txkJlmQ
 WyQU0bbdfitg6tHbxixxy82kv3/07YzSTpDb5V7YYMgxaDixJM+DlHaIbQOrxv5drQUd
 BdXUscIAl8yO//YnlbvX+S4Tqop+Im9yfomenl9F7ZhaWxy9PJnykm737lOMsm++BXsS
 CPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=MxzlLlQQGuWtBszQx3e6iN8Qmq7su5T0ghycF4kVBG8=;
 b=mbn8vhtclVnH3xnOm4zlq10MJPavt3CB2kDVZB5X442MS8mXj1J2WASV5h8X0n29fX
 Ggq21tzqRaLluFUNA70HRSkExB7Lr5yfeEvmDKHRpoUqjN/KNsAybW81Ssclnyw4bW7g
 ipULcUsnJ+FWIPBv2H4zZg/q3kCaqBtgxp+rjuN/eJCzwOhtWaL9onVjiXLzTGmZyDf9
 iZn96aC94oylxagdgOPZUsz2PX9EIjpLyOtQqhUXMdtCfGvja/uLyGSgkpCBPbE90hnK
 CxnabDEvMLKnQtAFNriXSCSi5ZzdRlG6jFScD7mD2wHiR+OHOvGAYEJBBcdyWUAJOjJB
 iL0g==
X-Gm-Message-State: AOAM533L2TFgvkmcgi8OsTOYaFSjvqqApyDdSlpJwIaS+JCg1Rq4cKln
 Q7wKyf08unSnu2iGYS/te7c=
X-Google-Smtp-Source: ABdhPJyhnVtHFBYsnSCsHQ5oLBqFhTHcUoPi6O1LjSKb30J70BP7Zli5wSDAJPNkOmZOKdzRJNsVDQ==
X-Received: by 2002:a05:620a:2e2:: with SMTP id
 a2mr4503349qko.59.1626187754253; 
 Tue, 13 Jul 2021 07:49:14 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id e15sm6628298qty.13.2021.07.13.07.49.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Jul 2021 07:49:13 -0700 (PDT)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: usb-host device not working
Message-Id: <7E422E91-63A4-4D36-B5FF-7FD2181FB845@gmail.com>
Date: Tue, 13 Jul 2021 10:49:12 -0400
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x731.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU devel list <qemu-devel@nongnu.org>, Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I have been having problems with using host USB devices lately. I use to =
be able to use host USB devices but can't currently. After doing some =
git bisecting I found it was this patch that causes this issue:

commit 627302afb2f85cdd4b59595361876487aef19b7a (refs/bisect/bad)
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Thu Jun 24 12:38:35 2021 +0200

    usb: build usb-host as module
   =20
    Drop one more shared library dependency (libusb) from core qemu.
   =20
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
    Message-Id: <20210624103836.2382472-34-kraxel@redhat.com>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

I build QEMU like this:

./configure --target-list=3Di386-softmmu --enable-libusb && make -j 9

This command use to work but fails now with the above commit:

qemu-system-i386 -usb -device usb-host,vendorid=3D0x093a,productid=3D0x251=
0

I think this is a bug with the commit. Any suggestions?

Thank you.=

