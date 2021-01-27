Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BFF3065E3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 22:23:23 +0100 (CET)
Received: from localhost ([::1]:53266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4sHa-0008OU-EZ
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 16:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4sG1-0006wG-Er
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 16:21:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4sFz-0000Tq-VC
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 16:21:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611782503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qt0FgX5banwF/xFPDEvHAu2lJXwyMeS6+wVxxve/Jlw=;
 b=cXmmlcp9cay650FBP5aVdUtEvhUcHIDYru1fHvSTbRvoCGpimSXxTplGrpZ7MNU5+NmCM8
 PQdeCJSNqVfQvHPgFyIh/5IqgurcP1JlthWoscU7+f8i5shpVnsV0LJ3aLdHdn/HXDt96M
 oNpOhfBShJm9IPfiPkX/NsJhVJ9PIzM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-or2NIeo4Pjy1582ntqLhYQ-1; Wed, 27 Jan 2021 16:21:41 -0500
X-MC-Unique: or2NIeo4Pjy1582ntqLhYQ-1
Received: by mail-wr1-f70.google.com with SMTP id n14so1894585wru.6
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 13:21:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4GqJAyB5qWrc5vR/dLXQBLJbRGEn3b07GkhEUlSVGBg=;
 b=r6l5L4oPQU8O+L8Q3RfX57faCEgN1TqSrQ91xU0y8c8nhOiUZ/xFQALXgtkH7/2FSl
 ZQbHwsunt3DRq/PobYxWBczqI8f7p/d4HAFb3+rUnIigHUCodxKZwS+t5QvfZpUFUnef
 UBhh0BXrcKPgKpY5YOxiqVBWkUi0IC8y9tTgBP1i6r3eid/W8zovA5eGRtqUN2B2f5Nf
 O8KaLNxUUUgqCI5Naj5kDP9tbYcJ3QypQr3FzPt7XlmOml96iuWp+RUKBd4djoeOQD/z
 fkOWVxsEoelMuPGkEIjvNwLQUR46ZfVveLe0yO4R5e3oUx+eML79xHOUD4fo40rMtTqn
 yEWg==
X-Gm-Message-State: AOAM532s1s14uxmie1SXKbpIklleIZu04Z7Ih96lfJcgnUeSIRIUGA/5
 wmw9JwuIiU1mjBPeszMlzdUiJnSw8IzPkl1FiMthtKTK0q439pdCEksRhfhuygQZnBsyyYi68oV
 wGxoqYEa0msv07G7K5s7fBS2EvznSxyvBXTAJSngdqzFAum0rPIK8e9kOlzjtXOWx
X-Received: by 2002:a5d:47ae:: with SMTP id 14mr12840393wrb.378.1611782500312; 
 Wed, 27 Jan 2021 13:21:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0OiTIuk1p/El5rvRqKBWZx4f4zxIADFbA2hIZ38F1mJgbVV1ATcp7VEkoFM1RypKPhFLmww==
X-Received: by 2002:a5d:47ae:: with SMTP id 14mr12840371wrb.378.1611782499999; 
 Wed, 27 Jan 2021 13:21:39 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id c9sm563305wrw.76.2021.01.27.13.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 13:21:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] block/nvme: Minor tracing improvements
Date: Wed, 27 Jan 2021 22:21:35 +0100
Message-Id: <20210127212137.3482291-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix an incorrect trace event (sometimes it is better to=0D
have no information rather than having incorrect info...)=0D
and add another event to display the spec implemented by=0D
the controller.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  block/nvme: Properly display doorbell stride length in trace event=0D
  block/nvme: Trace NVMe spec version supported by the controller=0D
=0D
 block/nvme.c       | 8 +++++++-=0D
 block/trace-events | 1 +=0D
 2 files changed, 8 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


