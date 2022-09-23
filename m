Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 106145E82BC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 21:53:57 +0200 (CEST)
Received: from localhost ([::1]:55118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obokF-0002Pj-Ib
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 15:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oboiW-00012Z-2J
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 15:52:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oboiS-0007Mq-HM
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 15:52:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663962722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XQkSbJgU5XN3zM47Yjnkme9L+LmisekC1RORPvL6yuw=;
 b=EsiY5j8PjlbdDC4EhNE5Iamb5W16wSALkU/L2usuA6oFVWFLbajOKu7KNUPMhhIpAEMsq6
 6sFLfZHz2Lh5ho2+Wrp3MgxV3dD/YirRHmLkUWC5qQBhhbR6XhoGPVGG5u5ggxT1WtPnb0
 S+lNG/Vi6sObZ7xEg2bukp/EUkkyZLg=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-uIAxjiQJPcqG-StbQp5HJA-1; Fri, 23 Sep 2022 15:52:01 -0400
X-MC-Unique: uIAxjiQJPcqG-StbQp5HJA-1
Received: by mail-lj1-f199.google.com with SMTP id
 j17-20020a2e8511000000b0026c75c907c0so298044lji.7
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 12:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=XQkSbJgU5XN3zM47Yjnkme9L+LmisekC1RORPvL6yuw=;
 b=vcSvJB8wkti3naGlKdUIxuQ5c7cYqKY/N6xHSjYx5reM4i6NV37ZTuCgua+C8sesTe
 XihvhfdIgQGlngSgISZW9MUznmBSIOVVZDd489/wn/mIwMleuwzIn8s4Fih8FM9809/+
 Zds03mXgJ7kpIICdt+jvkaWwRzPmHVzPmjELAxSjNhIlTwtvHoAUab/U5/V1hl5f4KGi
 207CmIiWJgr9SI8vWFYW5DktDePtsvb9s+0ob/agEV3vzVyZA1G8FT7LL/sFwYdgVb+Y
 vQXJVrmUnLI/f1D7Gr1ZclgyJ/dQYOkMybxGuz347pmtFL867kHACkiAxKQeUBDn+PIw
 pkQQ==
X-Gm-Message-State: ACrzQf18XFy4xlRS0XnCdDIdPM/eaAsz40SSLZ9zFcQHae2KpyuJneY+
 iy6H1FWwtsw4FSr4zNU4TlWQ3vP8qdfZ+Fau5GEOMybw5kCsAJ8u2USOea5MAliFr9MuLA/PwqG
 FpmT9juZoCOHYJzZuvKpwAqyjZ+HY7Bw=
X-Received: by 2002:a05:6512:3b9d:b0:498:fc06:320b with SMTP id
 g29-20020a0565123b9d00b00498fc06320bmr3666874lfv.21.1663962720223; 
 Fri, 23 Sep 2022 12:52:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4gMH2J4hH6lI3qaFXejHjDxGYv7GvUMVDcPH7CfE+sxO3G8EslpqCfoT90/9T4N9MaIa84gZCpLNxLm/MPKow=
X-Received: by 2002:a05:6512:3b9d:b0:498:fc06:320b with SMTP id
 g29-20020a0565123b9d00b00498fc06320bmr3666857lfv.21.1663962719933; Fri, 23
 Sep 2022 12:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn=p-ZkKLQtYAwzkQb7srFf_fF8ij+g5wkZiRofx4U+kSZ7Rw@mail.gmail.com>
 <87v8pzwgbm.fsf@pond.sub.org>
In-Reply-To: <87v8pzwgbm.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Fri, 23 Sep 2022 15:51:48 -0400
Message-ID: <CAFn=p-bR8BZ_7D+GiLAqO83ACxKNDg6+pZC0smZjYVFc_Y7viw@mail.gmail.com>
Subject: Re: Maximum QMP reply size
To: Markus Armbruster <armbru@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Wed, Sep 7, 2022 at 7:54 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> John Snow <jsnow@redhat.com> writes:
>
> > Hi, I suspect I have asked this before, but I didn't write it down in
> > a comment, so I forget my justification...
> >
> > In the QMP lib, we need to set a buffering limit for how big a QMP
> > message can be -- In practice, I found that the largest possible
> > response was the QAPI schema reply, and I set the code to this:
> >
> >     # Maximum allowable size of read buffer
> >     _limit = (64 * 1024)
> >
> > However, I didn't document if this was a reasonable limit or just a
> > "worksforme" one. I assume that there's no hard limit for the protocol
> > or the implementation thereof in QEMU. Is there any kind of value here
> > that would be more sensible than another?
> >
> > I'm worried that if replies get bigger in the future (possibly in some
> > degenerate case I am presently unaware of) that the library default
> > will become nonsensical.
> >
> > Any pointers/tips?
>
> Peter and Daniel already provided some.  I can add a bit of insight into
> how QMP output works in QEMU, which may or may not help you.
>
> QEMU executes one command after the other.  A command's response
> (success or failure) is a QDict.  Which is then formatted as JSON and
> appended to the monitor's output buffer.
>
> Events work similarly.
>
> The conversion to JSON does not limit the resulting string's size.  If
> it runs out of memory, QEMU dies.
>
> The output buffer is also unbounded.  It drains into the monitor's
> character device.
>
> If the QMP client sends enough commands without reading their responses,
> QEMU can run out of memory and die.
>
> Now I'm ready to go back to your question, which is about a *single*
> message (QMP command response or event): nothing in QEMU limits the size
> of the QMP output message text.
>
> Weak consolation: I guess QEMU is somewhat likely to run out of memory
> and die before your client software does.  That's because QDict is a
> pig: an empty one eats 4120 Bytes on my system.  Compares unfavourable
> to its text representation "{}".
>

(Oops, I realize that my response was never sent, sending that now:)

Thanks for the responses, everyone.

I think I will leave it at 64KB for now, but the limit is absolutely
configurable; I will just document what the limit is and document how
to change it in the case you want to use QMP to do some really heavy
lifting. In practice, there's no unit test in our tree currently that
seems to blow through the 64KB, but I'll just make sure to pay some
attention to it in the docs.

... Or, maybe I'll set it to 10MB to match libvirt ("Well, it's good
enough for this other project" is always a fantastic justification),
but I need to profile how Python actually behaves in this case. If
it's just an upper-bound, I think that's no problem at all.

Thanks!

--js

PS: After reading further discussion that has happened since: The
problem is the readline buffer size in Python; since we don't have a
"streaming" JSON parser, we rely on readline to get "the next chunk of
data", and that buffer has a limit it adheres to. It is possible that
in the future if we switch to a different parsing method that this
limit would "go away", but it's not clear that this is a great idea.
In practice, it's probably reasonable that the client dies on input of
a certain size. Probably.


