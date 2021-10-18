Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186B9431F6C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 16:23:32 +0200 (CEST)
Received: from localhost ([::1]:43288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcTY3-0002h9-4o
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 10:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1mcP53-0007e9-JY
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:37:17 -0400
Received: from rev.ng ([5.9.113.41]:45873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1mcP51-0007wk-Do
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:37:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:From:Reply-To:References:Cc:To:Subject:MIME-Version:
 Date:Message-ID:Content-Type:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A74e++R0hmjDHC/fIW3jHzQ0iq+g7OQQqBqa2mnRHuI=; b=bYUc29XB80UKpnrgkXvta9FyOM
 +u4/wWsu7HtAeGOhPD8GNqlsO5BCBxeKIS01anAnVeNiScj4jLZbxRSVnMonxap8jguNd5OF8vU04
 WJeny0gKLd700iZMWHdHik4b/yM5L2ARR7CJiADIxcQ+IQwxyem7UHr7nWh9F12fToxE=;
Content-Type: multipart/alternative;
 boundary="------------JxWxlde6HYOSjWv3m98qrCdX"
Message-ID: <49378670-138d-563b-9071-3fae6c95f265@rev.ng>
Date: Mon, 18 Oct 2021 11:37:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 08/12] target/hexagon: import lexer for idef-parser
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>,
 Alessandro Di Federico <ale.qemu@rev.ng>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Brian Cain <bcain@quicinc.com>, "babush@rev.ng" <babush@rev.ng>,
 "nizzo@rev.ng" <nizzo@rev.ng>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Alessandro Di Federico <ale@rev.ng>
References: <20210720123031.1101682-1-ale.qemu@rev.ng>
 <20210720123031.1101682-9-ale.qemu@rev.ng>
 <BYAPR02MB488608119AE6FE137C9ACE3ADED39@BYAPR02MB4886.namprd02.prod.outlook.com>
Organization: rev.ng
In-Reply-To: <BYAPR02MB488608119AE6FE137C9ACE3ADED39@BYAPR02MB4886.namprd02.prod.outlook.com>
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 18 Oct 2021 10:20:50 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>

This is a multi-part message in MIME format.
--------------JxWxlde6HYOSjWv3m98qrCdX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/7/21 18:08, Taylor Simpson wrote:

>> +"fNEWREG"                |
>> +"fCAST4s"                { yylval->cast.bit_width = 32;
>> +                           yylval->cast.signedness = SIGNED;
>> +                           return CAST; }
> This doesn't look right - is fNEWREG the same as fCAST4s?

We followed the definition of fNEWREG in macros.h where it is given as

   #define fNEWREG(VAL) ((uint32_t) (VAL))

>> +"fCONSTLL"               { return CONSTLL; }
>> +"fCONSTULL"              { return CONSTULL; }
> These can just be converts.

What is meant by "converts" here?

>> +"fHINTJR(RsV)"           { /* Emit no token */ }
> Put this in the list of IDENTITY above
Same as for fNEWREG. We followed the definition in macros.h as

   #define fHINTJR(TARGET) { /* Not modelled in qemu */ }

where it no-ops.

-- 
Anton Johansson,
rev.ng Srls.

--------------JxWxlde6HYOSjWv3m98qrCdX
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>On 9/7/21 18:08, Taylor Simpson wrote:<br>
    </p>
    <blockquote type="cite"
cite="mid:BYAPR02MB488608119AE6FE137C9ACE3ADED39@BYAPR02MB4886.namprd02.prod.outlook.com">
      <blockquote type="cite" style="color: #007cff;">
        <pre class="moz-quote-pre" wrap="">+"fNEWREG"                |
+"fCAST4s"                { yylval-&gt;cast.bit_width = 32;
+                           yylval-&gt;cast.signedness = SIGNED;
+                           return CAST; }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">This doesn't look right - is fNEWREG the same as fCAST4s?
</pre>
    </blockquote>
    <p>We followed the definition of fNEWREG in macros.h where it is
      given as</p>
    <p>  #define fNEWREG(VAL) ((uint32_t) (VAL))<br>
    </p>
    <blockquote type="cite">
      <blockquote type="cite" style="color: #007cff;">
        <pre class="moz-quote-pre" wrap="">+"fCONSTLL"               { return CONSTLL; }
+"fCONSTULL"              { return CONSTULL; }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">These can just be converts.
</pre>
    </blockquote>
    <p>What is meant by "converts" here?
    </p>
    <p>
      <blockquote type="cite">
        <blockquote type="cite" style="color: #007cff;">
          <pre class="moz-quote-pre" wrap="">+"fHINTJR(RsV)"           { /* Emit no token */ }
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Put this in the list of IDENTITY above
</pre>
      </blockquote>
      Same as for fNEWREG. We followed the definition in macros.h as</p>
    <p>  #define fHINTJR(TARGET) { /* Not modelled in qemu */ }<br>
    </p>
    where it no-ops.<br>
    <pre class="moz-signature" cols="72">-- 
Anton Johansson,
rev.ng Srls.</pre>
  </body>
</html>
--------------JxWxlde6HYOSjWv3m98qrCdX--


