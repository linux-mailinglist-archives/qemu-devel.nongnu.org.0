Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B4F43D13F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:53:45 +0200 (CEST)
Received: from localhost ([::1]:51412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfo3V-000330-0S
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfnv0-0003NX-Lg
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:44:59 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:34460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfnuy-0000S2-Ak
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:44:58 -0400
Received: by mail-pg1-x529.google.com with SMTP id h193so3853712pgc.1
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6iPwL28h1aV3uxwnv76urBZsbwWSp1koLPpfJd46/GA=;
 b=ly4M33WAyFgeg1h4X3UkZ6RdfykPZNYbqfX4WfSf8WtQn7Sboi6FM6jw4voHPqTI8P
 XM80yDrxFSj0Y3bnC1ITuEYmxCPhBGQDFdA2EOuaoXE5ILtR5XdNpZBOo8h0n4vr92Cv
 bUGsFxTskMqFBUSkyT/KHvwG4BJxAYkn6TjC7j+q8hy4drxz/QYuW42JfEpDGb9YJsCM
 i0i4lALZKCcq3lREzfgWNFKEcU7KyyuWHBe4FzdUQd8WLkiYKFtH6zud/RIRuTc5wGYb
 jbPEekCslOJbDQ+3iqissswrbMv9mQjaVCoiM7WZ1/nmPMjPQsV4gKmTh5N+WKYht/Rv
 ggMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6iPwL28h1aV3uxwnv76urBZsbwWSp1koLPpfJd46/GA=;
 b=GTeSmM+LEOIcMWY06A5HkZQM568aWN5ikgg4GNLsBwd4kpb3X8OA0BU412xo7+h2Fq
 nCNjPdGw3v8/gHr8zpSYncXPWFnSdGDR15/dJwrDddmC3hMBlOmqtwlnbaWG5yaV3huh
 EmIZWyQZY+NWWXyfHAowASQ+9cV8ewYsTvBLt+ol1gEBkDrfeOyV9h7SiHvaxDCUfF5m
 KuZID6WPP+i8kO155h/kGpDR8+Qh/NhZB/cllx23xuzDZ4aBkxyA6ZsOyIGq0J2vJMa6
 ukCeqnVIw6JMZJXy6WBydWYjZqVbJpLaovcsOBJVkpTc2LOqlGfbQ++S73dWOzHP5uEk
 W5wQ==
X-Gm-Message-State: AOAM531dvZq+H4cUn9JCHi2AhHoNFJmdORaAa3BsH1Or+kjoQpfUC4iC
 k7j1USmmGoCdKNN4btOCR8Sw0g==
X-Google-Smtp-Source: ABdhPJz0FnKI1y/ZsJjx8CBE7gzaMFO3sOpOgbGLXwvP01hv4xyEpXA9bFaY7+CGFBlxWhRhEbWkFQ==
X-Received: by 2002:a63:a804:: with SMTP id o4mr25023206pgf.309.1635360294525; 
 Wed, 27 Oct 2021 11:44:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q13sm737197pfj.26.2021.10.27.11.44.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 11:44:54 -0700 (PDT)
Subject: Re: [PULL 0/8] 9p queue 2021-10-27
To: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <cover.1635340713.git.qemu_oss@crudebyte.com>
 <2647527.eb0YlLX8Cn@silver> <36b93ef0-bcff-1be6-ce8d-03cd61f0a0fd@redhat.com>
 <13405882.ftTnZbQXCH@silver>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0550cde6-3284-92c0-94bb-e9e66553104f@linaro.org>
Date: Wed, 27 Oct 2021 11:44:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <13405882.ftTnZbQXCH@silver>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 10:29 AM, Christian Schoenebeck wrote:
> On Mittwoch, 27. Oktober 2021 18:48:10 CEST Philippe Mathieu-Daudé wrote:
>> On 10/27/21 18:21, Christian Schoenebeck wrote:
>>> On Mittwoch, 27. Oktober 2021 17:36:03 CEST Philippe Mathieu-Daudé wrote:
>>>> Hi Christian,
>>>>
>>>> On 10/27/21 16:05, Christian Schoenebeck wrote:
>>>>> On Mittwoch, 27. Oktober 2021 15:18:33 CEST Christian Schoenebeck wrote:
>>>>>> The following changes since commit
>>>
>>> 931ce30859176f0f7daac6bac255dae5eb21284e:
>>>>>>    Merge remote-tracking branch
>>>>>>    'remotes/dagrh/tags/pull-virtiofs-20211026'
>>>>>>
>>>>>> into staging (2021-10-26 07:38:41 -0700)
>>>>>>
>>>>>> are available in the Git repository at:
>>>>>>    https://github.com/cschoenebeck/qemu.git tags/pull-9p-20211027
>>>>>>
>>>>>> for you to fetch changes up to
> 7e985780aaab93d2c5be9b62d8d386568dfb071e:
>>>>>>    9pfs: use P9Array in v9fs_walk() (2021-10-27 14:45:22 +0200)
>>>>>>
>>>>>> ----------------------------------------------------------------
>>>>>> 9pfs: performance fix and cleanup
>>>>>>
>>>>>> * First patch fixes suboptimal I/O performance on guest due to
>>>>>> previously
>>>>>>
>>>>>>    incorrect block size being transmitted to 9p client.
>>>>>>
>>>>>> * Subsequent patches are cleanup ones intended to reduce code
>>>>>> complexity.
>>>>>>
>>>>>> ----------------------------------------------------------------
>>>>>>
>>>>>> Christian Schoenebeck (8):
>>>>>>        9pfs: fix wrong I/O block size in Rgetattr
>>>>>>        9pfs: deduplicate iounit code
>>>>>>        9pfs: simplify blksize_to_iounit()
>>>>>>        9pfs: introduce P9Array
>>>>>>        fsdev/p9array.h: check scalar type in P9ARRAY_NEW()
>>>>>>        9pfs: make V9fsString usable via P9Array API
>>>>>>        9pfs: make V9fsPath usable via P9Array API
>>>>>>        9pfs: use P9Array in v9fs_walk()
>>>>>>   
>>>>>>   fsdev/9p-marshal.c |   2 +
>>>>>>   fsdev/9p-marshal.h |   3 +
>>>>>>   fsdev/file-op-9p.h |   2 +
>>>>>>   fsdev/p9array.h    | 160
>>>>>>
>>>>>> +++++++++++++++++++++++++++++++++++++++++++++++++++++ hw/9pfs/9p.c
>>>>>>
>>>>>> 70 +++++++++++++----------
>>>>>>
>>>>>>   5 files changed, 208 insertions(+), 29 deletions(-)
>>>>>>   create mode 100644 fsdev/p9array.h
>>>>>
>>>>> Regarding last 5 patches: Daniel raised a concern that not using
>>>>> g_autoptr
>>>>> would deviate from current QEMU coding patterns:
>>>>> https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg00081.html
>>>>>
>>>>> Unfortunately I saw no way to address his concern without adding
>>>>> unnecessary code complexity, so I decided to make this a 9p local type
>>>>> (QArray -> P9Array) for now, which can easily be replaced in future
>>>>> (e.g.
>>>>> when there will be something appropriate on glib side).
>>>>
>>>> Hmm various patches aren't reviewed yet... In particular
>>>> patch #5 has a Suggested-by tag without Reviewed-by, this
>>>> looks odd.
>>>>
>>>> See https://wiki.qemu.org/Contribute/SubmitAPullRequest:
>>>>    Don't send pull requests for code that hasn't passed review.
>>>>    A pull request says these patches are ready to go into QEMU now,
>>>>    so they must have passed the standard code review processes. In
>>>>    particular if you've corrected issues in one round of code review,
>>>>    you need to send your fixed patch series as normal to the list;
>>>>    you can't put it in a pull request until it's gone through.
>>>>    (Extremely trivial fixes may be OK to just fix in passing, but
>>>>    if in doubt err on the side of not.)
>>>
>>> There are in general exactly two persons adding their RBs to 9p patches,
>>> which is either Greg or me, and Greg made it already clear that he barely
>>> has time for anything above trivial set.
>>>
>>> So what do you suggest? You want to participate and review 9p patches?
>>
>> Well I am a bit surprised...
>>
>> $ git log --oneline \
>>      --grep='Reviewed-by: Philippe Mathieu-Daudé' -- hw/9pfs/ | wc -l
>> 18
>>
>> I also reviewed patch #3 if this pull request...
>>
>>
>> Now I see you posted this 4 times in 2 months, so indeed eventual
>> reviewers had plenty of time to look at your patches.
>>
>> Note I haven't said I'd NAck your pull request, I noticed your own
>> concern wrt Daniel comment, so I looked at the patch and realized
>> it was not reviewed, and simply said this is this is odd.
>>
>> Regards,
>>
>> Phil.
> 
> Philippe, of course I understand why this looks odd to you, and yes you
> reviewed that particular patch. But the situation on the 9p front is like this
> for >2 years now: people quickly come by to nack patches, but even after
> having addressed their concerns they barely add their RBs afterwards. That
> means I am currently forced to send out PRs without RBs once in a while.

In know the feeling -- it takes quite some prodding to get tcg patches reviewed, and I 
have also sent out PRs that are incompletely reviewed.

I see that patch 5 was something I suggested myself, which I then failed to review 
afterward.  In recompense, I have reviewed the whole patch set:

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I think the P9Array is fairly clever, and I do prefer it over glib ugliness.  I can 
imagine only C++ being an improvement over what you've created.

Rather than force you to re-create the PR, I'll simply apply this along with the S-o-b, to 
the merge object.


r~

