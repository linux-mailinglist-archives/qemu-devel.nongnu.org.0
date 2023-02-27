Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014B36A4DA5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 22:59:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWlWS-0002MZ-6M; Mon, 27 Feb 2023 16:59:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWlWM-0002M9-Hq
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:58:59 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWlWK-0001gL-N4
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:58:58 -0500
Received: by mail-wm1-x32d.google.com with SMTP id p26so5160546wmc.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 13:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ol4z7L5yMbT2efaPX9e8o0Ryrg8fL9JH89uFaAJWWGQ=;
 b=RomoAE7I3fMU+E3Or84h5biwmJoAKOSq47/06U3v+9J5kAonPuSpfcCyV8A8u/CmrN
 hERqX32Z3rXMkQFiTFlocxvcV5v4HCX8PXqX7Jqt+jLa75WNzmqhFUKuaKa/rbWKqbMa
 dj6dfdCfzh/Fm7cqxSenzRd7mpQtzEHdSVHQ9BOI4SqM+SwL+8cxwlZjG2F+uYQ1n5D5
 IaO+zpyBJHvrsNnTeW9QIxfgxjWZxYXh+sUGxz3/VW1I6aP/8K67al4ycV22zY+UNM1E
 wiV2ildjwWrov8D+JX+OSgQjIffzTxvXcajbhwMb9yxSkC6tCV2dskLzICFiVW8IKKWF
 P3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ol4z7L5yMbT2efaPX9e8o0Ryrg8fL9JH89uFaAJWWGQ=;
 b=4ejkE2n+BxW9fnl6EtqYw/rkCh3NCFnKSkA3m8KpgwxD0QykwksVPpimyvUWyaslyP
 HZDgBVbAag2mADeCmwXksizxKLjc6Z6IG2EatyCL8dQpYkGQwJITE2mSLrs20+uz3gyb
 8BC/fIouwiXmVkuUZSYdwOYegCBFyYgOUlCpH/FR+ia8iLBlVqHvys2qA4bznFNehYMO
 BHV1ixP1wfKPqRdP/ggwxpJbXfFArWdsMQ8C7/B72cAVST9G26+1XK/WUB/4XihDKf3K
 oDhzNdCPrFakUKBTAIi252MyIVwO4NYIlKtUzunBPWNAzhEG5Fn0WPPkPEOtnERFPjma
 PsuQ==
X-Gm-Message-State: AO0yUKXtJihv9MN+XeWl36xYnSYQ7hy/DxIIpLAhBzEnl4YBfwWP59e1
 Uru1j6V/sN4VclQrBM3qdpcbPg==
X-Google-Smtp-Source: AK7set+vOk6kNOc08H/xHzQeH/E4nrANq0I7qzkep+0SgKz3Ge6mktxvoN/o1jC3/gxsBuD8/nHmeA==
X-Received: by 2002:a05:600c:3b99:b0:3df:f124:f997 with SMTP id
 n25-20020a05600c3b9900b003dff124f997mr7721217wms.19.1677535134079; 
 Mon, 27 Feb 2023 13:58:54 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a1c4c17000000b003e2066a6339sm10088646wmf.5.2023.02.27.13.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 13:58:53 -0800 (PST)
Message-ID: <ab57c2b3-6300-a511-92d0-6c3b3f377977@linaro.org>
Date: Mon, 27 Feb 2023 22:58:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] hw/vfio/migration: Remove unused 'exec/ram_addr.h'
 header
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230227103258.13295-1-philmd@linaro.org>
 <20230227103258.13295-2-philmd@linaro.org>
 <20230227084621.15cab9da.alex.williamson@redhat.com>
 <CAFEAcA-Fp8nSZ6iimZH28DXGVWkFbcYv25RvVDdc8WZkBXgfrg@mail.gmail.com>
 <20230227093409.2ad3abb2.alex.williamson@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227093409.2ad3abb2.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Alex,

On 27/2/23 17:34, Alex Williamson wrote:
> On Mon, 27 Feb 2023 16:04:16 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
> 
>> On Mon, 27 Feb 2023 at 15:46, Alex Williamson
>> <alex.williamson@redhat.com> wrote:
>>>
>>> On Mon, 27 Feb 2023 11:32:57 +0100
>>> Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>   
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>
>>> Empty commit logs are a pet peeve of mine, there must be some sort of
>>> motivation for the change, something that changed to make this
>>> possible, or perhaps why this was never necessary.  Thanks,
>>
>> I generally agree, but "this file doesn't actually need to
>> include this header" seems straightforward enough that the commit
>> subject says everything you'd want to say about it.
>> The underlying reason is going to be one of:
>>   * this used to be needed, but somewhere along the line the
>>     thing the file needs moved to a different header
>>   * this used to be needed, but the code in the file changed
>>     and no longer uses the thing the header was providing
>>   * this was never needed, and the include was just cut-n-pasted
>>     from a different file when the file was originally written
>>
>> Tracking down which of those is the case for every single
>> "file is including unnecessary headers" cleanup seems like
>> a lot of work trawling through git histories and doesn't
>> really provide any interesting information.
> 
> OTOH, not providing any justification shows a lack of due diligence.
> Even a justification to the extent of "This passes gitlab CI across all
> architectures after removing the include" or copying from the cover
> letter to explain that this include is the only reason the file is
> built per target would be an improvement.
> 
> I find that empty commit logs create a barrier to entry for
> participation in a project, there is always some motivation that can
> help provide a better commit that doesn't force an undue burden on the
> submitter.  Thanks,

You are totally right and I apologize for such low quality patch.
If I want these cleanups to scale (being done by other) I certainly
need to explain why they are useful. Eventually copy/pasting the
same reasoning for class of change.
OTOH I sometime feel these cleanups are more noise than anything
to maintainers, and various end up queued via qemu-trivial@
(which isn't what I expect for trivial@).
We have a bit of both, maintainers tired by poor descriptions /
justifications, and contributors exhausted to get trivial patch
- for their perspective - merged without too much doc.

This patch you insist on is a good one-line example of a pattern
we should start cleaning: being overzealous with header included
pull so many stuff that we shoot on our foot and end in weird
corner cases, such here making an object target-dependent when
it isn't.
target-dependent objects add build complexity, and delay us from
the goal of single binary and heterogeneous emulation.

Good English explanation for non-English native speaker is not
easy as native speaker, but usually the community is opened and
bare with that barrier.

I'll reword to something work committing and referring to later,
when looking at git history.

Thanks for insisting in improving us!

Phil.

