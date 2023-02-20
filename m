Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F2A69D666
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 23:40:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUEok-0004MW-GO; Mon, 20 Feb 2023 17:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hlewin@gmx.de>) id 1pUE18-00036u-La
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 16:48:14 -0500
Received: from mout.gmx.net ([212.227.15.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hlewin@gmx.de>) id 1pUE16-0007rk-KM
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 16:48:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1676929685; i=hlewin@gmx.de;
 bh=ZGETkrpIQWdb9r7V9gPUESxDjjQZZZFFhPMzkDWgfhY=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=nA/6E8R0PvYvZ+LOc9ogn3oZCsr19v0fYSheL+o/raiOeNRcjDEToQwE5mn2Nw9tC
 /YiRW6WIhSUPbmHX+7XFAfuxhcjXni9SdLObFGJwMyCxkR804y9eed3/ZpM6dGVkzI
 V8ZzCmX82ZeixeRwyBq13iFIYjQ6rAsbANRNDRBuY1O9IDmkIWlUxosmCweV/muAL+
 YcusnpZrFO6oVX/ilYHsNIQWMfRI/Qsn8/Y0ljWVu/Dj7aMogxPb9Psr5P8b3xKvue
 giIxTgH0n3ABENgz6LaDf31iMhyJ5CKFE9r6DQ9DSqgw4Lv+Muu5Lw5cEEYeMkTygr
 rTW2eE7xZ9LRA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.192.118] ([84.186.50.236]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mlw7V-1olDxt3wmp-00izJM; Mon, 20
 Feb 2023 22:35:27 +0100
Message-ID: <75f78e3d-6016-3d6b-8861-c41f514a860b@gmx.de>
Date: Mon, 20 Feb 2023 22:35:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: pixman@lists.freedesktop.org, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <4b519268-f8e8-6542-9d1b-34054879eec0@eik.bme.hu>
 <a7866129-9f7a-02d6-1e58-bf05e1bf89e4@eik.bme.hu>
 <410c3da9-9be5-a715-7b7a-48bd67355c9c@linaro.org>
 <e615e033-a3f6-083f-5f0f-eb506c3c5b4c@eik.bme.hu>
 <6af8172c-da06-848c-a9df-ebf65b41ccb6@eik.bme.hu>
From: Heiko Lewin <hlewin@gmx.de>
Subject: Re: [Pixman] pixman_blt on aarch64
In-Reply-To: <6af8172c-da06-848c-a9df-ebf65b41ccb6@eik.bme.hu>
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:+6aJ02oLWIAyl5oXVqyyxyr5XAqiXTl0x7iCafVT6jOtdRtRnzA
 B+cg6F7m81d91ARFmqkOzljIJPWWH2TlfTIiL38P2ZBN6GjiKtVxarKHOut4txvqH65qTyc
 8bIZiB2X6mhqlEPgqjWMD0/xxhK3lT73tGQ6NkW81laG92y3RVFMtE8tiZ7glu3IMwmmisn
 geBMjEEaeDm/xpQNBplLg==
UI-OutboundReport: notjunk:1;M01:P0:1uKUmJ4ftaI=;somseoCe4mfsp3IjjrhQzP+3l8a
 JUl/iibAuVEwqE34HXkyN2qDmi5WaW3sK7sCPFoJrFYQKbCknl46iFTbvxao4lvDYmXh9h7eK
 5pFI//k0guTuEuCNRZH5KI7lt7u9MDOVVMA6sQRrSyXX/5ae0FkYXEveds+VYdyS03fzC7C2M
 COB+T+Uk/qz7c9FVUemc4/aqYmsZNzr5Frgdf9tDrmoeF5wuUg6IQULSHhjDaS9VKViozTdny
 ZUt05tMSjmnuAxVX8hV8roJ0TxeNhWojSZvXVmKucZ1nwBa3OS1Eo+Q5Uikf+uxi/RBfC7iPc
 RPx6U8lRPjGzyjHOqhq0tF9v0HPSI7mGQ0TJrnek/cxiziB1AfZugKXrqPc/f9q/ytoIuVORv
 SmPDn1v/yPAnQ022oaZj38e0D+5NfAJOaeidH6oy03Kk/ja3miZbDvrR8vLYebbIclCfI0FLi
 o1J+emZCpmJthtqaMcc31SYEJoG4m8DPvcW4ACr7oG9t1HkniV5x3hqHWtHxzGKAz7tgHbOw9
 KPLZ70qpQA8OEO8CTfM6LDz9F2bNsP+8lFsRHFOWkQO+7ydgxgOimZtKG6YB/zfk60FfaCpAI
 fcFL+r+n6XMvCw/11FcLWLhiDZgjWT5HSRShI3S5F3doNgJIhyacda1dE383DDERutjps+2XO
 ysBRBPQZQZfIfTG3k9EcnKo7wDqufXlL4rzjDpom76mQ9IVB94NibPa+H/4mQIVBbkwQC7+yd
 jfplZ2k2LW5srkb/t+4LuTa21HnGj2Jef1zxpOzgKkk65UrrXzTWvoY4oG+wySb9WY8fiZlyA
 28U7+Pdxi4t02J9xFgIG5l3Y7OUNaY3Jj13Ws9snU1gBeRruJqbGJJb+ALt0lzgmXs4l8mpru
 9CpV/65OX/voQwn79QlZOhRoVKnhlG/Z6uMpjzIZqzH/60UjurSaUi3okUc41keOQ+3WaKPoU
 eqdiXQ==
Received-SPF: pass client-ip=212.227.15.15; envelope-from=hlewin@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, MIME_HTML_ONLY=0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Feb 2023 17:39:28 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    On 2/19/23 00:38, BALATON Zoltan wrote:<br>
    <blockquote type="cite"
      cite="mid:6af8172c-da06-848c-a9df-ebf65b41ccb6@eik.bme.hu">On Sun,
      5 Feb 2023, BALATON Zoltan wrote:
      <br>
      <blockquote type="cite">On Sun, 5 Feb 2023, Richard Henderson
        wrote:
        <br>
        <blockquote type="cite">On 2/4/23 06:57, BALATON Zoltan wrote:
          <br>
          <blockquote type="cite">This has just bounced, I hoped to
            still be able to post after moderation but now I'm resending
            it after subscribing to the pixman list. Meanwhile I've
            found this ticket as well:
            <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests/71">https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests/71</a>
            <br>
            See the rest of the message below. Looks like this is being
            worked on but I'm not sure how far is it from getting
            resolved. Any info on that?
            <br>
          </blockquote>
          <br>
          Please try this:
          <br>
          <br>
          <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/rth7680/pixman/-/tree/general">https://gitlab.freedesktop.org/rth7680/pixman/-/tree/general</a>
          <br>
          <br>
          It provides a pure C version for ultimate fallback.
          <br>
          Unfortunately, there are no test cases for this, nor
          documentation.
          <br>
        </blockquote>
        <br>
        Thanks, I don't have hardware to test this but maybe Akihiko or
        somebody else here cam try. Do you think pixman_fill won't have
        the same problem? It seems to have at least a fast_path
        implementation but I'm not sure how pixman selects these.
        <br>
      </blockquote>
      <br>
      We have tried the branch above and while it does make it better
      and usable in 16bit mode, 8bit is still missing (no wonder as it
      does not have that implemented but the AmigaOS driver only allows
      16bit and 8bit with the sm501 device this is used in but probably
      that's not important when 16 bit works). Even in 16bit more there
      were some graphics problems seen but that may need some more
      checking to make sure it's not some other change as the report was
      not clear if that worked before. I've asked to check the changes
      in
      <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests/71">https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests/71</a>
      next to see if that would work better.
      <br>
      <br>
      Regards,
      <br>
      BALATON Zoltan
      <br>
    </blockquote>
    <br>
    Hello!<br>
    I just wanted to say that I have just made the last few changes to
    <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests/71">https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests/71</a><br>
    that were obviously missing in that patch.<br>
    However, I have no easy way to test the lib on Apple hardware -
    neither if building the lib works with Xcode et al<br>
    nor if the resulting binaries are good. I used clang to
    cross-compile for Apple arm64 from a linux system which<br>
    seemed to work. Feel free to test the PR and report problems.<br>
    <br>
    Regards,<br>
    Heiko<br>
  </body>
</html>

