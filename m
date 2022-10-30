Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23634612C65
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 20:17:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opDnj-0007XF-IB; Sun, 30 Oct 2022 15:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opDnh-0007VI-N7; Sun, 30 Oct 2022 15:16:53 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opDnV-0004p1-9d; Sun, 30 Oct 2022 15:16:52 -0400
Received: by mail-yb1-xb31.google.com with SMTP id 63so11633043ybq.4;
 Sun, 30 Oct 2022 12:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SVlX3bschjaxg7+rxeu8U6Bx2sG2wAxet/mu3wFiess=;
 b=FsR8uq45J70NUaVkmP7Y9QV+vi+TQgUvLc9z9rX6EGNZ5T3nKD7GF7XS2EpJgmIgfc
 HROE9ssx7ZtVk/VNgkd3oUDL9Rp+JTb6+GjxPRdAwqE/cbGSizJYbz1lrHg46f0JoFwT
 TaX/WC62fDq6J8M+6XHw8DjPIAlsZJxpkxswjCyW+iqY5+kp1DzaqtVYlcP+OVy8NE4e
 RREQcvGCOCXoE6t2PmWgtgr65JFwnZTd6XajzTqPruMNs2Y8iPtvmDwZCPxV7rpNioFS
 hqQYO1VpRthCbzF8cwNUySe3VmopzHH8Tx8tIbGEKuL+Cp4ENMTp+523JtJ2WZt3jlD7
 qQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SVlX3bschjaxg7+rxeu8U6Bx2sG2wAxet/mu3wFiess=;
 b=6zpE1HQ65x5J2H3fo0run1wP4XI9eFA8HetM9bzipdNKq3EspEJ3l1oIVwrnzfqt60
 OJJLEMJumIfd+flC5n69FP5lemuVQ3ZQKcdiW14VsSA80A3HYHKmktI37S28T+R4KXvJ
 MWMj1lsn0hL/Es0A8kE4IpfhMo92JDQPHq4wojnQD46ryljBIh3kmQv3+NLeQd1k8PLW
 jLIW+G3R13XYqaT98DUgyWztK1xv93+8e6R4E44nBM0SFgOaLIM0GhASQEMES1sak590
 0O1vXelp+m0HZx6gos1dOW0tlCVUQgX7YH01wK/3YQY+GXTHig9o8xitdsxILOAraA3G
 Ilcw==
X-Gm-Message-State: ACrzQf3jUdpIz3TbLuvIdvY1ez7FITPiFcqIW7iqqkPOfr1LJWElW+wm
 9btjgX/B2sqQYowhvlo25PivjgQ5k5PmapHfHds=
X-Google-Smtp-Source: AMsMyM6j6Xs2KIYybtwwNDIff3d2zyPm11SHK38F1WHmVs78mq+OA4LVF4M19wHFQPEfcLbkzMCwZ2vxBkDs2kV14ZU=
X-Received: by 2002:a25:1e89:0:b0:6bf:9e55:5cb4 with SMTP id
 e131-20020a251e89000000b006bf9e555cb4mr9549748ybe.642.1667157399735; Sun, 30
 Oct 2022 12:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221027183146.463129-1-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sun, 30 Oct 2022 15:16:28 -0400
Message-ID: <CAJSP0QUQE6KQ1U8_0r9vPxKkrzhF4v3GdfHACJUd0mc8CTdqRw@mail.gmail.com>
Subject: Re: [PULL 00/58] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, stefanha@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 27 Oct 2022 at 14:33, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 344744e148e6e865f5a57e745b02a87e5ea534ad:
>
>   Merge tag 'dump-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2022-10-26 10:53:49 -0400)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream

Please update the URL to https. Unencrypted git:// has fallen out of
use and is slightly less secure (e.g. if someone quickly applies your
pull request for testing and forgets to verify the tag's GPG
signature).

Stefan

