Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDF53BAE9D
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 21:27:32 +0200 (CEST)
Received: from localhost ([::1]:43056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m07m6-0007y8-UU
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 15:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1m07lC-0007EU-FW
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 15:26:34 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:41844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1m07lA-0003PK-LJ
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 15:26:34 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 f12-20020a056830204cb029048bcf4c6bd9so3991156otp.8
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 12:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ofa9kSwzPDD+9WGuHypczJUpwCLEeVqQqiIzDiOP/iU=;
 b=QPHjsc7hd/OG1LaOds2h+Kyf4BePukWT4FQ3alLAGu0bJbL0HaCs8VlY/SaeVoOJvB
 9rf0yT8oLFH2pE2PgH7Jm4LBcdnlAVO3YGK/0EzyqNQmTx6bb0NEMJ/lMoZuQf2mWUMO
 /bqYlZGa8E43sEvqYBPN8h3fsSEw8mMO9t+RaMVJUnDKMXxev9Hk8/EaIh1kxTyFuUdm
 r07oHlSxFTPDzIyumHMoGhwM1rAdamNr9ip04YWeRTFQcsvt01hctwp9hbFwyYqSZJZv
 EFxe+55wR2jFPou/20raSHh0MM+OSQK4vbqXPloWCehXdoMs0+9lkcuf5JEjGKa3a6OZ
 27fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ofa9kSwzPDD+9WGuHypczJUpwCLEeVqQqiIzDiOP/iU=;
 b=E5N9tFfFBecJpv72v2TISnOui8yUUYQUdqxh1vAZEuTukdQE4LBnwisAFasX8EWTpm
 CoCXe8ZLC7ed1IgatTX2esRSrDwL6DHIve0NwZCqcpDzaUq/l+ffo4mmguWvgJEuDIeS
 nQYYtROGF3TlPIbGy95z9JMJzAvqF17VRXhI9TlWnsIE6GdOdVvy1HFkgo19YpA5l9Dr
 iNUoDwpN0ZrX/j37G5aq0LC8YFTDjEP9hasUHLLOfJr/dBF0YMSvDBiSpZUgBR5doTvQ
 0kKAhxIqjSA0BmwZgmMxLMQk71lWNMnCC7P8dkv8izbt/snnlIoxtTWo73+0JRTZrIlu
 N34g==
X-Gm-Message-State: AOAM5308a1ehOrhPdY/numHtlDO8As9zUdOMOvEgVgKrxxmqyiCpDsP2
 1bwS+ZB92S5UnhIpKGUG9ys3XgOKhKIazP7UR9o=
X-Google-Smtp-Source: ABdhPJxahOx0W4tWQT5dEl7N/9PAwYoGRhv0IqmUaf6cVnpVZwIYswwTbhnKLxWYXSu4ZeTCIOvac4Ij0FT3FoU1p7k=
X-Received: by 2002:a05:6830:30b0:: with SMTP id
 g16mr1445759ots.190.1625426791412; 
 Sun, 04 Jul 2021 12:26:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210704105646.13524-1-marcel.apfelbaum@gmail.com>
 <CAFEAcA-H1P76MBE6bdUtkWg4dGVmA0=f_EtZTVkdAFggd1318g@mail.gmail.com>
In-Reply-To: <CAFEAcA-H1P76MBE6bdUtkWg4dGVmA0=f_EtZTVkdAFggd1318g@mail.gmail.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Sun, 4 Jul 2021 22:26:20 +0300
Message-ID: <CAC_L=vWDiRQyTmtPnLqrt+CZtJCM4O1UZXb5kUHAWaqu4kn1qA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PULL 0/3] PVRDMA queue
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000082b51f05c6512a83"
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, vv474172261@gmail.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000082b51f05c6512a83
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

