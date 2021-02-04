Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D4330F693
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:41:44 +0100 (CET)
Received: from localhost ([::1]:42568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7glM-0004e9-2M
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:41:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l7gjK-0002z1-PB
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:39:39 -0500
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:39693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l7gjI-0002No-Gi
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:39:38 -0500
Received: by mail-qk1-x72b.google.com with SMTP id k193so3676534qke.6
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 07:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=8dRvaSc9Uh45RSVu7qICElwHtzaDjeji0s5zzEd/+nw=;
 b=rT9wkmhoZdyYsBM4YUewMTKfyGp01nynx1nNiYWjoxlQ23ls0mmhJP3fBa1URvSXFA
 3mQ59LLNa5whTAeFJJQS8hK7jMGl7diAFyu7YUvh8T4+fXprG+8nZSsSk/ms5ww7hTQI
 W9hB52zTHOpAQV/+YKRv4AeA0McqY6HUiXueqy8BDFqEfJXt0aUzOXzh9zezJ/IJjG8f
 FYUlcBlEvnIZuUm4W8c0dOblh1gpbCuiy4aRz0tDp9d3Mp/3pP+2VajtTcOX/uXqaHBA
 bMpeIesXuOqNgOvAjgILh0dUVJpz5uERX0h7Nu+UB0csmB5HmQtoUrfWEI3+nXgUdm3p
 jM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=8dRvaSc9Uh45RSVu7qICElwHtzaDjeji0s5zzEd/+nw=;
 b=fkG0VBTmNkxbA/Rn0vuDpLBzi2HgqPoP3YZIwhSavPQQGyouV+ya8UoxNHeZi/Doif
 eeJ0iUaGYlOuS1SOUIl9W+OPnZ/TKGUPMcNwZudmrw80zk+2f+5YYYRgqhOH4aMOM8Hj
 oAQWWYwuHy84KqC7nmG5ZH4ySvHcAw2EVMIFkBYmCMIkMRlu3Fq8YXZYilq9giBZHCbT
 BLzRSsPt74KJ+mjM9O8BsAnPcKtxL3zysGk/VayPv9tuZXku+lltU4d/mVUPne7RexIp
 K2ASyT0R+9Dp8k8JuM6Fbmxx21aVCsjCr52vv1p43Qtpfzej2sxB5mRjRAjZCVnDFpf6
 mwcA==
X-Gm-Message-State: AOAM530Gmpgrc0nOfq+zkPUyFooJnaVp+d3ulhtBY/gRt7q72g73Sp2B
 dBNDwS1MGCadlhhOaOArYs0=
X-Google-Smtp-Source: ABdhPJy9wku7VS3LL0UtbHwXRIKcrQfTAb9k0Pq8/yb8Xgjl6l7nKcfOzcTyECp7wwne/iteVM7F0Q==
X-Received: by 2002:a37:8884:: with SMTP id k126mr7808540qkd.104.1612453174176; 
 Thu, 04 Feb 2021 07:39:34 -0800 (PST)
Received: from [192.168.0.16] (d149-67-30-58.try.wideopenwest.com.
 [67.149.58.30])
 by smtp.gmail.com with ESMTPSA id e5sm4995510qtp.86.2021.02.04.07.39.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Feb 2021 07:39:33 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH] Set icon for QEMU binary on Mac OS
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <2cdac45d-6a4d-dca1-4f32-2fc6b549f8d5@redhat.com>
Date: Thu, 4 Feb 2021 10:39:31 -0500
Content-Transfer-Encoding: 7bit
Message-Id: <158A523E-8E81-4E56-BE52-460034476E9B@gmail.com>
References: <20210202134410.9274-1-programmingkidx@gmail.com>
 <2cdac45d-6a4d-dca1-4f32-2fc6b549f8d5@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x72b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Feb 4, 2021, at 3:54 AM, Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
> On 02/02/21 14:44, John Arbuckle wrote:
>> Before switching the build system over to Meson, an icon was
>> added to the QEMU binary on Mac OS. This patch adds back that
>> feature.
>> Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
>> ---
>>  meson.build | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>> diff --git a/meson.build b/meson.build
>> index f00b7754fd..7f534f4e75 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -2183,6 +2183,26 @@ foreach target : target_dirs
>>                 link_args: link_args,
>>                 gui_app: exe['gui'])
>>  +# set QEMU's icon on Mac OS
>> +if targetos == 'darwin'
>> +    newiconpart1 = custom_target('Icon for ' + exe_name + ' - part 1',
>> +          depends : emulator,
>> +          input : emulator,
>> +          output : 'new icon for ' + exe_name + ' - 1',
>> +          command : ['Rez', '-append',
>> +           meson.source_root() + '/pc-bios/qemu.rsrc', '-o',
>> +           meson.current_build_dir() / exe['name']],
>> +          build_by_default : true)
>> +
>> +    custom_target('Icon for ' + exe_name + ' - part 2',
>> +          depends : newiconpart1,
>> +          input : emulator,
>> +          output : 'new icon for ' + exe_name + ' - 2',
>> +          command : ['SetFile', '-a', 'C',
>> +           meson.current_build_dir() / exe['name']],
>> +          build_by_default : true)
>> +endif
>> +
>>      if exe_sign
>>        emulators += {exe['name'] : custom_target(exe['name'],
>>                     install: true,
> 
> Maybe you can do it on install, using add_install_script instead?
> 
> Paolo

The script would only be two lines long:

    Rez -append ./pc-bios/qemu.rsrc -o $(QEMU_BINARY)
    SetFile -a C $(QEMU_BINARY)

Is a separate script file still preferred?


