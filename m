Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F6D41685A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 01:11:06 +0200 (CEST)
Received: from localhost ([::1]:38222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTXrt-0002xW-AG
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 19:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mTXpp-0001vR-Nv
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 19:08:57 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:35436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mTXpo-0002A9-6r
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 19:08:57 -0400
Received: by mail-qt1-x82e.google.com with SMTP id c20so7845250qtb.2
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 16:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=+rbZLPo2beM6saL2l2ThY/M3JXOTOCJp6GzCthWDVl0=;
 b=bdfND1dAOjfAI3aGTdZ3V8C/DZztG0LHyafweJGrcsBOiDIcAPJg6r2A5q8PCfUCun
 f2CKIOXmmuYhia0VnKuzzqAtL3bTh8al0I8oS+M5PcWX35Q0tDmjjQlu9QURqDWt+ekz
 90lxKPZBLpBpj/bqSrk9PHw2EuY02dhAXbvsJvCQbh/GEb5soFBNETJefvrgkCSaknx4
 YU9OybSn9DesD2SDjcEXxfEc4Rgr5Z1CeL9v5TSi+FBU2bdsrFApNDYWcAG4j56qwpSl
 9bfpyuMWHaybWjEya+UjIfFXSppOLHcwLpcy8n46BpMZDuWpcuy/zmgA+VoqifGWMVPU
 HZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=+rbZLPo2beM6saL2l2ThY/M3JXOTOCJp6GzCthWDVl0=;
 b=aFfYp+WGO7OGav1oeRp/wfXiaSzxhfYCw/7mOGH6P9aF/WnPRoAk4XZ7+GfE27/hav
 K68zQAnS6CXv23A/mQur0sYohEQFQFcyM0tVg/q8ST1m932jA04myRNmBakvQLkyJ6zF
 60pZFlZ9qo7nD1gA6w5ABgVrYiDs6upbD41QY4Fpnw0wlHReCMa8HoIteegVmEtGnne4
 yat386tD+Kg7l0cHhs3OnwHzqIBeJqOhuatWRGeZeF8x9SrqIsOzlkxg1Jc+lc1pC9KJ
 Vaa5CJGpPLTC3tj6hbRH4rI+FpBZymvcBoYMJEdKCMU5/GcMEPfyFk7FeUiMkGidH1LM
 pk7A==
X-Gm-Message-State: AOAM5318dQxJtOHGnsLnp8CRf44xKTAnGyZ9Zt9+Avow9vkciI3HA7bE
 dqSiN7HExW7K2DK23ufUMPY=
X-Google-Smtp-Source: ABdhPJzaT59Ujq80RW3UsBcbo3pwkzMFRCBeStGKOvFq99KryqgpqCY1HHrXS1AFe2tIdPwqLnshNQ==
X-Received: by 2002:ac8:610c:: with SMTP id a12mr1243221qtm.81.1632438535094; 
 Thu, 23 Sep 2021 16:08:55 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id t194sm5611405qka.72.2021.09.23.16.08.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Sep 2021 16:08:54 -0700 (PDT)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Ping: [PATCH 0/2] cocoa.m: keyboard quality of life reborn
Message-Id: <89CF5E51-5126-44EF-8311-136CDCC50D8D@gmail.com>
Date: Thu, 23 Sep 2021 19:08:53 -0400
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x82e.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter, are you reviewing cocoa patches? Should someone else see these =
patches?

Thank you.

Ping:

=
https://patchwork.kernel.org/project/qemu-devel/patch/90E28997-9AFA-4D8C-8=
323-BD087E629638@gmail.com/

=
https://patchwork.kernel.org/project/qemu-devel/patch/20210730170945.4468-=
3-programmingkidx@gmail.com/

=46rom 22a7f31c91d0803b0021e9802dde76daaec0738d Mon Sep 17 00:00:00 2001
From: John Arbuckle <programmingkidx@gmail.com>
Date: Fri, 30 Jul 2021 13:01:26 -0400
Subject: [PATCH 0/2] cocoa.m: keyboard quality of life reborn

These patches can really help improve keyboard usage with a guest.
Based on patches by Gustavo Noronha Silva <gustavo@noronha.dev.br>.=20

John Arbuckle (2):
  Add full keyboard grab support
  Add ability to swap command/meta and options keys

 ui/cocoa.m | 178 ++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 170 insertions(+), 8 deletions(-)

--=20
2.24.3 (Apple Git-128)



