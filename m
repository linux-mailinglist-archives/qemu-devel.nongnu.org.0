Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9CA477AC5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 18:40:07 +0100 (CET)
Received: from localhost ([::1]:41698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxujd-0004oh-Vv
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 12:40:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxugP-0000Nd-6B
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:36:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxugM-0002Eh-R0
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:36:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639676201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZbD+kCvlimoMVjsqwIMmjn7GpRvTvxvutzpNDHvTpdM=;
 b=SgwVdgnUAclpns6RsLCDc+raqvHH2T0Sp3cb7x+2qdwo4hEzOKaJfj5lx1ni09w1DZX+Ql
 iBRS0ypHg/Xlew6MVbuzM5DHQ0seq7VnNN7vN2P0IozwLSyA6Nbe5Ua+w2sEKAG4DayQhV
 U0BTyAbne3hBm7NcO7+sm1OC84r+1PA=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-jP-1wM7FPqySifYZ9Rzk4Q-1; Thu, 16 Dec 2021 12:36:40 -0500
X-MC-Unique: jP-1wM7FPqySifYZ9Rzk4Q-1
Received: by mail-vk1-f197.google.com with SMTP id
 g4-20020ac5c1c4000000b00312a2a1de20so349548vkk.12
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 09:36:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZbD+kCvlimoMVjsqwIMmjn7GpRvTvxvutzpNDHvTpdM=;
 b=btEK6HdI/BznmoeKUCAOoWx1GJCeAJH3onAraD3EVqdzuUOkLTz6Ko1RRIeH9J+GIp
 9Z8sLE/PFK/+iMHRu8Kb0uR315Hgf8k79UsOEtYMR1lvvs9JasRqMdNNUYly+kU+gezF
 YugceWGtR2ZvS1y4n52L3Z8/AuyrWXx2+rIQFIoQSDkb515SB2Df8E1dBlv0Ebg/EJR7
 eoGWyZZc5qaUUKP3PKOcEvG70Fhcgb6a+WKZqbkFVK823j171uKnVCyMWD92sKwHwTaj
 46eV1rq42oGjLwBv+UXTFhA9RbxinuwNav8FAzcQ0siEmU1W5bsfG0FJTIcskPhOyrjt
 Ks9Q==
X-Gm-Message-State: AOAM53275GPg9mQC14XtZr7w9Blr1aXTBNAITnn1eknWLNEbgZPfUy/1
 uGDOXVzqHsDjQ5PvkNs4pC9KlbM8XkYNGMsfZqP3trtV6TPQcJINZ8JCkb/TOJEFgeE6zchRpJ9
 D2N7diig8KQb5xIGyzvJWGgIUAlz0M1E=
X-Received: by 2002:a05:6122:180f:: with SMTP id
 ay15mr6973243vkb.26.1639676199527; 
 Thu, 16 Dec 2021 09:36:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBN/JZYkNyvMqxZR1S/wDGDVqXfyPwN+aMmMnNq8nSjK0XlycMllq7L2gMXpXXN27HsApVwUqQrCGf72dH2zU=
X-Received: by 2002:a05:6122:180f:: with SMTP id
 ay15mr6973220vkb.26.1639676199265; 
 Thu, 16 Dec 2021 09:36:39 -0800 (PST)
MIME-Version: 1.0
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-7-jsnow@redhat.com>
 <c1e17832-3046-541b-de79-b7c4b85024d9@virtuozzo.com>
In-Reply-To: <c1e17832-3046-541b-de79-b7c4b85024d9@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Dec 2021 12:36:28 -0500
Message-ID: <CAFn=p-Yc4+riLWx=_9mvsWgvCaFnKWgWLdV=LmoSBEN28jANzw@mail.gmail.com>
Subject: Re: [PATCH v2 06/25] python/qemu-ga-client: update instructions to
 newer CLI syntax
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000067816905d346ddc1"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Wainer Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000067816905d346ddc1
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 16, 2021 at 5:14 AM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> I had to search a bit through the history to check this )
>
> The commit ccd3b3b8112b670f "qemu-option: warn for short-form boolean
> options" may be noted here.
>
> And may be subject changed to "don't use deprecated syntax in comment" or
> something like this. server=on is not a *new* syntax I think.
>
>
Fair. I've updated the commit message.


> 15.12.2021 22:39, John Snow wrote:
> > Signed-off-by: John Snow <jsnow@redhat.com>
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>
>
Thanks!

--00000000000067816905d346ddc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 16, 2021 at 5:14 AM Vladi=
mir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vse=
mentsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">I had to search a bit through the history to check thi=
s )<br>
<br>
The commit ccd3b3b8112b670f &quot;qemu-option: warn for short-form boolean =
options&quot; may be noted here.<br>
<br>
And may be subject changed to &quot;don&#39;t use deprecated syntax in comm=
ent&quot; or something like this. server=3Don is not a *new* syntax I think=
.<br>
<br></blockquote><div><br></div><div>Fair. I&#39;ve updated the commit mess=
age.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
15.12.2021 22:39, John Snow wrote:<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
<br>
Reviewed-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@=
virtuozzo.com" target=3D"_blank">vsementsov@virtuozzo.com</a>&gt;<br>
<br></blockquote><div><br></div><div>Thanks!<br></div><br></div></div>

--00000000000067816905d346ddc1--


