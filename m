Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2630836BCA9
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 02:30:46 +0200 (CEST)
Received: from localhost ([::1]:45892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbBcj-00013t-38
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 20:30:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dev.devaqemu@gmail.com>)
 id 1lb7qT-0001RD-1U; Mon, 26 Apr 2021 16:28:41 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:42806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dev.devaqemu@gmail.com>)
 id 1lb7qR-0006ow-BY; Mon, 26 Apr 2021 16:28:40 -0400
Received: by mail-ej1-x642.google.com with SMTP id ja3so10467562ejc.9;
 Mon, 26 Apr 2021 13:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LFWS3XVwYFa5pkEsOWfzLudSnckk/JghQ/frQo27JTY=;
 b=pPunOMTrmy+BZTn5l57rf6lF7/SQfN26QTca8metWnHMsUYypIGLGqz9e86XxICnaX
 CENZzo3vkzNU7xneDGrTSzHib2hpSHqx4eRYJleRy+qGvgi6vAL8pe0Jw2n+t9aw0++U
 9Fae/ccaon4yR+VxiyhFoR+aTQElOkSP6VS6/SYB7lbPJ6Df9koKJUSscFsJPj9QU3sL
 uulcxMvbkrXjkkgjcLyxbDXRn46txdyJNtEje6ayzSk9/IVdWOi0AmsiZIxqoH0bzUln
 Jdp2fKZwtcThbZXul1YRi0xnARxSzrNbuPGogE/VZG050AO7FPtrPCYjFnUmjIm0k/Gm
 wkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LFWS3XVwYFa5pkEsOWfzLudSnckk/JghQ/frQo27JTY=;
 b=QMlMTyZOTyXUhxQ1aGMI0c3s85H7kfl30HEex8cqtkK2KOv4kPwRkVtyjb8epWpVXg
 d2IskilfuRPV+MB5g0+IrfykywWfyPUs2SMXvGPabCO40Ou4zSbEG42o5zPMVpI8h9wk
 gI8x9tOREtOGkm/fgt4kCV7PS9V4Ky74jxd1RJqYZscFy5XyqtPsRiARBwbMQnt7uTCL
 c3RAnf/ue1s+uaQYSdhXohSlJB8P/AMdex/9C640B26cGQMAjBF4eJ/yhPOfP8gIHNIG
 0mGEFIVodhxqJBl2MaZ1hsjSOcnh9bSv/ECRNEznPD8YTip1Fbsi2u2D133vAcySVWzx
 E8jg==
X-Gm-Message-State: AOAM531WdgBcdXOUx65UDFOekOUjJwXYMXzg1nQNICD56LhOGuZ+4dkB
 +7vKlcgmLA6XURsEtT2ZJixmJp9jwpd5TTZLMidUNMn8eyFLgmfurkg=
X-Google-Smtp-Source: ABdhPJzVzt+svxzQoeVJydW+m+prfCUPVLuT/VUoXyafcnXvaeJ8eUE0DFozjCfn+0Nr/Jw9/H9UiXAVq4SiMlm2ja4=
X-Received: by 2002:a17:907:33ce:: with SMTP id
 zk14mr7476480ejb.372.1619468917511; 
 Mon, 26 Apr 2021 13:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <CANsN3OSXjVLUAfCn2H2NEW2EAn6_FCs9CXuNrnC+XGgzG=rSYg@mail.gmail.com>
In-Reply-To: <CANsN3OSXjVLUAfCn2H2NEW2EAn6_FCs9CXuNrnC+XGgzG=rSYg@mail.gmail.com>
From: Dev Audsin <dev.devaqemu@gmail.com>
Date: Mon, 26 Apr 2021 21:27:52 +0100
Message-ID: <CANsN3OQHy1EqTNFOPEKUTjCMr18jMxRCzmejMMGmon2JFcYUwA@mail.gmail.com>
Subject: Re: [PATCH] skip virtio fs cache section to enable NIC pass through
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000008d9cf005c0e5fd44"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=dev.devaqemu@gmail.com; helo=mail-ej1-x642.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 26 Apr 2021 20:21:43 -0400
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
Cc: qemu-trivial@nongnu.org, alex.williamson@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008d9cf005c0e5fd44
Content-Type: text/plain; charset="UTF-8"

 virtio-fs with DAX is currently not compatible with NIC Pass through. VM
