Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9FB57A422
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 18:23:17 +0200 (CEST)
Received: from localhost ([::1]:57500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDq0C-0004uY-EW
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 12:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDpym-000227-Bi
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 12:21:48 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:39847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDpyk-00050H-PR
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 12:21:48 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id r3so27383930ybr.6
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 09:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=veNRosRm6uWVvK2ouc5namEVkj6+Pr/ugmgpj+iXddk=;
 b=Kbt8B8BZHAUEeUW3Wa4AjPq454L6hy56R0i5qLRWcQJVTnaBIjxoqD8bzWFtcsQskE
 7dXStLIauzmzKu87oJuqWZ2v2RhWe1n5lt3KQOgiPWp6fqMt7A5chLKShMdmEkpKim8F
 ZR5zHZ2YHhpCeVs5Ags9yHAZShJp3Y3K7tJO4q/n7Fc9LxRKp6joemUKfJl+Ppe3i4qz
 5u+WCicZLCsxrv2VrKDvmot/6djBsET9OlWzTrtwf4oFcBZ4uQjRSmifZO3ZGgE1wx9z
 NLlGQ7kcz48nTEbd0vdRHwKCtWo5ImgsH71jOq8IHu+UxHpemeF3DpxDqAVSTD3aGGvc
 UNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=veNRosRm6uWVvK2ouc5namEVkj6+Pr/ugmgpj+iXddk=;
 b=gL09H00HqEt7Ibcu2AsN26dEonB/KKaKVsUzSmwQ2M2I524WbQ3gOV1oWitDdY7yLM
 yxxq3ZLXzOCMmYRdvD5WnBGjon0DGcTjMrgkO8daA0Za6cJXoqQrfzK0oyCl3xqLk+Cv
 To1+vSBXmcu7Q26B7H0poVdfjDmPTfJ0BrY/VHsNpstZQdONUYZCiQXciGWsRALIaVkp
 RBQgIIDfccSfEeDiOWa22magVYtvm3O1Lsp4Yco3dNMpy8SDbS9yRRqx0EFJFBaQAqxB
 2kzySMdl/7IwLfbAuFniqkDRTOwfn7DK2OvWJG/pMLulIogH2/bXVgPl81KyC+kpOakG
 VUqA==
X-Gm-Message-State: AJIora9BidKnozyBvlPRt1RFxeDCO1GchdqJwGGOQJqvZZGnhHP4BqH8
 R6z+tFuffmAketYz5MYTtoGntJJ5Rmu5+1tZKN1VbA==
X-Google-Smtp-Source: AGRyM1tCA75ebaD1T+ax20+nZAXzP0e6o+cwOQK0VICkMuYLOTDn6kvzfCfVlsU9rk228ZeYC9aIByRiMbnzQnCn1ms=
X-Received: by 2002:a25:2f58:0:b0:66e:cf9a:6a2 with SMTP id
 v85-20020a252f58000000b0066ecf9a06a2mr35860067ybv.193.1658247705614; Tue, 19
 Jul 2022 09:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210904213506.486886-1-mst@redhat.com>
 <20210904213506.486886-7-mst@redhat.com>
 <CAFEAcA9WBo2Kn9BPz1y2JCxpBGnBWDOtgLFiu31V4PL2m6b7bQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9WBo2Kn9BPz1y2JCxpBGnBWDOtgLFiu31V4PL2m6b7bQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jul 2022 17:21:34 +0100
Message-ID: <CAFEAcA__CW1dPW=BgpHgopWpyW6z7CqLQi1vsYgJkVsthJHqOQ@mail.gmail.com>
Subject: Re: [PULL 06/35] hw/acpi: refactor acpi hp modules so that targets
 can just use what they need
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jul 2022 at 17:12, Peter Maydell <peter.maydell@linaro.org> wrote:
> Hi; I'm trying to track down the fix for a bug that I think
> was introduced by this change. Specifically, if you
> configure with a target list of
>  '--target-list=mips-linux-user,mips64-linux-user,mipsel-linux-user,mipsn32-linux-user,mipsn32el-linux-user,mips-softmmu,mipsel-softmmu,mips64-softmmu,mips64el-softmmu'
>
> (ie "just mips"), then run 'make check', the iotest 267 fails
> because QEMU segfaults trying to do a VM save/restore on
> qemu-system-mips. (You can run just that iotest by cd'ing
> into the build dir's tests/qemu-iotests/ subdir and running
>   ./check -qcow2 -gdb 267

I mean just "./check -qcow2 267" here (the -gdb starts a
gdbserver, which is what I was doing while trying to debug.)

-- PMM

