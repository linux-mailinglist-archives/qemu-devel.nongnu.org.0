Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A2B2A49D6
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 16:32:44 +0100 (CET)
Received: from localhost ([::1]:39228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZyId-0007SE-W4
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 10:32:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kZyG5-0004n1-4n; Tue, 03 Nov 2020 10:30:05 -0500
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:40529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kZyG2-0008KI-30; Tue, 03 Nov 2020 10:30:04 -0500
Received: by mail-io1-xd44.google.com with SMTP id r9so18833327ioo.7;
 Tue, 03 Nov 2020 07:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TCDwhMe8HVpN0uRdBssuJDpHJfKY6ZBGhx1GuDZ4a5Q=;
 b=XKJVZf1bfj1Uk2Hm/ZagAo+m99ap7tnifnIe4RPg08NPeyb2k2DycgP7ExO7HGRy29
 fCeyYu8xXXuMJqTKD9A/T3abC48lijeFkzwawJaDKvc+GQmpoAMNbd1cAKnOtncNDzrz
 XV1M/HmW800mT+5WQQX9MI7oeWJBBV/IjVKw4U3i6umVzDBLWRYO1mv1xHo8ZEqin3JX
 GEOeS3PjXSG4tYmSKBq1atJvhpT2p2F1mFV+TC+DkP1Joz43jE3s9ocTNaWe3r1QIdyV
 rhfPic2YtB5um++2dNRwVXrEDGM0Ockha46/EhP9MNhcoe3RqTdcppPOLMcMccT9Hfoq
 Eyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TCDwhMe8HVpN0uRdBssuJDpHJfKY6ZBGhx1GuDZ4a5Q=;
 b=GjhTqbkTVt1L/BfLzjGR6vJtlCAP3idKvST13bgIozvf0U0kopiIF6f/oJE2Wiiprn
 5+gcOCNO/x+VR5bbgvAejDZ1fSUW9UOJ0YwT8wPdrGzComcnG1zKmhUeBLUaAVWPigmb
 pkPpXVpNtfCef14lt3/R8ngQpLwf3FuP2QQr8h5kxRoZhKZpfT1QZeVjE7e98lafqYhu
 8VTO7cKyZ5UuO4efsz5H7NCsQ/ocxeA4zeoUoatv67LrUUvAAbpfDgKFpnUk2FtTd69w
 CXe+ycS1L5YwG3Nvu0dbMVg1ZD+ekFYgyHXTcN9WWNvXMK+YRd2ZqkgJVdRuQLsabbT2
 0KYw==
X-Gm-Message-State: AOAM533mGxzshJwu/HS+XbhwMcK5jBRTvAwHb2IjUdaRQvzf5GlDWddU
 Nm7ekg11k8o58REa8ZCZ3QZr5vNjcHaxjhlK4Xs=
X-Google-Smtp-Source: ABdhPJxFSEVpTcVVsDVcsMhAVNG9D0EzVCce/Ih2lX+SCnVAyjU3CvuoWzPCZz0SzvTbArNuh1O8DJJ3eEFN8XTR2PU=
X-Received: by 2002:a05:6638:25cc:: with SMTP id
 u12mr16639365jat.26.1604417399784; 
 Tue, 03 Nov 2020 07:29:59 -0800 (PST)
MIME-Version: 1.0
References: <20201030004815.4172849-1-zhangxinhao1@huawei.com>
In-Reply-To: <20201030004815.4172849-1-zhangxinhao1@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 3 Nov 2020 07:18:03 -0800
Message-ID: <CAKmqyKObpCBAfKNu4OARgpWrbcC9c6m3oE78LQcFi+AgrDYy=w@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/csr.c : add space before the open
 parenthesis '('
To: Xinhao Zhang <zhangxinhao1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 alex.chen@huawei.com, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "dengkai \(A\)" <dengkai1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 29, 2020 at 5:56 PM Xinhao Zhang <zhangxinhao1@huawei.com> wrote:
>
> Fix code style. Space required before the open parenthesis '('.
>
> Signed-off-by: Xinhao Zhang <zhangxinhao1@huawei.com>
> Signed-off-by: Kai Deng <dengkai1@huawei.com>
> Reported-by: Euler Robot <euler.robot@huawei.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/csr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index aaef6c6f20..e8b149f0d2 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -881,7 +881,7 @@ static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
>          if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
>              return -RISCV_EXCP_ILLEGAL_INST;
>          } else {
> -            if((val ^ env->satp) & SATP_ASID) {
> +            if ((val ^ env->satp) & SATP_ASID) {
>                  tlb_flush(env_cpu(env));
>              }
>              env->satp = val;
> --
> 2.29.0-rc1
>
>

