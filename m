Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABDC586E4E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 18:09:59 +0200 (CEST)
Received: from localhost ([::1]:52582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIXzR-0002iw-M7
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 12:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIXh8-0007FG-Pf; Mon, 01 Aug 2022 11:51:03 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:43521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIXh7-0000dh-Bl; Mon, 01 Aug 2022 11:51:02 -0400
Received: by mail-yb1-xb35.google.com with SMTP id o15so19470123yba.10;
 Mon, 01 Aug 2022 08:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=4W+W3dv6STj1b1jLjilKIK+oSCDybViu/CWBD1tRzhY=;
 b=a+rytzSc69AnYs6fuh3Wzm38KpdE2KWiJbHVoFUnjbaOrjDf906Vlz+Q8qYPLB7Uw3
 fXhGRUfavLHGBO6Q6Q9wK9H3sLPrACbQ7v3fkoH9WdX/Lb26RcP5fFsLCr1WpZTOVgXW
 uWXqkBZxRJwBc+JCrHGhQexutry7n+5S8ei4v8LT0LmN++QUIjQBSxhMBiTQUiITvsIB
 4gesPkRHApWYotc/2tVdK+5nf9f2WNNR2bJA9JLKTlYyC9ncC4jOXcT1OXxp7j5JSMQQ
 JVqw9+3SODi8mTj1PGbOi5WZbo0VmORToDc4AMKdsP/s/3kk5l/0EZHc8mSKZc9GKHgj
 GVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=4W+W3dv6STj1b1jLjilKIK+oSCDybViu/CWBD1tRzhY=;
 b=A0vgI1vTJwIr5mh78YLgyXozxvWzKcJ8NRj6eAM/LUoBYSfDs6envCk7Kugl1BwOY2
 yNXMZJ840IAlE+XTPffjR5/yV8T3actiAdrjH6LksnDthsg/wAk/uIKSeUPnv39Udyvo
 KzwQnXeE/K/CCbEGfd49PG5vxlAfOHNfXZE7Vt6+zA7wtTncxLUE7N08w1SNt5IoH1dJ
 aVSTEV7V86Ie0J/fDmWyZyZi3484nCJHMyb+9jwyBlEpTJz2+LDzhUVMBX6aTJI3sdB2
 fs62J7zCC6iVRAwax4ONfdXMgF9UEQ+tgCmOVQgWOdxio9BKhHP2/HfDqRtN70Ymz8eA
 YgdA==
X-Gm-Message-State: ACgBeo0mGCtAy8PApsK/sjXkVXCnMVrLEtRm3cMhwMrNOoDX1Pivx3i2
 MVbCnc5t//0KblXP614nSVY86tb1iX8r3+mHye4=
X-Google-Smtp-Source: AA6agR6PL0JVubXYvJLSDaXcNlC0bARdGNv/akcTQr+CNC4Yd63PapXq+wgp1eliIW37cfMHvxYXAT4RHamrkwRd9dE=
X-Received: by 2002:a25:73d6:0:b0:676:d8a2:8d9 with SMTP id
 o205-20020a2573d6000000b00676d8a208d9mr7782128ybc.537.1659369060265; Mon, 01
 Aug 2022 08:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220801013416.10786-1-faithilikerun@gmail.com>
In-Reply-To: <20220801013416.10786-1-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 1 Aug 2022 11:50:48 -0400
Message-ID: <CAJSP0QX7OD1e-0rYZ6hAV90wK0c7PWr1nGts+zWjpOwZ011x2w@mail.gmail.com>
Subject: Re: [RFC v5 10/11] qemu-iotests: test new zone operations
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, damien.lemoal@opensource.wdc.com, 
 dmitry.fomichev@wdc.com, hare@suse.de, stefanha@redhat.com, mst@redhat.com, 
 armbru@redhat.com, qemu-block@nongnu.org, fam@euphon.net, kwolf@redhat.com, 
 hreitz@redhat.com, eblake@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sun, 31 Jul 2022 at 21:39, Sam Li <faithilikerun@gmail.com> wrote:
>
> We have added new block layer APIs of zoned block devices. Test it with:
> Create a null_blk device, run each zone operation on it and see
> whether reporting right zone information.
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  tests/qemu-iotests/tests/zoned.out | 53 ++++++++++++++++++
>  tests/qemu-iotests/tests/zoned.sh  | 86 ++++++++++++++++++++++++++++++
>  2 files changed, 139 insertions(+)
>  create mode 100644 tests/qemu-iotests/tests/zoned.out
>  create mode 100755 tests/qemu-iotests/tests/zoned.sh

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

