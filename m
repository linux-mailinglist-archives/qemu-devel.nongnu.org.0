Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CECAF344D6C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:34:31 +0100 (CET)
Received: from localhost ([::1]:43334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOORi-0007nZ-V4
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lOOOZ-0006FR-4K; Mon, 22 Mar 2021 13:31:15 -0400
Received: from mail-il1-f179.google.com ([209.85.166.179]:34344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lOOOX-0008Kh-FE; Mon, 22 Mar 2021 13:31:14 -0400
Received: by mail-il1-f179.google.com with SMTP id h1so15602713ilr.1;
 Mon, 22 Mar 2021 10:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o5H2f6ieU2jwZOl2UmRjOv3HmmdlCIi1nY621Y9V4LE=;
 b=cR9yCgXepHqyI+I5mYE8QbJzuY2433kijmppCGMm170jM7nHvwmiAexGTFkzT/GMQP
 32HR3z0QFGgQ/M7TWHx3JlTofhBSXsmZCkDlEPWCEIZo6u3c6yvVj/0mQ5ynRQ9Ap8QY
 MPjjyWM3ia+NwrXa1Hgz7yuuvX+6Z/3k1IGv4rbWnkRQCnw2ZU1qFUgAI8BSIon5yFyV
 yvnE0+ToJ6GsWvRVQ20dZ+/XdgjNw0bNRqZGQoNJGVH7h6qdP6sDj05c+o7nw373pCp3
 jBQvacGyUsFE0D23PZIjFkcAbZPwDzTYAfpu7Nfof4vYuYDyuj3NRkN+8rtyJTd0ZTAy
 M+cg==
X-Gm-Message-State: AOAM5331b7uZ75eSzxuNPkn3F7yoU3upACwmVnOqVvKBlhXslBal0J3E
 7IXQ0sfmRFB9btoE3RIgZ/SgFFQ9NWY=
X-Google-Smtp-Source: ABdhPJyH8TEfTmOduFWdRYOsRdG0vis66/FlWjmirJtdd5K1X7CXpAj0R9yN41I1v+881BiexFVMpw==
X-Received: by 2002:a92:d7c5:: with SMTP id g5mr922111ilq.140.1616434271726;
 Mon, 22 Mar 2021 10:31:11 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com.
 [209.85.166.54])
 by smtp.gmail.com with ESMTPSA id g6sm8267321ilj.28.2021.03.22.10.31.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 10:31:11 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id z136so14785425iof.10;
 Mon, 22 Mar 2021 10:31:11 -0700 (PDT)
X-Received: by 2002:a6b:f308:: with SMTP id m8mr655906ioh.193.1616434271212;
 Mon, 22 Mar 2021 10:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210315180341.31638-1-j@getutm.app>
 <20210315180341.31638-2-j@getutm.app>
In-Reply-To: <20210315180341.31638-2-j@getutm.app>
From: Joelle van Dyne <j@getutm.app>
Date: Mon, 22 Mar 2021 10:31:00 -0700
X-Gmail-Original-Message-ID: <CA+E+eSDn-qZWtf_j1WXAR24yoVx3DZjywJ_hmkK2CBFp-kUpwA@mail.gmail.com>
Message-ID: <CA+E+eSDn-qZWtf_j1WXAR24yoVx3DZjywJ_hmkK2CBFp-kUpwA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] block: feature detection for host block support
To: Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.179; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f179.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:raw" <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 11:03 AM Joelle van Dyne <j@getutm.app> wrote:
>
> On Darwin (iOS), there are no system level APIs for directly accessing
> host block devices. We detect this at configure time.
>
> Signed-off-by: Joelle van Dyne <j@getutm.app>

Hi all, this is the last patch in this set that has to be reviewed. I
was wondering if it's still possible to make it into 6.0? Thanks.

-j

