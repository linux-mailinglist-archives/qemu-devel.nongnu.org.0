Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FC933D228
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 11:49:56 +0100 (CET)
Received: from localhost ([::1]:51090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM7Gt-0002hA-6x
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 06:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM7Ex-0001R9-TA
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:47:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM7Ew-00006r-E4
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:47:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615891673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vleNo4HJJIDgw5ypifi53egsWODc+2IawLhBjAEgE+M=;
 b=V7Z98vwxce2LpdbzjM7IuAoP01TLl6IVpigXMzIHh42mrQkyWqZcMX4U+vwe4sAd4R6Oud
 2ycdw6vURQcAoc5kArwBpqtIgUagUr2qXeBIPmK2bdlHDeYpuEDRkdP84sBgU8ZplfvM1U
 chneQ40D8smhjwu0dHVMoQbwclrXHXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-rSCcwz_kND2RsZEifzKO2Q-1; Tue, 16 Mar 2021 06:47:51 -0400
X-MC-Unique: rSCcwz_kND2RsZEifzKO2Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9D4C760C0
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 10:47:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EBD35D9C0;
 Tue, 16 Mar 2021 10:47:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 609F21800606; Tue, 16 Mar 2021 11:47:45 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Audio 20210316 patches
Date: Tue, 16 Mar 2021 11:47:42 +0100
Message-Id: <20210316104745.2196286-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2615a5e433aeb812c300d3a48e1a88e1303e2339=
:=0D
=0D
  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-req=
ue=3D=0D
st' into staging (2021-03-15 19:23:00 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/audio-20210316-pull-request=0D
=0D
for you to fetch changes up to 3ba6e3f6888d2825709eba2f623f0615069c036c:=0D
=0D
  coreaudio: Handle output device change (2021-03-16 07:17:50 +0100)=0D
=0D
----------------------------------------------------------------=0D
coreaudio fixes and cleanups.=0D
=0D
----------------------------------------------------------------=0D
=0D
Akihiko Odaki (3):=0D
  coreaudio: Drop support for macOS older than 10.6=0D
  coreaudio: Extract device operations=0D
  coreaudio: Handle output device change=0D
=0D
 audio/coreaudio.c | 428 +++++++++++++++++++++++++---------------------=0D
 1 file changed, 235 insertions(+), 193 deletions(-)=0D
=0D
--=3D20=0D
2.30.2=0D
=0D


