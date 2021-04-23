Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7C1369CF6
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:02:15 +0200 (CEST)
Received: from localhost ([::1]:43148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la4oQ-0007PY-4U
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4mn-0006r8-DJ
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:00:33 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:34677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4ml-0002O5-EK
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:00:33 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 em21-20020a17090b0155b029014e204a81e6so5173018pjb.1
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4aCPqk7fk56WVADi/P6TsE2sP6ipIiv8Cr+EQmuMuUU=;
 b=pP7oeGuwJOAyIKJKMO+osC0WCkwPyum3cE7FjKkNJN7Xamt8Od0B1OQeujbjkWnOFs
 CrWXWEIt0uN2d6lV+ufl7ZW052IBH2NfBZ9VMdjmPhg40tISA4+Ufb9PxufFrp6tRbZO
 JZLSJA4PPId4/FaCLkKTpttXpIbWY8bChDMuC47nLhIrTggQwQKSfvh/LViYcExRqFg9
 bpkuuO3qOi3p7PX4e7rOK6oOPcqbeUa5BdD2+ZPeVEfVtk+jDwIwfXvFTxWorR69YaT0
 9/juAQsYgDL2Ra6aZjR5GN9ZaCk0QDRsAAoc+5r1CE2eU75unYOiZoLra/u96Au27O4i
 nCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4aCPqk7fk56WVADi/P6TsE2sP6ipIiv8Cr+EQmuMuUU=;
 b=UJurmagIoKHSXrZyix5sDun2kk5xK64X8L7V/UmCoVjZlXBw1qcZyIDo3r9C4/m/6v
 Apy/b7ZC2cW+bGx+Yf71lHFXsoA5Zx+qFFVgL5NbivP+QWJ7hgauUDTV36/Tz377uwUu
 EagJGbGgm2SxCYjXL5XmEQUFw+l/txQ23eNX7WkQa2Vkv5WKVSHws3f22hK+GT3tmzP/
 LS59K5bCp3b/B8pEiXVDv9EsRHSx63Ym4rZaSRyVOG1Y6gsrZQh7jyQJmr4M7DfGOTEy
 07wFx2V+OqQRPWYULFltkwaiJsUSOqcJbKPTp7CbhEdHwwLgerKLH+7JNoRFDqoUaDlZ
 lBrw==
X-Gm-Message-State: AOAM531VyV1hNHeT92uuFC10wgJ3mW4WCfS0imR4S578vfhJctxXCmA2
 PsxhN0thZelLnEIvvgs+Vptz1tb4XbzBcA==
X-Google-Smtp-Source: ABdhPJyWFmo9U3j3/B2JmURrpTzAHPVirhSG845ug35lR0wOEJFiBqghKULcya9dvwFYjtL+udn7bg==
X-Received: by 2002:a17:90a:4a8e:: with SMTP id
 f14mr7145087pjh.20.1619218830002; 
 Fri, 23 Apr 2021 16:00:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k21sm5362858pff.214.2021.04.23.16.00.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 16:00:29 -0700 (PDT)
Subject: Re: [PULL 11/24] bsd-user: style tweak: if 0 -> ifdef notyet for code
 needed in future
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
References: <20210423203959.78275-1-imp@bsdimp.com>
 <20210423203959.78275-2-imp@bsdimp.com>
 <2e4fb308-07c3-c998-89b2-f49b69e90092@amsat.org>
 <CANCZdfr5z4hASiHWqxJG4A+6V_TTEo6ETanHGNkpm9q_fX3SVg@mail.gmail.com>
 <4332e51b-323d-ad82-4122-686f9929842d@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b8411b57-ef13-6ccd-8d55-e5cd34c30ea9@linaro.org>
Date: Fri, 23 Apr 2021 16:00:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <4332e51b-323d-ad82-4122-686f9929842d@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alex Richardson <arichardson@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 3:08 PM, Philippe Mathieu-Daudé wrote:
> On 4/23/21 11:38 PM, Warner Losh wrote:
>> On Fri, Apr 23, 2021 at 3:23 PM Philippe Mathieu-Daudé <f4bug@amsat.org
>> <mailto:f4bug@amsat.org>> wrote:
>>
>>      On 4/23/21 10:39 PM, imp@bsdimp.com <mailto:imp@bsdimp.com> wrote:
>>      > From: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
>>      >
>>      > Signed-off-by: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
>>      > ---
>>      >  bsd-user/elfload.c | 4 ++--
>>      >  1 file changed, 2 insertions(+), 2 deletions(-)
>>      >
>>      > diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
>>      > index 87154283ef..07a00ddbd5 100644
>>      > --- a/bsd-user/elfload.c
>>      > +++ b/bsd-user/elfload.c
>>      > @@ -1270,7 +1270,7 @@ int load_elf_binary(struct linux_binprm
>>      *bprm, struct target_pt_regs *regs,
>>      >                ibcs2_interpreter = 1;
>>      >              }
>>      >
>>      > -#if 0
>>      > +#ifdef notyet
>>
>>      Better describe in the cover letter "ignored checkpatch errors" and keep
>>      this unmodified rather than trying to bypass them by dubious code style
>>      IMO. The checkpatch.pl <http://checkpatch.pl> script is here to help
>>      us ;)
>>
>>
>> This one I honestly was unsure about. To be honest, it's fear that kept
>> me keeping this code....  Maybe it would be even better to just delete
>> this code entirely. I have a working final state to pull from, now that I
>> think about it to forumlate a reply, so maybe that would be even
>> better?
> 
> Personally I find it simpler. We use git, so we have the history in
> the repository, can look at it and restore it if needed. This code
> is dead since years.
> 
> Let's see what others think about this.

Definitely better to remove.  We can review the new code more easily that way.


r~

