Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D0B586D62
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 17:07:00 +0200 (CEST)
Received: from localhost ([::1]:34360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIX0V-0001f7-7z
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 11:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIWtH-00061b-Gp; Mon, 01 Aug 2022 10:59:31 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:34623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIWtF-00007V-SJ; Mon, 01 Aug 2022 10:59:31 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id 204so18150605yba.1;
 Mon, 01 Aug 2022 07:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Lzj/yiNDFh4JW84RkK4BcDNLtWpH3d5QATkJFn3L+HM=;
 b=WaA/WjeB0ozkx9iEeAMusysElA27Cwa6FOAPAKOTFnL4iXbhi3xbr8+Y90iQLbruIl
 5YYXCQ2KYtvfEykFiJQqZr/9GTEm8xqWGgndJE3Ebu/tASjKn/0haI82lNhTmy8pipr0
 NWwtMYiwRuCeSMHeU9j6dNDbXEUsxB3L8Sxw8W1fLVWOqhIi6OUKesXCY93iSxalKnBi
 bbVlvCkQq1r95fM1pC5k7neqgtv516ssnpbRZTy099i1ME2e1cTqW1fPsHNEzGj+a4cn
 oxOTMENNYC5T795bfP1GGdfrCucY40xbZGrw1BWZWnaQWorBVzjAZebaDIOq60MSCYBQ
 yjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Lzj/yiNDFh4JW84RkK4BcDNLtWpH3d5QATkJFn3L+HM=;
 b=2COoKFNMk88YA3rGWgjdAJY5U2QfyOECHBvuzxPjaLXxA/3kfjcqx6j5+M8STZkIRS
 8UNMdP2Ze2r9gxttMYOXKo08Y3YHYxj6hmSSVmH0i6vRz3NeFLaa+PR+SjiTRRHYSHub
 Rebms+cy7f0IU+TiKXe+gc3+KlZ3/oBYNjQHTU08HgSYENxsQsDQSm5DXe2zMw5Gqzlx
 zJMoYNQh4V+ROxyz7T6XajpO/uqOY2Rn/EQk3dWUgrf5PYNgNgHRRENXxdims2sySzGd
 vmipOb8SM2CGGxFTo6bx2757L2osE/5vmr1iSP5I9AgF0qB7T0xlUy6O8orBJ2JHBAM8
 R2VQ==
X-Gm-Message-State: ACgBeo0STRImS63Xleprx5HJEAsqJpuUZHySgbGCM37m0GYS0S3lPY9Y
 hkLigphNZLk2J6RL/m7SnxbIX4FsOYjyoS7xQ34=
X-Google-Smtp-Source: AA6agR7rlfYey2tawcV5p2JR3FZXc+A/At8hhAKDXaUzH9PhKZe4Ci7k2yChL3WNZc1q8G7xo5B7IUEQxkiOv5raMJk=
X-Received: by 2002:a25:428c:0:b0:676:a2fa:4d9f with SMTP id
 p134-20020a25428c000000b00676a2fa4d9fmr10681531yba.366.1659365968539; Mon, 01
 Aug 2022 07:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220801013318.10607-1-faithilikerun@gmail.com>
In-Reply-To: <20220801013318.10607-1-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 1 Aug 2022 10:59:16 -0400
Message-ID: <CAJSP0QXDHVjaFH5M8Dij+yDipu-p0C27kfm3SQ7JFT6qtvWpnw@mail.gmail.com>
Subject: Re: [RFC v5 06/11] raw-format: add zone operations to pass through
 requests
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, damien.lemoal@opensource.wdc.com, 
 dmitry.fomichev@wdc.com, hare@suse.de, stefanha@redhat.com, mst@redhat.com, 
 armbru@redhat.com, qemu-block@nongnu.org, fam@euphon.net, kwolf@redhat.com, 
 hreitz@redhat.com, eblake@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2b.google.com
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

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

