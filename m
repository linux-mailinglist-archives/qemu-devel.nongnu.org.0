Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD8A3197A5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 01:58:49 +0100 (CET)
Received: from localhost ([::1]:47280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAMnI-0007DB-F4
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 19:58:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3PtIlYAMKCoEiojlttlqj.htrvjrz-ij0jqstslsz.twl@flex--dje.bounces.google.com>)
 id 1lAMl8-0006ii-Dx
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:56:35 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:41071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3PtIlYAMKCoEiojlttlqj.htrvjrz-ij0jqstslsz.twl@flex--dje.bounces.google.com>)
 id 1lAMl6-0006Xl-Oa
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:56:34 -0500
Received: by mail-pl1-x649.google.com with SMTP id p15so3937497plq.8
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 16:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:mime-version:message-id:date:subject:from:to:cc;
 bh=q3vLd/msSQ8Zm204pvK+UfxueYuT/NelzXnvkw/NEl0=;
 b=EH1VcB9hELHDLSxRG82UPTypkW0F6ZPtEIjnEX2abXRyFfIsp9fASJwyVk4rl2F1S5
 Vse23MEM9l1W47rvNoMFLF5P/8nN897IQ4WgxVg1GJ/OP6XWHNM9AD/iuxMiL664gYs+
 lrPZxyYsFl8/JhCP4mHHOEryqD4qsFrn+Ouchcz6N/gW9xbEbKXsRiUsLZymKeD83Lty
 UBmuqkwKMrXriBGT5ymVIrVTHDynvDmb9LASCFhVT5GTaPznXNV+JoGcD2D4K+RhA+Zs
 YGu+w0dMOrSfhG8yymMPLJa2v3DOcNjotvZfc78x4N/E08t1wHmS7sSXBhXMDToxq9h3
 LEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:mime-version:message-id:date:subject:from
 :to:cc;
 bh=q3vLd/msSQ8Zm204pvK+UfxueYuT/NelzXnvkw/NEl0=;
 b=s19aLC6zkmp3mm9M6j1lyIdCEYud/vIJUOKXtJ1EukmZLuKbEz5yot84+dqKbmUHeG
 IkYpGb++MC7WPsUe/KrTGRW0HRHcZDfBHYdxKxZrzhjLRk4SEIFw6HfOrJh1IAaR1lvz
 sJ5bqdIK7G+8BfjiYveHxTeK8IJ1QJ+aOwIfjQScAwUiHWRYBvYh9L3fsP/C4VTzhrkQ
 mW9SlND3SQY1M4y8yDxonUlAPwu8XLwCBXKRQOFvwYGAMS0gWNtQEwaJio19CYKiqFwf
 djaF9d9HsEPu9YqFHVVS/dSY36OshH3Zs9Ypk7Xes87TbxFiipMgS9iS+Thd2c5hpVHE
 LICw==
X-Gm-Message-State: AOAM531Ds1PKUjRizNCWr1QHJXwgZdTCFVBZ6AUg0gmTw6X8kKZBTVot
 b6fiRzU4jZK0tjkvPVyU88h2xlo=
X-Google-Smtp-Source: ABdhPJxaLaW4NihXtsyVW+s5BLnQpjDzQJ4/EZpmIrRSn2Fx3cskURO0hILL1IeheGlo8etSHxEetiE=
MIME-Version: 1.0
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:8f1:3dd3:20e3:9c39])
 (user=dje job=sendgmr) by 2002:a17:90a:8089:: with SMTP id
 c9mr386122pjn.25.1613091390531; Thu, 11 Feb 2021 16:56:30 -0800 (PST)
Message-ID: <000000000000530c7105bb191b33@google.com>
Date: Fri, 12 Feb 2021 00:56:30 +0000
Subject: [PATCH] qom/object.c: Fix typo
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3PtIlYAMKCoEiojlttlqj.htrvjrz-ij0jqstslsz.twl@flex--dje.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Doug Evans <dje@google.com>
From:  Doug Evans via <qemu-devel@nongnu.org>

A simple typo (noticed by inspection).

commit ccdffd2c10c5e4447d5e462a6ad2f351df502dee
Author: Doug Evans <dje@google.com>
Date:   Thu Feb 11 16:29:13 2021 -0800

    qom/object.c: Fix typo
    
    Signed-off-by: Doug Evans <dje@google.com>

diff --git a/qom/object.c b/qom/object.c
index 491823db4a..6a01d56546 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -695,7 +695,7 @@ static void object_finalize(void *data)
 
 /* Find the minimum alignment guaranteed by the system malloc. */
 #if __STDC_VERSION__ >= 201112L
-typddef max_align_t qemu_max_align_t;
+typedef max_align_t qemu_max_align_t;
 #else
 typedef union {
     long l;

