Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EC7423872
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 08:59:33 +0200 (CEST)
Received: from localhost ([::1]:58396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY0tn-0006Y5-Jl
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 02:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mY0si-0005sH-Hz
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 02:58:24 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:43832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mY0sh-0002nF-3V
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 02:58:24 -0400
Received: by mail-pg1-x52a.google.com with SMTP id r2so1623231pgl.10
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 23:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:acked-by:content-transfer-encoding;
 bh=zuXOxRjmIO5Qljx+BHsxsbrIhdA+Pp74swWalu1gnvY=;
 b=hOI5GjgjvcFb719ekFP2AUfuJ2aCENswvTEEYUv8mW0pMKKdgrKHjSz2sqltwn7Ghz
 gicTpf+r2qu90wGPkOXplJ5hJLVEBLA8eqgL9+Q8gcxyHzaWh5ZnMt+VHNU9wdng+P+D
 KSHHvmoVgEdihNWZGGddxsScLEkMdevt1ExVvATcrE3w4RLPWsi2AZYuy5E/fYD/D772
 99zHZQe2JnMWN1sHqLt2PsmZkrTHZImRHx/lkWP+G8CT2IWgM8SnMkeGNi++WzuoFHlB
 vzu1sai2StXcCfDdK6UG1XIAF7DFy8kA9xJ2NL/a60QEWGvvJU8d/eyrGpD/bpDtWV28
 dR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:acked-by:content-transfer-encoding;
 bh=zuXOxRjmIO5Qljx+BHsxsbrIhdA+Pp74swWalu1gnvY=;
 b=d5qMf3YECZGlV3aRHyv0zviILt+YiD0p3/t2418uAFW9FD3Iy96WrYHZGkl8zEUYKB
 EA4/PjfVNtTekdNJLNtG2bL0Ygf9EntNtHqsHmTWicDrA6xEIrRIVdZans+IjC7xAQD3
 /3ainFrqFim9XnlkX6DoNxHVc6tn1C5Jh9jZ1OYqzzK/WLh5Rnm7xWeAaHkHjWnJmydH
 cq4g8UbkKLKGd7t6EqqN5sinsaewdqmko42SRLX5cwdh6lPwR0oyZXwNXCylRIGyfuBe
 ZnML0zjayKiMPTbZSUmMfjVN6fAoQJhhSRwP53126t0Ep+1NdrmUHYsuhCEYWHovFn5t
 3png==
X-Gm-Message-State: AOAM531yJQCDlV/EZEqpTTDcg1KOtiDSLsSwdI6sMPFqxJ4VQfWQ7+ng
 O8MZx7IsvBr0MVMxRWYiKyOp7A==
X-Google-Smtp-Source: ABdhPJxvakiuqoXjw9VRv349oZ7YvUTeE/q/UG6VaJV8/prOMjMgLvt/qkGNwdEOCTO3b0eBMzlFyA==
X-Received: by 2002:a05:6a00:84:b0:447:ce4a:634 with SMTP id
 c4-20020a056a00008400b00447ce4a0634mr34183310pfj.53.1633503501477; 
 Tue, 05 Oct 2021 23:58:21 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.129.122])
 by smtp.googlemail.com with ESMTPSA id q8sm3985637pja.52.2021.10.05.23.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 23:58:20 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: eric.devolder@oracle.com
Subject: Re: [PATCH] ACPI ERST: specification for ERST support
Date: Wed,  6 Oct 2021 12:28:08 +0530
Message-Id: <20211006065808.1054102-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1628202639-16361-3-git-send-email-eric.devolder@oracle.com>
References: <1628202639-16361-3-git-send-email-eric.devolder@oracle.com>
MIME-Version: 1.0
Acked-by: Ani Sinha <ani@anisinha.ca>
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52a;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com,
 boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric DeVolder <eric.devolder@oracle.com>

>---
> docs/specs/acpi_erst.txt | 147 +++++++++++++++++++++++++++++++++++++++
> 1 file changed, 147 insertions(+)
> create mode 100644 docs/specs/acpi_erst.txt
>

