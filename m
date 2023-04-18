Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 459C36E5F12
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 12:42:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poilL-0002QJ-Ud; Tue, 18 Apr 2023 06:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@linaro.org>)
 id 1poilH-0002Pz-Qi
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 06:40:36 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@linaro.org>)
 id 1poilG-00073O-5N
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 06:40:35 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id l17so7692733qvq.10
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 03:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681814432; x=1684406432;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1RICzLqGpFj+6kc7Hxj72J4OAx4rtz4rv6vLbjoi2tI=;
 b=jJPlRB/Wj4evgVW0EOh7MAoCNYa6HYfquSX/tqp0drBaj5ss/3QIzEicL5xTImNmmW
 Hx60uylsvg4FG15AuQHX8ZQAAM7yZg3t884U4V3UWAG6mEVUFu2qGRQm2j4RMijfll8z
 LgXWnOqWcuIK6yqdZy8yzwNNvZKLI161X18mwnsRiz3dEE7GXESscm1W4ponU6ltUlvp
 e487QO0PMCsnR27pp4e6nDsvdJUR4vm0fqJiCpjM4V2M2KRN0+vqVPYJDl7lZbU6+d1A
 V/dkGNc7WmyeSsXxP3NRS4Nhw3qgh9Ed76IQ4K+gIDvQa5lz/a7c6IJ5/Qc3ysxfDw6n
 av0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681814432; x=1684406432;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1RICzLqGpFj+6kc7Hxj72J4OAx4rtz4rv6vLbjoi2tI=;
 b=VfHzkzY0uy+6YznxSv63jD3lwjYpqy4Px1BgfNNLUzYkxU5IrWJf+RNYak2vgdDzLM
 i/5nAdP5FdEfrXCxDyJwQNes4UfAXPJiXA/qVzZ0V2G6HsgbOiG6xq7U86h4Y9HV2SrU
 KGo/zOV8XorgXyCkzS5FYnb1wqGPy4R6Fzxd7iGV3O8SAER3nDEYwgghmnyK2uN6+8Nj
 LqXsRPVgL+jayKPzG23i+CIE+wwRICQu2JS07+2e9U4kEzKNnYLGiM7aouqHeZS1G4qN
 VZfgGUvVY2idH078LkLuUKXRPFY6v93la08Js1F52cTFmrftzi3Dl0KpEU9VoAxXQtZh
 /9/g==
X-Gm-Message-State: AAQBX9fbxQIv7M2Pr0Opb4tzrPg53uh73NSXJY7zxnw2tiNvCWbtjQHj
 zxZqTvNAWaiURj5O/lMiUyf7bmD5rJuB83P7s4Y7Jw==
X-Google-Smtp-Source: AKy350Z73E+UVOLSdcaZlZlGNZI85j5ghx52Ap7R83DyZk/Ctn8YFeYbh2x0TjQBhuqq7VxDhN6/mcJy0H4004Y91EM=
X-Received: by 2002:ad4:5ca2:0:b0:5ef:8b6e:5841 with SMTP id
 q2-20020ad45ca2000000b005ef8b6e5841mr6481997qvh.23.1681814432641; Tue, 18 Apr
 2023 03:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <calendar-8e6a5123-9421-4146-9451-985bdc6a55b9@google.com>
 <87r0sn8pul.fsf@secure.mitica>
In-Reply-To: <87r0sn8pul.fsf@secure.mitica>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Date: Tue, 18 Apr 2023 12:40:21 +0200
Message-ID: <CAPMQPELUHZOT5sAZVFcNrMaCvyQit+q1cCFpHYc33+qZWPp9TA@mail.gmail.com>
Subject: Re: QEMU developers fortnightly conference call for agenda for
 2023-04-18
To: quintela@redhat.com
Cc: afaerber@suse.de, juan.quintela@gmail.com, ale@rev.ng, anjo@rev.ng, 
 bazulay@redhat.com, bbauman@redhat.com, chao.p.peng@linux.intel.com, 
 cjia@nvidia.com, cw@f00f.org, david.edmondson@oracle.com, 
 Eric Northup <digitaleric@google.com>, dustin.kirkland@canonical.com,
 eblake@redhat.com, 
 edgar.iglesias@gmail.com, elena.ufimtseva@oracle.com, eric.auger@redhat.com, 
 f4bug@amsat.org, Felipe Franciosi <felipe.franciosi@nutanix.com>, 
 "iggy@theiggy.com" <iggy@kws1.com>, Warner Losh <wlosh@bsdimp.com>,
 jan.kiszka@web.de, jgg@nvidia.com, 
 jidong.xiao@gmail.com, jjherne@linux.vnet.ibm.com, joao.m.martins@oracle.com, 
 konrad.wilk@oracle.com, kvm@vger.kernel.org, mburton@qti.qualcomm.com, 
 mdean@redhat.com, mimu@linux.vnet.ibm.com, peter.maydell@linaro.org, 
 qemu-devel@nongnu.org, richard.henderson@linaro.org, 
 shameerali.kolothum.thodi@huawei.com, stefanha@gmail.com, 
 wei.w.wang@intel.com, z.huo@139.com, zwu.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=philippe.mathieu-daude@linaro.org; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Juan,

Sorry for the late reply, I won't be able to attend this afternoon's meeting.

Regards,

Phil.

On Thu, 13 Apr 2023 at 22:55, Juan Quintela <quintela@redhat.com> wrote:
>
>
> Hi
>
> Please, send any topic that you are interested in covering.
>
> [google calendar is very, very bad to compose messages, but getting
> everybody cc'd is very complicated otherwise]
>
>
> At the end of Monday I will send an email with the agenda or the
> cancellation of the call, so hurry up.
>
> After discussions on the QEMU Summit, we are going to have always open a
> QEMU call where you can add topics.
>
>  Call details:
>
> By popular demand, a google calendar public entry with it
>
>   https://calendar.google.com/calendar/event?action=TEMPLATE&tmeid=NWR0NWppODdqNXFyYzAwbzYza3RxN2dob3VfMjAyMjEwMThUMTMwMDAwWiBlZ2VkN2NraTA1bG11MXRuZ3ZrbDN0aGlkc0Bn&tmsrc=eged7cki05lmu1tngvkl3thids%40group.calendar.google.com&scp=ALL
>
> (Let me know if you have any problems with the calendar entry.  I just
> gave up about getting right at the same time CEST, CET, EDT and DST).
>
> If you want to be added to the invite, let me know.
>
> Thanks, Juan.
>
>

