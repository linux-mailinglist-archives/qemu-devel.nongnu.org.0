Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B67612C26
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 19:14:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opCnt-0002rw-2s; Sun, 30 Oct 2022 14:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opCnr-0002ri-AE; Sun, 30 Oct 2022 14:12:59 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opCnp-0005Ix-W9; Sun, 30 Oct 2022 14:12:59 -0400
Received: by mail-yb1-xb31.google.com with SMTP id z192so11573668yba.0;
 Sun, 30 Oct 2022 11:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7m7QPGiCP4S20D0BtAIqmAJC7Tsy8GJCqBiUeHUzM1c=;
 b=bNIbRwdqyFoWXlx9VdQMqsXJi4ZwRoXHFhbo8L3yuEmlB7W1vE4ntlbzJ8jRU78zVt
 oiTsD15qESfexMTv+VYcs3I6WMsHKxcQpRi3kgwhlG1Nu8/l/hxzFMkCqQCABJxdDgkP
 CMdZZQEl3uEj8i+agfO94xmyAmPz893p8WfWc3uSQYozvqhaqCZzrAWGGE87AG/SAmU+
 GwIqyWtj55q2B+ePALyhQPN3+e3bhC1y7eydBeIRFfOA3SqZ0fJv4rjr/4MirwTCM5Jq
 kT7el38wvzOslqxb66TLVFCB+nnb0JVEFVgKyheFkKH9l5U9ziRZUNHzoif1xDx/tB1Y
 B6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7m7QPGiCP4S20D0BtAIqmAJC7Tsy8GJCqBiUeHUzM1c=;
 b=JEEgZfeDCwTP/kg6fv9IDifYZsWpTf0GGh49Lsg0JTL/bJRGdkfgstEzU7X/fHhNXw
 cPHqhdAneKbstQpugCUm5WlZ8zSRfBVOOqbVWqF+7zgntXD7bwPvY8jm4uf8qzPGpmD5
 je8wCqmbIczjh2+NXMAMI0WW/W5NV+2s5Udrzz/D1rz7CJ56se7ncNN1Znzu0R6XpQRC
 7T5Z+CgvdXEOctc9d7niqV3yGEg80aRlgsuELFUB9s80P8XoCMeHbzme4v7gaASK5FNa
 j9ZkubJwaFOAEtvmfxyqTYGCne11f5R+KbQNr3htPLp8tX/8cW/HdxVUksgnqzFr7r23
 n4hw==
X-Gm-Message-State: ACrzQf0YIIV0aywxwQ55Xdzv+lswbFpFrcrh+i5j+GpaHUUAAhnAQmP8
 D6coEQ53BUG6QrLGeHqBb+k+9bQW03N02BaR8Uo=
X-Google-Smtp-Source: AMsMyM75OxelYxjo+H0TraL8+pSH7R2n6oIMeBXT8Uv0qDv24w8EzdViDy76GwZXKpiGybcdAijr3an3ik93B4n3v8M=
X-Received: by 2002:a05:6902:708:b0:6ca:a03f:fc7b with SMTP id
 k8-20020a056902070800b006caa03ffc7bmr9890849ybt.118.1667153575955; Sun, 30
 Oct 2022 11:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221029172515.217264-1-sw@weilnetz.de>
In-Reply-To: <20221029172515.217264-1-sw@weilnetz.de>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sun, 30 Oct 2022 14:12:44 -0400
Message-ID: <CAJSP0QVGbW2d0vJzikE4c56hro=GqeT4Zx5+d8P7PTzG9c_1hA@mail.gmail.com>
Subject: Re: [PATCH] Fix some typos in documentation and comments
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, virtio-fs@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb31.google.com
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

On Sat, 29 Oct 2022 at 13:27, Stefan Weil via <qemu-devel@nongnu.org> wrote:
>
> Most of them were found and fixed using codespell.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---

Aside from Peter's comments:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

