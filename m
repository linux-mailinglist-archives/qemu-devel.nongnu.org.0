Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE05370929
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 00:15:48 +0200 (CEST)
Received: from localhost ([::1]:55298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcxtr-0003yM-9a
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 18:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcxs7-0002UT-Rz
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:13:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcxs5-0002VF-Bw
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:13:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619907235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+SAvRxLubG35JAD9MkL7htIRWaAKzGZreS6/VIyvHMs=;
 b=ikAXGheiUxiwN1j4Qeu3yVtrCljeTH3D85Gu8CrhJVIHllUNe/uTT+QojD4A+B5F/2xVjU
 O+E2tLCfcA19rqEc0j4D+gTQt4+eVanlXbRDpLXrOu6+C3NZLOUgtzCP/zFWZGIvcdPmat
 K5hS8H844nELOks/iWvvA/mwZSEskpk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-E6FSZiX4OeyCvpUlJVZQbw-1; Sat, 01 May 2021 18:13:54 -0400
X-MC-Unique: E6FSZiX4OeyCvpUlJVZQbw-1
Received: by mail-wr1-f69.google.com with SMTP id
 4-20020adf91840000b029010d9c088599so1271679wri.10
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 15:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZNRs4/is3nZ+QQcLX2g7XTvSu7S8cnLlmSTlvRqc4tM=;
 b=rrNmHBLffEFjO+PTRd+EwHT6hHRAp+QIHedfpFDRYJ3PycrQ+QYmWNdbzKjqyH+X/K
 F6JSbL8oASh/YABq4zmpswr7lXqz3U7PBzodBOg6NSJotjEJAosUDKJZPc0Tj6XBRAh8
 pjWozr+uBeG6dXcNUjQzOV6dy+VeFM/2uf4PfGs5PXucnKOzA4DQGZ6TS1BXmZJJ88/A
 6LKkbnBk/8fXCM6lxRXD+evzYil3bWzDabepM6blCGKUeFUWH5iDRuHbMGNn11El6nAN
 Dvq1UCCxM/6SdQOrl7l7RHVYgUvpFRQyqaxEyOjU2ihwmy2wATjAxFHjLIGxRsTguvVp
 juqQ==
X-Gm-Message-State: AOAM533qUsl6Xd0cJwOThu1x4ENOkl9Yx5VjXWZJX+R5xoedtgGLRDEv
 XvshTmjlH8+NX7iovXUdnai+cDB/JJ2C/xy3mt2sk+joJjrkCVywFEVRCiE3l2545fcz/a/MyV9
 TXywTVwcJbk7p2RzY2VeSXo8KBUlBVw+4kPLnbvTOAvtohp40rrtUExnRROscpDQN
X-Received: by 2002:a5d:5488:: with SMTP id h8mr15510857wrv.81.1619907232835; 
 Sat, 01 May 2021 15:13:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNoAnk/nF/Ua5zd5OfwPfcf/yoegQiILTlCSNzj9PvTDSl92TMJtTlhhFz27DpO4WskgXf6A==
X-Received: by 2002:a5d:5488:: with SMTP id h8mr15510840wrv.81.1619907232641; 
 Sat, 01 May 2021 15:13:52 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id o62sm22672736wmo.3.2021.05.01.15.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 15:13:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] hw: Convert mc146818rtc & etraxfs_timer to 3-phase
 reset interface
Date: Sun,  2 May 2021 00:13:48 +0200
Message-Id: <20210501221350.501946-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove qemu_register_reset() when a qdev type has a qbus parent,=0D
implementing the 3-phase Resettable interface.=0D
=0D
Since v1:=0D
- Use 3-phase reset interface instead of qdev one (Laurent)=0D
=0D
Supersedes: <20210423233652.3042941-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/timer/etraxfs_timer: Convert to 3-phase reset (Resettable=0D
    interface)=0D
  hw/rtc/mc146818rtc: Convert to 3-phase reset (Resettable interface)=0D
=0D
 hw/rtc/mc146818rtc.c     | 42 +++++++++++++++++++++-------------------=0D
 hw/timer/etraxfs_timer.c | 14 +++++++++++---=0D
 2 files changed, 33 insertions(+), 23 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


