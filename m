Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F2B336A68
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 04:08:22 +0100 (CET)
Received: from localhost ([::1]:42310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKBgT-0003FC-A5
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 22:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKBdn-0001UH-Hm; Wed, 10 Mar 2021 22:05:35 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:42428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKBdf-0004mI-Le; Wed, 10 Mar 2021 22:05:35 -0500
Received: by mail-yb1-xb36.google.com with SMTP id n195so20165895ybg.9;
 Wed, 10 Mar 2021 19:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2r5S5PwM6+wslmT1E31QgG/o3dP8qssREmDbwWspNfM=;
 b=o1S6AqWFQq0GosXk3fc5qSQ39wmbL88K9P+eyuQami3rRyPpYeJhhtZSkwAGNfWCGq
 qGOYc8O5LcvcmszHDehNiWiXGv95rmkU1PiQG2QAXc2VvzFX/fK4nbsyGH0z0RICC4Pr
 lEbDGRLrcxNUbtaH83uEvIgW46WBjitKsP84l8YFn08GMRxzkS/UHfZUWAP+Yvaw4rCF
 /TlhFRygnKsp1KvyMEwOQF8xfv77zEqZgfVc5MNofPNtY3E9LyzC+NP6tZqXzQuE337y
 uPFOIqV8k2k1VHbTATlsWtHOq4I1PQC3JOhTT0OznO3meK4L9gRm/40y8ITU6yTR2lDN
 h8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2r5S5PwM6+wslmT1E31QgG/o3dP8qssREmDbwWspNfM=;
 b=PRGkSvT7MFPITwhBkZeRdug08+oc/AXSr2kQjiqTPtIBml5ZfUkYbH/mafQ2h1ApdH
 LLtkMu/vU29QcoGVQfyHvLgd2KOZj6+b/xHD8yIkJqxTEisnB+7cKNrYGqiWpb/UM9vu
 Sw6yDTk5UdF1oPyMZ9cnsbSRPcwGg0ehdtumrbKna1DDHLn4MI0daSsK3iazJ+5oLh2w
 AzFMvVqo00jTVOZc5QELpyMwWIzRu7p6v1oiVjRAq2B14cb3ERds76Ry9FHupqIY3FiF
 uvgspUTEri/vX1vQqnO7suZLB9iSqfoI2XLngfiuuXgB64bJmzDv8YJC68fStCTXBxfj
 klPA==
X-Gm-Message-State: AOAM531citOUe0UIgSVSdP21n9ZCtahozZG+tWyOamZWjmiV0yXNnVoI
 Udj5giq9hwBEZsNZlPnh8EUhc7XimaMTfQyzhpE=
X-Google-Smtp-Source: ABdhPJxX6QBUG0aL7F5+ksbVDei7fvhzq+26yK86nACjGA6MMGOjkSjo6w1lazYlhhcjAINuHT+ro1wLpMvLgacvX04=
X-Received: by 2002:a5b:147:: with SMTP id c7mr8747140ybp.332.1615431925210;
 Wed, 10 Mar 2021 19:05:25 -0800 (PST)
MIME-Version: 1.0
References: <20210310170528.1184868-1-philmd@redhat.com>
 <20210310170528.1184868-12-philmd@redhat.com>
In-Reply-To: <20210310170528.1184868-12-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 11 Mar 2021 11:05:13 +0800
Message-ID: <CAEUhbmVdKrepSRo4ZtR0gi=uH+T9oRKHHDVXfGakR7w_yK+Sdw@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] hw/block/pflash_cfi01: Correct the type of
 PFlashCFI01.ro
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 1:28 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> From: David Edmondson <david.edmondson@oracle.com>
>
> PFlashCFI01.ro is a bool, declare it as such.
>
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Message-Id: <20210216142721.1985543-3-david.edmondson@oracle.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/block/pflash_cfi01.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

