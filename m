Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829333F5E6B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 14:53:14 +0200 (CEST)
Received: from localhost ([::1]:58020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIVvU-00062Y-RX
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 08:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1mIVuE-0004tN-5p
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 08:51:54 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:38648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1mIVuC-0003Lo-BA
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 08:51:53 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 om1-20020a17090b3a8100b0017941c44ce4so1716324pjb.3
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 05:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=LKNenXzBsgPQsGz2UfcCg44xkWiRBSEwPxqhrkwwK7U=;
 b=l+wDOw3EaQ7f4jNBwEt3/kb9cWTL2Qq45hY6w/WEZ01jO3f0Q+U9scrRh0bFM5fKYb
 Cs0TPvb2gKew15zle3G/FLSB1fls3UegsUO5FQAVLfU6vBzKW4xcz72AJr7hrIacW420
 M0eIVWQvPsUP2DXyLVkTZkAzMBAthP7nrmVRBE1CQHsT4Sf6Z1F/lnNBeHrGJvgTg79x
 I1M2vJ8xYC3YbRObypdnjSHy4DbMm+x/H3NQ3ZOmPzLexNCekwQeTViO0xKAbC+/3Y5T
 568iUZfy1SCljcAEWOohsphK0tGFJX+YNLyouaBZiGPCDHol/AdM/WHT5MpTYYSovxZZ
 NnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LKNenXzBsgPQsGz2UfcCg44xkWiRBSEwPxqhrkwwK7U=;
 b=ifA7DQfPrx+AqRI7HnnRJiBzGC7nAF9oruhCIW5P1f1Ds6rcdQC7PfaaQWphrHzd0y
 kpEMCJ3reI5vRQtFDEaSrBFfTD/N3e8yj4rVkVVR6PtifRyBch4IDY4PF/WlfODUjLdB
 2BwZb/lncUKMzPsL3AoCVk0L8u0TrIgDB36QMy3LJF6qOT+zYbaUBr68uoZmV6XUsRyq
 ubESGFRPmikyVK3pAcqESZilOgT02ZZNjn4EXq7k3YVkkkTecipjGwzBata4dbIrRtaj
 P9eb31P8ock+kFLMOFuIin8nCu2p6h/+1tA/+PtLWiQFMuwSXztdZ4gh1bc2ORz4MR6X
 w/Kw==
X-Gm-Message-State: AOAM5308QWcIv2veor1MiX27wNXuWQ4Q1J+yyqf1od0oxppG1xs6bH6n
 8RnKr7rVj5XiXlELJQZPCCjpWsvyJpm8xD4UggyaV2bpKkc=
X-Google-Smtp-Source: ABdhPJzL1/9if2Tu/jUBDnnhY6185A/eJ2JpRMPB+j3q7HSmpZokISXOd5Mc3rByPE4DjQWTEY64T1X3TBpwzPAujiU=
X-Received: by 2002:a17:90b:4905:: with SMTP id
 kr5mr4132042pjb.112.1629809510212; 
 Tue, 24 Aug 2021 05:51:50 -0700 (PDT)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 24 Aug 2021 13:51:39 +0100
Message-ID: <CAJSP0QWX-8ssEO8KZtigrXLk0sD--_=wyRBK6Cf=2PpXjPp+RA@mail.gmail.com>
Subject: Outreachy Dec-Mar open source internships
To: qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=stefanha@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Dear QEMU & KVM community,
QEMU will apply for the Outreachy December-March round. This
internship program offers paid, full-time, remote work internships for
contributing to open source. QEMU can act as an umbrella organization
for KVM kernel projects.

If you are interested in applying for an internship, please head over
to the Outreachy website, look at the eligibility criteria, and submit an
Initial Application by Sept. 3, 2021 at 4pm UTC:
https://www.outreachy.org/docs/applicant/

If you are a QEMU or KVM contributor and with a project idea you'd
like to mentor, please reply to this email so we can discuss the idea.

Good project ideas are suitable for a competent programmer who
is not yet familiar with the codebase. In addition, they are:
 * Well-defined - the scope is clear
 * Self-contained - there are few dependencies
 * Uncontroversial - they are acceptable to the community
 * Incremental - they produce deliverables along the way

Feel free to post ideas even if you are unable to mentor the project.
It doesn't hurt to share the idea!

I will review project ideas and keep you up-to-date on QEMU's
acceptance into Outreachy Dec-Mar.

For more background on QEMU internships, check out this video:
https://www.youtube.com/watch?v=xNVCX7YMUL8

Stefan

