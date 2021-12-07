Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AE946BAEC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 13:18:25 +0100 (CET)
Received: from localhost ([::1]:39862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muZQO-0007Ws-8E
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 07:18:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1muZPE-0006pq-BC
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 07:17:12 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=34671
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1muZPC-0006wo-Az
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 07:17:12 -0500
Received: by mail-io1-xd2f.google.com with SMTP id e128so16870217iof.1
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 04:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R/lrjjEyNCeDh2CfCXhyBjt9comdGtAPX2a2aT5mcFs=;
 b=PouA9TvLIcyqEp+6HHOu2kCR9j71fV1PiyrAgTtYrIbMqkl8oj8eMjvuuacVjUj/ag
 CSKxKJd4rl/8Bgjjc4UyE7un74jZrP4dToVHvpx5ye4eNp35NJsSDdRVGVkRQZwQCAay
 u1bmWEWzpYT5/YYdgFlUUglBmmmln0jqaVrfS7b8FntBR3QS3DYKebN6ZBZthDGT3g3N
 T6BfLyo2jxUzovVFwMkhuxDXVaYeq+v+eTYlzZxDECNj8khECPOhxuBgBgDZLmiSBSGH
 xAQ9e3U9I5HX19emyzY+hfcMvHd+th3ejGurRfcs8/jnKKJUc3cGt2wEIE63FqivCFJL
 sJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R/lrjjEyNCeDh2CfCXhyBjt9comdGtAPX2a2aT5mcFs=;
 b=sL0oMWIB2llIkFOXKUEIiZIfSdW2H4LA3XPGk3/Cz+OmxF3RFk9+jQv1sRWb9bqyeu
 f0NL/kt4yiRr4bxUdykGs7FIlhsz0WjiweYROf6H8t0FLAc7U/cHvC245xNvGxCMjiXZ
 5sEV0IpGaumdtCgFMNmFDnm7pG6vE0sIYIJpMMCumT6+tiuOzcOaYVdhg3RJW9Qetnkt
 FnG435zZM3JIRSubwosZ3XlbZ+iVHz9rCdMPTiNK3RLeLA/+Ji4XrDkbHzD2VNVeBjhs
 R/M3tFm38XID7iaXMhiy2Yv5vKAOAiy8khW71TqpbnJkEPVZrNE1V23xAV6EvGAFtcW9
 iamw==
X-Gm-Message-State: AOAM533Pj6vIGai8xfkoSG0jqSz3SXw+HUPe88Gx8IDtlSNbEyg7tKI9
 nqiPQYeFQjTj7yIe+UigCEIoZz1XXXpUmx8u/JM=
X-Google-Smtp-Source: ABdhPJz6zbyDDQYsWBJbQSTjJ+lttHOp9V/kSMBcMKzsyIz9TjzdE3HyOMNW+yEEScTJU7HVA6KmQFd7uKuA3WGt/Xk=
X-Received: by 2002:a6b:ea0a:: with SMTP id m10mr38892947ioc.91.1638879428749; 
 Tue, 07 Dec 2021 04:17:08 -0800 (PST)
MIME-Version: 1.0
References: <87mtldlwrq.fsf@dusky.pond.sub.org>
In-Reply-To: <87mtldlwrq.fsf@dusky.pond.sub.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 7 Dec 2021 22:16:41 +1000
Message-ID: <CAKmqyKPACG6ebVfDCLkA_zorkW2ySFQ_tNYW2vDj6QyOZdDqoQ@mail.gmail.com>
Subject: Re: Bad error handling in machine sifive-u
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 6, 2021 at 11:15 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Watch this:
>
>     $ ../qemu/bld/qemu-system-riscv64 -M sifive_u -S -monitor stdio -display none -drive if=pflash
>     QEMU 6.1.93 monitor - type 'help' for more information
>     (qemu) Unexpected error in sifive_u_otp_realize() at ../hw/misc/sifive_u_otp.c:229:
>     qemu-system-riscv64: OTP drive size < 16K
>     Aborted (core dumped)
>
> sifive_u_machine_init() calls
>
>     qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
>
> My reproducer demonstrates that passing &error_abort is wrong: this
> realize can fail.
>
> &error_fatal should do here.

Thanks for pointing this out. I'll work on a patch to fix this up.

Alistair

>
> Please check the other uses of &error_abort in this machine for similar
> misuse.
>
>

