Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76774376733
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 16:47:56 +0200 (CEST)
Received: from localhost ([::1]:39580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf1lj-0001DS-HC
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 10:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1hR-0007O3-2Y
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:43:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1hK-0000Ta-2Y
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620398600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EXbOk1AK+h+Zej7kIJqAzPYV2sQD1wcRx6tvZvpWRRs=;
 b=Wml8NScHi6M0NZYm5/57+8ERbj2V9nJ+0gGZG2idoFgcvEhOl8rRg/LBeyiM5wMKZjR6Z2
 HBYEKcI1LU32PgdUDbuQZyGvQflz4zKjcw/AUWtiFFF29E0YEErijhjHMqXfS2RcLfoWqf
 K0F1ntQgwPTWZ5yKxVYKv1J/622uPAQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522--39cTXwHM3SxH1q-Tv2I4A-1; Fri, 07 May 2021 10:43:19 -0400
X-MC-Unique: -39cTXwHM3SxH1q-Tv2I4A-1
Received: by mail-wr1-f70.google.com with SMTP id
 d20-20020adfc3d40000b029010e1a640bbfso3692063wrg.21
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 07:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2JiudAHyKwdcVvgn2Srg79I18dvicfH0KT9PAVjPO2k=;
 b=OOJqWWv+3AZ+3f72uPZcYSblkGhn0spZgu6fbH4G4AkrBPFSGmyuxwufOg5o8D+GXc
 NsJYrLUcRlhkz1vQdqg3UrpdQa9TH8/gJq3UK4Oz6ZwIzUiBX/NHNVG+AvJAWy8eiwK/
 iapZItHjRchLA5nqK5CU3TiOr5B0+w4NooE6sKHwZ5MMIwDM6ngxectH0szDflA838tt
 ldhTLf+V6vpExiUS+GHvWRaq6ZYRqqXK0tPROVfgXe+ExROWqMHV9nno74R90+Re8LXv
 zwZS8FCf84M5UdrLsdnFwwlhRy7ZM7MJLwqg7Zo+vAvnIo8pMc+FiL8CwnWEa3+MntyW
 DJvQ==
X-Gm-Message-State: AOAM533h7IzzL20WF4yUMIIEHL3BVizbK0JY11HPEohT0lxDA2YUZU3f
 dxc8S9rwzQnXs/CQVUu/fFPJgtKtf2eRh17GOMKUuYXl8ZKqwOq6Ofq9CRUYi47Amhfl+Kpvgh6
 oQz8rDW394efnMn16g6vBOXmkplSTc8uCuDxjq3z3gmoq89+ySRQRqTjpBVqNZVWr
X-Received: by 2002:adf:df03:: with SMTP id y3mr13225000wrl.409.1620398597984; 
 Fri, 07 May 2021 07:43:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUJ/fERO9oYyUDN9N5BvOuiSO8W3BGq+GCx6o1LcpK7zCSpWInf/7UARHlBAYXQ5w8Sbtpcg==
X-Received: by 2002:adf:df03:: with SMTP id y3mr13224963wrl.409.1620398597683; 
 Fri, 07 May 2021 07:43:17 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id m7sm8980967wrv.35.2021.05.07.07.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 07:43:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/17] misc: Replace alloca() by g_malloc()
Date: Fri,  7 May 2021 16:42:58 +0200
Message-Id: <20210507144315.1994337-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ALLOCA(3) man-page mentions its "use is discouraged".=0D
Replace few calls by equivalent GLib malloc().=0D
=0D
Since v2:=0D
- linux-user calls converted=0D
- bsd-user returns ENOMEM (Peter)=0D
- built on PPC+KVM host (David)=0D
- removed tpm mutex cleanup (Christophe)=0D
- included Alex gdbstub patch=0D
- added R-b tags=0D
=0D
Since v1:=0D
- Converted more uses (alsaaudio, tpm, pca9552)=0D
- Reworked gdbstub (Alex)=0D
- Simplified PPC/KVM (Greg)=0D
=0D
Alex Benn=C3=A9e (1):=0D
  gdbstub: Replace GdbCmdContext with plain g_array()=0D
=0D
Philippe Mathieu-Daud=C3=A9 (16):=0D
  bsd-user/syscall: Replace alloca() by g_try_new()=0D
  linux-user/elfload: Replace alloca() by g_try_malloc()=0D
  linux-user/syscall: Replace alloca() by g_try_new()=0D
  linux-user/syscall: Replace alloca() by g_try_malloc()=0D
  linux-user: Replace alloca() by g_try_new() in ppoll() syscall=0D
  linux-user: Replace alloca() by g_try_malloc() in setsockopt() syscall=0D
  linux-user: Replace alloca() by g_try_malloc() in various socket=0D
    syscall=0D
  linux-user/syscall: Move code around in do_sendrecvmsg_locked()=0D
  linux-user/syscall: Replace alloca() by GLib alloc() in sendrecvmsg=0D
  audio/alsaaudio: Replace ALSA alloca() by malloc() equivalent=0D
  backends/tpm: Replace g_alloca() by g_malloc()=0D
  gdbstub: Constify GdbCmdParseEntry=0D
  hw/misc/pca9552: Replace g_newa() by g_new()=0D
  target/ppc/kvm: Replace alloca() by g_malloc()=0D
  configure: Prohibit alloca() by using -Walloca CPPFLAG=0D
  configure: libSLiRP buildsys kludge=0D
=0D
 configure                   |   8 +=0D
 audio/alsaaudio.c           |  11 +-=0D
 backends/tpm/tpm_emulator.c |   3 +-=0D
 bsd-user/syscall.c          |   7 +-=0D
 gdbstub.c                   | 322 +++++++++++++++++-------------------=0D
 hw/misc/pca9552.c           |   2 +-=0D
 linux-user/elfload.c        |  14 +-=0D
 linux-user/syscall.c        | 137 ++++++++++-----=0D
 target/ppc/kvm.c            |   4 +-=0D
 9 files changed, 277 insertions(+), 231 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


