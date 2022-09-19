Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE855BD34D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 19:08:07 +0200 (CEST)
Received: from localhost ([::1]:52896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaKFY-0005rz-RQ
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 13:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oaKCS-0003bj-Ld
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:05:01 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:36780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oaKCO-0005vX-VS
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:04:50 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id a67so43397804ybb.3
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=jhaL46BvXGFl5JFp4knycIDNYyZdop+0mMkBhsZKKNI=;
 b=KUnU50uG2UW1GFhkhY9QrPsy/gGCUWiZdbNqE4/1jzpqrf57EGmpkPo7DYQqIdCaw6
 FOgF6uLTfRMMvyXI45XtVU1nPB0SUsJMpfiRe4uZDAnw5p0/59P6mjX7VCU6d0kvJqq7
 FStvK536E4q+gNSjUMp5Kfhiw369fHUh64vEqi+ZEIuoabhn3ugWCX+Hdge0fEdSkSQO
 W9x3LmumNGvAqQhV7ewPrP0dO+RFn2FTaRLHPk+H7jtOnCZLfwtCr9sSIb6K8fpd4piR
 ru/yixB0MUvv6vcbz1aFeHDLJdNsVNyLqwh+d3x00talIyUKAeirG7ZGTOmwdSRZLx9i
 ON9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=jhaL46BvXGFl5JFp4knycIDNYyZdop+0mMkBhsZKKNI=;
 b=KKV4i6uAIr83nV9dBZxkZgn4/yejXn/zKsYayTcc71B5o1iF7f5SpLjfyuC7QXapz2
 d0Nv6H/+2rg06GF6sUo84DVC5mTgs+2WZTuIUtiFuBGQ2eifav5twMOh6ZrUjm3NIvO/
 AKlJnVi2NMhFKHP8+s3O1kLbx9RkUjDW+FObi6o8uGI1JKqxGxUdBRWQab5N5EU6sVmh
 YNujR9E693DLxPZA/cXWPgBZYCZiZTSB7QeAqcwl3rFDGBxHh2lPPOPTBG/Bpunh7/Ry
 BQGw7lYfJmUD+FJShv2Mgs8d24uT/caPrdS731Mtcg3wwl9gKhFwYxXqVBhBGEmqcFQJ
 pfPQ==
X-Gm-Message-State: ACrzQf31zcAAneTyfXzQAVLn7BTzgaIEqgXxhhrWaWCa/gcOjh6JGhda
 ufQcSjUgqLQx4OCdcNNvxoBleUqfgeyG62rdDJk=
X-Google-Smtp-Source: AMsMyM7Bffwtk0OPj4DB1zhACcZkv2vVFR5Cg2FmBUuvAlagmOMHF6xsle2rKAIUVznyR67xSmyhRJKlSmy14xWotwU=
X-Received: by 2002:a25:230c:0:b0:6ae:ef02:fafc with SMTP id
 j12-20020a25230c000000b006aeef02fafcmr15135166ybj.58.1663607087687; Mon, 19
 Sep 2022 10:04:47 -0700 (PDT)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 19 Sep 2022 13:04:33 -0400
Message-ID: <CAJSP0QWjRH+ZWOQUu2_283o3YmcQp0iVTr6bT0Rqvv=Y0YFNdg@mail.gmail.com>
Subject: Travis CI webhook returns HTTP 500
To: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab sends qemu.git push event webhooks to Travis CI. Recently the
webhooks have been failing with HTTP 500 Internal Server Error.

Do you know how to resolve this or who configured Travis CI webhooks for QEMU?

Thanks,
Stefan

