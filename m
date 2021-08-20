Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDA53F2E14
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 16:29:22 +0200 (CEST)
Received: from localhost ([::1]:56386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH5WL-0004Wt-Ft
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 10:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mH5Pd-0000Ls-HL; Fri, 20 Aug 2021 10:22:26 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:38691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mH5Pb-0006Hz-KC; Fri, 20 Aug 2021 10:22:25 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id a9so15677826ybr.5;
 Fri, 20 Aug 2021 07:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gWaaO7WqUakCyfTSQlSAKmL4DO2s7/pZ0OAOPrtmBgw=;
 b=SR4Hv1F8oIPZReJjXCSZIWY2UMX+DYUJC0x8D46/pm3TY6IQ84Kcd8ujK1zRPLGzLY
 SU0bjmgRypZVmTvC4+97kFrxDx3Ksn6ydUKkc5jyqA7dvUN6+7ZPMzGNlrkz3TLcqjWS
 uDOEEQw+2FvEkfxTotKyi+stbTbhfIMVcgDGwLg3QJczw8vAY8SuySdhDy3kPOluWuUM
 vzn5gBDllvDvhkLqxr8XVvEJNtP+arKnFH4wMA9JQev2gA3N1m9RK2u56GmmRbzQy/Pc
 AfYS9nSr0wQXJfxIHHX6oWVDSNC101HRYW5OTdijKsasv6y6ICP97wiBmx1A8vg2Ykzm
 t+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gWaaO7WqUakCyfTSQlSAKmL4DO2s7/pZ0OAOPrtmBgw=;
 b=hWKa72CzGOuxh9wTmn/cxMP1ZSDaW9Z3JEQsC5X/Uee+WvnEfBXgRDpXFft7luO7LN
 5tQz/CIPnHDKLtiO0p9HKKoWUIxc5gZTduRISuoO7OCj3MHDF7pVL0m+2yLMDNJJLaCm
 gPRmBNfsuwn8KsWKGCloj43niyhrwS5T7IOTyj6fCMwcRvv5+PphVklXPa7UW3L1I3YA
 UqpioHZ0Tt30daRt9sClvoYfiPkyoao19QwXvPqTaqg4obBKH1Hm3ZAp9JgiS/x/01bl
 Zr+33wfuPnHWpqK+I953lLAsQDPCWbwCv1qAEkg75l40vUSBRS9J1sTJpmlcg8RnHEgo
 ZHyA==
X-Gm-Message-State: AOAM531yct7wowXVqYNvZx8ewVrcDirema/FO7uimfs5YEuks6FpDVkb
 EprKXaa8va9PY6YjReV1MxHoVxfqvOg19L0f1Ds=
X-Google-Smtp-Source: ABdhPJx9G9d1Vlyn44k74fh1whZLNAgPdp704WkSvAlHkmhy7jQhyy0wgQbLowX3j4MqhzF7bsl01Jqh4soe7ZXRg8o=
X-Received: by 2002:a5b:304:: with SMTP id j4mr25233107ybp.314.1629469342102; 
 Fri, 20 Aug 2021 07:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
 <869f8be9-b76f-e315-9591-9c452bedf922@redhat.com>
In-Reply-To: <869f8be9-b76f-e315-9591-9c452bedf922@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 20 Aug 2021 22:22:11 +0800
Message-ID: <CAEUhbmUE4fb2NewE+Cze3Le5xOeH53NDbwdnKH==dnZeKGPQeQ@mail.gmail.com>
Subject: Re: xilinx-zynq-a9: cannot set up guest memory 'zynq.ext_ram'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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
 David Hildenbrand <david@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Fri, Aug 20, 2021 at 10:10 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Hi Bin,
>
> On 8/20/21 4:04 PM, Bin Meng wrote:
> > Hi,
> >
> > The following command used to work on QEMU 4.2.0, but is now broken
> > with QEMU head.
> >
> > $ qemu-system-arm -M xilinx-zynq-a9 -display none -m 40000000
> > -nographic -serial /dev/null -serial mon:stdio -monitor null -device
> > loader,file=3Du-boot-dtb.bin,addr=3D0x4000000,cpu-num=3D0
> > qemu-system-arm: cannot set up guest memory 'zynq.ext_ram': Cannot
> > allocate memory
> >
> > Any ideas?
>
> Richard hit that recently too.

I hit this when in the VM on Azure pipelines, but I was able to
reproduce this issue on my local machine.

>
> Can you provide:
>
> cat /proc/sys/vm/overcommit_kbytes
> cat /proc/sys/vm/overcommit_memory
> cat /proc/sys/vm/overcommit_ratio

$ cat /proc/sys/vm/overcommit_kbytes
0
$ cat /proc/sys/vm/overcommit_memory
0
$ cat /proc/sys/vm/overcommit_ratio
50

>
> and
>
> cat /proc/meminfo
>
> (CommitLimit, Committed_AS)

$ cat /proc/meminfo

CommitLimit:    12388820 kB
Committed_AS:    5019088 kB

> and OOM messages.

I did not see any OOM messages.

>
> Per David, 'you can trick QEMU in trying to work around
> that issue, specifying a memory-backend-ram with "reserve=3Doff"
> as guest RAM.'

Regards,
Bin

