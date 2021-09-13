Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25F8409A67
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 19:12:50 +0200 (CEST)
Received: from localhost ([::1]:37800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPpVh-0004oC-T7
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 13:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPouo-0004ez-K2
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:34:44 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:44895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPoum-0006s2-QC
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:34:42 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so408992wml.3
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5SasLEd2CvqinZmpFv3MW+DS2c9Y6CkFUI00Z8/fe/g=;
 b=jGpBIE1RDEStvn46Fcwq06kLfmA9riasEPZV0O2fUzCoC8PIKZCN9wLP4Y7uXAlGYa
 qLBViKVNTeB552O3y7MsmZDxffTO1WbVCxAyMa3+Zk2NCFjHdFpROKckLzf0JI9fxr3z
 obWCcUeN/Sh+HxEixRXFzDD1iwB7E30/RYkM0nvmc3RSo6z1sHbSopeih/xr3gDLBye5
 6HKE2n6cJvZkwxinNFklx50r0S+qQ+0b1JtbX+e5MeAXIEAJU+9AyLDphHkinBbwjCyg
 m6/frQVNtbvoUAkXMOsINeccGNNwtPFZGfQbKHC3xm5knQHf8Tp4Wcv4ZhNqLMKwMwYb
 PyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5SasLEd2CvqinZmpFv3MW+DS2c9Y6CkFUI00Z8/fe/g=;
 b=E1CSZ4ZM6YlVMyWKAI0CXey0zs+DOK5qgH6FknRZZoKKKeZpe6Cuu6VYulEv6wksGQ
 A78tsRGETW1bu1H1lhBEfJfsvjv7/4CXvTu2RExpSfwp1ZiHqsnoHbL+IdtWhTPG/NbF
 lFqkaGqELD3OThQaFUPxSpbJYl+2u+O5WbTlYcoYbhOknPxTZ8Nnv0AreTuZL9npafOu
 9Brbt2K+Fk2CZjk7WZZsBibMerbNX7F6JdG6+XUIcMplbO3je0NsIcQ4y+PSKz4WioUR
 7l+MizKXF2uWhgStYDNfSzAz87EjCBr/kNiHZo/Rmre4CAxBEXZbtuRTaYkWltbzyaXV
 y9UA==
X-Gm-Message-State: AOAM531/5h5wTSMI87RBuWxCTHBuTwIRnzClkV7IUcIG1HdHMbyt4r5D
 v93OdUnp34YTgDy8bhMp81w=
X-Google-Smtp-Source: ABdhPJz5AhGKFY43/A4bC4OO5LIIR7f9BvMlueNmbL6Qaa+WVUVNO/DmInZDURkvcb27NHFmC368ZQ==
X-Received: by 2002:a7b:cb0c:: with SMTP id u12mr11929839wmj.70.1631550879332; 
 Mon, 13 Sep 2021 09:34:39 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id u8sm7809763wmq.45.2021.09.13.09.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 09:34:38 -0700 (PDT)
Subject: Re: [PATCH v2] docs: add supported host CPU architectures section
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210913130950.214756-1-marcandre.lureau@redhat.com>
 <CAFEAcA97pX7qHLXkGL23_ygFk2hcJEw2J7CSKDJukdbxpvgKpg@mail.gmail.com>
 <f2a05978-430e-1964-7d1e-c32b4babd0bc@amsat.org>
 <CAFEAcA_DwJJU=He9ZMCxOYC001Z+cBxsR1njChnzd1eZCtdO3Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <110706e4-8208-3906-a4b7-9d6f1252496f@amsat.org>
Date: Mon, 13 Sep 2021 18:34:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_DwJJU=He9ZMCxOYC001Z+cBxsR1njChnzd1eZCtdO3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/13/21 5:56 PM, Peter Maydell wrote:
> On Mon, 13 Sept 2021 at 16:22, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> On 9/13/21 3:50 PM, Peter Maydell wrote:
>>> On Mon, 13 Sept 2021 at 14:10, <marcandre.lureau@redhat.com> wrote:
>>> I still wonder if this would be clearer if we listed 'tcg' as
>>> an accelerator like all the others, rather than describing it as
>>> a kind of special case in the text above the table. After all, you
>>> can select it with '-accel tcg' the same as any other.
>>>
>>> I think the information in the table is correct now.
>>
>> What is TCI at this point?
> 
> It's a different backend to TCG. (Almost always you do not want it.)

It might become a TCG sub-type.

> It's not a separate accelerator type.

Indeed.

>>>> +Other architectures are not actively maintained. They may be removed in future
>>>> +releases.
>>
>> What are the other archs which could be removed?
> 
> It's not so much that we have explicit code to handle any other host
> architectures which we might remove. It's more that we do not specifically
> say "we don't know what this host arch is and we don't have a TCG backend
> for it, sorry" for unknown host architectures; instead we suggest that
> the user might try using TCI.
> 
> In future in theory we might:
>  * just say "unsupported" there instead (making unknown
>    host CPU arch a fatal error, in the same way unknown host OS
>    is a fatal error)
>  * drop TCI entirely
> 
> I think both of those would be controversial (but I'm not against
> them myself ;-)).

So we had this discussion 5/6 months ago, and 2 users said they use
it for research, so Richard did a tremendous work to update it to
remove any limitation on TCG, which mostly ended in a rewrite:

$ for i in tcg/tci*;do git blame $i;done|cut -c25-47|sort|uniq -c|sort -nr
   1106 Richard Henderson
    274 Stefan Weil
      6 Daniele Buono
      4 Pranith Kumar
      4 Emilio G. Cota
      2 Paolo Bonzini
      2 Aurelien Jarno
      1 Philippe Mathieu-Daudé
      1 Peter Maydell

Then it took me various week-ends to review/test it. At this point
I consider it stable and removing it isn't justified anymore.

> We could perhaps rephrase the sentence to something like:
> 
>   Other host architectures are not supported. It is possible to
>   build QEMU on an unsupported host architecture using the configure
>   ``--enable-tcg-interpreter`` option to enable the experimental
>   TCI support, but note that this is very slow and is not recommended.

Sounds good.

> If we want to actually deprecate building on non-supported host
> architectures we should say that via the usual deprecation process.

Agreed.

Regards,

Phil.

