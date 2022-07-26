Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCE35813BB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 15:01:37 +0200 (CEST)
Received: from localhost ([::1]:40390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGKBs-000196-80
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 09:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGK6L-0005Io-7z
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 08:55:56 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:41861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGK6J-0006Z5-Hu
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 08:55:52 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id 6so25116298ybc.8
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 05:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QG13wto3iMHroDD8BZ6bjMdwyCMa8mGjxQBbHVCJM+o=;
 b=gwS3xJ8h6RRVPeQ3pFQ/aSKbZ9OJDxhNaAHSDD0gZKxFjyc7zmjQgZMLCdV+bvD+Fq
 KirNVXvbKZQ62iJ6pV/s0UmyIy3EOnSxM1Q9Ze1o2O27lnWp5CWPE1SVOdxR8h30Ebp3
 YGhgmxUng9wywcwT8Hez+as4MQZAqu+hInl7bRWoEkVbalvyUZqVVT2N2QzKBym69hFH
 opM4xo2W0qgFS2elHTdxLey5c1Uxl55YBC7jX+haQLlMB/Wzuj0mvr+80JC6ybFyWlK7
 rFXVfDTftPPuWeFy2450xlN7uASRuHGZCZG9ZdvRJbNl0TvM61mE6lqJs7ZIkNSl+uP0
 sPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QG13wto3iMHroDD8BZ6bjMdwyCMa8mGjxQBbHVCJM+o=;
 b=ZrMz4crDqIZJyEp5e9TfXdcC5Gp/cGivpvvf4NCG/uVsEWUxlLxPhycR2Cg5PPTNcT
 z4AgrB7Sm5CjGfx+OLcZcQYsvAvJmth6OY+7q0eMN8e29ELJShz1A9Tvgzq8xmhTW5JU
 vcgtrgHEpkYY5a/urMvnubziYdt5ca7yQXQdJquoeRwTVR+pUMMJCU7Nnd5IqixiQcsK
 b0axTf8BH0NrMP10Sd4kzfx6DOf1DYlWufFfhWOof0Wrom0H7Yl1aiF00wjWhb+Rxx6W
 anDPDJcAKFefCOpBfP94lFiZcz7C3AnNn5s27LWmYvX7bpWcbcFecMK8A+AbOCROu3KA
 p/TA==
X-Gm-Message-State: AJIora+ukOVFu7Po097nDIPOGGkCvpxKyYlf+zmoss4N1WnGNlP1vEZg
 Zdm8yaxRbHCeUxzmdA4tM9UR1WApI2u54/DZess=
X-Google-Smtp-Source: AGRyM1ssEevzzPKy7C5XYw79CYhJHd3wKRDd5dF86u6UcOTpXO86ftkdgDj+fcQfaqJRraQnpm2S0HGjrgj5ka3fHds=
X-Received: by 2002:a25:8044:0:b0:671:7972:4cd8 with SMTP id
 a4-20020a258044000000b0067179724cd8mr1196752ybn.209.1658840150405; Tue, 26
 Jul 2022 05:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <4f2c71a4-609e-6880-04d0-2eb127c55023@linux.dev>
In-Reply-To: <4f2c71a4-609e-6880-04d0-2eb127c55023@linux.dev>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 26 Jul 2022 08:55:38 -0400
Message-ID: <CAJSP0QUzd7GXK0XN7YBBfEqO6abQSZMdJzW8pEHnz-ZnGetUWA@mail.gmail.com>
Subject: Re: Question about performance comparison between virtio-fs and
 virtio-blk
To: Hao Xu <hao.xu@linux.dev>
Cc: qemu-devel <qemu-devel@nongnu.org>, virtio-fs@redhat.com, 
 Vivek Goyal <vgoyal@redhat.com>
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

On Tue, 26 Jul 2022 at 08:24, Hao Xu <hao.xu@linux.dev> wrote:
> I watched your presentation about virtiofs in 2020,
>
> https://www.youtube.com/watch?v=EIVOzTsGMMI&t=232s
>
> which is really helpful to me, but I have a question about the graph at
> 3:53, could you give
>
> me more info about the test, like what tool you use for the test, if
> it's fio, what is the parameters.
>
> I used fio to do randread test in a qemu box, but turns out the iops of
> virtio-blk and virtio-fs are similar.

I have CCed Vivek Goyal, who has done more virtiofs benchmarking and
might have ideas to share.

The benchmarking tool was fio with the stated blocksize and I/O
pattern. The benchmark was probably run with direct=1. Based on the
virtio-blk numbers I think iodepth was greater than 1 but I don't have
the exact fio job parameters.

Stefan

