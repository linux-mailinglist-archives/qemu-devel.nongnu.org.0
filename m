Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CF64B2B32
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 18:03:10 +0100 (CET)
Received: from localhost ([::1]:52762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIZK8-0005TC-RN
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 12:03:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nIZ6X-0002Jk-Ue
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:49:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nIZ6S-0004He-R3
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:49:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644598139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VkQLCZ5H5/3YD91VBnLTGV4H/fHwKvDXxm9WrM+SAVA=;
 b=J2Y3CJarb1m7BRjBWUk7uuMyx5jCV8q8pk29KUvd7pyXg0qiuCXRn92df7Z7/ue8PQKbPL
 q6F6uIE9dbjMxs6PujAKFqIio0LPAM3IqrbUgfM2oEDiVv7yQ+EHTPvuTTFDPQG28lZfUz
 JRANyYdYuW8iizMtClSf3h7TAvrB59k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-pJSIzTBKMeqmmJQUHQLwJw-1; Fri, 11 Feb 2022 11:48:58 -0500
X-MC-Unique: pJSIzTBKMeqmmJQUHQLwJw-1
Received: by mail-wr1-f71.google.com with SMTP id
 y10-20020adfc7ca000000b001e30ed3a496so4059533wrg.15
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:48:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VkQLCZ5H5/3YD91VBnLTGV4H/fHwKvDXxm9WrM+SAVA=;
 b=yROavCkO35Pm+FesNRycktLadZekJSIkQlVnbTKnAOfPrM8zo3fVSVj/OYqqRMZwUN
 ng5t7/dl90LAeT6DrXwfHK+pV73ypqEMSVHbxMeCZ5Lv7PuutyOWVpcoX+kQkD0Y4Qj4
 RqXCL6YpcpPNjuxivbBuSQoGktVpSfGfGYJa7gKOOF1dStZMkWGVknUONbtRZqhoBskZ
 Dr/4yYI/jzluuEEbW/h8K1/n/RkJm3OP8ZNSiI894MXahli5ZNZMpOUWFFXhSak1C9oU
 dVEd1C5wR00KO7vLeF+vTIHRtFwYqFR4SDR3RM6KmoumzCvt3PFX7A1tqPPd1JbWL9iW
 j+fw==
X-Gm-Message-State: AOAM530FQdxHvYQg/2czYpqSunfNWnWy9OFzSFVvTiTnL8wc2oRLqmw3
 MMe1JCsS5OazpL6chuFKml+ggqVTQClazBYHYA1jjcqdLyLRs6xRL1ke4TcTDnby8fMFtZQShHC
 CRlqpLdxL22IrfW4=
X-Received: by 2002:a7b:c856:: with SMTP id c22mr1037339wml.52.1644598137424; 
 Fri, 11 Feb 2022 08:48:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwncCPE48XSt5o2/7ovrdxtbJisGUxwGLlmu5qdUKTg4T9qjMxOQaI+NTJlxHgVVJAYarZyxw==
X-Received: by 2002:a7b:c856:: with SMTP id c22mr1037316wml.52.1644598137100; 
 Fri, 11 Feb 2022 08:48:57 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id c8sm5517819wmq.34.2022.02.11.08.48.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 08:48:56 -0800 (PST)
Message-ID: <e5d38a7d-93a2-beb9-c621-838c8ed43231@redhat.com>
Date: Fri, 11 Feb 2022 17:48:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/6] tests/qemu-iotests: Improve the check for GNU sed
To: Eric Blake <eblake@redhat.com>
References: <20220208101311.1511083-1-thuth@redhat.com>
 <20220208101311.1511083-2-thuth@redhat.com>
 <8332fa43-9e77-34f3-c012-062342d62c92@redhat.com>
 <dd7f32dd-807c-d389-1f19-323141178bba@redhat.com>
 <1d5f544a-8362-6932-2f2a-6fd5f8e53978@redhat.com>
 <10264836-2ca6-c134-5eb9-018ef618edc1@redhat.com>
 <4cc4a814-3dba-11ab-3643-76ba974476c8@amsat.org>
 <80372081-ca28-7566-9fa7-6e6820a7b37f@redhat.com>
 <20220211161410.sbxfy7tf7patm25i@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220211161410.sbxfy7tf7patm25i@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/02/2022 17.14, Eric Blake wrote:
> On Tue, Feb 08, 2022 at 03:52:19PM +0100, Thomas Huth wrote:
>>>> The current code with $SED has been introduced almost three years
>>>> ago already...
>>>>
>>>>>    Can’t we just do `alias sed=gsed`?
>>>>
>>>> Maybe ... but let's ask Philippe and Kevin first, who Signed-off
>>>> commit bde36af1ab4f476 that introduced the current way with $SED:
>>>> What's your opinion about this?
>>>
>>> This commit was to have check-block working on the OpenBSD VM image.
>>
>> Sure. The question was whether using an alias as suggested by Hanna would be
>> nicer instead of using $SED ?
> 
> Scripting with aliases becomes a nightmare to debug, since it is
> relatively uncommon.  In particular, in bash, you have to explicitly
> opt in to using aliases (contrary to POSIX sh where aliases are
> available to scripts at startup).

shopt -s expand_aliases
... as I just learnt the hard way ;-)

> Using $SED everywhere may require
> more hunting, but it is more obvious when reading a test that "oh
> yeah, I might be using extensions that the default 'sed' can't
> support" than a script that blindly uses 'sed' and depends on it
> aliasing to a more-capable sed at a distance.
> 
> The other question is how many GNU sed features are we actually
> depending on?  Which tests break if we have BSD sed or busybox sed?
> Can we rewrite those sed scripts to avoid GNU extensions?  But
> auditing for s/sed/$SED/ seems easier than auditing for which
> non-portable sed extensions we depend on.

The most obvious part are the filter functions in common.filter - we're 
using "-r" here that is not part of the POSIX sed as far as I can see.

Not sure whether anybody really wants to rewrite all sed statements for full 
portability, but maybe we could also introduce a wrapper for GNU sed like this:

if ! command -v gsed >/dev/null 2>&1; then
     if sed --version | grep -v 'not GNU sed' | grep 'GNUx sed' \
        > /dev/null 2>&1;
     then
         gsed()
         {
             sed $*
         }
     else
         gsed()
         {
             _notrun "GNU sed not available"
         }
     fi
fi

... then we could simply use "gsed" everywhere we depend on the GNU 
behavior, and the tests don't look as ugly as with the $SED ?

  Thomas


