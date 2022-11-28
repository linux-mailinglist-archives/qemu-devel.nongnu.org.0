Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF5063B40C
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 22:14:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozlSA-0008Ar-Ex; Mon, 28 Nov 2022 16:14:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozlS8-0008AU-QG
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 16:14:12 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozlS5-0001nB-VC
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 16:14:12 -0500
Received: by mail-yb1-xb33.google.com with SMTP id c140so14976171ybf.11
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 13:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HK/8ClU8nx/Em8W3y28aN5u6OFvhRxs6MQAe3fhEkrw=;
 b=HYPTV/x+eX3mEHMyESToToakXbhPLqTh16VGHUtZU2VGb29YBSpvSC7vqjWJz5GtBR
 N3bt7O0LjH39TGT8yVPVVFBnQExDw1QxwJxlzD/EqSXjbYPKwPf9uyndI52CHwPIvFgp
 io5FGcaRjfbc2Q9JUaufKB/YsjHnzHlh8IKKIGaGPsClMKWYecWKBk4bJ4pgp0kTJXf+
 O+fOQopjU6Imssf4u77kRcacTniAdrx72IW8xnDJ93l+lfUt9GZz/Th5t9sU1R6jLETY
 2d7JtaWVzhGetHgkLUMWaEJ7gQidITz2peFk0RaKjqYtKIy8fkoKrbahqHRVPm/V/EXZ
 kDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HK/8ClU8nx/Em8W3y28aN5u6OFvhRxs6MQAe3fhEkrw=;
 b=rzvNgFOa503WhLgRVYqxixzqqjKotNYwxX0j2b3MbHzPV2fXOlyLQxTqYgUMilWpyw
 J5+JQPEpVfON2xBPcCYWHofiAP9H6dwITdKdcBhu/639IvqmclMg3q7OkHKezipedoNv
 yun1yuTgAdZ4hnCcj0Dx2RsOrkgaTPBubv4AoMb6rvLHcWSfeAFohwNpm879bN+zjrH9
 OGMteSq1oo2E6ZlsCiItvhp+81knseGNIBKTck9zuVF96fwSvDQshcpyq8mtq9byIlBO
 Cn+JnAUpk96pIU/sgbNxdlH6u1lLDYF6DmWxvpZr1ism27r53FXJtH8Hl/2SfAT8l6Gd
 675Q==
X-Gm-Message-State: ANoB5pkcmkNnbhv7e3PaxtWMOhJaGsXKZ6dXDUpTzQEvm45C++0aRh7g
 8ZhgezpDsIAJccjzpj4BlrSdexuzPfOOHffVBOo=
X-Google-Smtp-Source: AA0mqf6u5r6VVXu5s/BmpFAe0u1R5g4m1ArJ6Ke3SsBwwWbNM7yNDW7UcAonrzzq7HPhIaLxh1e2xjYOPDahjJVBVsA=
X-Received: by 2002:a25:e057:0:b0:6f8:c34f:227d with SMTP id
 x84-20020a25e057000000b006f8c34f227dmr307960ybg.537.1669670048643; Mon, 28
 Nov 2022 13:14:08 -0800 (PST)
MIME-Version: 1.0
References: <20221128071822.4707-1-faithilikerun@gmail.com>
In-Reply-To: <20221128071822.4707-1-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 28 Nov 2022 16:13:56 -0500
Message-ID: <CAJSP0QVZqvyzja8EP4U-i6WwW-gA9YQ9RQt1Ect51a51JzGxtQ@mail.gmail.com>
Subject: Re: [qemu-web PATCH v2] Add a blog post about zoned storage emulation
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, damien.lemoal@opensource.wdc.com, hare@suse.de,
 dmitry.fomichev@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb33.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Cool, thanks for writing up your zoned block emulation work!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

