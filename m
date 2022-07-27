Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B32582938
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 17:03:15 +0200 (CEST)
Received: from localhost ([::1]:56374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGiZ8-0006AF-Bj
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 11:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGiQA-0005G5-9H; Wed, 27 Jul 2022 10:53:59 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:45019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGiQ8-0008Mf-Tl; Wed, 27 Jul 2022 10:53:58 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-31f661b3f89so16695387b3.11; 
 Wed, 27 Jul 2022 07:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mvetXBU+NHdUWkDKp48TBnKK1qntd33MZb1+Io6rSMU=;
 b=dL9HpPpEuSVxLKebhtvFFFz1t1J3xfC2YXMUm8oiJDlNxGd67lXZwnyG8HT0NMn0BV
 jtTplJuF9W1TzLNJMLDdyHiKg4WyBJufiouNPiJjZN2tUby/NH7vyztVFtpneMjRu9An
 QRYNeS0H05rZkwb6b6LKLf/ppAiB0NX0lw/0fH12KLnhi6Nkk2635jzcvoJf3xgTplrm
 OGqu+JD0ZKpsYsV6lCzK/snH7Lw9VzqPKsd9u8UhCdIY5MEs74MHNmN5Bc9BAk2sC9Mm
 DIEDsG36PQTKSAyODuSqOIhX0UKMGl7a7EuJG6ugvDLCsTZKwaqJYIDvQfVBxwuIex4n
 ynpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mvetXBU+NHdUWkDKp48TBnKK1qntd33MZb1+Io6rSMU=;
 b=R2VQoMpu3VUSL6DYEFpAnnUQwU26g+3dxf/gQXNQZ2bPyjH3j1g2Pd5RkHMgPPp6RK
 8Gelc1sV1eo9XZSnBk+CjzPTuQiWi4quGdNRcLKtRlkMTrm+nPkVvt5JNObtpzAIbCoY
 PdRkio+LuhSupG9mTnZTkNnlpgLWHU30Je9wllv4N0veEhpBk1cPez3f54/WBb8ijRbw
 p+GN/BpXXe39z9chu9luO1+VGQIZgqjfqVBuZ8TEkhNGi66om0MgK4uNIeKl99CGbXkY
 mWsAyTsGHRZ4T2jCJrns8oRJ1o0bnGRLCdGoGLcQ1HSYGt/HqvkCvSR68VJ+qFN5esfF
 u49g==
X-Gm-Message-State: AJIora+FRM7YQXyOB4uugtf6mUnmRLrWqCzqWjeSPr+jY4N+lWLSs664
 3mRTeunuSpL2gk5te0RzNE3hxh6g1iervIY4SCuoLrCktwWMHw==
X-Google-Smtp-Source: AGRyM1vSHGMo3Dbu3gh/MmCXGFUwV3nPQrR/w1WpoSSjnSDrkoDNoYwanl8YAnV3615cKQ5r66MbkE/M6/rR0nSbhrI=
X-Received: by 2002:a81:d45:0:b0:31f:65a4:27ba with SMTP id
 66-20020a810d45000000b0031f65a427bamr2169991ywn.239.1658933635598; Wed, 27
 Jul 2022 07:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-10-faithilikerun@gmail.com>
In-Reply-To: <20220712021345.8530-10-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 27 Jul 2022 10:53:44 -0400
Message-ID: <CAJSP0QXciO-hJaH8qswm13JOh-O0AMLV1ckFUvcTUr=8k_OBwA@mail.gmail.com>
Subject: Re: [RFC v4 9/9] qapi: add support for zoned host device
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, qemu block <qemu-block@nongnu.org>, 
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1136.google.com
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

On Mon, 11 Jul 2022 at 22:31, Sam Li <faithilikerun@gmail.com> wrote:
>
> ---
>  block/file-posix.c   | 8 +++++++-
>  qapi/block-core.json | 7 +++++--
>  2 files changed, 12 insertions(+), 3 deletions(-)

Please squash this into the patch that adds zoned_host_device.

Stefan

