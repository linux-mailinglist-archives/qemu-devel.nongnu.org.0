Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D0F5A9704
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 14:39:45 +0200 (CEST)
Received: from localhost ([::1]:36332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTjU0-0005up-5W
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 08:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oTise-00044K-TG
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 08:01:31 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oTisY-0003Gh-5M
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 08:01:08 -0400
Received: by mail-wr1-x42e.google.com with SMTP id c7so15379280wrp.11
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 05:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=PK2A/I0WM6Ehx3gWK+HhqHvsG/o/nACYB8SII5Vz7uM=;
 b=oHx0E8JXduqhbi0PUWl8lwrpbC6QYUfa5NahgYCFPR+UR85vhBRfZTOjWA7/zBTGtL
 X72M6Rd+JO6Lex7KFJdrpIEe2mYTI/YgY0zYHvSNJw90LtY6cVNohaaqFPJrr2RfL2HF
 8+YKsIi2D00T76tiTfUPSzPPkmc6KECij37LccSILwGfJ1qYNIxJ+bgWo7B3kWuiLpkP
 GTL0orrD95i6auazu3TQkNeruWdoOuivz75HtwPqxJnu8u/Ssx0EKHJ9zBGiKfpZpMqp
 v6kJAYeAoKRzfajB3opLs1rnf/d6m2dtLFaVQdkOZIocmXqJD2NGH1K9+G5tERAqTg81
 Ywjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=PK2A/I0WM6Ehx3gWK+HhqHvsG/o/nACYB8SII5Vz7uM=;
 b=tBADVnu/cRDC8lEJBiCJFVJOYCDfO0/LGWv5VPi/zd/IQwCfWI0S1BVC2FCkWRj53X
 jfXdqPI+6yrKN8zaMb/ARBKXVVhNVlCKMKjOTk6FiBymTFsC98oSmX0yEJ7xGC5OWvGX
 Nb7VZiJ8N+lcoYYW/+5v+Q0lFAQIz34Xqv46YPcRJGWCcj3NoWhLEOlBdWGWZc/6wRv7
 Q6TF11x4f6TgOgealc8GvlqoJJv7kZVA5nOfRNpskexIJOtiaNi3nHT/5kkYflHXrApt
 uzPT96yWnWAAB0lmTfCSZlu1u2SnO+kf7bM2r94eHiNTzGwxLP3mEBnr8KbJVruI2Z/F
 9pZw==
X-Gm-Message-State: ACgBeo0gZPIXnhyxdIzFoahvuPn2Xx1OCzYfpnLd+chamvkpKwD1qKTA
 td+Xk0KWvncI57rTkRB03dQuVA==
X-Google-Smtp-Source: AA6agR4o9/Uxdjs2ZwEPeqwefCbGZHsv5TwIcQHtsX0ReOeWwoF2keR1ZPIU1xvJlUc0Fh5BEfk/bg==
X-Received: by 2002:adf:fbd2:0:b0:21e:7f74:5df1 with SMTP id
 d18-20020adffbd2000000b0021e7f745df1mr14475828wrs.43.1662033660627; 
 Thu, 01 Sep 2022 05:01:00 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a056000124600b002258956f373sm14313450wrx.95.2022.09.01.05.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 05:00:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8603E1FFB7;
 Thu,  1 Sep 2022 13:00:59 +0100 (BST)
References: <1443720628-16512-1-git-send-email-marcandre.lureau@redhat.com>
 <9cb1a173-c703-1787-90e1-4668710b323b@intel.com>
 <Yw8gpOzspxrcE8rE@redhat.com>
 <6f4292c6-5f85-f3c7-7b65-e5a59dd71dbc@intel.com>
 <Yw86WjTzwNcALfVJ@redhat.com>
 <d865b7f4-b3bc-9f24-a697-6ff830637133@intel.com>
 <YxBpgeL7yJIkXV/f@redhat.com>
 <2304fd90-b77a-f0ba-8979-61ac37b389b2@intel.com>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Wang, Lei" <lei4.wang@intel.com>
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [RFC PATCH] Add qemu .clang-format
Date: Thu, 01 Sep 2022 12:55:36 +0100
In-reply-to: <2304fd90-b77a-f0ba-8979-61ac37b389b2@intel.com>
Message-ID: <87bkrznw1w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


"Wang, Lei" <lei4.wang@intel.com> writes:

> On 9/1/2022 4:12 PM, Daniel P. Berrang=C3=A9 wrote:
>> On Thu, Sep 01, 2022 at 09:08:33AM +0800, Wang, Lei wrote:
>>> On 8/31/2022 6:39 PM, Daniel P. Berrang=C3=A9 wrote:
>>>> On Wed, Aug 31, 2022 at 05:18:34PM +0800, Wang, Lei wrote:
>>>>>
>>>>>
>>>>> On 8/31/2022 4:49 PM, Daniel P. Berrang=C3=A9 wrote:
>>>>>> On Wed, Aug 31, 2022 at 02:23:51PM +0800, Wang, Lei wrote:
>>>>>>>
>>>>>>> On 10/2/2015 1:30 AM, marcandre.lureau@redhat.com wrote:
>>>>>>>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>>>>>>>
>>>>>>>> clang-format is awesome to reflow your code according to qemu codi=
ng
>>>>>>>> style in an editor (in the region you modify).
>>>>>>>>
>>>>>>>> (note: clang-tidy should be able to add missing braces around
>>>>>>>> statements, but I haven't tried it, it's quite recent)
>>>>>>>>
>>>>>>>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>>>>>>> ---
>>>>>>>>     .clang-format | 6 ++++++
>>>>>>>>     1 file changed, 6 insertions(+)
>>>>>>>>     create mode 100644 .clang-format
>>>>>>>>
>>>>>>>> diff --git a/.clang-format b/.clang-format
>>>>>>>> new file mode 100644
>>>>>>>> index 0000000..6422547
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/.clang-format
>>>>>>>> @@ -0,0 +1,6 @@
>>>>>>>> +BasedOnStyle: LLVM
>>>>>>>> +IndentWidth: 4
>>>>>>>> +UseTab: Never
>>>>>>>> +BreakBeforeBraces: Linux
>>>>>>>> +AllowShortIfStatementsOnASingleLine: false
>>>>>>>> +IndentCaseLabels: false
>>>>>>>
>>>>>>> Hi, any progress on this? I also found a gist on GitHub which can b=
e a
>>>>>>> reference: https://gist.github.com/elmarco/aa5e0b23567f46fb7f0e73cd=
e586a0c1
>>>>>>
>>>>>> clang-format is a great tool and I'd highly recommend its use on
>>>>>> any newly started projects, and even retrospectively on existing
>>>>>> projects which are small scale. Adding it to large existing projects
>>>>>> is problematic though.
>>>>>>
>>>>>> None of the QEMU code complies with it today and indeed there is
>>>>>> quite a bit of style variance across different parts of QEMU. If
>>>>>> we add this config file, and someone makes a 1 line change in a
>>>>>> file, clang-format will reformat the entire file contents.
>>>>>>
>>>>>> The only practical way to introduce use of clang-format would be
>>>>>> to do a bulk reformat of the entire codebase. That is something
>>>>>> that is quite disruptive to both people with patches they're
>>>>>> working on but not submitted yet, as well as people wanting to
>>>>>> cherry-pick new commits back to old code branches.
>>>>>>
>>>>>> With regards,
>>>>>> Daniel
>>>>>
>>>>> I think the benefits of introducing clang-format mainly for its abili=
ty to
>>>>> format a code range, which means for any future contributions, we cou=
ld
>>>>> encourage a range format before the patch is generated. This can exte=
nsively
>>>>> simplify my workflow, especially because I use the Neovim + LSP combi=
nation,
>>>>> which supports a built-in function "lua vim.lsp.buf.range_formatting(=
)".
>>>>
>>>> IMHO partial format conversions are even worse than full conversions,
>>>> because they would make code inconsistent within the scope of a file.
>>>
>>> So you mean when we're adding new code in an old file, the coding style
>>> should also be the old one? That sounds a bit unreasonable. I thought w=
e are
>>> shifting the coding style in an on-demand way, so we can finally achiev=
e to
>>> the new style mildly, if each time we're using the old coding style, th=
at
>>> could be impossible.
>>=20
>> From my POV as a maintainer, the best situation would be consistency acr=
oss
>> the entire codebase. Since we likely won't get that though, then next be=
st
>> is consistency across the subsystem directory, and next best is consiste=
ncy
>> across the whole file.  Mixing code styles within a file is the worst IM=
HO.
>>=20
>>>
>>>>> I have no interest in reformatting the existing code and also think u=
sing it
>>>>> to reformat an entire file shouldn't be encouraged, but, we can lever=
age
>>>>> this tool to give future contributions a better experience. It's also
>>>>> important to note that the kernel already has a ".clang-format" file,=
 so I
