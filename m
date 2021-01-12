Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C45E2F2AE4
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 10:14:55 +0100 (CET)
Received: from localhost ([::1]:46062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzFlO-0000i5-Ip
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 04:14:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzFjY-0008Sn-SC
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:13:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzFjW-00062F-Ky
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:13:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610442775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XvbxEpiuVHQbiKn6NPQiyO0vwhO0SFB+n4H+UuqIZ90=;
 b=GCvZImCJRrfiwQJwS/54c88ZeiVeY85Ztk/gxOImMuMYRXxW2Rb6N64a7v+UgCa0EiNWy6
 uqgR3GihHdVaOeISoLm41DJqKPE5OgBWKbZu+hi5CJu2c/XXtY4wuj67+RkmXUq9YdWpHi
 mZC4MRIh9ifz2ZzW//w9gm6zCRMUPe8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-hd-WjqluNxOI63yjj1dUeA-1; Tue, 12 Jan 2021 04:12:51 -0500
X-MC-Unique: hd-WjqluNxOI63yjj1dUeA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62841107ACF7;
 Tue, 12 Jan 2021 09:12:50 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-184.ams2.redhat.com [10.36.112.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2687F1972B;
 Tue, 12 Jan 2021 09:12:48 +0000 (UTC)
Subject: Re: [PATCH] cirrus.yml: Replace the hard-coded python-sphinx version
 with the generic one
To: luoyonggang@gmail.com
References: <20210111103410.144797-1-thuth@redhat.com>
 <CAE2XoE_pKkoW9=CojK1TumH10uf_rCDSKNLS-AAPH51QXP2DzA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d7e3d0cf-f8d3-0772-1098-f98af7d27e94@redhat.com>
Date: Tue, 12 Jan 2021 10:12:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE_pKkoW9=CojK1TumH10uf_rCDSKNLS-AAPH51QXP2DzA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/01/2021 21.16, 罗勇刚(Yonggang Luo) wrote:
> 
> 
> On Mon, Jan 11, 2021 at 6:34 PM Thomas Huth <thuth@redhat.com 
> <mailto:thuth@redhat.com>> wrote:
>  >
>  > The mingw-w64-x86_64-python-sphinx-2.3.1 package has been removed from
>  > the server, so the windows_msys2_task is currently failing. Replace the
>  > old version with the current generic one to fix the issue (the current
>  > version seems to work fine now, too).
>  >
>  > Signed-off-by: Thomas Huth <thuth@redhat.com <mailto:thuth@redhat.com>>
>  > ---
>  >  Successful run (with sphinx building the docs) can be seen here:
>  > https://cirrus-ci.com/task/6568987054047232 
> <https://cirrus-ci.com/task/6568987054047232>
>  >
>  >  .cirrus.yml | 6 +-----
>  >  1 file changed, 1 insertion(+), 5 deletions(-)
>  >
>  > diff --git a/.cirrus.yml b/.cirrus.yml
>  > index 3907e036da..886addedd3 100644
>  > --- a/.cirrus.yml
>  > +++ b/.cirrus.yml
>  > @@ -117,12 +117,8 @@ windows_msys2_task:
>  >            mingw-w64-x86_64-curl \
>  >            mingw-w64-x86_64-gnutls \
>  >            mingw-w64-x86_64-libnfs \
>  > +          mingw-w64-x86_64-python-sphinx
>  >            "
>  > -        bitsadmin /transfer msys_download /dynamic /download /priority 
> FOREGROUND `
>  > - 
> https://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz 
> <https://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz> 
> `
>  > -          C:\tools\mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz
>  > -        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -U 
> /c/tools/mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz"
>  > -        del C:\tools\mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz
>  >          C:\tools\msys64\usr\bin\bash.exe -lc "rm -rf 
> /var/cache/pacman/pkg/*"
>  >          cd C:\tools\msys64
>  >          echo "Start archive"
>  > --
>  > 2.27.0
>  >
> Hi, I've done that in my previous patch and queued by Paolo Bonzini 4 days, 
> 8 hours ago
> 
> https://patchew.org/QEMU/20210107101919.80-1-luoyonggang@gmail.com/ 

Ah, alright, then please ignore my patch here!

  Thanks,
   Thomas