fails to boot when DAX  cache is enabled and SR-IOV VF is being attached.
This patch solves the problem. Hencem DAX cache and SR-IOV VF are be
attached together.

When a SR-IOV VF attaches to a qemu process, vfio will try to pin the
entire DAX Window but it is empty when the guest boots and will fail.
A method to make VFIO and DAX to work together is to make vfio skip DAX
cache.
Currently DAX cache need to be set to 0, for the SR-IOV VF to be attached
to Kata containers.
Enabling both SR-IOV VF and DAX work together will potentially improve
performance for workloads which are I/O and network intensive

On Mon, Apr 26, 2021 at 9:24 PM Dev Audsin <dev.devaqemu@gmail.com> wrote:

> Signed-off-by: Dev Audsin <dev.devaqemu@gmail.com>
> ---
>  hw/vfio/common.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 6ff1daa763..3af70238bd 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -541,7 +541,8 @@ static int vfio_host_win_del(VFIOContainer *container,
> hwaddr min_iova,
>
>  static bool vfio_listener_skipped_section(MemoryRegionSection *section)
>  {
> -    return (!memory_region_is_ram(section->mr) &&
> +    return (!strcmp(memory_region_name(section->mr), "virtio-fs-cache"))
> ||
> +          (!memory_region_is_ram(section->mr) &&
>              !memory_region_is_iommu(section->mr)) ||
>             /*
>              * Sizing an enabled 64-bit BAR can cause spurious mappings to
> --
> 2.25.1
>

--0000000000008d9cf005c0e5fd44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>
virtio-fs with DAX is currently not compatible with NIC Pass through. VM fa=
ils to boot when DAX=C2=A0 cache is enabled and SR-IOV VF is being attached=
. This patch solves the problem. Hencem DAX cache and SR-IOV VF are be atta=
ched together. <br></div><div><br></div>
When a SR-IOV VF attaches to a qemu process, vfio will try to pin the=20
entire DAX Window but it is empty when the guest boots and will fail.<br>
A method to make VFIO and DAX to work together is to make vfio skip DAX cac=
he.<br>
Currently DAX cache need to be set to 0, for the SR-IOV VF to be attached t=
o Kata containers.<br>
Enabling both SR-IOV VF and DAX work together will potentially improve=20
performance for workloads which are I/O and network intensive

</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Mon, Apr 26, 2021 at 9:24 PM Dev Audsin &lt;<a href=3D"mailto:dev.devaqe=
mu@gmail.com">dev.devaqemu@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">
Signed-off-by: Dev Audsin &lt;<a href=3D"mailto:dev.devaqemu@gmail.com" tar=
get=3D"_blank">dev.devaqemu@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/vfio/common.c | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/hw/vfio/common.c b/hw/vfio/common.c<br>
index 6ff1daa763..3af70238bd 100644<br>
--- a/hw/vfio/common.c<br>
+++ b/hw/vfio/common.c<br>
@@ -541,7 +541,8 @@ static int vfio_host_win_del(VFIOContainer *container, =
hwaddr min_iova,<br>
<br>
=C2=A0static bool vfio_listener_skipped_section(MemoryRegionSection *sectio=
n)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return (!memory_region_is_ram(section-&gt;mr) &amp;&amp;<br>
+=C2=A0 =C2=A0 return (!strcmp(memory_region_name(section-&gt;mr), &quot;vi=
rtio-fs-cache&quot;)) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (!memory_region_is_ram(section-&gt;mr) =
&amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!memory_region_is_iommu(sec=
tion-&gt;mr)) ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Sizing an enabled 64-bit =
BAR can cause spurious mappings to<font color=3D"#888888"><br>
-- <br>
2.25.1</font>

</div>
</blockquote></div>

--0000000000008d9cf005c0e5fd44--