>>>>> think we can give it a try:)
>>>>
>>>> The mere action of introducing a .clang-format file in the root of the
>>>> repository will cause some contributors' editors to automatically
>>>> reformat files every time they are saved. IOW even if you don't want
>>>> intend to do reformatting, that will be a net result.
>>>
>>> I think that depends on developer's configuration, as far as I know, fo=
rmat
>>> on save is a feature which can be easily disabled on most of the IDE's,=
 such
>>> as VSCode.
>>=20
>> You could disable it, but it requires each developer to know that we're
>> shipping a clang-format that should not in fact be used to reformat
>> code, which is rather counterintuitive.=20
>>=20
>> With regards,
>> Daniel
>
> OK, your POV makes sense too. I think we can do a tradeoff, for an exampl=
e, we
> can add an officially suggested ".clang-format" file in the documentation=
, so it
> won't confuse the developers who have no interest in the clang stuffs, an=
d it
> will also be more convenient for the developers who don't want to check t=
he
> coding style manually each time before they're submitting a patch.

For most editors we already have a .editorconfig but it looks like there
is no integration for clang-format there. We could put a file in
contrib/style/ for an explicit call:

  clang-format -style=3Dcontrib/style/clang.format

I suspect we should move the .dir-locals there to given Emacs users
should be able to use the .editorconfig and it reduces duplication.

And of course mention the location of these style linters in
docs/devel/style.rst

>
> BR,
> Lei


--=20
Alex Benn=C3=A9e

