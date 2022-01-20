Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73163494D1D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 12:39:55 +0100 (CET)
Received: from localhost ([::1]:42256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAVnG-0008CM-0X
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 06:39:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nAUHP-0005m2-Ko
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:02:58 -0500
Received: from [2607:f8b0:4864:20::1034] (port=37444
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nAUHN-00071u-Nl
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:02:55 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 s2-20020a17090ad48200b001b501977b23so4515132pju.2
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 02:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=XbIn1FUbbgLlqw2sCJfEx2fHNm7XiY49MrKb3ARXsDw=;
 b=QhmE05gaJdZ4zvHih7M1qfE/jeDD3890f2wCismvRRpEPW2cG9OCU1QOexn6oKuFCf
 Sa0ZaecOn8iPp0Jo2j8/P6OJYYk0LSOWuSrWPzwAoQs4nl1Lcw1erceglRbPUStPb2vQ
 zGCNZqA5C+m5CaGdtsO5qcxwHyp7iNmZ8Y5/zr/mNKYnl7m+yvHdsahN9bwcpODHfTlA
 QNCBGMKfvs3rctu2F3/T/hqjNr31oxCbOoynnSxrhHgdpBCc5EGVebOmKVKUyQz+ZRzl
 bpd4M7cmXTnrfdM44g+DlVDQEN0KH3ux/Kgp+n3ZnUMU2+zMs+LPBiFt7+IRM+PcJjWu
 WCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=XbIn1FUbbgLlqw2sCJfEx2fHNm7XiY49MrKb3ARXsDw=;
 b=dNnHJg3FRuZ7XALPmGpRYVQsSPVvxZFf1OqWMuefSiL0espcsTXYUukQ315a7bmHRo
 XRH0qjT4v/mbqNrJxqdz3wP8sIKS6nsRLC/rIUhJilr41oYJN3FecYoX1+HonQU/EX8U
 JfneJXB4WIQA5AhFrplySFIi7x7yLtRubxbWWUdcPS19v3sJWZ6NxYpqm5Lck0LkJzQq
 /U1ZfV1XtFki9fN5Hi+eeis1xvbdLVoIh3UF2SVQQMP4r8nFBvu2sSmuCtpp4hwSHiCJ
 g9ARLLRD4iz4mssM88j0dLFBaugXQfetCuQ2WQ5aAXM0v/Vs/mZzAIxNZv0UHcYLWux+
 lixQ==
X-Gm-Message-State: AOAM531Rd7JIQZirDerrM5SjRscJLv7nFq4aAQyQKQyu3lhoKW/FjUyl
 pJAQCOClPtp2XEmGjXLqDuNToQ==
X-Google-Smtp-Source: ABdhPJyP3FOpe2GY3/P6OGLyu+1QuE7yhpGLVkSTr35Ti+t1G2AzmF3v7OS49Yfc+XDlfTRU3NnL7Q==
X-Received: by 2002:a17:903:1209:b0:149:a428:19ef with SMTP id
 l9-20020a170903120900b00149a42819efmr36578569plh.47.1642672967205; 
 Thu, 20 Jan 2022 02:02:47 -0800 (PST)
Received: from [192.168.1.6] ([203.163.242.243])
 by smtp.googlemail.com with ESMTPSA id s31sm2787752pfg.145.2022.01.20.02.02.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jan 2022 02:02:46 -0800 (PST)
Date: Thu, 20 Jan 2022 15:32:40 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
X-X-Sender: ani@athabasca.local
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: MP tables do not report multiple CPUs in Qemu 6.2.0 on x86 when
 given -smp cpus=n flag
In-Reply-To: <alpine.DEB.2.22.394.2201201305580.844042@anisinha-lenovo>
Message-ID: <alpine.OSX.2.20.2201201527140.38065@athabasca.local>
References: <CAB4+JY+3N5qvC3p_e2DWWa=-QUtW+wH5ZdEJFPKTdSD5TVPXMA@mail.gmail.com>
 <CAFEAcA9tGnEOOhSbCJv2=JoU5C3cFB08mdaLRERgzPdatKQB=g@mail.gmail.com>
 <alpine.DEB.2.22.394.2201201305580.844042@anisinha-lenovo>
User-Agent: Alpine 2.20 (OSX 67 2015-01-07)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="0-1269465682-1642672966=:38065"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1034.google.com
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

--0-1269465682-1642672966=:38065
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

+qemu-devel

On Thu, 20 Jan 2022, Ani Sinha wrote:

>
>
> On Wed, 19 Jan 2022, Peter Maydell wrote:
>
> > On Wed, 19 Jan 2022 at 14:44, Godmar Back <gback@cs.vt.edu> wrote:
> > > after upgrading to 6.2.0, I observed that code such as MIT's xv6 (see
> > > [1]) is no longer able to detect multiple CPUs.  Their code works in
> > > 6.1.1, however.
> >
> > Hi; this isn't a great place for reporting QEMU bugs, because
> > it's more of a user-to-user discussion list. Not all QEMU
> > developers read it. I've cc'd the ACPI maintainers, who
> > hopefully may have an idea about what's happening here.
> > You could also file a bug at
> > https://gitlab.com/qemu-project/qemu/-/issues
> >
> > > I built 6.1.1 from source and 6.2.0 from source and I have also tested
> > > with CentOS stream's 6.1.1 qemu-kvm and was able to pinpoint this
> > > change to these 2 versions of qemu. I am using qemu-system-i386
> > > specifically.
> > >
> > > I tried to go through the ChangeLog to see if the `-smp` option was
> > > deprecated or changed.  I found this note [2] about invalid topologies
> > > having been removed in 5.2. Here's what I found after long
> > > experimentation:
> > >
> > > The legacy MP tables appear to work only if you specify the longform
> > > `-smp cpus=4,cores=1,threads=1,sockets=4` in 6.2.0.  If you specify
> > > `-smp 4` or `-smp cpus=4` it will not work in 6.2.0 (it worked in
> > > 6.1.1). I am guessing that perhaps the MP tables add entries for each
> > > socket, but that perhaps the behavior of the shortcuts `-smp n` and
> > > `-smp cpus=n` was changed to influence the number of cores rather than
> > > sockets.
> > >
> > > In other words, `-smp cpus=n` now means `-smp
> > > cpus=n,cores=n,threads=1,sockets=1` whereas in 6.1.1 and before it
> > > meant `-smp cpus=n,cores=1,threads=1,sockets=n`. I note that
> > > specifying `-smp cpus=4,cores=4,threads=1,sockets=1` in 6.1.1 also
> > > does not create 4 entries in the legacy MP tables.
> > >
>
> My suspicion is that the following commit might have introduced a
> regression:
>
> commit 86ce2d28fa09d15547b5cabdc264cadfb53a848c
> Author: Yanan Wang <wangyanan55@huawei.com>
> Date:   Tue Oct 26 11:46:58 2021 +0800
>
>     hw/core/machine: Split out the smp parsing code
>
>     We are going to introduce an unit test for the parser smp_parse()
>     in hw/core/machine.c, but now machine.c is only built in softmmu.
>
>     In order to solve the build dependency on the smp parsing code and
>     avoid building unrelated stuff for the unit tests, move the tested
>     code from machine.c into a separate file, i.e., machine-smp.c and
>     build it in common field.
>
>     Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>     Reviewed-by: Andrew Jones <drjones@redhat.com>
>     Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>     Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>     Message-Id: <20211026034659.22040-2-wangyanan55@huawei.com>
>     Acked-by: Eduardo Habkost <ehabkost@redhat.com>
>     Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>
> I am still checking.

Yes this patch introduced the behavior of preferring cores over sockets
post 6.2. I think this is intentional. See the following hunk:

+        if (mc->smp_props.prefer_sockets) {
+            /* prefer sockets over cores before 6.2 */
+            if (sockets == 0) {
+                cores = cores > 0 ? cores : 1;
+                threads = threads > 0 ? threads : 1;
+                sockets = maxcpus / (dies * cores * threads);
+            } else if (cores == 0) {
+                threads = threads > 0 ? threads : 1;
+                cores = maxcpus / (sockets * dies * threads);
+            }
+        } else {
+            /* prefer cores over sockets since 6.2 */
+            if (cores == 0) {
+                sockets = sockets > 0 ? sockets : 1;
+                threads = threads > 0 ? threads : 1;
+                cores = maxcpus / (sockets * dies * threads);
+            } else if (sockets == 0) {
+                threads = threads > 0 ? threads : 1;
+                sockets = maxcpus / (dies * cores * threads);
+            }
+        }


prefer_sockets is set to true for 6.1 machines:

static void pc_q35_6_1_machine_options(MachineClass *m)
{
    pc_q35_6_2_machine_options(m);
    m->alias = NULL;
    compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
    compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
    m->smp_props.prefer_sockets = true;
}

So this behavior change is intended.

--0-1269465682-1642672966=:38065--

