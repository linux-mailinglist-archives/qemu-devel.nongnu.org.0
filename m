Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D0F27FDEF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Oct 2020 12:59:06 +0200 (CEST)
Received: from localhost ([::1]:46692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNwIi-0002Wd-Vm
	for lists+qemu-devel@lfdr.de; Thu, 01 Oct 2020 06:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kNwHt-00026D-EY
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 06:58:13 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kNwHr-0004q5-P3
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 06:58:13 -0400
Received: by mail-wr1-x431.google.com with SMTP id t10so5162642wrv.1
 for <qemu-devel@nongnu.org>; Thu, 01 Oct 2020 03:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=EAGpkmoh2org6k92xDnniOS9HE/MMpSuXIMvHIrGbDM=;
 b=h8Dm8NHFJTv+gElmCOgWf/YxkuirXIefcz+mv1mI9wGxtUI9olrYZt8vjOrimwYfPc
 UOLa9VzUuPgBJdaX27YeECL0mqQWvffy0HbMaU9UGDYDdP+vXERVKe6yI5IGfS/O4Jk9
 +ZqB1UThBZeL1y6z/Y3j4GhUvLNziUYd8289EogPZKg17v9l1szD7EueWXzqFkFvKkkh
 XFYflyC5ioDacuxs4JTDN3IDZ1acgCt3VjymY4GbSv9+GGsgnxz3Mq1T12p/cNfQAuAZ
 uqSvURJHn7jOGeWFeulavmVEhmjdN2l1w7Ft0arwXPZrhXGQiuxv+m6wYf8z/fz29AxM
 3l5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=EAGpkmoh2org6k92xDnniOS9HE/MMpSuXIMvHIrGbDM=;
 b=ifNOFlpENcI9InxouDfAa5FGsSlO01rBDfCyzFBCXRVPDIT4Vdqce12lsuxTsk+DKU
 HnjHoUmrOuc1oJLPtsA4d5iJj0MsOxCQr/QdMhm1mIN+m27Mw9gYIGWXHT9VwdcoSryP
 opgyux8VfUS3JdeNIhOHF6o29m/Y/drzaFidg5xOzDbSz5aQb3AbB6VdWZ175e/xTtTE
 pkXzVpMJlQwETAfwuWo/N2y21s/x3PCerG91Ehkex76F2bsqARW9dHy2MZPfQ/MLptAV
 xLfwbFkywBKo2EnLujRgoZva0y2aUtntcHNFWmZ9LRn9HayYSMzQx1M/ic81YxsxH901
 eVCA==
X-Gm-Message-State: AOAM530gqJcSKRpLx93k8cbPmm7n9+jtlGeNQJs7QiPLJzCAAg541HCh
 kv1y44ORZclFvtOPWvG7i4TgpyE6TwaOnY3c6Cv6EVoKaFGIvw==
X-Google-Smtp-Source: ABdhPJxmdKNWwkBq5rnfVBD3kQTkBRUGBzDef6POj3ZPxF1alO8W+8MzXXcfyht0d3r7q0bZb7QD6sxCJQH2Q1J1dbc=
X-Received: by 2002:adf:e9c7:: with SMTP id l7mr8150317wrn.212.1601549889125; 
 Thu, 01 Oct 2020 03:58:09 -0700 (PDT)
MIME-Version: 1.0
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 1 Oct 2020 16:27:58 +0530
Message-ID: <CAARzgwxzGF2t8GtvMF1tNztP4UiC2unFjqW5MNSWU5bxBy0-Ag@mail.gmail.com>
Subject: Looking for exciting projects
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::431;
 envelope-from=ani@anisinha.ca; helo=mail-wr1-x431.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey guys,

I am looking for some exciting work around PCI/PCIE for either i440fx
or q35 machines. Any pointers would be much appreciated.

Ani