On Sun, Jul 4, 2021 at 8:28 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sun, 4 Jul 2021 at 11:56, Marcel Apfelbaum
> <marcel.apfelbaum@gmail.com> wrote:
> >
> > The following changes since commit
> 9c2647f75004c4f7d64c9c0ec55f8c6f0739a8b1:
> >
> >   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into
> staging (2021-07-02 11:46:32 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/marcel-apf/qemu tags/pvrdma-04-07-2021
> >
> > for you to fetch changes up to f6287078c2e41cd8de424682cc86c2afccbf3797:
> >
> >   pvrdma: Fix the ring init error flow (CVE-2021-3608) (2021-07-04
> 11:14:02 +0300)
> >
> > ----------------------------------------------------------------
> > PVRDMA queue
> >
> > Several CVE fixes for the PVRDMA device.
> >
> > ----------------------------------------------------------------
> > Marcel Apfelbaum (3):
> >   hw/rdma: Fix possible mremap overflow in the pvrdma device
> >     (CVE-2021-3582)
> >   pvrdma: Ensure correct input on ring init (CVE-2021-3607)
> >   pvrdma: Fix the ring init error flow (CVE-2021-3608)
>
> This fails to compile on 32-bit hosts:
>
> In file included from ../hw/rdma/vmw/../rdma_backend_defs.h:23,
> from ../hw/rdma/vmw/../rdma_rm_defs.h:19,
> from ../hw/rdma/vmw/../rdma_backend.h:22,
> from ../hw/rdma/vmw/pvrdma_cmd.c:21:
> ../hw/rdma/vmw/pvrdma_cmd.c: In function 'pvrdma_map_to_pdir':
> ../hw/rdma/vmw/../rdma_utils.h:25:18: error: format '%lu' expects
> argument of type 'long unsigned int', but argument 4 has type 'size_t'
> {aka 'unsigned int'} [-Werror=format=]
> error_report("%s: " fmt, "rdma", ## __VA_ARGS__)
> ^~~~~~
> ../hw/rdma/vmw/pvrdma_cmd.c:43:9: note: in expansion of macro
> 'rdma_error_report'
> rdma_error_report("Invalid nchunks/length (%u, %lu)", nchunks, length);
> ^~~~~~~~~~~~~~~~~
>
>
I reproduced the issue, thank you.
I will fix and re-spin.

Thanks,
Marcel


> You can see this in the gitlab CI jobs, eg:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/1398130500
>
> thanks
> -- PMM
>

--00000000000082b51f05c6512a83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Peter,</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 4, 2021 at 8:28 PM P=
eter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@=
linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Sun, 4 Jul 2021 at 11:56, Marcel Apfelbaum<br>
&lt;<a href=3D"mailto:marcel.apfelbaum@gmail.com" target=3D"_blank">marcel.=
apfelbaum@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The following changes since commit 9c2647f75004c4f7d64c9c0ec55f8c6f073=
9a8b1:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/kevin/tags/for-u=
pstream&#39; into staging (2021-07-02 11:46:32 +0100)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/marcel-apf/qemu" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/marcel-apf/qemu</a> tags/pvrdm=
a-04-07-2021<br>
&gt;<br>
&gt; for you to fetch changes up to f6287078c2e41cd8de424682cc86c2afccbf379=
7:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0pvrdma: Fix the ring init error flow (CVE-2021-3608) (2021=
-07-04 11:14:02 +0300)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; PVRDMA queue<br>
&gt;<br>
&gt; Several CVE fixes for the PVRDMA device.<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; Marcel Apfelbaum (3):<br>
&gt;=C2=A0 =C2=A0hw/rdma: Fix possible mremap overflow in the pvrdma device=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0(CVE-2021-3582)<br>
&gt;=C2=A0 =C2=A0pvrdma: Ensure correct input on ring init (CVE-2021-3607)<=
br>
&gt;=C2=A0 =C2=A0pvrdma: Fix the ring init error flow (CVE-2021-3608)<br>
<br>
This fails to compile on 32-bit hosts:<br>
<br>
In file included from ../hw/rdma/vmw/../rdma_backend_defs.h:23,<br>
from ../hw/rdma/vmw/../rdma_rm_defs.h:19,<br>
from ../hw/rdma/vmw/../rdma_backend.h:22,<br>
from ../hw/rdma/vmw/pvrdma_cmd.c:21:<br>
../hw/rdma/vmw/pvrdma_cmd.c: In function &#39;pvrdma_map_to_pdir&#39;:<br>
../hw/rdma/vmw/../rdma_utils.h:25:18: error: format &#39;%lu&#39; expects<b=
r>
argument of type &#39;long unsigned int&#39;, but argument 4 has type &#39;=
size_t&#39;<br>
{aka &#39;unsigned int&#39;} [-Werror=3Dformat=3D]<br>
error_report(&quot;%s: &quot; fmt, &quot;rdma&quot;, ## __VA_ARGS__)<br>
^~~~~~<br>
../hw/rdma/vmw/pvrdma_cmd.c:43:9: note: in expansion of macro<br>
&#39;rdma_error_report&#39;<br>
rdma_error_report(&quot;Invalid nchunks/length (%u, %lu)&quot;, nchunks, le=
ngth);<br>
^~~~~~~~~~~~~~~~~<br>
<br></blockquote><div><br></div><div>I reproduced the issue, thank you.</di=
v><div>I will fix and re-spin.</div><div><br></div><div>Thanks,</div><div>M=
arcel</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
You can see this in the gitlab CI jobs, eg:<br>
<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/1398130500" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/jobs/13=
98130500</a><br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--00000000000082b51f05c6512a83--

