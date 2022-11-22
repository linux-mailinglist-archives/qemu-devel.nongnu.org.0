Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CADA633E28
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 14:54:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxTi6-0004nQ-H2; Tue, 22 Nov 2022 08:53:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxTi4-0004lp-U0
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 08:53:12 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxTi3-0007mU-FZ
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 08:53:12 -0500
Received: by mail-pf1-x42c.google.com with SMTP id b185so14415762pfb.9
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 05:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xbzPrvxw2h7QjvfNhdzgLlnm6lp5QdzEPwm67XjpXOk=;
 b=KzxzDmjt3znUwalezP3CogqSzCZmmSdieXsuEUbDMNJQ9BxfDXUwc+Jjh1RAQGzk0D
 M7x9r/SjnqM10pYpZuCABWbQ7V1g5C6osSxkT6Br6avxn8juEptKc8jM4Zvy97pWqkze
 a8IhFy6/udMHHmWkgjN3UJLA59FPoimJ6EvSnpSku0EgcjhXX5wga4zyoA5osPg4IxXg
 wVpMsJvg3h7CXeilGTVRazsQaWbmJ5LcklLQYwA14AMp07Y8iYKTwh29nF/HOjAPjHse
 OWfDTIDIxGNoLOhSEHOa0Kb9Q07dZKa6Ol7dw0NPlaAlaBB7hX9CWrCoZ9w5z7seAnKb
 m/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xbzPrvxw2h7QjvfNhdzgLlnm6lp5QdzEPwm67XjpXOk=;
 b=lkpvQsgDCwY34r0mUbEg9kE20MunThB32bE0179EvoOsSvcVyu2CxlEXFHalGPWRJR
 ZLJW7aPmNlX0XjCULCt+LxmbKVc33ToZrBVNXE/eZnhYyjSzvHn87RZigo3fa1aM5oxS
 XcscDeWK8QNwhA4zFcyjhaXDmNbVQvls0gkaPRMVqDoCQiMn8Qy+WQxklYS/vUQ+tWcF
 Ww95ftSs51DkDDibsjdvcmxKKxf7c9gUOcUHGZQ3iAePYmpr8pqiUm41+cJdeEy3MVQk
 LCpvIKqAhorAFAJzaLef2CwKhO7cDE1nIzbn2a0r00nnBreL6yl90/6rDfhfv/OZxEcc
 d4WA==
X-Gm-Message-State: ANoB5pnRQTnAIv5WHdG97ywshePREHLeomxWwJ2GpAsUvCuP7zQy3bp5
 lrkxNB76jeq5ZPXuIwB5h+lzp3MLxTEi6qu6rcsIfA==
X-Google-Smtp-Source: AA0mqf7uJDc+t9e/Y08ngYG7hQOTu/YyRZ31RjOkHgWurRwDrL3TW4R1LORRfIhY9ViEUKgriEVWGpoXxo8XruhtkAA=
X-Received: by 2002:a62:5f81:0:b0:56b:bb06:7dd5 with SMTP id
 t123-20020a625f81000000b0056bbb067dd5mr4639210pfb.3.1669125189925; Tue, 22
 Nov 2022 05:53:09 -0800 (PST)
MIME-Version: 1.0
References: <20221122134917.1217307-1-armbru@redhat.com>
 <20221122134917.1217307-3-armbru@redhat.com>
In-Reply-To: <20221122134917.1217307-3-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 13:52:58 +0000
Message-ID: <CAFEAcA9q=zAL-PrpRpmpv-4wyobdbFGLzYeWdjvkDoSQLwktOw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] block/vmdk: Simplify vmdk_co_create() to return
 directly
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, groug@kaod.org, qemu_oss@crudebyte.com, 
 Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com, 
 marcandre.lureau@redhat.com, pbonzini@redhat.com, yuval.shaia.ml@gmail.com, 
 marcel.apfelbaum@gmail.com, mst@redhat.com, quintela@redhat.com, 
 dgilbert@redhat.com, pavel.dovgaluk@ispras.ru, alex.bennee@linaro.org, 
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mrolnik@gmail.com, 
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, aurelien@aurel32.net, 
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com, berrange@redhat.com, 
 thuth@redhat.com, lvivier@redhat.com, suhang16@mails.ucas.ac.cn, 
 chen.zhang@intel.com, lizhijian@fujitsu.com, stefanha@redhat.com, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, virtio-fs@redhat.com, 
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 22 Nov 2022 at 13:51, Markus Armbruster <armbru@redhat.com> wrote:
>
> Cc: Fam Zheng <fam@euphon.net>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Hanna Reitz <hreitz@redhat.com>
> Cc: qemu-block@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  block/vmdk.c | 28 +++++++++++-----------------
>  1 file changed, 11 insertions(+), 17 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

