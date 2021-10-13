Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA0142CFBF
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 02:58:38 +0200 (CEST)
Received: from localhost ([::1]:38026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1map4v-0003Gw-CP
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 20:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1maloY-0000w5-Sm
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:29:30 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:33704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1maloX-00074s-9V
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:29:30 -0400
Received: by mail-qt1-x834.google.com with SMTP id w2so4051032qtn.0
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 14:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8EVNQMNzwxLHYQpPmLnvNYYKGvgSqgWQ7JXCmQkgB/w=;
 b=kjkd488QthV9CbQZ/U9RGlqNTi1T0+Qerzq/8WHtiVDJLSELINw0vnn0UH0H4rN8+X
 9lbcz0K+CsiG0D3krhxGACRHvgFfSM8M5mlFFZnpwBs5m1pBJiRN4oZXs31HvyKmOaXe
 XXVCEsczYcOEDmK3wGVxUsb/TWl93ghiigVCVVWCGdpDcStCVE/G1RO/zZNeKEDs15/r
 KuGFDsTzhUmam4j50ZKy2OShCJ+MSeqKpf64k/uO3yjeQCPMNl0Ee2J9Qan8jfKufUKL
 4nL4aSt9eEiUVTJv+ACXNa8bvT1115GbCfJqXB0M+axf5a8WomKbTMVmfnWN7NjnSYni
 5YFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8EVNQMNzwxLHYQpPmLnvNYYKGvgSqgWQ7JXCmQkgB/w=;
 b=2jgQtY/HD98428JUsxqBTdsrQclPGy54tOgZ20dNMzELjnh7K21VH2I7DQSQM5/2VT
 Y6Lv7+4/nh9L3plCdfwbGbLdWaQxPas01v0w/JsMeigJ8lw3l/oom4/ufTI2I+TpblnD
 +H+0X3nGzadGU18zlnhjDUYldAIBOuubZ2O9BWpSoAbqkfLLRS34HecyH229hw2DlMsF
 OmyTd92kklvRx3fqYrkuA7+1dE/iVPbbByt4IE10agZUdqinKj7BpF0nsWWJhwDxDIfi
 8tMXxDyRMPNgAHAjSCOEuL9MhEfiBWHlFd7Rjq8whixcXWnf2wdcRIgji9gOV04XgcaW
 CbZw==
X-Gm-Message-State: AOAM532nBYsqXqYu5C2gFZdGu/WsGc2gKMHTmHBPxLuGNW1i7tCOW56b
 ZjYH4HRqsCeOWBJreWi9dp2++30ajcXZ6g==
X-Google-Smtp-Source: ABdhPJxZP49tEAx7bCn16Jpip4aPZXY6gL4We+LkBL1WlanQV+mgG0OqSdLSDZA6wgCYCCKhLnUy8w==
X-Received: by 2002:aed:3022:: with SMTP id 31mr2124674qte.322.1634160567509; 
 Wed, 13 Oct 2021 14:29:27 -0700 (PDT)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id m195sm414697qke.73.2021.10.13.14.29.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Oct 2021 14:29:27 -0700 (PDT)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] 9p: Add support for Darwin 
Date: Wed, 13 Oct 2021 17:27:13 -0400
Message-Id: <20211013212724.24790-1-wwcohen@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Oct 2021 20:55:11 -0400
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

This is a continuation of a patch series adding 9p server support for Darwin,
originally submitted by Keno Fischer in mid-2018
(https://lists.gnu.org/archive/html/qemu-devel/2018-06/msg04643.html).

It has since been updated and rebased for NixOS by Michael Roitzsch
(https://github.com/NixOS/nixpkgs/pull/122420) with a goal of resubmitting
upstream. I am submitting his patch set as suggested, as developed by him, with
his Signed-off-by headers included in full.

Additionally, I have run the patches through checkpatch.pl and adjusted coding
style accordingly (with the exception of ignoring warnings about avoid
architecture specific defines in hw/9pfs/9p-util-darwin.c, where they seem
unavoidable), and have signed off on those modified commits.



