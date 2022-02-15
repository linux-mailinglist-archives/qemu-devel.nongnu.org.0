Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108454B7B7F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 00:58:46 +0100 (CET)
Received: from localhost ([::1]:37666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK7iW-0001Bh-68
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 18:58:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nK7hB-00080a-Gu; Tue, 15 Feb 2022 18:57:21 -0500
Received: from [2607:f8b0:4864:20::62b] (port=38577
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nK7h9-0005mp-VI; Tue, 15 Feb 2022 18:57:21 -0500
Received: by mail-pl1-x62b.google.com with SMTP id c3so647887pls.5;
 Tue, 15 Feb 2022 15:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KH0RFzrioJOBD5a9hjuJ3w98sloRqKhfXvrp3LBS3fU=;
 b=cTOEE5FapXl4KHtPhmQj8YGr+l16ICrXXARmYGACWfNEcr0rf9rYVFsX9OrNZlvjBc
 RcWJbWj+o5TUFqlsMCy7+6XC9bTpDtnv6eTpX1IuZA2az6IFzMXi6orw7be5naTmNwKU
 yG50WVf9taNwiVSqSctcWnTuso8JjAf+x6gilkO5at/cnoJ8mDYyELuwBZXLyuWA5qIr
 dOYC4sTDPYUTnF0AdXG2WZgS57F7hYb0l+FqxQ5LWWE+nLe3F4zZHD5pk8715k815jsX
 SgTahS4Psy8UGcoCL+6FeESdbz7i+/FIK92H8ZS0yYwL/yQBfvwEQoYSao/nPwS1WOxz
 iIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KH0RFzrioJOBD5a9hjuJ3w98sloRqKhfXvrp3LBS3fU=;
 b=hQ4nFOJJRcuqATX8UPMg7XivHKms6ShUHBnKbgiOD86ev7BJiRdElxoAylZufW+PgE
 mJdRA7yqiXaI8q9Hp3GktxN/eeoiFDSfOMIG3F51TpAyOkc8s0zJIGHHaKN+uR6lhbWu
 hL5jelLPJkDM+9AjbPiCQDDkOCjfjB8nzcnuKP5mobEBvwW4Obp/usWJUvxS2/ZmPsjw
 +9t5vpfuwfl6xhSCiLoyqWXM+0HXY85rBCHrJ1uZMWjfrWqcR/dzQ61k4xYhdg5lrNFD
 V/vhlq3Fh8lVMs2bjKjscWZCHY/b5pjxTRsS7YkVbER047VJd4hd99E2N5uSzjf99Vtg
 cG2w==
X-Gm-Message-State: AOAM533Kgfb8R6xZZ4yElsFMurZ1eW81bUr7Flp4+NwzfnQpaGqt9E7O
 v9O8czR9KfDV6aMCKMlF0iQBV5Oi3yY=
X-Google-Smtp-Source: ABdhPJyz3LLAmsG2JPd3nvaUcFLbwzV0RwenALfVfICsVYZaYLwK2yW41aV2PwE6ziNmT5YU9u+89A==
X-Received: by 2002:a17:90b:390d:b0:1b9:c042:3b30 with SMTP id
 ob13-20020a17090b390d00b001b9c0423b30mr7096855pjb.195.1644969437654; 
 Tue, 15 Feb 2022 15:57:17 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id k4sm10255864pff.39.2022.02.15.15.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 15:57:17 -0800 (PST)
Message-ID: <bb420d6b-02f1-b8b8-2f53-680bd765a323@amsat.org>
Date: Wed, 16 Feb 2022 00:57:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 1/4] python/utils: add enboxify() text decoration utility
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
References: <20220215220853.4179173-1-jsnow@redhat.com>
 <20220215220853.4179173-2-jsnow@redhat.com>
 <20220215225502.uuqqjkbbhqwuajn2@redhat.com>
 <CAFn=p-be7D7DW3cxti3oC60EjhgPAeXyDhHW4owcEWb_Mvf-gQ@mail.gmail.com>
In-Reply-To: <CAFn=p-be7D7DW3cxti3oC60EjhgPAeXyDhHW4owcEWb_Mvf-gQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 16/2/22 00:53, John Snow wrote:
> On Tue, Feb 15, 2022 at 5:55 PM Eric Blake <eblake@redhat.com> wrote:
>>
>> On Tue, Feb 15, 2022 at 05:08:50PM -0500, John Snow wrote:
>>>>>> print(enboxify(msg, width=72, name="commit message"))
>>> ┏━ commit message ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
>>> ┃ enboxify() takes a chunk of text and wraps it in a text art box that ┃
>>> ┃  adheres to a specified width. An optional title label may be given, ┃
>>> ┃  and any of the individual glyphs used to draw the box may be        ┃
>>
>> Why do these two lines have a leading space,
>>
>>> ┃ replaced or specified as well.                                       ┃
>>
>> but this one doesn't?  It must be an off-by-one corner case when your
>> choice of space to wrap on is exactly at the wrap column.
>>
> 
> Right, you're probably witnessing the right-pad *and* the actual space.
> 
>>> ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> ---
>>>   python/qemu/utils/__init__.py | 58 +++++++++++++++++++++++++++++++++++
>>>   1 file changed, 58 insertions(+)

>>> +    def _wrap(line: str) -> str:
>>> +        return os.linesep.join([
>>> +            wrapped_line.ljust(lwidth) + suffix
>>> +            for wrapped_line in textwrap.wrap(
>>> +                    line, width=lwidth, initial_indent=prefix,
>>> +                    subsequent_indent=prefix, replace_whitespace=False,
>>> +                    drop_whitespace=False, break_on_hyphens=False)
>>
>> Always nice when someone else has written the cool library function to
>> do all the hard work for you ;)  But this is probably where you have the off-by-one I called out above.
>>
> 
> Yeah, I just didn't want it to eat multiple spaces if they were
> present -- I wanted it to reproduce them faithfully. The tradeoff is
> some silliness near the margins.
> 
> Realistically, if I want something any better than what I've done
> here, I should find a library to do it for me instead -- but for the
> sake of highlighting some important information, this may be
> just-enough-juice.

's/^┃  /┃ /' on top ;D

