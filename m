Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD6754CBB6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 16:47:13 +0200 (CEST)
Received: from localhost ([::1]:42584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1UIZ-0007wF-Qc
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 10:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1o1UG9-0006wh-N5
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:44:43 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:34711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1o1UG2-0007tv-5B
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:44:36 -0400
Received: by mail-pf1-x431.google.com with SMTP id c196so11654729pfb.1
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 07:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to;
 bh=mZ/mTmH8cqLi9vba9NMpw8seWwhG/785dXXi8qwXqR4=;
 b=6mJbtcSxSxReHb17Agxj2UnLtT8jpJrChXSrpx9eFmexco0LkAOf+4cEYi2TxJKdBb
 0P2trH7+5nyT6v0lU/kyEfr+y5T5alKu3sMSMhpguAwhQ0foBWK7i9vaGX7wp9aZocU0
 3xVqfomNtYkYUlHeOewGS/Hi5skjO90SqK3xdNGWNGvxqCwjEbi6lkrrDGEJZV5TpLG6
 1XQ5AAqmWJ4Ar1ZIMM0ZJ8n1O4cMb4XyjjCHHmiHjYPrfRMw3t8Jp+L00NCL6QtdDvg/
 5a95V42rV2gGMkiBNUTGR0jHHhq+/glQc5n4jR+z37Fa2tX8qyErTE21zSXvOJATT8Rs
 P/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to;
 bh=mZ/mTmH8cqLi9vba9NMpw8seWwhG/785dXXi8qwXqR4=;
 b=p4TVVulFtAW4EhVCc4OV5DlToGTF21lv5ir8GLz1/MvPazma5SOzXR/JgNkJHzkdx6
 9TIgX5VL2bw+Bk3AH9sPK/w5sCNS15i7bXtBeTzq4EKTVvIir17nJJcgiDvvvo11DuFe
 ax8ukkTbQtmi629Xw7mBm3jd2igPRlODtNsKxfQPnW4PTwVcCbuw5CKKUydkNqbsNk1F
 w2/YuLhKv34CDCyt3ofznOysgIhi7B0HKBh1+D9YA+ayXtu2A4a7KH4VKmQQL+3phzgc
 gf8UdqS12z1UI4c05VpiPh3tp9vBnV50/L1dcEB4TFruCVp1IjUjq1/zNVEsOr5plS+7
 sQCw==
X-Gm-Message-State: AJIora9M4xWQ1aDdgQWvzZMdYKdmsH6bAoNe5Km7Z8iXZ6lSDzr8vyhn
 zXh5gfmz2IBNcplshf8OHKRrCQ==
X-Google-Smtp-Source: AGRyM1s4J4bK/Bf/FEMNxps3bn2DJSd5Dg5ODSViH8viEK/hSC7tfUS7MbUao2SW+XyMkXGN05b2LQ==
X-Received: by 2002:a63:356:0:b0:3fd:7477:63f0 with SMTP id
 83-20020a630356000000b003fd747763f0mr104909pgd.601.1655304271907; 
 Wed, 15 Jun 2022 07:44:31 -0700 (PDT)
Received: from [10.94.53.13] ([139.177.225.249])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a170902a5c200b0015e8d4eb26esm9382114plq.184.2022.06.15.07.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 07:44:31 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------fPH2P5ntTLA1470ApHsxTeDA"
Message-ID: <809418f4-343e-b730-1fe2-2a1e05ded8fb@bytedance.com>
Date: Wed, 15 Jun 2022 22:44:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [External] [PATCH v13 3/8] QIOChannelSocket: Implement io_writev
 zero copy flag & io_flush for CONFIG_LINUX
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 lizefan.x@bytedance.com, zhouyibo@bytedance.com
References: <20220513062836.965425-1-leobras@redhat.com>
 <20220513062836.965425-4-leobras@redhat.com>
 <c951a606-e306-6f11-0bd9-204a8b0d223a@bytedance.com>
 <YqiXwhG+TxG7IPY3@work-vm>
From: chuang xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <YqiXwhG+TxG7IPY3@work-vm>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pf1-x431.google.com
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
--------------fPH2P5ntTLA1470ApHsxTeDA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/6/14 下午10:14, Dr. David Alan Gilbert wrote:
> I don't think we can tell which one of them triggered the error; so the
> only thing I can suggest is that we document the need for optmem_max
> setting; I wonder how we get a better answer than 'a few 100KB'?
> I guess it's something like the number of packets inflight *
> sizeof(cmsghdr) ?
>
> Dave

Three cases with errno ENOBUFS are described in the official 
doc(https://www.kernel.org/doc/html/v5.12/networking/msg_zerocopy.html):

1.The socket option was not set

2.The socket exceeds its optmem limit

3.The user exceeds its ulimit on locked pages

For case 1, if the code logic is correct, this possibility can be ignored.

For case 2, I asked a kernel developer about the reason for "a few 
100KB". He said that the recommended value should be for the purpose of 
improving the performance of zero_copy send. If the NICsends data slower 
than the data generation speed, even if optmem is set to 100KB, there is 
a probability that sendmsg returns with errno ENOBUFS.

For case 3, If I do not set max locked memory for the qemu, the max 
locked memory will be unlimited. I set the max locked memory for qemu 
and found that once the memory usage exceeds the max locked memory, oom 
will occur.  Does this mean that sendmsg cannot return with errno 
ENOBUFS at all when user exceeds its ulimit on locked pages?

If the above is true, can we take the errno as the case 2？

I modified the code logic to call sendmsg again when the errno is 
ENOBUFS and set optmem to the initial 20KB(echo 20480 > 
/proc/sys/net/core/optmem_max), now the multifd zero_copy migration goes 
well.

Here are the changes I made to the code:


Signed-off-by: chuang xu <xuchuangxclwt@bytedance.com>
---
  io/channel-socket.c | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index dc9c165de1..9267f55a1d 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -595,9 +595,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel 
*ioc,
  #ifdef QEMU_MSG_ZEROCOPY
          case ENOBUFS:
              if (sflags & MSG_ZEROCOPY) {
-                error_setg_errno(errp, errno,
-                                 "Process can't lock enough memory for 
using MSG_ZEROCOPY");
-                return -1;
+                goto retry;
              }
              break;
  #endif
-- 

Dave, what's your take?

Best Regards,

chuang xu

--------------fPH2P5ntTLA1470ApHsxTeDA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/6/14 下午10:14, Dr. David Alan
      Gilbert wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YqiXwhG+TxG7IPY3@work-vm">I don't
      think we can tell which one of them triggered the error; so the
      <pre class="moz-quote-pre" wrap="">only thing I can suggest is that we document the need for optmem_max
setting; I wonder how we get a better answer than 'a few 100KB'?
I guess it's something like the number of packets inflight *
sizeof(cmsghdr) ?

Dave
</pre>
    </blockquote>
    <p>Three cases with errno ENOBUFS are described in the official
      doc(<a class="moz-txt-link-freetext" href="https://www.kernel.org/doc/html/v5.12/networking/msg_zerocopy.html">https://www.kernel.org/doc/html/v5.12/networking/msg_zerocopy.html</a>):</p>
    <p>1.The socket option was not set</p>
    <p>2.The socket exceeds its optmem limit</p>
    <p>3.The user exceeds its ulimit on locked pages</p>
    <p>For case 1, if the code logic is correct, this possibility can be
      ignored.</p>
    <p>For case 2, I asked a kernel developer about the reason for "a
      few 100KB". He said that the recommended value should be for the
      purpose of improving the performance of zero_copy send. If the NIC<span
        style="color: rgb(60, 64, 67); font-family: arial, sans-serif;
        font-size: 14px; font-style: normal; font-variant-ligatures:
        normal; font-variant-caps: normal; font-weight: 400;
        letter-spacing: normal; orphans: 2; text-align: left;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-thickness:
        initial; text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;"></span> sends
      data slower than the data generation speed, even if optmem is set
      to 100KB, there is a probability that sendmsg returns with errno
      ENOBUFS.</p>
    <p>For case 3, If I do not set max locked memory for the qemu, the
      max locked memory will be unlimited. I set the max locked memory
      for qemu and found that once the memory usage exceeds the max
      locked memory, oom will occur.  Does this mean that sendmsg cannot
      return with errno ENOBUFS at all when user exceeds its ulimit on
      locked pages?</p>
    <p>If the above is true, can we take the errno as the case 2？</p>
    <p>I modified the code logic to call sendmsg again when the errno is
      ENOBUFS and set optmem to the initial 20KB(echo 20480 &gt;
      /proc/sys/net/core/optmem_max), now the multifd zero_copy
      migration goes well.</p>
    <p>Here are the changes I made to the code:</p>
    <p><br>
    </p>
    <p>Signed-off-by: chuang xu <a class="moz-txt-link-rfc2396E" href="mailto:xuchuangxclwt@bytedance.com">&lt;xuchuangxclwt@bytedance.com&gt;</a><br>
      ---<br>
       io/channel-socket.c | 4 +---<br>
       1 file changed, 1 insertion(+), 3 deletions(-)<br>
      <br>
      diff --git a/io/channel-socket.c b/io/channel-socket.c<br>
      index dc9c165de1..9267f55a1d 100644<br>
      --- a/io/channel-socket.c<br>
      +++ b/io/channel-socket.c<br>
      @@ -595,9 +595,7 @@ static ssize_t
      qio_channel_socket_writev(QIOChannel *ioc,<br>
       #ifdef QEMU_MSG_ZEROCOPY<br>
               case ENOBUFS:<br>
                   if (sflags &amp; MSG_ZEROCOPY) {<br>
      -                error_setg_errno(errp, errno,<br>
      -                                 "Process can't lock enough
      memory for using MSG_ZEROCOPY");<br>
      -                return -1;<br>
      +                goto retry;<br>
                   }<br>
                   break;<br>
       #endif<br>
      -- <br>
    </p>
    <p>Dave, what's your take?</p>
    <p>Best Regards,</p>
    <p>chuang xu<br>
    </p>
  </body>
</html>

--------------fPH2P5ntTLA1470ApHsxTeDA--

