Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ED951C604
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:23:05 +0200 (CEST)
Received: from localhost ([::1]:48570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfBw-0000G2-Ef
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nmerZ-0001v9-PW
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:02:01 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:50239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nmerW-0008Oq-R6
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:02:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651770117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yu7k5+F7DkOqpSo51FmQogE0Dwx96qja50kktw2D/1o=;
 b=M7iq+q+O0zHgJsU9pSWG21DY3DlNqiJYw4Bwtu687bTI3kDpCKHgHl0mnmHOgI0ztG/Ykx
 Yj2YgUXAJa3aVu9Or+A/vju9alj8cHoWmlfgLVqbq0Ep8DbVZ4rYxejLYwZn0Dwx5PZH5I
 JwwWYrfIJe63fln6WOHwaj6bVfIGQRs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-GwLEJ-CAOfuCRXpXeWTdvQ-1; Thu, 05 May 2022 13:01:56 -0400
X-MC-Unique: GwLEJ-CAOfuCRXpXeWTdvQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 i14-20020a17090639ce00b006dabe6a112fso2940038eje.13
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 10:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yu7k5+F7DkOqpSo51FmQogE0Dwx96qja50kktw2D/1o=;
 b=khCNdjcFDElGFEPaQXkHghNcxsSNsCpjCmUMKbs7fbwkGQc9onFY2/+YFRSeeIOx9g
 S3+dCjN7GDsJpa9kz1YhTaxOEfFsLChK6Kpr5ws3fwZyE85v4RdZ0ZLyPI9AufUztFLs
 CkXj+uqUuGliPiP1c/CT1bIAo8CyuZQxN7neWWSiWtiLKjKQrqKRpwu0ERtAMxTSNvJ9
 hQwoMLkYyu+Cs8Cb5dBRYoyIRkPeeOolfg1pwi3wF+ZRpcrnZ8oatrUYTrhS5HBL7clJ
 ziWT0DkqDA8ikQm3H5dnnbwd9ZZRHFGMM6znpgKzpdBdXFqTg3okCK1Vrw1Z5BQvwPqM
 0//Q==
X-Gm-Message-State: AOAM530UEQVxV0VnMC3rtBMOMyDV028vhOCSyTQB2pHyuU/9LKER3w6g
 k/XdW0Hra1oqD+6YW++5hXlTrHJMssVefl7uRu/jx5unJ0JG+BgNXRHhgu9/2hWZVqHgdPsZWd+
 8xLiRvKS1VRrFvzJ9avBagDEX9BJBtdE=
X-Received: by 2002:a17:906:99c3:b0:6f4:a9d7:6dac with SMTP id
 s3-20020a17090699c300b006f4a9d76dacmr12219889ejn.85.1651770115140; 
 Thu, 05 May 2022 10:01:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5INNzXXjzHWjRE6U/JYeb2vYPMoxFhN92RBcnnsPTDfPboBMcLRxI7WC6RgaaS8VHNF8ecaUAwnz2sKKy5/E=
X-Received: by 2002:a17:906:99c3:b0:6f4:a9d7:6dac with SMTP id
 s3-20020a17090699c300b006f4a9d76dacmr12219857ejn.85.1651770114846; Thu, 05
 May 2022 10:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220504191835.791580-1-leobras@redhat.com>
 <20220504191835.791580-3-leobras@redhat.com>
 <YnOFUnA439GftKyQ@redhat.com>
 <CAJ6HWG7ZAPqyszS_ZGA_JH3jvQUpsZD=zQ8ismHtgq_PiSYRgw@mail.gmail.com>
 <YnPzb3PG0bff7AXG@redhat.com>
In-Reply-To: <YnPzb3PG0bff7AXG@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 5 May 2022 14:01:43 -0300
Message-ID: <CAJ6HWG5BvGa=k4P+9x9a1cmSK-MpfSs8=CdXBEvHZojOcFTi9g@mail.gmail.com>
Subject: Re: [PATCH v11 2/7] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, 
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, 
 Peter Xu <peterx@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.74; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 5, 2022 at 12:55 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Thu, May 05, 2022 at 12:42:47PM -0300, Leonardo Bras Soares Passos wro=
te:
> >
> > Hello Daniel,
> >
> > But what if this gets compiled in a Linux system without MSG_ZEROCOPY s=
upport?
> > As qapi will have zero-copy-send as an option we could have this scenar=
io:
> >
> > - User request migration using zero-copy-send
> > - multifd_save_setup() will set write_flags =3D QIO_CHANNEL_WRITE_FLAG_=
ZERO_COPY
> > - In qio_channel_socket_connect_sync(): setsockopt() part will be
> > compiled-out, so no error here
> > - above part in qio_channel_socket_writev() will be commented-out,
> > which means write_flags will be ignored
> > - sflags will not contain MSG_ZEROCOPY, so sendmsg() will use copy-mode
> > - migration will succeed
> >
> > In the above case, the user has all the reason to think migration is
> > using MSG_ZEROCOPY, but in fact it's quietly falling back to
> > copy-mode.
>
> I think we're ok because qio_channel_writev_full() does
>
>     if ((flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) &&
>         !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY=
)) {
>         error_setg_errno(errp, EINVAL,
>                          "Requested Zero Copy feature is not available");
>         return -1;
>     }
>
> and since there's no way for QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY to
> get set when MSG_ZEROCOPY is compiled out, we'll trigger the error
> condition.

Oh, that's right. It will fail in the first writev(), I was just
considering failing during setup.

>
> > That's why I suggested creating a 'global' config usiing SO_ZEROCOPY &
> > MSG_ZEROCOPY & CONFIG_LINUX so we can use in qapi and have no chance
> > of even offering zero-copy-send if we don't have it.
> >
> > Another local option is to do implement your suggestions, and also
> > change qio_channel_socket_connect_sync() so it returns an error if
> > MSG_ZEROCOPY && SO_ZEROCOPY is not present, such as:
> >
> > +#ifdef CONFIG_LINUX
> > +#if defined(MSG_ZEROCOPY)  && defined(SO_ZEROCOPY)
> > +    int ret, v =3D 1;
> > +    ret =3D setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
> > +    if (ret =3D=3D 0) {
> > +        /* Zero copy available on host */
> > +        qio_channel_set_feature(QIO_CHANNEL(ioc),
> > +                                QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY);
> > +    }
> > +#else
> > +    error_setg_errno(errp, errno,"MSG_ZEROCOPY not available");
> > +    return -1;
> > +#endif
> > +#endif
>
> Do we actually need the ifdef CONFIG_LINUX bit at all ?
>
> Sufficient to just have the check for MSG_ZEROCOPY + SO_ZEROCOPY,
> which will fail on non-Linux anyway.

By some include issue, or by future implementations we can have
MSG_ZEROCOPY or SO_ZEROCOPY getting defined in OS other than Linux,
which would introduce some headaches.

Since you pointed out that migration will fail on writev, the above
piece of code is not necessary.
We could have a local define that equals to (MSG_ZEROCOPY &&
SO_ZEROCOPY && CONFIG_LINUX) so that we can make the code simpler
where needed.

I will work on a v12 and send it here.

Best regards,
Leo


