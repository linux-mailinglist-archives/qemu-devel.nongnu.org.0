Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C12869A9BB
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 12:07:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSyYt-0007rV-FW; Fri, 17 Feb 2023 06:05:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1pSyYr-0007oC-6L
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 06:05:53 -0500
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1pSyYp-0005ut-6b
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 06:05:52 -0500
Received: from [192.168.178.59] (p5b151831.dip0.t-ipconnect.de [91.21.24.49])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 4CFABDA075E;
 Fri, 17 Feb 2023 12:05:47 +0100 (CET)
Content-Type: multipart/alternative;
 boundary="------------XAG0vJCsF8SWCU14gq219SmB"
Message-ID: <39bc9b17-e6f2-ed1b-0d6d-31bbb98842cf@weilnetz.de>
Date: Fri, 17 Feb 2023 12:05:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, libvir-list@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>,
 Brad Smith <brad@comstyle.com>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <87a61cbmti.fsf@pond.sub.org> <Y+9bSHshiNnek31J@redhat.com>
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
In-Reply-To: <Y+9bSHshiNnek31J@redhat.com>
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.351, SPF_HELO_NONE=0.001,
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
--------------XAG0vJCsF8SWCU14gq219SmB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On Fri, Feb 17, 2023 at 11:36:41AM +0100, Markus Armbruster wrote:

> Which 32-bit hosts are still useful, and why?


Citing my previous mail:

    I now checked all downloads of the latests installers since 2022-12-30.

    qemu-w32-setup-20221230.exe – 509 different IP addresses
    qemu-w64-setup-20221230.exe - 5471 different IP addresses

    339 unique IP addresses are common for 32- and 64-bit, either
    crawlers or people who simply got both variants. So there remain 170
    IP addresses which only downloaded the 32-bit variant in the last week.

    I see 437 different strings for the browser type, but surprisingly
    none of them looks like a crawler.

So there still seems to be a certain small need for QEMU installers for 
32-bit Windows: 170 users für 32 bit only, 339 users for both 32 and 64 
bit, 5132 users for 64 bit only.

Stefan

--------------XAG0vJCsF8SWCU14gq219SmB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>On Fri, Feb 17, 2023 at 11:36:41AM +0100, Markus Armbruster
      wrote:
    </p>
    <blockquote type="cite" cite="mid:Y+9bSHshiNnek31J@redhat.com">
      <pre class="moz-quote-pre" wrap="">Which 32-bit hosts are still useful, and why?
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Citing my previous mail:</p>
    <blockquote>
      <p>I now checked all downloads of the latests installers since
        2022-12-30.
        <br>
        <br>
        qemu-w32-setup-20221230.exe – 509 different IP addresses
        <br>
        qemu-w64-setup-20221230.exe - 5471 different IP addresses
        <br>
        <br>
        339 unique IP addresses are common for 32- and 64-bit, either
        crawlers or people who simply got both variants. So there remain
        170 IP addresses which only downloaded the 32-bit variant in the
        last week.
        <br>
        <br>
        I see 437 different strings for the browser type, but
        surprisingly none of them looks like a crawler. </p>
    </blockquote>
    <p>So there still seems to be a certain small need for QEMU
      installers for 32-bit Windows: 170 users für 32 bit only, 339
      users for both 32 and 64 bit, 5132 users for 64 bit only.<br>
    </p>
    <p>Stefan<br>
    </p>
  </body>
</html>

--------------XAG0vJCsF8SWCU14gq219SmB--

