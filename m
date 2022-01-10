Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A20489EC7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 19:03:57 +0100 (CET)
Received: from localhost ([::1]:41152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6z1R-0004yF-1E
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 13:03:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1n6yuo-00063V-2T; Mon, 10 Jan 2022 12:57:07 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:60560
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1n6yul-0006xn-Nt; Mon, 10 Jan 2022 12:57:05 -0500
Received: from [192.168.178.28] (pd9ec355f.dip0.t-ipconnect.de [217.236.53.95])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 248D2DA0798;
 Mon, 10 Jan 2022 18:56:51 +0100 (CET)
Content-Type: multipart/alternative;
 boundary="------------jrovZAEWtLkQLvwAM1rP08GK"
Message-ID: <42ac8990-8733-fa68-c4b4-c54a82ce43f9@weilnetz.de>
Date: Mon, 10 Jan 2022 18:56:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH] simplebench: Fix Python syntax error (reported by LGTM)
To: John Snow <jsnow@redhat.com>
References: <20220107153019.504124-1-sw@weilnetz.de>
 <CAFn=p-ZYr+D54GzYKt5cxuJQQTARGQTvkkgVfhLGEeLczFt-Tw@mail.gmail.com>
From: Stefan Weil <sw@weilnetz.de>
In-Reply-To: <CAFn=p-ZYr+D54GzYKt5cxuJQQTARGQTvkkgVfhLGEeLczFt-Tw@mail.gmail.com>
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------jrovZAEWtLkQLvwAM1rP08GK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 10.01.22 um 18:08 schrieb John Snow:

> On Fri, Jan 7, 2022 at 10:32 AM Stefan Weil <sw@weilnetz.de> wrote:
>
>     Signed-off-by: Stefan Weil <sw@weilnetz.de>
>     ---
>      scripts/simplebench/bench-example.py | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/scripts/simplebench/bench-example.py
>     b/scripts/simplebench/bench-example.py
>     index 4864435f39..fc370691e0 100644
>     --- a/scripts/simplebench/bench-example.py
>     +++ b/scripts/simplebench/bench-example.py
>     @@ -25,7 +25,7 @@
>
>      def bench_func(env, case):
>          """ Handle one "cell" of benchmarking table. """
>     -    return bench_block_copy(env['qemu_binary'], env['cmd'], {}
>     +    return bench_block_copy(env['qemu_binary'], env['cmd'], {},
>                                  case['source'], case['target'])
>
>
>     -- 
>     2.30.2
>
>
> Good spot. If it's not too late and not a hassle, can you add a fixes: 
> commit-id in the commit message? No big deal if not.
>
> Reviewed-by: John Snow <jsnow@redhat.com>


Maybe that can be added locally to avoid a V2 patch. Here it is:

Fixes: b2fcb0c5754c2554b8406376e99a75e9e0a6b7bd

Thanks,

Stefan



--------------jrovZAEWtLkQLvwAM1rP08GK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Am 10.01.22 um 18:08 schrieb John Snow:<br>
    </p>
    <blockquote type="cite"
cite="mid:CAFn=p-ZYr+D54GzYKt5cxuJQQTARGQTvkkgVfhLGEeLczFt-Tw@mail.gmail.com">
      <div dir="ltr">On Fri, Jan 7, 2022 at 10:32 AM Stefan Weil &lt;<a
          href="mailto:sw@weilnetz.de" moz-do-not-send="true"
          class="moz-txt-link-freetext">sw@weilnetz.de</a>&gt; wrote:<br>
        <div class="gmail_quote">
          <blockquote class="gmail_quote">Signed-off-by: Stefan Weil
            &lt;<a href="mailto:sw@weilnetz.de" target="_blank"
              moz-do-not-send="true" class="moz-txt-link-freetext">sw@weilnetz.de</a>&gt;<br>
            ---<br>
             scripts/simplebench/bench-example.py | 2 +-<br>
             1 file changed, 1 insertion(+), 1 deletion(-)<br>
            <br>
            diff --git a/scripts/simplebench/bench-example.py
            b/scripts/simplebench/bench-example.py<br>
            index 4864435f39..fc370691e0 100644<br>
            --- a/scripts/simplebench/bench-example.py<br>
            +++ b/scripts/simplebench/bench-example.py<br>
            @@ -25,7 +25,7 @@<br>
            <br>
             def bench_func(env, case):<br>
                 """ Handle one "cell" of benchmarking table. """<br>
            -    return bench_block_copy(env['qemu_binary'], env['cmd'],
            {}<br>
            +    return bench_block_copy(env['qemu_binary'], env['cmd'],
            {},<br>
                                         case['source'], case['target'])<br>
            <br>
            <br>
            -- <br>
            2.30.2<br>
          </blockquote>
          <div><br>
          </div>
          <div>Good spot. If it's not too late and not a hassle, can you
            add a fixes: commit-id in the commit message? No big deal if
            not.</div>
          <div><br>
          </div>
          <div>Reviewed-by: John Snow &lt;<a
              href="mailto:jsnow@redhat.com" moz-do-not-send="true"
              class="moz-txt-link-freetext">jsnow@redhat.com</a>&gt;<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Maybe that can be added locally to avoid a V2 patch. Here it is:<br>
    </p>
    <p>Fixes: b2fcb0c5754c2554b8406376e99a75e9e0a6b7bd</p>
    <p>Thanks,</p>
    <p>Stefan</p>
    <p><br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------jrovZAEWtLkQLvwAM1rP08GK--

