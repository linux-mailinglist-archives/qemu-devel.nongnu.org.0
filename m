Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FFF64725C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 16:00:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3INo-0006dS-MP; Thu, 08 Dec 2022 10:00:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p3INV-0006ZA-DW
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:00:03 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p3INS-0005iA-AT
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:59:59 -0500
Received: by mail-yb1-xb36.google.com with SMTP id e141so1948316ybh.3
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 06:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BEJiDkskMgDa6gj1SXJKQTK7DFk7VmGYnl67lqYNFfE=;
 b=TEdJCFXjRQGsY2S2MQ+qlHGTNUZUpmxvVdHBnfVezIkzoqOcvEPS0QsRbZkErO/4gt
 LkHnL5vWNVpz7RfxNyLJtmq3A/fSR3Jmb7a8TLJ/yk/vjMsv/4RyiTHAhwb2iXOM0Cga
 E090aRZ2SxBzO+TJbK9hVWL6LRP6i7UBIo5vLqN/vw6uNQsu4Gke+aLj21zsj8dMLgjE
 5n6tTAO6HgW80XQWeEoplRCUqUE3P063KcLcsE7uOFt27aLVsTg2HGRD2LfQk2vpVTkX
 TxmikA8QCRJJs9Dy/wWP/19iMWuTrE+GY+A5t4BnR5Nxn/Bs58XS9E73FKQOn37orRgb
 cjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BEJiDkskMgDa6gj1SXJKQTK7DFk7VmGYnl67lqYNFfE=;
 b=gI9KhvXHl0dD6tU5iCIBhC7vKudc7AmjmXJ1g8sYpfDKpi8zNgrbsPtbvMq1+GA20l
 B114iUSsD0M2lTXFZMHEwV8GA1YlP5wSw/yA2klstAjs4mg95sd6ghiwjqkE+S2fA8bm
 aEZb/zIjz8yDm+0rrqLjYib6pU6oGuFu9sOnMi5bnhKa9Z34iylsXbpyyfanY2JcCoz+
 7RL2ojsdUHvWAqlG4ssTIxvLbuDeae167A2UPuOxuPUIpiC+1AtX+AbNlfKRXC2lWQc8
 /m80tMnIJkWcjl9M4BIWarbBTlFZUQ8eZ/NKCPrv1wE4jWq6N0If1NIPRPeny8OQu/96
 kwVg==
X-Gm-Message-State: ANoB5pmN3Mu2tUCqBsY1GQ2HzJR8gyW/YzPzvMf+g3yRYykCf0B25Kt9
 m2n28cX3bKSTLUpj/sCgHk1w0Bp77S/Z09ddraHC6IO8
X-Google-Smtp-Source: AA0mqf4gDdsWSJZX5XtDmL/qcY8FfMj/Euj7HsXJiB9cxaR4LKd+fUn7HBp26+fkJPWnhst/Y//4dib4e6aOEz0xeGI=
X-Received: by 2002:a25:e746:0:b0:6f5:37ca:939a with SMTP id
 e67-20020a25e746000000b006f537ca939amr49612962ybh.207.1670511597324; Thu, 08
 Dec 2022 06:59:57 -0800 (PST)
MIME-Version: 1.0
References: <20221208142306.2642640-1-armbru@redhat.com>
 <20221208142306.2642640-2-armbru@redhat.com>
In-Reply-To: <20221208142306.2642640-2-armbru@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 8 Dec 2022 09:59:45 -0500
Message-ID: <CAJSP0QXUCDU2kW7WwqQGWQbiv34vUL4F=7capUi8Uj54_YHKig@mail.gmail.com>
Subject: Re: [PATCH 1/4] coroutine: Clean up superfluous inclusion of
 qemu/coroutine.h
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, kwolf@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb36.google.com
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

Probably because block layer, aio.h, and coroutine_int.h header files
already include "qemu/coroutine.h"?

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

