Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3397F30BEB1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:51:12 +0100 (CET)
Received: from localhost ([::1]:38696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6v9D-0000sR-7T
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:51:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l6v7A-0008A1-OY
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:49:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l6v78-00017f-Ew
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:49:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612270141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3YeZe1cz4rY/AVreTU0zNZuhb4qQ5tvS/yQPIIWL4hQ=;
 b=DuEiPLrpLs4y8vnAccip5xUbA7cPC+Gnh2kb1qK9o1mGN9DhhdEk4WxI+8cA43UHhKyqmk
 zkpTpU199AtFHaOYrVCLv3cgtl7NFi7qi7XKu/AJfGGv0Zsu5NT/k62blfSvQzZhlm+R7N
 1KNywvX8ZFmPeKVdh5uVqtmCQ9fExq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-bPj6WugfPeeunOVkJLX7xQ-1; Tue, 02 Feb 2021 07:48:58 -0500
X-MC-Unique: bPj6WugfPeeunOVkJLX7xQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33CF2801817;
 Tue,  2 Feb 2021 12:48:57 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78DA26EF45;
 Tue,  2 Feb 2021 12:48:40 +0000 (UTC)
Subject: Re: [PATCH 0/1] Allow to build virtiofsd without the entire tools
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20210201211456.1133364-1-wainersm@redhat.com>
 <CABgObfanXqg9rd1OnumUnSCm0n76mDbP9kNzp8ih0+SJ4jDXgA@mail.gmail.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <8f5102be-a303-610b-9cf7-497056595da3@redhat.com>
Date: Tue, 2 Feb 2021 09:48:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CABgObfanXqg9rd1OnumUnSCm0n76mDbP9kNzp8ih0+SJ4jDXgA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
 boundary="------------B197FB05EACE26E3D5D19DD8"
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: misono.tomohiro@jp.fujitsu.com, qemu-devel <qemu-devel@nongnu.org>,
 stefanha@redhat.com, David Gilbert <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------B197FB05EACE26E3D5D19DD8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 2/1/21 8:04 PM, Paolo Bonzini wrote:
>
>
> Il lun 1 feb 2021, 22:15 Wainer dos Santos Moschetta 
> <wainersm@redhat.com <mailto:wainersm@redhat.com>> ha scritto:
>
>     Not too long ago (QEMU 5.0) it was possible to configure with
>     --disable-tools
>     and still have virtiofsd built. With the recent port of the build
>     system to
>     Meson, it is now built together with the tools though.
>
>     The Kata Containers [1] project build QEMU with --disable-tools to
>     decrease the
>     attack surface
>
>
> ---enable-tools only adds separate executables, therefore it can't add 
> to the attack surface of the emulators. So this is misleading.


You are right, Paolo, thanks for the comment. I meant to say the project 
avoid installing unneeded binaries on the system, extra files which may 
be subject to CVEs and force a sysadmin to handle them. I hope this 
clarifies my point.

Thanks!

Wainer

>
> That said, it does make sense to let --enable-virtiofsd override 
> --disable-tools, and the same in the other direction too.
>
> Paolo
>
>     Side note: in a private chat with Stefan Hajnoczi he come up with
>     the idea
>     that perhaps --disable-tools could be like
>     --without-default-features where
>     one can add back on feature-by-feature basis. This is outside the
>     scope of this
>     series but I thought in sharing because IMHO it is deserves a
>     discussion.
>
>
>     [1] https://katacontainers.io <https://katacontainers.io>
>
>     Wainer dos Santos Moschetta (1):
>       virtiofsd: Allow to build it without the tools
>
>      tools/meson.build | 7 +++++--
>      1 file changed, 5 insertions(+), 2 deletions(-)
>
>     -- 
>     2.29.2
>

--------------B197FB05EACE26E3D5D19DD8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 2/1/21 8:04 PM, Paolo Bonzini wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CABgObfanXqg9rd1OnumUnSCm0n76mDbP9kNzp8ih0+SJ4jDXgA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="auto">
        <div><br>
          <br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">Il lun 1 feb 2021, 22:15
              Wainer dos Santos Moschetta &lt;<a
                href="mailto:wainersm@redhat.com" moz-do-not-send="true">wainersm@redhat.com</a>&gt;
              ha scritto:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">Not too
              long ago (QEMU 5.0) it was possible to configure with
              --disable-tools<br>
              and still have virtiofsd built. With the recent port of
              the build system to<br>
              Meson, it is now built together with the tools though.<br>
              <br>
              The Kata Containers [1] project build QEMU with
              --disable-tools to decrease the<br>
              attack surface</blockquote>
          </div>
        </div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">---enable-tools only adds separate executables,
          therefore it can't add to the attack surface of the emulators.
          So this is misleading.</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>You are right, Paolo, thanks for the comment. I meant to say the
      project avoid installing unneeded binaries on the system, extra
      files which may be subject to CVEs and force a sysadmin to handle
      them. I hope this clarifies my point. <br>
    </p>
    <p>Thanks!</p>
    <p>Wainer<br>
    </p>
    <blockquote type="cite"
cite="mid:CABgObfanXqg9rd1OnumUnSCm0n76mDbP9kNzp8ih0+SJ4jDXgA@mail.gmail.com">
      <div dir="auto">
        <div dir="auto"><br>
        </div>
        <div dir="auto">That said, it does make sense to let
          --enable-virtiofsd override --disable-tools, and the same in
          the other direction too.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Paolo</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">Side
              note: in a private chat with Stefan Hajnoczi he come up
              with the idea<br>
              that perhaps --disable-tools could be like
              --without-default-features where<br>
              one can add back on feature-by-feature basis. This is
              outside the scope of this<br>
              series but I thought in sharing because IMHO it is
              deserves a discussion.</blockquote>
          </div>
        </div>
        <div dir="auto">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <br>
              [1] <a href="https://katacontainers.io" rel="noreferrer
                noreferrer" target="_blank" moz-do-not-send="true">https://katacontainers.io</a><br>
              <br>
              Wainer dos Santos Moschetta (1):<br>
                virtiofsd: Allow to build it without the tools<br>
              <br>
               tools/meson.build | 7 +++++--<br>
               1 file changed, 5 insertions(+), 2 deletions(-)<br>
              <br>
              -- <br>
              2.29.2<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------B197FB05EACE26E3D5D19DD8--


