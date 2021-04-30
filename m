Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A8136FBD6
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:01:19 +0200 (CEST)
Received: from localhost ([::1]:36016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcThm-0008SX-Li
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lcTVX-0004GG-LV
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:48:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lcTVU-0007MN-Q5
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:48:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619790514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8hOG8D09CwUpcofV+TIAzKK2UsZykJQ4oQTtIIS0CQM=;
 b=g55eFYiYrYQSEwq617mxp3RZ3B+zSg/aexHnlcGkc96ReV676REvDsKJ4NW78m3dHd8a0N
 iwXCdiIHfzNiRn6fPpanrlhQkeYL3b4lQ/Svjm0yEzer6G9QWGtWSGmv7UWUEZfHGgVihj
 Z+EFo9wgt9J2UKePsGuTh/cK9cCMiKo=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-rtwxskzoOYexJKC60jFjBQ-1; Fri, 30 Apr 2021 09:48:33 -0400
X-MC-Unique: rtwxskzoOYexJKC60jFjBQ-1
Received: by mail-oi1-f200.google.com with SMTP id
 r20-20020a0568080ab4b0290186e76a5ddaso18506200oij.21
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 06:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8hOG8D09CwUpcofV+TIAzKK2UsZykJQ4oQTtIIS0CQM=;
 b=dbiGfLJljnvLkCsULsiVTd09jGHA8uRVaLs72Z/AupwVRLx3mmnf0UpbkiZP/IGQFG
 VW44m9m3VdLFnyqkgObjdBYvcSvc5azq9khE9wDe0DFoub+FG3HfX31P82GQN+nuRmDw
 jj6AmB+7ooQ7drvQ8PJWmpABfTPf/FBZ2hnkc1AZT0ltAeLkrrO6ih2b4G7JuaxfzYWp
 /S5OVnW4ySs9kT4ek7dEOrGPnefKa5pfQqt8+uaTIUfcBpFyLyNOfQkXYGfqT6fatrnT
 CfoV4b0/QledHhl+92fMpl1St3PFgiLR9I06XigB4Hqo4j0MjjZH46LiwEwJszO8R3d1
 xx0A==
X-Gm-Message-State: AOAM533+/ENS2BehyYTfy7h7Ml+ikIv+d7O0/zbBmN4cW1JLimE3/+GU
 6wfJa0BNrWvohICektu/8HgVxK7sOIvykvy2us7uqOkU9i4g0pWg0xJzfsvmbTesGfEXf6dJI+t
 eV0EETVVppckUwnd/S7zN4dBbs2f+jMdjifOD8A66FgcpJJu7+xCt9ZL8BSSuEp0R
X-Received: by 2002:a54:480b:: with SMTP id j11mr10719691oij.102.1619790512352; 
 Fri, 30 Apr 2021 06:48:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+KaB1hfo5+SjilVFeZyH1aiYKjveJJ2lyLWJmzGHpj8SSijTCVxSdiskRR1NUnKjQtWBdsw==
X-Received: by 2002:a54:480b:: with SMTP id j11mr10719677oij.102.1619790512221; 
 Fri, 30 Apr 2021 06:48:32 -0700 (PDT)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id p127sm799072oig.16.2021.04.30.06.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 06:48:31 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] [RESEND] SEV firmware error list touchups
Date: Fri, 30 Apr 2021 08:48:28 -0500
Message-Id: <20210430134830.254741-1-ckuehl@redhat.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
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
Cc: thomas.lendacky@amd.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 richard.henderson@linaro.org, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Connor Kuehl (2):
  sev: use explicit indices for mapping firmware error codes to strings
  sev: add missing firmware error conditions

 target/i386/sev.c | 48 ++++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

-- 
2.30.2


