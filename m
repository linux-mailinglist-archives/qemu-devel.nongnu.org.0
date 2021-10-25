Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 821DA43A23B
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 21:45:04 +0200 (CEST)
Received: from localhost ([::1]:36640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf5u3-0003zl-Il
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 15:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mf5o0-0005Ny-PU
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:38:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mf5nz-00015p-81
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635190726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ph6vQkKq7w/sax6kS5skjQfNz/CTNH5FMXenqvfLPPU=;
 b=SHL0sc8jVHO5VfrQbEQQd4OaBUV/ku5+9s0HluZJviSMxr8eBN6mtM7/aQPOWWUQiWUbjV
 PRo06k7MFkEVaxNHZHdtU9sBwZ7vZyc6T7p1LGNgkZzfPlmkThpFQki3v8uSLIUJrpxzBW
 i6n1A0oyLapu6FRTXD4KpC3UnDcF3rQ=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-MrqOBnz7OEG_bWZLDJaMoQ-1; Mon, 25 Oct 2021 15:38:44 -0400
X-MC-Unique: MrqOBnz7OEG_bWZLDJaMoQ-1
Received: by mail-vk1-f197.google.com with SMTP id
 d11-20020ac5c54b000000b002dc649cb6b7so1753853vkl.8
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 12:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ph6vQkKq7w/sax6kS5skjQfNz/CTNH5FMXenqvfLPPU=;
 b=d/kUyScQQBLhX4oYl0xlJr7OxVb8tBt5HSeoK70iDbInLZx3t5aYUXi1bBwpUAQGky
 cwTnKGZm3mZioFq7vG/6lgZ1fUlHdibrZKJTId4UWoczcryv+0eROTPbKmSyYTNTxxQQ
 b3i2gT8+kijjBxnb+YwGyNIDX6BCvZamKJIVmv2UxqAYFCUoga74yeC+13Q8qhrHe1HB
 RbSiHzN3dIMBv3wu3vKjL/fTpiemVkmB1P8BZHEf+HL27IrRADyudjrQFen5trpBWKYz
 uKfQ9S00qgr8Q2ILivyjcSWnRaVrhOeTw/Wi56rm4/6r1GNsB0qmF0KOF+JKZQMa+U2M
 kTxQ==
X-Gm-Message-State: AOAM533Iwz3J1yUSPLZNQ4GNrcB46V1aI0Azxrp2AabPuPMFn42HnzET
 c2wzDHmUmcCGRwchd3AEdPNfuKKG5wCbbiEOa5i66sHqZ1JKjNVNm0RtCB3RVG1i0YjUDNSYbfj
 JZQIyAVpEbPEoguVDqDsz5Yyq7Jw/DDw=
X-Received: by 2002:ab0:4e14:: with SMTP id g20mr16842424uah.50.1635190724036; 
 Mon, 25 Oct 2021 12:38:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7nSCR+T6HQSY6bj/RO0WtQhF8YQ1qYJfveQQ4jzq/kqk3Gs6CaLnk6M7dkVJZecuu2f7ZDiK/xmWFP5SQ4i4=
X-Received: by 2002:ab0:4e14:: with SMTP id g20mr16842392uah.50.1635190723808; 
 Mon, 25 Oct 2021 12:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-9-armbru@redhat.com>
In-Reply-To: <20211025052532.3859634-9-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 25 Oct 2021 15:38:33 -0400
Message-ID: <CAFn=p-ZNYjx-Vmkf0qoydr=Wer102uw7ps8MjU4gRycFhECYsA@mail.gmail.com>
Subject: Re: [PATCH 8/9] qapi: Factor out compat_policy_input_ok()
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000003ba4be05cf3282f2"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 libvir-list@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
 mdroth@linux.vnet.ibm.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003ba4be05cf3282f2
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 25, 2021 at 1:25 AM Markus Armbruster <armbru@redhat.com> wrote:

> The code to check policy for handling deprecated input is triplicated.
> Factor it out into compat_policy_input_ok() before I mess with it in
> the next commit.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>


(Skipping C-only patches for quick review. I'll trust you on these.)

--js

--0000000000003ba4be05cf3282f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 25, 2021 at 1:25 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The =
code to check policy for handling deprecated input is triplicated.<br>
Factor it out into compat_policy_input_ok() before I mess with it in<br>
the next commit.<br>
<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div><br></div><div>(Skipping C-only patches for quick review. I&#39;ll trus=
t you on these.)</div><div><br></div><div>--js</div><br></div></div>

--0000000000003ba4be05cf3282f2--


