Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8F0639C60
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Nov 2022 19:32:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozMRM-0003B6-DK; Sun, 27 Nov 2022 13:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1ozMRJ-0003AZ-9g
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 13:31:41 -0500
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1ozMRG-0002OR-Uo
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 13:31:40 -0500
Received: from [172.31.1.192] (p5b0906f1.dip0.t-ipconnect.de [91.9.6.241])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id AC96CDA0EB6;
 Sun, 27 Nov 2022 19:31:36 +0100 (CET)
Content-Type: multipart/alternative;
 boundary="------------UVLig00KOlDwvpsOhAyrVWcu"
Message-ID: <6a22b163-a9f3-45f2-ebca-2959c35688bf@weilnetz.de>
Date: Sun, 27 Nov 2022 19:31:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v3 for-7.2 0/6] Add format attributes and fix format
 strings
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
References: <20221126152507.283271-1-sw@weilnetz.de>
 <CAJSP0QXaWMq=z943sLHkZtSDLSaezNQwtJaFy9A12yyh9zfSoQ@mail.gmail.com>
In-Reply-To: <CAJSP0QXaWMq=z943sLHkZtSDLSaezNQwtJaFy9A12yyh9zfSoQ@mail.gmail.com>
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.257, SPF_HELO_NONE=0.001,
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
--------------UVLig00KOlDwvpsOhAyrVWcu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 27.11.22 um 19:23 schrieb Stefan Hajnoczi:

> We need to wait for Michael to agree to maintainership in patch 5. If
> we run out of time I suggest splitting out patch 5.
>
> Reviewed-by: Stefan Hajnoczi<stefanha@redhat.com>


Citing Michael from a v2 email: "pls do".

Stefan


>     Hello Michael,
>
>     I just noticed that MAINTAINERS has no entry for the files in
>     subprojects/libvhost-user, so I did not cc you in my previous e-mails.
>     Should that directory be added to the "vhost" section"?
>
>     Stefan

    pls do

--------------UVLig00KOlDwvpsOhAyrVWcu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Am 27.11.22 um 19:23 schrieb Stefan Hajnoczi:<br>
    </p>
    <blockquote type="cite"
cite="mid:CAJSP0QXaWMq=z943sLHkZtSDLSaezNQwtJaFy9A12yyh9zfSoQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">We need to wait for Michael to agree to maintainership in patch 5. If
we run out of time I suggest splitting out patch 5.

Reviewed-by: Stefan Hajnoczi <a class="moz-txt-link-rfc2396E" href="mailto:stefanha@redhat.com">&lt;stefanha@redhat.com&gt;</a>
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Citing Michael from a v2 email: "pls do".</p>
    <p>Stefan<br>
    </p>
    <p><br>
    </p>
    <blockquote>
      <blockquote type="cite" style="color: #007cff;">
        <pre class="moz-quote-pre" wrap="">Hello Michael,

I just noticed that MAINTAINERS has no entry for the files in
subprojects/libvhost-user, so I did not cc you in my previous e-mails.
Should that directory be added to the "vhost" section"?

Stefan
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">pls do

</pre>
    </blockquote>
    <p></p>
  </body>
</html>

--------------UVLig00KOlDwvpsOhAyrVWcu--

