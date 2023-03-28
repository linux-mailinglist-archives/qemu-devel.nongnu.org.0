Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B706CB72C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 08:30:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph2q7-0001kt-RX; Tue, 28 Mar 2023 02:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1ph2q5-0001kR-MR; Tue, 28 Mar 2023 02:29:49 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1ph2q2-0005UE-K9; Tue, 28 Mar 2023 02:29:48 -0400
Received: from [192.168.178.59] (p5b151831.dip0.t-ipconnect.de [91.21.24.49])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id CF763DA0BD4;
 Tue, 28 Mar 2023 08:29:43 +0200 (CEST)
Content-Type: multipart/alternative;
 boundary="------------wUpAWBENR8gbOdV9jJdrWLwN"
Message-ID: <ac4ac6ae-9147-bdb2-5adb-3322182cba4f@weilnetz.de>
Date: Tue, 28 Mar 2023 08:29:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>, Peter Wu <peter@lekensteyn.nl>,
 Julio Faracco <jcfaracco@gmail.com>
References: <20230327151349.97572-1-philmd@linaro.org>
 <cc1f75ce-0295-cc57-1a74-71e036862bb7@weilnetz.de>
 <e4a0b994-965a-2bd4-5517-b11e31b002ee@linaro.org>
 <CABgObfZ8pfrfMV0YLWo-bPyh7fCehk+NjRRnkKA15DQnqy3Mpg@mail.gmail.com>
Subject: Re: [PATCH-for-8.0] block/dmg: Ignore C99 prototype declaration
 mismatch from <lzfse.h>
In-Reply-To: <CABgObfZ8pfrfMV0YLWo-bPyh7fCehk+NjRRnkKA15DQnqy3Mpg@mail.gmail.com>
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a multi-part message in MIME format.
--------------wUpAWBENR8gbOdV9jJdrWLwN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 27.03.23 um 23:09 schrieb Paolo Bonzini:

> Il lun 27 mar 2023, 20:58 Philippe Mathieu-Daudé <philmd@linaro.org> 
> ha scritto:
>
>     > The warning can also be suppressed if the build uses `-isystem
>     > /opt/homebrew/include` instead of `-I/opt/homebrew/include` as I
>     just
>     > have tested.
>
> Is that option added by QEMU's configure or meson.build? Or is it 
> added by homebrew? The fact that /opt/homebrew/include it isn't 
> considered a system seems to be a homebrew decision.
>
>     IIUC by design meson only allows including *relative* directories,
>     and manage the system ones:
>     https://mesonbuild.com/Include-directories.html
>
> That's for includes that are part of QEMU.
>
> Meson has as_system for dependency objects 
> (https://mesonbuild.com/Reference-manual_returned_dep.html) but lzfse 
> doesn't have a .pc file, its detection has to be done by hand.
>
> Paolo
>
>     > If we can find a solution how to implement that I thing it would
>     look
>     > nicer. Technically the patch looks good.
>     >
>     > Reviewed-by: Stefan Weil <sw@weilnetz.de>
>
>     Thanks!
>

Typically I configure the build on macOS with `./configure 
--extra-cflags=-I/opt/homebrew/include 
--extra-ldflags=-L/opt/homebrew/lib --disable-werror`. With that 
configuration I get the two warnings for lzfse.h.

When I use `./configure '--extra-cflags=-isystem /opt/homebrew/include' 
--extra-ldflags=-L/opt/homebrew/lib --disable-werror` instead, I get no 
compiler warnings (and `--disable-werror` could be ommitted).

So at least for macOS with Homebrew in /opt/homebrew (M1 / M2 Macs) the 
patch is not needed when the right configure options (`--extra-cflags`) 
were used.

Stefan


--------------wUpAWBENR8gbOdV9jJdrWLwN
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Am 27.03.23 um 23:09 schrieb Paolo Bonzini:<br>
    </p>
    <blockquote type="cite"
cite="mid:CABgObfZ8pfrfMV0YLWo-bPyh7fCehk+NjRRnkKA15DQnqy3Mpg@mail.gmail.com">
      <div dir="auto">
        <div>Il lun 27 mar 2023, 20:58 Philippe Mathieu-Daudé &lt;<a
            href="mailto:philmd@linaro.org" moz-do-not-send="true"
            class="moz-txt-link-freetext">philmd@linaro.org</a>&gt; ha
          scritto:
          <div class="gmail_quote">
            <blockquote class="gmail_quote">
              &gt; The warning can also be suppressed if the build uses
              `-isystem <br>
              &gt; /opt/homebrew/include` instead of
              `-I/opt/homebrew/include` as I just <br>
              &gt; have tested.<br>
            </blockquote>
          </div>
        </div>
        <div dir="auto">Is that option added by QEMU's configure or
          meson.build? Or is it added by homebrew? The fact that
          /opt/homebrew/include it isn't considered a system seems to be
          a homebrew decision.</div>
        <div dir="auto">
          <div class="gmail_quote">
            <blockquote class="gmail_quote">
              IIUC by design meson only allows including *relative*
              directories,<br>
              and manage the system ones:<br>
              <a href="https://mesonbuild.com/Include-directories.html"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://mesonbuild.com/Include-directories.html</a></blockquote>
          </div>
        </div>
        <div dir="auto">That's for includes that are part of QEMU.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Meson has as_system for dependency objects (<a
            href="https://mesonbuild.com/Reference-manual_returned_dep.html"
            moz-do-not-send="true" class="moz-txt-link-freetext">https://mesonbuild.com/Reference-manual_returned_dep.html</a>)
          but lzfse doesn't have a .pc file, its detection has to be
          done by hand.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Paolo</div>
        <div dir="auto">
          <div class="gmail_quote">
            <blockquote class="gmail_quote">&gt; If we can find a
              solution how to implement that I thing it would look <br>
              &gt; nicer. Technically the patch looks good.<br>
              &gt; <br>
              &gt; Reviewed-by: Stefan Weil &lt;<a
                href="mailto:sw@weilnetz.de" target="_blank"
                rel="noreferrer" moz-do-not-send="true"
                class="moz-txt-link-freetext">sw@weilnetz.de</a>&gt;<br>
              <br>
              Thanks!<br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Typically I configure the build on macOS with `./configure
      --extra-cflags=-I/opt/homebrew/include
      --extra-ldflags=-L/opt/homebrew/lib --disable-werror`. With that
      configuration I get the two warnings for lzfse.h.</p>
    <p>When I use `./configure '--extra-cflags=-isystem
      /opt/homebrew/include' --extra-ldflags=-L/opt/homebrew/lib
      --disable-werror` instead, I get no compiler warnings (and
      `--disable-werror` could be ommitted).</p>
    <p>So at least for macOS with Homebrew in /opt/homebrew (M1 / M2
      Macs) the patch is not needed when the right configure options
      (`--extra-cflags`) were used.</p>
    <p>Stefan</p>
    <p><br>
    </p>
  </body>
</html>

--------------wUpAWBENR8gbOdV9jJdrWLwN--

