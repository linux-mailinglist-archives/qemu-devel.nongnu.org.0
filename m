Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD414134E8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 15:57:38 +0200 (CEST)
Received: from localhost ([::1]:60968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSgHB-0008EI-Ci
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 09:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSgFl-0006TH-Ll
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 09:56:09 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSgFi-0001HJ-KK
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 09:56:09 -0400
Received: by mail-wr1-x433.google.com with SMTP id d6so39253339wrc.11
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 06:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d+YA9aBp3W+m+owbojgCvCPTz2XIifjjqNbMKvcy0nA=;
 b=prsWWCXgSSnCW+KKI5KpzJghnZL3o5i2kKnSsqhlN6VDdz65uZbB5zgg98BdGhLP5R
 DbelfvcyWsQcHDkxvZKLnYdlIRqoGg9VWzJCgN0QoWErkNXW591J404c3tNjfT7MIVWK
 BPeAoPaQB0x+z3y6K1/CWXo6oMqGzKF4UrxMkMI/LFapEa+VljAAKUU+meOMfKiexmHf
 37nDUEfif+dm4UqPehJvKLIamyg0vbRqSzMV0n3wL2ToxMg1tppxCgkivmxeEBr5901m
 4iRY1s2FTsmB8S4qj2HLIPuGkM5DpddemTDnt0x92mD0iQu6OUi3uiX/16ctYm/+ZkGv
 HJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d+YA9aBp3W+m+owbojgCvCPTz2XIifjjqNbMKvcy0nA=;
 b=tLoENFU1SA4wr88dcK2X5ScGcJ9LdsdBanT2ddGMPUmZl45GgIHLw4mJloAj9VkaSb
 TJp/imvsZvHXYKQPNLQM3Y705Zs7n6ffBIYvsHn6UwND0wKOfrblCslrpSN8zOLMAoQS
 KePyjMZpZ1d/7cL+t2ws5uibQkjeBd+d96rSUGxcgXHyRXJFAWYkzraJFuG3n32ZtChv
 ctcinC9L/LkAH0r9Q1ERXc8JBB+kjN5a9UTRyg334kgwESp83viESV9Y9SrzctRhvHiU
 YHLVlMpjT/K8OWcbGN3LhXHewwbu+HHrfLLhn2hDM1HmFsHCrU4hCeuclZb5lL4eNXrD
 nxcw==
X-Gm-Message-State: AOAM530gyricfQr7rCZ8Mf/Cu+CJ0LF865Pkiuqyar7K4NmklhuThSHp
 n5Xb0+/RfH7tEQ+ujJmec1LCpOpyUndnz3G9hZt/LA==
X-Google-Smtp-Source: ABdhPJy8QzMbVaLFx8meS6kBiBb65zZxDbo+A9iXdHAzrj3mU0iYiletban2nDlDDSzVO9dztD6OHws+kyWCSMKzMIU=
X-Received: by 2002:adf:f185:: with SMTP id h5mr35758638wro.302.1632232564840; 
 Tue, 21 Sep 2021 06:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <20210115130828.23968-22-alex.bennee@linaro.org>
 <540354a8-bcba-aa82-814d-7f11dc75f5bf@suse.de>
 <874kjdugip.fsf@linaro.org> <8cb88b76-caa3-ba26-b288-4d87b06f56ec@suse.de>
 <871regvs0w.fsf@linaro.org>
In-Reply-To: <871regvs0w.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Sep 2021 14:55:12 +0100
Message-ID: <CAFEAcA9FKA9k3ePEVALXnRcfd4ygybMrmpD=ZjV1A==at+w9Uw@mail.gmail.com>
Subject: Re: [PULL 21/30] target/arm: use official org.gnu.gdb.aarch64.sve
 layout for registers
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Luis Machado <luis.machado@linaro.org>, Claudio Fontana <cfontana@suse.de>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jan 2021 at 15:57, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Claudio Fontana <cfontana@suse.de> writes:
>
> > On 1/19/21 3:50 PM, Alex Benn=C3=A9e wrote:
> >>
> >> Claudio Fontana <cfontana@suse.de> writes:
> >>> qemu-system-aarch64: -gdb unix:path=3D/tmp/tmp9ru5tgk8qemu-gdbstub/gd=
bstub.socket,server: info: QEMU waiting for connection on: disconnected:uni=
x:/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server
> >>> warning: while parsing target description (at line 47): Vector "svevh=
f" references undefined type "ieee_half"
> >>> warning: Could not load XML target description; ignoring
> >>> qemu-system-aarch64: QEMU: Terminated via GDBstub
> >>>
> >>> Seems to indicate it is "ieee_half" -related?

> So it looks like TDESC_TYPE_IEEE_HALF was only implemented in GDB 9.1
> and there is no probing possible during the gdbstub connection. I guess
> I can either go back to stubbing it out (which would break gdb's SVE
> understanding) or up our minimum GDB version check for running tests.
> That would mean less people test GDB (or at least until the distros
> catch up) but considering it was zero people not too long ago maybe
> that's acceptable?

I just ran into this trying to connect qemu-aarch64 to the
Ubuntu gdb-multiarch. I don't care about SVE at all in this
case, but the 'max' CPU includes SVE by default, so we report
it to gdb even if the guest program being run doesn't use SVE at all.
This effectively means that usecases that used to work no longer do :-(

Luis: do we really have to report to gdb all the possible
data types that might be in SVE vector registers? Won't
gdb autogenerate pseudoregisters the way it does with
Neon d0..d31 ?

thanks
-- PMM

