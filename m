Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF525EAC99
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 18:33:33 +0200 (CEST)
Received: from localhost ([::1]:59138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocr2x-00074B-PO
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 12:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocqIJ-0002Wn-Kg
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:45:25 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:40670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocqIH-00081Q-II
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:45:18 -0400
Received: by mail-ej1-x632.google.com with SMTP id l14so14973070eja.7
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 08:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=+vNYGgenJsuZ/wV50s5UXKcM8Ou+iERgQnCiO2C40SQ=;
 b=y9oRn0x4rmKT1czXiU5qrSvqIUudCclgW5rMywGmCdRg4RPbLqIhTq/RtqZSzZ321O
 xhAGKJ5HP49/b6LVHCiEZNlCAj1ea56yiLWSkb0nJoEzJbETmn8dGD7ClvNauicNWFy0
 3NgUefG9rbJzCK9IvgjIkuL6ceDC8DCDDWLQRaVuGxyodWEiMG92YVdzFFr6NIsI9dsX
 u8Cvisa7jZ6oGk87sz9zFu8QVG0kM1XAP7pwbtjkRIL3OMYUYxKFLQURKAzRGNtqE6pz
 1z8NH7rHkVlqq0/MRCvq9QxGpv3wU96OncK3d+AFlfNlYR8eqKIw5rRPooP1ngATVOJx
 3ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+vNYGgenJsuZ/wV50s5UXKcM8Ou+iERgQnCiO2C40SQ=;
 b=PQ+7+Z+GkhfVJeTz95OrgO9QHgCEG7ixvnYRgV5/9a/BCiWSCKWurtDW8xLuhjp9ws
 ucxpeVZVBpMP3I1VtLc4vZOLwBxKldL5fFYcXD019PgpSteeYxX544uFWaIDcz/H48d+
 sWxLSMfyVBM4ukM6/Xq1G64IyAJyzR6fSDY320xIRYwiLf3y1ZbfGrWWi5txS+JcPCXd
 inpfC87rWa/HpLy75qInBSUEPaPwIETZTHJThteos3PTZBkEzxhRURV72wZOhsNqfDCD
 j/imgzF7JnhYbxnYcUfEUnBuo/5WNuqvK/HVXjz6TzuNh1phtK4dZwGUO7l2P7Wn5TRp
 Ra+Q==
X-Gm-Message-State: ACrzQf1y76A6YnN0orAsBrjpNed6V7j5Sp0k8K6ANch3MME5Z13/aSHU
 kx8A6sfQFOSQhaUMQrFE/q5KgYI0cC9u6S8Il/TwVA==
X-Google-Smtp-Source: AMsMyM4zlT1rFw0ahT72yH4tYlRuB2ktmveb8ICcp/oZPtHEsBL/oUrnAhuHY0CXbaJBreqpGRg2kBma6amvs0CI2FQ=
X-Received: by 2002:a17:907:724b:b0:782:f2bb:24d3 with SMTP id
 ds11-20020a170907724b00b00782f2bb24d3mr10696682ejc.555.1664207115961; Mon, 26
 Sep 2022 08:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-6-alex.bennee@linaro.org>
 <CAFEAcA_u8TQW5EoX5bBZGKhhaS6PYaYZGyqMrhB1Tsa6eTXCyQ@mail.gmail.com>
 <87leq641id.fsf@linaro.org>
 <CAFEAcA8D_SzU35DB-RvaegYkwkJHD0Y3stx7P=Jh=QC6LOqDZA@mail.gmail.com>
 <874jwu3zwr.fsf@linaro.org>
In-Reply-To: <874jwu3zwr.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Sep 2022 16:45:04 +0100
Message-ID: <CAFEAcA-SGDR0mFZzBoCXHthf00PemTCafETd-VfQijXhifBqzQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] hw/intc/gic: use MxTxAttrs to divine accessing
 CPU
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk, 
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Sept 2022 at 16:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Mon, 26 Sept 2022 at 16:08, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
> >> Peter Maydell <peter.maydell@linaro.org> writes:
> >> > On Mon, 26 Sept 2022 at 14:39, Alex Benn=C3=A9e <alex.bennee@linaro.=
org> wrote:
> >> >> -static inline int gic_get_current_cpu(GICState *s)
> >> >> +static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attr=
s)
> >> >>  {
> >> >> -    if (!qtest_enabled() && s->num_cpu > 1) {
> >> >> -        return current_cpu->cpu_index;
> >> >> -    }
> >> >> -    return 0;
> >> >> +    /*
> >> >> +     * Something other than a CPU accessing the GIC would be a bug=
 as
> >> >> +     * would a CPU index higher than the GICState expects to be
> >> >> +     * handling
> >> >> +     */
> >> >> +    g_assert(attrs.requester_type =3D=3D MEMTXATTRS_CPU);
> >> >> +    g_assert(attrs.requester_id < s->num_cpu);
> >> >
> >> > Would it be a QEMU bug, or a guest code bug ? If it's possible
> >> > for the guest to mis-program a DMA controller to do a read that
> >> > goes through this function, we shouldn't assert. (Whether that
> >> > can happen will depend on how the board/SoC code puts together
> >> > the MemoryRegion hierarchy, I think.)
> >>
> >> Most likely a QEMU bug - how would a DMA master even access the GIC?
> >
> > If it's mapped into the system address space, the same way
> > as it does any memory access. For instance on the virt board
> > we just map the distributor MemoryRegion straight into the
> > system address space, and any DMA master can talk to it.
> > This is of course not how the hardware really works (where
> > the GIC is part of the CPU itself), but, as noted in previous
> > threads, up-ending the MemoryRegion handling in order to be
> > able to put the GIC only in the address space(s) that the CPU
> > sees would be a lot of work, which is why we didn't try to
> > solve the "how do you figure out which CPU is writing to the
> > GIC" problem that way.
>
> So hw_error?

That's just an assert by another name, and isn't any better.

> I don't think there is a way we can safely continue unless we just want
> to fallback to "it was vCPU 0 what did it".

You can do that, or just make the whole memory transaction
return 0, or return a suitable memtx error.

-- PMM

