Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C293754F2
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 15:40:07 +0200 (CEST)
Received: from localhost ([::1]:51710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leeEY-0008S8-Tu
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 09:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leeCe-0006jI-4j
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:38:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leeCb-0007bD-2e
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620308284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=b4Q72tFbNM9A6AWHThcqfXNXd+FnyR9FkzuxJZtvue4=;
 b=KozG3steEyfc1dGZx81Ih5MJlKMetRAotuM8LRCARNn6yyZUFvPluAT4ypIdoQ+hJ8yrS0
 IiO0J9HlJFaChGz2U3Y/pyJSeQp6FiQ2W5I9FV+ljW7vyrugJu0YUuzZx3xSbzJiajvn8b
 CHHnafrAzID5rNjNKiYSn356oPEuWrE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-jLXGWGVROk6IsDMLt2w9Uw-1; Thu, 06 May 2021 09:38:01 -0400
X-MC-Unique: jLXGWGVROk6IsDMLt2w9Uw-1
Received: by mail-wm1-f70.google.com with SMTP id
 g67-20020a1cb6460000b029014297bda128so1018589wmf.1
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 06:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vbCDEC95SLEC7NvBUhks/P3w4WBw9RAigT+kNtWZnU0=;
 b=WTGb+Mh2okluHiEvIlkKCfj7jaj60idt29N7KQ8fR/mJnQj2qJLIEdeW5cCFYr+ojZ
 HuIuE+5X2mj+TGoO4EZGnBkPtJ+EerJvWqHB/0cDqizG9TkSDKMxv8WiuBDYyExTKPCy
 enmraDtojwZwS/wwGho3BPAjfUbZZoJBS1mazo6v8s62WAlCdm/C7qT21jQLI7ECSNR8
 WQZ32CTSLtiv2GpyCbuGpRakVltRvcjpoVMSkLpnWufmFtYdafAY7FZ3ydc17Ja7/FW6
 Hrz6BOzenrBQ731ab+vkixZMtkPSWknLjEM+gIs5tYhhB72sSkloLGOKN71j54Ykxgns
 TsqA==
X-Gm-Message-State: AOAM531ueDQAKDH5T0qyTeLpPWNC4Zc/9PaDBPndvoLUra+ns9bmlsMM
 4Bti9+widMagRvwEiUNIF4IM+n4lZxETsLUkWLeX2cIuCibrEYdBibFYrDwsMOA6XuiokM9SLuH
 z6wuRQ9xrFNjmn7lYnL1P1guhdHxfqYrvzlFgxBQ46qhQ+1gb2WwnUzK/4CiYnXTs
X-Received: by 2002:a5d:4412:: with SMTP id z18mr5160063wrq.103.1620308280323; 
 Thu, 06 May 2021 06:38:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/lpKgeXPwedLJvJ4wj/Fl9lQspP9LDG16WhazAs5p4oUW5BEc7XMk6TLu2WdAwkGSukQsXA==
X-Received: by 2002:a5d:4412:: with SMTP id z18mr5160036wrq.103.1620308280136; 
 Thu, 06 May 2021 06:38:00 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id e8sm4414680wrt.30.2021.05.06.06.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 06:37:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/9] misc: Replace alloca() by g_malloc()
Date: Thu,  6 May 2021 15:37:49 +0200
Message-Id: <20210506133758.1749233-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ALLOCA(3) man-page mentions its "use is discouraged".=0D
Replace few calls by equivalent GLib malloc().=0D
=0D
Last call site is linux-user/.=0D
=0D
Since v1:=0D
- Converted more uses (alsaaudio, tpm, pca9552)=0D
- Reworked gdbstub (Alex)=0D
- Simplified PPC/KVM (Greg)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (9):=0D
  audio/alsaaudio: Replace ALSA alloca() by malloc() equivalent=0D
  backends/tpm: Replace qemu_mutex_lock calls with QEMU_LOCK_GUARD=0D
  backends/tpm: Replace g_alloca() by g_malloc()=0D
  bsd-user/syscall: Replace alloca() by g_new()=0D
  gdbstub: Constify GdbCmdParseEntry=0D
  gdbstub: Only call cmd_parse_params() with non-NULL command schema=0D
  gdbstub: Replace alloca() + memset(0) by g_new0()=0D
  hw/misc/pca9552: Replace g_newa() by g_new()=0D
  target/ppc/kvm: Replace alloca() by g_malloc()=0D
=0D
 audio/alsaaudio.c           | 11 +++++++----=0D
 backends/tpm/tpm_emulator.c | 35 +++++++++++++++--------------------=0D
 bsd-user/syscall.c          |  3 +--=0D
 gdbstub.c                   | 34 +++++++++++++++-------------------=0D
 hw/misc/pca9552.c           |  2 +-=0D
 target/ppc/kvm.c            |  3 +--=0D
 6 files changed, 40 insertions(+), 48 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


