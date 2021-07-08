Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 933013C19AE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:15:46 +0200 (CEST)
Received: from localhost ([::1]:40636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZUv-0006Y3-JC
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1ZMY-0000B7-EF
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:07:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1ZMS-0003vc-Eb
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:07:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625771219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O70gTscZqru4OZ+aGDQFfFu54+EIrPGaKPATFw+yvGQ=;
 b=FWZ3Ssht1t3UrlUlfRMs6LbSIxXlcz2EqGAJ4dcPmsqLWUedxnNXfK4T5rPAeGZXP8E/pD
 b2YEGksVyNuwXIT7bibP26i1xXl39eGGs1weqHTcwAlghlU9YSVterZsMePIpaabBs2CRQ
 jIc4BBU6Xm0m8aMcV7vvsbwf1csEpoA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-vdhIfPdwMzq4rS_cc2RC_g-1; Thu, 08 Jul 2021 15:06:58 -0400
X-MC-Unique: vdhIfPdwMzq4rS_cc2RC_g-1
Received: by mail-qt1-f198.google.com with SMTP id
 t6-20020ac80dc60000b029024e988e8277so4138185qti.23
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jb4JdHdFWIqWZI0oJSLncr2o0rXLHt/OfObOIOVyC3I=;
 b=U98s4kUunqASZiFN875KoOHSxTENiHRW61A85PIpoHi3yr4xjJfEG+qII7yOZ/O4Ie
 XWk+m1LCgHKRX7/4iRep3tLHjTCs6Ig1DAhkBxUapQOA3/oVFViDkkZzWDgN7Ah5gbSg
 4rINNKhZa2d7TbqLJ2e3dWFjcgct/kSKn5a5g1WsqBEgOjKoidy2ehexVTBMimi7AAZD
 quQaCDWQgQjrvlmgJKsNAi9vTqzuUirNWA5dhPgY+rpAqGQ+nxHMKB8sFg4m4qHk14e3
 FFKg6b/0dSCBXYBh1npPzulMx3A0Rh8JNBAtjQSl7gGjcCb+Vr9VqCrfdMHvMEunqdQ3
 L2nA==
X-Gm-Message-State: AOAM530ejL3bApwGCBvq9CVJSk8xlS4Um8AzOS4RonPyuy51SiuzN0GA
 KY04eGmXsDCSEzXA/5ie8+pqHwZbizA+QFtVmLH0HdN74tgzVw9y/pICkjJo5211t2zrkZ+Q3G6
 qncBwd+ct3ISvskq9FprLhByt+dI1az26xWIkaJwqwYa9FPx1wULJEMJqIPCnvo1I
X-Received: by 2002:a37:438e:: with SMTP id
 q136mr33126282qka.382.1625771217372; 
 Thu, 08 Jul 2021 12:06:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKY0aRD9ZQBzcl+hw6gF1e0uRsa5msGOBPbM7Kml64u1J4hTj5vUQe9DkABFGGhsqPleBfwQ==
X-Received: by 2002:a37:438e:: with SMTP id
 q136mr33126251qka.382.1625771217088; 
 Thu, 08 Jul 2021 12:06:57 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id v15sm1430976qkp.96.2021.07.08.12.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:06:56 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] migration: Three more fixes for postcopy recovery
Date: Thu,  8 Jul 2021 15:06:50 -0400
Message-Id: <20210708190653.252961-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Lukas Straub <lukasstraub2@web.de>, Juan Quintela <quintela@redhat.com>,
 Li Xiaohui <xiaohli@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A few more issues spotted by either Xiaohui or me.  Please see and review=
=0D
individual patches for what they do.  Thanks,=0D
=0D
Peter Xu (3):=0D
  migration: Release return path early for paused postcopy=0D
  migration: Don't do migrate cleanup if during postcopy resume=0D
  migration: Clear error at entry of migrate_fd_connect()=0D
=0D
 migration/migration.c | 37 ++++++++++++++++++++++++++++++++-----=0D
 1 file changed, 32 insertions(+), 5 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


