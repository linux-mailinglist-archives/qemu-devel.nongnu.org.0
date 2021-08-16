Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6413EDF5E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 23:38:52 +0200 (CEST)
Received: from localhost ([::1]:42974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFkJn-0002YD-72
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 17:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mFkIg-0001FO-Bc
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 17:37:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mFkIc-0000sH-G9
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 17:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629149856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7P5tnOVS6z5MR28D7QK740Sdm95cxJxE2UuxSOVSXts=;
 b=B0P+yv4u4SYiT6YYB1XorKhEZa//303Mtg/9/8q6XVVzqipfTmYkGTHnEyZB4lv8pe4XEv
 HGroVyey1FatVTU+Q7qC+8Mvl0NySoeC+4JrJDLGoTkgu2qawF60Awqu07TfHpRvAVKFZX
 hoa8MDR38sUxZ+XUhJEccDIov6qGHNo=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-XPLDkw7kMNieTiXDa3F8bA-1; Mon, 16 Aug 2021 17:37:35 -0400
X-MC-Unique: XPLDkw7kMNieTiXDa3F8bA-1
Received: by mail-pj1-f70.google.com with SMTP id
 j6-20020a17090ac486b0290178ffdbd20dso1016275pjt.0
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 14:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7P5tnOVS6z5MR28D7QK740Sdm95cxJxE2UuxSOVSXts=;
 b=LzHtmmTOUMqB7qb1lD0sHA4JenRLoSEwyxa7YOzihC1iBnjQKjwTqpy1X9azNPVSm1
 hWTRsIEwaWiL7o51iAEZl6GyjGwFOgxrIOhP2sG8PkWgPioHuUjHg6S5EF+4yo1BNwr1
 irBeDP/a04apPFbp+YaOQoPCvfY+Ud8xHTSZUqEPA/XvI6sNzm6wYsHaZPlkmsyF/Bbe
 zC7ZWZ4Jqcv/Ge9YvRCfA3jLE7+6Btap/uZ36is+tlIAZY4bmQgQ1uyfI6dfl4O5ksPa
 mGu8hrhafM2GYAXT2HBh1ZkhtPKWDhsVxpwgK3bKPSQY/m1q/Yu1qu9V0aEmtH1Z/ToB
 Y0/A==
X-Gm-Message-State: AOAM530ywCWagh9CXkyIIilJW+tnk5wad2P2jMB31hCCOLHTAQ+tx69K
 cYm6h5Jj9ISw/VJvjr/jXdD3PLN9zxIzTWa5VNKh2eIaSyG8qOzXlSrCZM9/A4y9et3+tbNHcb1
 fILtNFl9w1TuozQgFYrrOvmtq6CBHPLE=
X-Received: by 2002:a65:5603:: with SMTP id l3mr110571pgs.281.1629149854195;
 Mon, 16 Aug 2021 14:37:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHYWyAOdj/MryChViS7gUkyVN3h9/TXgLiSXhqhFrAthsS5kfse8dW38PeNU1vNlIY9bISE4BeI1iG1igujr8=
X-Received: by 2002:a65:5603:: with SMTP id l3mr110526pgs.281.1629149853876;
 Mon, 16 Aug 2021 14:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210816210603.42337-1-ehabkost@redhat.com>
 <20210816210603.42337-2-ehabkost@redhat.com>
In-Reply-To: <20210816210603.42337-2-ehabkost@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 16 Aug 2021 23:37:21 +0200
Message-ID: <CABgObfaWxNsq2i8j6P+oZGFjxyR3MFE9FopHsnvuNAPXa4upYQ@mail.gmail.com>
Subject: Re: [PULL 1/1] machine: Disallow specifying topology parameters as
 zero
To: Eduardo Habkost <ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000053c2c305c9b402ae"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Yanan Wang <wangyanan55@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000053c2c305c9b402ae
Content-Type: text/plain; charset="UTF-8"

How do we know that no one has ever used such configuration? The conversion
was meant to be bug-compatible.

Paolo

Il lun 16 ago 2021, 23:06 Eduardo Habkost <ehabkost@redhat.com> ha scritto:

> From: Yanan Wang <wangyanan55@huawei.com>
>
> In the SMP configuration, we should either provide a topology
> parameter with a reasonable value (greater than zero) or just
> omit it and QEMU will compute the missing value. Users should
> have never provided a configuration with parameters as zero
> (e.g. -smp 8,sockets=0) which should be treated as invalid.
>
> But commit 1e63fe68580 (machine: pass QAPI struct to mc->smp_parse)
> has added some doc which implied that 'anything=0' is valid and
> has the same semantics as omitting a parameter.
>
> To avoid meaningless configurations possibly introduced by users
> in the future and consequently a necessary deprecation process,
> fix the doc and also add the corresponding sanity check.
>
> Fixes: 1e63fe68580 (machine: pass QAPI struct to mc->smp_parse)
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
> Tested-by: Daniel P. Berrange <berrange@redhat.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Message-Id: <20210816024522.143124-2-wangyanan55@huawei.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  hw/core/machine.c | 14 ++++++++++++++
>  qapi/machine.json |  6 +++---
>  qemu-options.hx   | 12 +++++++-----
>  3 files changed, 24 insertions(+), 8 deletions(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 54e040587dd..a7e119469aa 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -832,6 +832,20 @@ static void machine_set_smp(Object *obj, Visitor *v,
> const char *name,
>          return;
>      }
>
> +    /*
> +     * A specified topology parameter must be greater than zero,
> +     * explicit configuration like "cpus=0" is not allowed.
> +     */
> +    if ((config->has_cpus && config->cpus == 0) ||
> +        (config->has_sockets && config->sockets == 0) ||
> +        (config->has_dies && config->dies == 0) ||
> +        (config->has_cores && config->cores == 0) ||
> +        (config->has_threads && config->threads == 0) ||
> +        (config->has_maxcpus && config->maxcpus == 0)) {
> +        error_setg(errp, "CPU topology parameters must be greater than
> zero");
> +        goto out_free;
> +    }
> +
>      mc->smp_parse(ms, config, errp);
>      if (*errp) {
>          goto out_free;
> diff --git a/qapi/machine.json b/qapi/machine.json
> index c3210ee1fb2..9272cb3cf8b 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1288,8 +1288,8 @@
>  ##
>  # @SMPConfiguration:
>  #
> -# Schema for CPU topology configuration.  "0" or a missing value lets
> -# QEMU figure out a suitable value based on the ones that are provided.
> +# Schema for CPU topology configuration. A missing value lets QEMU
> +# figure out a suitable value based on the ones that are provided.
>  #
>  # @cpus: number of virtual CPUs in the virtual machine
>  #
> @@ -1297,7 +1297,7 @@
>  #
>  # @dies: number of dies per socket in the CPU topology
>  #
> -# @cores: number of cores per thread in the CPU topology
> +# @cores: number of cores per die in the CPU topology
>  #
>  # @threads: number of threads per core in the CPU topology
>  #
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 83aa59a920f..aee622f577d 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -227,11 +227,13 @@ SRST
>      of computing the CPU maximum count.
>
>      Either the initial CPU count, or at least one of the topology
> parameters
> -    must be specified. Values for any omitted parameters will be computed
> -    from those which are given. Historically preference was given to the
> -    coarsest topology parameters when computing missing values (ie sockets
> -    preferred over cores, which were preferred over threads), however,
> this
> -    behaviour is considered liable to change.
> +    must be specified. The specified parameters must be greater than zero,
> +    explicit configuration like "cpus=0" is not allowed. Values for any
> +    omitted parameters will be computed from those which are given.
> +    Historically preference was given to the coarsest topology parameters
> +    when computing missing values (ie sockets preferred over cores, which
> +    were preferred over threads), however, this behaviour is considered
> +    liable to change.
>  ERST
>
>  DEF("numa", HAS_ARG, QEMU_OPTION_numa,
> --
> 2.31.1
>
>

--00000000000053c2c305c9b402ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">How do we know that no one has ever used such configurati=
on? The conversion was meant to be bug-compatible.<div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Paolo</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Il lun 16 ago 2021, 23:06 Eduardo Habkost &=
lt;<a href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.com</a>&gt; ha sc=
ritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">From: Yanan Wang &lt;<a href=
=3D"mailto:wangyanan55@huawei.com" target=3D"_blank" rel=3D"noreferrer">wan=
gyanan55@huawei.com</a>&gt;<br>
<br>
In the SMP configuration, we should either provide a topology<br>
parameter with a reasonable value (greater than zero) or just<br>
omit it and QEMU will compute the missing value. Users should<br>
have never provided a configuration with parameters as zero<br>
(e.g. -smp 8,sockets=3D0) which should be treated as invalid.<br>
<br>
But commit 1e63fe68580 (machine: pass QAPI struct to mc-&gt;smp_parse)<br>
has added some doc which implied that &#39;anything=3D0&#39; is valid and<b=
r>
has the same semantics as omitting a parameter.<br>
<br>
To avoid meaningless configurations possibly introduced by users<br>
in the future and consequently a necessary deprecation process,<br>
fix the doc and also add the corresponding sanity check.<br>
<br>
Fixes: 1e63fe68580 (machine: pass QAPI struct to mc-&gt;smp_parse)<br>
Suggested-by: Andrew Jones &lt;<a href=3D"mailto:drjones@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">drjones@redhat.com</a>&gt;<br>
Signed-off-by: Yanan Wang &lt;<a href=3D"mailto:wangyanan55@huawei.com" tar=
get=3D"_blank" rel=3D"noreferrer">wangyanan55@huawei.com</a>&gt;<br>
Reviewed-by: Daniel P. Berrange &lt;<a href=3D"mailto:berrange@redhat.com" =
target=3D"_blank" rel=3D"noreferrer">berrange@redhat.com</a>&gt;<br>
Tested-by: Daniel P. Berrange &lt;<a href=3D"mailto:berrange@redhat.com" ta=
rget=3D"_blank" rel=3D"noreferrer">berrange@redhat.com</a>&gt;<br>
Reviewed-by: Andrew Jones &lt;<a href=3D"mailto:drjones@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">drjones@redhat.com</a>&gt;<br>
Reviewed-by: Cornelia Huck &lt;<a href=3D"mailto:cohuck@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">cohuck@redhat.com</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20210816024522.143124-2-wangyanan55@huawe=
i.com" target=3D"_blank" rel=3D"noreferrer">20210816024522.143124-2-wangyan=
an55@huawei.com</a>&gt;<br>
Signed-off-by: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" t=
arget=3D"_blank" rel=3D"noreferrer">ehabkost@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/core/machine.c | 14 ++++++++++++++<br>
=C2=A0qapi/machine.json |=C2=A0 6 +++---<br>
=C2=A0qemu-options.hx=C2=A0 =C2=A0| 12 +++++++-----<br>
=C2=A03 files changed, 24 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/hw/core/machine.c b/hw/core/machine.c<br>
index 54e040587dd..a7e119469aa 100644<br>
--- a/hw/core/machine.c<br>
+++ b/hw/core/machine.c<br>
@@ -832,6 +832,20 @@ static void machine_set_smp(Object *obj, Visitor *v, c=
onst char *name,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* A specified topology parameter must be greater than =
zero,<br>
+=C2=A0 =C2=A0 =C2=A0* explicit configuration like &quot;cpus=3D0&quot; is =
not allowed.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if ((config-&gt;has_cpus &amp;&amp; config-&gt;cpus =3D=3D 0=
) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (config-&gt;has_sockets &amp;&amp; config-&gt;=
sockets =3D=3D 0) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (config-&gt;has_dies &amp;&amp; config-&gt;die=
s =3D=3D 0) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (config-&gt;has_cores &amp;&amp; config-&gt;co=
res =3D=3D 0) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (config-&gt;has_threads &amp;&amp; config-&gt;=
threads =3D=3D 0) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (config-&gt;has_maxcpus &amp;&amp; config-&gt;=
maxcpus =3D=3D 0)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;CPU topology parameters=
 must be greater than zero&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_free;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;smp_parse(ms, config, errp);<br>
=C2=A0 =C2=A0 =C2=A0if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_free;<br>
diff --git a/qapi/machine.json b/qapi/machine.json<br>
index c3210ee1fb2..9272cb3cf8b 100644<br>
--- a/qapi/machine.json<br>
+++ b/qapi/machine.json<br>
@@ -1288,8 +1288,8 @@<br>
=C2=A0##<br>
=C2=A0# @SMPConfiguration:<br>
=C2=A0#<br>
-# Schema for CPU topology configuration.=C2=A0 &quot;0&quot; or a missing =
value lets<br>
-# QEMU figure out a suitable value based on the ones that are provided.<br=
>
+# Schema for CPU topology configuration. A missing value lets QEMU<br>
+# figure out a suitable value based on the ones that are provided.<br>
=C2=A0#<br>
=C2=A0# @cpus: number of virtual CPUs in the virtual machine<br>
=C2=A0#<br>
@@ -1297,7 +1297,7 @@<br>
=C2=A0#<br>
=C2=A0# @dies: number of dies per socket in the CPU topology<br>
=C2=A0#<br>
-# @cores: number of cores per thread in the CPU topology<br>
+# @cores: number of cores per die in the CPU topology<br>
=C2=A0#<br>
=C2=A0# @threads: number of threads per core in the CPU topology<br>
=C2=A0#<br>
diff --git a/qemu-options.hx b/qemu-options.hx<br>
index 83aa59a920f..aee622f577d 100644<br>
--- a/qemu-options.hx<br>
+++ b/qemu-options.hx<br>
@@ -227,11 +227,13 @@ SRST<br>
=C2=A0 =C2=A0 =C2=A0of computing the CPU maximum count.<br>
<br>
=C2=A0 =C2=A0 =C2=A0Either the initial CPU count, or at least one of the to=
pology parameters<br>
-=C2=A0 =C2=A0 must be specified. Values for any omitted parameters will be=
 computed<br>
-=C2=A0 =C2=A0 from those which are given. Historically preference was give=
n to the<br>
-=C2=A0 =C2=A0 coarsest topology parameters when computing missing values (=
ie sockets<br>
-=C2=A0 =C2=A0 preferred over cores, which were preferred over threads), ho=
wever, this<br>
-=C2=A0 =C2=A0 behaviour is considered liable to change.<br>
+=C2=A0 =C2=A0 must be specified. The specified parameters must be greater =
than zero,<br>
+=C2=A0 =C2=A0 explicit configuration like &quot;cpus=3D0&quot; is not allo=
wed. Values for any<br>
+=C2=A0 =C2=A0 omitted parameters will be computed from those which are giv=
en.<br>
+=C2=A0 =C2=A0 Historically preference was given to the coarsest topology p=
arameters<br>
+=C2=A0 =C2=A0 when computing missing values (ie sockets preferred over cor=
es, which<br>
+=C2=A0 =C2=A0 were preferred over threads), however, this behaviour is con=
sidered<br>
+=C2=A0 =C2=A0 liable to change.<br>
=C2=A0ERST<br>
<br>
=C2=A0DEF(&quot;numa&quot;, HAS_ARG, QEMU_OPTION_numa,<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div>

--00000000000053c2c305c9b402ae--


