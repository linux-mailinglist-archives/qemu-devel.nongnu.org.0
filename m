Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEF0618348
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 16:51:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcTR-0007kX-JX; Thu, 03 Nov 2022 11:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oqcTI-0007g2-8U
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 11:49:37 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oqcTG-0003wX-Gd
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 11:49:35 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id 185so2734957ybc.3
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 08:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1fwjXo2p7OAgRFymIbERPgdXQA0mNoVXwRN35Qqfnfw=;
 b=PejFYcu/YVjLh+ZiNJ0szpNDXJZ1jCgFVNWTyluBDDOjRDgJWZjL24NOWwmSCrZzHo
 vUu1mYEWTbboufNW6wfUKSewYaW/4d4WdpQOYRXMo9KzI7X0NOax29VKqvvUEfsFshLY
 10FBiknGLhkWVRh2RhIooORyMy0bqyBvcZLb3O/Th57Ch/W6bHOLo4N076G2RC06biL6
 XNVXDY/A1H3n7JRyQaeuCnSu+bkz1RteT2uyRQ8IyUPfZxXdLhXGoLwfi0+EC/fS335m
 Zfq09Mz6qyqNHT8kdZYlU9dj/FaUSDjqQtLiWnkoX1xEYOCiJL31VOVqIxg9rUT4HNn2
 zc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1fwjXo2p7OAgRFymIbERPgdXQA0mNoVXwRN35Qqfnfw=;
 b=0XvugUHR9ZT2huwUnu2umB607z7wF6CH1XIRzkQpaZzhcwbJS7bK0w9dpHFMCM9hG0
 ER7HxNhx4Hi5HxaIYWDgx9avsUmuf/fBAmBDBS6QY31FzDpbkuqVOFFc+/bY5rucvnLt
 dVKQnLBPNigLB/AhcnciZgLTRlqXVsSrlF1hih9C89tsAzn8uPDv4VnDPw7G1GRKhZEF
 cJoxumAQO3TkPKIDiTdcu8aQbMPJwJcc8YohZHgcSQOmg4Q7yacLPLu5/G3rwSu6X4/P
 baiIeio1lFNplZYe5d0J6RJQ5iVl1schiuFmXL80nNMWaZTeCHHweYqFmG7TMn9JxLlo
 Pg4Q==
X-Gm-Message-State: ACrzQf3MM4SdMqniPXtxn+Ja3n1+Wvy2BuN4hSFY++WAKD5mi03cFLPW
 BSl/ttlt7KsiOcI3+2+XI/bgemtqqnTXDfiNrqU=
X-Google-Smtp-Source: AMsMyM5yFUbu/SLPHIUWqVvBYeV1xehJZr/cDLD95Wo2qr2VU5Cq8U4V6aycjn0Lf8LrETwWiwjUfY4Q/lh6fG2r7Ss=
X-Received: by 2002:a25:1e89:0:b0:6bf:9e55:5cb4 with SMTP id
 e131-20020a251e89000000b006bf9e555cb4mr30277932ybe.642.1667490573491; Thu, 03
 Nov 2022 08:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <2821393d-21fe-cb7b-1396-dac6fe4dfa6b@linaro.org>
 <20221103154208.91501-1-ani@anisinha.ca>
In-Reply-To: <20221103154208.91501-1-ani@anisinha.ca>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 3 Nov 2022 11:49:21 -0400
Message-ID: <CAJSP0QXxO_1WYL-FUZrRFOE9guOEVVr9Ss2jubkdHvAMwPwZqA@mail.gmail.com>
Subject: Re: [PULL v2 00/82] pci,pc,virtio: features, tests, fixes, cleanups
To: Ani Sinha <ani@anisinha.ca>, philmd@linaro.org
Cc: mst@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org, 
 stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

gitlab-runner can run locally with minimal setup:
https://bagong.gitlab.io/posts/run-gitlab-ci-locally/

I haven't tried it yet, but that seems like the most reliable (and
easiest) way to reproduce the CI environment.

Stefan

