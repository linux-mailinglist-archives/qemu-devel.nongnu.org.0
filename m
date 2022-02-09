Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E843B4AFDAE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 20:47:32 +0100 (CET)
Received: from localhost ([::1]:48912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHsw7-00087T-HH
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 14:47:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nHspl-0005Gk-PA
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 14:40:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nHspg-0003QJ-Ez
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 14:40:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644435650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OCjAK8F8H1ZEp/2hvWKkG5ul8FbEzsNUZdeLKcaLe8Y=;
 b=TtcEqIltTD3IKic8JSywNnTmeF2WsQ7DUm1II+qAMtjSENUksz6M41T8qg9bhVtDV8BGWO
 6g9sx8igkR1IRbA2sMFeyrHdMHUTewo3Pdrf0lZYLGqT8fiAo5WiFG+ARrOOd4O7Ykzr94
 ASWv96dCQqpjHTiL0R/5dJBqPg6x8Dw=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-W0xaFYFVMSiX5hpxtV5NtA-1; Wed, 09 Feb 2022 14:40:47 -0500
X-MC-Unique: W0xaFYFVMSiX5hpxtV5NtA-1
Received: by mail-ua1-f70.google.com with SMTP id
 q19-20020ab04a13000000b002fef2f854a6so1698062uae.7
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 11:40:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OCjAK8F8H1ZEp/2hvWKkG5ul8FbEzsNUZdeLKcaLe8Y=;
 b=63uDE6ViN+/EDbxmAWVa0pp2B2mOwElj5LmrPTHBoKbEbjugyBv2jIMBvLAtILRrP2
 V+TniXtAsikYj0zAPXCe0QpJ0H3Y0jsp8PTTiSgUTI/NW0AN8LpYhwtVw/ruKiaIXiTR
 nlSVsNRC2B6c5XhDG1KlOB953YoIF6uedFqLLM31D0gj5iQ6lYskT4Zk+CkdNyYj1o6I
 tVT6HYMS6dcb/nXm8xqloRLqeBIyZ5sR1cHdcbrrmoHAPxhGeLERNktMt4k1x+b5Xwzj
 E3HSBpVjWO27YpjFgWZzEuxy7WmsTng143L3EXmqbqhdbYBfiKYDwP6bwajeCdlkNzqJ
 DlHA==
X-Gm-Message-State: AOAM531bxSmyKoePPAQ9EjH2+Qdoh7VfiWMv+AcGSAH6Y9YHB4mQIzOz
 98iSeivrQDhNQbtKcZUTAwbR6KjaGf/H6VDufA0gNMJHYVEHicDTRTArKWgQqN+be7UXXixJuSM
 36hSAqBWmA7i3HRvlAOjIZU3q98xmrdo=
X-Received: by 2002:a05:6122:990:: with SMTP id
 g16mr1366769vkd.3.1644435646396; 
 Wed, 09 Feb 2022 11:40:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdsnPLzjYo8qAUxcOsbDNOMOP6Fxt1eF0t0eZb2RJahQ17RXUTMd4tUrcTyQexw72RlE1KXmighQI2JXslTL0=
X-Received: by 2002:a05:6122:990:: with SMTP id
 g16mr1366758vkd.3.1644435646198; 
 Wed, 09 Feb 2022 11:40:46 -0800 (PST)
MIME-Version: 1.0
References: <20220208000525.2601011-1-jsnow@redhat.com>
 <CAFszQJg5_Hge=rtBZ0ujjh71WRdpYUcfF_KLW0oAUa7aNs_6TQ@mail.gmail.com>
In-Reply-To: <CAFszQJg5_Hge=rtBZ0ujjh71WRdpYUcfF_KLW0oAUa7aNs_6TQ@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 9 Feb 2022 14:40:35 -0500
Message-ID: <CAFn=p-YRtbA8p5int9ceZqDa4xOgohsUxiV3XZazZTQ1k36r0w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: python - remove ehabkost and add bleal
To: Eduardo Habkost <ehabkost@habkost.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 9, 2022 at 10:29 AM Eduardo Habkost <ehabkost@habkost.com> wrote:
>
> On Mon, 7 Feb 2022 at 19:05, John Snow <jsnow@redhat.com> wrote:
> >
> > Eduardo Habkost has left Red Hat and has other daily responsibilities to
> > attend to. In order to stop spamming him on every series, remove him as
> > "Reviewer" for the python/ library dir and add Beraldo Leal instead.
> >
> > For the "python scripts" stanza (which is separate due to level of
> > support), replace Eduardo as maintainer with myself.
> >
> > (Thanks for all of your hard work, Eduardo!)
>
> Thank you! And my apologies for not sending the MAINTAINERS patch
> myself. I'm being unable to deal with the amount of QEMU-related
> traffic directed to my email address.
>
> Acked-by: Eduardo Habkost <eduardo@habkost.net>
>

I assure you no apologies are necessary!

Thanks, I've staged this patch to my Python branch.
--js


