Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA94A600BA8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 11:57:00 +0200 (CEST)
Received: from localhost ([::1]:38808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okMrj-0007Ox-RG
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 05:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1okMhV-000226-Dq
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:46:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1okMhB-00061O-5O
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:46:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665999961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jiPtbY4+imLxwpF4DiK54GEYDGu+K3ZD0l+4u6p8wwg=;
 b=Lr4ja49lMzYSIOU7z8ajkNTalqnGsFPK3ypPD+pSqoRDV3A03RSnzx2zuHV79H0zsbZu4y
 xxhyxVFJEHVbI9q92ox5kFf/Srj3ddRZ1Wfxyr/J+X972BQK825LLsRY2OtgJtQWRvczHk
 0wb7A38CGhO05Hw4p7IkKNPDpjuW338=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-434-pHbXt7qcNsS7WVMsRHGorA-1; Mon, 17 Oct 2022 05:45:59 -0400
X-MC-Unique: pHbXt7qcNsS7WVMsRHGorA-1
Received: by mail-ot1-f71.google.com with SMTP id
 j15-20020a056830270f00b00661a16999d6so4743037otu.5
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 02:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jiPtbY4+imLxwpF4DiK54GEYDGu+K3ZD0l+4u6p8wwg=;
 b=FmXlx5IECiSj0shKHOOR2jJlDxdSUhDcAPk7bkTdA+0Y1wgZUfMBo0/9rxpmy31wZR
 +BLA1EyNU5Jzb2+s0q6CaI+jHLq88ixjmmMDZzpAS2+xrPok/5WUZQcaTjcdWe66T87M
 s/6/mc1u6w1Bj2m8deQpHtwny3t0ebmxePFu0pjCmViyZOJsQlpDYd2IcluC6K7Qrf4N
 cLula1UIsXmxCbxsCuze+iXKo1mXc9gmeA9hydKMyA+A2bXOpEK9B1Ditq1von7LXJez
 Orm4zzdrViuIMnq4vkehmjaWuq/U2vBRAQ9zTX+LXZH+i1ch5qPzKUW5iLf4fhMO0767
 Reug==
X-Gm-Message-State: ACrzQf35SljBO5uc56Jo/yY9gWSKszZFyTdNHSC0EHvJzhePg0Aqj9sN
 w7+HmWcQpd92yrJpdJ14F9nMIT7qTqsdnN60GWDmChNWy7TskAADeuxQmVzL5KrDnrh/hK1PBQI
 TbwEiXCZum9YNMy5LKNhTCVUV1uwAoqA=
X-Received: by 2002:a4a:9586:0:b0:448:5e55:a122 with SMTP id
 o6-20020a4a9586000000b004485e55a122mr3910524ooi.61.1665999958626; 
 Mon, 17 Oct 2022 02:45:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6jq0oXoEfRpez4326EhZaYycGBJuf9FHAO2wTeFDE/b1VSYAjxc6XhnOj0/rd1Rho1U2Rc1YgQgN3MZDd1tNA=
X-Received: by 2002:a4a:9586:0:b0:448:5e55:a122 with SMTP id
 o6-20020a4a9586000000b004485e55a122mr3910509ooi.61.1665999958388; Mon, 17 Oct
 2022 02:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221017083822.43118-1-frankja@linux.ibm.com>
 <20221017083822.43118-5-frankja@linux.ibm.com>
In-Reply-To: <20221017083822.43118-5-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 17 Oct 2022 13:45:45 +0400
Message-ID: <CAMxuvazxY0Oa_GffBuY1ud=gXcu-KieZ0JYeYnyexj+A=QQ42g@mail.gmail.com>
Subject: Re: [PATCH v6 04/10] dump: Reintroduce memory_offset and
 section_offset
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com, 
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org, 
 seiden@linux.ibm.com, scgl@linux.ibm.com
Content-Type: multipart/alternative; boundary="000000000000b7463c05eb37d731"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
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

--000000000000b7463c05eb37d731
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2022 at 12:39 PM Janosch Frank <frankja@linux.ibm.com>
wrote:

> section_offset will later be used to store the offset to the section
> data which will be stored last. For now memory_offset is only needed
> to make section_offset look nicer.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  dump/dump.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index b168a25321..626f7b2fd0 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -1876,6 +1876,8 @@ static void dump_init(DumpState *s, int fd, bool
> has_format,
>          s->phdr_offset =3D s->shdr_offset + sizeof(Elf32_Shdr) *
> s->shdr_num;
>          s->note_offset =3D s->phdr_offset + sizeof(Elf32_Phdr) *
> s->phdr_num;
>      }
> +    s->memory_offset =3D s->note_offset + s->note_size;
> +    s->section_offset =3D s->memory_offset + s->total_size;
>
>      return;
>
> --
> 2.34.1
>
>

--000000000000b7463c05eb37d731
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 17, 2022 at 12:39 PM Jano=
sch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" target=3D"_blank">fr=
ankja@linux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">section_offset will later be used to store the offset to=
 the section<br>
data which will be stored last. For now memory_offset is only needed<br>
to make section_offset look nicer.<br>
<br>
Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" t=
arget=3D"_blank">frankja@linux.ibm.com</a>&gt;<br></blockquote><div><br></d=
iv><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre=
.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<b=
r><br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0dump/dump.c | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index b168a25321..626f7b2fd0 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -1876,6 +1876,8 @@ static void dump_init(DumpState *s, int fd, bool has_=
format,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;phdr_offset =3D s-&gt;shdr_offset +=
 sizeof(Elf32_Shdr) * s-&gt;shdr_num;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;note_offset =3D s-&gt;phdr_offset +=
 sizeof(Elf32_Phdr) * s-&gt;phdr_num;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 s-&gt;memory_offset =3D s-&gt;note_offset + s-&gt;note_size;=
<br>
+=C2=A0 =C2=A0 s-&gt;section_offset =3D s-&gt;memory_offset + s-&gt;total_s=
ize;<br>
<br>
=C2=A0 =C2=A0 =C2=A0return;<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000b7463c05eb37d731--


