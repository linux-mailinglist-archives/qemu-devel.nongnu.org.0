Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED2A39C92C
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 16:42:14 +0200 (CEST)
Received: from localhost ([::1]:36970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpXV7-0007TP-8b
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 10:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lpXTk-0006gA-D3
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 10:40:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lpXTh-0003ne-3l
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 10:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622904043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=voU4Xyh4hW27LFDojCEzF/ejQp3Eo5fNUAyzf5h5/Xs=;
 b=GPl38PlO8ybC1xvDV26vYMFn6VjNA8Bixrk8gz/WTa6QcFDkBRVjyqaFsaYR1fjF3V2Cla
 j2W3+mGAXCFr8McxZPAKtqR3bIFAPwoCmlqnzU8U+yaBIe/GaHYFQqfYY055jvMjDLr61I
 8cXsosyFnzfWkSPQZdjFTCYspMAA77g=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-ZvH-J21NPOWzyhdhDCjXng-1; Sat, 05 Jun 2021 10:40:39 -0400
X-MC-Unique: ZvH-J21NPOWzyhdhDCjXng-1
Received: by mail-pj1-f72.google.com with SMTP id
 lb17-20020a17090b4a51b029016bc5d1a583so4096014pjb.4
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 07:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=voU4Xyh4hW27LFDojCEzF/ejQp3Eo5fNUAyzf5h5/Xs=;
 b=iOekzFqsCLErJb5t8Re0ex5MMdiFrzQ85C18btRrcH405a5TxSXlhCiHDAD4orAoqK
 dqs2gkdKjECzVHyU3228uOspUmi/gVbiEarrLDXXlDghKHFpewo4RsOH4M5iaVmQyfLv
 bSSmFYh8VjJmPWrsuAV350FD7wrbaRTllfn1LIGnailjYRK6vTW9+5fcKjr2PSDv1SoU
 h9KPZXc+ZpaB36w5bpZlrGnohO3YTPLLm878yAyQSTCiRVbxdGli1ZfkCCy6RNeFO0/C
 kIf44eUEIoX5b+idFj3SQTCWO3OPblQqIdgpHq6PDSGHWi1u7cn41fqYhUwLotE/HXFU
 N0lA==
X-Gm-Message-State: AOAM531yOTxkse0FtMoYDGMY0DtbFQVcvc1IvOkZV2EjDwjYNpdl+g+S
 ldL+w9f9PexLunJRumc6/yceDo+hlBFd31ltn9k8lIprpcP9V//zB27JRz7QnFXK3PHF+yPfYwx
 KLdjcwezxdOY1ygZiqoPYVIbw1An7DmM=
X-Received: by 2002:a63:3c17:: with SMTP id j23mr80920pga.281.1622904038393;
 Sat, 05 Jun 2021 07:40:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbOl57zvu+p+ZzwCNd9O/KnLzr9AJe1qixGXOnPGXF4Ac9qbgp2TWOVJlXLSEmQDJnq1HuJB+b1or4ZkM4QV0=
X-Received: by 2002:a63:3c17:: with SMTP id j23mr80900pga.281.1622904038065;
 Sat, 05 Jun 2021 07:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
 <20210513082549.114275-6-mirela.grujic@greensocs.com>
 <20210604142555.tbepaxhhbnhfov4g@redhat.com>
In-Reply-To: <20210604142555.tbepaxhhbnhfov4g@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 5 Jun 2021 16:40:26 +0200
Message-ID: <CABgObfb1186eUP2inkpcB8p3MGj9ax-7cVhwME0+E9B3Yp+cLg@mail.gmail.com>
Subject: Re: [RFC PATCH 5/9] qapi: Implement 'next-machine-phase' command
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b1af2d05c405caa5"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b1af2d05c405caa5
Content-Type: text/plain; charset="UTF-8"

Il ven 4 giu 2021, 16:26 Eric Blake <eblake@redhat.com> ha scritto:

> As an API, this command seems awkward.  How do I query what phase I'm
> currently in?  How many times do I have to call it?  Do we anticipate
> the number of times I need to call it to change in future qemu
> releases?
>

Indeed this has been changed in the last version of the proposal. There
will be an x-machine-init command and the existing x-exit-preconfig.

Paolo


> Would it be better to require me to pass an enum parameter stating the
> phase I intend to move into (and error out if that is not actually the
> next phase), where the introspection of the enum tells me how many
> times to use this command?  Should this command return a struct
> containing "new-state":"enum-value" telling me what state I moved to
> on success?
>
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>
>

--000000000000b1af2d05c405caa5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 4 giu 2021, 16:26 Eric Blake &lt;<a href=3D"mai=
lto:eblake@redhat.com">eblake@redhat.com</a>&gt; ha scritto:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">As an API, this command seems awkward.=C2=A0 How =
do I query what phase I&#39;m<br>
currently in?=C2=A0 How many times do I have to call it?=C2=A0 Do we antici=
pate<br>
the number of times I need to call it to change in future qemu<br>
releases?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Indeed this has been changed in the last version of the proposal.=
 There will be an x-machine-init command and the existing x-exit-preconfig.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"=
auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
<br>
Would it be better to require me to pass an enum parameter stating the<br>
phase I intend to move into (and error out if that is not actually the<br>
next phase), where the introspection of the enum tells me how many<br>
times to use this command?=C2=A0 Should this command return a struct<br>
containing &quot;new-state&quot;:&quot;enum-value&quot; telling me what sta=
te I moved to<br>
on success?<br>
<br>
<br>
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3266<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer norefer=
rer" target=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.org" rel=3D=
"noreferrer noreferrer" target=3D"_blank">libvirt.org</a><br>
<br>
</blockquote></div></div></div>

--000000000000b1af2d05c405caa5--


