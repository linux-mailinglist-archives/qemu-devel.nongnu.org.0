Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1810E453580
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 16:17:55 +0100 (CET)
Received: from localhost ([::1]:57938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn0Da-0005k4-0m
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 10:17:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn09E-0001S5-JB
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:13:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn09C-0001ra-QV
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:13:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637075602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Nsq6/n4lX4xNs0bVyjw+TlQFC7QjuL5614QM9zuC1s0=;
 b=Z8gF7bKjY8R4SdC+gJsV8DryVWhDAiNIqXI+HzoH6tN+nR2fVIdhZJrfxLm0ULpPLdp0M+
 Nb4sKY8GvHcmEJvmV1glR53fNyLLAhN1+2IQI0fS+2ZQFuFFYF+dNdvB05xd2VevJbkx2+
 UrI1rpmqXmT8e57FTmF+OL5Mud7IzQE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-3tp7nsltN6i8LOc9nNaiag-1; Tue, 16 Nov 2021 10:13:21 -0500
X-MC-Unique: 3tp7nsltN6i8LOc9nNaiag-1
Received: by mail-wr1-f70.google.com with SMTP id
 h7-20020adfaa87000000b001885269a937so4596292wrc.17
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 07:13:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+0DQjMgj89MBJT/x5ZC/TK5ytYR4msC99knx5KQf85I=;
 b=Ufl+CW7V32azWWhc73Ln8vdw67yyNq+RN8ZtmWSn/bMP7JozPGZFVd03KyXrrXENBh
 xc9oEY4dc2Qd8GHLHLG0bUlMmHMQtBtfalUEzZjZK8rKhezffZjqg0FJmNLwfza5HZpT
 IIOP7+VBQV+JQsqONDdLWBgPVwPcUF9chynaW440HnwxhlWH92RIATl7uuRuMtOs4w+A
 AZQoMwGn2IOA9u+ACP7qRuk4eTSzW7Nsvrdi2HxKXIZzkqWmf7WsuHuPXoiP1rkRXGTQ
 /V8MNfwazw16BrdcEMj0kyoOTYBjXOeBnhfwLwiCGO8vGklgEjII7YY3oE3nv5TApqTc
 +u6A==
X-Gm-Message-State: AOAM533tvJjmXvXM+6PHsKZiojeXCztfZ2Iv8/KbIpRJw49uMvG9th3I
 COxZVAMxoVD2lpp3hJtj/zkc0yeuBkYXnPRLdeGfPP/OsDGRhPkJ9XoiN+aVW7QtnhRsm54DlSs
 8OsXdKSH9urSKG8Ir5sQjMHbmycx/iBcKPOQOh+3lNEPARTygm0xaaTKYj90JrfqZ
X-Received: by 2002:adf:fa0b:: with SMTP id m11mr10159080wrr.152.1637075599589; 
 Tue, 16 Nov 2021 07:13:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyl+5uEx95GvojYL4dMVjhSggvYSUfZDC+LEr6k1Eli1jzWVi3/J5Y0n5S9uhkLLHkp/vxnCA==
X-Received: by 2002:adf:fa0b:: with SMTP id m11mr10159034wrr.152.1637075599334; 
 Tue, 16 Nov 2021 07:13:19 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 f81sm2977993wmf.22.2021.11.16.07.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 07:13:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2? 0/3] docs/devel/style: Improve rST rendering
Date: Tue, 16 Nov 2021 16:13:14 +0100
Message-Id: <20211116151317.2691125-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Various changes in docs/devel/style.rst to improve its=0D
rST rendering (around C types/qualifiers/functions).=0D
I split it in 3 patches to ease reviewing, but feel free=0D
to squash if it makes life easier.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  docs/devel/style: Improve GLib functions rST rendering=0D
  docs/devel/style: Improve Error** functions rST rendering=0D
  docs/devel/style: Improve types/qualifiers rST rendering=0D
=0D
 docs/devel/style.rst | 172 ++++++++++++++++++++++---------------------=0D
 1 file changed, 87 insertions(+), 85 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


