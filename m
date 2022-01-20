Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FB8494C8D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 12:12:14 +0100 (CET)
Received: from localhost ([::1]:47416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAVMQ-0007aV-IJ
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 06:12:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nAUN2-0001nG-CE
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:08:48 -0500
Received: from [2607:f8b0:4864:20::433] (port=43946
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nAUMw-0007rl-Bh
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:08:42 -0500
Received: by mail-pf1-x433.google.com with SMTP id u10so395643pfg.10
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 02:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=UVRoBgZNFuDIlDqqd+bVLqzD7laNZ7CWr38TzNhqjJc=;
 b=lTcF7VjlNWXJUqoADNySKJ04ZjigzTNEt1W1FkAemysxS1UcivZKtnY4astU6PcN90
 OVIsfdrC+lHiX0jEfuHNHwQAfoINoNx6YhvfkGNWmzXZxFmI1+MlrLxt4VdVRJ+bYZ1J
 kkm6qOeADdeqwT8QnNYzyktvS+Go0wxG3zOWz7qhqYShwPylr50/QJAVOr5b27VfsMxG
 GVjbaFShOEE2FkCgO1pdCX266SvYWKQSXgYU/jKJoGEEdZ4IyUwcPxSgS6FWqu3kOZWS
 9sr8oz6OIU9p3ecuVN/WqG1+UQDCDcogipAAKVNg6ErA9g6+zLrgwdljtwNo0euQ9W9v
 Ehlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=UVRoBgZNFuDIlDqqd+bVLqzD7laNZ7CWr38TzNhqjJc=;
 b=n3ebIroEFSn8Sem4HU2DQHDXDV5IYhuPzDL/TmOYQc8p6CBsuSpo6yROtkBv9uCpEf
 lNMt6sZqN2mEkZJTIJ/gZCzGbEKHY9CEcBpnJPG2NDRaMj4k7jyXWPL1SJStECfB6IK+
 CtdFasjGj9YCHeNllmxaSpqkld7MU1Ow1v9+bnHFIXdIIKdu4bOL2xONnks5GS3g2Vc6
 SrqkoS8NCaiEZzUHsEKkpT7qUDfglZbsg7mjX+nCHv6lmRry6Gwznv+uMgMHxHjtPy2+
 m2LM83GV0gijAPrZFeXI8WB7L2GHNdMd52wPXKcz+cZY+3A6C+w1l7ASTc9rK5hX7qWG
 Wn8Q==
X-Gm-Message-State: AOAM5335LirjaUCJngy79rykMX3mDlZ4rO9xUil2ya2n11zQrY6768NA
 FbqLCmicBftz4wsGkTZEdDHtzg==
X-Google-Smtp-Source: ABdhPJzT7g83RjWZxwWszJvUWuHtRpY4YNWLww8PrUX9IpadS6hHDJfbDwQxd6DRF5rz1BaVgX6Jfg==
X-Received: by 2002:a63:6b89:: with SMTP id g131mr4118324pgc.221.1642673313017; 
 Thu, 20 Jan 2022 02:08:33 -0800 (PST)
Received: from [192.168.1.6] ([203.163.242.243])
 by smtp.googlemail.com with ESMTPSA id l12sm8334736pjq.57.2022.01.20.02.08.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jan 2022 02:08:32 -0800 (PST)
Date: Thu, 20 Jan 2022 15:38:26 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
X-X-Sender: ani@athabasca.local
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: MP tables do not report multiple CPUs in Qemu 6.2.0 on x86 when
 given -smp cpus=n flag
In-Reply-To: <alpine.OSX.2.20.2201201527140.38065@athabasca.local>
Message-ID: <alpine.OSX.2.20.2201201536020.38065@athabasca.local>
References: <CAB4+JY+3N5qvC3p_e2DWWa=-QUtW+wH5ZdEJFPKTdSD5TVPXMA@mail.gmail.com>
 <CAFEAcA9tGnEOOhSbCJv2=JoU5C3cFB08mdaLRERgzPdatKQB=g@mail.gmail.com>
 <alpine.DEB.2.22.394.2201201305580.844042@anisinha-lenovo>
 <alpine.OSX.2.20.2201201527140.38065@athabasca.local>
User-Agent: Alpine 2.20 (OSX 67 2015-01-07)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="0-986132721-1642673312=:38065"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::433;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x433.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Godmar Back <gback@cs.vt.edu>,
 qemu-discuss@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-986132721-1642673312=:38065
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Thu, 20 Jan 2022, Ani Sinha wrote:

> +qemu-devel
>
> On Thu, 20 Jan 2022, Ani Sinha wrote:
>
> >
> >
> > On Wed, 19 Jan 2022, Peter Maydell wrote:
> >
> > > On Wed, 19 Jan 2022 at 14:44, Godmar Back <gback@cs.vt.edu> wrote:
> > > > after upgrading to 6.2.0, I observed that code such as MIT's xv6 (see
> > > > [1]) is no longer able to detect multiple CPUs.  Their code works in
> > > > 6.1.1, however.
> > >
> > > Hi; this isn't a great place for reporting QEMU bugs, because
> > > it's more of a user-to-user discussion list. Not all QEMU
> > > developers read it. I've cc'd the ACPI maintainers, who
> > > hopefully may have an idea about what's happening here.
> > > You could also file a bug at
> > > https://gitlab.com/qemu-project/qemu/-/issues
> > >
> > > > I built 6.1.1 from source and 6.2.0 from source and I have also tested
> > > > with CentOS stream's 6.1.1 qemu-kvm and was able to pinpoint this
> > > > change to these 2 versions of qemu. I am using qemu-system-i386
> > > > specifically.
> > > >
> > > > I tried to go through the ChangeLog to see if the `-smp` option was
> > > > deprecated or changed.  I found this note [2] about invalid topologies
> > > > having been removed in 5.2. Here's what I found after long
> > > > experimentation:
> > > >
> > > > The legacy MP tables appear to work only if you specify the longform
> > > > `-smp cpus=4,cores=1,threads=1,sockets=4` in 6.2.0.  If you specify
> > > > `-smp 4` or `-smp cpus=4` it will not work in 6.2.0 (it worked in
> > > > 6.1.1). I am guessing that perhaps the MP tables add entries for each
> > > > socket, but that perhaps the behavior of the shortcuts `-smp n` and
> > > > `-smp cpus=n` was changed to influence the number of cores rather than
> > > > sockets.
> > > >
> > > > In other words, `-smp cpus=n` now means `-smp
> > > > cpus=n,cores=n,threads=1,sockets=1` whereas in 6.1.1 and before it
> > > > meant `-smp cpus=n,cores=1,threads=1,sockets=n`. I note that
> > > > specifying `-smp cpus=4,cores=4,threads=1,sockets=1` in 6.1.1 also
> > > > does not create 4 entries in the legacy MP tables.
> > > >
> >
> > My suspicion is that the following commit might have introduced a
> > regression:
> >
> > commit 86ce2d28fa09d15547b5cabdc264cadfb53a848c
> > Author: Yanan Wang <wangyanan55@huawei.com>
> > Date:   Tue Oct 26 11:46:58 2021 +0800
> >
> >     hw/core/machine: Split out the smp parsing code
> >
> >     We are going to introduce an unit test for the parser smp_parse()
> >     in hw/core/machine.c, but now machine.c is only built in softmmu.
> >
> >     In order to solve the build dependency on the smp parsing code and
> >     avoid building unrelated stuff for the unit tests, move the tested
> >     code from machine.c into a separate file, i.e., machine-smp.c and
> >     build it in common field.
> >
> >     Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> >     Reviewed-by: Andrew Jones <drjones@redhat.com>
> >     Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >     Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >     Message-Id: <20211026034659.22040-2-wangyanan55@huawei.com>
> >     Acked-by: Eduardo Habkost <ehabkost@redhat.com>
> >     Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >
> > I am still checking.
>
> Yes this patch introduced the behavior of preferring cores over sockets
> post 6.2. I think this is intentional. See the following hunk:
>
> +        if (mc->smp_props.prefer_sockets) {
> +            /* prefer sockets over cores before 6.2 */
> +            if (sockets == 0) {
> +                cores = cores > 0 ? cores : 1;
> +                threads = threads > 0 ? threads : 1;
> +                sockets = maxcpus / (dies * cores * threads);
> +            } else if (cores == 0) {
> +                threads = threads > 0 ? threads : 1;
> +                cores = maxcpus / (sockets * dies * threads);
> +            }
> +        } else {
> +            /* prefer cores over sockets since 6.2 */
> +            if (cores == 0) {
> +                sockets = sockets > 0 ? sockets : 1;
> +                threads = threads > 0 ? threads : 1;
> +                cores = maxcpus / (sockets * dies * threads);
> +            } else if (sockets == 0) {
> +                threads = threads > 0 ? threads : 1;
> +                sockets = maxcpus / (dies * cores * threads);
> +            }
> +        }

Actually I am not quite right. This is the real change which changed the
preference. The previous change was a code re-org that preserved the
behavior:

commit 4a0af2930a4e4f64ce551152fdb4b9e7be106408
Author: Yanan Wang <wangyanan55@huawei.com>
Date:   Wed Sep 29 10:58:09 2021 +0800

    machine: Prefer cores over sockets in smp parsing since 6.2

    In the real SMP hardware topology world, it's much more likely that
    we have high cores-per-socket counts and few sockets totally. While
    the current preference of sockets over cores in smp parsing results
    in a virtual cpu topology with low cores-per-sockets counts and a
    large number of sockets, which is just contrary to the real world.

    Given that it is better to make the virtual cpu topology be more
    reflective of the real world and also for the sake of compatibility,
    we start to prefer cores over sockets over threads in smp parsing
    since machine type 6.2 for different arches.

    In this patch, a boolean "smp_prefer_sockets" is added, and we only
    enable the old preference on older machines and enable the new one
    since type 6.2 for all arches by using the machine compat mechanism.

    Suggested-by: Daniel P. Berrange <berrange@redhat.com>
    Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
    Acked-by: David Gibson <david@gibson.dropbear.id.au>
    Acked-by: Cornelia Huck <cohuck@redhat.com>
    Reviewed-by: Andrew Jones <drjones@redhat.com>
    Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
    Message-Id: <20210929025816.21076-10-wangyanan55@huawei.com>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

In any case, the behavior change is intended because of the reasons the
above commit outlines.
--0-986132721-1642673312=:38065--

