Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73324AE28D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 21:34:14 +0100 (CET)
Received: from localhost ([::1]:57708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHXBl-0007NF-78
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 15:34:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nHVfp-0000dj-OX
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 13:57:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nHVfk-000356-L6
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 13:57:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644346579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c7txJfuPMyZ9eRNz+K1NBvf3cLUY0TAxWYWt7Fexq20=;
 b=PYMQ9/BAo54mLpH7O2Y66A5puxmb5096egDRFMnYf06MUauC/9fX6dDq5xLiNv9mtqXflL
 3NMG4ll5SbAtGu2tctzFlqkv/ioxmHCDYRS9geH6BgQahkYU+MC1t/oof1zlkmWmbJJ+Cw
 2uJqPwfVUt4g8HHCaplDztAoHWdwF1E=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-0HVoen_SMdOpw4zkWcVMTQ-1; Tue, 08 Feb 2022 13:56:18 -0500
X-MC-Unique: 0HVoen_SMdOpw4zkWcVMTQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 r6-20020ab03246000000b0030c06b68f50so39823uan.15
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 10:56:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c7txJfuPMyZ9eRNz+K1NBvf3cLUY0TAxWYWt7Fexq20=;
 b=qOGjP90NTu48DR2QNWE+afktj78+/pY4iaWw+D7aCdAs9vDa+XrzmbIuSP+NiHcjEX
 8Lwerny0XYKm89N2QePozPjxaLPEJvNrC+cl7lBi3ltjSzVe55ftWTIuDW0tZtHcb4eB
 7gHuGnUp+vszyNxDAYUz/gJo+90BUJOltzMBXxA3RvBLLH5PlW2DKLKJSPN0IWUzhbVi
 I4jZXkh4hQpqQeR2v8pl1odKUIE+J82BWyw0QhJgGE4PwTEWEa+F2/qYnFt6nZ4ZS/JS
 jQS0J1AQy00uW8EPde9KYcnO1O63RUNmSfn+OsbiYH+5Kim61M5EYCqIjNJbckhEnbJc
 kmSw==
X-Gm-Message-State: AOAM532xqWqpHI2Kgl3XeU0YT6Us8SfGqazWr0c6WsnfSHAIxJ0F65uZ
 p1wuFAioWLRrkR/l1lvRXvh4aLM/oedk9UnpD31mor78yZC2Hq5Ejs2o8iepAyfWkrFbcuCdhhH
 za5/TzEbGkcsttmYdQflrh1RGn9fRXIE=
X-Received: by 2002:ab0:6c4e:: with SMTP id q14mr188834uas.128.1644346577482; 
 Tue, 08 Feb 2022 10:56:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhImGKhWzUpb3/ALGa6Cdin+iiHb9b+bOs5J/uBjNXjAGewVzZ2J71ACvKwWaSbegDFAkJj7a4J7X/tRg3rJw=
X-Received: by 2002:ab0:6c4e:: with SMTP id q14mr188830uas.128.1644346577296; 
 Tue, 08 Feb 2022 10:56:17 -0800 (PST)
MIME-Version: 1.0
References: <CAFn=p-YxK8JduYOzxwDJSsmANgsqb+tK049t75VbXK-=Qi3J9w@mail.gmail.com>
 <CAFEAcA8Q5+cL8noZLKDwyhhuTfkN8tLcNmdqnWKSvDxoYcxp9w@mail.gmail.com>
In-Reply-To: <CAFEAcA8Q5+cL8noZLKDwyhhuTfkN8tLcNmdqnWKSvDxoYcxp9w@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 8 Feb 2022 13:56:06 -0500
Message-ID: <CAFn=p-aUv7QboPaH4Mug6TWqrWCJDQ+VhvZyYgz+Gw=bfhiM=g@mail.gmail.com>
Subject: Re: Adding a 'qemu.qmp' repository to gitlab.com/qemu-project/
To: Peter Maydell <peter.maydell@linaro.org>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 8, 2022 at 1:54 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 4 Feb 2022 at 19:47, John Snow <jsnow@redhat.com> wrote:
> >
> > Hi Peter:
> >
> > I am working my way towards splitting the QMP library out of the
> > qemu.git source tree. I'd like to ask for permission to:
> >
> > (1) Create a "qemu.qmp" repository under the qemu-project umbrella on GitLab
> > (2) Add Cleber Rosa and myself as maintainers of this repository. (In
> > discussion, Dan Berrange suggested a third maintainer for redundancy,
> > but nobody from outside of RH has yet volunteered. The offer stands,
> > but I have to press on in the meantime.)
>
> Since you asked me specifically, no objection, but agreed with
> the other remarks in the thread about picking a more
> obviously this-is-python-qmp-bindings indicating name.
>

OK, great! Thanks a million :)


