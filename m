Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AA942997B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 00:38:33 +0200 (CEST)
Received: from localhost ([::1]:50330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma3wG-0004Xu-It
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 18:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1ma3u4-0003jS-5A
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 18:36:16 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1ma3tv-0003pY-W4
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 18:36:11 -0400
Received: by mail-ed1-x52f.google.com with SMTP id d9so49407803edh.5
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 15:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1EC75LqEEdnwDwEaLsECR6fcyA8jVw4MuIb5Rld9ATo=;
 b=Zf65jZlz59hY5HO4QAZKB1h6fJAlSKUw/K56do2XIqoNRamSIzUYM2/5pdGEObSuMQ
 OkIjJSqOIA4u4OEMJOgPIa6pu8n57Af+8uTFc2m29ZK1dMFmato5RANiqqynxYu0dK+A
 s+xTVFcVRt6XLZ44iAJfm0IxBoPfvbPntLV+Cg7cIoffwaEh3Db+5Uokwj54NWQqY9ld
 f4SPHpj/yrZCGCqe/ueUYiNdQMXa4d4qL+pVCS6hrku4Mz/LP+WUttRATILI7T+9DYJp
 Dk8TO1xRSLKpE0vTOeMhTxWlx9bgjPbW2xnlyuOIPm14vkF4vrxXdIDy7dx+AV3mB1Ij
 03ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1EC75LqEEdnwDwEaLsECR6fcyA8jVw4MuIb5Rld9ATo=;
 b=PVwLwx1RhejHGB2ak5dYGd5JiWF97JD41oe62U9I11et5CJAXNa0P7zc91PWCjeTB7
 or59ZCdKIXEMb0Q0dt7rynr4PMkoTn5Wj8JxlQgQKwOjP3iNPLPI/KFZP9cc6ShHziUQ
 L2Zs53cGBzRz9YbiKbAC2rvaaqOihPx+5oT+kkNvmiJ7Cfl4j5+nf/0dR48+WAW61SnK
 rSYHz3OeIhFcBzi1f9IoqHqpQ7ZznFhSTN/OUi1CjL7SvKcXUsCnPb2pnWmrBg2Yangx
 THV8u+C+wsrmkKIGFV6IgyrF+8ovaPsuNsHufQdO/byNNlDRAL2HxpbAK6Fo3p+5qIob
 R3Eg==
X-Gm-Message-State: AOAM5331Oaf01PJLaQp/sWUON7pasMdSOfsXdLcvp6d82qABgdRl/xlZ
 O+t2pXgqQ1tjN5sQsf3Mi0NbXcA99GkxXPm8brA=
X-Google-Smtp-Source: ABdhPJw976ljEzhWGC1/eHmDJ9n2bEyXjQdfTuqktshX6Z1bVGoyk7svWxnjtDdDw0R+ygCtnH2zZ8k0YNuzBK6OuVc=
X-Received: by 2002:a17:906:1f49:: with SMTP id
 d9mr28659844ejk.150.1633991763767; 
 Mon, 11 Oct 2021 15:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211009152401.2982862-1-armbru@redhat.com>
In-Reply-To: <20211009152401.2982862-1-armbru@redhat.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 11 Oct 2021 15:35:52 -0700
Message-ID: <CAMo8BfJPEYRS-MYBEXX2raNfjaH13qy+jG76LAK+vE+efH4+yA@mail.gmail.com>
Subject: Re: [PATCH] Trim some trailing space from human-readable output
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Greg Kurz <groug@kaod.org>, David Hildenbrand <david@redhat.com>,
 jiri@resnulli.us, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Oct 9, 2021 at 8:24 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> I noticed -cpu help printing enough trailing spaces to make the output
> at least 84 characters wide.  Looks ugly unless the terminal is wider.
> Ugly or not, trailing spaces are stupid.
>
> The culprit is this line in x86_cpu_list_entry():
>
>     qemu_printf("x86 %-20s  %-58s\n", name, desc);
>
> This prints a string with minimum field left-justified right before a
> newline.  Change it to
>
>     qemu_printf("x86 %-20s  %s\n", name, desc);
>
> which avoids the trailing spaces and is simpler to boot.
>
> A search for the pattern with "git-grep -E '%-[0-9]+s\\n'" found a few
> more instances.  Change them similarly.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  monitor/hmp-cmds.c         | 2 +-
>  target/i386/cpu-dump.c     | 4 ++--
>  target/i386/cpu.c          | 2 +-
>  target/ppc/cpu_init.c      | 2 +-
>  target/s390x/cpu_models.c  | 4 ++--
>  target/xtensa/mmu_helper.c | 2 +-
>  6 files changed, 8 insertions(+), 8 deletions(-)

For target/xtensa:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max

