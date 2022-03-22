Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A40314E46BA
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 20:33:54 +0100 (CET)
Received: from localhost ([::1]:55838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWkGP-0001Uj-Oy
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 15:33:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWkFZ-0000kp-5d
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 15:33:01 -0400
Received: from [2607:f8b0:4864:20::b29] (port=34723
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWkFX-0004E7-Kr
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 15:33:00 -0400
Received: by mail-yb1-xb29.google.com with SMTP id h126so35592072ybc.1
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 12:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LuOmN7nZdXfQCBqYfxG00zC6HeDCIkwADJVB4qm9Wso=;
 b=uPpiQhj0OgRcFlu1xEs0wByfk8l07IdXjOv8rAM1CGlO710pV/KkZT57h68ESByT17
 LhE4NuHdi5WGjHfOWHeS8+Y/Zw5Mr/DwPvOk4p6b7PlcmvfTZkfE5dg2DTlKniO+EDH+
 GEErhXUmPQyQb3T/FjlrJVgM6nJVI6/WoNeXX4i1L+EGDGAcoKu/Of+HnaiDlAhmb3Ou
 b9K/Lad8ovcTC1n08ihhUS65jbcPg4nLoWMNKLnG8el7zZ4LkvyxxEgeTIUkxUXSO8Za
 z8049K+YZFouUTomUeXbVmkabeXht6HFhKHpXn1x04Uv002R+wjS7dfnthhXJ6VyWg7v
 BRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LuOmN7nZdXfQCBqYfxG00zC6HeDCIkwADJVB4qm9Wso=;
 b=HboGASkSl3yAoq83jsMTAZp2dLhVDRA1k1bQ1rkaib7DDZAlhLK0vxlM0pUa7QXL7M
 tjvYVlQDxK5005hxCuf8D9RWOORVm4xNagsTWxB3z+15Vtvm37ithIDVGXXaKtbuBen/
 bSaPUv5q1yLa0KI35OKF9+jxsWh7mvEGuHVUxDca/5vpU8JVWKuP2S2uP5VPrnSCw7MT
 mdjQI/FXbsEIwmdr8+uTbOtkgy3zzryP40+c1C1GeLSP+QiKaMomUF7JHvQqReN6XLxK
 PKZBa9ljXGPX+RJd9O+2ugRvrxhKoteOYxeO6P8p0gY5Hq7NqnNWbzpL+Ds2TixAE/sH
 ZZPA==
X-Gm-Message-State: AOAM533KpNDBBoRdE2CLcCJnWkoZGQy/iPcx+3H45glowD2NMulwLci4
 +dQO8d/D7HIwmOn9gBccBBO0EZGmPLWUIG4w/rVNsA==
X-Google-Smtp-Source: ABdhPJzL5XihBDce2Z2IUg7yVCj7h5PTE+5vcKEhLpsIsIURi6ke1l6wyc9mSuzVU9UepEzx7U3J/zvmWHeiLyvSQXQ=
X-Received: by 2002:a05:6902:150d:b0:634:5046:d294 with SMTP id
 q13-20020a056902150d00b006345046d294mr3164262ybu.140.1647977578579; Tue, 22
 Mar 2022 12:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220322154213.86475-1-bmeng.cn@gmail.com>
 <CAFEAcA8RdqQ5fzoZtb5SaYe41FA=oKo21veergqhMgo=eFmB6Q@mail.gmail.com>
 <6a32d012-98b2-698b-82f8-8ed62cf47c4d@gmail.com>
In-Reply-To: <6a32d012-98b2-698b-82f8-8ed62cf47c4d@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Mar 2022 19:32:45 +0000
Message-ID: <CAFEAcA_JYHFAD-Jd1sjMky0ZrrBbcjSqn4iDOSRHs5NK5YjAPA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gdbstub: Set current_cpu for memory read write
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Mar 2022 at 18:59, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
> On 22/3/22 16:56, Peter Maydell wrote:
> > This works, but I worry a bit that it might have unexpected
> > side effects, and setting globals (even if thread-local) to
> > cause side-effects elsewhere isn't ideal...
>
> Yeah, gdbstub is like a JTAG probe, CPU accessors/views shouldn't be
> involved. Having current_cpu=3D=3DNULL seems the correct behavior.
>
> There was a thread few years ago about an issue similar to this one.
> IIRC it was about how to have qtest commands select a different address
> space instead of the 'current cpu' one.
>
> I wonder why target_memory_rw_debug() involves CPU at all. Maybe it is
> simply not using the correct API?

gdb lets you look at specific threads (CPUs). When you're
looking at a given CPU you want that CPU's view of the world.
Most importantly, you want the virtual-to-physical mapping
that that CPU currently has set up...

-- PMM

