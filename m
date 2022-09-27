Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC735EB6B2
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 03:14:15 +0200 (CEST)
Received: from localhost ([::1]:43422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oczAq-0004uZ-Q2
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 21:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ocz98-0003Dy-Ae
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 21:12:26 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:39648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ocz96-0001Un-SO
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 21:12:26 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-3487d84e477so86101807b3.6
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 18:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=MLGFYcYnB/Zwz+b6zg1E0HYHAxJMIFsN6KohI+GZhpI=;
 b=NPBKEKcRme1eLNqfr8tejPLQljzuSdGpzLa9QiTaN7yUu0TYhRf1ZXnqmM567+h53m
 9jKuEaLvP3u2TV96HguGOk2mm0/LKG66nU1ye7lfKTPYoAFS6+pscQY1gxVLBruqA9AT
 0rDaPB02vmk4wGyAm+bRHe+SK0BUsK93vB2WhURvqsD20hbdCJHKgU2uHcCKXjALh3U8
 /xIsyGGRVkFqG4OoSbwgw4hUFobzI9yUn2iW31pQgm+hGrA9k2D1f/87A6QmAAEaMU9Z
 6VLdyg1XNiWUX5WyiRhuNsWA9UGTbwRFAoFpSlVlEE7Xh2GysIGC0o7dIxeMSMy7ToVh
 ay2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=MLGFYcYnB/Zwz+b6zg1E0HYHAxJMIFsN6KohI+GZhpI=;
 b=RedxI/nTLZ30Eqzcd9BgO0DHa6doNTHief6ywHxJ3+eYDQ0jmUoRyiGhwcBy7pAeOU
 sYzGJ2kpXw88moIiGCzlqw8jhB27cXkoNK6hPZzGxsqzErh2WBE6m2E8Cae24QdEIo4t
 gAdATNE8/13QnqeZpkzhGsqipRvtMnpEd0SnlpnYiYrLFIKkp74jxveOCqQG/R+pldwK
 1+9CE6Q0YyaxlQl6V9+TolQ+74pu0Lk0fcxL2P1BZIj06J9fExOzSdu6jku7669+wTXw
 en8yLs5EgpnB9HsnLz21VGdk1HawTpHHGUkRhI9JVfrsTGfKz/LIN9oq/4jfTW4EiY/+
 fy1A==
X-Gm-Message-State: ACrzQf0UmEe2cbFg1/wu5z3Gt9tn26MvXlj7jEEObH1KO8qUgipQjSRX
 5VjWgkmVqH8RPmjIdwaC2f7Y41vBuCPdO4Plh0c=
X-Google-Smtp-Source: AMsMyM45a+PUoTTDbiDP/4b1EjEofXwFEHF3ZF80xcsk5ozHx+xxJAUGVZzBKVsjMVsUYsTibhq/B6RqKcya+g4kIpQ=
X-Received: by 2002:a81:1211:0:b0:350:b5ad:76bd with SMTP id
 17-20020a811211000000b00350b5ad76bdmr10231953yws.296.1664241143703; Mon, 26
 Sep 2022 18:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220926095509.3759409-1-kraxel@redhat.com>
In-Reply-To: <20220926095509.3759409-1-kraxel@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 26 Sep 2022 21:12:11 -0400
Message-ID: <CAJSP0QVdFTBbRQ1-eyuRj8ykJxLM6UMN0XUgMe966KgkE7CfEQ@mail.gmail.com>
Subject: Re: [PULL 00/25] Kraxel 20220926 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, 
 Laurent Vivier <lvivier@redhat.com>, Darren Kenny <darren.kenny@oracle.com>, 
 Qiuhao Li <Qiuhao.Li@outlook.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexandre Ratchov <alex@caoua.org>, Peter Maydell <peter.maydell@linaro.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,
I'm dropping this pull request because it breaks boot-serial-test for
ppc64-softmmu. See my reply to the "hcd-ohci: Fix inconsistency when
resetting ohci root hubs" patch for more info.

Stefan

