Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE1443BBDF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 22:53:31 +0200 (CEST)
Received: from localhost ([::1]:52132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfTRq-0000t2-NA
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 16:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfTOo-0006jl-1r
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:50:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfTOm-0004Bq-4U
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635281419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+qB2fy6LSrF0zb3inyyel0/osOitvVm+lQp9JD6PvSQ=;
 b=AK67tlwd+KC6UWflgBUl85VKaoQIiEbscedPOjclgtjY+5XF97/EnFy0w2ooBAm3Zw0AjH
 sL63B6ZYp43kACs9CnNclbtwnbdDFc5SdqyPvZ3yEI38sYgE3hxxVyaO43vGOVI6ulxpYc
 16wdzIVUWQlL62s6LraKUlPEb60V5Cs=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-RJaWchtaNBinG9gkaVPfhw-1; Tue, 26 Oct 2021 16:50:16 -0400
X-MC-Unique: RJaWchtaNBinG9gkaVPfhw-1
Received: by mail-vk1-f198.google.com with SMTP id
 n13-20020ac5c88d000000b002dc8bace789so364527vkl.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 13:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+qB2fy6LSrF0zb3inyyel0/osOitvVm+lQp9JD6PvSQ=;
 b=CZcfNS2N69DMTzYd/TcSH/Bn74CIzmXf+CRhuJhd/xjlJBQlAV9z9RP66MW8tjQxZf
 rvsg5yoaBIqN4QlAKSx6WZ6O2Q+aIAW+cLRlZTxYZr28LmwVDsg05X1LwL39svuUyaRq
 1KuM0ddmsWjQfMQ/1IebO7ss5qVdU7nVcw7Jpn+uSH941YLMnBdbj8gsH9Gc/PfZYt44
 162G++f+49OdTNuj5j7kqCI1P7spBwLJVSIrNwG4GM0ZcuczXwsWcDZ6N6UjSVrXJB9b
 PcPEeDMvQGomZq29RVM0XE9BdnjW8B+hDX7uIH4lYePnaloKZSYviIBB+Nxd2CTmXBrf
 PasA==
X-Gm-Message-State: AOAM5306dm8R5KvBz7bg59m7u30rK1IqBMqSgrbtgBhGLOs+fpaz8KdW
 KNFSHj3Cd9q8q6OhCM5/LMijOFFsI9a/ma87YYw8QkyZtHVa8ZNNPxbJNGeU26mkzKbmz9Ib0pN
 ZfciEy6P9rP4Ug0EYpwWGXK422sRDmRk=
X-Received: by 2002:a67:ed07:: with SMTP id l7mr26286405vsp.40.1635281415638; 
 Tue, 26 Oct 2021 13:50:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhglDrnTAy0nYhqqEjWV4/s7D3S8sQavI+pNAY6t6h0ROnpcUFtw/8w5UKsd7xpdMOi/TFnEPUcHZxavk0fRc=
X-Received: by 2002:a67:ed07:: with SMTP id l7mr26286370vsp.40.1635281415423; 
 Tue, 26 Oct 2021 13:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211025042405.3762351-1-armbru@redhat.com>
 <20211025042405.3762351-4-armbru@redhat.com>
In-Reply-To: <20211025042405.3762351-4-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 26 Oct 2021 16:50:04 -0400
Message-ID: <CAFn=p-aVaPo__uQBCSVYCRozraOW=QycLZwREhYC6mTs9DB80A@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] qapi: Move compat policy from QObject to generic
 visitor
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000dfdeb405cf479f9e"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, libvir-list@redhat.com,
 qemu-devel <qemu-devel@nongnu.org>, mdroth@linux.vnet.ibm.com,
 Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000dfdeb405cf479f9e
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 25, 2021 at 12:24 AM Markus Armbruster <armbru@redhat.com>
wrote:

> The next commit needs to access compat policy from the generic visitor
> core.  Move it there from qobject input and output visitor.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>

"LGTM".

--000000000000dfdeb405cf479f9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 25, 2021 at 12:24 AM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The=
 next commit needs to access compat policy from the generic visitor<br>
core.=C2=A0 Move it there from qobject input and output visitor.<br>
<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br>
Reviewed-by: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com" target=3D"=
_blank">eblake@redhat.com</a>&gt;<br></blockquote><div><br></div><div>&quot=
;LGTM&quot;.<br></div></div></div>

--000000000000dfdeb405cf479f9e--


