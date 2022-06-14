Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE03154B33A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 16:32:49 +0200 (CEST)
Received: from localhost ([::1]:54370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o17b6-0007Wv-GE
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 10:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o17ZL-0006C4-UW
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 10:31:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o17ZC-0006u6-Ob
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 10:30:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655217048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6VM+rSbth/zdHHppF/VF25B6jZRTdGBw560N2dhY3lE=;
 b=TMx3WvwwNVqxhXlgJySzFpvuPybexDPpHxghPqI5Q8cpXfBhkwiZrwE2BAU3Uk/L0hQWkv
 vRhPKboVDK+k6tt2k3nk3ztvZvvbEt4wjT8j46h239KYi7os7nS5AOCaT9nfsq+eemRpYE
 N9gP/E7CpfZ5kSD5n2XFdKhHChLlW3g=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-1ihoyiVUNYuTqFjl3IurMg-1; Tue, 14 Jun 2022 10:30:47 -0400
X-MC-Unique: 1ihoyiVUNYuTqFjl3IurMg-1
Received: by mail-vk1-f199.google.com with SMTP id
 az42-20020a0561220d2a00b0035e02b5f627so1464248vkb.22
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 07:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6VM+rSbth/zdHHppF/VF25B6jZRTdGBw560N2dhY3lE=;
 b=dvDgnImfDfMAZLVhHYb5A0ovMzXRQ61bWMcAjQFD2In+22P/9r8WtlrutUSodZBM58
 KrWNY/4YtpETe6DtIPKDhTqUaovfuhZXnMzCzE6IvDqVt1dvNyMLu6PnsIh/Mv3Z1NdB
 fTCCt5gmIdiC5XG+Wx8uw65szn6OaYu5Ct/wAx8XufwNcyke1KuBwSWR6/BmdYM8Q7qx
 rjdI834hQfvRi8AxTnoo0CJU+fTPDAbPV1ZCojB43PslNDf0rKR6ugmXvNiFLMdneuEm
 WwJbtoekqen4qgn2rnNAAOZ82gOk/7ooMTYjZBq7SAeverW9TOPsJ2KJRdwxhZfOqz7V
 qCyQ==
X-Gm-Message-State: AJIora8n8RbdA+KtsV9dzsGTxMrqREpyDpG0ak/z40QA4i/okUcYCLOE
 7yIbmJab7G2G8SUitpNLQ0NF13yFgq/ZEEGzasO2bkGdWp47rw+ydPb70wQUs2Iqfb66i8z122B
 2XA+EZCk1rWdrkwfrDgQhS9bXdt+g1to=
X-Received: by 2002:a67:7347:0:b0:349:f400:9b23 with SMTP id
 o68-20020a677347000000b00349f4009b23mr2304611vsc.35.1655217047336; 
 Tue, 14 Jun 2022 07:30:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vUg2XfE+/3yJLzud6tOEa2yIM0DuxbSrw/B5tngzOo2MU3w3gf9NJMN6uDec1ggCir/f0u0rJfD1EFziSLR6I=
X-Received: by 2002:a67:7347:0:b0:349:f400:9b23 with SMTP id
 o68-20020a677347000000b00349f4009b23mr2304586vsc.35.1655217047142; Tue, 14
 Jun 2022 07:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220614015044.2501806-1-jsnow@redhat.com>
 <20220614015044.2501806-3-jsnow@redhat.com>
 <fa6e9152-73a1-d6ca-269a-1b1513472aa8@redhat.com>
 <YqhN50NeY3RIfvmy@redhat.com>
In-Reply-To: <YqhN50NeY3RIfvmy@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 14 Jun 2022 10:30:36 -0400
Message-ID: <CAFn=p-a0hf6tp7NYS73S3OW9N_KA+NQRcLNAxh-UreVF9RkZ2Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] tests/qemu-iotests: skip 108 when FUSE is not loaded
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Qemu-block <qemu-block@nongnu.org>, Beraldo Leal <bleal@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

On Tue, Jun 14, 2022 at 4:59 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Tue, Jun 14, 2022 at 06:46:35AM +0200, Thomas Huth wrote:
> > On 14/06/2022 03.50, John Snow wrote:
> > > In certain container environments we may not have FUSE at all, so ski=
p
> > > the test in this circumstance too.
> > >
> > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > ---
> > >   tests/qemu-iotests/108 | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > >
> > > diff --git a/tests/qemu-iotests/108 b/tests/qemu-iotests/108
> > > index 9e923d6a59f..e401c5e9933 100755
> > > --- a/tests/qemu-iotests/108
> > > +++ b/tests/qemu-iotests/108
> > > @@ -60,6 +60,12 @@ if sudo -n losetup &>/dev/null; then
> > >   else
> > >       loopdev=3Dfalse
> > > +    # Check for fuse support in the host environment:
> > > +    lsmod | grep fuse &>/dev/null;
> >
> > That doesn't work if fuse has been linked statically into the kernel. W=
ould
> > it make sense to test for /sys/fs/fuse instead?
> >
> > (OTOH, we likely hardly won't run this on statically linked kernels any=
way,
> > so it might not matter too much)
>
> But more importantly 'lsmod' may not be installed in our container
> images. So checking /sys/fs/fuse avoids introducing a dep on the
> 'kmod' package.
>
> >
> > > +    if [[ $? -ne 0 ]]; then
> >
> > I'd prefer single "[" instead of "[[" ... but since we're requiring bas=
h
> > anyway, it likely doesn't matter.
>
> Or
>
>     if  test $? !=3D 0 ; then
>
> >
> > > +        _notrun 'No Passwordless sudo nor FUSE kernel module'
> > > +    fi
> > > +
> > >       # QSD --export fuse will either yield "Parameter 'id' is missin=
g"
> > >       # or "Invalid parameter 'fuse'", depending on whether there is
> > >       # FUSE support or not.
> >

Good suggestions, thanks!

--js


