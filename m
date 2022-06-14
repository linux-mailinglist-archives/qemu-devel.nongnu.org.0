Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3CA54B210
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 15:11:26 +0200 (CEST)
Received: from localhost ([::1]:58560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o16KK-0003KV-M8
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 09:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1o16Iv-0001f1-Oo
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 09:09:57 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:40792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1o16Iq-0001DA-II
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 09:09:54 -0400
Received: by mail-pg1-x533.google.com with SMTP id f65so8458078pgc.7
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 06:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to;
 bh=OPeJZeFBtxUUgmgaSR+g8zE1rCb7/nO+biMpUhYpx10=;
 b=tPabGuwUt16Sypd+Q97oqm4YIxVa/ecwrsrqQ18qJgFr3o9G2Q7HCMyDOw3wzdQyvG
 lR4PpKPnfvxJYzh8x+5xjIt2K1I+ZsSr5PfhCmL9idJmLPwaOnEXYAKVfad8aRqX/0CT
 wHSRzsIE5QnOFfVBebpcOYBFbVpdH7hQDVgS28iQosTtv+Vs3MyI23Ou3qzZagwRXmVK
 zTqjCa3huFvytYOj0gxV1FGlmEZBHfBm7G1z19yvZCndSb1kPWdeuhRiNivduMEZGjno
 DnrErPvWS4MxL68EkDl57goWENrXgJ7bR5v7fakjxUMYpU1zxIDGTD00NbWm0ax9magT
 DHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to;
 bh=OPeJZeFBtxUUgmgaSR+g8zE1rCb7/nO+biMpUhYpx10=;
 b=mkTBAa4uwKCsIKlLhOP8vONudO0Q4Z7n2bDQT+n4IO9gI7uf5sPHRSk4tQXuy7IEqa
 EwoPQKLgUV/VvMiPgR/O57LxdARFx7STFkRIYdWI4/DUDEQcQojZf1AEfPGYM5sZ8tYD
 ED/8LLO+4YPnKtT6NTmyququvHjMB6uSC12GNtEWp3XvXH6ll2ZrgtTLBDlazjzYqz+y
 Ct3LSmWQRnzcQBR6aP6LXjYCIlIVJI9dr+TQu+zetU9YDssY+1Mg7CqRQeJZ8LW38rrb
 D7sIeQuT31CLUO/e9KdHFgg66v1O0nWxmZgna6WeL83Ucnq+Xbvj9Yg7cEAVgUCc3xoP
 hx2Q==
X-Gm-Message-State: AJIora/vfkwRdVwRjbx+w8V1LvToot/iJnAS/d7pcFV5zzIIfW2J3aZs
 wakX57A3siNz7nZ243LZBh+ghg==
X-Google-Smtp-Source: ABdhPJyoKYXeLPflJBwd9aR0M83Y8ngAVoCLpgCdh/uBhkaUgVyfOx0yPBgM74uwOPUVpX0ItZ+FKA==
X-Received: by 2002:a05:6a00:1a56:b0:51b:f1af:c2e8 with SMTP id
 h22-20020a056a001a5600b0051bf1afc2e8mr4407233pfv.48.1655212190146; 
 Tue, 14 Jun 2022 06:09:50 -0700 (PDT)
Received: from [10.94.53.13] ([139.177.225.249])
 by smtp.gmail.com with ESMTPSA id
 o22-20020aa79796000000b0051c6613b5basm7511099pfp.134.2022.06.14.06.09.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 06:09:49 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------7uoJWsPV2va3LCWzx75YR1Qe"
Message-ID: <c951a606-e306-6f11-0bd9-204a8b0d223a@bytedance.com>
Date: Tue, 14 Jun 2022 21:09:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [External] [PATCH v13 3/8] QIOChannelSocket: Implement io_writev
 zero copy flag & io_flush for CONFIG_LINUX
To: Leonardo Bras <leobras@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Peter Xu
 <peterx@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, lizefan.x@bytedance.com, zhouyibo@bytedance.com
References: <20220513062836.965425-1-leobras@redhat.com>
 <20220513062836.965425-4-leobras@redhat.com>
From: chuang xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <20220513062836.965425-4-leobras@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This is a multi-part message in MIME format.
--------------7uoJWsPV2va3LCWzx75YR1Qe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/5/13 下午2:28, Leonardo Bras wrote:
> @@ -557,15 +578,31 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>           memcpy(CMSG_DATA(cmsg), fds, fdsize);
>       }
>   
> +#ifdef QEMU_MSG_ZEROCOPY
> +    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> +        sflags = MSG_ZEROCOPY;
> +    }
> +#endif
> +
>    retry:
> -    ret = sendmsg(sioc->fd, &msg, 0);
> +    ret = sendmsg(sioc->fd, &msg, sflags);
>       if (ret <= 0) {
> -        if (errno == EAGAIN) {
> +        switch (errno) {
> +        case EAGAIN:
>               return QIO_CHANNEL_ERR_BLOCK;
> -        }
> -        if (errno == EINTR) {
> +        case EINTR:
>               goto retry;
> +#ifdef QEMU_MSG_ZEROCOPY
> +        case ENOBUFS:
> +            if (sflags & MSG_ZEROCOPY) {
> +                error_setg_errno(errp, errno,
> +                                 "Process can't lock enough memory for using MSG_ZEROCOPY");
> +                return -1;
> +            }
> +            break;
> +#endif
>           }
> +
>           error_setg_errno(errp, errno,
>                            "Unable to write to socket");
>           return -1;

Hi, Leo.

There are some other questions I would like to discuss with you.

I tested the multifd zero_copy migration and found that sometimes even 
if max locked memory of qemu was set to 16GB（much greater than 
`MULTIFD_PACKET_SIZE`）, the error "Process can't lock enough memory for 
using MSG_ZEROCOPY" would still be reported.

I noticed that the 
doc(https://www.kernel.org/doc/html/v5.12/networking/msg_zerocopy.html) 
says "A zerocopy failure will return -1 with errno ENOBUFS. This happens 
if the socket option was not set, _the socket exceeds its optmem limit_ 
or the user exceeds its ulimit on locked pages."

I also found that the RFC(https://lwn.net/Articles/715279/) says _"__The 
change to allocate notification skbuffs from optmem requires__ensuring 
that net.core.optmem is at least a few 100KB."_

On my host,  optmem was initially set to 20KB, I tried to change it to 
100KB (echo 102400 > /proc/sys/net/core/optmem_max) as the RFC says.Then 
I tested the multifd zero_copy migration repeatedly，and the error 
disappeared.

So when sendmsg returns -1 with errno ENOBUFS, should we distinguish 
between error ''socket exceeds optmem limit" and error "user exceeds 
ulimit on locked pages"? Or is there any better way to avoid this problem?

Best Regards,

chuang xu

--------------7uoJWsPV2va3LCWzx75YR1Qe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/5/13 下午2:28, Leonardo Bras
      wrote:
    </div>
    <blockquote type="cite"
      cite="mid:20220513062836.965425-4-leobras@redhat.com">
      <pre class="moz-quote-pre" wrap="">@@ -557,15 +578,31 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
         memcpy(CMSG_DATA(cmsg), fds, fdsize);
     }
 
+#ifdef QEMU_MSG_ZEROCOPY
+    if (flags &amp; QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
+        sflags = MSG_ZEROCOPY;
+    }
+#endif
+
  retry:
-    ret = sendmsg(sioc-&gt;fd, &amp;msg, 0);
+    ret = sendmsg(sioc-&gt;fd, &amp;msg, sflags);
     if (ret &lt;= 0) {
-        if (errno == EAGAIN) {
+        switch (errno) {
+        case EAGAIN:
             return QIO_CHANNEL_ERR_BLOCK;
-        }
-        if (errno == EINTR) {
+        case EINTR:
             goto retry;
+#ifdef QEMU_MSG_ZEROCOPY
+        case ENOBUFS:
+            if (sflags &amp; MSG_ZEROCOPY) {
+                error_setg_errno(errp, errno,
+                                 "Process can't lock enough memory for using MSG_ZEROCOPY");
+                return -1;
+            }
+            break;
+#endif
         }
+
         error_setg_errno(errp, errno,
                          "Unable to write to socket");
         return -1;
</pre>
    </blockquote>
    <p>Hi, Leo.</p>
    <p>There are some other questions I would like to discuss with you.</p>
    <p>I tested the multifd zero_copy migration and found that sometimes
      even if max locked memory of qemu was set to 16GB（much greater
      than `MULTIFD_PACKET_SIZE`）, the error "Process can't lock enough
      memory for using MSG_ZEROCOPY" would still be reported.</p>
    <p>I noticed that the
      doc(<a class="moz-txt-link-freetext" href="https://www.kernel.org/doc/html/v5.12/networking/msg_zerocopy.html">https://www.kernel.org/doc/html/v5.12/networking/msg_zerocopy.html</a>)
      says "<span style="color: rgb(0, 0, 0); font-family: serif;
        font-size: 16px; font-style: normal; font-variant-ligatures:
        normal; font-variant-caps: normal; font-weight: 400;
        letter-spacing: normal; orphans: 2; text-align: start;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(252, 252, 252); text-decoration-thickness:
        initial; text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">A zerocopy
        failure will return -1 with errno ENOBUFS. This happens if the
        socket option was not set, <u>the socket exceeds its optmem
          limit</u> or the user exceeds its ulimit on locked pages.</span><span
        style="color: rgb(0, 0, 0); font-family: serif; font-size: 16px;
        font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(252, 252, 252); text-decoration-thickness:
        initial; text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">"</span></p>
    <p>I also found that the RFC(<a class="moz-txt-link-freetext" href="https://lwn.net/Articles/715279/">https://lwn.net/Articles/715279/</a>) says
      <u>"</u><u>The change to allocate notification skbuffs from optmem
        requires</u><u> ensuring that net.core.optmem is at least a few
        100KB."</u></p>
    <p> On my host,  optmem was initially set to 20KB, I tried to change
      it to 100KB (echo 102400 &gt; /proc/sys/net/core/optmem_max) as
      the RFC says.Then I tested the multifd zero_copy migration
      repeatedly，and the error disappeared.<br>
    </p>
    <p>So when sendmsg returns -1 with errno ENOBUFS, should we
      distinguish between error ''socket exceeds optmem limit" and error
      "user exceeds ulimit on locked pages"? Or is there any better way
      to avoid this problem?</p>
    <p>Best Regards,</p>
    <p>chuang xu<br>
    </p>
  </body>
</html>

--------------7uoJWsPV2va3LCWzx75YR1Qe--

